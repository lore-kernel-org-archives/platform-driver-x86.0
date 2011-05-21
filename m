From: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
Subject: [PATCH 2/4] acer-wmi: check the existence of internal 3G device when set capability
Date: Sun, 22 May 2011 07:33:52 +0800
Message-ID: <1306020834-5186-3-git-send-email-jlee@novell.com>
References: <1306020834-5186-1-git-send-email-jlee@novell.com>
 <1306020834-5186-2-git-send-email-jlee@novell.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:40865 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757263Ab1EUXfW (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 21 May 2011 19:35:22 -0400
Received: by mail-pz0-f46.google.com with SMTP id 9so2153807pzk.19
        for <platform-driver-x86@vger.kernel.org>; Sat, 21 May 2011 16:35:21 -0700 (PDT)
In-Reply-To: <1306020834-5186-2-git-send-email-jlee@novell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg@redhat.com
Cc: platform-driver-x86@vger.kernel.org, "Lee, Chun-Yi" <jlee@novell.com>, Carlos Corbacho <carlos@strangeworlds.co.uk>, Dmitry Torokhov <dtor@mail.ru>, Corentin Chary <corentincj@iksaif.net>, Thomas Renninger <trenn@suse.de>

That will be better to check the existence of internal 3G device when
we set threeg capability and generate killswitch for threeg. It can
avoid userland access 3G rfkill but the machine doesn't have internal
3G device.

Reference: bko#32862
	https://bugzilla.kernel.org/show_bug.cgi?id=32862

Tested on Acer Aspire 8930G, Acer Travelmate 8572

Tested-by: Hector Martin <hector@marcansoft.com>
Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>
Cc: Matthew Garrett <mjg@redhat.com>
Cc: Dmitry Torokhov <dtor@mail.ru>
Cc: Corentin Chary <corentincj@iksaif.net>
Cc: Thomas Renninger <trenn@suse.de>
Signed-off-by: Lee, Chun-Yi <jlee@novell.com>
---
 drivers/platform/x86/acer-wmi.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index c3cb603..6c4716d 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -876,7 +876,8 @@ static acpi_status WMID_set_capabilities(void)
 	dmi_walk(type_aa_dmi_decode, NULL);
 	if (!has_type_aa) {
 		interface->capability |= ACER_CAP_WIRELESS;
-		interface->capability |= ACER_CAP_THREEG;
+		if (devices & 0x40)
+			interface->capability |= ACER_CAP_THREEG;
 		if (devices & 0x10)
 			interface->capability |= ACER_CAP_BLUETOOTH;
 	}
-- 
1.6.0.2
