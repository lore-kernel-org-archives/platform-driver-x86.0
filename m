From: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
Subject: [RESEND][PATCH 2/5] acer-wmi: support Lenovo ideapad S205 10382JG wifi switch
Date: Fri, 14 Dec 2012 16:10:06 +0800
Message-ID: <1355472609-9957-2-git-send-email-jlee@suse.com>
References: <1355472609-9957-1-git-send-email-jlee@suse.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ie0-f174.google.com ([209.85.223.174]:61867 "EHLO
	mail-ie0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753296Ab2LNIL3 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 14 Dec 2012 03:11:29 -0500
Received: by mail-ie0-f174.google.com with SMTP id c11so5409010ieb.19
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Dec 2012 00:11:29 -0800 (PST)
In-Reply-To: <1355472609-9957-1-git-send-email-jlee@suse.com>
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

Tested-by: Ivo Anjo <knuckles@gmail.com>
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
index 934d861..07d5f96 100644
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
