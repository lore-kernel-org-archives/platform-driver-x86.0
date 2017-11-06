From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH 0/2] Correct some errors caught by buildbot
Date: Sun,  5 Nov 2017 21:34:32 -0600
Message-ID: <1509939274-2813-1-git-send-email-mario.limonciello@dell.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa3.dell-outbound.iphmx.com ([68.232.153.94]:47905 "EHLO
        esa3.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750817AbdKFDeo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 5 Nov 2017 22:34:44 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Mario Limonciello <mario.limonciello@dell.com>

Some of the failure scenarios weren't releasing acquired mutexes.
Here are some patches that correct them.

Mario Limonciello (2):
  platform/x86: wmi: release mutex on module acquistion failure
  platform/x86: dell-smbios-wmi: release mutex lock on WMI call failure

 drivers/platform/x86/dell-smbios-wmi.c | 7 +++++--
 drivers/platform/x86/wmi.c             | 6 ++++--
 2 files changed, 9 insertions(+), 4 deletions(-)

-- 
2.7.4
