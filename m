From: Andy Lutomirski <luto@kernel.org>
Subject: [PATCH v2 0/3] dell-wmi: DMI misuse fixes
Date: Mon, 18 Jan 2016 12:59:37 -0800
Message-ID: <cover.1453150613.git.luto@kernel.org>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:47132 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932164AbcARU7o (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 18 Jan 2016 15:59:44 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, platform-driver-x86@vger.kernel.org, Jean Delvare <jdelvare@suse.de>
Cc: linux-kernel@vger.kernel.org, Andy Lutomirski <luto@kernel.org>

Darren, patches 1 and 2 are for platform-drivers-x86, assuming that
people like them when reviewed.  They're probably 4.5 material, since
they fix a real bug, even if it's hard to trigger.

Jean, patch 3 is for you if you like it.

Changes from v1:
 - Patch 1 has minor tweaks from Jean.
 - Patches 2 and 3 are new.

Andy Lutomirski (3):
  dell-wmi: Stop storing pointers to DMI tables
  dell-wmi: Fix hotkey table size check
  dmi: Make dmi_walk and dmi_walk_early return real error codes

 drivers/firmware/dmi_scan.c     |  6 ++--
 drivers/platform/x86/dell-wmi.c | 71 +++++++++++++++++++++++++----------------
 2 files changed, 46 insertions(+), 31 deletions(-)

-- 
2.5.0
