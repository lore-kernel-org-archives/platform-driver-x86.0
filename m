Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BA94AE8B9;
	Wed,  7 Oct 2026 14:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791384081; cv=none; b=VlzhhkDRRT3mXF5AwoDZo++ecl/1efkYmtJu0ynAdzWoHyqdiSpZL5q6a5O6fAQUsCzznB7Ynw4worQ3gOdI+mjQzRg2vAbCviRNpuIhdcGqwMdO77MRBjyGrD/ZNJMRYn27sTDxZuS8UKGEqE0R2nFo1Zsg/lvW6TPYvtMYlkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791384081; c=relaxed/simple;
	bh=4H6xgRL6dV0OqbxYCjqg5kWWaHae1eXf/Mrwgf5pTCI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gHMk77rtirkkByh9Rz19E3lPEBFZU+DQz8t3wywkcaC+m2dPFq9o4Fv4WElShAhUnfuNEgCKINGOyPH8UR7pkM68c58DNcRCn3CdagLkVQIvDGlk59/WSQE5tagVMlEmlnQJ/ba+yJwoZq4/iaDw4ewdldOpZlt2uUBlcK12D80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=chsxkptL; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="chsxkptL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1791384067; x=1791988867; i=w_armin@gmx.de;
	bh=gJpelvS0xDu4n29PMpxks/iodJ0a6+1rDJVWkY93KQ4=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=chsxkptLjIgaSGJLK10eBMy7dOCu7rrbacHssf5+yJI5WdAuV9ir5yVkjRnIcEmD
	 tuJ6S87TxG+q2SP/QZjt0YFuxZxsVoeqmO561+8AcdWENI/SMLxtZYzsXQDIZFPd/
	 1+I7PSATjLF9qG9vS7tg0Sl/bZd805SxqNgq8AUPtQIH7Xa0NW6bmhA6fprMtYaHv
	 smsuyGYc6/zOHvrCskPYtsGqbC62KX1pVEkQI24V/94WTxmfE6fRXMiCtHHOvnwyc
	 y2odZ8sqVFgWRZxf82Cr8Mgblf5QEYBut6Ei6j6xDpE6GXptwuLWkGqvGH/K1RQqZ
	 WaCQQ8g1Lnsrplro0g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N9dsV-1wa8MY2JNd-00sNKk; Wed, 07
 Oct 2026 16:41:07 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: wse@tuxedocomputers.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/5] platform/x86: uniwill-laptop: Report correct lightbar brightness
Date: Wed,  7 Oct 2026 16:38:54 +0200
Message-ID: <20261007144101.323289-2-W_Armin@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007144101.323289-1-W_Armin@gmx.de>
References: <20261007144101.323289-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SOMu+iEI7K/XQE6zCtzqwxsoxkfvcdjrJOxDomMm0ISlhgODXhL
 LS3N0+8zWksmuqJ0viaYKDe5qrURV4aG4oPpl31e6fhMao2Fh9lRzb99LYIqqFMqmTSYn9z
 e+2KeRWyTMApd65DvA6oy1O/XqVxyfe+8puJd2bf6+Xl3fuUysdwe8Q9n7mqGHBeT7P+33a
 TIgE+5SlzBsUKzUM5wsjA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:pVGyBDas9lU=;k0UOTefa+twBRqqp80WbryB/la1
 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
 6/l58qDNa9xmlIUcPzQt0kse7nfHY=

The LED sysfs ABI now allows us to specify the maximum values for the
global brightness and the color intensity values independently. At the
same time the maximum brightness value reported for the lightbar (like
200) does not match the real value supported by the hardware (1),
potentially confusing users.

Report the correct maximum brightness value and only use the intensity
values for controlling the lightbar color.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/uniwill/uniwill-acpi.c | 43 ++++++++++-----------
 1 file changed, 20 insertions(+), 23 deletions(-)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platfor=
m/x86/uniwill/uniwill-acpi.c
index 07b69629bb5e..788bf4064d34 100644
=2D-- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -398,7 +398,7 @@ struct uniwill_data {
 	struct mutex super_key_lock;	/* Protects the toggling of the super key l=
ock state */
 	struct list_head batteries;
 	struct mutex led_lock;		/* Protects writes to the lightbar registers */
-	u8 lightbar_max_brightness;
+	u8 lightbar_max_intensity;
 	struct led_classdev_mc led_mc_cdev;
 	struct mc_subled led_mc_subled_info[LED_CHANNELS];
 	bool kbd_led_single_color;
@@ -429,7 +429,7 @@ struct uniwill_device_descriptor {
 	unsigned int features;
 	bool kbd_led_single_color;
 	u8 kbd_led_max_brightness;
-	u8 lightbar_max_brightness;
+	u8 lightbar_max_intensity;
 	/* Executed during driver probing */
 	int (*probe)(struct uniwill_data *data);
 };
@@ -1511,20 +1511,16 @@ static int uniwill_led_brightness_set(struct led_c=
lassdev *led_cdev, enum led_br
 	unsigned int value;
 	int ret;
=20
-	ret =3D led_mc_calc_color_components(led_mc_cdev, brightness);
-	if (ret < 0)
-		return ret;
-
 	guard(mutex)(&data->led_lock);
=20
 	for (int i =3D 0; i < LED_CHANNELS; i++) {
-		/* Prevent the brightness values from overflowing */
-		value =3D min(data->lightbar_max_brightness, data->led_mc_subled_info[i=
].brightness);
-		ret =3D regmap_write(data->regmap, uniwill_led_channel_to_ac_reg[i], va=
lue);
+		ret =3D regmap_write(data->regmap, uniwill_led_channel_to_ac_reg[i],
+				   data->led_mc_subled_info[i].intensity);
 		if (ret < 0)
 			return ret;
=20
-		ret =3D regmap_write(data->regmap, uniwill_led_channel_to_bat_reg[i], v=
alue);
+		ret =3D regmap_write(data->regmap, uniwill_led_channel_to_bat_reg[i],
+				   data->led_mc_subled_info[i].intensity);
 		if (ret < 0)
 			return ret;
 	}
@@ -1588,14 +1584,14 @@ static int uniwill_led_init(struct uniwill_data *d=
ata)
 		return ret;
=20
 	data->led_mc_cdev.led_cdev.color =3D LED_COLOR_ID_MULTI;
-	data->led_mc_cdev.led_cdev.max_brightness =3D data->lightbar_max_brightn=
ess;
+	data->led_mc_cdev.led_cdev.max_brightness =3D 1;
 	data->led_mc_cdev.led_cdev.flags =3D LED_REJECT_NAME_CONFLICT;
 	data->led_mc_cdev.led_cdev.brightness_set_blocking =3D uniwill_led_brigh=
tness_set;
=20
 	if (value & LIGHTBAR_S0_OFF)
 		data->led_mc_cdev.led_cdev.brightness =3D 0;
 	else
-		data->led_mc_cdev.led_cdev.brightness =3D data->lightbar_max_brightness=
;
+		data->led_mc_cdev.led_cdev.brightness =3D 1;
=20
 	for (int i =3D 0; i < LED_CHANNELS; i++) {
 		data->led_mc_subled_info[i].color_index =3D color_indices[i];
@@ -1606,9 +1602,9 @@ static int uniwill_led_init(struct uniwill_data *dat=
a)
=20
 		/*
 		 * Make sure that the initial intensity value is not greater than
-		 * the maximum brightness.
+		 * the maximum intensity.
 		 */
-		value =3D min(data->lightbar_max_brightness, value);
+		value =3D min(data->lightbar_max_intensity, value);
 		ret =3D regmap_write(data->regmap, uniwill_led_channel_to_ac_reg[i], va=
lue);
 		if (ret < 0)
 			return ret;
@@ -1618,6 +1614,7 @@ static int uniwill_led_init(struct uniwill_data *dat=
a)
 			return ret;
=20
 		data->led_mc_subled_info[i].intensity =3D value;
+		data->led_mc_subled_info[i].max_intensity =3D data->lightbar_max_intens=
ity;
 		data->led_mc_subled_info[i].channel =3D i;
 	}
=20
@@ -2366,7 +2363,7 @@ static int uniwill_probe(struct platform_device *pde=
v)
 	data->features =3D device_descriptor.features;
 	data->kbd_led_single_color =3D device_descriptor.kbd_led_single_color;
 	data->kbd_led_max_brightness =3D device_descriptor.kbd_led_max_brightnes=
s;
-	data->lightbar_max_brightness =3D device_descriptor.lightbar_max_brightn=
ess;
+	data->lightbar_max_intensity =3D device_descriptor.lightbar_max_intensit=
y;
=20
 	/*
 	 * Some devices might need to perform some device-specific initializatio=
n steps
@@ -2713,7 +2710,7 @@ static struct uniwill_device_descriptor lapqc71a_lap=
qc71b_descriptor __initdata
 		    UNIWILL_FEATURE_GPU_TEMP |
 		    UNIWILL_FEATURE_PRIMARY_FAN |
 		    UNIWILL_FEATURE_SECONDARY_FAN,
-	.lightbar_max_brightness =3D 36,
+	.lightbar_max_intensity =3D 36,
 };
=20
 static struct uniwill_device_descriptor lapac71h_descriptor __initdata =
=3D {
@@ -2737,7 +2734,7 @@ static struct uniwill_device_descriptor lapkc71f_des=
criptor __initdata =3D {
 		    UNIWILL_FEATURE_GPU_TEMP |
 		    UNIWILL_FEATURE_PRIMARY_FAN |
 		    UNIWILL_FEATURE_SECONDARY_FAN,
-	.lightbar_max_brightness =3D 200,
+	.lightbar_max_intensity =3D 200,
 };
=20
 static struct uniwill_device_descriptor pfxnuxx_pfxluxx_phxprxx_descripto=
r __initdata =3D {
@@ -2777,7 +2774,7 @@ static struct uniwill_device_descriptor gmxmpxx_desc=
riptor __initdata =3D {
 		    UNIWILL_FEATURE_PRIMARY_FAN |
 		    UNIWILL_FEATURE_SECONDARY_FAN |
 		    UNIWILL_FEATURE_USB_C_POWER_PRIORITY,
-	.lightbar_max_brightness =3D 36,
+	.lightbar_max_intensity =3D 36,
 };
=20
 static struct uniwill_device_descriptor phxtqxx_phxagxx_phxaqxx_phxpgxx_d=
escriptor __initdata =3D {
@@ -2836,7 +2833,7 @@ static struct uniwill_device_descriptor gmxzgxx_gmxt=
gxx_ste_descriptor __initdat
 		    UNIWILL_FEATURE_SECONDARY_FAN |
 		    UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL |
 		    UNIWILL_FEATURE_USB_C_POWER_PRIORITY,
-	.lightbar_max_brightness =3D 36,
+	.lightbar_max_intensity =3D 36,
 };
=20
 static int gmxrgxx_probe(struct uniwill_data *data)
@@ -2850,7 +2847,7 @@ static int gmxrgxx_probe(struct uniwill_data *data)
=20
 	if (value & LIGHTBAR) {
 		data->features |=3D UNIWILL_FEATURE_LIGHTBAR;
-		data->lightbar_max_brightness =3D 36;
+		data->lightbar_max_intensity =3D 36;
 	}
=20
 	ret =3D regmap_read(data->regmap, EC_ADDR_SUPPORT_2, &value);
@@ -2888,7 +2885,7 @@ static struct uniwill_device_descriptor gmxagxx_desc=
riptor __initdata =3D {
 		    UNIWILL_FEATURE_PRIMARY_FAN |
 		    UNIWILL_FEATURE_SECONDARY_FAN |
 		    UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL,
-	.lightbar_max_brightness =3D 36,
+	.lightbar_max_intensity =3D 36,
 };
=20
 static struct uniwill_device_descriptor gmxxgxx_gmxpxxx_descriptor __init=
data =3D {
@@ -3538,8 +3535,8 @@ static int __init uniwill_init(void)
 		device_descriptor.kbd_led_single_color =3D false;
 		/* Some models only support 3 brightness levels */
 		device_descriptor.kbd_led_max_brightness =3D 4;
-		/* Some models only support 36 brightness levels per color component */
-		device_descriptor.lightbar_max_brightness =3D 200;
+		/* Some models only support 36 intensity levels per color component */
+		device_descriptor.lightbar_max_intensity =3D 200;
 		pr_warn("Enabling potentially unsupported features\n");
 	}
=20
=2D-=20
2.55.0

