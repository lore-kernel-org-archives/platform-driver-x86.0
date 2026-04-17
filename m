Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84342364E9A;
	Fri, 17 Apr 2026 05:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776402584; cv=none; b=be/GG8O8gRz1tneopzTsRHlPC8371B8RIYMshWW7jbJLpD2PIeyYEYXTOPLEZmdJwSngqt2A41Z55ME3yTNeBFNitsa4pGRA4Mdejlz2/l2Qs4YRRb1OkX4FKtrxRuHkeURtELDKGDgcOJdzkiMtJ2oU6u+9Og8cBG0r9MUkNKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776402584; c=relaxed/simple;
	bh=pLU84bt5JDfx48jzemJz/pRusWR/Ek8PM+ig0RdVMIg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=B8sv21nlcczSZgVYNXXS/UASuovZKA+vm4p+pLEap52oCfwa+iL/DYIZqyIi+Yt9VPyGGBxYnJ9hr6Bv13XAG/56x/c5Sn0SjGtjSnlvjgdPCZJApjDooXaAULNfEl/gM+lXtXP5YYWZY/AfudJ15VQ6FwCajUR2shEXDRYwgEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=Y6UXu6KU; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="Y6UXu6KU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1776402566; x=1777007366; i=w_armin@gmx.de;
	bh=CT3LUk+B3I5ICPdtI7tnPJwg13IEnNXomld1pkqvUYU=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Y6UXu6KUuFqGmByXD1YZDHhwam73vXisjpFo/5sDxXCRmpJYezbz4wDVMhJsVgue
	 mm6OyglQaoEigce5ZoTlB0a3KHgEAKyZEgM+JbGjd6sk8YybO3Nbj5oLXCFB3NmDd
	 amE1QS0UlRXsrfjL197k3KZSJ6LktrdXW6HC6TVemuRsexPnBHFkUhlMp4mYov/Ur
	 SXkyR+CyOGnclds/aSsMjm6wnXPwJKQ9gmuS1Jvt8u82zzs7YYtEIhCXqHU4Dw24/
	 rd4nGCRH1o/MNS3NXFNqc3HUzEwXBsSWrSIeDxIYTDAIxwgFo+OuuPeqZoKa1eZKM
	 bSdbjgIwPEUTaidPdw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MC30P-1w7sR10o1d-006IVC; Fri, 17
 Apr 2026 07:09:26 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: wse@tuxedocomputers.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/7] platform/x86: uniwill-laptop: Mark EC_ADDR_OEM_4 as volatile
Date: Fri, 17 Apr 2026 07:09:11 +0200
Message-Id: <20260417050912.5582-7-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:SE5nxONcuRj8p6DpJc9C2ZgyoGmazxdF8vCgfTvPRNP8cwtZVun
 P7537WbSncLHypdtw+nY33OAp1S+EQl5uVer89ozY7KglqO3IzJUnFFSumFW2FheYcZ9PVD
 6MqWCSCAtk/2n2OHNZ8zbVulNxEF/zfQiNXTdHw2xlpaeJ99AE9SOvfb44HZgmwAX8oRxvK
 PRFDazm7QL93NKhjN81yQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:F7gr5m7hkVU=;AzftiSPPuCJxomPQ1udVMd2lG5u
 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
 w7aQPKx1WrAR4Bw==

It turned out that EC_ADDR_OEM_4 also contains bits with a volatile
nature. Mark the whole register as volatile to prepare for the usage
of said bits. This also means that we now have to save/restore the
touchpad toggle state ourself.

Reviewed-by: Werner Sembach <wse@tuxedocomputers.com>
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/uniwill/uniwill-acpi.c | 70 ++++++++++++++++++---
 1 file changed, 60 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platfor=
m/x86/uniwill/uniwill-acpi.c
index 8c00d762ab08..d4abcaf87e39 100644
=2D-- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -343,6 +343,7 @@ struct uniwill_data {
 	struct mutex battery_lock;	/* Protects the list of currently registered =
batteries */
 	bool last_fn_lock_state;
 	bool last_super_key_enable_state;
+	bool last_touchpad_toggle_enable_state;
 	struct mutex super_key_lock;	/* Protects the toggling of the super key l=
ock state */
 	struct list_head batteries;
 	struct mutex led_lock;		/* Protects writes to the lightbar registers */
@@ -598,6 +599,7 @@ static bool uniwill_volatile_reg(struct device *dev, u=
nsigned int reg)
 	case EC_ADDR_PWM_2:
 	case EC_ADDR_TRIGGER:
 	case EC_ADDR_SWITCH_STATUS:
+	case EC_ADDR_OEM_4:
 	case EC_ADDR_CHARGE_CTRL:
 	case EC_ADDR_USB_C_POWER_PRIORITY:
 		return true;
@@ -747,11 +749,22 @@ static ssize_t super_key_enable_show(struct device *=
dev, struct device_attribute
=20
 static DEVICE_ATTR_RW(super_key_enable);
=20
+static int uniwill_write_touchpad_toggle_enable(struct uniwill_data *data=
, bool status)
+{
+	unsigned int value;
+
+	if (status)
+		value =3D 0;
+	else
+		value =3D TOUCHPAD_TOGGLE_OFF;
+
+	return regmap_update_bits(data->regmap, EC_ADDR_OEM_4, TOUCHPAD_TOGGLE_O=
FF, value);
+}
+
 static ssize_t touchpad_toggle_enable_store(struct device *dev, struct de=
vice_attribute *attr,
 					    const char *buf, size_t count)
 {
 	struct uniwill_data *data =3D dev_get_drvdata(dev);
-	unsigned int value;
 	bool enable;
 	int ret;
=20
@@ -759,30 +772,39 @@ static ssize_t touchpad_toggle_enable_store(struct d=
evice *dev, struct device_at
 	if (ret < 0)
 		return ret;
=20
-	if (enable)
-		value =3D 0;
-	else
-		value =3D TOUCHPAD_TOGGLE_OFF;
-
-	ret =3D regmap_update_bits(data->regmap, EC_ADDR_OEM_4, TOUCHPAD_TOGGLE_=
OFF, value);
+	ret =3D uniwill_write_touchpad_toggle_enable(data, enable);
 	if (ret < 0)
 		return ret;
=20
 	return count;
 }
=20
+static int uniwill_read_touchpad_toggle_enable(struct uniwill_data *data,=
 bool *status)
+{
+	unsigned int value;
+	int ret;
+
+	ret =3D regmap_read(data->regmap, EC_ADDR_OEM_4, &value);
+	if (ret < 0)
+		return ret;
+
+	*status =3D !(value & TOUCHPAD_TOGGLE_OFF);
+
+	return 0;
+}
+
 static ssize_t touchpad_toggle_enable_show(struct device *dev, struct dev=
ice_attribute *attr,
 					   char *buf)
 {
 	struct uniwill_data *data =3D dev_get_drvdata(dev);
-	unsigned int value;
+	bool status;
 	int ret;
=20
-	ret =3D regmap_read(data->regmap, EC_ADDR_OEM_4, &value);
+	ret =3D uniwill_read_touchpad_toggle_enable(data, &status);
 	if (ret < 0)
 		return ret;
=20
-	return sysfs_emit(buf, "%d\n", !(value & TOUCHPAD_TOGGLE_OFF));
+	return sysfs_emit(buf, "%d\n", status);
 }
=20
 static DEVICE_ATTR_RW(touchpad_toggle_enable);
@@ -1774,6 +1796,18 @@ static int uniwill_suspend_super_key(struct uniwill=
_data *data)
 	return uniwill_read_super_key_enable(data, &data->last_super_key_enable_=
state);
 }
=20
+static int uniwill_suspend_touchpad_toggle(struct uniwill_data *data)
+{
+	if (!uniwill_device_supports(data, UNIWILL_FEATURE_TOUCHPAD_TOGGLE))
+		return 0;
+
+	/*
+	 * EC_ADDR_OEM_4 is marked as volatile, so we have to restore it
+	 * ourselves.
+	 */
+	return uniwill_read_touchpad_toggle_enable(data, &data->last_touchpad_to=
ggle_enable_state);
+}
+
 static int uniwill_suspend_battery(struct uniwill_data *data)
 {
 	if (!uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY))
@@ -1809,6 +1843,10 @@ static int uniwill_suspend(struct device *dev)
 	if (ret < 0)
 		return ret;
=20
+	ret =3D uniwill_suspend_touchpad_toggle(data);
+	if (ret < 0)
+		return ret;
+
 	ret =3D uniwill_suspend_battery(data);
 	if (ret < 0)
 		return ret;
@@ -1839,6 +1877,14 @@ static int uniwill_resume_super_key(struct uniwill_=
data *data)
 	return uniwill_write_super_key_enable(data, data->last_super_key_enable_=
state);
 }
=20
+static int uniwill_resume_touchpad_toggle(struct uniwill_data *data)
+{
+	if (!uniwill_device_supports(data, UNIWILL_FEATURE_TOUCHPAD_TOGGLE))
+		return 0;
+
+	return uniwill_write_touchpad_toggle_enable(data, data->last_touchpad_to=
ggle_enable_state);
+}
+
 static int uniwill_resume_battery(struct uniwill_data *data)
 {
 	if (!uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY))
@@ -1884,6 +1930,10 @@ static int uniwill_resume(struct device *dev)
 	if (ret < 0)
 		return ret;
=20
+	ret =3D uniwill_resume_touchpad_toggle(data);
+	if (ret < 0)
+		return ret;
+
 	ret =3D uniwill_resume_battery(data);
 	if (ret < 0)
 		return ret;
=2D-=20
2.39.5

