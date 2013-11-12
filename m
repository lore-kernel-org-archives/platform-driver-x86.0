From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH 2/2] sony-laptop: fixe typos in sony_laptop_input_keycode_map
Date: Wed, 13 Nov 2013 08:17:36 +0900
Message-ID: <1384298256-14103-3-git-send-email-malattia@linux.it>
References: <1384298256-14103-1-git-send-email-malattia@linux.it>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:46810 "EHLO
	smtp.taihen.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755191Ab3KLXSA (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 12 Nov 2013 18:18:00 -0500
In-Reply-To: <1384298256-14103-1-git-send-email-malattia@linux.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Stephen Gildea <stepheng+linux@gildea.com>, Mattia Dongili <malattia@linux.it>

From: Stephen Gildea <stepheng+linux@gildea.com>

Signed-off-by: Stephen Gildea <stepheng+linux@gildea.com>
Signed-off-by: Mattia Dongili <malattia@linux.it>
---
 drivers/platform/x86/sony-laptop.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index 6b63329..8d80f2c 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -305,8 +305,8 @@ static int sony_laptop_input_keycode_map[] = {
 	KEY_FN_F10,	/* 14 SONYPI_EVENT_FNKEY_F10 */
 	KEY_FN_F11,	/* 15 SONYPI_EVENT_FNKEY_F11 */
 	KEY_FN_F12,	/* 16 SONYPI_EVENT_FNKEY_F12 */
-	KEY_FN_F1,	/* 17 SONYPI_EVENT_FNKEY_1 */
-	KEY_FN_F2,	/* 18 SONYPI_EVENT_FNKEY_2 */
+	KEY_FN_1,	/* 17 SONYPI_EVENT_FNKEY_1 */
+	KEY_FN_2,	/* 18 SONYPI_EVENT_FNKEY_2 */
 	KEY_FN_D,	/* 19 SONYPI_EVENT_FNKEY_D */
 	KEY_FN_E,	/* 20 SONYPI_EVENT_FNKEY_E */
 	KEY_FN_F,	/* 21 SONYPI_EVENT_FNKEY_F */
-- 
1.8.4.2
