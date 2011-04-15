From: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
Subject: [PATCH] acer-wmi: does not allow negative number set to initial device state
Date: Fri, 15 Apr 2011 18:42:47 +0800
Message-ID: <1302864167-9186-1-git-send-email-jlee@novell.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-px0-f179.google.com ([209.85.212.179]:40889 "EHLO
	mail-px0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755631Ab1DOKnF (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 15 Apr 2011 06:43:05 -0400
Received: by pxi2 with SMTP id 2so1521910pxi.10
        for <platform-driver-x86@vger.kernel.org>; Fri, 15 Apr 2011 03:43:04 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: carlos@strangeworlds.co.uk
Cc: platform-driver-x86@vger.kernel.org, "Lee, Chun-Yi" <jlee@novell.com>, Matthew Garrett <mjg@redhat.com>, Dmitry Torokhov <dtor@mail.ru>, Corentin Chary <corentincj@iksaif.net>

The driver set module parameter value: mailled, threeg and brightness
to BIOS by evaluate wmi method when driver was initialed. The default
values for those parameters are -1, so, that will be better don't set
negative value to BIOS.

Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>
Cc: Matthew Garrett <mjg@redhat.com>
Cc: Dmitry Torokhov <dtor@mail.ru>
Cc: Corentin Chary <corentincj@iksaif.net>
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
