From: Mario Limonciello <mario_limonciello@dell.com>
Subject: [PATCH 0/1] Add new driver for AlienFX control
Date: Wed,  5 Feb 2014 10:22:22 -0600
Message-ID: <1391617343-2743-1-git-send-email-mario_limonciello@dell.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ausc60ps301.us.dell.com ([143.166.148.206]:49507 "EHLO
	ausc60ps301.us.dell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752723AbaBEQcc (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 5 Feb 2014 11:32:32 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: matthew.garrett@nebula.com
Cc: platform-driver-x86@vger.kernel.org, Mario Limonciello <mario_limonciello@dell.com>

Alienware is known for being able to control the lighting zones around the 
machine independently.  Previously this was done via an MCU.

The Alienware X51 R2 (as well as a few others) no longer uses an MCU to control
it's different lighting zones.  It does however have a WMI interface.

At a first glance it seems reasonable to set up each LED for each zone 
individually using the kernel's LED infrastructure.

After digging further in, there actually is control for setting up the LEDs to 
perform different tasks in S0 and S3 power states which becomes more difficult 
to represent in the LED class.  So instead I've created a series of sysfs nodes
to represent the different colors in the different zones.

Normally the system will be in the RUNNING lighting control state and 
immediately change based on the values (0-255) that you place in these sysfs nodes.

If you change the lighting control state to SUSPEND or BOOTING then modifying 
the nodes will set up the lights for those alternate states.

Later platforms will be adding support for an HDMI mux.  I've included some 
skeleton code here for this, but will add more as they get closer to launching.

Mario Limonciello (1):
  Add WMI driver for controlling AlienFX on Alienware

 drivers/platform/x86/Kconfig         |   13 ++
 drivers/platform/x86/Makefile        |    1 +
 drivers/platform/x86/alienware-wmi.c |  345 ++++++++++++++++++++++++++++++++++
 3 files changed, 359 insertions(+)
 create mode 100644 drivers/platform/x86/alienware-wmi.c

-- 
1.7.9.5
