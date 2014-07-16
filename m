From: Mathias Krause <minipli@googlemail.com>
Subject: [PATCH 08/15] eeepc-wmi: Constify asus_quirks[] DMI table
Date: Wed, 16 Jul 2014 19:43:10 +0200
Message-ID: <1405532597-28262-9-git-send-email-minipli@googlemail.com>
References: <1405532597-28262-1-git-send-email-minipli@googlemail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f171.google.com ([209.85.212.171]:52198 "EHLO
	mail-wi0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965428AbaGPRno (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 16 Jul 2014 13:43:44 -0400
Received: by mail-wi0-f171.google.com with SMTP id hi2so6667239wib.10
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Jul 2014 10:43:43 -0700 (PDT)
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
 drivers/platform/x86/eeepc-wmi.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/eeepc-wmi.c b/drivers/platform/x86/eeepc-wmi.c
index 6112933f62..14fd2ecb06 100644
--- a/drivers/platform/x86/eeepc-wmi.c
+++ b/drivers/platform/x86/eeepc-wmi.c
@@ -145,7 +145,7 @@ static int dmi_matched(const struct dmi_system_id *dmi)
 	return 1;
 }
 
-static struct dmi_system_id asus_quirks[] = {
+static const struct dmi_system_id asus_quirks[] = {
 	{
 		.callback = dmi_matched,
 		.ident = "ASUSTeK Computer INC. 1000H",
-- 
1.7.10.4
