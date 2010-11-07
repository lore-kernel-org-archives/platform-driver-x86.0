From: Clay Carpenter <claycarpenter@gmail.com>
Subject: [PATCH] acerhdf: Add support for Aspire 1410 BIOS v1.3314
Date: Sun, 7 Nov 2010 00:32:21 -0400
Message-ID: <AANLkTinhev01i+hBH+FW_quLay1dOGFpFW52mONxmshB@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:59477 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750781Ab0KGEdD (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 7 Nov 2010 00:33:03 -0400
Received: by iwn41 with SMTP id 41so2576782iwn.19
        for <platform-driver-x86@vger.kernel.org>; Sat, 06 Nov 2010 21:33:02 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Peter Feuerer <peter@piie.net>
Cc: platform-driver-x86@vger.kernel.org

From: Clay Carpenter <claycarpenter@gmail.com>

Add support for Aspire 1410 BIOS v1.3314.  Fixes the following error:

acerhdf: unknown (unsupported) BIOS version Acer/Aspire 1410/v1.3314,
please report, aborting!

Signed-off-by: Clay Carpenter <claycarpenter@gmail.com>
---

 drivers/platform/x86/acerhdf.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/acerhdf.c b/drivers/platform/x86/acerhdf.c
index 60f9cfc..73df4c5 100644
--- a/drivers/platform/x86/acerhdf.c
+++ b/drivers/platform/x86/acerhdf.c
@@ -163,6 +163,7 @@ static const struct bios_settings_t bios_tbl[] = {
        {"Acer", "Aspire 1410", "v1.3303", 0x55, 0x58, {0x9e, 0x00} },
        {"Acer", "Aspire 1410", "v1.3308", 0x55, 0x58, {0x9e, 0x00} },
        {"Acer", "Aspire 1410", "v1.3310", 0x55, 0x58, {0x9e, 0x00} },
+       {"Acer", "Aspire 1410", "v1.3314", 0x55, 0x58, {0x9e, 0x00} },
        /* Acer 1810xx */
        {"Acer", "Aspire 1810TZ", "v0.3108", 0x55, 0x58, {0x9e, 0x00} },
        {"Acer", "Aspire 1810T",  "v0.3108", 0x55, 0x58, {0x9e, 0x00} },
