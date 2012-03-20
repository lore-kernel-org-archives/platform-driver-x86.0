From: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
Subject: [PATCH] acer-wmi: support Lenovo ideapad S205 Brazos wifi switch
Date: Tue, 20 Mar 2012 11:32:49 +0800
Message-ID: <1332214369-13691-1-git-send-email-jlee@suse.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:49425 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758285Ab2CTDee (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 19 Mar 2012 23:34:34 -0400
Received: by yenl12 with SMTP id l12so6003880yen.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Mar 2012 20:34:34 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg@redhat.com
Cc: platform-driver-x86@vger.kernel.org, "Lee, Chun-Yi" <jlee@suse.com>, Carlos Corbacho <carlos@strangeworlds.co.uk>, Dmitry Torokhov <dtor@mail.ru>, Corentin Chary <corentincj@iksaif.net>, Thomas Renninger <trenn@suse.de>

From: "Lee, Chun-Yi" <jlee@suse.com>

Vaclav found a new ideapad S205 Brazos machine that used the same
EC register of wireless with S205 but has different product name.

So, add this machine to quirk for support wireless rfkill.

Tested on Lenovo ideapad S205 Brazos


Tested-by: Vaclav Mocek <vmocek@gmail.com>
Acked-by: Ike Panhc <ike.pan@canonical.com>
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
index 1e5290b..7822e33 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -468,6 +468,15 @@ static struct dmi_system_id acer_quirks[] = {
 	},
 	{
 		.callback = dmi_matched,
+		.ident = "Lenovo Ideapad S205 (Brazos)",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Brazos"),
+		},
+		.driver_data = &quirk_lenovo_ideapad_s205,
+	},
+	{
+		.callback = dmi_matched,
 		.ident = "Lenovo 3000 N200",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
-- 
1.7.7
