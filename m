From: Seth Forshee <seth.forshee@canonical.com>
Subject: [PATCH 1/2] acer-wmi: Add support for Aspire 1830 wlan hotkey
Date: Tue, 21 Jun 2011 12:00:32 -0500
Message-ID: <1308675633-10384-1-git-send-email-seth.forshee@canonical.com>
References: <20110621165859.GB25609@thinkpad-t410>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from adelie.canonical.com ([91.189.90.139]:41268 "EHLO
	adelie.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756834Ab1FURAg (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 21 Jun 2011 13:00:36 -0400
In-Reply-To: <20110621165859.GB25609@thinkpad-t410>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Joey Lee <jlee@novell.com>
Cc: platform-driver-x86@vger.kernel.org

Signed-off-by: Seth Forshee <seth.forshee@canonical.com>
---
 drivers/platform/x86/acer-wmi.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 005417b..0dd6986 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -99,6 +99,7 @@ enum acer_wmi_event_ids {
 static const struct key_entry acer_wmi_keymap[] = {
 	{KE_KEY, 0x01, {KEY_WLAN} },     /* WiFi */
 	{KE_KEY, 0x03, {KEY_WLAN} },     /* WiFi */
+	{KE_KEY, 0x04, {KEY_WLAN} },     /* WiFi */
 	{KE_KEY, 0x12, {KEY_BLUETOOTH} },	/* BT */
 	{KE_KEY, 0x21, {KEY_PROG1} },    /* Backup */
 	{KE_KEY, 0x22, {KEY_PROG2} },    /* Arcade */
-- 
1.7.4.1
