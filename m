From: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
Subject: [PATCH] Add Lenovo Ideapad S12 to acer blacklist
Date: Thu, 30 Dec 2010 09:32:54 +0800
Message-ID: <1293672774-13563-1-git-send-email-jlee@novell.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:62292 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754182Ab0L3BfV (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 29 Dec 2010 20:35:21 -0500
Received: by vws16 with SMTP id 16so4310813vws.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 29 Dec 2010 17:35:20 -0800 (PST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: "Lee, Chun-Yi" <jlee@novell.com>, Carlos Corbacho <carlos@strangeworlds.co.uk>, Thomas Renninger <trenn@suse.de>, Dmitry Torokhov <dtor@mail.ru>, Corentin Chary <corentincj@iksaif.net>, Matthew Garrett <mjg59@srcf.ucam.org>

The Lenovo Ideapad S12's _WDG have GUID that matches with AMW0, it causes
acer-wmi driver auto-probe when system boot but there already have
ideapad-laptop driver to support Ideapad serial.
So, add Lenovo Ideapad S12 to acer blacklist to disable it.

Signed-off-by: Lee, Chun-Yi <jlee@novell.com>
Tested-by: Ville-Pekka Vainio <vpivaini@cs.helsinki.fi>
Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>
Cc: Thomas Renninger <trenn@suse.de>
Cc: Dmitry Torokhov <dtor@mail.ru>
Cc: Corentin Chary <corentincj@iksaif.net>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>
---
 drivers/platform/x86/acer-wmi.c |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 28288ad..387ac7c 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -310,6 +310,17 @@ static struct dmi_system_id __devinitdata acer_blacklist[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "AOA150"),
 		},
 	},
+	/*
+	 * The Lenovo Ideapad S12 have GUID that matches with AMW0 - disable it.
+	 * There already have ideapad-laptop driver to support Ideapad serial.
+	 */
+	{
+		.ident = "Lenovo Ideapad S12",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "20021,2959"),
+		},
+	},
 	{}
 };
 
-- 
1.6.0.2
