From: Carlo Caione <carlo@caione.org>
Subject: [PATCH v2 0/2] hp-wmi: Fix dock status and tablet mode reporting
Date: Wed, 19 Apr 2017 19:41:52 +0200
Message-ID: <20170419174154.16518-1-carlo@caione.org>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wr0-f193.google.com ([209.85.128.193]:32928 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S968600AbdDSRmV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 19 Apr 2017 13:42:21 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org, andy@infradead.org, andy.shevchenko@gmail.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, linux@endlessm.com
Cc: Carlo Caione <carlo@endlessm.com>

From: Carlo Caione <carlo@endlessm.com>

Several HP laptops cannot be put to sleep using the LID since systemd complains
that the system is docked even though the laptop is not even dockable (see
[1]).

This is due to a bug in hp-wmi where the driver is failing to check for errors
before creating the input switches.

[1]: https://bugs.launchpad.net/ubuntu/+source/systemd/+bug/1574120

changelog:

v2:
 * Changed PATCH 1/2 to not shadow negative errors if any

Carlo Caione (2):
  hp-wmi: Do not shadow error values
  hp-wmi: Fix detection for dock and tablet mode

 drivers/platform/x86/hp-wmi.c | 52 +++++++++++++++++++++++++++----------------
 1 file changed, 33 insertions(+), 19 deletions(-)

-- 
2.9.3
