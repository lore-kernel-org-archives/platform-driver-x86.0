Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1D33A545D;
	Tue, 12 May 2026 23:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778628121; cv=none; b=t9NYnssd2xTuwMlGHcMfg+Xl98yCkG+Cm2M+GdQ5cI95dBKTboDussicAzv0RpSUoYf5Q62mA4XIA96J9Nu3zRGjmmMwWM9n1cpSpVAPZ2HEjuxLamSIQaLpdfH9pR7p0kK7c+CwXwnA5DO/XC/RfXEEU252EAyVeGt6YyR5tjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778628121; c=relaxed/simple;
	bh=TnWj3P+YprYNb4NlTShgbAtxqkHhc25ERkgzf8oikh4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cBUwNmomb43zJBW7ReQj2unBHCwLXPlvQVyx+mlTXL/G8BtgfmJP6X/MfD19LUt4zyA6ZRQYNa+ps78/9wzd+qTEogbWQA4JOIG/VV4oAY9tB26chcRODhuAwsz80r4sW07AjfiaqsttPA60k0jD4MA24f203jRV/FVJodZsb6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=mgAbJZ88; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="mgAbJZ88"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1778628117; x=1779232917; i=w_armin@gmx.de;
	bh=qFJkvD+yM7d33VkQRo+rIC4x2CIaJTf8AUJEj1UCK3w=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=mgAbJZ88FvKdNBzf8tl+0L/EE/fN1XxHop4LGCKdigGwoNKI1jGQyqjX+/30Paw+
	 14/2/QfVQI+1NXKfhxEocv2zc6j4ZlAa1VzjSf8Lh2zGrUQ2aGr4ihkkBIsviaKLt
	 9vohHcy2xvZUobQXvSAWEoWLsjGKMQUEEx9FsK5JL4hkb9i50uOIAsbE7MQEcWqb6
	 JExPkKNU8ZBFgfmarQiXAzsjfJShndPLN81U8p1+gIyaYseQJbyTdUjxC912aMHGu
	 sX5r4DDzmrLWVMIDN/i+iOUWptAvpJ+kwYKzha/oJCfZFeuGaO5A4eB27joPJNaF0
	 hAinRIk2sgH6/9QTkg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MryTF-1x9yIC1WLd-00cHJc; Wed, 13
 May 2026 01:21:57 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: wse@tuxedocomputers.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/8] platform/x86: uniwill-laptop: Mark EC_ADDR_OEM_4 as volatile
Date: Wed, 13 May 2026 01:21:43 +0200
Message-Id: <20260512232145.329260-7-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260512232145.329260-1-W_Armin@gmx.de>
References: <20260512232145.329260-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ETMa3J6ez+1XQtE0w+DLv87O6iPV2/3EpUTQl0UfUio50ddCl5m
 i1YPDwITXCdlgcBR0uDtK1AdN0Y6tQUxwrGuBfDvNtN7yKYAZTeD9QzoVUYYvhDkoTyhM/R
 wH+SIw25lCyh9o1pEVpLluuQyfEZUVyrVXEfYZJEBDscuN3N2gH6l/cVTk1kQ6H6JxdKXIk
 a54zDK0yo2OmBbGuAVc+A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:EDSs41HVaXY=;ug6RVGNcKlwYlfWCrusjXEHy5if
 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
 mhcFzZ+stfV7P5w==

It turned out that EC_ADDR_OEM_4 also contains bits with a volatile
nature. Mark the whole register as volatile to prepare for the usage
of said bits. This also means that we now have to save/restore the
touchpad toggle state ourself.

Reviewed-by: Werner Sembach <wse@tuxedocomputers.com>
Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/uniwill/uniwill-acpi.c | 70 ++++++++++++++++++---
 1 file changed, 60 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platfor=
m/x86/uniwill/uniwill-acpi.c
index c73e280a58bd..b08aa3a3f89d 100644
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
@@ -1782,6 +1804,18 @@ static int uniwill_suspend_super_key(struct uniwill=
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
@@ -1817,6 +1851,10 @@ static int uniwill_suspend(struct device *dev)
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
@@ -1847,6 +1885,14 @@ static int uniwill_resume_super_key(struct uniwill_=
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
@@ -1892,6 +1938,10 @@ static int uniwill_resume(struct device *dev)
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

