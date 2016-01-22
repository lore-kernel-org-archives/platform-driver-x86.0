From: Mario Limonciello <mario_limonciello@dell.com>
Subject: [PATCH 0/4] alienware-wmi new platform and feature support
Date: Thu, 21 Jan 2016 18:04:56 -0600
Message-ID: <1453421100-12984-1-git-send-email-mario_limonciello@dell.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ausxippc101.us.dell.com ([143.166.85.207]:11406 "EHLO
	ausxippc101.us.dell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750878AbcAVAIj (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 21 Jan 2016 19:08:39 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Mario Limonciello <mario_limonciello@dell.com>

I've got some extensions for the alienware-wmi driver that have
been introduced for a few new platforms and can be controlled via the WMI
interface.

Mario Limonciello (4):
  Add support for new platform, X51-R3
  Add support for alienware graphics amplifier
  Add support for deep sleep control.
  Add support for two new systems: ASM200 & ASM201

 drivers/platform/x86/alienware-wmi.c | 285 +++++++++++++++++++++++++++++++----
 1 file changed, 252 insertions(+), 33 deletions(-)

-- 
1.9.1
