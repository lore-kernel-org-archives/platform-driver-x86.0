From: Bhumika Goyal <bhumirks@gmail.com>
Subject: [PATCH v2] dell-rbtn: constify rfkill_ops structures
Date: Fri,  9 Jun 2017 11:27:40 +0530
Message-ID: <1496987860-28818-1-git-send-email-bhumirks@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:35842 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751499AbdFIF7Q (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 9 Jun 2017 01:59:16 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: julia.lawall@lip6.fr, pali.rohar@gmail.com, dvhart@infradead.org, andy@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Bhumika Goyal <bhumirks@gmail.com>

Add const to rfkill_ops structures that are only passed as an argument
to the functions rfkill_alloc or samsung_new_rfkill. These arguments are
of type const, so such structures can be annotated with const.

Signed-off-by: Bhumika Goyal <bhumirks@gmail.com>
---
Changes since v1:
* Split the changes to one patch per vendor.

 drivers/platform/x86/dell-rbtn.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell-rbtn.c b/drivers/platform/x86/dell-rbtn.c
index dcd9f40..6b5bbaf 100644
--- a/drivers/platform/x86/dell-rbtn.c
+++ b/drivers/platform/x86/dell-rbtn.c
@@ -110,7 +110,7 @@ static int rbtn_rfkill_set_block(void *data, bool blocked)
 	return -EINVAL;
 }
 
-static struct rfkill_ops rbtn_ops = {
+static const struct rfkill_ops rbtn_ops = {
 	.query = rbtn_rfkill_query,
 	.set_block = rbtn_rfkill_set_block,
 };
-- 
2.7.4
