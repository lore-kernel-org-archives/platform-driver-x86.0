From: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: [PATCH] acer-wmi: Fix WMI ID
Date: Sat, 26 Feb 2011 21:20:19 +0100
Message-ID: <AANLkTimNT2s_fxsE_uwq=xJeJXTRh1ts_YTU1vk7Vq51@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:57618 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752393Ab1BZUU7 convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 26 Feb 2011 15:20:59 -0500
Received: by iwn34 with SMTP id 34so2021528iwn.19
        for <platform-driver-x86@vger.kernel.org>; Sat, 26 Feb 2011 12:20:59 -0800 (PST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, carlos@strangeworlds.co.uk

This patch change WMI ID to upper characters. With this patch module
acer-wmi is automatically loaded when WMI ID is detected.

Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
Tested-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>

--- a/drivers/platform/x86/acer-wmi.c	2011-01-30 00:28:04.000000000 +01=
00
+++ b/drivers/platform/x86/acer-wmi.c	2011-01-30 01:30:02.000000000 +01=
00
@@ -91,11 +91,11 @@ struct acer_quirks {
  */
 #define AMW0_GUID1		"67C3371D-95A3-4C37-BB61-DD47B491DAAB"
 #define AMW0_GUID2		"431F16ED-0C2B-444C-B267-27DEB140CF9C"
-#define WMID_GUID1		"6AF4F258-B401-42fd-BE91-3D4AC2D7C0D3"
-#define WMID_GUID2		"95764E09-FB56-4e83-B31A-37761F60994A"
+#define WMID_GUID1		"6AF4F258-B401-42FD-BE91-3D4AC2D7C0D3"
+#define WMID_GUID2		"95764E09-FB56-4E83-B31A-37761F60994A"

 MODULE_ALIAS("wmi:67C3371D-95A3-4C37-BB61-DD47B491DAAB");
-MODULE_ALIAS("wmi:6AF4F258-B401-42fd-BE91-3D4AC2D7C0D3");
+MODULE_ALIAS("wmi:6AF4F258-B401-42FD-BE91-3D4AC2D7C0D3");

 /*
  * Interface capability flags


--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
