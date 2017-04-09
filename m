From: Carlo Caione <carlo@caione.org>
Subject: [PATCH 0/2] hp-wmi: Fix dock status and tablet mode reporting
Date: Sun,  9 Apr 2017 15:56:06 +0200
Message-ID: <20170409135608.15621-1-carlo@caione.org>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wr0-f172.google.com ([209.85.128.172]:35435 "EHLO
        mail-wr0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752391AbdDIN4Q (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 9 Apr 2017 09:56:16 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org, andy@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, linux@endlessm.com
Cc: Carlo Caione <carlo@endlessm.com>

From: Carlo Caione <carlo@endlessm.com>

Several HP laptops cannot be put to sleep using the LID since systemd complains
that the system is docked even though the laptop is not even dockable (see
[1]).

This is due to a bug in hp-wmi where the driver is failing to check for errors
before creating the input switches.

[1]: https://bugs.launchpad.net/ubuntu/+source/systemd/+bug/1574120

Carlo Caione (2):
  hp-wmi: Fix error value for hp_wmi_tablet_state
  hp-wmi: Fix detection for dock and tablet mode

 drivers/platform/x86/hp-wmi.c | 42 ++++++++++++++++++++++++++++--------------
 1 file changed, 28 insertions(+), 14 deletions(-)

-- 
2.9.3
