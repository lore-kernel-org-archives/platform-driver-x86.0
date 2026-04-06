Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E7332ED29;
	Mon,  6 Apr 2026 19:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775504233; cv=none; b=aVWtjg1B/a97M0PlUSf60lli5j+R1rE+Vlak2hrnqTfTt2MHLLziP2Xz5kLV4j5ofR7hzfm0Y1fD6CxYflm0XUVbSpdD5sHNsPUaYT+MPaIWC/y4Z/D7kTQ7xgE0SU2Umt1woXpWfx/cXR11jTKvVZQXifEiy6UM7tAynyvJAgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775504233; c=relaxed/simple;
	bh=MeNhhhpS4+DknzpsFdCdkE0SU3Krx643NQcWp3tYrAc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hqHd5WGwdtTXZzQTg4bnTwpjS6aUbTmSZ/BxCAsO9ylPR0mZAUg8I2fD8tQWqzwq77CPV+JSX7WoFRBIJgQ8LgiXUh/pvPIhkEbVrfn5nqJZkx2tzr9jcM6un8hMk+kmSh8Q1jaVUakAgO71As4hy47obcFgsUSHq8J1b7/aAwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=H3fF0+fH; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="H3fF0+fH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1775504229; x=1776109029; i=w_armin@gmx.de;
	bh=xVuqGfJ0cGF24Izj0Ye+GFBoBKemKHuXB+COrZ4xdbM=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=H3fF0+fHBVJMhG5/+1Y10w73D9BeHMugoV+88fkA1uaq52saYVD7WrIN4+2eOQ7U
	 Z3oBj0SiEA9fz06qZEHJ1dDo0FIvOoQYHWURPBexzp0VgOKooKowkhqTp2ICIK7Fv
	 3lsjcJK5pcif+j03WZhxtfigtQZfLr3tqoPh+gYjDltHNL4EvgBPMgY6kOkcYT/Ip
	 +ZiP75cV3o8IpW1x3x9Md5q72fNTBYUJKpsiTvVLRFVztxDCneM4vz6vMULmQs+eI
	 oTzsUMVB05aGZuVhGVpJrY5ISBJWRVrFwATbOFWMUAZzreVG15HWNOhP0W5VEqI1D
	 UzMxsmPJkajfhrs00A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mq2nK-1vflzj1ffe-00lvKq; Mon, 06
 Apr 2026 21:37:09 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: wse@tuxedocomputers.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] platform/x86: uniwill-laptop: Mark EC_ADDR_OEM_4 as volatile
Date: Mon,  6 Apr 2026 21:36:52 +0200
Message-Id: <20260406193653.7799-6-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:JfuX4NW3GAT5agy0sPS+RVWB08wkXGkAo2CrBPXTV11qMe0FNEX
 dwULHzq4kjYrMNTnaJsThYkaFVPDAi7yeiES5LzvxLn/a5HFV+XlfT6P55nGkPG1XwBZ7oC
 4TYo1P7ZoSMa6YJrsNELDAOW5/NziqbVlqtZPw/hgWVfdUg6V+rqb6mdkBRqSjCzRwxqMz/
 EAErcqRSXyfZ1SoLrRo6A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:G9gAY1Fu2QQ=;CsD1i3eKa0Am/S51gL/oaw2ruyE
 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
 8cZNBrR26HW

It turned out that EC_ADDR_OEM_4 also contains bits with a volatile
nature. Mark the whole register as volatile to prepare for the usage
of said bits. This also means that we now have to save/restore the
touchpad toggle state ourself.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/uniwill/uniwill-acpi.c | 70 ++++++++++++++++++---
 1 file changed, 60 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platfor=
m/x86/uniwill/uniwill-acpi.c
index 4d149b39d94e..a116e2ec6453 100644
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

