From: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
Subject: [PATCH] acer-wmi: support Lenovo ideapad S205 1038DPG wifi switch
Date: Tue, 23 Oct 2012 10:52:00 +0800
Message-ID: <1350960720-21489-1-git-send-email-jlee@suse.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-vc0-f174.google.com ([209.85.220.174]:57308 "EHLO
	mail-vc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756477Ab2JWCwR (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 22 Oct 2012 22:52:17 -0400
Received: by mail-vc0-f174.google.com with SMTP id fk26so3740891vcb.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 22 Oct 2012 19:52:16 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg@redhat.com
Cc: platform-driver-x86@vger.kernel.org, "Lee, Chun-Yi" <jlee@suse.com>, Carlos Corbacho <carlos@strangeworlds.co.uk>, Dmitry Torokhov <dtor@mail.ru>, Corentin Chary <corentincj@iksaif.net>, Thomas Renninger <trenn@suse.de>

Found another Lenovo ideapad S205 the product name is 1038DPG, it has
a 0x78 EC register exposes the state of wifi hardware switch on the machine.

So, add this patch to support Lenovo ideapad S205-1038DPG wifi hardware
switch in acer-wmi driver.

Evidently the Ideapad S205 is just a model name on the market, but they have
totally different product name in DMI table.

Reference: bko#43007
        https://bugzilla.kernel.org/show_bug.cgi?id=43007

Tested-by: Colin <colin.newell@gmail.com>
Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>
Cc: Matthew Garrett <mjg@redhat.com>
Cc: Dmitry Torokhov <dtor@mail.ru>
Cc: Corentin Chary <corentincj@iksaif.net>
Cc: Thomas Renninger <trenn@suse.de>
Signed-off-by: Lee, Chun-Yi <jlee@suse.com>
---
 drivers/platform/x86/acer-wmi.c |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 6365aeb..30db533 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -519,6 +519,15 @@ static struct dmi_system_id acer_quirks[] = {
 		},
 		.driver_data = &quirk_lenovo_ideapad_s205,
 	},
+	{
+		.callback = dmi_matched,
+		.ident = "Lenovo Ideapad S205-1038DPG",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "1038DPG"),
+		},
+		.driver_data = &quirk_lenovo_ideapad_s205,
+	},
 	{}
 };
 
-- 
1.6.0.2
