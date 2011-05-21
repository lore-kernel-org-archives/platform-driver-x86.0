From: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
Subject: [PATCH 1/4] acer-wmi: does not allow negative number set to initial device state
Date: Sun, 22 May 2011 07:33:51 +0800
Message-ID: <1306020834-5186-2-git-send-email-jlee@novell.com>
References: <1306020834-5186-1-git-send-email-jlee@novell.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:40180 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757333Ab1EUXfT (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 21 May 2011 19:35:19 -0400
Received: by pwi15 with SMTP id 15so2192915pwi.19
        for <platform-driver-x86@vger.kernel.org>; Sat, 21 May 2011 16:35:19 -0700 (PDT)
In-Reply-To: <1306020834-5186-1-git-send-email-jlee@novell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg@redhat.com
Cc: platform-driver-x86@vger.kernel.org, "Lee, Chun-Yi" <jlee@novell.com>, Carlos Corbacho <carlos@strangeworlds.co.uk>, Dmitry Torokhov <dtor@mail.ru>, Corentin Chary <corentincj@iksaif.net>, Thomas Renninger <trenn@suse.de>

The driver set module parameter value: mailled, threeg and brightness
to BIOS by evaluate wmi method when driver was initialled. The default
values for those parameters are -1, so, that will be better don't set
negative value to BIOS.

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
 drivers/platform/x86/acer-wmi.c |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index ac4e7f8..c3cb603 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -961,10 +961,12 @@ static void __init acer_commandline_init(void)
 	 * These will all fail silently if the value given is invalid, or the
 	 * capability isn't available on the given interface
 	 */
-	set_u32(mailled, ACER_CAP_MAILLED);
-	if (!has_type_aa)
+	if (mailled >= 0)
+		set_u32(mailled, ACER_CAP_MAILLED);
+	if (!has_type_aa && threeg >= 0)
 		set_u32(threeg, ACER_CAP_THREEG);
-	set_u32(brightness, ACER_CAP_BRIGHTNESS);
+	if (brightness >= 0)
+		set_u32(brightness, ACER_CAP_BRIGHTNESS);
 }
 
 /*
-- 
1.6.0.2
