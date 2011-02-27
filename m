From: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] acer-wmi: Fix WMI ID
Date: Sun, 27 Feb 2011 12:06:12 +0100
Message-ID: <AANLkTikz1GqqqMOhp3L6=ExLb0GU+uAOaCgFsHm1s3EN@mail.gmail.com>
References: <AANLkTimNT2s_fxsE_uwq=xJeJXTRh1ts_YTU1vk7Vq51@mail.gmail.com> <201102271031.06527.carlos@strangeworlds.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:38977 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752111Ab1B0LGw convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 27 Feb 2011 06:06:52 -0500
Received: by iwn34 with SMTP id 34so2311668iwn.19
        for <platform-driver-x86@vger.kernel.org>; Sun, 27 Feb 2011 03:06:52 -0800 (PST)
In-Reply-To: <201102271031.06527.carlos@strangeworlds.co.uk>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Carlos Corbacho <carlos@strangeworlds.co.uk>
Cc: platform-driver-x86@vger.kernel.org

This patch change WMI ID to upper characters. With this patch module
acer-wmi is automatically loaded when WMI ID is detected.

Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
Tested-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>

--- a/drivers/platform/x86/acer-wmi.c	2011-02-27 11:53:50.000000000 +01=
00
+++ b/drivers/platform/x86/acer-wmi.c	2011-02-27 11:58:30.000000000 +01=
00
@@ -84,8 +84,8 @@ MODULE_LICENSE("GPL");
  */
 #define AMW0_GUID1		"67C3371D-95A3-4C37-BB61-DD47B491DAAB"
 #define AMW0_GUID2		"431F16ED-0C2B-444C-B267-27DEB140CF9C"
-#define WMID_GUID1		"6AF4F258-B401-42fd-BE91-3D4AC2D7C0D3"
-#define WMID_GUID2		"95764E09-FB56-4e83-B31A-37761F60994A"
+#define WMID_GUID1		"6AF4F258-B401-42FD-BE91-3D4AC2D7C0D3"
+#define WMID_GUID2		"95764E09-FB56-4E83-B31A-37761F60994A"
 #define WMID_GUID3		"61EF69EA-865C-4BC3-A502-A0DEBA0CB531"

 /*
@@ -94,7 +94,7 @@ MODULE_LICENSE("GPL");
 #define ACERWMID_EVENT_GUID "676AA15E-6A47-4D9F-A2CC-1E6D18D14026"

 MODULE_ALIAS("wmi:67C3371D-95A3-4C37-BB61-DD47B491DAAB");
-MODULE_ALIAS("wmi:6AF4F258-B401-42fd-BE91-3D4AC2D7C0D3");
+MODULE_ALIAS("wmi:6AF4F258-B401-42FD-BE91-3D4AC2D7C0D3");
 MODULE_ALIAS("wmi:676AA15E-6A47-4D9F-A2CC-1E6D18D14026");

 enum acer_wmi_event_ids {


--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
