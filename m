Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138663AFCF3;
	Sat, 30 May 2026 17:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780160916; cv=none; b=rLJS1OhRcK3Js0zHTOklaMsDXsaAaDh91bB5JNwNiYI6XPnz5iaCibOU3x6oqF98xt3HzUPPdQ83OO6ZeOSLHOtOY9xYyc39r8yRAhf3H5e0YV1pNMoD1FQiQ2fXJYaHMkxPUm3pWR/PdC14V/zU4cxRcqlX7yLCsUcdt1OxsG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780160916; c=relaxed/simple;
	bh=KXm9Beay7K60yl1c2uJfftzQRajOVXGaak+dHS33+ew=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=svl+KaQ2TqFJ0hoBoXtWDsngLibBSY3BmSfpJNwibmmIaWX/PvngG1+RXvBmt6XtUvWCXB6eux1jMXGtLdw7sW4ex9uRBgIAsUR0VftuWe2SYAtPn5d4fBSpMzhqLagE1S9grNfDY3kUGtb6MczAO+SyfneGBaots08jSB87UNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=kg2vJSA9; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="kg2vJSA9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1780160905; x=1780765705; i=w_armin@gmx.de;
	bh=7wgA/+jdf9HUuVZh2/vtmx45kw0Zgdss+e5MNnFWC2w=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=kg2vJSA9bC/xDya+U0yagbMfwCq2uIyRCGMXHUDWfeD8VIwL7o7VX2ACYWZEvL41
	 y4o/Oh16FvXeoGMLnWdOgf0X19fcdmVYOL5Sr3P0dTAM9yt7dIQGb6Zj0omtX3Qjc
	 AzK8lC/meN7V+OqBxTEgRAZUs/HONcyy5eRXHDjGEqGPEFva1JyXxy8b1cqKR/sEu
	 wt2kq8k0QQRqLlZI5IKjVYTdN7EBLXjRa1IlurrmyT/SSMS9U3LpDNixyd8wMJ1RN
	 jcEAxLhkU2EnjSXfu7fUmXU9xGjrh3+Jp4m9+sBrg0qvNA8AVBQdlwz0bwUEtEnPm
	 qUURnZj4rG74tH1dNQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MGhyc-1wXF4F16TS-00By99; Sat, 30
 May 2026 19:08:25 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wse@tuxedocomputers.com
Subject: [PATCH 4/7] platform/x86: uniwill-laptop: Add support for USB powershare
Date: Sat, 30 May 2026 19:08:10 +0200
Message-Id: <20260530170813.10166-5-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260530170813.10166-1-W_Armin@gmx.de>
References: <20260530170813.10166-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:A97XsTne4UgPDJyy8y4TYnF6HUFL0ue+PUr6s4IGeGP+TalVWDI
 eEUUkCu/ww9pUyrA34sBIeHuIMLMWKXqD8Z0e9p8hRimdViaowxKeIXoY8UHdJdtO67Z8sD
 GT5VnaYWIzyBGwp9Xn3hXmwQ9FevoK14gvXktLKOlJT5KUMIMLDskzzz2TDi74ohdhiQKl0
 68TxxqJvSesBAQKQjbCuQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ViQ1ASz96Ek=;aJMnBITU0OQiluVkRJbFajhb+ST
 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

Some devices support a "USB powershare" feature where the system will
continue to provide power via the USB ports when hibernating or
powered off.

Add support for this feaure.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 .../ABI/testing/sysfs-driver-uniwill-laptop   |  16 ++-
 .../admin-guide/laptops/uniwill-laptop.rst    |   7 ++
 drivers/platform/x86/uniwill/uniwill-acpi.c   | 100 ++++++++++++++++++
 3 files changed, 122 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-uniwill-laptop b/Docum=
entation/ABI/testing/sysfs-driver-uniwill-laptop
index 57272f906184..943f92c6b561 100644
=2D-- a/Documentation/ABI/testing/sysfs-driver-uniwill-laptop
+++ b/Documentation/ABI/testing/sysfs-driver-uniwill-laptop
@@ -86,6 +86,20 @@ Contact:	Armin Wolf <W_Armin@gmx.de>
 Description:
 		Allows userspace applications to configure if the device should boot au=
tomatically
 		when being connected to a power source. Writing "1"/"0" into this file
-		enables/disables this functionality.
+		enables/disables this functionality. Enabling both AC auto boot and USB=
 powershare
+		at the same time is not supported.
=20
 		Reading this file returns the current status of the AC auto boot functi=
onality.
+
+What:		/sys/bus/platform/devices/INOU0000:XX/usb_powershare_high
+Date:		March 2026
+KernelVersion:	7.1
+Contact:	Armin Wolf <W_Armin@gmx.de>
+Description:
+		Allows userspace applications to configure if the device should continu=
e to provide
+		power via the USB ports when hibernating or powered off. Might also inc=
rease the
+		power budget available to USB ports on some devices. Writing "1"/"0" in=
to this
+		file enables/disables this functionality. Enabling both USB powershare =
and AC auto
+		boot at the same time is not supported.
+
+		Reading this file returns the current status of the USB powershare func=
tionality.
diff --git a/Documentation/admin-guide/laptops/uniwill-laptop.rst b/Docume=
ntation/admin-guide/laptops/uniwill-laptop.rst
index b6213fb1d3e0..be50b45b82ef 100644
=2D-- a/Documentation/admin-guide/laptops/uniwill-laptop.rst
+++ b/Documentation/admin-guide/laptops/uniwill-laptop.rst
@@ -105,6 +105,13 @@ The ``uniwill-laptop`` driver allows the user to conf=
igure if the system should
 boot when being connected to a power source, see
 Documentation/ABI/testing/sysfs-driver-uniwill-laptop for details.
=20
+USB Powershare
+--------------
+
+The ``uniwill-laptop`` driver allows the user to configure if the system =
should continue to
+provide power via the USB ports when hibernating or powered off, see
+Documentation/ABI/testing/sysfs-driver-uniwill-laptop for details.
+
 References
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platfor=
m/x86/uniwill/uniwill-acpi.c
index 897c6163de53..00140c0a67a0 100644
=2D-- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -368,6 +368,7 @@
 #define UNIWILL_FEATURE_USB_C_POWER_PRIORITY	BIT(11)
 #define UNIWILL_FEATURE_KEYBOARD_BACKLIGHT	BIT(12)
 #define UNIWILL_FEATURE_AC_AUTO_BOOT		BIT(13)
+#define UNIWILL_FEATURE_USB_POWERSHARE		BIT(14)
=20
 enum usb_c_power_priority_options {
 	USB_C_POWER_PRIORITY_CHARGING =3D 0,
@@ -393,6 +394,7 @@ struct uniwill_data {
 	bool last_fn_lock_state;
 	bool last_super_key_enable_state;
 	bool last_touchpad_toggle_enable_state;
+	bool last_usb_powershare_high_state;
 	struct mutex super_key_lock;	/* Protects the toggling of the super key l=
ock state */
 	struct list_head batteries;
 	struct mutex led_lock;		/* Protects writes to the lightbar registers */
@@ -1181,6 +1183,70 @@ static ssize_t ac_auto_boot_show(struct device *dev=
, struct device_attribute *at
=20
 static DEVICE_ATTR_RW(ac_auto_boot);
=20
+static int uniwill_write_usb_powershare_high(struct uniwill_data *data, b=
ool status)
+{
+	unsigned int value;
+
+	if (status)
+		value =3D TRIGGER_USB_CHARGING;
+	else
+		value =3D 0;
+
+	/*
+	 * Normaly this RMW-sequence could also trigger the super key toggle,
+	 * but the EC seems to take care that those bits are always read as 0.
+	 */
+	return regmap_update_bits(data->regmap, EC_ADDR_TRIGGER, TRIGGER_USB_CHA=
RGING, value);
+}
+
+static ssize_t usb_powershare_high_store(struct device *dev, struct devic=
e_attribute *attr,
+					 const char *buf, size_t count)
+{
+	struct uniwill_data *data =3D dev_get_drvdata(dev);
+	bool enable;
+	int ret;
+
+	ret =3D kstrtobool(buf, &enable);
+	if (ret < 0)
+		return ret;
+
+	ret =3D uniwill_write_usb_powershare_high(data, enable);
+	if (ret < 0)
+		return ret;
+
+	return count;
+}
+
+static int uniwill_read_usb_powershare_high(struct uniwill_data *data, bo=
ol *status)
+{
+	unsigned int value;
+	int ret;
+
+	ret =3D regmap_read(data->regmap, EC_ADDR_TRIGGER, &value);
+	if (ret < 0)
+		return ret;
+
+	*status =3D !!(value & TRIGGER_USB_CHARGING);
+
+	return 0;
+}
+
+static ssize_t usb_powershare_high_show(struct device *dev, struct device=
_attribute *attr,
+					char *buf)
+{
+	struct uniwill_data *data =3D dev_get_drvdata(dev);
+	bool status;
+	int ret;
+
+	ret =3D uniwill_read_usb_powershare_high(data, &status);
+	if (ret < 0)
+		return ret;
+
+	return sysfs_emit(buf, "%d\n", status);
+}
+
+static DEVICE_ATTR_RW(usb_powershare_high);
+
 static struct attribute *uniwill_attrs[] =3D {
 	/* Keyboard-related */
 	&dev_attr_fn_lock.attr,
@@ -1193,6 +1259,7 @@ static struct attribute *uniwill_attrs[] =3D {
 	&dev_attr_ctgp_offset.attr,
 	&dev_attr_usb_c_power_priority.attr,
 	&dev_attr_ac_auto_boot.attr,
+	&dev_attr_usb_powershare_high.attr,
 	NULL
 };
=20
@@ -1237,6 +1304,11 @@ static umode_t uniwill_attr_is_visible(struct kobje=
ct *kobj, struct attribute *a
 			return attr->mode;
 	}
=20
+	if (attr =3D=3D &dev_attr_usb_powershare_high.attr) {
+		if (uniwill_device_supports(data, UNIWILL_FEATURE_USB_POWERSHARE))
+			return attr->mode;
+	}
+
 	return 0;
 }
=20
@@ -2382,6 +2454,18 @@ static int uniwill_suspend_kbd_led(struct uniwill_d=
ata *data)
 	return regmap_write(data->regmap, EC_ADDR_KBD_STATUS, regval);
 }
=20
+static int uniwill_suspend_usb_powershare(struct uniwill_data *data)
+{
+	if (!uniwill_device_supports(data, UNIWILL_FEATURE_USB_POWERSHARE))
+		return 0;
+
+	/*
+	 * EC_ADDR_TRIGGER is marked as volatile, so we have to restore it
+	 * ourselves.
+	 */
+	return uniwill_read_usb_powershare_high(data, &data->last_usb_powershare=
_high_state);
+}
+
 static int uniwill_suspend_nvidia_ctgp(struct uniwill_data *data)
 {
 	if (!uniwill_device_supports(data, UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL))
@@ -2416,6 +2500,10 @@ static int uniwill_suspend(struct device *dev)
 	if (ret < 0)
 		return ret;
=20
+	ret =3D uniwill_suspend_usb_powershare(data);
+	if (ret < 0)
+		return ret;
+
 	ret =3D uniwill_suspend_nvidia_ctgp(data);
 	if (ret < 0)
 		return ret;
@@ -2479,6 +2567,14 @@ static int uniwill_resume_kbd_led(struct uniwill_da=
ta *data)
 	return regmap_write_bits(data->regmap, EC_ADDR_TRIGGER, RGB_APPLY_COLOR,=
 RGB_APPLY_COLOR);
 }
=20
+static int uniwill_resume_usb_powershare(struct uniwill_data *data)
+{
+	if (!uniwill_device_supports(data, UNIWILL_FEATURE_USB_POWERSHARE))
+		return 0;
+
+	return uniwill_write_usb_powershare_high(data, data->last_usb_powershare=
_high_state);
+}
+
 static int uniwill_resume_nvidia_ctgp(struct uniwill_data *data)
 {
 	if (!uniwill_device_supports(data, UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL))
@@ -2527,6 +2623,10 @@ static int uniwill_resume(struct device *dev)
 	if (ret < 0)
 		return ret;
=20
+	ret =3D uniwill_resume_usb_powershare(data);
+	if (ret < 0)
+		return ret;
+
 	ret =3D uniwill_resume_nvidia_ctgp(data);
 	if (ret < 0)
 		return ret;
=2D-=20
2.39.5

