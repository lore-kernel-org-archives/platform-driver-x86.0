From: Mathias Krause <minipli@googlemail.com>
Subject: [PATCH 06/15] asus-nb-wmi: Constify asus_quirks[] DMI table
Date: Wed, 16 Jul 2014 19:43:08 +0200
Message-ID: <1405532597-28262-7-git-send-email-minipli@googlemail.com>
References: <1405532597-28262-1-git-send-email-minipli@googlemail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f176.google.com ([209.85.212.176]:39286 "EHLO
	mail-wi0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934736AbaGPRnn (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 16 Jul 2014 13:43:43 -0400
Received: by mail-wi0-f176.google.com with SMTP id bs8so6619426wib.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Jul 2014 10:43:41 -0700 (PDT)
In-Reply-To: <1405532597-28262-1-git-send-email-minipli@googlemail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>
Cc: platform-driver-x86@vger.kernel.org, Mathias Krause <minipli@googlemail.com>, Corentin Chary <corentin.chary@gmail.com>

Constify the asus_quirks[] DMI table. There's no need to have it
writeable during runtime.

Signed-off-by: Mathias Krause <minipli@googlemail.com>
Cc: Corentin Chary <corentin.chary@gmail.com>
---
 drivers/platform/x86/asus-nb-wmi.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index ddf0eefd86..98f68c71b7 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -80,7 +80,7 @@ static int dmi_matched(const struct dmi_system_id *dmi)
 	return 1;
 }
 
-static struct dmi_system_id asus_quirks[] = {
+static const struct dmi_system_id asus_quirks[] = {
 	{
 		.callback = dmi_matched,
 		.ident = "ASUSTeK COMPUTER INC. X401U",
-- 
1.7.10.4
