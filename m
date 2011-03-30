From: Corentin Chary <corentin.chary@gmail.com>
Subject: [PATCH 3/3] eeepc-wmi: add keys found on EeePC 1215T
Date: Wed, 30 Mar 2011 16:32:33 +0200
Message-ID: <1301495553-22468-4-git-send-email-corentin.chary@gmail.com>
References: <1301495553-22468-1-git-send-email-corentin.chary@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from fb2.tech.numericable.fr ([82.216.111.50]:41429 "EHLO
	fb2.tech.numericable.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755202Ab1C3Onw (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 30 Mar 2011 10:43:52 -0400
Received: from smtp1.tech.numericable.fr (smtp1.nc.sdv.fr [10.0.0.24])
	by fb2.tech.numericable.fr (Postfix) with ESMTP id 9A86E1BCDB0
	for <platform-driver-x86@vger.kernel.org>; Wed, 30 Mar 2011 16:33:37 +0200 (CEST)
In-Reply-To: <1301495553-22468-1-git-send-email-corentin.chary@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, Corentin Chary <corentin.chary@gmail.com>

Signed-off-by: Corentin Chary <corentin.chary@gmail.com>
---
 drivers/platform/x86/eeepc-wmi.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/eeepc-wmi.c b/drivers/platform/x86/eeepc-wmi.c
index 0ddc434..649dcad 100644
--- a/drivers/platform/x86/eeepc-wmi.c
+++ b/drivers/platform/x86/eeepc-wmi.c
@@ -67,9 +67,11 @@ static const struct key_entry eeepc_wmi_keymap[] = {
 	{ KE_KEY, 0x82, { KEY_CAMERA } },
 	{ KE_KEY, 0x83, { KEY_CAMERA_ZOOMIN } },
 	{ KE_KEY, 0x88, { KEY_WLAN } },
+	{ KE_KEY, 0xbd, { KEY_CAMERA } },
 	{ KE_KEY, 0xcc, { KEY_SWITCHVIDEOMODE } },
 	{ KE_KEY, 0xe0, { KEY_PROG1 } }, /* Task Manager */
 	{ KE_KEY, 0xe1, { KEY_F14 } }, /* Change Resolution */
+	{ KE_KEY, 0xe8, { KEY_SCREENLOCK } },
 	{ KE_KEY, 0xe9, { KEY_BRIGHTNESS_ZERO } },
 	{ KE_KEY, 0xeb, { KEY_CAMERA_ZOOMOUT } },
 	{ KE_KEY, 0xec, { KEY_CAMERA_UP } },
-- 
1.7.3.4
