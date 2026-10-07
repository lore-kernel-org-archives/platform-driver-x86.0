Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673634734EB;
	Wed,  7 Oct 2026 14:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791384075; cv=none; b=sdaeeC3Rl3Ie6WsGD0rv/pEn9mwBN6PML42WLOno+jg+Poij5b+ZPZQDVCxDZWHuu3UOjmL2mcBSENmBdU0YfOBwzSWwoCLrlB6MRGmg4fKLfznt9xsz3hpVwuLMOeZsvdNsrPLxFx9dwlcK8lUJ7D59qo1Ef91eFMEvFl3itJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791384075; c=relaxed/simple;
	bh=aC84uxNOXN0rZTeUCjpi7jjb26F+61dQ/TCkm6u4rdA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u5Ox2JTPfMZ5TKPMH2T/7zIRHRK4tQCqM/0IVFAxMxrHFrCTbcDxRrxjex4VwEcBS0qLt+vFdxUkKS8v+8o2nV8mAHei7nHY/FikSdiEBb8Lai7B5tZh8XFkN10Dvby4zZa9+jToY8zwd8m0KKKWEo8/kaorzhd2/oakTtigFfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=VskvTgpz; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="VskvTgpz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1791384068; x=1791988868; i=w_armin@gmx.de;
	bh=muyr/LDpprVPRYm58cgnOeOOmGFpDiNz7GYD4VCjeE4=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=VskvTgpzNvpXwsGGbTKS9cbhCmzurjco0ZLwqoGCMrJNpYIdHkAfFIPMQBPdXws5
	 Xz0iPuyC/Rk9PikMPb5hEfuy7ndA/bBDv6Eh8WCdsievtZblEGH8A4vHqw2Nq5Pym
	 Hi7uxQdgquqs6gwB89RxyGk+e85tVjn6DZDsQM3vJglykN0oQnCMTfP+R0upENZPC
	 zmKtbVp7c7uUAhwDpwxHHp9q9nN4QIAEEYyYY8Xk4VWnCJyGi3PPTic0d2qYPlRPP
	 9o7GOdBQCAcbJu3H+NEQy3gai36ezwfd67Ikje/KyLm3wCkfTzNqcqRUC8/Ow+4Op
	 8yIDS/6Iw/+eXSQi2w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MmlXA-1wmafa0Psk-00fUy0; Wed, 07
 Oct 2026 16:41:08 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: wse@tuxedocomputers.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] platform/x86: uniwill-laptop: Implement rainbow animation as trigger
Date: Wed,  7 Oct 2026 16:38:55 +0200
Message-ID: <20261007144101.323289-3-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:MessoG2Yuh9lom7gkbdDR1HEW7OOB2CIQEu8gYpuOknUzlw1dbv
 osDvU4GILpyk44SvnHeZc2Xuyq4wGXnKiwiW3WP5iAwS6/8pvgZBtC4BADWXv4GZgVXTIl+
 n9Vumt9VvbAeHhrSrGp1Jw66yDFYmC+FWN1uw4siEc6aYjOgAbzumh7lWTnZjWHXZZ5FXjy
 nS01vrNO5EdRLniAEWExA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:pnZ+zwUTwgo=;YormrtK3du8MAz7IuQGxOEWDrFK
 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
 =

It turns out that some models require the lightbar to be activated
in order to display the rainbow animation, so users have to access
both the "rainbow_animation" sysfs attribute and the LED sysfs
interface when enabling the rainbow animation. This can cause short
glitches when the lightbar was previously disabled.

Fix this by replacing the sysfs attribute with a custom LED trigger
called "uniwill-rainbow". Selecting this trigger will atomically
activate the lightbar and enable the rainbow animation mode. This
can potentially break userspace applications using the old sysfs
attribute, but so far no such application is known to exist (yet).

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 .../ABI/removed/sysfs-driver-uniwill-laptop   |  10 ++
 .../ABI/testing/sysfs-driver-uniwill-laptop   |  11 --
 .../admin-guide/laptops/uniwill-laptop.rst    |   5 +-
 MAINTAINERS                                   |   1 +
 drivers/platform/x86/uniwill/Kconfig          |   1 +
 drivers/platform/x86/uniwill/uniwill-acpi.c   | 133 +++++++++++-------
 6 files changed, 95 insertions(+), 66 deletions(-)
 create mode 100644 Documentation/ABI/removed/sysfs-driver-uniwill-laptop

diff --git a/Documentation/ABI/removed/sysfs-driver-uniwill-laptop b/Docum=
entation/ABI/removed/sysfs-driver-uniwill-laptop
new file mode 100644
index 000000000000..c226efc23b59
=2D-- /dev/null
+++ b/Documentation/ABI/removed/sysfs-driver-uniwill-laptop
@@ -0,0 +1,10 @@
+What:		/sys/bus/platform/devices/INOU0000:XX/rainbow_animation
+Date:		November 2025
+KernelVersion:	6.19
+Contact:	Armin Wolf <W_Armin@gmx.de>
+Description:
+		Forces the integrated lightbar to display a rainbow animation when the =
machine
+		is not suspended. Writing "1"/"0" into this file enables/disables this
+		functionality.
+
+		Reading this file returns the current status of the rainbow animation f=
unctionality.
diff --git a/Documentation/ABI/testing/sysfs-driver-uniwill-laptop b/Docum=
entation/ABI/testing/sysfs-driver-uniwill-laptop
index 943f92c6b561..b9b9feebe2ed 100644
=2D-- a/Documentation/ABI/testing/sysfs-driver-uniwill-laptop
+++ b/Documentation/ABI/testing/sysfs-driver-uniwill-laptop
@@ -29,17 +29,6 @@ Description:
 		Reading this file returns the current enable status of the touchpad tog=
gle
 		functionality.
=20
-What:		/sys/bus/platform/devices/INOU0000:XX/rainbow_animation
-Date:		November 2025
-KernelVersion:	6.19
-Contact:	Armin Wolf <W_Armin@gmx.de>
-Description:
-		Forces the integrated lightbar to display a rainbow animation when the =
machine
-		is not suspended. Writing "1"/"0" into this file enables/disables this
-		functionality.
-
-		Reading this file returns the current status of the rainbow animation f=
unctionality.
-
 What:		/sys/bus/platform/devices/INOU0000:XX/breathing_in_suspend
 Date:		November 2025
 KernelVersion:	6.19
diff --git a/Documentation/admin-guide/laptops/uniwill-laptop.rst b/Docume=
ntation/admin-guide/laptops/uniwill-laptop.rst
index be50b45b82ef..aaf50e3074c1 100644
=2D-- a/Documentation/admin-guide/laptops/uniwill-laptop.rst
+++ b/Documentation/admin-guide/laptops/uniwill-laptop.rst
@@ -74,8 +74,9 @@ Lightbar
 The ``uniwill-laptop`` driver exposes the lightbar found on some models a=
s a standard multicolor
 LED class device. The default name of this LED class device is ``uniwill:=
multicolor:status``.
=20
-See Documentation/ABI/testing/sysfs-driver-uniwill-laptop for details on =
how to control the various
-animation modes of the lightbar.
+The lightbar supports a separate rainbow animation mode that can be enabl=
ed by selecting the
+`uniwill-rainbow` LED trigger. To enable a breathing animation during sus=
pend, see
+Documentation/ABI/testing/sysfs-driver-uniwill-laptop for details.
=20
 Keyboard Backlight
 ------------------
diff --git a/MAINTAINERS b/MAINTAINERS
index fa0571a5e479..f9dd979d0fa7 100644
=2D-- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28106,6 +28106,7 @@ UNIWILL LAPTOP DRIVER
 M:	Armin Wolf <W_Armin@gmx.de>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
+F:	Documentation/ABI/removed/sysfs-driver-uniwill-laptop
 F:	Documentation/ABI/testing/sysfs-driver-uniwill-laptop
 F:	Documentation/admin-guide/laptops/uniwill-laptop.rst
 F:	Documentation/wmi/devices/uniwill-laptop.rst
diff --git a/drivers/platform/x86/uniwill/Kconfig b/drivers/platform/x86/u=
niwill/Kconfig
index d07cc8440188..f80794bdfaef 100644
=2D-- a/drivers/platform/x86/uniwill/Kconfig
+++ b/drivers/platform/x86/uniwill/Kconfig
@@ -28,6 +28,7 @@ config UNIWILL_LAPTOP
 	depends on DMI
 	select REGMAP
 	select INPUT_SPARSEKMAP
+	select LEDS_TRIGGERS
 	help
 	  This driver adds support for various extra features found on Uniwill l=
aptops,
 	  like the lightbar, hwmon sensors and hotkeys. It also supports many OE=
M laptops
diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platfor=
m/x86/uniwill/uniwill-acpi.c
index 788bf4064d34..0fb0d267664a 100644
=2D-- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -900,51 +900,6 @@ static ssize_t touchpad_toggle_enable_show(struct dev=
ice *dev, struct device_att
=20
 static DEVICE_ATTR_RW(touchpad_toggle_enable);
=20
-static ssize_t rainbow_animation_store(struct device *dev, struct device_=
attribute *attr,
-				       const char *buf, size_t count)
-{
-	struct uniwill_data *data =3D dev_get_drvdata(dev);
-	unsigned int value;
-	bool enable;
-	int ret;
-
-	ret =3D kstrtobool(buf, &enable);
-	if (ret < 0)
-		return ret;
-
-	if (enable)
-		value =3D LIGHTBAR_WELCOME;
-	else
-		value =3D 0;
-
-	guard(mutex)(&data->led_lock);
-
-	ret =3D regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL, LIGHT=
BAR_WELCOME, value);
-	if (ret < 0)
-		return ret;
-
-	ret =3D regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_BAT_CTRL, LIGH=
TBAR_WELCOME, value);
-	if (ret < 0)
-		return ret;
-
-	return count;
-}
-
-static ssize_t rainbow_animation_show(struct device *dev, struct device_a=
ttribute *attr, char *buf)
-{
-	struct uniwill_data *data =3D dev_get_drvdata(dev);
-	unsigned int value;
-	int ret;
-
-	ret =3D regmap_read(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL, &value);
-	if (ret < 0)
-		return ret;
-
-	return sysfs_emit(buf, "%d\n", !!(value & LIGHTBAR_WELCOME));
-}
-
-static DEVICE_ATTR_RW(rainbow_animation);
-
 static ssize_t breathing_in_suspend_store(struct device *dev, struct devi=
ce_attribute *attr,
 					  const char *buf, size_t count)
 {
@@ -1258,7 +1213,6 @@ static struct attribute *uniwill_attrs[] =3D {
 	&dev_attr_super_key_enable.attr,
 	&dev_attr_touchpad_toggle_enable.attr,
 	/* Lightbar-related */
-	&dev_attr_rainbow_animation.attr,
 	&dev_attr_breathing_in_suspend.attr,
 	/* Power-management-related */
 	&dev_attr_ctgp_offset.attr,
@@ -1288,8 +1242,7 @@ static umode_t uniwill_attr_is_visible(struct kobjec=
t *kobj, struct attribute *a
 			return attr->mode;
 	}
=20
-	if (attr =3D=3D &dev_attr_rainbow_animation.attr ||
-	    attr =3D=3D &dev_attr_breathing_in_suspend.attr) {
+	if (attr =3D=3D &dev_attr_breathing_in_suspend.attr) {
 		if (uniwill_device_supports(data, UNIWILL_FEATURE_LIGHTBAR))
 			return attr->mode;
 	}
@@ -1537,6 +1490,59 @@ static int uniwill_led_brightness_set(struct led_cl=
assdev *led_cdev, enum led_br
 	return regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_BAT_CTRL, LIGHT=
BAR_S0_OFF, value);
 }
=20
+static int uniwill_led_hw_control_set(struct led_classdev *led_cdev, unsi=
gned long flags)
+{
+	struct led_classdev_mc *led_mc_cdev =3D lcdev_to_mccdev(led_cdev);
+	struct uniwill_data *data =3D container_of(led_mc_cdev, struct uniwill_d=
ata, led_mc_cdev);
+	unsigned int value;
+	int ret;
+
+	guard(mutex)(&data->led_lock);
+
+	if (flags)
+		value =3D LIGHTBAR_WELCOME;
+	else
+		value =3D LIGHTBAR_S0_OFF;
+
+	ret =3D regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL,
+				 LIGHTBAR_S0_OFF | LIGHTBAR_WELCOME, value);
+	if (ret < 0)
+		return ret;
+
+	ret =3D regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_BAT_CTRL,
+				 LIGHTBAR_S0_OFF | LIGHTBAR_WELCOME, value);
+	if (ret < 0)
+		return ret;
+
+	/* The LED is always on during hw control */
+	led_cdev->brightness =3D flags;
+
+	return 0;
+}
+
+static int uniwill_lightbar_trigger_activate(struct led_classdev *led_cde=
v)
+{
+	return led_cdev->hw_control_set(led_cdev, 1);
+}
+
+static void uniwill_lightbar_trigger_deactivate(struct led_classdev *led_=
cdev)
+{
+	int ret;
+
+	ret =3D led_cdev->hw_control_set(led_cdev, 0);
+	if (ret < 0)
+		dev_err(led_cdev->dev, "Failed to stop rainbow animation: %d\n", ret);
+}
+
+static struct led_hw_trigger_type uniwill_lightbar_trigger_type;
+
+static struct led_trigger uniwill_lightbar_trigger =3D {
+	.name =3D "uniwill-rainbow",
+	.activate =3D uniwill_lightbar_trigger_activate,
+	.deactivate =3D uniwill_lightbar_trigger_deactivate,
+	.trigger_type =3D &uniwill_lightbar_trigger_type,
+};
+
 #define LIGHTBAR_MASK	(LIGHTBAR_APP_EXISTS | LIGHTBAR_S0_OFF | LIGHTBAR_S=
3_OFF | LIGHTBAR_WELCOME)
=20
 static int uniwill_led_init(struct uniwill_data *data)
@@ -1587,12 +1593,18 @@ static int uniwill_led_init(struct uniwill_data *d=
ata)
 	data->led_mc_cdev.led_cdev.max_brightness =3D 1;
 	data->led_mc_cdev.led_cdev.flags =3D LED_REJECT_NAME_CONFLICT;
 	data->led_mc_cdev.led_cdev.brightness_set_blocking =3D uniwill_led_brigh=
tness_set;
+	data->led_mc_cdev.led_cdev.trigger_type =3D &uniwill_lightbar_trigger_ty=
pe;
+	data->led_mc_cdev.led_cdev.hw_control_trigger =3D uniwill_lightbar_trigg=
er.name;
+	data->led_mc_cdev.led_cdev.hw_control_set =3D uniwill_led_hw_control_set=
;
=20
 	if (value & LIGHTBAR_S0_OFF)
 		data->led_mc_cdev.led_cdev.brightness =3D 0;
 	else
 		data->led_mc_cdev.led_cdev.brightness =3D 1;
=20
+	if (value & LIGHTBAR_WELCOME)
+		data->led_mc_cdev.led_cdev.default_trigger =3D uniwill_lightbar_trigger=
.name;
+
 	for (int i =3D 0; i < LED_CHANNELS; i++) {
 		data->led_mc_subled_info[i].color_index =3D color_indices[i];
=20
@@ -3540,17 +3552,31 @@ static int __init uniwill_init(void)
 		pr_warn("Enabling potentially unsupported features\n");
 	}
=20
-	ret =3D platform_driver_register(&uniwill_driver);
+	/*
+	 * We cannot register the trigger inside the .probe callback of the
+	 * platform driver, because each trigger needs a unique name.
+	 */
+	ret =3D led_trigger_register(&uniwill_lightbar_trigger);
 	if (ret < 0)
 		return ret;
=20
+	ret =3D platform_driver_register(&uniwill_driver);
+	if (ret < 0)
+		goto err_platform;
+
 	ret =3D uniwill_wmi_register_driver();
-	if (ret < 0) {
-		platform_driver_unregister(&uniwill_driver);
-		return ret;
-	}
+	if (ret < 0)
+		goto err_wmi;
=20
 	return 0;
+
+err_wmi:
+	platform_driver_unregister(&uniwill_driver);
+
+err_platform:
+	led_trigger_unregister(&uniwill_lightbar_trigger);
+
+	return ret;
 }
 module_init(uniwill_init);
=20
@@ -3558,6 +3584,7 @@ static void __exit uniwill_exit(void)
 {
 	uniwill_wmi_unregister_driver();
 	platform_driver_unregister(&uniwill_driver);
+	led_trigger_unregister(&uniwill_lightbar_trigger);
 }
 module_exit(uniwill_exit);
=20
=2D-=20
2.55.0

