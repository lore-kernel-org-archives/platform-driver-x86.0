From: Axel Lin <axel.lin@gmail.com>
Subject: [PATCH] acer-wmi: make dmi_matched to return 1 instead of 0
Date: Wed, 30 Jun 2010 13:32:16 +0800
Message-ID: <1277875936.22265.2.camel@mola>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:65039 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751656Ab0F3F3y (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 30 Jun 2010 01:29:54 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: linux-kernel <linux-kernel@vger.kernel.org>
Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>, Matthew Garrett <mjg@redhat.com>, Len Brown <len.brown@intel.com>, Thomas Renninger <trenn@suse.de>, platform-driver-x86@vger.kernel.org

dmi_check_system() walks the table running matching functions until someone
returns non zero or we hit the end.

This patch makes dmi_matched to return 1 so dmi_check_system() return
immediately when a match is found.

Signed-off-by: Axel Lin <axel.lin@gmail.com>
---
 drivers/platform/x86/acer-wmi.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index fe7c9e4..6a1a27e 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -200,7 +200,7 @@ static void set_quirks(void)
 static int dmi_matched(const struct dmi_system_id *dmi)
 {
 	quirks = dmi->driver_data;
-	return 0;
+	return 1;
 }
 
 static struct quirk_entry quirk_unknown = {
-- 
1.5.4.3
