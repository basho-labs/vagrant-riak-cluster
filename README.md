# Vagrant Riak Cluster

This is a Vagrant project powered by Chef to bring up a local Riak cluster.
Each node can run either `Ubuntu 12.04` or `CentOS 6.5` 64-bit with `1024MB`
of RAM by default. If you want to change the operating system or tune VM
resources, you'll have to edit the `Vagrantfile` directly.

## Configuration

### Install Vagrant

Download and install Vagrant via the [Vagrant
installer](http://downloads.vagrantup.com/).

### Install Vagrant plugins

``` bash
$ vagrant plugin install vagrant-berkshelf
$ vagrant plugin install vagrant-omnibus
$ vagrant plugin install vagrant-cachier
```

## Running

### Clone project repository

``` bash
$ git clone https://github.com/basho-labs/vagrant-riak-cluster.git
$ cd vagrant-riak-cluster
```

### Launch cluster

``` bash
$ export RIAK_NODES=3
$ export RIAK_CACHE=1 # Makes use of vagrant-cachier plugin
$ vagrant up
```

### Environmental variables

- `RIAK_NODES` – The number of node you want to spin up (default: `3`)
- `RIAK_OS` – The operating system you want to use (`CENTOS` or `UBUNTU`,
  default: `CENTOS`)
- `RIAK_CACHE` – Whether you want to allow Vagrant to use the
  [vagrant-cachier](https://github.com/fgrehm/vagrant-cachier) plugin or not
  (default: `false`)

## Testing

Hit the HTTP statistics endpoint:

```bash
$ curl -s http://33.33.33.10.xip.io:8098/stats | python -mjson.tool
{
    "basho_stats_version": "1.0.3",
    "bitcask_version": "1.6.5-0-ga99f2f0",
    "cluster_info_version": "1.2.4",
    "compiler_version": "4.8.1",
    "connected_nodes": [
        "riak@33.33.33.20.xip.io",
        "riak@33.33.33.30.xip.io"
    ],
    "converge_delay_last": 53105,
    "converge_delay_max": 0,
    "converge_delay_mean": 0,
    "converge_delay_min": 0,
    "coord_redirs_total": 0,
    "cpu_avg1": 0,
    "cpu_avg15": 0,
    "cpu_avg5": 0,
    "cpu_nprocs": 316,
    "crypto_version": "2.1",
    "dropped_vnode_requests_total": 0,
    "erlang_js_version": "1.2.2",
    "erlydtl_version": "0.7.0",
    "executing_mappers": 0,
    "goldrush_version": "0.1.5",
    "gossip_received": 5,
    "handoff_timeouts": 0,
    "ignored_gossip_total": 0,
    "index_fsm_active": 0,
    "index_fsm_create": 0,
    "index_fsm_create_error": 0,
    "inets_version": "5.9",
    "kernel_version": "2.15.1",
    "lager_version": "2.0.1",
    "leveldb_read_block_error": "undefined",
    "list_fsm_active": 0,
    "list_fsm_create": 0,
    "list_fsm_create_error": 0,
    "mem_allocated": 467865600,
    "mem_total": 1044668416,
    "memory_atom": 504409,
    "memory_atom_used": 480485,
    "memory_binary": 57896,
    "memory_code": 10707652,
    "memory_ets": 5401760,
    "memory_processes": 2517815,
    "memory_processes_used": 2516982,
    "memory_system": 49784361,
    "memory_total": 52302176,
    "merge_index_version": "1.3.2-0-gcb38ee7",
    "mochiweb_version": "1.5.1p6",
    "node_get_fsm_active": 0,
    "node_get_fsm_active_60s": 0,
    "node_get_fsm_in_rate": 0,
    "node_get_fsm_objsize_100": 0,
    "node_get_fsm_objsize_95": 0,
    "node_get_fsm_objsize_99": 0,
    "node_get_fsm_objsize_mean": 0,
    "node_get_fsm_objsize_median": 0,
    "node_get_fsm_out_rate": 0,
    "node_get_fsm_rejected": 0,
    "node_get_fsm_rejected_60s": 0,
    "node_get_fsm_rejected_total": 0,
    "node_get_fsm_siblings_100": 0,
    "node_get_fsm_siblings_95": 0,
    "node_get_fsm_siblings_99": 0,
    "node_get_fsm_siblings_mean": 0,
    "node_get_fsm_siblings_median": 0,
    "node_get_fsm_time_100": 0,
    "node_get_fsm_time_95": 0,
    "node_get_fsm_time_99": 0,
    "node_get_fsm_time_mean": 0,
    "node_get_fsm_time_median": 0,
    "node_gets": 0,
    "node_gets_total": 0,
    "node_put_fsm_active": 0,
    "node_put_fsm_active_60s": 0,
    "node_put_fsm_in_rate": 0,
    "node_put_fsm_out_rate": 0,
    "node_put_fsm_rejected": 0,
    "node_put_fsm_rejected_60s": 0,
    "node_put_fsm_rejected_total": 0,
    "node_put_fsm_time_100": 0,
    "node_put_fsm_time_95": 0,
    "node_put_fsm_time_99": 0,
    "node_put_fsm_time_mean": 0,
    "node_put_fsm_time_median": 0,
    "node_puts": 0,
    "node_puts_total": 0,
    "nodename": "riak@33.33.33.10.xip.io",
    "os_mon_version": "2.2.9",
    "pbc_active": 0,
    "pbc_connects": 0,
    "pbc_connects_total": 0,
    "pipeline_active": 0,
    "pipeline_create_count": 0,
    "pipeline_create_error_count": 0,
    "pipeline_create_error_one": 0,
    "pipeline_create_one": 0,
    "postcommit_fail": 0,
    "precommit_fail": 0,
    "public_key_version": "0.15",
    "read_repairs": 0,
    "read_repairs_total": 0,
    "rebalance_delay_last": 0,
    "rebalance_delay_max": 0,
    "rebalance_delay_mean": 0,
    "rebalance_delay_min": 0,
    "rejected_handoffs": 0,
    "riak_api_version": "1.4.4-0-g395e6fd",
    "riak_control_version": "1.4.4-0-g9a74e57",
    "riak_core_stat_ts": 1389717990,
    "riak_core_version": "1.4.4",
    "riak_kv_stat_ts": 1389717990,
    "riak_kv_version": "1.4.7-0-g5daeedd",
    "riak_kv_vnodeq_max": 0,
    "riak_kv_vnodeq_mean": 0,
    "riak_kv_vnodeq_median": 0,
    "riak_kv_vnodeq_min": 0,
    "riak_kv_vnodeq_total": 0,
    "riak_kv_vnodes_running": 4,
    "riak_pipe_stat_ts": 1389717989,
    "riak_pipe_version": "1.4.4-0-g7f390f3",
    "riak_pipe_vnodeq_max": 0,
    "riak_pipe_vnodeq_mean": 0,
    "riak_pipe_vnodeq_median": 0,
    "riak_pipe_vnodeq_min": 0,
    "riak_pipe_vnodeq_total": 0,
    "riak_pipe_vnodes_running": 4,
    "riak_search_version": "1.4.7-0-g2a44e2f",
    "riak_sysmon_version": "1.1.3",
    "ring_creation_size": 8,
    "ring_members": [
        "riak@33.33.33.10.xip.io",
        "riak@33.33.33.20.xip.io",
        "riak@33.33.33.30.xip.io"
    ],
    "ring_num_partitions": 8,
    "ring_ownership": "[{'riak@33.33.33.30.xip.io',2},\n {'riak@33.33.33.20.xip.io',2},\n {'riak@33.33.33.10.xip.io',4}]",
    "rings_reconciled": 0,
    "rings_reconciled_total": 12,
    "runtime_tools_version": "1.8.8",
    "sasl_version": "2.2.1",
    "sidejob_version": "0.2.0",
    "ssl_version": "5.0.1",
    "stdlib_version": "1.18.1",
    "storage_backend": "riak_kv_bitcask_backend",
    "syntax_tools_version": "1.6.8",
    "sys_driver_version": "2.0",
    "sys_global_heaps_size": 0,
    "sys_heap_type": "private",
    "sys_logical_processors": 2,
    "sys_otp_release": "R15B01",
    "sys_process_count": 353,
    "sys_smp_support": true,
    "sys_system_architecture": "x86_64-unknown-linux-gnu",
    "sys_system_version": "Erlang R15B01 (erts-5.9.1) [source] [64-bit] [smp:2:2] [async-threads:64] [kernel-poll:true]",
    "sys_thread_pool_size": 64,
    "sys_threads_enabled": true,
    "sys_wordsize": 8,
    "vnode_gets": 0,
    "vnode_gets_total": 0,
    "vnode_index_deletes": 0,
    "vnode_index_deletes_postings": 0,
    "vnode_index_deletes_postings_total": 0,
    "vnode_index_deletes_total": 0,
    "vnode_index_reads": 0,
    "vnode_index_reads_total": 0,
    "vnode_index_refreshes": 0,
    "vnode_index_refreshes_total": 0,
    "vnode_index_writes": 0,
    "vnode_index_writes_postings": 0,
    "vnode_index_writes_postings_total": 0,
    "vnode_index_writes_total": 0,
    "vnode_puts": 0,
    "vnode_puts_total": 0,
    "webmachine_version": "1.10.4-0-gfcff795"
}
```

__Note__: [xip.io](http://xip.io/) is a service that provides wildcard DNS for
any (public or private) IP address.

## How is this better than `make devrel`?

Standing up a local Riak cluster within Vagrant is better than `make devrel`
because:

* It installs Riak on the operating system you intend to deploy on in
  production
* It uses the actual packages you'll deploy with in production
* It allows you to test failure scenarios that include the machine (failed
  disks, network partitions, etc.)

## How is this worse than `make devrel`?

Standing up a local Riak cluster within Vagrant is worse than `make devrel`
because:

* It takes longer (minutes) to stand up a cluster
* It uses more resources on your local machine
* It involves VirtualBox
