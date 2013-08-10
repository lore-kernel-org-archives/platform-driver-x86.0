From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH 2/2] sony-laptop: Fix reporting of gfx_switch_status
Date: Sat, 10 Aug 2013 13:11:19 +0900
Message-ID: <1376107879-22608-3-git-send-email-malattia@linux.it>
References: <1376107879-22608-1-git-send-email-malattia@linux.it>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:52441 "EHLO
	smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750785Ab3HJESF (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 10 Aug 2013 00:18:05 -0400
In-Reply-To: <1376107879-22608-1-git-send-email-malattia@linux.it>
In-Reply-To: <20130710212017.GA24522@kamineko.org>
References: <20130710212017.GA24522@kamineko.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Daniel Serpell <daniel.serpell@gmail.com>, Mattia Dongili <malattia@linux.it>

From: Daniel Serpell <daniel.serpell@gmail.com>

Signed-off-by: Daniel Serpell <daniel.serpell@gmail.com>
Signed-off-by: Mattia Dongili <malattia@linux.it>
---
 drivers/platform/x86/sony-laptop.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index b162733..3a1b6bf 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -2440,7 +2440,10 @@ static ssize_t sony_nc_gfx_switch_status_show(struct device *dev,
 	if (pos < 0)
 		return pos;
 
-	return snprintf(buffer, PAGE_SIZE, "%s\n", pos ? "speed" : "stamina");
+	return snprintf(buffer, PAGE_SIZE, "%s\n",
+					pos == SPEED ? "speed" :
+					pos == STAMINA ? "stamina" :
+					pos == AUTO ? "auto" : "unknown");
 }
 
 static int sony_nc_gfx_switch_setup(struct platform_device *pd,
-- 
1.8.4.rc1
