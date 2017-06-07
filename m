From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] platform/x86: samsung-laptop: Initialize loca variable
Date: Wed,  7 Jun 2017 17:04:31 +0300
Message-ID: <20170607140431.30392-1-andriy.shevchenko@linux.intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:19677 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751469AbdFGOEm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Jun 2017 10:04:42 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>, platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

The variable is used uninitialized which might come into unexpected
behaviour on some Samsung laptops.

Initialize it to 0xffff which seems a proper value for non-supported
feature.

Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/samsung-laptop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/samsung-laptop.c b/drivers/platform/x86/samsung-laptop.c
index 8c146e2b6727..1aa11732f48c 100644
--- a/drivers/platform/x86/samsung-laptop.c
+++ b/drivers/platform/x86/samsung-laptop.c
@@ -1446,9 +1446,9 @@ static int __init samsung_sabi_init(struct samsung_laptop *samsung)
 	const struct sabi_config *config = NULL;
 	const struct sabi_commands *commands;
 	unsigned int ifaceP;
+	int loca = 0xffff;
 	int ret = 0;
 	int i;
-	int loca;
 
 	samsung->f0000_segment = ioremap_nocache(0xf0000, 0xffff);
 	if (!samsung->f0000_segment) {
-- 
2.11.0
