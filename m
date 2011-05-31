From: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
Subject: [PATCH] acer-wmi: fix bitwise bug when set device state
Date: Tue, 31 May 2011 14:20:11 +0800
Message-ID: <1306822811-26152-1-git-send-email-jlee@novell.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:48130 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757055Ab1EaGWF (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 31 May 2011 02:22:05 -0400
Received: by vws1 with SMTP id 1so3035956vws.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 30 May 2011 23:22:03 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg@redhat.com
Cc: platform-driver-x86@vger.kernel.org, "Lee, Chun-Yi" <jlee@novell.com>, Carlos Corbacho <carlos@strangeworlds.co.uk>, Dmitry Torokhov <dtor@mail.ru>, Corentin Chary <corentincj@iksaif.net>, Thomas Renninger <trenn@suse.de>

Fix a bitwise bug that was found by Joern Heissler, it must be OR
but not AND when we query current device state.

Acked-by: Joern Heissler <linux-acpi@joern.heissler.de>
Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>
Cc: Matthew Garrett <mjg@redhat.com>
Cc: Dmitry Torokhov <dtor@mail.ru>
Cc: Corentin Chary <corentincj@iksaif.net>
Cc: Thomas Renninger <trenn@suse.de>
Signed-off-by: Lee, Chun-Yi <jlee@novell.com>
---
 drivers/platform/x86/acer-wmi.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 005417b..7d4675a 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -1156,9 +1156,9 @@ static acpi_status wmid3_set_device_status(u32 value, u16 device)
 	struct wmid3_gds_input_param params = {
 		.function_num = 0x1,
 		.hotkey_number = 0x01,
-		.devices = ACER_WMID3_GDS_WIRELESS &
-				ACER_WMID3_GDS_THREEG &
-				ACER_WMID3_GDS_WIMAX &
+		.devices = ACER_WMID3_GDS_WIRELESS |
+				ACER_WMID3_GDS_THREEG |
+				ACER_WMID3_GDS_WIMAX |
 				ACER_WMID3_GDS_BLUETOOTH,
 	};
 	struct acpi_buffer input = {
-- 
1.6.0.2
