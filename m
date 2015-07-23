From: Taku Izumi <izumi.taku@jp.fujitsu.com>
Subject: [PATCH v2.1 00/22] FUJITSU Extended Socket network device driver
Date: Thu, 23 Jul 2015 09:09:02 +0900
Message-ID: <1437610142-12439-1-git-send-email-izumi.taku@jp.fujitsu.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mgwym04.jp.fujitsu.com ([211.128.242.43]:13830 "EHLO
	mgwym04.jp.fujitsu.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752491AbbGWANH (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 22 Jul 2015 20:13:07 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: netdev@vger.kernel.org, davem@davemloft.net
Cc: platform-driver-x86@vger.kernel.org, dvhart@infradead.org, rkhan@redhat.com, alexander.h.duyck@redhat.com, linux-acpi@vger.kernel.org, joe@perches.com, sergei.shtylyov@cogentembedded.com, stephen@networkplumber.org, yasu.isimatu@gmail.com, Taku Izumi <izumi.taku@jp.fujitsu.com>

This patchsets adds FUJITSU Extended Socket network device driver.
Extended Socket network device is a shared memory based high-speed network
interface between Extended Partitions of PRIMEQUEST 2000 E2 series.

You can get some information about Extended Partition and Extended
Socket by referring the following manual.

http://globalsp.ts.fujitsu.com/dmsp/Publications/public/CA92344-0537.pdf
  3.2.1 Extended Partitioning
  3.2.2 Extended Socke

v2 -> v2.1:
  - Rebase (Add missing vmalloc.h inclusion)
  - Change some coding style

Taku Izumi (22):
  fjes: Introduce FUJITSU Extended Socket Network Device driver
  fjes: Hardware initialization routine
  fjes: Hardware cleanup routine
  fjes: platform_driver's .probe and .remove routine
  fjes: ES information acquisition routine
  fjes: buffer address regist/unregistration routine
  fjes: net_device_ops.ndo_open and .ndo_stop
  fjes: net_device_ops.ndo_start_xmit
  fjes: raise_intr_rxdata_task
  fjes: tx_stall_task
  fjes: NAPI polling function
  fjes: net_device_ops.ndo_get_stats64
  fjes: net_device_ops.ndo_change_mtu
  fjes: net_device_ops.ndo_tx_timeout
  fjes: net_device_ops.ndo_vlan_rx_add/kill_vid
  fjes: interrupt_watch_task
  fjes: force_close_task
  fjes: unshare_watch_task
  fjes: update_zone_task
  fjes: epstop_task
  fjes: handle receive cancellation request interrupt
  fjes: ethtool support

 drivers/net/Kconfig             |    7 +
 drivers/net/Makefile            |    2 +
 drivers/net/fjes/Makefile       |   31 +
 drivers/net/fjes/fjes.h         |   77 +++
 drivers/net/fjes/fjes_ethtool.c |  135 ++++
 drivers/net/fjes/fjes_hw.c      | 1117 +++++++++++++++++++++++++++++++
 drivers/net/fjes/fjes_hw.h      |  334 ++++++++++
 drivers/net/fjes/fjes_main.c    | 1389 +++++++++++++++++++++++++++++++++++++++
 drivers/net/fjes/fjes_regs.h    |  142 ++++
 9 files changed, 3234 insertions(+)
 create mode 100644 drivers/net/fjes/Makefile
 create mode 100644 drivers/net/fjes/fjes.h
 create mode 100644 drivers/net/fjes/fjes_ethtool.c
 create mode 100644 drivers/net/fjes/fjes_hw.c
 create mode 100644 drivers/net/fjes/fjes_hw.h
 create mode 100644 drivers/net/fjes/fjes_main.c
 create mode 100644 drivers/net/fjes/fjes_regs.h

-- 
1.8.3.1
