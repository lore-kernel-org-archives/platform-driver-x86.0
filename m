From: Andy Lutomirski <luto@kernel.org>
Subject: [PATCH v5 0/5] dell fixes and Skylake updates
Date: Mon, 15 Feb 2016 08:32:32 -0800
Message-ID: <cover.1455553470.git.luto@kernel.org>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:34105 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751136AbcBOQcm (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 15 Feb 2016 11:32:42 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>
Cc: Jon Eyolfson <jon@eyl.io>, Matthew Garrett <mjg59@srcf.ucam.org>, Mario Limonciello <mario_limonciello@dell.com>, Andy Lutomirski <luto@kernel.org>

This is the successor to v3 of the dmi walk fixes and v4 of the Skylake
stuff.  The Skylake history is in that patch's notes.

Changes from v3 of the dmi walk fix:
 - Add the new hotkey patch.
 - Add the dell-rbtn patch.
 - Fix up a commit log message.

Changes from v2:
 - Dropped the dmi_walk return value change.  I'll resend it separately.
 - Rewrite the hotkey_num change
 - Add the select DMI patch.
 - Fix patch 1 error handling.

Changes from v1:
 - Patch 1 has minor tweaks from Jean.
 - Patches 2 and 3 are new.
 
Andy Lutomirski (5):
  dell-wmi: Stop storing pointers to DMI tables
  dell-wmi, dell-laptop: select DMI
  dell-wmi: Clean up hotkey table size check
  dell-wmi: Support new hotkeys on the XPS 13 9350 (Skylake)
  dell-rbtn: Add a comment about the XPS 13 9350

 drivers/platform/x86/Kconfig     |   2 +
 drivers/platform/x86/dell-rbtn.c |  15 ++++
 drivers/platform/x86/dell-wmi.c  | 154 ++++++++++++++++++++++++++++++---------
 3 files changed, 137 insertions(+), 34 deletions(-)

-- 
2.5.0
