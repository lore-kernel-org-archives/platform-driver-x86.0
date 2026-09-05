Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A952F7F05;
	Sat,  5 Sep 2026 13:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788613309; cv=none; b=KuQc4JCgTzLmhPmi1tnI9LTFZYUt7gj+kDVv6VGtjUM1CCFLCndIij6emvsyb91u/mRjM7LUkrx6K9M1+zjyGYo3dCjrsEZyNwIMK6ZCmhCtjqlIujCYCtj/RDj6B3KBO7oyfDrfKCxHt1K7Tbg/G3WwvdNz9gMcBt6jukH6Uxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788613309; c=relaxed/simple;
	bh=c5REbVzfyRJwduh2TutF9/dVYciNpxZ1RjRhIWA+7uo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=D5XZvXXZusA4347YmcbGpmOT2FA1yuhHKHKLRRSwWIf11/SbKV0adsLdyluWVZ21cwlUaHBIBSs7SDVErgvjWKLh12Nl5XSlC0oNbEecyQ9h2U+7Ge4anlvJQVwGyk6CLIZp22GH1FqzyzZ437RX+9U9oGvyVogiOyqV20Y3lxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=m2Nqd+vO; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="m2Nqd+vO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1788613303; x=1789218103; i=w_armin@gmx.de;
	bh=yQJafxE1vbbjSzN9HFLukGe70/IWuuM3JXP3kwOrQGo=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=m2Nqd+vO9k6v2jO4uxiSWSZjcoFKLMWAZ5Xz0oK040YiQdA8S9Y/j3segFe7sxFH
	 ykziONKrCsE1eyD9NDepBCt2/IKeuy+zUK+EJh3UtJwpJ3zOA3Prpig0kTzj3TEBb
	 6xWLbZ4YdMjaL3cJ2X9BUcJuM8U8ftFrf+izm3e0fq7CXkt+190BJjP3UnMw4MRZt
	 BosK0Hk1/6nFof13ewIQqVafIFxF2QrJWnJXUQarfiyGud6rNlppeF5xJB591hU+O
	 I5XAW1OPpxbaEC/xRQlepBMwqsSgfJS+kYv1ZMMhCQX9k6zuwHEFQ6Uk2HUQSHpO9
	 qHFdyvI5SiVlQ7kZMA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MNKhs-1xERgr2VSc-00QD85; Sat, 05
 Sep 2026 15:01:43 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: wse@tuxedocomputers.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] platform/x86: uniwill-laptop: Fix breathing animation on Intel QC
Date: Sat,  5 Sep 2026 15:01:36 +0200
Message-Id: <20260905130138.6814-4-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260905130138.6814-1-W_Armin@gmx.de>
References: <20260905130138.6814-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:aMvDEtZ3VvZj3YFQttVJXPZ5wDE8kKW96xDI9fTth8Swfp56P8N
 rz2vkVyJTK1ivoA7tRGUBht6vTZAzS5Iy+Yq7bay7bgS2ESjDHBWBt6cjvtSLlLCUUtEIYJ
 7Xb1RfrxsgvjBgf284Ls1NvfhBUIpIaQkpS4RlKLU3SKo2nTQq7qlvVhjUM234YadZcvElo
 f6hXfX5KNe7H6TLhClXAg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:FQUlYyVC3SI=;NFJKSPtK36stbOlM4kbhQ69EjN8
 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

Intel NUC 9 Extreme (Queens County) devices have a separate bit
inside the EC_ADDR_LIGHTBAR_AC:CTRL register for enabling the
breathing animation in s2idle mode.

Add support for this additional setting.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 .../ABI/testing/sysfs-driver-uniwill-laptop   |  4 +--
 drivers/platform/x86/uniwill/uniwill-acpi.c   | 27 ++++++++++++++-----
 2 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-uniwill-laptop b/Docum=
entation/ABI/testing/sysfs-driver-uniwill-laptop
index b9b9feebe2ed..f3060aaf8a76 100644
=2D-- a/Documentation/ABI/testing/sysfs-driver-uniwill-laptop
+++ b/Documentation/ABI/testing/sysfs-driver-uniwill-laptop
@@ -35,8 +35,8 @@ KernelVersion:	6.19
 Contact:	Armin Wolf <W_Armin@gmx.de>
 Description:
 		Causes the integrated lightbar to display a breathing animation when th=
e machine
-		has been suspended and is running on AC power. Writing "1"/"0" into thi=
s file
-		enables/disables this functionality.
+		has been suspended, is running on AC power and the lightbar brightness =
not zero.
+		Writing "1"/"0" into this file enables/disables this functionality.
=20
 		Reading this file returns the current status of the breathing animation
 		functionality.
diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platfor=
m/x86/uniwill/uniwill-acpi.c
index 6366171c6981..e527ed7461c3 100644
=2D-- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -165,9 +165,10 @@
 #define EC_ADDR_LIGHTBAR_AC_CTRL	0x0748
 #define LIGHTBAR_APP_EXISTS		BIT(0)
 #define LIGHTBAR_POWER_SAVE		BIT(1)
-#define LIGHTBAR_S0_OFF			BIT(2)
-#define LIGHTBAR_S3_OFF			BIT(3)	// Breathing animation when suspended
-#define LIGHTBAR_WELCOME		BIT(7)	// Rainbow animation
+#define LIGHTBAR_S0_OFF			BIT(2)	/* Also disables animations */
+#define LIGHTBAR_S3_OFF			BIT(3)	/* No breathing animation when in s2ram =
*/
+#define LIGHTBAR_MODERN_STANDBY_ON	BIT(6)	/* Breathing animation when in =
s2idle */
+#define LIGHTBAR_WELCOME		BIT(7)	/* Rainbow animation */
=20
 #define EC_ADDR_LIGHTBAR_AC_RED		0x0749
=20
@@ -306,7 +307,7 @@
 #define EC_ADDR_USB_C_POWER_PRIORITY	0x07CC
 #define USB_C_POWER_PRIORITY		BIT(7)
=20
-/* Same bits as EC_ADDR_LIGHTBAR_AC_CTRL except LIGHTBAR_S3_OFF */
+/* Same bits as EC_ADDR_LIGHTBAR_AC_CTRL except LIGHTBAR_S3_OFF and LIGHT=
BAR_MODERN_STANDBY_ON */
 #define EC_ADDR_LIGHTBAR_BAT_CTRL	0x07E2
=20
 #define EC_ADDR_LIGHTBAR_BAT_RED	0x07E3
@@ -911,12 +912,13 @@ static ssize_t breathing_in_suspend_store(struct dev=
ice *dev, struct device_attr
 		return ret;
=20
 	if (enable)
-		value =3D 0;
+		value =3D LIGHTBAR_MODERN_STANDBY_ON;
 	else
 		value =3D LIGHTBAR_S3_OFF;
=20
 	/* We only access a single register here, so we do not need to use data-=
>led_lock */
-	ret =3D regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL, LIGHT=
BAR_S3_OFF, value);
+	ret =3D regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL,
+				 LIGHTBAR_S3_OFF | LIGHTBAR_MODERN_STANDBY_ON, value);
 	if (ret < 0)
 		return ret;
=20
@@ -934,6 +936,10 @@ static ssize_t breathing_in_suspend_show(struct devic=
e *dev, struct device_attri
 	if (ret < 0)
 		return ret;
=20
+	/*
+	 * We only test LIGHTBAR_S3_OFF here, because LIGHTBAR_MODERN_STANDBY_ON
+	 * should have the exact opposite value.
+	 */
 	return sysfs_emit(buf, "%d\n", !(value & LIGHTBAR_S3_OFF));
 }
=20
@@ -1541,7 +1547,8 @@ static struct led_trigger uniwill_lightbar_trigger =
=3D {
 	.trigger_type =3D &uniwill_lightbar_trigger_type,
 };
=20
-#define LIGHTBAR_MASK	(LIGHTBAR_APP_EXISTS | LIGHTBAR_S0_OFF | LIGHTBAR_S=
3_OFF | LIGHTBAR_WELCOME)
+#define LIGHTBAR_MASK	(LIGHTBAR_APP_EXISTS | LIGHTBAR_S0_OFF | LIGHTBAR_S=
3_OFF | \
+			 LIGHTBAR_MODERN_STANDBY_ON | LIGHTBAR_WELCOME)
=20
 static int uniwill_led_init(struct uniwill_data *data)
 {
@@ -1574,6 +1581,11 @@ static int uniwill_led_init(struct uniwill_data *da=
ta)
 		return ret;
=20
 	value |=3D LIGHTBAR_APP_EXISTS;
+	if (value & LIGHTBAR_S3_OFF)
+		value &=3D ~LIGHTBAR_MODERN_STANDBY_ON;
+	else
+		value |=3D LIGHTBAR_MODERN_STANDBY_ON;
+
 	ret =3D regmap_write(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL, value);
 	if (ret < 0)
 		return ret;
@@ -1583,6 +1595,7 @@ static int uniwill_led_init(struct uniwill_data *dat=
a)
 	 * running on battery power.
 	 */
 	value |=3D LIGHTBAR_S3_OFF;
+	value &=3D ~LIGHTBAR_MODERN_STANDBY_ON;
 	ret =3D regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_BAT_CTRL, LIGH=
TBAR_MASK, value);
 	if (ret < 0)
 		return ret;
=2D-=20
2.39.5

