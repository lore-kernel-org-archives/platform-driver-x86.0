From: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
Subject: [PATCH] acer-wmi: support Lenovo ideapad S205 10382JG wifi switch
Date: Thu, 30 Aug 2012 10:38:58 +0800
Message-ID: <1346294338-16486-1-git-send-email-jlee@suse.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:37334 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754238Ab2H3Cns (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 29 Aug 2012 22:43:48 -0400
Received: by wgbdr13 with SMTP id dr13so1091383wgb.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 29 Aug 2012 19:43:47 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg@redhat.com
Cc: platform-driver-x86@vger.kernel.org, "Lee, Chun-Yi" <jlee@suse.com>, Ivo Anjo <knuckles@gmail.com>, Carlos Corbacho <carlos@strangeworlds.co.uk>

Found another Lenovo ideapad S205 the product name is 10382JG, it has
a 0x78 EC register exposes the state of wifi hardware switch on the machine.

So, add this patch to support Lenovo ideapad S205-10382JG wifi hardware
switch in acer-wmi driver.

Evidently the Ideapad S205 is just a model name on the market, but they have
totally different product name in DMI table.

Reference: bko#43007
        https://bugzilla.kernel.org/show_bug.cgi?id=43007

Cc: Ivo Anjo <knuckles@gmail.com>
Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>
Cc: Matthew Garrett <mjg@redhat.com>
Signed-off-by: Lee, Chun-Yi <jlee@suse.com>
---
 drivers/platform/x86/acer-wmi.c |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 3782e1c..00d8c39 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -507,6 +507,15 @@ static struct dmi_system_id acer_quirks[] = {
 		},
 		.driver_data = &quirk_fujitsu_amilo_li_1718,
 	},
+	{
+		.callback = dmi_matched,
+		.ident = "Lenovo Ideapad S205-10382JG",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "10382JG"),
+		},
+		.driver_data = &quirk_lenovo_ideapad_s205,
+	},
 	{}
 };
 
-- 
1.6.0.2
