From: Mario Limonciello <mario_limonciello@dell.com>
Subject: [PATCH v3 0/6] alienware-wmi: new platform and feature support
Date: Tue,  2 Feb 2016 15:38:51 -0600
Message-ID: <1454449137-16478-1-git-send-email-mario_limonciello@dell.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ausxippc101.us.dell.com ([143.166.85.207]:15375 "EHLO
	ausxippc101.us.dell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753046AbcBBVm7 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 2 Feb 2016 16:42:59 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Mario Limonciello <mario_limonciello@dell.com>

I've got some extensions for the alienware-wmi driver that have
been introduced for a few new platforms and can be controlled via the WMI
interface.

Changes from V2:
- add alienware-wmi to subjects (all patches)
- fix indentation on 2 changing comments (patch 3/6)
- remove goto error on amplifier creation (patch 3/6)
- clarify commit message (patch 4/6)
- fix line wrapping on some long lines (patch 4/6)
- remove goto error on deep sleep creation (patch 4/6)
- whitespace improvements in other parts of the driver (patch 6/6)

Changes from V1:
- Make sure whitespace changes are in their own patch
- Add commit descriptions to all patches
- Allow one line to go over 80 characters in deep sleep control patch
  Other patches may have some areas that avoid going over 80 characters
  still, but this matches the style of the existing driver.  If you would
  like these to go over 80 characters as well, please comment which areas
  this is OK.


Mario Limonciello (6):
  alienware-wmi: Clean up whitespace for ASM100 platform
  alienware-wmi: Add support for new platform: X51-R3
  alienware-wmi: Add initial support for alienware graphics amplifier.
  alienware-wmi: Add support for deep sleep control.
  alienware-wmi: Add support for two new systems: ASM200 and ASM201.
  alienware-wmi: whitespace improvements

 drivers/platform/x86/alienware-wmi.c | 291 +++++++++++++++++++++++++++++------
 1 file changed, 247 insertions(+), 44 deletions(-)

-- 
1.9.1
