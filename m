From: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
Subject: [PATCH 3/3] acer-wmi: check the existence of internal wireless device when set capability
Date: Thu, 18 Aug 2011 18:47:34 +0800
Message-ID: <1313664454-2762-3-git-send-email-jlee@suse.com>
References: <1313664454-2762-1-git-send-email-jlee@suse.com>
 <1313664454-2762-2-git-send-email-jlee@suse.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-yi0-f46.google.com ([209.85.218.46]:45457 "EHLO
	mail-yi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750785Ab1HRKv0 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 18 Aug 2011 06:51:26 -0400
Received: by yie30 with SMTP id 30so1373823yie.19
        for <platform-driver-x86@vger.kernel.org>; Thu, 18 Aug 2011 03:51:25 -0700 (PDT)
In-Reply-To: <1313664454-2762-2-git-send-email-jlee@suse.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg@redhat.com
Cc: platform-driver-x86@vger.kernel.org, "Lee, Chun-Yi" <jlee@suse.com>, Carlos Corbacho <carlos@strangeworlds.co.uk>, Dmitry Torokhov <dtor@mail.ru>, Corentin Chary <corentincj@iksaif.net>, Thomas Renninger <trenn@suse.de>

That will be better to check the existence of internal wireless device
when we set wireless capability and generate killswitch for it. It can
avoid userland access wireless rfkill but the machine doesn't have internal
wireless device.

Tested on Acer Travelmate 8572

Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>
Cc: Matthew Garrett <mjg@redhat.com>
Cc: Dmitry Torokhov <dtor@mail.ru>
Cc: Corentin Chary <corentincj@iksaif.net>
Cc: Thomas Renninger <trenn@suse.de>
Signed-off-by: Lee, Chun-Yi <jlee@suse.com>
---
 drivers/platform/x86/acer-wmi.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index b663334..5130c63 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -1085,7 +1085,9 @@ static acpi_status WMID_set_capabilities(void)
 		return AE_ERROR;
 	}
 
-	interface->capability |= ACER_CAP_WIRELESS;
+	pr_info("Function bitmap for Communication Device: 0x%x\n", devices);
+	if (devices & 0x07)
+		interface->capability |= ACER_CAP_WIRELESS;
 	if (devices & 0x40)
 		interface->capability |= ACER_CAP_THREEG;
 	if (devices & 0x10)
-- 
1.6.0.2
