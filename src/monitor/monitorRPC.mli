(**
 * Copyright (c) 2017-present, Facebook, Inc.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 *)



type out_channel = MonitorProt.server_to_monitor_message Daemon.out_channel
type channels = (MonitorProt.monitor_to_server_message,
                 MonitorProt.server_to_monitor_message) Daemon.channel_pair

val init : channels:channels -> unit
val disable : unit -> unit

val read : timeout:float -> MonitorProt.monitor_to_server_message option

val respond_to_request :
  request_id: MonitorProt.request_id ->
  response: ServerProt.Response.response ->
  unit

val respond_to_persistent_connection :
  client_id: Persistent_connection_prot.client_id ->
  response: Persistent_connection_prot.response ->
  unit

val status_update :
  event: ServerStatus.event ->
  unit
