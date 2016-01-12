From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 08/14] dell-smbios: implement new function for finding DMI table 0xDA tokens
Date: Tue, 12 Jan 2016 15:02:54 +0100
Message-ID: <1452607380-20861-9-git-send-email-kernel@kempniu.pl>
References: <1452607380-20861-1-git-send-email-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:34040 "EHLO
	mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934705AbcALOD3 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 12 Jan 2016 09:03:29 -0500
Received: by mail-lf0-f66.google.com with SMTP id n70so21069080lfn.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 12 Jan 2016 06:03:28 -0800 (PST)
In-Reply-To: <1452607380-20861-1-git-send-email-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Alex Hung <alex.hung@canonical.com>, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

Ultimately, the da_tokens table should not be exported from dell-smbios=
=2E
Currently, in some cases, dell-laptop accesses that table's members
directly, so implement a new function, dell_smbios_find_token(), which
returns a pointer to an entry inside the da_tokens table with the given
token ID (or NULL if it is not found).

Signed-off-by: Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu.pl>
---
 drivers/platform/x86/dell-smbios.c |   13 +++++++++++++
 drivers/platform/x86/dell-smbios.h |    2 ++
 2 files changed, 15 insertions(+)

diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x86/=
dell-smbios.c
index 597a29f..83e35ed 100644
--- a/drivers/platform/x86/dell-smbios.c
+++ b/drivers/platform/x86/dell-smbios.c
@@ -59,6 +59,19 @@ void dell_smbios_release_buffer(void)
 }
 EXPORT_SYMBOL_GPL(dell_smbios_release_buffer);
=20
+struct calling_interface_token *dell_smbios_find_token(int tokenid)
+{
+	int i;
+
+	for (i =3D 0; i < da_num_tokens; i++) {
+		if (da_tokens[i].tokenID =3D=3D tokenid)
+			return &da_tokens[i];
+	}
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(dell_smbios_find_token);
+
 int find_token_id(int tokenid)
 {
 	int i;
diff --git a/drivers/platform/x86/dell-smbios.h b/drivers/platform/x86/=
dell-smbios.h
index 5ccc0ea..23f6e95 100644
--- a/drivers/platform/x86/dell-smbios.h
+++ b/drivers/platform/x86/dell-smbios.h
@@ -42,6 +42,8 @@ void dell_smbios_clear_buffer(void);
 void dell_smbios_get_buffer(void);
 void dell_smbios_release_buffer(void);
=20
+struct calling_interface_token *dell_smbios_find_token(int tokenid);
+
 int find_token_id(int tokenid);
 int find_token_location(int tokenid);
=20
--=20
1.7.10.4
