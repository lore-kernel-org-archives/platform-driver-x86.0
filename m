Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0ACF3E2740;
	Wed,  8 Jul 2026 19:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783540573; cv=none; b=SKoMSJB90jj1Ecr4sXWW28x4EeC93K4whCsUPu3snWZFCcawqLyNgsUGEiRliRU0C2r9knpbzumb4cboawvPP37lo1Na2gH6oLSzTPkmb3nHusNWicRBVZqqHFWeZQlNytPn+L42Hvviexkmu5eqdrp9FM2KgRluYBcee2jOtpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783540573; c=relaxed/simple;
	bh=bCjUZZOlbRaVYzwb48vLWjB+VSY64eGlQNB02o9sLPI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=O+4qDqAu0iOpXyD4bUbX0p+sGGaDlR+pdCzOmCQPLDqADxjkeGdscXnyDSEHRL00phpoz4LsT17nsYFn3pxs/89hn8JsSyIfOyTE7sizjeY4g6mHF3D/TqBh7TPCKhGLj6JLFJ5QrQcUnEZ4nM+qjWVvLpMjNncJjH17IcGZJXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=E0pbN05k; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="E0pbN05k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1783540564; x=1784145364; i=w_armin@gmx.de;
	bh=l1/EmKZPd+XUAkBNr6b1JZ9ojUGa3VEafW8na06nzFc=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=E0pbN05kattvGZbZZPm3AVI4aY39DX9gP+CezxGsJZMqMPfTsq61PlLdMD7fhCpJ
	 pSifOHJD1qBmvwFpPZbK7lErE5C0NzPgcxo1l4JnW12xe97FslSiZ2B52NdplhKAP
	 32dPIjFwvE36qN69rj+sT0LSb/VLl5DvWIOro1Ep2g3/sq7fyIAPu8X8aNbDqfyWm
	 BscxvlQjDs4ubyE23wPGIn06aF5NOJBNOeNMLzpTxtIUzwiOl/o0CyTmcmTuLLynu
	 LANlqikGWbgZcIhmRIfzJUuelRCDy2G6K1PBn7I27XjVqrFe0WiX3xjJXAh7NYVkC
	 BWawr74XnehsBpYA3w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N4z6q-1x6kls3Kdw-014ORV; Wed, 08
 Jul 2026 21:56:04 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: matan@svgalib.org
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] platform/x86: lg-laptop: Improve WMAB control method support
Date: Wed,  8 Jul 2026 21:55:52 +0200
Message-Id: <20260708195553.7762-5-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260708195553.7762-1-W_Armin@gmx.de>
References: <20260708195553.7762-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:tFd+cTpxqooVzaafBjg/iIap1CqtbiUtQCb5wtKewNLp/mH4pkT
 GM+PxQG9Au3SEZyaH0sSYeNeIrj2lWarx67E7waHjFOlZOSlVU0LruzdNjZ6Bbr1KI/Mzvk
 cTiZj9rk47ZsqOgfY3540lNBBl7yGGVxdsVA5oJISPfXKLrE9lyP80D3O/7mjuGQN1uibk6
 7VMq2X8jnVj4Es3yJoUlQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:0vKbnIGmg/Y=;LXnesCArPX4mhWhDYsKVySLRu6k
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
index 9350418c50af..164012c1c409 100644
=2D-- a/drivers/platform/x86/lg-laptop.c
+++ b/drivers/platform/x86/lg-laptop.c
@@ -11,6 +11,8 @@
 #include <linux/array_size.h>
 #include <linux/bitfield.h>
 #include <linux/bits.h>
+#include <linux/compiler_attributes.h>
+#include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/dev_printk.h>
 #include <linux/dmi.h>
@@ -23,6 +25,7 @@
 #include <linux/platform_device.h>
 #include <linux/string_choices.h>
 #include <linux/types.h>
+#include <linux/unaligned.h>
=20
 #include <acpi/battery.h>
=20
@@ -90,6 +93,11 @@ MODULE_PARM_DESC(fw_debug, "Enable printing of firmware=
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
@@ -197,30 +205,97 @@ static int ggov(u32 arg0)
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
@@ -259,7 +334,6 @@ static ssize_t fan_mode_store(struct device *dev,
 			      const char *buffer, size_t count)
 {
 	unsigned long value;
-	union acpi_object *r;
 	int ret;
=20
 	ret =3D kstrtoul(buffer, 10, &value);
@@ -268,10 +342,10 @@ static ssize_t fan_mode_store(struct device *dev,
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
@@ -279,22 +353,14 @@ static ssize_t fan_mode_store(struct device *dev,
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
@@ -344,41 +410,30 @@ static ssize_t reader_mode_store(struct device *dev,
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
@@ -386,40 +441,30 @@ static ssize_t fn_lock_store(struct device *dev,
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
@@ -436,14 +481,18 @@ static ssize_t charge_control_end_threshold_store(st=
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
@@ -454,8 +503,9 @@ static ssize_t charge_control_end_threshold_show(struc=
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
@@ -468,19 +518,13 @@ static ssize_t charge_control_end_threshold_show(str=
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
@@ -546,10 +590,7 @@ static const struct attribute_group dev_attribute_gro=
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
@@ -563,46 +604,36 @@ static void kbd_backlight_set(struct led_classdev *c=
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

