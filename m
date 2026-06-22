Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231B5349CCD;
	Mon, 22 Jun 2026 19:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782157182; cv=none; b=cmclwjA8tzYeioKbpJks3OJIAkmZMj58ABNKXM6MXn4xTgT76oiYrxF5ng2oE3MqOOg0RUI8O96T21uCaND+uM3SshqgEUO8KJpe3oiHuC7EQFXW6H1VVRloFmIn4C6KZeliJfnJrZgmJeTbD2gbZDmZViUkcYY2gNfoOSZK11A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782157182; c=relaxed/simple;
	bh=kxz3SoQEu6LcDLnx+MH3uwFq8UKeqx87xID/rcK1Gt4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TBhxfH1U8QyWl7zuDCB2ZQIo1H/GAlvlOiAbDYuFpASBwKusrCZjpEdKH6Qp+p3GOw+mIZOLo5JsMkjatNn7L2TvKvDYNaNzV5mK5IAoVka1N8Q16eLTtMeaYGki4bFLLbeyRuYGZa7eCXV9Ceu2lWydcRQmPJolS5O/uUHJ/v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=H9BWcId/; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="H9BWcId/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1782157172; x=1782761972; i=w_armin@gmx.de;
	bh=68iUw82lr5OM5MxoSD8kNfA1i19Fzbgb1whlpSfittM=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=H9BWcId/jofB1r1aH3at+Kwyh3hJo8ol0XNeBSSDltNdDpi1/i6/O/y+0bT4aYZD
	 m0pGsJznQfSq2GIu/CdJgXaDNdF6BR3HLBOqvMF5NSzObfX3qCsieifMcGVsBPyww
	 JvB1rdL457g40ljQ0p+CjvyfF4I/eURCykQR697WWelWUrHMidu7I57SjIvQfwrIU
	 GyYTh6StkeSMBbaZ5NpKIoY22ZTLXiOGTDFKSZBYg/UKHG8+lcQSk7DDdhomxCWZA
	 /NYFSHsTESQFJUxzypnYM+uWAmcvdxTPsPpehiASN4Ts4dvxZo/wTirObnlSNeEKh
	 ABLlw4/6zmCMVquyxQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mof5H-1wvB3i3bPl-00najo; Mon, 22
 Jun 2026 21:39:31 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: matan@svgalib.org
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] platform/x86: lg-laptop: Improve WMAB control method support
Date: Mon, 22 Jun 2026 21:39:13 +0200
Message-Id: <20260622193914.116999-5-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260622193914.116999-1-W_Armin@gmx.de>
References: <20260622193914.116999-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:MeAfmFWZ321/rYW66e5wkLNtl8wj6mSrr/4WLcRhy82IqDDquUz
 Jkt3deh9+7neheXbY1RIP4aeYNHO45e6ioXhlogkfdAHNc5iMrFszp3F9YwajfhefQN6QGX
 QPp8il2ZWoH/cYxx+DvaARUBwfb5CCmj90PZUbsBraV/1HzPRpte2KyXebUYOSoV9w05a3v
 c4F/6EmLLUb7kqgLXKHNg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:I4UNc0UzsrE=;zWqkzcTcjY904fr5TNMKrKjPg3n
 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

The WMAB ACPI control method can return two kinds of results:

1. A ACPI integer containing the result.
2. A ACPI buffer containing the result and an error code.

Devices implement one of those mechanisms, but not both. Extend
lg_wmab() to abstract away the differences between both mechanisms
to fix keyboard backlight support on newer devices.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/lg-laptop.c | 267 +++++++++++++++++--------------
 1 file changed, 149 insertions(+), 118 deletions(-)

diff --git a/drivers/platform/x86/lg-laptop.c b/drivers/platform/x86/lg-la=
ptop.c
index c8e45e8b9d74..d1b33a6b5206 100644
=2D-- a/drivers/platform/x86/lg-laptop.c
+++ b/drivers/platform/x86/lg-laptop.c
@@ -10,6 +10,8 @@
 #include <linux/acpi.h>
 #include <linux/bitfield.h>
 #include <linux/bits.h>
+#include <linux/compiler_attributes.h>
+#include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/dev_printk.h>
 #include <linux/dmi.h>
@@ -21,6 +23,7 @@
 #include <linux/platform_device.h>
 #include <linux/string_choices.h>
 #include <linux/types.h>
+#include <linux/unaligned.h>
=20
 #include <acpi/battery.h>
=20
@@ -88,6 +91,11 @@ MODULE_PARM_DESC(fw_debug, "Enable printing of firmware=
 debug messages");
=20
 #define PLATFORM_NAME   "lg-laptop"
=20
+struct lg_wmab_buffer_result {
+	__le32 value;
+	__le32 status;
+} __packed;
+
 static struct platform_device *pf_device;
=20
 static int battery_limit_use_wmbb;
@@ -195,30 +203,97 @@ static int ggov(u32 arg0)
 	return res;
 }
=20
-static union acpi_object *lg_wmab(struct device *dev, u32 method, u32 arg=
1, u32 arg2)
+static int lg_wmab_get(struct device *dev, u32 method, u32 *result)
 {
-	union acpi_object args[3];
-	acpi_status status;
-	struct acpi_object_list arg;
 	struct acpi_buffer buffer =3D { ACPI_ALLOCATE_BUFFER, NULL };
+	union acpi_object in[] =3D {
+		{
+			.integer =3D {
+				.type =3D ACPI_TYPE_INTEGER,
+				.value =3D method,
+			},
+		},
+		{
+			.integer =3D {
+				.type =3D ACPI_TYPE_INTEGER,
+				.value =3D WM_GET,
+			},
+		},
+		{
+			.integer =3D {
+				.type =3D ACPI_TYPE_INTEGER,
+				.value =3D 0,
+			},
+		},
+	};
+	struct lg_wmab_buffer_result *buffer_result;
+	struct acpi_object_list input =3D {
+		.count =3D ARRAY_SIZE(in),
+		.pointer =3D in,
+	};
+	acpi_status status;
=20
-	args[0].type =3D ACPI_TYPE_INTEGER;
-	args[0].integer.value =3D method;
-	args[1].type =3D ACPI_TYPE_INTEGER;
-	args[1].integer.value =3D arg1;
-	args[2].type =3D ACPI_TYPE_INTEGER;
-	args[2].integer.value =3D arg2;
+	status =3D acpi_evaluate_object(ACPI_HANDLE(dev), "WMAB", &input, &buffe=
r);
+	if (ACPI_FAILURE(status))
+		return -EIO;
=20
-	arg.count =3D 3;
-	arg.pointer =3D args;
+	union acpi_object *obj __free(kfree) =3D buffer.pointer;
=20
-	status =3D acpi_evaluate_object(ACPI_HANDLE(dev), "WMAB", &arg, &buffer)=
;
-	if (ACPI_FAILURE(status)) {
-		dev_err(dev, "WMAB: call failed.\n");
-		return NULL;
+	if (!obj)
+		return -ENODATA;
+
+	switch (obj->type) {
+	case ACPI_TYPE_INTEGER:
+		*result =3D obj->integer.value;
+		return 0;
+	case ACPI_TYPE_BUFFER:
+		if (obj->buffer.length !=3D sizeof(*buffer_result))
+			return -EPROTO;
+
+		buffer_result =3D (struct lg_wmab_buffer_result *)obj->buffer.pointer;
+		if (get_unaligned_le32(&buffer_result->status))
+			return -EIO;
+
+		*result =3D get_unaligned_le32(&buffer_result->value);
+		return 0;
+	default:
+		return -EPROTO;
 	}
+}
=20
-	return buffer.pointer;
+static int lg_wmab_set(struct device *dev, u32 method, u32 arg)
+{
+	union acpi_object in[] =3D {
+		{
+			.integer =3D {
+				.type =3D ACPI_TYPE_INTEGER,
+				.value =3D method,
+			},
+		},
+		{
+			.integer =3D {
+				.type =3D ACPI_TYPE_INTEGER,
+				.value =3D WM_SET,
+			},
+		},
+		{
+			.integer =3D {
+				.type =3D ACPI_TYPE_INTEGER,
+				.value =3D arg,
+			},
+		},
+	};
+	struct acpi_object_list input =3D {
+		.count =3D ARRAY_SIZE(in),
+		.pointer =3D in,
+	};
+	acpi_status status;
+
+	status =3D acpi_evaluate_object(ACPI_HANDLE(dev), "WMAB", &input, NULL);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	return 0;
 }
=20
 static union acpi_object *lg_wmbb(struct device *dev, u32 method_id, u32 =
arg1, u32 arg2)
@@ -257,7 +332,6 @@ static ssize_t fan_mode_store(struct device *dev,
 			      const char *buffer, size_t count)
 {
 	unsigned long value;
-	union acpi_object *r;
 	int ret;
=20
 	ret =3D kstrtoul(buffer, 10, &value);
@@ -266,10 +340,10 @@ static ssize_t fan_mode_store(struct device *dev,
 	if (value >=3D 3)
 		return -EINVAL;
=20
-	r =3D lg_wmab(dev, WM_FAN_MODE, WM_SET,
-		FIELD_PREP(FAN_MODE_LOWER, value) |
-		FIELD_PREP(FAN_MODE_UPPER, value));
-	kfree(r);
+	ret =3D lg_wmab_set(dev, WM_FAN_MODE, FIELD_PREP(FAN_MODE_LOWER, value) =
|
+			  FIELD_PREP(FAN_MODE_UPPER, value));
+	if (ret < 0)
+		return ret;
=20
 	return count;
 }
@@ -277,22 +351,14 @@ static ssize_t fan_mode_store(struct device *dev,
 static ssize_t fan_mode_show(struct device *dev,
 			     struct device_attribute *attr, char *buffer)
 {
-	unsigned int mode;
-	union acpi_object *r;
-
-	r =3D lg_wmab(dev, WM_FAN_MODE, WM_GET, 0);
-	if (!r)
-		return -EIO;
-
-	if (r->type !=3D ACPI_TYPE_INTEGER) {
-		kfree(r);
-		return -EIO;
-	}
+	u32 mode;
+	int ret;
=20
-	mode =3D FIELD_GET(FAN_MODE_LOWER, r->integer.value);
-	kfree(r);
+	ret =3D lg_wmab_get(dev, WM_FAN_MODE, &mode);
+	if (ret < 0)
+		return ret;
=20
-	return sysfs_emit(buffer, "%d\n", mode);
+	return sysfs_emit(buffer, "%lu\n", FIELD_GET(FAN_MODE_LOWER, mode));
 }
=20
 static ssize_t usb_charge_store(struct device *dev,
@@ -342,41 +408,30 @@ static ssize_t reader_mode_store(struct device *dev,
 				 const char *buffer, size_t count)
 {
 	bool value;
-	union acpi_object *r;
 	int ret;
=20
 	ret =3D kstrtobool(buffer, &value);
 	if (ret)
 		return ret;
=20
-	r =3D lg_wmab(dev, WM_READER_MODE, WM_SET, value);
-	if (!r)
-		return -EIO;
+	ret =3D lg_wmab_set(dev, WM_READER_MODE, value);
+	if (ret < 0)
+		return ret;
=20
-	kfree(r);
 	return count;
 }
=20
 static ssize_t reader_mode_show(struct device *dev,
 				struct device_attribute *attr, char *buffer)
 {
-	unsigned int status;
-	union acpi_object *r;
-
-	r =3D lg_wmab(dev, WM_READER_MODE, WM_GET, 0);
-	if (!r)
-		return -EIO;
-
-	if (r->type !=3D ACPI_TYPE_INTEGER) {
-		kfree(r);
-		return -EIO;
-	}
-
-	status =3D !!r->integer.value;
+	u32 status;
+	int ret;
=20
-	kfree(r);
+	ret =3D lg_wmab_get(dev, WM_READER_MODE, &status);
+	if (ret < 0)
+		return ret;
=20
-	return sysfs_emit(buffer, "%d\n", status);
+	return sysfs_emit(buffer, "%d\n", !!status);
 }
=20
 static ssize_t fn_lock_store(struct device *dev,
@@ -384,40 +439,30 @@ static ssize_t fn_lock_store(struct device *dev,
 			     const char *buffer, size_t count)
 {
 	bool value;
-	union acpi_object *r;
 	int ret;
=20
 	ret =3D kstrtobool(buffer, &value);
 	if (ret)
 		return ret;
=20
-	r =3D lg_wmab(dev, WM_FN_LOCK, WM_SET, value);
-	if (!r)
-		return -EIO;
+	ret =3D lg_wmab_set(dev, WM_FN_LOCK, value);
+	if (ret < 0)
+		return ret;
=20
-	kfree(r);
 	return count;
 }
=20
 static ssize_t fn_lock_show(struct device *dev,
 			    struct device_attribute *attr, char *buffer)
 {
-	unsigned int status;
-	union acpi_object *r;
-
-	r =3D lg_wmab(dev, WM_FN_LOCK, WM_GET, 0);
-	if (!r)
-		return -EIO;
-
-	if (r->type !=3D ACPI_TYPE_BUFFER) {
-		kfree(r);
-		return -EIO;
-	}
+	u32 status;
+	int ret;
=20
-	status =3D !!r->buffer.pointer[0];
-	kfree(r);
+	ret =3D lg_wmab_get(dev, WM_FN_LOCK, &status);
+	if (ret < 0)
+		return ret;
=20
-	return sysfs_emit(buffer, "%d\n", status);
+	return sysfs_emit(buffer, "%d\n", !!status);
 }
=20
 static ssize_t charge_control_end_threshold_store(struct device *dev,
@@ -434,14 +479,18 @@ static ssize_t charge_control_end_threshold_store(st=
ruct device *dev,
 	if (value =3D=3D 100 || value =3D=3D 80) {
 		union acpi_object *r;
=20
-		if (battery_limit_use_wmbb)
+		if (battery_limit_use_wmbb) {
 			r =3D lg_wmbb(&pf_device->dev, WMBB_BATT_LIMIT, WM_SET, value);
-		else
-			r =3D lg_wmab(&pf_device->dev, WM_BATT_LIMIT, WM_SET, value);
-		if (!r)
-			return -EIO;
+			if (!r)
+				return -EIO;
+
+			kfree(r);
+		} else {
+			ret =3D lg_wmab_set(&pf_device->dev, WM_BATT_LIMIT, value);
+			if (ret < 0)
+				return ret;
+		}
=20
-		kfree(r);
 		return count;
 	}
=20
@@ -452,8 +501,9 @@ static ssize_t charge_control_end_threshold_show(struc=
t device *device,
 						 struct device_attribute *attr,
 						 char *buf)
 {
-	unsigned int status;
 	union acpi_object *r;
+	u32 status;
+	int ret;
=20
 	if (battery_limit_use_wmbb) {
 		r =3D lg_wmbb(&pf_device->dev, WMBB_BATT_LIMIT, WM_GET, 0);
@@ -466,19 +516,13 @@ static ssize_t charge_control_end_threshold_show(str=
uct device *device,
 		}
=20
 		status =3D r->buffer.pointer[0x10];
+		kfree(r);
 	} else {
-		r =3D lg_wmab(&pf_device->dev, WM_BATT_LIMIT, WM_GET, 0);
-		if (!r)
-			return -EIO;
-
-		if (r->type !=3D ACPI_TYPE_INTEGER) {
-			kfree(r);
-			return -EIO;
-		}
-
-		status =3D r->integer.value;
+		ret =3D lg_wmab_get(&pf_device->dev, WM_BATT_LIMIT, &status);
+		if (ret < 0)
+			return ret;
 	}
-	kfree(r);
+
 	if (status !=3D 80 && status !=3D 100)
 		status =3D 0;
=20
@@ -544,10 +588,7 @@ static const struct attribute_group dev_attribute_gro=
up =3D {
 static void tpad_led_set(struct led_classdev *cdev,
 			 enum led_brightness brightness)
 {
-	union acpi_object *r;
-
-	r =3D lg_wmab(cdev->dev->parent, WM_TLED, WM_SET, brightness > LED_OFF);
-	kfree(r);
+	lg_wmab_set(cdev->dev->parent, WM_TLED, brightness > LED_OFF);
 }
=20
 static enum led_brightness tpad_led_get(struct led_classdev *cdev)
@@ -561,46 +602,36 @@ static void kbd_backlight_set(struct led_classdev *c=
dev,
 			      enum led_brightness brightness)
 {
 	u32 val;
-	union acpi_object *r;
=20
 	val =3D 0x22;
 	if (brightness <=3D LED_OFF)
 		val =3D 0;
 	if (brightness >=3D LED_FULL)
 		val =3D 0x24;
-	r =3D lg_wmab(cdev->dev->parent, WM_KEY_LIGHT, WM_SET, val);
-	kfree(r);
+
+	lg_wmab_set(cdev->dev->parent, WM_KEY_LIGHT, val);
 }
=20
 static enum led_brightness get_kbd_backlight_level(struct device *dev)
 {
-	union acpi_object *r;
-	int val;
-
-	r =3D lg_wmab(dev, WM_KEY_LIGHT, WM_GET, 0);
+	u32 value;
+	int ret;
=20
-	if (!r)
+	ret =3D lg_wmab_get(dev, WM_KEY_LIGHT, &value);
+	if (ret < 0)
 		return LED_OFF;
=20
-	if (r->type !=3D ACPI_TYPE_BUFFER || r->buffer.pointer[1] !=3D 0x05) {
-		kfree(r);
+	if ((value & 0xFF00) !=3D 0x0500)
 		return LED_OFF;
-	}
=20
-	switch (r->buffer.pointer[0] & 0x27) {
+	switch (value & 0x27) {
 	case 0x24:
-		val =3D LED_FULL;
-		break;
+		return LED_FULL;
 	case 0x22:
-		val =3D LED_HALF;
-		break;
+		return LED_HALF;
 	default:
-		val =3D LED_OFF;
+		return LED_OFF;
 	}
-
-	kfree(r);
-
-	return val;
 }
=20
 static enum led_brightness kbd_backlight_get(struct led_classdev *cdev)
=2D-=20
2.39.5

