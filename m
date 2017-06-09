From: Bhumika Goyal <bhumirks@gmail.com>
Subject: [PATCH v2] platform/x86: ideapad-laptop: constify rfkill_ops structure
Date: Fri,  9 Jun 2017 11:38:18 +0530
Message-ID: <1496988498-29240-1-git-send-email-bhumirks@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:34587 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751501AbdFIGJx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 9 Jun 2017 02:09:53 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: julia.lawall@lip6.fr, ike.pan@canonical.com, dvhart@infradead.org, andy@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Bhumika Goyal <bhumirks@gmail.com>

Add const to rfkill_ops structure as it is only passed as an argument
to the functions rfkill_alloc. This argument is of type const, 
so annotate the structure with const.

Signed-off-by: Bhumika Goyal <bhumirks@gmail.com>
---
Changes since v1:
* Split the changes to one patch per vendor.

 drivers/platform/x86/ideapad-laptop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index 24ca9fb..3beec1e 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -478,7 +478,7 @@ static int ideapad_rfk_set(void *data, bool blocked)
 	return write_ec_cmd(priv->priv->adev->handle, opcode, !blocked);
 }
 
-static struct rfkill_ops ideapad_rfk_ops = {
+static const struct rfkill_ops ideapad_rfk_ops = {
 	.set_block = ideapad_rfk_set,
 };
 
-- 
2.7.4
