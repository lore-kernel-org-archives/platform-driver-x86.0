From: Mario Limonciello <mario_limonciello@dell.com>
Subject: [PATCH v2 0/1] Add new driver for AlienFX control
Date: Wed,  5 Feb 2014 16:38:23 -0600
Message-ID: <1391639904-3815-1-git-send-email-mario_limonciello@dell.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ausxippc101.us.dell.com ([143.166.85.207]:55962 "EHLO
	ausxippc101.us.dell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751219AbaBEWsS (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 5 Feb 2014 17:48:18 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: matthew.garrett@nebula.com
Cc: platform-driver-x86@vger.kernel.org, Mario Limonciello <mario_limonciello@dell.com>

The LED subsystem maintainer thinks these should fit fine using LED subsystem, so
I reverted back to my previous implementation.

Mario Limonciello (1):
  Add WMI driver for controlling AlienFX on Alienware

 drivers/platform/x86/Kconfig         |   15 ++
 drivers/platform/x86/Makefile        |    1 +
 drivers/platform/x86/alienware-wmi.c |  375 ++++++++++++++++++++++++++++++++++
 3 files changed, 391 insertions(+)
 create mode 100644 drivers/platform/x86/alienware-wmi.c

-- 
1.7.9.5
