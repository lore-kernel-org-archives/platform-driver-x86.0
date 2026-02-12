Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D1025B1DA;
	Thu, 12 Feb 2026 17:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770918254; cv=none; b=EQ4USAbwEl05nDHWbjoy8r6bHZCqpZNze6nl0J0360eXuwTHSy/AEDj3kl/eNuL7mDhVft6PCGBqWI1YFrvmb/UZATgI3QT5+21AtZoPPe+vtLXAwiJDg5VcihOweC11C9Bz2CWsurRF7y5vdzoe/GlSZzwtrhyjrkh9oVD/9KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770918254; c=relaxed/simple;
	bh=kSXNLSlhLMRH/McAU3ZITbbzDXSTa3OAkXVwqIUYkdw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hTPJ+3OHupJcnFfLysAgbsfCzhgyN2+NRIGgfQhgEMq/qMBzdwhGKjGKvuLrErNd8kjiTAPM0fadv/JHBbfLs251vKctNEwtIK4D0n5R2R6o+z1Ma9sy3T53Z32y5/x0+L8IEX53Yj3/OYTNDxnlLc0rDJZUNApCwTekxc3qoIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=nSQKncgX; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="nSQKncgX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1770918241; x=1771523041; i=w_armin@gmx.de;
	bh=1xkhUoG9ppqwnfNzy+l9eQqfhUKuVVXeQ5LTu3M+73I=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=nSQKncgXzN2mMt2mEcLP4AwNNRDIIe1+i0vuIGYaP9QauSdMTYWzm8TmQAg6j33X
	 x5u4B0orcongBk3aRCPoDjGDeGxGMnFYCqyvrlRBklsSqMivji4r6nCEMq/n+B77I
	 p5lBvwyyEavWyiU20g+rxjMdPKbDGlycnx0R8edV80MQMqqH+pznT7VX/3uTwpg+P
	 sOJLhcWw5H3TNb+VLun3wsimNs2cx85RASdRJmvavHvB2PVZf6ZFnl2JZktt2xEf/
	 L52F4xFgbpwbli8DMJ84yYtURIBONv/Y7wi/ToUlzAvtUpVbSLX7+smu27LiXioam
	 96nqBsIRv8rNj42W+w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.242.224]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1M4JmT-1vqriK10Gf-00E2Gq; Thu, 12 Feb 2026 18:44:01 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: wse@tuxedocomputers.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/5] platform/x86: uniwill-laptop: Rename FN lock and super key lock attrs
Date: Thu, 12 Feb 2026 18:43:51 +0100
Message-Id: <20260212174355.23965-2-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260212174355.23965-1-W_Armin@gmx.de>
References: <20260212174355.23965-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bzjohncZhFjK0njTFLBHHNpY8mP/J5LScmipgDxbVvZKddtU/B1
 8vVEk2Z3bTUJEY5RGqQ1+p9r+a2PbgQ1QLj/KM5NZXazk/6SMJiVugvWEa72AD+kK+++HHe
 32fLr68u9mjW6oqyFhB3312F7VAHBEotgJdAu4ZfZxBmWuuEnRvaXeCmJSPoWdWimO0g6fT
 tcM7ZnLYJ1U421je0NF9w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:+3l1yNRGlsg=;Q24Oq91Xxcg9HXMBUmUsju8ei/m
 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
 tjeEqAz053LOxlEFJl+H

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
 drivers/platform/x86/uniwill/uniwill-acpi.c   | 58 ++++++++++---------
 drivers/platform/x86/uniwill/uniwill-wmi.h    |  6 +-
 4 files changed, 39 insertions(+), 37 deletions(-)

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
index 3c9af441d133..2abae9faceb7 100644
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
@@ -377,11 +377,15 @@ static const struct key_entry uniwill_keymap[] =3D {
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
+	/*
+	 * Reported when the user enables/disables the super key.
+	 * Those events might even be reported when the change was done
+	 * using the sysfs attribute!
+	 */
+	{ KE_IGNORE,    UNIWILL_OSD_SUPER_KEY_DISABLE,		{ KEY_UNKNOWN }},
+	{ KE_IGNORE,    UNIWILL_OSD_SUPER_KEY_ENABLE,		{ KEY_UNKNOWN }},
 	/* Optional, might not be reported by all devices */
-	{ KE_IGNORE,	UNIWILL_OSD_SUPER_KEY_LOCK_CHANGED,	{ KEY_UNKNOWN }},
+	{ KE_IGNORE,	UNIWILL_OSD_SUPER_KEY_STATE_CHANGED,	{ KEY_UNKNOWN }},
=20
 	/* Reported in manual mode when toggling the airplane mode status */
 	{ KE_KEY,       UNIWILL_OSD_RFKILL,                     { KEY_RFKILL }},
@@ -600,8 +604,8 @@ static const struct regmap_config uniwill_ec_config =
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
@@ -624,8 +628,7 @@ static ssize_t fn_lock_toggle_enable_store(struct devi=
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
@@ -638,10 +641,10 @@ static ssize_t fn_lock_toggle_enable_show(struct dev=
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
@@ -673,8 +676,7 @@ static ssize_t super_key_toggle_enable_store(struct de=
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
@@ -687,7 +689,7 @@ static ssize_t super_key_toggle_enable_show(struct dev=
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
@@ -881,8 +883,8 @@ static int uniwill_nvidia_ctgp_init(struct uniwill_dat=
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
@@ -897,13 +899,13 @@ static umode_t uniwill_attr_is_visible(struct kobjec=
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
@@ -1505,7 +1507,7 @@ static void uniwill_shutdown(struct platform_device =
*pdev)
=20
 static int uniwill_suspend_keyboard(struct uniwill_data *data)
 {
-	if (!uniwill_device_supports(data, UNIWILL_FEATURE_SUPER_KEY_TOGGLE))
+	if (!uniwill_device_supports(data, UNIWILL_FEATURE_SUPER_KEY))
 		return 0;
=20
 	/*
@@ -1565,7 +1567,7 @@ static int uniwill_resume_keyboard(struct uniwill_da=
ta *data)
 	unsigned int value;
 	int ret;
=20
-	if (!uniwill_device_supports(data, UNIWILL_FEATURE_SUPER_KEY_TOGGLE))
+	if (!uniwill_device_supports(data, UNIWILL_FEATURE_SUPER_KEY))
 		return 0;
=20
 	ret =3D regmap_read(data->regmap, EC_ADDR_SWITCH_STATUS, &value);
@@ -1643,16 +1645,16 @@ static struct platform_driver uniwill_driver =3D {
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
index 48783b2e9ffb..fb1910c0f741 100644
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
@@ -74,7 +74,7 @@
=20
 #define UNIWILL_OSD_RFKILL			0xA4
=20
-#define UNIWILL_OSD_SUPER_KEY_LOCK_CHANGED	0xA5
+#define UNIWILL_OSD_SUPER_KEY_STATE_CHANGED	0xA5
=20
 #define UNIWILL_OSD_LIGHTBAR_STATE_CHANGED	0xA6
=20
=2D-=20
2.39.5

