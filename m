From: Axel Lin <axel.lin@gmail.com>
Subject: [PATCH] platform-driver-x86: samsung-laptop: make dmi_check_cb to
 return 1 instead of 0
Date: Mon, 14 Mar 2011 18:56:18 +0800
Message-ID: <1300100178.3761.4.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:33408 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753006Ab1CNK4W (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 14 Mar 2011 06:56:22 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org

dmi_check_system() walks the table running matching functions until
someone returns non zero or we hit the end.

This patch makes dmi_check_cb to return 1 so dmi_check_system() return
immediately when a match is found.

Signed-off-by: Axel Lin <axel.lin@gmail.com>
---
 drivers/platform/x86/samsung-laptop.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/platform/x86/samsung-laptop.c b/drivers/platform/x86/samsung-laptop.c
index e0b390d..de434c6 100644
--- a/drivers/platform/x86/samsung-laptop.c
+++ b/drivers/platform/x86/samsung-laptop.c
@@ -496,7 +496,7 @@ static int __init dmi_check_cb(const struct dmi_system_id *id)
 {
 	pr_info("found laptop model '%s'\n",
 		id->ident);
-	return 0;
+	return 1;
 }
 
 static struct dmi_system_id __initdata samsung_dmi_table[] = {
-- 
1.7.1
