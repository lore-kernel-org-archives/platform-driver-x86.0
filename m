Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BC0383985;
	Tue, 12 May 2026 23:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778628122; cv=none; b=OrHHjtldgx6R7n9yb4q7Xwxk66ATgEUdDTnZX5BwTNa8+Wo/d8VIcrVs/Kox2buCi/UJ7IMd/u8u6p9v0hwZjLTt0ne/lNCUcgsu2Q7zEDTO2C6vufpZx3VvG0tFSiiOvcYkk6P7iVSbGs9bL/Ez8mCxZ00lcdf1EDjXLLpqu48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778628122; c=relaxed/simple;
	bh=FOztAJiQOMIP0E+tvEKeKclzXBIzq5ZIazQ4mUgPFgU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZvKFfBXSBzsYMNgWDYFvdrWgG+u2fGWaL48AhwrqaQoj/ywDwLGZX6l+kVJb0kAjc2xw72ilhgVoSJ30qD+g3hqCUhymcl84ULuVE6cfLdDeUo/JDJ5D4IdeWijIgXTvuN59vnPPku/QM8qX88xK1zQVEZOz5TGqXk8umeCSraM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=acElVWik; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="acElVWik"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1778628118; x=1779232918; i=w_armin@gmx.de;
	bh=WEEag9jOz+loIAJCGVDX9smWXuMtiGq/48fppDaoezo=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=acElVWik7lP2UbdltN/DnDT4uw5NRrSKPbetBvDhkzuVWstfy7FWgoTLaUppfk2t
	 pFQ2bXbuKg+YpUxr1qNn4y9183WynAqn8Iknh6lsqWeULyEKhZCBO75Fk/SZPfXw/
	 yN4oB1HNKLSb1WSg77HX156zf+2fG8vok88KNlHkFFsBM5wY379Mg958xqhZBTQPa
	 QfjiY5uepUbW7tOhoozqZ2eEl0JNkPxtKMmuRPKvahwzINI7EtrH3ybHRe6UUDYP0
	 k2Lp1kAjgHLXZZBqOjvYbzSkGtPhFmMOC6EbBhAcDGIIsUIGk76OJw+wBDuFRd6em
	 BHPG5Cy4wi4inoOZMA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MBUqF-1wYBVR0SeF-002HaX; Wed, 13
 May 2026 01:21:58 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: wse@tuxedocomputers.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 7/8] platform/x86: uniwill-laptop: Add support for battery charge modes
Date: Wed, 13 May 2026 01:21:44 +0200
Message-Id: <20260512232145.329260-8-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:w9ZLWlgT4Fq8+Tn3lhLr1FbBqPMLlJAJLpk+DT4kZZzvfje5lLq
 sRxZ489KXZHxZTLbrsvi4gqMdcLxUdzy00MLBKKBhOSzVrCSD/V8DD9KfgzcrxLQsI97Lev
 B2Av7DXCUtoB/Hegv780b6ZHgNA6pKlTtTIwn+a7J2YRhilYWLb/dpJmzHRVajDDp8DDK8V
 oic73l+/84x/TKHsAHv7g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:z3sPx/nG09Q=;mEH7zefC2cxPfOBuCMussUbxFRn
 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

Many Uniwill-based devices do not supports the already existing
charge limit functionality, but instead support an alternative
interface for controlling the battery charge algorithm.

Add support for this interface and update the documentation.

Reviewed-by: Werner Sembach <wse@tuxedocomputers.com>
Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 .../admin-guide/laptops/uniwill-laptop.rst    |  19 +-
 drivers/platform/x86/uniwill/uniwill-acpi.c   | 244 ++++++++++++++----
 drivers/platform/x86/uniwill/uniwill-wmi.c    |   5 +-
 3 files changed, 215 insertions(+), 53 deletions(-)

diff --git a/Documentation/admin-guide/laptops/uniwill-laptop.rst b/Docume=
ntation/admin-guide/laptops/uniwill-laptop.rst
index 1f3ca84c7d88..24b41dbab886 100644
=2D-- a/Documentation/admin-guide/laptops/uniwill-laptop.rst
+++ b/Documentation/admin-guide/laptops/uniwill-laptop.rst
@@ -46,11 +46,20 @@ Battery Charging Control
 .. warning:: Some devices do not properly implement the charging threshol=
d interface. Forcing
              the driver to enable access to said interface on such device=
s might damage the
              battery [1]_. Because of this the driver will not enable sai=
d feature even when
-             using the ``force`` module parameter.
-
-The ``uniwill-laptop`` driver supports controlling the battery charge lim=
it. This happens over
-the standard ``charge_control_end_threshold`` power supply sysfs attribut=
e. All values
-between 1 and 100 percent are supported.
+             using the ``force`` module parameter. The charging profile i=
nterface will be
+             available instead.
+
+The ``uniwill-laptop`` driver supports controlling the battery charge lim=
it. This either happens
+over the standard ``charge_control_end_threshold`` or ``charge_types`` po=
wer supply sysfs attribute,
+depending on the device. When using the ``charge_control_end_threshold`` =
sysfs attribute, all values
+between 1 and 100 percent are supported. When using the ``charge_types`` =
sysfs attribute, the driver
+supports switching between the ``Standard``, ``Trickle`` and ``Long Life`=
` profiles.
+
+Keep in mind that when using the ``charge_types`` sysfs attribute, the EC=
 firmware will hide the
+true charging status of the battery from the operating system, potentiall=
y misleading users into
+thinking that the charging profile does not work. Checking the ``current_=
now`` sysfs attribute
+tells you the true charging status of the battery even when using the ``c=
harge_types`` sysfs
+attribute (0 means that the battery is currently not charging).
=20
 Additionally the driver signals the presence of battery charging issues t=
hrough the standard
 ``health`` power supply sysfs attribute.
diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platfor=
m/x86/uniwill/uniwill-acpi.c
index b08aa3a3f89d..53a05a05c594 100644
=2D-- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -254,6 +254,10 @@
=20
 #define EC_ADDR_OEM_4			0x07A6
 #define OVERBOOST_DYN_TEMP_OFF		BIT(1)
+#define CHARGING_PROFILE_MASK		GENMASK(5, 4)
+#define CHARGING_PROFILE_HIGH_CAPACITY	0x00
+#define CHARGING_PROFILE_BALANCED	0x01
+#define CHARGING_PROFILE_STATIONARY	0x02
 #define TOUCHPAD_TOGGLE_OFF		BIT(6)
=20
 #define EC_ADDR_CHARGE_CTRL		0x07B9
@@ -320,13 +324,15 @@
 #define UNIWILL_FEATURE_SUPER_KEY		BIT(1)
 #define UNIWILL_FEATURE_TOUCHPAD_TOGGLE		BIT(2)
 #define UNIWILL_FEATURE_LIGHTBAR		BIT(3)
-#define UNIWILL_FEATURE_BATTERY			BIT(4)
-#define UNIWILL_FEATURE_CPU_TEMP		BIT(5)
-#define UNIWILL_FEATURE_GPU_TEMP		BIT(6)
-#define UNIWILL_FEATURE_PRIMARY_FAN		BIT(7)
-#define UNIWILL_FEATURE_SECONDARY_FAN		BIT(8)
-#define UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL	BIT(9)
-#define UNIWILL_FEATURE_USB_C_POWER_PRIORITY	BIT(10)
+#define UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT	BIT(4)
+/* Mutually exclusive with the charge limit feature */
+#define UNIWILL_FEATURE_BATTERY_CHARGE_MODES	BIT(5)
+#define UNIWILL_FEATURE_CPU_TEMP		BIT(6)
+#define UNIWILL_FEATURE_GPU_TEMP		BIT(7)
+#define UNIWILL_FEATURE_PRIMARY_FAN		BIT(8)
+#define UNIWILL_FEATURE_SECONDARY_FAN		BIT(9)
+#define UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL	BIT(10)
+#define UNIWILL_FEATURE_USB_C_POWER_PRIORITY	BIT(11)
=20
 enum usb_c_power_priority_options {
 	USB_C_POWER_PRIORITY_CHARGING =3D 0,
@@ -339,8 +345,15 @@ struct uniwill_data {
 	struct regmap *regmap;
 	unsigned int features;
 	struct acpi_battery_hook hook;
-	unsigned int last_charge_ctrl;
 	struct mutex battery_lock;	/* Protects the list of currently registered =
batteries */
+	union {
+		struct {
+			/* Protects writes to last_charge_type */
+			struct mutex charge_type_lock;
+			enum power_supply_charge_type last_charge_type;
+		};
+		unsigned int last_charge_ctrl;
+	};
 	bool last_fn_lock_state;
 	bool last_super_key_enable_state;
 	bool last_touchpad_toggle_enable_state;
@@ -447,6 +460,12 @@ static inline bool uniwill_device_supports(const stru=
ct uniwill_data *data,
 	return (data->features & features) =3D=3D features;
 }
=20
+static inline bool uniwill_device_supports_any(const struct uniwill_data =
*data,
+					       unsigned int features)
+{
+	return data->features & features;
+}
+
 static int uniwill_ec_reg_write(void *context, unsigned int reg, unsigned=
 int val)
 {
 	union acpi_object params[2] =3D {
@@ -1432,6 +1451,30 @@ static unsigned int uniwill_sanitize_battery_thresh=
old(unsigned int value)
 	return min(value, 100);
 }
=20
+static int uniwill_read_charge_type(struct uniwill_data *data, enum power=
_supply_charge_type *type)
+{
+	unsigned int value;
+	int ret;
+
+	ret =3D regmap_read(data->regmap, EC_ADDR_OEM_4, &value);
+	if (ret < 0)
+		return ret;
+
+	switch (FIELD_GET(CHARGING_PROFILE_MASK, value)) {
+	case CHARGING_PROFILE_HIGH_CAPACITY:
+		*type =3D POWER_SUPPLY_CHARGE_TYPE_STANDARD;
+		return 0;
+	case CHARGING_PROFILE_BALANCED:
+		*type =3D POWER_SUPPLY_CHARGE_TYPE_LONGLIFE;
+		return 0;
+	case CHARGING_PROFILE_STATIONARY:
+		*type =3D POWER_SUPPLY_CHARGE_TYPE_TRICKLE;
+		return 0;
+	default:
+		return -EPROTO;
+	}
+}
+
 static int uniwill_get_property(struct power_supply *psy, const struct po=
wer_supply_ext *ext,
 				void *drvdata, enum power_supply_property psp,
 				union power_supply_propval *val)
@@ -1442,6 +1485,16 @@ static int uniwill_get_property(struct power_supply=
 *psy, const struct power_sup
 	int ret;
=20
 	switch (psp) {
+	case POWER_SUPPLY_PROP_CHARGE_TYPES:
+		/*
+		 * We need to use the cached value here because the charging mode
+		 * reported by the EC might temporarily change when a external power
+		 * source has been connected.
+		 */
+		mutex_lock(&data->charge_type_lock);
+		val->intval =3D data->last_charge_type;
+		mutex_unlock(&data->charge_type_lock);
+		return 0;
 	case POWER_SUPPLY_PROP_HEALTH:
 		ret =3D power_supply_get_property_direct(psy, POWER_SUPPLY_PROP_PRESENT=
, &prop);
 		if (ret < 0)
@@ -1486,13 +1539,52 @@ static int uniwill_get_property(struct power_suppl=
y *psy, const struct power_sup
 	}
 }
=20
+static int uniwill_write_charge_type(struct uniwill_data *data, enum powe=
r_supply_charge_type type)
+{
+	unsigned int value;
+
+	switch (type) {
+	case POWER_SUPPLY_CHARGE_TYPE_TRICKLE:
+		value =3D FIELD_PREP(CHARGING_PROFILE_MASK, CHARGING_PROFILE_STATIONARY=
);
+		break;
+	case POWER_SUPPLY_CHARGE_TYPE_STANDARD:
+		value =3D FIELD_PREP(CHARGING_PROFILE_MASK, CHARGING_PROFILE_HIGH_CAPAC=
ITY);
+		break;
+	case POWER_SUPPLY_CHARGE_TYPE_LONGLIFE:
+		value =3D FIELD_PREP(CHARGING_PROFILE_MASK, CHARGING_PROFILE_BALANCED);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return regmap_update_bits(data->regmap, EC_ADDR_OEM_4, CHARGING_PROFILE_=
MASK, value);
+}
+
+static int uniwill_restore_charge_type(struct uniwill_data *data)
+{
+	guard(mutex)(&data->charge_type_lock);
+
+	return uniwill_write_charge_type(data, data->last_charge_type);
+}
+
 static int uniwill_set_property(struct power_supply *psy, const struct po=
wer_supply_ext *ext,
 				void *drvdata, enum power_supply_property psp,
 				const union power_supply_propval *val)
 {
 	struct uniwill_data *data =3D drvdata;
+	int ret;
=20
 	switch (psp) {
+	case POWER_SUPPLY_PROP_CHARGE_TYPES:
+		mutex_lock(&data->charge_type_lock);
+
+		ret =3D uniwill_write_charge_type(data, val->intval);
+		if (ret >=3D 0)
+			data->last_charge_type =3D val->intval;
+
+		mutex_unlock(&data->charge_type_lock);
+
+		return ret;
 	case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
 		if (val->intval < 0 || val->intval > 100)
 			return -EINVAL;
@@ -1508,21 +1600,41 @@ static int uniwill_property_is_writeable(struct po=
wer_supply *psy,
 					 const struct power_supply_ext *ext, void *drvdata,
 					 enum power_supply_property psp)
 {
-	if (psp =3D=3D POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD)
+	switch (psp) {
+	case POWER_SUPPLY_PROP_CHARGE_TYPES:
+	case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
 		return true;
-
-	return false;
+	default:
+		return false;
+	}
 }
=20
-static const enum power_supply_property uniwill_properties[] =3D {
+static const enum power_supply_property uniwill_charge_limit_properties[]=
 =3D {
 	POWER_SUPPLY_PROP_HEALTH,
 	POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD,
 };
=20
-static const struct power_supply_ext uniwill_extension =3D {
+static const struct power_supply_ext uniwill_charge_limit_extension =3D {
 	.name =3D DRIVER_NAME,
-	.properties =3D uniwill_properties,
-	.num_properties =3D ARRAY_SIZE(uniwill_properties),
+	.properties =3D uniwill_charge_limit_properties,
+	.num_properties =3D ARRAY_SIZE(uniwill_charge_limit_properties),
+	.get_property =3D uniwill_get_property,
+	.set_property =3D uniwill_set_property,
+	.property_is_writeable =3D uniwill_property_is_writeable,
+};
+
+static const enum power_supply_property uniwill_charge_modes_properties[]=
 =3D {
+	POWER_SUPPLY_PROP_CHARGE_TYPES,
+	POWER_SUPPLY_PROP_HEALTH,
+};
+
+static const struct power_supply_ext uniwill_charge_modes_extension =3D {
+	.name =3D DRIVER_NAME,
+	.charge_types =3D BIT(POWER_SUPPLY_CHARGE_TYPE_TRICKLE) |
+			BIT(POWER_SUPPLY_CHARGE_TYPE_STANDARD) |
+			BIT(POWER_SUPPLY_CHARGE_TYPE_LONGLIFE),
+	.properties =3D uniwill_charge_modes_properties,
+	.num_properties =3D ARRAY_SIZE(uniwill_charge_modes_properties),
 	.get_property =3D uniwill_get_property,
 	.set_property =3D uniwill_set_property,
 	.property_is_writeable =3D uniwill_property_is_writeable,
@@ -1538,7 +1650,13 @@ static int uniwill_add_battery(struct power_supply =
*battery, struct acpi_battery
 	if (!entry)
 		return -ENOMEM;
=20
-	ret =3D power_supply_register_extension(battery, &uniwill_extension, dat=
a->dev, data);
+	if (uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT))
+		ret =3D power_supply_register_extension(battery, &uniwill_charge_limit_=
extension,
+						      data->dev, data);
+	else
+		ret =3D power_supply_register_extension(battery, &uniwill_charge_modes_=
extension,
+						      data->dev, data);
+
 	if (ret < 0) {
 		kfree(entry);
 		return ret;
@@ -1567,7 +1685,10 @@ static int uniwill_remove_battery(struct power_supp=
ly *battery, struct acpi_batt
 		}
 	}
=20
-	power_supply_unregister_extension(battery, &uniwill_extension);
+	if (uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT))
+		power_supply_unregister_extension(battery, &uniwill_charge_limit_extens=
ion);
+	else
+		power_supply_unregister_extension(battery, &uniwill_charge_modes_extens=
ion);
=20
 	return 0;
 }
@@ -1577,28 +1698,37 @@ static int uniwill_battery_init(struct uniwill_dat=
a *data)
 	unsigned int value, threshold, sanitized;
 	int ret;
=20
-	if (!uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY))
-		return 0;
+	if (uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT))=
 {
+		ret =3D regmap_read(data->regmap, EC_ADDR_CHARGE_CTRL, &value);
+		if (ret < 0)
+			return ret;
=20
-	ret =3D regmap_read(data->regmap, EC_ADDR_CHARGE_CTRL, &value);
-	if (ret < 0)
-		return ret;
+		/*
+		 * The charge control threshold might be initialized with 0 by
+		 * the EC to signal that said threshold is uninitialized. We thus
+		 * need to replace this placeholder value with a valid one (100)
+		 * to signal that we want to take control of battery charging.
+		 * For the sake of completeness we also apply this to other
+		 * invalid threshold values.
+		 */
+		threshold =3D FIELD_GET(CHARGE_CTRL_MASK, value);
+		sanitized =3D uniwill_sanitize_battery_threshold(threshold);
+		if (threshold !=3D sanitized) {
+			FIELD_MODIFY(CHARGE_CTRL_MASK, &value, sanitized);
+			ret =3D regmap_write(data->regmap, EC_ADDR_CHARGE_CTRL, value);
+			if (ret < 0)
+				return ret;
+		}
+	} else if (uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY_CHARGE_=
MODES)) {
+		ret =3D devm_mutex_init(data->dev, &data->charge_type_lock);
+		if (ret < 0)
+			return ret;
=20
-	/*
-	 * The charge control threshold might be initialized with 0 by
-	 * the EC to signal that said threshold is uninitialized. We thus
-	 * need to replace this placeholder value with a valid one (100)
-	 * to signal that we want to take control of battery charging.
-	 * For the sake of completeness we also apply this to other
-	 * invalid threshold values.
-	 */
-	threshold =3D FIELD_GET(CHARGE_CTRL_MASK, value);
-	sanitized =3D uniwill_sanitize_battery_threshold(threshold);
-	if (threshold !=3D sanitized) {
-		FIELD_MODIFY(CHARGE_CTRL_MASK, &value, sanitized);
-		ret =3D regmap_write(data->regmap, EC_ADDR_CHARGE_CTRL, value);
+		ret =3D uniwill_read_charge_type(data, &data->last_charge_type);
 		if (ret < 0)
 			return ret;
+	} else {
+		return 0;
 	}
=20
 	ret =3D devm_mutex_init(data->dev, &data->battery_lock);
@@ -1617,10 +1747,13 @@ static int uniwill_notifier_call(struct notifier_b=
lock *nb, unsigned long action
 {
 	struct uniwill_data *data =3D container_of(nb, struct uniwill_data, nb);
 	struct uniwill_battery_entry *entry;
+	int ret;
=20
 	switch (action) {
 	case UNIWILL_OSD_BATTERY_ALERT:
-		if (!uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY))
+		if (!uniwill_device_supports_any(data,
+						 UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT |
+						 UNIWILL_FEATURE_BATTERY_CHARGE_MODES))
 			return NOTIFY_DONE;
=20
 		mutex_lock(&data->battery_lock);
@@ -1631,10 +1764,24 @@ static int uniwill_notifier_call(struct notifier_b=
lock *nb, unsigned long action
=20
 		return NOTIFY_OK;
 	case UNIWILL_OSD_DC_ADAPTER_CHANGED:
-		if (!uniwill_device_supports(data, UNIWILL_FEATURE_USB_C_POWER_PRIORITY=
))
+		if (!uniwill_device_supports_any(data,
+						 UNIWILL_FEATURE_BATTERY_CHARGE_MODES |
+						 UNIWILL_FEATURE_USB_C_POWER_PRIORITY))
 			return NOTIFY_DONE;
=20
-		return notifier_from_errno(usb_c_power_priority_restore(data));
+		if (uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY_CHARGE_MODES)=
) {
+			ret =3D uniwill_restore_charge_type(data);
+			if (ret < 0)
+				return notifier_from_errno(ret);
+		}
+
+		if (uniwill_device_supports(data, UNIWILL_FEATURE_USB_C_POWER_PRIORITY)=
) {
+			ret =3D usb_c_power_priority_restore(data);
+			if (ret < 0)
+				return notifier_from_errno(ret);
+		}
+
+		return NOTIFY_OK;
 	case UNIWILL_OSD_FN_LOCK:
 		if (!uniwill_device_supports(data, UNIWILL_FEATURE_FN_LOCK))
 			return NOTIFY_DONE;
@@ -1818,7 +1965,7 @@ static int uniwill_suspend_touchpad_toggle(struct un=
iwill_data *data)
=20
 static int uniwill_suspend_battery(struct uniwill_data *data)
 {
-	if (!uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY))
+	if (!uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT)=
)
 		return 0;
=20
 	/*
@@ -1895,11 +2042,14 @@ static int uniwill_resume_touchpad_toggle(struct u=
niwill_data *data)
=20
 static int uniwill_resume_battery(struct uniwill_data *data)
 {
-	if (!uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY))
-		return 0;
+	if (uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY_CHARGE_MODES))
+		return uniwill_restore_charge_type(data);
=20
-	return regmap_update_bits(data->regmap, EC_ADDR_CHARGE_CTRL, CHARGE_CTRL=
_MASK,
-				  data->last_charge_ctrl);
+	if (uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT))
+		return regmap_update_bits(data->regmap, EC_ADDR_CHARGE_CTRL, CHARGE_CTR=
L_MASK,
+					  data->last_charge_ctrl);
+
+	return 0;
 }
=20
 static int uniwill_resume_nvidia_ctgp(struct uniwill_data *data)
@@ -1978,7 +2128,7 @@ static struct platform_driver uniwill_driver =3D {
=20
 static struct uniwill_device_descriptor lapqc71a_lapqc71b_descriptor __in=
itdata =3D {
 	.features =3D UNIWILL_FEATURE_SUPER_KEY |
-		    UNIWILL_FEATURE_BATTERY |
+		    UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT |
 		    UNIWILL_FEATURE_CPU_TEMP |
 		    UNIWILL_FEATURE_GPU_TEMP |
 		    UNIWILL_FEATURE_PRIMARY_FAN |
@@ -1989,7 +2139,7 @@ static struct uniwill_device_descriptor lapac71h_des=
criptor __initdata =3D {
 	.features =3D UNIWILL_FEATURE_FN_LOCK |
 		    UNIWILL_FEATURE_SUPER_KEY |
 		    UNIWILL_FEATURE_TOUCHPAD_TOGGLE |
-		    UNIWILL_FEATURE_BATTERY |
+		    UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT |
 		    UNIWILL_FEATURE_CPU_TEMP |
 		    UNIWILL_FEATURE_GPU_TEMP |
 		    UNIWILL_FEATURE_PRIMARY_FAN |
@@ -2001,7 +2151,7 @@ static struct uniwill_device_descriptor lapkc71f_des=
criptor __initdata =3D {
 		    UNIWILL_FEATURE_SUPER_KEY |
 		    UNIWILL_FEATURE_TOUCHPAD_TOGGLE |
 		    UNIWILL_FEATURE_LIGHTBAR |
-		    UNIWILL_FEATURE_BATTERY |
+		    UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT |
 		    UNIWILL_FEATURE_CPU_TEMP |
 		    UNIWILL_FEATURE_GPU_TEMP |
 		    UNIWILL_FEATURE_PRIMARY_FAN |
@@ -2587,7 +2737,7 @@ static int __init uniwill_init(void)
=20
 	if (force) {
 		/* Assume that the device supports all features except the charge limit=
 */
-		device_descriptor.features =3D UINT_MAX & ~UNIWILL_FEATURE_BATTERY;
+		device_descriptor.features =3D UINT_MAX & ~UNIWILL_FEATURE_BATTERY_CHAR=
GE_LIMIT;
 		pr_warn("Enabling potentially unsupported features\n");
 	}
=20
diff --git a/drivers/platform/x86/uniwill/uniwill-wmi.c b/drivers/platform=
/x86/uniwill/uniwill-wmi.c
index 097882f10b1e..e97aa988a90c 100644
=2D-- a/drivers/platform/x86/uniwill/uniwill-wmi.c
+++ b/drivers/platform/x86/uniwill/uniwill-wmi.c
@@ -48,6 +48,7 @@ int devm_uniwill_wmi_register_notifier(struct device *de=
v, struct notifier_block
 static void uniwill_wmi_notify(struct wmi_device *wdev, union acpi_object=
 *obj)
 {
 	u32 value;
+	int ret;
=20
 	if (obj->type !=3D ACPI_TYPE_INTEGER)
 		return;
@@ -56,7 +57,9 @@ static void uniwill_wmi_notify(struct wmi_device *wdev, =
union acpi_object *obj)
=20
 	dev_dbg(&wdev->dev, "Received WMI event %u\n", value);
=20
-	blocking_notifier_call_chain(&uniwill_wmi_chain_head, value, NULL);
+	ret =3D blocking_notifier_call_chain(&uniwill_wmi_chain_head, value, NUL=
L);
+	if (notifier_to_errno(ret) < 0)
+		dev_err(&wdev->dev, "Failed to handle event %u\n", value);
 }
=20
 /*
=2D-=20
2.39.5

