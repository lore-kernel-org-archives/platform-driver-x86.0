From: Lad Prabhakar <prabhakar.csengg@gmail.com>
Subject: [PATCH] samsung-laptop: fix sparse warning
Date: Thu,  5 Feb 2015 14:40:05 +0000
Message-ID: <1423147205-20593-1-git-send-email-prabhakar.csengg@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:43008 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753354AbbBEOkU (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 5 Feb 2015 09:40:20 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, "Lad, Prabhakar" <prabhakar.csengg@gmail.com>

From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>

this patch fixes following sparse warning:

samsung-laptop.c:1365:52: warning: Using plain integer as NULL pointer

Signed-off-by: Lad, Prabhakar <prabhakar.csengg@gmail.com>
---
 Found this issue on linux-next (gcc  version 4.9.2,
 sparse version  0.4.5-rc1)and applies on top linux-next.

 drivers/platform/x86/samsung-laptop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/samsung-laptop.c b/drivers/platform/x86/samsung-laptop.c
index ce364a4..c3c31e0 100644
--- a/drivers/platform/x86/samsung-laptop.c
+++ b/drivers/platform/x86/samsung-laptop.c
@@ -1362,7 +1362,7 @@ static int __init samsung_sabi_init(struct samsung_laptop *samsung)
 	samsung_sabi_diag(samsung);
 
 	/* Try to find one of the signatures in memory to find the header */
-	for (i = 0; sabi_configs[i].test_string != 0; ++i) {
+	for (i = 0; sabi_configs[i].test_string != NULL; ++i) {
 		samsung->config = &sabi_configs[i];
 		loca = find_signature(samsung->f0000_segment,
 				      samsung->config->test_string);
-- 
1.9.1
