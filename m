Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C899D38D010;
	Mon,  6 Apr 2026 19:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775504231; cv=none; b=oYk+isq7ViNsmipCT7azmIDWHscnemg6s5haUrnUSo8Zs7dQ9jnkKWTv19IpaKiqfuMOKvhz/VcsPdS5DPIECJlnuCgBEArDRzcp90S9LaADVUNewRG3ijeAdIrlruKn97frGtsfki5LgcMB2o4j8xK+JpIdqraCgtcb9FONmJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775504231; c=relaxed/simple;
	bh=y74qQIqEi3csafPQG6kDQYFn19R48VOTJNK1XYJr7Rs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jT/BJhWCVupJJbbKBQIL1fdcwnsJQF2950RTPAzo9faOwTxmjRabT81HivdlWzFrAhiIGhBQIu5B0ah30Wifzg05nX0cRMzsooFpC4BgButZL0zBLUKwDGYwIOKAxzsTRjthQXTtY3UIs3PwxSzvLXctpg40bLmkkYu1i4pK/2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=e2nyHo6W; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="e2nyHo6W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1775504228; x=1776109028; i=w_armin@gmx.de;
	bh=+x3igDWEYVt+m3KEbk8uExBVUBQUDknkEFl0ZM2/lyQ=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=e2nyHo6Wkid9lLRIyNAWYV+Jib3vg+wgX3SE493UST3nWWEF6rRv2/rw4YiahjKx
	 1GzrYVQNHNVfkbHKJUotm7ZmR/EUewsl1KMGKo4zka6sIrDyKUnhSuj6pyH1JIkrj
	 sJOem2GrItNsrxy5evgAQl4QuEz6BeNMv/E2LlfQAaRAGl2JzaJPpruW9W7K1a+Hd
	 ixJ2t/jYyrLFUhKLn9GRJWeFQaZuoN1yYdsZfYEw0euat+5NjeeH6RYkPvFr7XTxd
	 T96H2nCnJZy8ofjDfKJqP2dJuG3Ba/ONAtAOK0ZBuMmXgBUrmg6H2uxO5ew/DUSbj
	 oK23B3Mp0cHPU660Ww==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MDhhX-1wIOSi3DT5-00GSUG; Mon, 06
 Apr 2026 21:37:07 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: wse@tuxedocomputers.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] platform/x86: uniwill-laptop: Rework FN lock/super key suspend handling
Date: Mon,  6 Apr 2026 21:36:51 +0200
Message-Id: <20260406193653.7799-5-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260406193653.7799-1-W_Armin@gmx.de>
References: <20260406193653.7799-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:wKPJkNAEUBfu7uDT/TVnL8EfjgifSnbO5f5qmSoYNEQ5PSEfAEP
 RCujiU/IhaArjzfRRp2VdNnwhsqag4Ldw9mwJP7S+jn8v81Sck/seMBpK+rxDEQkJ+BxCka
 ahDvBzXW3uGFv7TTjHv01AJvtar9x+zkaZafSqO/Fbue/v6yU61b6MVoLbfhM0vU+KxnG2c
 Mk9cgixNBuNc0zBFN8BIQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:eowKAbmH4f0=;5zCOeowoFJbWXmT6+Fg/reJlc7x
 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
 Y3

Currently the supend handling for the FN lock and super key enable
features saves the whole values of the affected registers instead of
the individual feature state. This duplicates the register access
logic from the associated sysfs attributes.

Rework the suspend handling to reuse said register access logic and
only store the individual feature state as a boolean value.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/uniwill/uniwill-acpi.c | 117 ++++++++++++--------
 1 file changed, 73 insertions(+), 44 deletions(-)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platfor=
m/x86/uniwill/uniwill-acpi.c
index 7c7ea0e76966..4d149b39d94e 100644
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

