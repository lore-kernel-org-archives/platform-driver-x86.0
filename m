From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH 01/11] sony-laptop: add support as Fn+1 as a hot key
Date: Fri, 21 Mar 2014 08:01:12 +0900
Message-ID: <1395356482-7446-2-git-send-email-malattia@linux.it>
References: <1395356482-7446-1-git-send-email-malattia@linux.it>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:42151 "EHLO
	smtp.taihen.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759767AbaCTXJN (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 20 Mar 2014 19:09:13 -0400
In-Reply-To: <1395356482-7446-1-git-send-email-malattia@linux.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Javier Achirica <jachirica@gmail.com>, Mattia Dongili <malattia@linux.it>

From: Javier Achirica <jachirica@gmail.com>

Signed-off-by: Javier Achirica <jachirica@gmail.com>
Signed-off-by: Mattia Dongili <malattia@linux.it>
---
 drivers/platform/x86/sony-laptop.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index 8f8551a..fe5424c 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -1122,6 +1122,8 @@ static struct sony_nc_event sony_100_events[] = {
 	{ 0x25, SONYPI_EVENT_ANYBUTTON_RELEASED },
 	{ 0xa6, SONYPI_EVENT_HELP_PRESSED },
 	{ 0x26, SONYPI_EVENT_ANYBUTTON_RELEASED },
+	{ 0xa8, SONYPI_EVENT_FNKEY_1 },
+	{ 0x28, SONYPI_EVENT_ANYBUTTON_RELEASED },
 	{ 0, 0 },
 };
 
-- 
1.9.0
