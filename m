From: Bhumika Goyal <bhumirks@gmail.com>
Subject: [PATCH v2] platform/x86: samsung-laptop: constify rfkill_ops structures
Date: Fri,  9 Jun 2017 11:31:44 +0530
Message-ID: <1496988104-29001-1-git-send-email-bhumirks@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:32993 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751501AbdFIGDU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 9 Jun 2017 02:03:20 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: julia.lawall@lip6.fr, corentin.chary@gmail.com, dvhart@infradead.org, andy@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Bhumika Goyal <bhumirks@gmail.com>

Add const to rfkill_ops structures that are only passed as an argument
to the functions rfkill_alloc or samsung_new_rfkill. These arguments are
of type const, so such structures can be annotated with const.

Signed-off-by: Bhumika Goyal <bhumirks@gmail.com>
---
Changes since v1:
* Split the changes to one patch per vendor.

 drivers/platform/x86/samsung-laptop.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/samsung-laptop.c b/drivers/platform/x86/samsung-laptop.c
index 8c146e2..e1e8897 100644
--- a/drivers/platform/x86/samsung-laptop.c
+++ b/drivers/platform/x86/samsung-laptop.c
@@ -591,7 +591,7 @@ static int seclinux_rfkill_set(void *data, bool blocked)
 				 !blocked);
 }
 
-static struct rfkill_ops seclinux_rfkill_ops = {
+static const struct rfkill_ops seclinux_rfkill_ops = {
 	.set_block = seclinux_rfkill_set,
 };
 
@@ -651,7 +651,7 @@ static void swsmi_rfkill_query(struct rfkill *rfkill, void *priv)
 	rfkill_set_sw_state(rfkill, !ret);
 }
 
-static struct rfkill_ops swsmi_rfkill_ops = {
+static const struct rfkill_ops swsmi_rfkill_ops = {
 	.set_block = swsmi_rfkill_set,
 	.query = swsmi_rfkill_query,
 };
-- 
2.7.4
