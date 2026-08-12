Received: from a4i613.smtp2go.com (a4i613.smtp2go.com [158.120.82.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED42332623
	for <platform-driver-x86@vger.kernel.org>; Wed, 12 Aug 2026 06:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.120.82.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786515724; cv=none; b=Sz8DysuFCds2m2vl83HnBDfs8qRbJspvbgy+o2YZz3i0zHyjrlW273JkPT1VwOfzqAS66ZrnMIjbOaKToqMaTPvlJLsiIxdujLKBc8scIjToME8MnAq6Vyk5zUER1T7FsuT59nCW+1kwWKZ8c0Gpk/XkIGQOqao2z+kwybAnzz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786515724; c=relaxed/simple;
	bh=NFMvOzRg0J8Ue9QjlgqE3gBpIV1UXpIrXgJnuTaqcyA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m2QyshBvTekvIEONhS4ID1eI6kEabXBHQbrUahKn6Nf2Qy2lZZ+4/KazLmqrIKICZjvoHLASiSf39SDcmPI+RwHihqeT+RBY6aG7S5GhyDdCHt4pInWanSqQz/5FK/CyJhz+zfTV57Kl0QRmF7rUyYy7DL7CpPGUGRBbW8/dL1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shangen.org; spf=pass smtp.mailfrom=em879706.shangen.org; dkim=pass (2048-bit key) header.d=shangen.org header.i=@shangen.org header.b=naGr3ekJ; arc=none smtp.client-ip=158.120.82.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shangen.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em879706.shangen.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shangen.org header.i=@shangen.org header.b="naGr3ekJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shangen.org;
 i=@shangen.org; q=dns/txt; s=s879706; t=1786515715; h=from : subject :
 to : message-id : date : list-unsubscribe : list-unsubscribe-post;
 bh=hzuRg94B/qzWU6JH4mJ9ClIE+RK3i23UFItNKnuLFK0=;
 b=naGr3ekJqzM3VhqjmZveVE0gGa34HmxLPqZpUOkmv6bocbhPIqDRTtGOqs7JLnyeaRakZ
 5YrYZstjjuLkMrW6tSO7b6RTTzpVomK6dMmBqs6/BvJi5SFb6VxAnwydgkEcs8w+i8vXpBp
 JI5ypF7QPcYZHvKvQQqNoualOmR7GDhnDP9hZ9VDK8qyOrWZpclXVIiPtwEZOISbKeSh/rw
 YFmP5QYFkiI/DXz0fEkktFORjK3oC6YetPTztBfIRbyfO+P7SEmgY2DF32VQ9MCiwyB7Uef
 S/AznLe5AMbQgvxF1sLUOA02cR4EFM7eXqItVLj4r9fGroT/EQ9jn9Vd1gOQ==
Received: from [10.195.244.224] (helo=12458laptop)
	by smtpcorp.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.99.4)
	(envelope-from <sim@shangen.org>)
	id 1wu2LX-4o5NDgrrtLe-h4te;
	Wed, 12 Aug 2026 06:21:51 +0000
From: Shang En Sim <sim@shangen.org>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shang En Sim <sim@shangen.org>
Subject: [PATCH] platform/x86: hp-wmi: add charge_behaviour support for Spectre 8C17
Date: Tue, 11 Aug 2026 23:20:42 -0700
Message-ID: <20260812062113.27741-1-sim@shangen.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Report-Abuse: Please forward a copy of this message, including all headers, to <abuse-report@smtp2go.com>
Feedback-ID: 879706m:879706aL5FzMA:879706svPZSh2u5Y
X-smtpcorp-track: QK96otxZjjbl.kUd5JkLXCPuE.oY5GiwxFeaQ

HP Spectre x360 16-aa0xxx (board 8C17) exposes battery charge mode control
through WMI command 0x2b (GBCO/SBCO). Inhibit charge, force discharge, and
restoring automatic charging all work through that command.

Unlike some other HP designs that restore automatic charging through WMI
command 0x1f (SBCC), that path fails on this BIOS. Keep the quirk limited
to board 8C17 and drive all three behaviours through 0x2b only.

Expose auto / inhibit-charge / force-discharge through the standard
power_supply charge_behaviour property. Seed the reported policy from
GBCO at setup because firmware retains inhibit across reboot. Cache that
policy afterwards: GBCO also encodes live status, so 0x01 means actively
charging and 0x02 is ambiguous between force-discharge and running on
battery alone.

Observed firmware mapping on this board:
- write 0x00 -> auto; write 0x02 -> force-discharge; write 0x05 -> inhibit
- read 0x00/0x01 -> auto (0x01 = actively charging)
- read 0x02 -> force-discharge (also seen on battery alone)
- read 0x04/0x05/0x06 -> inhibit

Tested on HP Spectre x360 16-aa0xxx (board 8C17, BIOS F.16):
- inhibit stops charging on AC; GBCO reads 0x04
- force-discharge discharges on AC; GBCO reads 0x02
- restore-auto via 0x2b mode 0 resumes charging; GBCO reads 0x01
- inhibit persists across reboot (status Not charging, GBCO 0x04)

Signed-off-by: Shang En Sim <sim@shangen.org>
---
 drivers/platform/x86/hp/hp-wmi.c | 238 +++++++++++++++++++++++++++++++
 1 file changed, 238 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 3c737ef38..1f9d11427 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -15,6 +15,7 @@
 
 #include <linux/acpi.h>
 #include <linux/array_size.h>
+#include <linux/bitfield.h>
 #include <linux/bits.h>
 #include <linux/cleanup.h>
 #include <linux/compiler_attributes.h>
@@ -39,6 +40,8 @@
 #include <linux/types.h>
 #include <linux/workqueue.h>
 
+#include <acpi/battery.h>
+
 MODULE_AUTHOR("Matthew Garrett <mjg59@srcf.ucam.org>");
 MODULE_DESCRIPTION("HP laptop WMI driver");
 MODULE_LICENSE("GPL");
@@ -392,6 +395,7 @@ enum hp_wmi_commandtype {
 	HPWMI_FEATURE2_QUERY		= 0x0d,
 	HPWMI_WIRELESS2_QUERY		= 0x1b,
 	HPWMI_POSTCODEERROR_QUERY	= 0x2a,
+	HPWMI_BATTERY_CHARGE_MODE	= 0x2b,
 	HPWMI_SYSTEM_DEVICE_MODE	= 0x40,
 	HPWMI_THERMAL_PROFILE_QUERY	= 0x4c,
 	HPWMI_GRAPHICS_MUX_QUERY	= 0x52,
@@ -461,6 +465,29 @@ enum hp_wireless2_bits {
 #define IS_HWBLOCKED(x) ((x & HPWMI_POWER_FW_OR_HW) != HPWMI_POWER_FW_OR_HW)
 #define IS_SWBLOCKED(x) !(x & HPWMI_POWER_SOFT)
 
+#if IS_REACHABLE(CONFIG_ACPI_BATTERY)
+#define HPWMI_CHARGE_BEHAVIOURS \
+	(BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO) | \
+	 BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE) | \
+	 BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_FORCE_DISCHARGE))
+
+/*
+ * SBCO reads the requested mode from bits 15:8 of the input value.
+ * GBCO returns literal status values in bits 7:0.
+ */
+#define HPWMI_CHARGE_MODE_MASK			GENMASK(15, 8)
+#define HPWMI_CHARGE_MODE_AUTO			0x00
+#define HPWMI_CHARGE_MODE_FORCE_DISCHARGE	0x02
+#define HPWMI_CHARGE_MODE_INHIBIT		0x05
+
+#define HPWMI_CHARGE_MODE_READ_AUTO		0x00
+#define HPWMI_CHARGE_MODE_READ_CHARGING		0x01
+#define HPWMI_CHARGE_MODE_READ_FORCE_DISCHARGE	0x02
+#define HPWMI_CHARGE_MODE_READ_INHIBIT		0x04
+#define HPWMI_CHARGE_MODE_READ_INHIBIT_SHPM	0x05
+#define HPWMI_CHARGE_MODE_READ_INHIBIT_EXT	0x06
+#endif
+
 struct bios_rfkill2_device_state {
 	u8 radio_type;
 	u8 bus_type;
@@ -548,6 +575,19 @@ static const char * const tablet_chassis_types[] = {
 	"32"  /* Detachable */
 };
 
+#if IS_REACHABLE(CONFIG_ACPI_BATTERY)
+static const struct dmi_system_id hp_wmi_charge_control_quirks[] __initconst = {
+	{
+		/* HP Spectre x360 16-aa0xxx */
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
+			DMI_MATCH(DMI_BOARD_NAME, "8C17"),
+		},
+	},
+	{}
+};
+#endif
+
 #define DEVICE_MODE_TABLET	0x06
 
 #define CPU_FAN 0
@@ -777,6 +817,200 @@ static int hp_wmi_read_int(int query)
 	return val;
 }
 
+#if IS_REACHABLE(CONFIG_ACPI_BATTERY)
+/* Protects hp_wmi_charge_behaviour */
+static DEFINE_MUTEX(hp_wmi_charge_lock);
+static enum power_supply_charge_behaviour hp_wmi_charge_behaviour =
+	POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO;
+
+static int hp_wmi_charge_mode_to_behaviour(int mode,
+					   enum power_supply_charge_behaviour *behaviour)
+{
+	switch (mode) {
+	case HPWMI_CHARGE_MODE_READ_AUTO:
+	case HPWMI_CHARGE_MODE_READ_CHARGING:
+		/*
+		 * GBCO 0x01 reports active charging, rather than a separate
+		 * charge policy. Treat it as automatic charging.
+		 */
+		*behaviour = POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO;
+		return 0;
+	case HPWMI_CHARGE_MODE_READ_FORCE_DISCHARGE:
+		/*
+		 * Firmware also returns 0x02 while running on battery alone.
+		 * Treat it as force-discharge so a persisted AC policy is not
+		 * lost across reboot.
+		 */
+		*behaviour = POWER_SUPPLY_CHARGE_BEHAVIOUR_FORCE_DISCHARGE;
+		return 0;
+	case HPWMI_CHARGE_MODE_READ_INHIBIT:
+	case HPWMI_CHARGE_MODE_READ_INHIBIT_SHPM:
+	case HPWMI_CHARGE_MODE_READ_INHIBIT_EXT:
+		*behaviour = POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE;
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int hp_wmi_charge_mode_read(void)
+{
+	int val = 0, ret;
+
+	ret = hp_wmi_perform_query(HPWMI_BATTERY_CHARGE_MODE, HPWMI_READ,
+				   &val, zero_if_sup(val), sizeof(val));
+	if (ret < 0)
+		return ret;
+	if (ret > 0)
+		return -EINVAL;
+
+	return val & 0xff;
+}
+
+static int hp_wmi_charge_mode_write(u32 mode)
+{
+	int ret;
+
+	mode = FIELD_PREP(HPWMI_CHARGE_MODE_MASK, mode);
+	ret = hp_wmi_perform_query(HPWMI_BATTERY_CHARGE_MODE, HPWMI_WRITE,
+				   &mode, sizeof(mode), 0);
+	if (ret < 0)
+		return ret;
+	if (ret > 0)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int hp_wmi_charge_set_behaviour(enum power_supply_charge_behaviour behaviour)
+{
+	int ret;
+
+	guard(mutex)(&hp_wmi_charge_lock);
+
+	switch (behaviour) {
+	case POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO:
+		ret = hp_wmi_charge_mode_write(HPWMI_CHARGE_MODE_AUTO);
+		break;
+	case POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE:
+		ret = hp_wmi_charge_mode_write(HPWMI_CHARGE_MODE_INHIBIT);
+		break;
+	case POWER_SUPPLY_CHARGE_BEHAVIOUR_FORCE_DISCHARGE:
+		ret = hp_wmi_charge_mode_write(HPWMI_CHARGE_MODE_FORCE_DISCHARGE);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (ret)
+		return ret;
+
+	hp_wmi_charge_behaviour = behaviour;
+
+	return 0;
+}
+
+static int hp_wmi_charge_get_property(struct power_supply *psy,
+				      const struct power_supply_ext *ext,
+				      void *data,
+				      enum power_supply_property psp,
+				      union power_supply_propval *val)
+{
+	if (psp != POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR)
+		return -EINVAL;
+
+	guard(mutex)(&hp_wmi_charge_lock);
+	val->intval = hp_wmi_charge_behaviour;
+
+	return 0;
+}
+
+static int hp_wmi_charge_set_property(struct power_supply *psy,
+				      const struct power_supply_ext *ext,
+				      void *data,
+				      enum power_supply_property psp,
+				      const union power_supply_propval *val)
+{
+	if (psp != POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR)
+		return -EINVAL;
+
+	return hp_wmi_charge_set_behaviour(val->intval);
+}
+
+static int hp_wmi_charge_property_is_writeable(struct power_supply *psy,
+					       const struct power_supply_ext *ext,
+					       void *data,
+					       enum power_supply_property psp)
+{
+	return psp == POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR;
+}
+
+static const enum power_supply_property hp_wmi_charge_properties[] = {
+	POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR,
+};
+
+static const struct power_supply_ext hp_wmi_charge_extension = {
+	.name			= "hp-wmi-charge-control",
+	.properties		= hp_wmi_charge_properties,
+	.num_properties		= ARRAY_SIZE(hp_wmi_charge_properties),
+	.charge_behaviours	= HPWMI_CHARGE_BEHAVIOURS,
+	.get_property		= hp_wmi_charge_get_property,
+	.set_property		= hp_wmi_charge_set_property,
+	.property_is_writeable	= hp_wmi_charge_property_is_writeable,
+};
+
+static int hp_wmi_charge_add_battery(struct power_supply *battery,
+				     struct acpi_battery_hook *hook)
+{
+	return power_supply_register_extension(battery, &hp_wmi_charge_extension,
+					       &hp_wmi_platform_dev->dev, NULL);
+}
+
+static int hp_wmi_charge_remove_battery(struct power_supply *battery,
+					struct acpi_battery_hook *hook)
+{
+	power_supply_unregister_extension(battery, &hp_wmi_charge_extension);
+	return 0;
+}
+
+static struct acpi_battery_hook hp_wmi_charge_battery_hook = {
+	.name			= "HP WMI charge control",
+	.add_battery		= hp_wmi_charge_add_battery,
+	.remove_battery		= hp_wmi_charge_remove_battery,
+};
+
+static int __init hp_wmi_charge_control_setup(struct device *dev)
+{
+	enum power_supply_charge_behaviour behaviour;
+	int ret;
+
+	if (!dmi_check_system(hp_wmi_charge_control_quirks))
+		return 0;
+
+	/*
+	 * Firmware retains inhibit across reboot, so seed from GBCO rather
+	 * than assuming auto.
+	 */
+	ret = hp_wmi_charge_mode_read();
+	if (ret < 0)
+		return 0;
+
+	ret = hp_wmi_charge_mode_to_behaviour(ret, &behaviour);
+	if (ret)
+		return 0;
+
+	scoped_guard(mutex, &hp_wmi_charge_lock)
+		hp_wmi_charge_behaviour = behaviour;
+
+	return devm_battery_hook_register(dev, &hp_wmi_charge_battery_hook);
+}
+#else
+static int __init hp_wmi_charge_control_setup(struct device *dev)
+{
+	return 0;
+}
+#endif
+
 static int hp_wmi_get_dock_state(void)
 {
 	int state = hp_wmi_read_int(HPWMI_HARDWARE_QUERY);
@@ -2528,6 +2762,10 @@ static int __init hp_wmi_bios_setup(struct platform_device *device)
 	if (err < 0)
 		return err;
 
+	err = hp_wmi_charge_control_setup(&device->dev);
+	if (err)
+		return err;
+
 	thermal_profile_setup(device);
 
 	return 0;
-- 
2.55.0

