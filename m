From: Mathias Krause <minipli@googlemail.com>
Subject: [PATCH 05/15] alienware-wmi: Mark DMI table as __initconst
Date: Wed, 16 Jul 2014 19:43:07 +0200
Message-ID: <1405532597-28262-6-git-send-email-minipli@googlemail.com>
References: <1405532597-28262-1-git-send-email-minipli@googlemail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wg0-f41.google.com ([74.125.82.41]:36257 "EHLO
	mail-wg0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934736AbaGPRnm (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 16 Jul 2014 13:43:42 -0400
Received: by mail-wg0-f41.google.com with SMTP id z12so1284802wgg.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Jul 2014 10:43:40 -0700 (PDT)
In-Reply-To: <1405532597-28262-1-git-send-email-minipli@googlemail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>
Cc: platform-driver-x86@vger.kernel.org, Mathias Krause <minipli@googlemail.com>

The DMI table is only ever used during initialization. Mark it as
__initconst so its memory can be released appropriately. In turn, the
callback function can be marked with __init, too.

Signed-off-by: Mathias Krause <minipli@googlemail.com>
---
 drivers/platform/x86/alienware-wmi.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/alienware-wmi.c b/drivers/platform/x86/alienware-wmi.c
index 297b664021..cdbaf3c532 100644
--- a/drivers/platform/x86/alienware-wmi.c
+++ b/drivers/platform/x86/alienware-wmi.c
@@ -71,13 +71,13 @@ static struct quirk_entry quirk_x51_family = {
 	.num_zones = 3,
 };
 
-static int dmi_matched(const struct dmi_system_id *dmi)
+static int __init dmi_matched(const struct dmi_system_id *dmi)
 {
 	quirks = dmi->driver_data;
 	return 1;
 }
 
-static struct dmi_system_id alienware_quirks[] = {
+static const struct dmi_system_id alienware_quirks[] __initconst = {
 	{
 	 .callback = dmi_matched,
 	 .ident = "Alienware X51 R1",
-- 
1.7.10.4
