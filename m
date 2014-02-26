From: Mario Limonciello <mario_limonciello@dell.com>
Subject: [PATCH v3 0/1] alienware-wmi: Update HDMI control methods
Date: Wed, 26 Feb 2014 17:47:38 -0600
Message-ID: <1393458459-29353-1-git-send-email-mario_limonciello@dell.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ausxippc101.us.dell.com ([143.166.85.207]:56753 "EHLO
	ausxippc101.us.dell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753323AbaBZXrp (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 26 Feb 2014 18:47:45 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: matthew.garrett@nebula.com
Cc: platform-driver-x86@vger.kernel.org, Mario Limonciello <mario_limonciello@dell.com>

Changes for v3:
 * Add HDMI control methods.  Will be restricted by DMI data because it 
   uses common GUID and WMI method as lighting control.  All platforms 
   with that GUID should support lighting control.
 * DMI data for HDMI supported platforms not yet locked.

Mario Limonciello (1):
  Add WMI driver for controlling AlienFX and HDMI on Alienware

 drivers/platform/x86/Kconfig         |   15 ++
 drivers/platform/x86/Makefile        |    1 +
 drivers/platform/x86/alienware-wmi.c |  372 ++++++++++++++++++++++++++++++++++
 3 files changed, 388 insertions(+)
 create mode 100644 drivers/platform/x86/alienware-wmi.c

-- 
1.7.9.5
