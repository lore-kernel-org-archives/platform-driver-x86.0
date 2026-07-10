Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E32322B7B;
	Fri, 10 Jul 2026 22:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783722952; cv=none; b=UoaXUyTbHICSF4ySKRLXl0f7rFdGRqZRU6if+9aeBUKrIJY0+32cHjHQJmOo2FJMii3WgxWsiw2a1yTftEcRRvd2WDsq+1v5ROB2Gp1u0dbNxNSN+YZnQM0qyRSiFh5URznrqJHLc/rC9m1unhoPSkAcbpzTJ/A7DieNtnyxxgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783722952; c=relaxed/simple;
	bh=crH1lcEX5gM4sr4rThWxerFikylT7F18VPZ1fHz0cjM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=quMPW3kAW3Fc1mpCXXKjFWqFUGaB2CrzdtEpAAiMSISXmlTMbtkoLsHX1W+vUrkchbusNnhCoecJmdZw3/9m01srD5FtdKAIf+y7LhL/hopkOLHAWMKAXroqVCRavgkFoIyCD6bZi3B/dtJbRc5ZIOjBr6xxJ286IrF46Mk+rk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=NRUX19oL; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="NRUX19oL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1783722948; x=1784327748; i=w_armin@gmx.de;
	bh=/MzZo6wQBWEixB07KZULa2AV/kQkv8/H2myB25VP/OA=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=NRUX19oL7MGBysU+n2jHwu9/lj//RWtnsFGpKAXspSydhV8OUsDMfrWKWkH6sAab
	 Q64tEMNlqXAhwLlUjpAklg9areE+YMRwsA2OHVBRZpEkeQmEwm2eEiLWBQF25k2cT
	 H7rAscu4Tb9aoYJyblUljTTIKW154LSzdy21lSot21iwuBH7ikY+AcLV52Aq32xCA
	 FRVmEfE1niOgFt/KvasiEwm7tL8s187LdgWqNQ/QvkvlIckf4br5EeKzKa+79le13
	 dSD8JHO0qXuFK+K920eMQCtW8tx0nlq1WOg4WMyNSDWjwBl0ppyCocB+X3OFomPca
	 28TpYFj26niaBf60Sw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M2wKq-1wldCy0IiS-004VVp; Sat, 11
 Jul 2026 00:35:48 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	wse@tuxedocomputers.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] platform/x86: uniwill-laptop: Make KBD_LED_MAX_INTENSITY configurable
Date: Sat, 11 Jul 2026 00:35:44 +0200
Message-Id: <20260710223544.49602-4-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260710223544.49602-1-W_Armin@gmx.de>
References: <20260710223544.49602-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:nJnQfOZqARrkGk18EK4X/S6sktpX2Vs0d77ddt0y9kNeWVK6Qla
 +V7v+lMG8FyuBAw4ivxcDW7lgQBLOayxrLqyP7sdHv3hhJvuw/pP8t+4oNxEa0Yjl0JViys
 D7eHVk7CMwGW9htiOTLFOZFlo96RhhkHqnTAZkqAnZy3a34YITRxCn2yxquYBGjHKsdQScs
 /M4eSkztZ3TwngIvHhnLQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:YwRtgZ4m0MI=;Blxo61XzLO6hl7YRP4moAWpyShP
 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
 =

Some (yet to be enabled) Tuxedo devices have a maximum intensity of
200 instead of the default 50. Remove the hardcoded maximum intensity
and use the device descriptor instead.

Suggested-by: Werner Sembach <wse@tuxedocomputers.com>
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

