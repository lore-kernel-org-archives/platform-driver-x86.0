Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34876361DB5;
	Fri, 17 Apr 2026 05:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776402569; cv=none; b=aZFomGhaDk5MGx+PBgVjRPDBj9JZGyeMQfC2pp6NEWahDFKLkhVlCjLqOE2ATO9ga2hQAwGAf6vsta0wQFZz9GNvvbYtEkEdVb8H/EHb/9JIFzUKKF9ywuH1TZMWlk42mJEbOHzYl/IrVFpSVB6JUD6jfXwl2EsmOyXgV3S/5d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776402569; c=relaxed/simple;
	bh=7zRHg+u58keCGXWSvMzUsxUcGETy1PO1afLAvG0gy9c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NEmVzRUL4xp1siJZfhNGObytdDdsFoiY2nRC6xdmo5KeUkixy7wFEcmGyYHBJPm1p+hL3nP7EPXDnm8d0bPrxQCJ2I2y6x5m94zoM09/FxVYtRDbKLtKPWJk7Ic2ZSG+Fpe7C7Dfn9B37ndKkSgcJGLoM3UHvgXQDzVm1NRWbQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=kwQm90EC; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="kwQm90EC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1776402565; x=1777007365; i=w_armin@gmx.de;
	bh=4bdMC9ZLX4Xl7jAnbQO+DB5XAtMQn/m8uDMrwzGxS8U=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=kwQm90ECddoX8kOQxYaLSpH+HtuKSia4e2oSqJwkv+kaXuSAlv0wc09F4t5DN1r2
	 /KFcGlNpx8qC/5jyRHkMnPwjK42W367449p68omrw8obTYiFSuWFOhjKGVdPND1eJ
	 LvNwBkl4XB4FfX7rajcX48RZ20MX+9N/Ro/1NNiwabRZP/gpkRVGlnuKveJNB7hBx
	 kikxEU0FLzVZ1XXyPVxccEIed6R6s4eJKSD/FKsbH2rK47NTd2QWX4VJtkfbhwGsP
	 Pvsgf/JtMejZ7WwydXiX+eKIwqK/5ej8EEUmJ+AJo7nendYEdmOj+0SRW6d5Qw9FT
	 F4fDUin0PGorTrho4A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MkYXm-1vZMpX1ine-00hKG3; Fri, 17
 Apr 2026 07:09:25 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: wse@tuxedocomputers.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/7] platform/x86: uniwill-laptop: Rework FN lock/super key suspend handling
Date: Fri, 17 Apr 2026 07:09:10 +0200
Message-Id: <20260417050912.5582-6-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260417050912.5582-1-W_Armin@gmx.de>
References: <20260417050912.5582-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:LCsyggqmUvh9t4tUyXGT1ufYSzMMCMRssAlKPvN5qkzVBixkPA5
 MS2n8gmgM+Z81EV7tDOw2kG2uXggDr2UN28GkAMbTImxuAb/RHQ2ZwJnxdote5B0Y+kIUFZ
 2jF3efKzHsNbh6GdMTDNxEKb4l0YB3WIQeglTMjc28u1mero43gwCsTptD2dWKwFv/cCoQW
 qtCi9YZ/NkuJyKrzOd/8A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:0wp4dtm0Wng=;UGcPjYrdRVk3b+6DgmHdvrs99R4
 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
 5mec4rvk7Na/Jcql5VMVVD/h3eY=

Currently the suspend handling for the FN lock and super key enable
features saves the whole values of the affected registers instead of
the individual feature state. This duplicates the register access
logic from the associated sysfs attributes.

Rework the suspend handling to reuse said register access logic and
only store the individual feature state as a boolean value.

Reviewed-by: Werner Sembach <wse@tuxedocomputers.com>
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/uniwill/uniwill-acpi.c | 117 ++++++++++++--------
 1 file changed, 73 insertions(+), 44 deletions(-)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platfor=
m/x86/uniwill/uniwill-acpi.c
index dac80c78ca0b..8c00d762ab08 100644
=2D-- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -341,8 +341,8 @@ struct uniwill_data {
 	struct acpi_battery_hook hook;
 	unsigned int last_charge_ctrl;
 	struct mutex battery_lock;	/* Protects the list of currently registered =
batteries */
-	unsigned int last_status;
-	unsigned int last_switch_status;
+	bool last_fn_lock_state;
+	bool last_super_key_enable_state;
 	struct mutex super_key_lock;	/* Protects the toggling of the super key l=
ock state */
 	struct list_head batteries;
 	struct mutex led_lock;		/* Protects writes to the lightbar registers */
@@ -619,11 +619,22 @@ static const struct regmap_config uniwill_ec_config =
=3D {
 	.use_single_write =3D true,
 };
=20
+static int uniwill_write_fn_lock(struct uniwill_data *data, bool status)
+{
+	unsigned int value;
+
+	if (status)
+		value =3D FN_LOCK_STATUS;
+	else
+		value =3D 0;
+
+	return regmap_update_bits(data->regmap, EC_ADDR_BIOS_OEM, FN_LOCK_STATUS=
, value);
+}
+
 static ssize_t fn_lock_store(struct device *dev, struct device_attribute =
*attr, const char *buf,
 			     size_t count)
 {
 	struct uniwill_data *data =3D dev_get_drvdata(dev);
-	unsigned int value;
 	bool enable;
 	int ret;
=20
@@ -631,21 +642,15 @@ static ssize_t fn_lock_store(struct device *dev, str=
uct device_attribute *attr,
 	if (ret < 0)
 		return ret;
=20
-	if (enable)
-		value =3D FN_LOCK_STATUS;
-	else
-		value =3D 0;
-
-	ret =3D regmap_update_bits(data->regmap, EC_ADDR_BIOS_OEM, FN_LOCK_STATU=
S, value);
+	ret =3D uniwill_write_fn_lock(data, enable);
 	if (ret < 0)
 		return ret;
=20
 	return count;
 }
=20
-static ssize_t fn_lock_show(struct device *dev, struct device_attribute *=
attr, char *buf)
+static int uniwill_read_fn_lock(struct uniwill_data *data, bool *status)
 {
-	struct uniwill_data *data =3D dev_get_drvdata(dev);
 	unsigned int value;
 	int ret;
=20
@@ -653,23 +658,31 @@ static ssize_t fn_lock_show(struct device *dev, stru=
ct device_attribute *attr, c
 	if (ret < 0)
 		return ret;
=20
-	return sysfs_emit(buf, "%d\n", !!(value & FN_LOCK_STATUS));
-}
+	*status =3D !!(value & FN_LOCK_STATUS);
=20
-static DEVICE_ATTR_RW(fn_lock);
+	return 0;
+}
=20
-static ssize_t super_key_enable_store(struct device *dev, struct device_a=
ttribute *attr,
-				      const char *buf, size_t count)
+static ssize_t fn_lock_show(struct device *dev, struct device_attribute *=
attr, char *buf)
 {
 	struct uniwill_data *data =3D dev_get_drvdata(dev);
-	unsigned int value;
-	bool enable;
+	bool status;
 	int ret;
=20
-	ret =3D kstrtobool(buf, &enable);
+	ret =3D uniwill_read_fn_lock(data, &status);
 	if (ret < 0)
 		return ret;
=20
+	return sysfs_emit(buf, "%d\n", status);
+}
+
+static DEVICE_ATTR_RW(fn_lock);
+
+static int uniwill_write_super_key_enable(struct uniwill_data *data, bool=
 status)
+{
+	unsigned int value;
+	int ret;
+
 	guard(mutex)(&data->super_key_lock);
=20
 	ret =3D regmap_read(data->regmap, EC_ADDR_SWITCH_STATUS, &value);
@@ -680,20 +693,33 @@ static ssize_t super_key_enable_store(struct device =
*dev, struct device_attribut
 	 * We can only toggle the super key lock, so we return early if the sett=
ing
 	 * is already in the correct state.
 	 */
-	if (enable =3D=3D !(value & SUPER_KEY_LOCK_STATUS))
-		return count;
+	if (status =3D=3D !(value & SUPER_KEY_LOCK_STATUS))
+		return 0;
+
+	return regmap_write_bits(data->regmap, EC_ADDR_TRIGGER, TRIGGER_SUPER_KE=
Y_LOCK,
+				 TRIGGER_SUPER_KEY_LOCK);
+}
+
+static ssize_t super_key_enable_store(struct device *dev, struct device_a=
ttribute *attr,
+				      const char *buf, size_t count)
+{
+	struct uniwill_data *data =3D dev_get_drvdata(dev);
+	bool enable;
+	int ret;
=20
-	ret =3D regmap_write_bits(data->regmap, EC_ADDR_TRIGGER, TRIGGER_SUPER_K=
EY_LOCK,
-				TRIGGER_SUPER_KEY_LOCK);
+	ret =3D kstrtobool(buf, &enable);
+	if (ret < 0)
+		return ret;
+
+	ret =3D uniwill_write_super_key_enable(data, enable);
 	if (ret < 0)
 		return ret;
=20
 	return count;
 }
=20
-static ssize_t super_key_enable_show(struct device *dev, struct device_at=
tribute *attr, char *buf)
+static int uniwill_read_super_key_enable(struct uniwill_data *data, bool =
*status)
 {
-	struct uniwill_data *data =3D dev_get_drvdata(dev);
 	unsigned int value;
 	int ret;
=20
@@ -701,7 +727,22 @@ static ssize_t super_key_enable_show(struct device *d=
ev, struct device_attribute
 	if (ret < 0)
 		return ret;
=20
-	return sysfs_emit(buf, "%d\n", !(value & SUPER_KEY_LOCK_STATUS));
+	*status =3D !(value & SUPER_KEY_LOCK_STATUS);
+
+	return 0;
+}
+
+static ssize_t super_key_enable_show(struct device *dev, struct device_at=
tribute *attr, char *buf)
+{
+	struct uniwill_data *data =3D dev_get_drvdata(dev);
+	bool status;
+	int ret;
+
+	ret =3D uniwill_read_super_key_enable(data, &status);
+	if (ret < 0)
+		return ret;
+
+	return sysfs_emit(buf, "%d\n", status);
 }
=20
 static DEVICE_ATTR_RW(super_key_enable);
@@ -1715,10 +1756,10 @@ static int uniwill_suspend_fn_lock(struct uniwill_=
data *data)
 		return 0;
=20
 	/*
-	 * The EC_ADDR_BIOS_OEM is marked as volatile, so we have to restore it
+	 * EC_ADDR_BIOS_OEM is marked as volatile, so we have to restore it
 	 * ourselves.
 	 */
-	return regmap_read(data->regmap, EC_ADDR_BIOS_OEM, &data->last_status);
+	return uniwill_read_fn_lock(data, &data->last_fn_lock_state);
 }
=20
 static int uniwill_suspend_super_key(struct uniwill_data *data)
@@ -1727,10 +1768,10 @@ static int uniwill_suspend_super_key(struct uniwil=
l_data *data)
 		return 0;
=20
 	/*
-	 * The EC_ADDR_SWITCH_STATUS is marked as volatile, so we have to restor=
e it
+	 * EC_ADDR_SWITCH_STATUS is marked as volatile, so we have to restore it
 	 * ourselves.
 	 */
-	return regmap_read(data->regmap, EC_ADDR_SWITCH_STATUS, &data->last_swit=
ch_status);
+	return uniwill_read_super_key_enable(data, &data->last_super_key_enable_=
state);
 }
=20
 static int uniwill_suspend_battery(struct uniwill_data *data)
@@ -1787,27 +1828,15 @@ static int uniwill_resume_fn_lock(struct uniwill_d=
ata *data)
 	if (!uniwill_device_supports(data, UNIWILL_FEATURE_FN_LOCK))
 		return 0;
=20
-	return regmap_update_bits(data->regmap, EC_ADDR_BIOS_OEM, FN_LOCK_STATUS=
,
-				  data->last_status);
+	return uniwill_write_fn_lock(data, data->last_fn_lock_state);
 }
=20
 static int uniwill_resume_super_key(struct uniwill_data *data)
 {
-	unsigned int value;
-	int ret;
-
 	if (!uniwill_device_supports(data, UNIWILL_FEATURE_SUPER_KEY))
 		return 0;
=20
-	ret =3D regmap_read(data->regmap, EC_ADDR_SWITCH_STATUS, &value);
-	if (ret < 0)
-		return ret;
-
-	if ((data->last_switch_status & SUPER_KEY_LOCK_STATUS) =3D=3D (value & S=
UPER_KEY_LOCK_STATUS))
-		return 0;
-
-	return regmap_write_bits(data->regmap, EC_ADDR_TRIGGER, TRIGGER_SUPER_KE=
Y_LOCK,
-				 TRIGGER_SUPER_KEY_LOCK);
+	return uniwill_write_super_key_enable(data, data->last_super_key_enable_=
state);
 }
=20
 static int uniwill_resume_battery(struct uniwill_data *data)
=2D-=20
2.39.5

