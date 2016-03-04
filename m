From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH v5 2/5] dell-smbios: rename dell_smi_error() to dell_smbios_error()
Date: Fri,  4 Mar 2016 14:09:07 +0100
Message-ID: <1457096950-29838-3-git-send-email-kernel@kempniu.pl>
References: <1456298416-29683-1-git-send-email-kernel@kempniu.pl>
 <1457096950-29838-1-git-send-email-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lb0-f193.google.com ([209.85.217.193]:36425 "EHLO
	mail-lb0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751380AbcCDNIM (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 4 Mar 2016 08:08:12 -0500
Received: by mail-lb0-f193.google.com with SMTP id gn5so4867956lbc.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 04 Mar 2016 05:08:10 -0800 (PST)
In-Reply-To: <1457096950-29838-1-git-send-email-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>
Cc: Darek Stojaczyk <darek.stojaczyk@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

As dell_smi_error() is exported by dell-smbios, its prefix should be
consistent with other exported symbols, so change function name to
dell_smbios_error().

Signed-off-by: Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu.pl>
Acked-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
---
 drivers/platform/x86/dell-laptop.c |   16 ++++++++--------
 drivers/platform/x86/dell-smbios.c |    4 ++--
 drivers/platform/x86/dell-smbios.h |    2 +-
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/=
dell-laptop.c
index cbafb95..2c2f02b 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -433,7 +433,7 @@ static int dell_rfkill_set(void *data, bool blocked=
)
=20
  out:
 	dell_smbios_release_buffer();
-	return dell_smi_error(ret);
+	return dell_smbios_error(ret);
 }
=20
 /* Must be called with the buffer held */
@@ -876,7 +876,7 @@ static int dell_send_intensity(struct backlight_dev=
ice *bd)
 	else
 		dell_smbios_send_request(1, 1);
=20
-	ret =3D dell_smi_error(buffer->output[0]);
+	ret =3D dell_smbios_error(buffer->output[0]);
=20
 	dell_smbios_release_buffer();
 	return ret;
@@ -901,7 +901,7 @@ static int dell_get_intensity(struct backlight_devi=
ce *bd)
 		dell_smbios_send_request(0, 1);
=20
 	if (buffer->output[0])
-		ret =3D dell_smi_error(buffer->output[0]);
+		ret =3D dell_smbios_error(buffer->output[0]);
 	else
 		ret =3D buffer->output[1];
=20
@@ -1160,7 +1160,7 @@ static int kbd_get_info(struct kbd_info *info)
 	ret =3D buffer->output[0];
=20
 	if (ret) {
-		ret =3D dell_smi_error(ret);
+		ret =3D dell_smbios_error(ret);
 		goto out;
 	}
=20
@@ -1249,7 +1249,7 @@ static int kbd_get_state(struct kbd_state *state)
 	ret =3D buffer->output[0];
=20
 	if (ret) {
-		ret =3D dell_smi_error(ret);
+		ret =3D dell_smbios_error(ret);
 		goto out;
 	}
=20
@@ -1286,7 +1286,7 @@ static int kbd_set_state(struct kbd_state *state)
 	ret =3D buffer->output[0];
 	dell_smbios_release_buffer();
=20
-	return dell_smi_error(ret);
+	return dell_smbios_error(ret);
 }
=20
 static int kbd_set_state_safe(struct kbd_state *state, struct kbd_stat=
e *old)
@@ -1329,7 +1329,7 @@ static int kbd_set_token_bit(u8 bit)
 	ret =3D buffer->output[0];
 	dell_smbios_release_buffer();
=20
-	return dell_smi_error(ret);
+	return dell_smbios_error(ret);
 }
=20
 static int kbd_get_token_bit(u8 bit)
@@ -1354,7 +1354,7 @@ static int kbd_get_token_bit(u8 bit)
 	dell_smbios_release_buffer();
=20
 	if (ret)
-		return dell_smi_error(ret);
+		return dell_smbios_error(ret);
=20
 	return (val =3D=3D token->value);
 }
diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x86/=
dell-smbios.c
index 942572f..d2412ab 100644
--- a/drivers/platform/x86/dell-smbios.c
+++ b/drivers/platform/x86/dell-smbios.c
@@ -40,7 +40,7 @@ static int da_command_code;
 static int da_num_tokens;
 static struct calling_interface_token *da_tokens;
=20
-int dell_smi_error(int value)
+int dell_smbios_error(int value)
 {
 	switch (value) {
 	case 0: /* Completed successfully */
@@ -53,7 +53,7 @@ int dell_smi_error(int value)
 		return -EINVAL;
 	}
 }
-EXPORT_SYMBOL_GPL(dell_smi_error);
+EXPORT_SYMBOL_GPL(dell_smbios_error);
=20
 struct calling_interface_buffer *dell_smbios_get_buffer(void)
 {
diff --git a/drivers/platform/x86/dell-smbios.h b/drivers/platform/x86/=
dell-smbios.h
index 52febe6..ec7d40a 100644
--- a/drivers/platform/x86/dell-smbios.h
+++ b/drivers/platform/x86/dell-smbios.h
@@ -35,7 +35,7 @@ struct calling_interface_token {
 	};
 };
=20
-int dell_smi_error(int value);
+int dell_smbios_error(int value);
=20
 struct calling_interface_buffer *dell_smbios_get_buffer(void);
 void dell_smbios_clear_buffer(void);
--=20
1.7.10.4
