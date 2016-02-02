From: Mario Limonciello <mario_limonciello@dell.com>
Subject: [PATCH v2 0/5] alienware-wmi new platform and feature support
Date: Mon,  1 Feb 2016 20:28:46 -0600
Message-ID: <1454380131-24662-1-git-send-email-mario_limonciello@dell.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Mario Limonciello <mario_limonciello@dell.com>
List-Id: platform-driver-x86.vger.kernel.org

I've got some extensions for the alienware-wmi driver that have
been introduced for a few new platforms and can be controlled via the WMI
interface.

Changes from V1:
 - Make sure whitespace changes are in their own patch
 - Add commit descriptions to all patches
 - Allow one line to go over 80 characters in deep sleep control patch
   Other patches may have some areas that avoid going over 80 characters
   still, but this matches the style of the existing driver.  If you would
   like these to go over 80 characters as well, please comment which areas
   this is OK.

Mario Limonciello (5):
  Clean up whitespace for ASM100 platform
  Add support for new platform: X51-R3
  Add initial support for alienware graphics amplifier.
  Add support for deep sleep control.
  Add support for two new systems: ASM200 and ASM201.

 drivers/platform/x86/alienware-wmi.c | 282 +++++++++++++++++++++++++++++++----
 1 file changed, 250 insertions(+), 32 deletions(-)

-- 
1.9.1
