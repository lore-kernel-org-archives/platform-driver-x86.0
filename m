From: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
Subject: [PATCH 1/3] acer-wmi: support Lenovo ideapad S205 10382JG wifi switch
Date: Tue, 25 Sep 2012 14:40:54 +0800
Message-ID: <1348555256-13129-1-git-send-email-jlee@suse.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qa0-f53.google.com ([209.85.216.53]:62462 "EHLO
	mail-qa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751773Ab2IYGrR (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 25 Sep 2012 02:47:17 -0400
Received: by qaat11 with SMTP id t11so1522172qaa.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Sep 2012 23:47:16 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg@redhat.com
Cc: platform-driver-x86@vger.kernel.org, "Lee, Chun-Yi" <jlee@suse.com>, Carlos Corbacho <carlos@strangeworlds.co.uk>, Dmitry Torokhov <dtor@mail.ru>, Corentin Chary <corentincj@iksaif.net>, Thomas Renninger <trenn@suse.de>

Found another Lenovo ideapad S205 the product name is 10382JG, it has
a 0x78 EC register exposes the state of wifi hardware switch on the machine.

So, add this patch to support Lenovo ideapad S205-10382JG wifi hardware
switch in acer-wmi driver.

Evidently the Ideapad S205 is just a model name on the market, but they have
totally different product name in DMI table.

Reference: bko#43007
        https://bugzilla.kernel.org/show_bug.cgi?id=43007

Tested-by: Ivo Anjo<knuckles@gmail.com>
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
