Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA3E2DE6E3;
	Sat,  5 Sep 2026 13:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788613325; cv=none; b=iB+9IcUFdcV6iRUo5jBXS5pb6y6vf3m8si1gXLZGSywXfH4fTODPBuwu1NVwrG2kUpLzj5xKogC3h7F2628c6Y2T5PeK423p3YJVaqPPsP5QqpExuQ2P3+2ROhihfrS04rEvqgMXFetXDIInfr+evjKrbNtgptwaGgiiVvEGfc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788613325; c=relaxed/simple;
	bh=g06xaQ8xvm4EQ20S7Tllh38C/jFvg/71HQaQ1eDACAQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=X9TiPKX02z8vZi8g6k9Xrs7gB6lOARE2mSbYZQQa1m84gwZeGMUPB+FdFbEUO7CdI58oZjI5VU9UCEivQ69n5qy/QM9fpNOi4Lm6uMoK8lkdoUeslgFaUFFdIi7Lj545pLcZCWo4SJK+ztE7CXHuwl4kiBPYspJRmRwG3kdMvTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=gVhguFDM; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="gVhguFDM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1788613303; x=1789218103; i=w_armin@gmx.de;
	bh=B/7ouJJkrzZcGpQRunLPQw3V5qhIWLeldblv/9lpywM=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=gVhguFDM58QDVCwqGjOAQzvfIM9LHRjtkiKxo1mseFEgYoIVVm/li+o7QF1xUSEH
	 Ez7nuJv9pHwpEFG+nDABAt2vTuAbn3GbwBtxNOMgMym7F3p9lwnDS44aj8S/Sh45L
	 GGzG5pzftZlgTmVRoQvQ1FDg/35JapH7Qa1Y1tZrLyN/6EUxBL8An4zPDT45r72eH
	 vmu+DQ+WM9jo7CVmQNkrj9Dc2h5pcNQ20Vws1Ax/tf6v9OLKOUwc9zP+pr0pPdgwF
	 q7xc2fXdtRW3CtW4Q5aFxl8WEYQQD49/nIYXzmY6ZdECgPBe/5GpjHV9BQN8hQ1ks
	 GP8/6CLliaxZqKu+hA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MhD6W-1wPuMu3l7y-00gYNS; Sat, 05
 Sep 2026 15:01:42 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: wse@tuxedocomputers.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] platform/x86: uniwill-laptop: Implement rainbow animation as trigger
Date: Sat,  5 Sep 2026 15:01:35 +0200
Message-Id: <20260905130138.6814-3-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:OVJ824pQ3+fRu91sRajupWAjRBaZECTYkXvzB3i9oqsSnrljDgI
 GrM7HM+dwjJ0BKagmcW19uwL2Jbn2FsB9pyPZPMcPZCOtKvC2n/N+j6HlZw5yky8sDYpZrx
 ZtrFu2EhTs5c6sGXLAEloQrWMb3w92FHigUWNhMyh2SZ5utb2o4+IHdple5Ojz/gyd3eeR3
 ePC4VW7QRD25O77c+jNIA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/uacXTay8po=;rQ75ZaaHNbxDYOPQ0Jqmgz7jE0u
 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
 UNJpSLIXmQzZKBn0S4tzIhyPc+6O6vUe3KA==

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
index 3a19da74d00c..a3e25d111203 100644
=2D-- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28107,6 +28107,7 @@ UNIWILL LAPTOP DRIVER
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
index 7420e1dd4716..6366171c6981 100644
=2D-- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -898,51 +898,6 @@ static ssize_t touchpad_toggle_enable_show(struct dev=
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
@@ -1256,7 +1211,6 @@ static struct attribute *uniwill_attrs[] =3D {
 	&dev_attr_super_key_enable.attr,
 	&dev_attr_touchpad_toggle_enable.attr,
 	/* Lightbar-related */
-	&dev_attr_rainbow_animation.attr,
 	&dev_attr_breathing_in_suspend.attr,
 	/* Power-management-related */
 	&dev_attr_ctgp_offset.attr,
@@ -1286,8 +1240,7 @@ static umode_t uniwill_attr_is_visible(struct kobjec=
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
@@ -1535,6 +1488,59 @@ static int uniwill_led_brightness_set(struct led_cl=
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
@@ -1585,12 +1591,18 @@ static int uniwill_led_init(struct uniwill_data *d=
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
@@ -3357,17 +3369,31 @@ static int __init uniwill_init(void)
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
@@ -3375,6 +3401,7 @@ static void __exit uniwill_exit(void)
 {
 	uniwill_wmi_unregister_driver();
 	platform_driver_unregister(&uniwill_driver);
+	led_trigger_unregister(&uniwill_lightbar_trigger);
 }
 module_exit(uniwill_exit);
=20
=2D-=20
2.39.5

