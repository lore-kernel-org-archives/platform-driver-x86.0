Received: from a4i546.smtp2go.com (a4i546.smtp2go.com [158.120.82.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2CF2773F7
	for <platform-driver-x86@vger.kernel.org>; Thu,  1 Oct 2026 03:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.120.82.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790825144; cv=none; b=bbfWs10rSFy04ohQJbByqJySRm9N/k8O625aHCYW37dFCNKF0TxmNfpy6Va7IS1xq309UotcE+0N0nNVQ3f6kD88BLZWpN8skwKWBqpBZuSYgKAziCP2HiANp1IiCeJxot0HAqyRwwcsjKQ7dl3aTr4nmKZ5F5O/B8N/fPR9F/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790825144; c=relaxed/simple;
	bh=Ng3mxE6wIWutH8GFEWssdCzAyhm/q16YU8jgbxM47ws=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lYzf9TfGgnvGDJ8Gy9G8ZxI3W5xLr75rKn4UAnca0VA2L0V6VY8OsEaaveEzgNi3pCJsUVRPjhFOmrI/FlgjEvj5AguGcq5LaKrzUhzQeU1HqYZbfkIcKlH7Xm98QB9yZeiZi6rkdoG8w568pX4JVt6LsTAX73rBVFmO2PlxEpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shangen.org; spf=pass smtp.mailfrom=em879706.shangen.org; dkim=pass (2048-bit key) header.d=shangen.org header.i=@shangen.org header.b=Eud60YrK; arc=none smtp.client-ip=158.120.82.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shangen.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em879706.shangen.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shangen.org header.i=@shangen.org header.b="Eud60YrK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shangen.org;
 i=@shangen.org; q=dns/txt; s=s879706; t=1790824234; h=from : subject :
 to : message-id : date : list-unsubscribe : list-unsubscribe-post;
 bh=cwvNM5FtnyOX5NCg9icK88MD6b1V/tKqf+MdjzKlaGo=;
 b=Eud60YrKSjWqFP61q7kIQdC1RGWEiASSoR4C6PxY6uIMp686eOOX0itWQRQcQQjQcsRFe
 8SEJci8ddtnEuJUZJEc+r3UUSXQFUHxJcuyyvtNQm9EVoCFTk6t35qomq/mvpmzfPY43giW
 wZv4PhXE84yM3TUOA8nS4b2g7h6zspFE4eEuphiZFFxQ3+3lsjzzj98ETQW2huMRU9zvuzb
 nq3cUMDcXYPPlvzHxUqYWwvdY5sfOR0o+FmaEG/QkWsdSyyaTkBFVhigM9b+mhAmZomNKEY
 XeLKobbNjOeuJIWn4RmHnyt2J6VZTUssmZU25NUcDHCyVT/RjPlT3DQUuD1A==
Received: from [10.195.244.224] (helo=12458laptop.lan)
	by smtpcorp.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256:X25519)
	(Exim 4.100.1)
	(envelope-from <sim@shangen.org>)
	id 1xC7Bm-FnQW0hPswep-en6g;
	Thu, 01 Oct 2026 03:10:30 +0000
From: Shang En Sim <sim@shangen.org>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Krishna Chomal <krishna.chomal108@gmail.com>,
	Suryansh Singh <technosfan14@gmail.com>,
	Emre Cecanpunar <emreleno@gmail.com>,
	Radhey Kalra <radheykalra901@gmail.com>,
	=?UTF-8?q?K=C3=BCr=C5=9Fat=20Abayl=C4=B1?= <hello@kursatabayli.dev>,
	Alain Cousinie <alain.cousinie@laposte.net>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] platform/x86: hp-wmi: add charge_behaviour support for Spectre 8C15/8C17
Date: Wed, 30 Sep 2026 22:10:12 -0500
Message-ID: <20261001031012.48473-3-sim@shangen.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261001031012.48473-1-sim@shangen.org>
References: <20261001031012.48473-1-sim@shangen.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Report-Abuse: Please forward a copy of this message, including all headers, to <abuse-report@smtp2go.com>
Feedback-ID: 879706m:879706aL5FzMA:879706sVljpuqFHs
X-smtpcorp-track: LoztiSCaW9vw.JAxB-vgstD-x.u547RAAZAJS

HP Spectre x360 16-aa0xxx (board 8C17) exposes battery charge mode control
through WMI command 0x2b (GBCO/SBCO). Inhibit charge, force discharge, and
restoring automatic charging all work through that command. The
Spectre x360 14-eu0xxx (board 8C15) shares the same platform and the same
GBCO/SBCO implementation.

Unlike some other HP designs that restore automatic charging through WMI
command 0x1f (SBCC), that path fails on this BIOS. Keep the quirk limited
to boards 8C15 and 8C17 and drive all three behaviours through 0x2b only.

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

Board 8C15 was reported working by Alain Cousinie.

Suggested-by: Alain Cousinie <alain.cousinie@laposte.net>
Signed-off-by: Shang En Sim <sim@shangen.org>
---
Changes in v2:
- Read GBCO status with FIELD_GET(HPWMI_CHARGE_MODE_READ_MASK, val)
- Add board 8C15

v1: https://lore.kernel.org/r/20260812062113.27741-1-sim@shangen.org/

 drivers/platform/x86/hp/hp-wmi.c | 246 +++++++++++++++++++++++++++++++
 1 file changed, 246 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 2bf0bb04dcec..ff503c058995 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -15,6 +15,7 @@
 
 #include <linux/acpi.h>
 #include <linux/array_size.h>
+#include <linux/bitfield.h>
 #include <linux/bits.h>
 #include <linux/cleanup.h>
 #include <linux/compiler_attributes.h>
@@ -40,6 +41,8 @@
 #include <linux/types.h>
 #include <linux/workqueue.h>
 
+#include <acpi/battery.h>
+
 MODULE_AUTHOR("Matthew Garrett <mjg59@srcf.ucam.org>");
 MODULE_DESCRIPTION("HP laptop WMI driver");
 MODULE_LICENSE("GPL");
@@ -428,6 +431,7 @@ enum hp_wmi_commandtype {
 	HPWMI_FEATURE2_QUERY		= 0x0d,
 	HPWMI_WIRELESS2_QUERY		= 0x1b,
 	HPWMI_POSTCODEERROR_QUERY	= 0x2a,
+	HPWMI_BATTERY_CHARGE_MODE	= 0x2b,
 	HPWMI_SYSTEM_DEVICE_MODE	= 0x40,
 	HPWMI_THERMAL_PROFILE_QUERY	= 0x4c,
 	HPWMI_GRAPHICS_MUX_QUERY	= 0x52,
@@ -497,6 +501,30 @@ enum hp_wireless2_bits {
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
+#define HPWMI_CHARGE_MODE_READ_MASK		GENMASK(7, 0)
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
@@ -584,6 +612,26 @@ static const char * const tablet_chassis_types[] = {
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
+	{
+		/* HP Spectre x360 14-eu0xxx */
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
+			DMI_MATCH(DMI_BOARD_NAME, "8C15"),
+		},
+	},
+	{}
+};
+#endif
+
 #define DEVICE_MODE_TABLET	0x06
 
 #define CPU_FAN 0
@@ -813,6 +861,200 @@ static int hp_wmi_read_int(int query)
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
+	return FIELD_GET(HPWMI_CHARGE_MODE_READ_MASK, val);
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
@@ -2564,6 +2806,10 @@ static int __init hp_wmi_bios_setup(struct platform_device *device)
 	if (err < 0)
 		return err;
 
+	err = hp_wmi_charge_control_setup(&device->dev);
+	if (err)
+		return err;
+
 	thermal_profile_setup(device);
 
 	return 0;
-- 
2.56.0

