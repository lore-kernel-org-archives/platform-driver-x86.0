From: Mario Limonciello <mario_limonciello@dell.com>
Subject: [PATCH v4 0/1] Drop individual LED nodes for colors
Date: Thu, 27 Feb 2014 14:33:01 -0600
Message-ID: <1393533182-2725-1-git-send-email-mario_limonciello@dell.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ausxippc101.us.dell.com ([143.166.85.207]:15952 "EHLO
	ausxippc101.us.dell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750904AbaB0UdU (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 27 Feb 2014 15:33:20 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: matthew.garrett@nebula.com
Cc: platform-driver-x86@vger.kernel.org, Mario Limonciello <mario_limonciello@dell.com>

It was raised that it's not possible to make atomic changes that require 
multiple colors such as from magenta to cyan. So I decided to drop the
36 nodes for controlling 3 zones and instead reduce it to 3 per zone.
The color needs to be packed into that node when setting it, but how it's
done is well commented.

I'd like to know if this interface is sufficiently simple now and uses
the LED class more effectively.

Mario Limonciello (1):
  Add WMI driver for controlling AlienFX and HDMI on Alienware

 drivers/platform/x86/Kconfig         |   15 ++
 drivers/platform/x86/Makefile        |    1 +
 drivers/platform/x86/alienware-wmi.c |  307 ++++++++++++++++++++++++++++++++++
 3 files changed, 323 insertions(+)
 create mode 100644 drivers/platform/x86/alienware-wmi.c

-- 
1.7.9.5
