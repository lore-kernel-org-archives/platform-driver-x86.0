From: Andy Lutomirski <luto@kernel.org>
Subject: [PATCH v3 0/3] dell-wmi: DMI misuse fixes
Date: Tue, 19 Jan 2016 11:07:23 -0800
Message-ID: <cover.1453229127.git.luto@kernel.org>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:58891 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756789AbcASTHd (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 19 Jan 2016 14:07:33 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, platform-driver-x86@vger.kernel.org, Jean Delvare <jdelvare@suse.de>
Cc: linux-kernel@vger.kernel.org, Andy Lutomirski <luto@kernel.org>

This may all be 4.5 material.

Changes from v2:
 - Dropped the dmi_walk return value change.  I'll resend it separately.
 - Rewrite the hotkey_num change
 - Add the select DMI patch.
 - Fix patch 1 error handling.

Changes from v1:
 - Patch 1 has minor tweaks from Jean.
 - Patches 2 and 3 are new.
 
Andy Lutomirski (3):
  dell-wmi: Stop storing pointers to DMI tables
  dell-wmi, dell-laptop: select DMI
  dell-wmi: Clean up hotkey table size check

 drivers/platform/x86/Kconfig    |  2 +
 drivers/platform/x86/dell-wmi.c | 85 +++++++++++++++++++++++++++--------------
 2 files changed, 59 insertions(+), 28 deletions(-)

-- 
2.5.0
