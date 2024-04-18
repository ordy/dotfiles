#!/usr/bin/env python3
import gi
gi.require_version("Playerctl", "2.0")
from gi.repository import Playerctl, GLib
from gi.repository.Playerctl import Player
import argparse
import sys
import signal
import json
from typing import List

def signal_handler(sig, frame):
    sys.stdout.write("\n")
    sys.stdout.flush()
    # loop.quit()
    sys.exit(0)

class PlayerManager:
    def __init__(self, selected_players=[]):
        self.manager = Playerctl.PlayerManager()
        self.loop = GLib.MainLoop()
        self.manager.connect(
            "name-appeared", lambda *args: self.on_player_appeared(*args))
        self.manager.connect(
            "player-vanished", lambda *args: self.on_player_vanished(*args))

        signal.signal(signal.SIGINT, signal_handler)
        signal.signal(signal.SIGTERM, signal_handler)
        signal.signal(signal.SIGPIPE, signal.SIG_DFL)
        self.selected_players = selected_players.split(',') if selected_players else []
        self.init_players()

    def init_players(self):
        for player in self.manager.props.player_names:
            if player.name in self.selected_players:
                self.init_player(player)
            else:
                continue

    def run(self):
        self.loop.run()

    def init_player(self, player):
        player = Playerctl.Player.new_from_name(player)
        player.connect("playback-status",
                       self.on_playback_status_changed, None)
        player.connect("metadata", self.on_metadata_changed, None)
        self.manager.manage_player(player)
        self.on_metadata_changed(player, player.props.metadata)

    def get_players(self) -> List[Player]:
        return self.manager.props.players

    def write_output(self, text, title, player):
        output = {"text": text,
                  "class": "custom-" + player.props.player_name,
                  "alt": title}

        sys.stdout.write(json.dumps(output) + "\n")
        sys.stdout.flush()

    def clear_output(self):
        sys.stdout.write("\n")
        sys.stdout.flush()

    def on_playback_status_changed(self, player, status, _=None):
        self.on_metadata_changed(player, player.props.metadata)

    def get_first_playing_player(self):
        players = self.get_players()
        if len(players) > 0:
            # if any are playing, show the first one that is playing
            # reverse order, so that the most recently added ones are preferred
            for player in players[::-1]:
                if player.props.status == "Playing" and player.props.player_name in self.selected_players:
                    return player
            # if none are playing, show the first one
            return players[0]
        else:
            return None

    def show_most_important_player(self):
        # show the currently playing player
        # or else show the first paused player
        # or else show nothing
        current_player = self.get_first_playing_player()
        if current_player is not None:
            self.on_metadata_changed(current_player, current_player.props.metadata)
        else:
            self.clear_output()

    def on_metadata_changed(self, player, metadata, _=None):
        player_name = player.props.player_name
        artist = player.get_artist()
        title = player.get_title()

        track_info = ""
        track_title = ""
        if artist is not None and title is not None:
            track_info = f"{artist}"
            track_title = f" • {title}"
        else:
            track_info = title

        if track_info:
            if player.props.status != "Playing":
                track_info = "music"
                track_title = ""
        # only print output if no other player is playing
        current_playing = self.get_first_playing_player()
        if current_playing is None or current_playing.props.player_name == player.props.player_name:
            self.write_output(track_info, track_title, player)

    def on_player_appeared(self, _, player):
        if player is not None and (player.name in self.selected_players):
            self.init_player(player)

    def on_player_vanished(self, _, player):
        self.show_most_important_player()

def parse_arguments():
    parser = argparse.ArgumentParser()
    parser.add_argument("--players")
    return parser.parse_args()

def main():
    arguments = parse_arguments()
    player = PlayerManager(arguments.players)
    player.run()

if __name__ == "__main__":
    main()
