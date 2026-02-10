Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C66318BAD;
	Tue, 10 Feb 2026 23:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770766210; cv=none; b=FL8hVbDAmbcCgEtW3f8v9k/VI8+n47e5opi+kKSmGbIMKpTGNFnYNdQ4Z64cJpOKe88pfYposk5O6W4sMOBiVVaUTT1/fw/v0d1yr1ZRvVML3ymB8yFrU5fGGTeB3wW8EjCEzwI/GN1ZAcWqbvXMF3vtvBCXIuWTEHDIzTruvok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770766210; c=relaxed/simple;
	bh=IIhYduzsAKVImbP3haEeeg+pflDeVfQ7y3WQ/YNoze4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CSStdI83aUZ9ffz+dBwe7KQsROcPuya5Mh0gC9RvZH8UnbosU/b2wq6yjDEZ6USRIsrUeOXxf4HxRPKQnNF0J4ivWOw5hus7/RRlG3Qq7MtgOxMDtOq7BTaDdU6t8MgS/leA8PDa0imjhOJu6eaCckZLshDJIx8Jcy3l8iAEebE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=IrsM2Jjy; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="IrsM2Jjy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1770766198; x=1771370998; i=w_armin@gmx.de;
	bh=Tn/B/kcVmRbsMNNa+BCWfnwPQuwbbLmFiWjtD6Y4JOY=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=IrsM2JjyKl3/NC4OkE+XtiiCyaXIhsNx5COPLf7DzGp+fr4WISJRtIL1CEfGWmNx
	 2cFJM+UKskzCNvNBqGk/Sie2mGMCVvYl969vT+IhAZQoDrqagFRfJtjsZwpeOGDEX
	 QfTQirgBlsARVXZb5qsKsbusUp1t6xQEOawspLw0XhFUhylq6PAFd124IAQ/V4mQO
	 By/eIcQE7/0I9j+Ug4WiiKeJ+v5ODTUlDS3jYQXAIHoIgX9XP2DIALaK7zhYKSoBU
	 H5N9PYVRFTBpNHd9vMNL3rsEIzP24uaw/2Jy+S2Obu8g0Esu95C/TJRAbVeE9AoPq
	 f9AOQZv1Sz1HaUVxIA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.242.224]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MGQnF-1w1iCu3j6j-00BZFP; Wed, 11 Feb 2026 00:29:58 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: wse@tuxedocomputers.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] platform/x86: uniwill-laptop: Rename FN lock and super key lock attrs
Date: Wed, 11 Feb 2026 00:29:42 +0100
Message-Id: <20260210232946.302936-2-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260210232946.302936-1-W_Armin@gmx.de>
References: <20260210232946.302936-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:9ZpQr7I6yjFyTNsXkBWxLRSgK66gJPadff/OvXTW49ne61a9KsO
 5s7LZQ10mEhfvqqoH1nqQOIZ8/v0+nQs951qGOEND4lJVxh3gGlCArx+Hwr3nqrusZjhQ+S
 MKnygPlXbkfh8FatyXIhdXAgmAZb99hq4mTWmb/lQlPz7cg4Kjlr/wWysWgMeeHeywBmmkn
 9q0HmMGpZW/f2tJ2K5xew==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:BJZAGyvgqEs=;dEIFGQDhZtT06Tl3kQHo5QoZpu8
 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

It turns out that both sysfs attributes actually directly control
the FN lock status/super key enable status, rather than the
triggering of the associated events. This behavior was first observed
on a Tuxedo notebook and was belived to be a hardware quirk.
However, it seems that i simply misunderstood the manual of the
OEM software for Intel NUC devices. The correct behavior is:

- fn_lock_toggle_enable enables/disables FN lock mode
- super_key_toggle_enable enables/disables the super key

Rename both sysfs attributes to avoid confusing users.

Fixes: d050479693bb ("platform/x86: Add Uniwill laptop driver")
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 .../ABI/testing/sysfs-driver-uniwill-laptop   | 10 ++--
 drivers/platform/x86/uniwill/uniwill-acpi.c   | 46 +++++++++----------
 2 files changed, 27 insertions(+), 29 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-uniwill-laptop b/Docum=
entation/ABI/testing/sysfs-driver-uniwill-laptop
index eaeb659793d2..2df70792968f 100644
=2D-- a/Documentation/ABI/testing/sysfs-driver-uniwill-laptop
+++ b/Documentation/ABI/testing/sysfs-driver-uniwill-laptop
@@ -1,4 +1,4 @@
-What:		/sys/bus/platform/devices/INOU0000:XX/fn_lock_toggle_enable
+What:		/sys/bus/platform/devices/INOU0000:XX/fn_lock
 Date:		November 2025
 KernelVersion:	6.19
 Contact:	Armin Wolf <W_Armin@gmx.de>
@@ -8,15 +8,15 @@ Description:
=20
 		Reading this file returns the current enable status of the FN lock func=
tionality.
=20
-What:		/sys/bus/platform/devices/INOU0000:XX/super_key_toggle_enable
+What:		/sys/bus/platform/devices/INOU0000:XX/super_key_enable
 Date:		November 2025
 KernelVersion:	6.19
 Contact:	Armin Wolf <W_Armin@gmx.de>
 Description:
-                Allows userspace applications to enable/disable the super=
 key functionality
-                of the integrated keyboard by writing "1"/"0" into this f=
ile.
+		Allows userspace applications to enable/disable the super key of the in=
tegrated
+		keyboard by writing "1"/"0" into this file.
=20
-		Reading this file returns the current enable status of the super key fu=
nctionality.
+		Reading this file returns the current enable status of the super key.
=20
 What:		/sys/bus/platform/devices/INOU0000:XX/touchpad_toggle_enable
 Date:		November 2025
diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platfor=
m/x86/uniwill/uniwill-acpi.c
index 3c9af441d133..856d5e38e045 100644
=2D-- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -314,8 +314,8 @@
 #define LED_CHANNELS		3
 #define LED_MAX_BRIGHTNESS	200
=20
-#define UNIWILL_FEATURE_FN_LOCK_TOGGLE		BIT(0)
-#define UNIWILL_FEATURE_SUPER_KEY_TOGGLE	BIT(1)
+#define UNIWILL_FEATURE_FN_LOCK			BIT(0)
+#define UNIWILL_FEATURE_SUPER_KEY		BIT(1)
 #define UNIWILL_FEATURE_TOUCHPAD_TOGGLE		BIT(2)
 #define UNIWILL_FEATURE_LIGHTBAR		BIT(3)
 #define UNIWILL_FEATURE_BATTERY			BIT(4)
@@ -600,8 +600,8 @@ static const struct regmap_config uniwill_ec_config =
=3D {
 	.use_single_write =3D true,
 };
=20
-static ssize_t fn_lock_toggle_enable_store(struct device *dev, struct dev=
ice_attribute *attr,
-					   const char *buf, size_t count)
+static ssize_t fn_lock_store(struct device *dev, struct device_attribute =
*attr, const char *buf,
+			     size_t count)
 {
 	struct uniwill_data *data =3D dev_get_drvdata(dev);
 	unsigned int value;
@@ -624,8 +624,7 @@ static ssize_t fn_lock_toggle_enable_store(struct devi=
ce *dev, struct device_att
 	return count;
 }
=20
-static ssize_t fn_lock_toggle_enable_show(struct device *dev, struct devi=
ce_attribute *attr,
-					  char *buf)
+static ssize_t fn_lock_show(struct device *dev, struct device_attribute *=
attr, char *buf)
 {
 	struct uniwill_data *data =3D dev_get_drvdata(dev);
 	unsigned int value;
@@ -638,10 +637,10 @@ static ssize_t fn_lock_toggle_enable_show(struct dev=
ice *dev, struct device_attr
 	return sysfs_emit(buf, "%d\n", !!(value & FN_LOCK_STATUS));
 }
=20
-static DEVICE_ATTR_RW(fn_lock_toggle_enable);
+static DEVICE_ATTR_RW(fn_lock);
=20
-static ssize_t super_key_toggle_enable_store(struct device *dev, struct d=
evice_attribute *attr,
-					     const char *buf, size_t count)
+static ssize_t super_key_enable_store(struct device *dev, struct device_a=
ttribute *attr,
+				      const char *buf, size_t count)
 {
 	struct uniwill_data *data =3D dev_get_drvdata(dev);
 	unsigned int value;
@@ -673,8 +672,7 @@ static ssize_t super_key_toggle_enable_store(struct de=
vice *dev, struct device_a
 	return count;
 }
=20
-static ssize_t super_key_toggle_enable_show(struct device *dev, struct de=
vice_attribute *attr,
-					    char *buf)
+static ssize_t super_key_enable_show(struct device *dev, struct device_at=
tribute *attr, char *buf)
 {
 	struct uniwill_data *data =3D dev_get_drvdata(dev);
 	unsigned int value;
@@ -687,7 +685,7 @@ static ssize_t super_key_toggle_enable_show(struct dev=
ice *dev, struct device_at
 	return sysfs_emit(buf, "%d\n", !(value & SUPER_KEY_LOCK_STATUS));
 }
=20
-static DEVICE_ATTR_RW(super_key_toggle_enable);
+static DEVICE_ATTR_RW(super_key_enable);
=20
 static ssize_t touchpad_toggle_enable_store(struct device *dev, struct de=
vice_attribute *attr,
 					    const char *buf, size_t count)
@@ -881,8 +879,8 @@ static int uniwill_nvidia_ctgp_init(struct uniwill_dat=
a *data)
=20
 static struct attribute *uniwill_attrs[] =3D {
 	/* Keyboard-related */
-	&dev_attr_fn_lock_toggle_enable.attr,
-	&dev_attr_super_key_toggle_enable.attr,
+	&dev_attr_fn_lock.attr,
+	&dev_attr_super_key_enable.attr,
 	&dev_attr_touchpad_toggle_enable.attr,
 	/* Lightbar-related */
 	&dev_attr_rainbow_animation.attr,
@@ -897,13 +895,13 @@ static umode_t uniwill_attr_is_visible(struct kobjec=
t *kobj, struct attribute *a
 	struct device *dev =3D kobj_to_dev(kobj);
 	struct uniwill_data *data =3D dev_get_drvdata(dev);
=20
-	if (attr =3D=3D &dev_attr_fn_lock_toggle_enable.attr) {
-		if (uniwill_device_supports(data, UNIWILL_FEATURE_FN_LOCK_TOGGLE))
+	if (attr =3D=3D &dev_attr_fn_lock.attr) {
+		if (uniwill_device_supports(data, UNIWILL_FEATURE_FN_LOCK))
 			return attr->mode;
 	}
=20
-	if (attr =3D=3D &dev_attr_super_key_toggle_enable.attr) {
-		if (uniwill_device_supports(data, UNIWILL_FEATURE_SUPER_KEY_TOGGLE))
+	if (attr =3D=3D &dev_attr_super_key_enable.attr) {
+		if (uniwill_device_supports(data, UNIWILL_FEATURE_SUPER_KEY))
 			return attr->mode;
 	}
=20
@@ -1505,7 +1503,7 @@ static void uniwill_shutdown(struct platform_device =
*pdev)
=20
 static int uniwill_suspend_keyboard(struct uniwill_data *data)
 {
-	if (!uniwill_device_supports(data, UNIWILL_FEATURE_SUPER_KEY_TOGGLE))
+	if (!uniwill_device_supports(data, UNIWILL_FEATURE_SUPER_KEY))
 		return 0;
=20
 	/*
@@ -1565,7 +1563,7 @@ static int uniwill_resume_keyboard(struct uniwill_da=
ta *data)
 	unsigned int value;
 	int ret;
=20
-	if (!uniwill_device_supports(data, UNIWILL_FEATURE_SUPER_KEY_TOGGLE))
+	if (!uniwill_device_supports(data, UNIWILL_FEATURE_SUPER_KEY))
 		return 0;
=20
 	ret =3D regmap_read(data->regmap, EC_ADDR_SWITCH_STATUS, &value);
@@ -1643,16 +1641,16 @@ static struct platform_driver uniwill_driver =3D {
 };
=20
 static struct uniwill_device_descriptor lapac71h_descriptor __initdata =
=3D {
-	.features =3D UNIWILL_FEATURE_FN_LOCK_TOGGLE |
-		    UNIWILL_FEATURE_SUPER_KEY_TOGGLE |
+	.features =3D UNIWILL_FEATURE_FN_LOCK |
+		    UNIWILL_FEATURE_SUPER_KEY |
 		    UNIWILL_FEATURE_TOUCHPAD_TOGGLE |
 		    UNIWILL_FEATURE_BATTERY |
 		    UNIWILL_FEATURE_HWMON,
 };
=20
 static struct uniwill_device_descriptor lapkc71f_descriptor __initdata =
=3D {
-	.features =3D UNIWILL_FEATURE_FN_LOCK_TOGGLE |
-		    UNIWILL_FEATURE_SUPER_KEY_TOGGLE |
+	.features =3D UNIWILL_FEATURE_FN_LOCK |
+		    UNIWILL_FEATURE_SUPER_KEY |
 		    UNIWILL_FEATURE_TOUCHPAD_TOGGLE |
 		    UNIWILL_FEATURE_LIGHTBAR |
 		    UNIWILL_FEATURE_BATTERY |
=2D-=20
2.39.5

