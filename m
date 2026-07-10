Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF72C4071CB;
	Fri, 10 Jul 2026 22:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783722724; cv=none; b=s4Rwr9UPZ9BT1E8fcJFqDgrme8ASdKRBCw6fapjxDUrhuMfMDEKFczczkF7J9aKlxmlT07nD17MWmNXm/LMOErio1/MMn15Ci0LJJ6GhAPm2MHEfOQg52f+eDqPafT7CHpb5sxYprEFZEaKY3Vzl8x49WMpGkfAbaOZYqiZSAYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783722724; c=relaxed/simple;
	bh=us60CslZV0ZYLYnM9DQyc7gELxZLPAhiEBLE4Nsl+DE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CUmTKtmHYV8pGDoCG8/kGTHQgkt4w04VZHV5o169ISEakSnlzAu4RY6ggAJ8rMqkoVmxnGEzfw4RZfPWJmCVxg1iYeFY+YD23k3dt1AHAhvrDkuUF402fj9CtnomJz3mLTkkXn+ArLaFtzSA7XXd2vFMlN9J0wEvtGz/RtMRNbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=ncTnAaoV; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="ncTnAaoV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1783722717; x=1784327517; i=w_armin@gmx.de;
	bh=qDkQfwDv31g36mIn5YUHrHHdN5ygiuVvG3jbyH7+jvU=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ncTnAaoVCp08wC7K59JZZlLZtGYk3DWj+cITlc0wRlEhljfroPc9BRnBsY36J4xi
	 VCxRhbyaY3POLwXYYBk7CGzRB8GAzfz24TSadCNzusWYiH3qaQw7OHKKucFKkZoPH
	 Ff38NmkdIy1766Bz4Lo8H2kENpRmFSo4C4WYgKGLoYFFUBcyhTqkNqY79yamwxzoK
	 MEuk8Z+xs10p7cMvZvRO0GqFqFSftb4KQs8e1e8ldAudf1HxeWUiB6Q0D56evd8sb
	 u9bW2hZ1shdkzkcBFt4nJoNwhjTTgS+EDeMPLn1tawzFiC+wNNLmlOtoCYlyTUSYv
	 VMIQwVJT/yAtJTdI4w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M1Ycl-1wknfK1Thr-006Ra8; Sat, 11
 Jul 2026 00:31:57 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	wse@tuxedocomputers.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] platform/x86: uniwill-laptop: Make KBD_LED_MAX_INTENSITY configurable
Date: Sat, 11 Jul 2026 00:31:50 +0200
Message-Id: <20260710223150.48661-4-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260710223150.48661-1-W_Armin@gmx.de>
References: <20260710223150.48661-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:eW4gZhtNtJ/QSkLbbRgWFP35lopEePjrE2qfiOXFbl0h84ur0Gh
 MFJRkmWO66AN5FibhEBnAgXuAyTyrSKs/D2dPcHt0pOv8mIUKqvIxqVPd3ubl0FtamVI4EY
 tehmUUfVcWasYoMDIddwBqjr4Gui1LfcpFKpALFgkR/L6PBCEb6Jll+Dr9n9bErMsEpXFc7
 jS6zmmH+aKLCuv9Ni/G7g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:YFPpMz/I4Ug=;LNoxQ+twgSwC1/AdFxC2U1G7dZm
 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

Some (yet to be enabled) Tuxedo devices have a maximum intensity of
200 instead of the default 50. Remove the hardcoded maximum intensity
and use the device descriptor instead.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/uniwill/uniwill-acpi.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platfor=
m/x86/uniwill/uniwill-acpi.c
index 4591ee299a90..5b8e35bf9a51 100644
=2D-- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -351,7 +351,6 @@
 #define LED_CHANNELS		3
=20
 #define KBD_LED_CHANNELS	3
-#define KBD_LED_MAX_INTENSITY	50
=20
 #define UNIWILL_FEATURE_FN_LOCK			BIT(0)
 #define UNIWILL_FEATURE_SUPER_KEY		BIT(1)
@@ -403,6 +402,7 @@ struct uniwill_data {
 	struct mc_subled led_mc_subled_info[LED_CHANNELS];
 	bool kbd_led_single_color;
 	u8 kbd_led_max_brightness;
+	u8 kbd_led_max_intensity;
 	unsigned int last_kbd_status;
 	union {
 		struct {
@@ -429,6 +429,7 @@ struct uniwill_device_descriptor {
 	unsigned int features;
 	bool kbd_led_single_color;
 	u8 kbd_led_max_brightness;
+	u8 kbd_led_max_intensity;
 	u8 lightbar_max_brightness;
 	/* Executed during driver probing */
 	int (*probe)(struct uniwill_data *data);
@@ -1780,8 +1781,8 @@ static int uniwill_rgb_kbd_led_init(struct uniwill_d=
ata *data)
 		 * Make sure that the initial intensity value is not greater than
 		 * the maximum intensity.
 		 */
-		if (regval > KBD_LED_MAX_INTENSITY) {
-			regval =3D KBD_LED_MAX_INTENSITY;
+		if (regval > data->kbd_led_max_intensity) {
+			regval =3D data->kbd_led_max_intensity;
 			ret =3D regmap_write(data->regmap, uniwill_kbd_led_channel_to_reg[i], =
regval);
 			if (ret < 0)
 				return ret;
@@ -1793,7 +1794,7 @@ static int uniwill_rgb_kbd_led_init(struct uniwill_d=
ata *data)
 			intensity_all_zeros =3D false;
=20
 		data->kbd_led_mc_subled_info[i].intensity =3D regval;
-		data->kbd_led_mc_subled_info[i].max_intensity =3D KBD_LED_MAX_INTENSITY=
;
+		data->kbd_led_mc_subled_info[i].max_intensity =3D data->kbd_led_max_int=
ensity;
 		data->kbd_led_mc_subled_info[i].channel =3D i;
 	}
=20
@@ -2338,6 +2339,7 @@ static int uniwill_probe(struct platform_device *pde=
v)
 	data->features =3D device_descriptor.features;
 	data->kbd_led_single_color =3D device_descriptor.kbd_led_single_color;
 	data->kbd_led_max_brightness =3D device_descriptor.kbd_led_max_brightnes=
s;
+	data->kbd_led_max_intensity =3D device_descriptor.kbd_led_max_intensity;
 	data->lightbar_max_brightness =3D device_descriptor.lightbar_max_brightn=
ess;
=20
 	/*
@@ -2675,6 +2677,7 @@ static struct uniwill_device_descriptor machenike_l1=
6p_descriptor __initdata =3D {
 		    UNIWILL_FEATURE_USB_POWERSHARE,
 	.kbd_led_single_color =3D false,
 	.kbd_led_max_brightness =3D 4,
+	.kbd_led_max_intensity =3D 50,
 };
=20
 static struct uniwill_device_descriptor lapqc71a_lapqc71b_descriptor __in=
itdata =3D {
@@ -2858,6 +2861,7 @@ static struct uniwill_device_descriptor x4sp4nal_des=
criptor __initdata =3D {
 		    UNIWILL_FEATURE_USB_POWERSHARE,
 	.kbd_led_single_color =3D true,
 	.kbd_led_max_brightness =3D 2,
+	.kbd_led_max_intensity =3D 50,
 };
=20
 static const struct dmi_system_id uniwill_dmi_table[] __initconst =3D {
@@ -3355,6 +3359,7 @@ static int __init uniwill_init(void)
 		device_descriptor.kbd_led_single_color =3D false;
 		/* Some models only support 3 brightness levels */
 		device_descriptor.kbd_led_max_brightness =3D 4;
+		device_descriptor.kbd_led_max_intensity =3D 50;
 		/* Some models only support 36 brightness levels per color component */
 		device_descriptor.lightbar_max_brightness =3D 200;
 		pr_warn("Enabling potentially unsupported features\n");
=2D-=20
2.39.5

