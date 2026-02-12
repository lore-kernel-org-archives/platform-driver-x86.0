Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BFEE3594F;
	Thu, 12 Feb 2026 07:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770879769; cv=none; b=vBgnRK6lYppKzjLqkBVizE6qdJK1yk+NOLfkvDtqTV8ei233u/KvQ46OXFpIa02J7PeNpZZg+eqE2wzvd4BBByiAoQrF1ZGaj2shxi4170IiJ/oYfgBYYj7oHLSF0hVQPwHPdrmb/PAvsjKwRQU9bTpmnsWke72cerVbFhf95+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770879769; c=relaxed/simple;
	bh=ayeccREfQpvtGlfiVc18viu3guvYh0W7INbDvultY0Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZTRLcljbFI2he2iE4MsfEZsa3mNJPtnY3UMEC6DL+pi3jsFmBEJCcp2fhOur82c3ReGL/Ckfe6icIDQpe2m5kRBSxaU25OvuAEZsAPgk9ah5WX4XhzHIrofjnUgcgGQFqCDoFl8GTiMHEOIVjcOnzPru9edu3ddhuLZm59w1cKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=ox+vYl88; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="ox+vYl88"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1770879765; x=1771484565; i=w_armin@gmx.de;
	bh=hc4xV0ENrP7wE+WkCySf5E1F/9T/Os5OfmPbua+z7Vo=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ox+vYl88dTdhxZ0ZoTa0j703VjUZoy2dteAaiQjOniU9kyJgU5JCiINMD2XPptlB
	 tzQrQd4Y1VHFi8EmIkAiNrmXec4bfk6P8jus/I4XWE1ZGDSiR4x/IZn2wMaWkQZZA
	 +pdXwMe3l9Ymmk6XU6kuW9+VsoD+pSrLkLdCg86NH23v81wV6/vGgO8GsUWATRi9C
	 lDVP9PcIJ1ip71AoTrNGOSuFNu/z/Qf76skX2ZSZu/85WByRCHZwb8jLYybdL+0jK
	 C7QViN6bl25LDAH7T7YYNUN6yv8aSnlCllq4iLka+MhxEAIExiEP4Kyf841gc6YUm
	 hQHpZTb3PIZUwHQp8Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.242.224]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1M1Ycl-1voUeM0JFT-00Fgpc; Thu, 12 Feb 2026 08:02:45 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: wse@tuxedocomputers.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/5] platform/x86: uniwill-laptop: Rename FN lock and super key lock attrs
Date: Thu, 12 Feb 2026 08:02:32 +0100
Message-Id: <20260212070236.17296-2-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260212070236.17296-1-W_Armin@gmx.de>
References: <20260212070236.17296-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:NeHK2p3wzOfO/pvKa90DFWFCVa0yZay8Ll7shxL+NEKGgTN99Nt
 r/RJXZ6OHVPfPoxZkKK6iHM0eMfFThToS833t/na+bLqc0sqFaSE54FfTOgk//K+aVlkcXq
 NNuGtBNQBFWx4oVV4pgk70y8pKqLp+vn3Q9uvOaQraFPeP50W+64iizTmhb3fvTHEWibDdm
 dB3nStccYZFHwxQ5LS2bg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Y3jWlHP1tK8=;fQM/ctFwJd6BzzxPJqtrkwwiHoK
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
 .../admin-guide/laptops/uniwill-laptop.rst    |  2 +-
 drivers/platform/x86/uniwill/uniwill-acpi.c   | 52 +++++++++----------
 drivers/platform/x86/uniwill/uniwill-wmi.h    |  4 +-
 4 files changed, 33 insertions(+), 35 deletions(-)

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
diff --git a/Documentation/admin-guide/laptops/uniwill-laptop.rst b/Docume=
ntation/admin-guide/laptops/uniwill-laptop.rst
index a16baf15516b..aff5f57a6bd4 100644
=2D-- a/Documentation/admin-guide/laptops/uniwill-laptop.rst
+++ b/Documentation/admin-guide/laptops/uniwill-laptop.rst
@@ -24,7 +24,7 @@ Keyboard settings
=20
 The ``uniwill-laptop`` driver allows the user to enable/disable:
=20
- - the FN and super key lock functionality of the integrated keyboard
+ - the FN lock and super key of the integrated keyboard
  - the touchpad toggle functionality of the integrated touchpad
=20
 See Documentation/ABI/testing/sysfs-driver-uniwill-laptop for details.
diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platfor=
m/x86/uniwill/uniwill-acpi.c
index 3c9af441d133..30acf752adce 100644
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
@@ -377,9 +377,9 @@ static const struct key_entry uniwill_keymap[] =3D {
 	{ KE_IGNORE,    UNIWILL_OSD_CAPSLOCK,                   { KEY_CAPSLOCK }=
},
 	{ KE_IGNORE,    UNIWILL_OSD_NUMLOCK,                    { KEY_NUMLOCK }}=
,
=20
-	/* Reported when the user locks/unlocks the super key */
-	{ KE_IGNORE,    UNIWILL_OSD_SUPER_KEY_LOCK_ENABLE,      { KEY_UNKNOWN }}=
,
-	{ KE_IGNORE,    UNIWILL_OSD_SUPER_KEY_LOCK_DISABLE,     { KEY_UNKNOWN }}=
,
+	/* Reported when the user enables/disables the super key */
+	{ KE_IGNORE,    UNIWILL_OSD_SUPER_KEY_DISABLE,		{ KEY_UNKNOWN }},
+	{ KE_IGNORE,    UNIWILL_OSD_SUPER_KEY_ENABLE,		{ KEY_UNKNOWN }},
 	/* Optional, might not be reported by all devices */
 	{ KE_IGNORE,	UNIWILL_OSD_SUPER_KEY_LOCK_CHANGED,	{ KEY_UNKNOWN }},
=20
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
diff --git a/drivers/platform/x86/uniwill/uniwill-wmi.h b/drivers/platform=
/x86/uniwill/uniwill-wmi.h
index 48783b2e9ffb..fb1fd20392a0 100644
=2D-- a/drivers/platform/x86/uniwill/uniwill-wmi.h
+++ b/drivers/platform/x86/uniwill/uniwill-wmi.h
@@ -64,8 +64,8 @@
 #define UNIWILL_OSD_KB_LED_LEVEL3		0x3E
 #define UNIWILL_OSD_KB_LED_LEVEL4		0x3F
=20
-#define UNIWILL_OSD_SUPER_KEY_LOCK_ENABLE	0x40
-#define UNIWILL_OSD_SUPER_KEY_LOCK_DISABLE	0x41
+#define UNIWILL_OSD_SUPER_KEY_DISABLE		0x40
+#define UNIWILL_OSD_SUPER_KEY_ENABLE		0x41
=20
 #define UNIWILL_OSD_MENU_JP			0x42
=20
=2D-=20
2.39.5

