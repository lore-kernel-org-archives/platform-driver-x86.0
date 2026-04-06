Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4E93976A2;
	Mon,  6 Apr 2026 19:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775504239; cv=none; b=d9qlInFUgNHfMppfpLrOfZwmIUD34GIjbtZl4x1un1L0CqJYd+yN/jd39I/mvd+QZR05Ek7n3r0gKOOeXMtDsoslNbf7NzQkzDffbdmWsSSd1VWXWvVK4L2rHgl46Uy6UygBz/O9Y/Ikit7qYcb/9Cc8FWjkctyN91bWlwXs0C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775504239; c=relaxed/simple;
	bh=1lbc6QbeEBpMOKk8qmeXeHNc+dyKkpblDg6kUDR2f0c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oRBCtjZtNndHnURYrw7XMeAbWcn0sSlaRUyGuQroGASI2EiNmMkrpycPzVpCksou+hag831buNgQeDFoZ3i45Zgq7JJx8npSeca5+NldgvXNertA5ubhOPmUeuFw0rUk4b60bq5pTqvMCwVMsZmiip2mH15ZHF3oXQFvtLIKIX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=KoQbboBg; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="KoQbboBg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1775504231; x=1776109031; i=w_armin@gmx.de;
	bh=J+sbSfQ2PJ2GtJr87UUtW4F0OrGa7T/YqE7V6Xb4Vx8=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=KoQbboBgSVvAxgxRGXfzAqGBd+n+SCfpmYucV6tCHfLnePQ4xma3EZIFl/0bHWyh
	 Pqcn2oyUiRnCiGBcxdOynPufu/df7GKbsROBtqWEHhayVAiCLzHQUvnQLqCnqV8iP
	 HNxGVs+vNxqH+MZ9cBkZIc35N4kq2Z3qIpItqQ/inpT2YuFo8uZWD84gbfytQmPUs
	 jSPxFk5b0zQ9exnMy8Wt+gwnQTBZ9XzsD+daBYanWfZF7tyRMv1S/U49G6Hvm+O3S
	 BulheSYstYr2oi1+XfBLustKVrW890pfZUKvjyqZ+0HbdGg7EsofeAB2+uP6F8AnP
	 QueAflFZQwkqCJnq0g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MtfJX-1vLA2z49WB-00w4uU; Mon, 06
 Apr 2026 21:37:11 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: wse@tuxedocomputers.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] platform/x86: uniwill-laptop: Add support for battery charge modes
Date: Mon,  6 Apr 2026 21:36:53 +0200
Message-Id: <20260406193653.7799-7-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:xSBU0l8Bf3deodaFvVzxPGn/iTNejxQ5T6t6NKlQfAR0g46JCZ0
 j8Jm/vvAgwcSBF5Yymo0XKUnBZcQR6HIOy+2fUepe89sag8kPUZk01hw6OF/rO0B01r9i8P
 CeeHrfIlI0bkwqQAac0mQE7EGiZi04coWbDYkgt9F21sn4+xLMkPYimoeBUiDKe0c99Bs0G
 +WT41zbMF8kAbjn8JotJg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:OYF0my4hVuk=;IYQpNLlK/amxkvqRVdekjhaDux3
 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
 fx/MH0KZIJAoJkpXIGdES7kQ==

Many Uniwill-based devices do not supports the already existing
charge limit functionality, but instead support an alternative
interface for controlling the battery charge algorithm.

Add support for this interface and update the documentation.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 .../admin-guide/laptops/uniwill-laptop.rst    |  25 +-
 drivers/platform/x86/uniwill/uniwill-acpi.c   | 244 ++++++++++++++----
 drivers/platform/x86/uniwill/uniwill-wmi.c    |   5 +-
 3 files changed, 226 insertions(+), 48 deletions(-)

diff --git a/Documentation/admin-guide/laptops/uniwill-laptop.rst b/Docume=
ntation/admin-guide/laptops/uniwill-laptop.rst
index 561334865feb..24b41dbab886 100644
=2D-- a/Documentation/admin-guide/laptops/uniwill-laptop.rst
+++ b/Documentation/admin-guide/laptops/uniwill-laptop.rst
@@ -43,9 +43,23 @@ Support for changing the platform performance mode is c=
urrently not implemented.
 Battery Charging Control
 ------------------------
=20
-The ``uniwill-laptop`` driver supports controlling the battery charge lim=
it. This happens over
-the standard ``charge_control_end_threshold`` power supply sysfs attribut=
e. All values
-between 1 and 100 percent are supported.
+.. warning:: Some devices do not properly implement the charging threshol=
d interface. Forcing
+             the driver to enable access to said interface on such device=
s might damage the
+             battery [1]_. Because of this the driver will not enable sai=
d feature even when
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
@@ -70,3 +84,8 @@ The ``uniwill-laptop`` driver allows to set the configur=
able TGP for devices wit
 allow it.
=20
 See Documentation/ABI/testing/sysfs-driver-uniwill-laptop for details.
+
+References
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+.. [1] https://www.reddit.com/r/XMG_gg/comments/ld9yyf/battery_limit_hidd=
en_function_discovered_on/
diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platfor=
m/x86/uniwill/uniwill-acpi.c
index a116e2ec6453..fbf2e101a074 100644
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
@@ -1421,6 +1440,30 @@ static int uniwill_led_init(struct uniwill_data *da=
ta)
 							 &init_data);
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
@@ -1431,6 +1474,16 @@ static int uniwill_get_property(struct power_supply=
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
@@ -1479,13 +1532,52 @@ static int uniwill_get_property(struct power_suppl=
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
@@ -1501,21 +1593,41 @@ static int uniwill_property_is_writeable(struct po=
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
+	.name =3D DRIVER_NAME,
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
 	.name =3D DRIVER_NAME,
-	.properties =3D uniwill_properties,
-	.num_properties =3D ARRAY_SIZE(uniwill_properties),
+	.charge_types =3D BIT(POWER_SUPPLY_CHARGE_TYPE_TRICKLE) |
+			BIT(POWER_SUPPLY_CHARGE_TYPE_STANDARD) |
+			BIT(POWER_SUPPLY_CHARGE_TYPE_LONGLIFE),
+	.properties =3D uniwill_charge_modes_properties,
+	.num_properties =3D ARRAY_SIZE(uniwill_charge_modes_properties),
 	.get_property =3D uniwill_get_property,
 	.set_property =3D uniwill_set_property,
 	.property_is_writeable =3D uniwill_property_is_writeable,
@@ -1531,7 +1643,13 @@ static int uniwill_add_battery(struct power_supply =
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
@@ -1560,7 +1678,10 @@ static int uniwill_remove_battery(struct power_supp=
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
@@ -1570,25 +1691,35 @@ static int uniwill_battery_init(struct uniwill_dat=
a *data)
 	unsigned int value, threshold;
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
+		 * need to replace this value with 100 to signal that we want to
+		 * take control of battery charging. For the sake of completeness
+		 * we also set the charging threshold to 100 if the EC-provided
+		 * value is invalid.
+		 */
+		threshold =3D FIELD_GET(CHARGE_CTRL_MASK, value);
+		if (threshold =3D=3D 0 || threshold > 100) {
+			FIELD_MODIFY(CHARGE_CTRL_MASK, &value, 100);
+			ret =3D regmap_write(data->regmap, EC_ADDR_CHARGE_CTRL, value);
+			if (ret < 0)
+				return ret;
+		}
+	} else {
+		if (!uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY_CHARGE_MODES=
))
+			return 0;
=20
-	/*
-	 * The charge control threshold might be initialized with 0 by
-	 * the EC to signal that said threshold is uninitialized. We thus
-	 * need to replace this value with 100 to signal that we want to
-	 * take control of battery charging. For the sake of completeness
-	 * we also set the charging threshold to 100 if the EC-provided
-	 * value is invalid.
-	 */
-	threshold =3D FIELD_GET(CHARGE_CTRL_MASK, value);
-	if (threshold =3D=3D 0 || threshold > 100) {
-		FIELD_MODIFY(CHARGE_CTRL_MASK, &value, 100);
-		ret =3D regmap_write(data->regmap, EC_ADDR_CHARGE_CTRL, value);
+		ret =3D devm_mutex_init(data->dev, &data->charge_type_lock);
+		if (ret < 0)
+			return ret;
+
+		ret =3D uniwill_read_charge_type(data, &data->last_charge_type);
 		if (ret < 0)
 			return ret;
 	}
@@ -1609,10 +1740,13 @@ static int uniwill_notifier_call(struct notifier_b=
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
@@ -1623,10 +1757,24 @@ static int uniwill_notifier_call(struct notifier_b=
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
@@ -1810,7 +1958,7 @@ static int uniwill_suspend_touchpad_toggle(struct un=
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
@@ -1887,7 +2035,15 @@ static int uniwill_resume_touchpad_toggle(struct un=
iwill_data *data)
=20
 static int uniwill_resume_battery(struct uniwill_data *data)
 {
-	if (!uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY))
+	int ret;
+
+	if (uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY_CHARGE_MODES))=
 {
+		ret =3D uniwill_restore_charge_type(data);
+		if (ret < 0)
+			return ret;
+	}
+
+	if (!uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT)=
)
 		return 0;
=20
 	return regmap_update_bits(data->regmap, EC_ADDR_CHARGE_CTRL, CHARGE_CTRL=
_MASK,
@@ -1970,7 +2126,7 @@ static struct platform_driver uniwill_driver =3D {
=20
 static struct uniwill_device_descriptor lapqc71a_lapqc71b_descriptor __in=
itdata =3D {
 	.features =3D UNIWILL_FEATURE_SUPER_KEY |
-		    UNIWILL_FEATURE_BATTERY |
+		    UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT |
 		    UNIWILL_FEATURE_CPU_TEMP |
 		    UNIWILL_FEATURE_GPU_TEMP |
 		    UNIWILL_FEATURE_PRIMARY_FAN |
@@ -1981,7 +2137,7 @@ static struct uniwill_device_descriptor lapac71h_des=
criptor __initdata =3D {
 	.features =3D UNIWILL_FEATURE_FN_LOCK |
 		    UNIWILL_FEATURE_SUPER_KEY |
 		    UNIWILL_FEATURE_TOUCHPAD_TOGGLE |
-		    UNIWILL_FEATURE_BATTERY |
+		    UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT |
 		    UNIWILL_FEATURE_CPU_TEMP |
 		    UNIWILL_FEATURE_GPU_TEMP |
 		    UNIWILL_FEATURE_PRIMARY_FAN |
@@ -1993,7 +2149,7 @@ static struct uniwill_device_descriptor lapkc71f_des=
criptor __initdata =3D {
 		    UNIWILL_FEATURE_SUPER_KEY |
 		    UNIWILL_FEATURE_TOUCHPAD_TOGGLE |
 		    UNIWILL_FEATURE_LIGHTBAR |
-		    UNIWILL_FEATURE_BATTERY |
+		    UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT |
 		    UNIWILL_FEATURE_CPU_TEMP |
 		    UNIWILL_FEATURE_GPU_TEMP |
 		    UNIWILL_FEATURE_PRIMARY_FAN |
@@ -2578,8 +2734,8 @@ static int __init uniwill_init(void)
 	}
=20
 	if (force) {
-		/* Assume that the device supports all features */
-		device_descriptor.features =3D UINT_MAX;
+		/* Assume that the device supports all features except the charge limit=
 */
+		device_descriptor.features =3D UINT_MAX & ~UNIWILL_FEATURE_BATTERY_CHAR=
GE_LIMIT;
 		pr_warn("Enabling potentially unsupported features\n");
 	}
=20
diff --git a/drivers/platform/x86/uniwill/uniwill-wmi.c b/drivers/platform=
/x86/uniwill/uniwill-wmi.c
index 31d9c39f14ab..f1b89bc63df6 100644
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

