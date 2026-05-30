Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9051C3A8730;
	Sat, 30 May 2026 17:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780160916; cv=none; b=jVORtDgsO3/OJUvi3IICsXc7g7wvmp9ESeP74vwZhaUYbRC8/FTV8ukICmB7B/r9oGcIKzHBmLXq+Fjws2j6Vf9IE4z5gy6hyphwjCeZuncE1lIKBY+/GdfBp3OSc++Luj5h4jUyYz2/Ghu3cVXEgTXjzQgJk6TCgfk/kYfoe3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780160916; c=relaxed/simple;
	bh=tfioD8tzufb4czgQBhbjTjKOedyhbKU0ajK48sNwHe0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XCNDUmosSvnes9CUm9+LVEOQRE7X9wbk3RkBjX6kLTm5UdAY57FAP1Jwh5kmQ5Ma5TqoK2GekPnexins9hn9y8R/a256vJHhxdZJQJXqSvP+PpOG6DDpyiJpP2neKowTc1VBTNhDoy9ns6PrMu6iNK3i39yCciyUJj/DuKu5n0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=G1WI6kCP; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="G1WI6kCP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1780160904; x=1780765704; i=w_armin@gmx.de;
	bh=4V7GiqYBxEcYkJSy4Vt7ACu0AIyZ49iMrz6wxhZOmu8=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=G1WI6kCPWmZxztnnAhT/PljhKiR8zpNvQTzzYPWmV0fQ7Vymdng2MLh0hCXuPsZT
	 g3pBCQACZUYPOptS01odbMxExIjVyPR0weTtoFKH6la5TTMif/0cNR26aT/1g2M3S
	 Oqt0ObSdKlSG/1/16CsRPWyLrdKiJ0MVUvKfaKDJNErOFXm0P/ooUA1l2jytMpgXM
	 n/Id0Op+NbRR/HLmoc+pIvZOVzaaL6dJX+NkTiqa0Py7jwCGbam196zOvx/tOXl1r
	 V49g0lZmXa/e0AV65JYRsA/bEOF4QabD2FfQkEcwLHpoOs76Klllpn149FEVFrn21
	 TyZrCFq2+OJe4nS7/Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M1po0-1wRAFE2Whk-00D2Uc; Sat, 30
 May 2026 19:08:24 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wse@tuxedocomputers.com
Subject: [PATCH 3/7] platform/x86: uniwill-laptop: Add AC auto boot support
Date: Sat, 30 May 2026 19:08:09 +0200
Message-Id: <20260530170813.10166-4-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:ezjNQhTr+txzP6hf1CJYqriBcJxZH6EmCtVBP+EISzfMRx21tj7
 ll2FiMX28lRfUhBtkEzAyXQOgUNTxX/zFSP64yP+uZ0vuRj+k2QvmK8dRhoqWHk5w18R7MA
 uHdhcZys8VmJWOVigPniNirmLVJSVRwyaGnYT4g1DftGg/BsCz8EleSohWDYMQtoiR6sTV9
 mhtPdVkL7ooFlhS4g8VpA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:xjjk3FZbFN0=;gpUQOfJk/Ur+i1wqIPKr/TQkEZ+
 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

Some devices support a "AC auto boot" feature where the system will
automatically boot when being connected to a power source.

Add support for this feature.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 .../ABI/testing/sysfs-driver-uniwill-laptop   | 11 ++++
 .../admin-guide/laptops/uniwill-laptop.rst    |  7 +++
 drivers/platform/x86/uniwill/uniwill-acpi.c   | 51 +++++++++++++++++++
 3 files changed, 69 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-driver-uniwill-laptop b/Docum=
entation/ABI/testing/sysfs-driver-uniwill-laptop
index 2397c65c969a..57272f906184 100644
=2D-- a/Documentation/ABI/testing/sysfs-driver-uniwill-laptop
+++ b/Documentation/ABI/testing/sysfs-driver-uniwill-laptop
@@ -78,3 +78,14 @@ Description:
=20
 		Reading this file returns the profile names with the currently active o=
ne in
 		brackets.
+
+What:		/sys/bus/platform/devices/INOU0000:XX/ac_auto_boot
+Date:		March 2026
+KernelVersion:	7.1
+Contact:	Armin Wolf <W_Armin@gmx.de>
+Description:
+		Allows userspace applications to configure if the device should boot au=
tomatically
+		when being connected to a power source. Writing "1"/"0" into this file
+		enables/disables this functionality.
+
+		Reading this file returns the current status of the AC auto boot functi=
onality.
diff --git a/Documentation/admin-guide/laptops/uniwill-laptop.rst b/Docume=
ntation/admin-guide/laptops/uniwill-laptop.rst
index 2b1e5da703a5..b6213fb1d3e0 100644
=2D-- a/Documentation/admin-guide/laptops/uniwill-laptop.rst
+++ b/Documentation/admin-guide/laptops/uniwill-laptop.rst
@@ -98,6 +98,13 @@ allow it.
=20
 See Documentation/ABI/testing/sysfs-driver-uniwill-laptop for details.
=20
+AC Auto Boot
+------------
+
+The ``uniwill-laptop`` driver allows the user to configure if the system =
should automatically
+boot when being connected to a power source, see
+Documentation/ABI/testing/sysfs-driver-uniwill-laptop for details.
+
 References
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platfor=
m/x86/uniwill/uniwill-acpi.c
index b3be2f2dbdd8..897c6163de53 100644
=2D-- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -112,6 +112,9 @@
=20
 #define EC_ADDR_BAT_CYCLE_COUNT_2	0x04A7
=20
+#define EC_ADDR_OEM_9			0x0726
+#define AC_AUTO_BOOT_ENABLE		BIT(3)
+
 #define EC_ADDR_PROJECT_ID		0x0740
 #define PROJECT_ID_NONE			0x00
 #define PROJECT_ID_GI			0x01
@@ -364,6 +367,7 @@
 #define UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL	BIT(10)
 #define UNIWILL_FEATURE_USB_C_POWER_PRIORITY	BIT(11)
 #define UNIWILL_FEATURE_KEYBOARD_BACKLIGHT	BIT(12)
+#define UNIWILL_FEATURE_AC_AUTO_BOOT		BIT(13)
=20
 enum usb_c_power_priority_options {
 	USB_C_POWER_PRIORITY_CHARGING =3D 0,
@@ -586,6 +590,7 @@ static const struct regmap_bus uniwill_ec_bus =3D {
 static bool uniwill_writeable_reg(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
+	case EC_ADDR_OEM_9:
 	case EC_ADDR_AP_OEM:
 	case EC_ADDR_LIGHTBAR_AC_CTRL:
 	case EC_ADDR_LIGHTBAR_AC_RED:
@@ -625,6 +630,7 @@ static bool uniwill_readable_reg(struct device *dev, u=
nsigned int reg)
 	case EC_ADDR_SECOND_FAN_RPM_1:
 	case EC_ADDR_SECOND_FAN_RPM_2:
 	case EC_ADDR_BAT_ALERT:
+	case EC_ADDR_OEM_9:
 	case EC_ADDR_PROJECT_ID:
 	case EC_ADDR_AP_OEM:
 	case EC_ADDR_LIGHTBAR_AC_CTRL:
@@ -1136,6 +1142,45 @@ static int usb_c_power_priority_init(struct uniwill=
_data *data)
 	return 0;
 }
=20
+static ssize_t ac_auto_boot_store(struct device *dev, struct device_attri=
bute *attr,
+				  const char *buf, size_t count)
+{
+	struct uniwill_data *data =3D dev_get_drvdata(dev);
+	unsigned int regval;
+	bool enable;
+	int ret;
+
+	ret =3D kstrtobool(buf, &enable);
+	if (ret < 0)
+		return ret;
+
+	if (enable)
+		regval =3D AC_AUTO_BOOT_ENABLE;
+	else
+		regval =3D 0;
+
+	ret =3D regmap_update_bits(data->regmap, EC_ADDR_OEM_9, AC_AUTO_BOOT_ENA=
BLE, regval);
+	if (ret < 0)
+		return ret;
+
+	return count;
+}
+
+static ssize_t ac_auto_boot_show(struct device *dev, struct device_attrib=
ute *attr, char *buf)
+{
+	struct uniwill_data *data =3D dev_get_drvdata(dev);
+	unsigned int regval;
+	int ret;
+
+	ret =3D regmap_read(data->regmap, EC_ADDR_OEM_9, &regval);
+	if (ret < 0)
+		return ret;
+
+	return sysfs_emit(buf, "%d\n", !!(regval & AC_AUTO_BOOT_ENABLE));
+}
+
+static DEVICE_ATTR_RW(ac_auto_boot);
+
 static struct attribute *uniwill_attrs[] =3D {
 	/* Keyboard-related */
 	&dev_attr_fn_lock.attr,
@@ -1147,6 +1192,7 @@ static struct attribute *uniwill_attrs[] =3D {
 	/* Power-management-related */
 	&dev_attr_ctgp_offset.attr,
 	&dev_attr_usb_c_power_priority.attr,
+	&dev_attr_ac_auto_boot.attr,
 	NULL
 };
=20
@@ -1186,6 +1232,11 @@ static umode_t uniwill_attr_is_visible(struct kobje=
ct *kobj, struct attribute *a
 			return attr->mode;
 	}
=20
+	if (attr =3D=3D &dev_attr_ac_auto_boot.attr) {
+		if (uniwill_device_supports(data, UNIWILL_FEATURE_AC_AUTO_BOOT))
+			return attr->mode;
+	}
+
 	return 0;
 }
=20
=2D-=20
2.39.5

