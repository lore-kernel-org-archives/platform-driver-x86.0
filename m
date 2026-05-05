Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466123D332E
	for <platform-driver-x86@vger.kernel.org>; Tue,  5 May 2026 20:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778011351; cv=none; b=eUApL2FW+yemcuZs+tlfOaE8bctCXi8AK9Tk5k7vSbYiIDD1u6VPLS1KelU02puvwakOXTr4pru/Gidyt4KgVzoPP4v+eKPmRpleS44bQuuDNHDtOdXCp92JD5Vdslq+2f4Duw205W40FEe5aZ0l1mBP7AlrND3ORY6cqXGzAkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778011351; c=relaxed/simple;
	bh=d6MafWgBWyl1Z4ovMrkVpWPKQeup2zhmlwELwFPn8XA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mV7NoBbCG7CQjd09E1PK64xxmZqwKt5IsMUN7/22vB1Kl6ChflHwu7CN4sjYlDn5zg4pA2bVdYd0CMd5H5Mdv0++mrYcJeaoFIGwJQolcylmnLJAdT5M23J/dXYFreI+dklBApcMwp6d7v73vtmg0PxEnJ0V3xyJvWb4h/hgkZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m6KtgFUS; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m6KtgFUS"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-364d13df3ccso830940a91.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 05 May 2026 13:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778011348; x=1778616148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ieCKJLPjZtuIxWLquyRhV0QUhCTNdNSHFZJ3e34jy60=;
        b=m6KtgFUS2uy+LKBtloNVR+7VF35gpVKsn/CdvoXtyXvZQCo8GqeGd+0W+I/MF0wD9K
         CB3orYvGAGBADoKGqVQTDGFpEaYHgVoQ0QjqAFAqm+Rnr1V9Mm+YWGlfhde82rYBRKJG
         3azaQm1zdMLuBFb8u7LspB7AGW/Gcz/3xx6VKMnhHBF2PFRpR/XnTtSQlZe/X2Kjcz3s
         hSIMfrhYjdOml3CokXRUyWYg9FZqi8n5Izx59cJVQtvHY4OM/cvm88pro4FnbOOj5tCb
         DRlKUUbOKiAykraRiqUQSVXpK78o+3V8k3hoFt/fsUtZ71+HnnzK/0+rRPjZDwq30xt1
         myqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778011348; x=1778616148;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ieCKJLPjZtuIxWLquyRhV0QUhCTNdNSHFZJ3e34jy60=;
        b=DN/hvpgQBb7T1cBJjIIX7/bOiiZWByHB2SyxyMlkh6ZLLNXXSh2/5OiXEWcSuGf/T0
         w8DeGWKl+W6ILgDw0UjULvyBCBvvshgLm2Rc0lvZB0v3NZEmqTl9/6Q7GaPGQP6qtKXU
         GsxOTEcSCtEkzwcvUMOw9Bcba2QPae1ldBEMZ9N6TjlI+O8REtF/JaZEz4TlPuI59yhY
         Dwa21V5AGyCA45vfMPZSg01RCzMhXZxC59CciZJ4Diwd8rZbpHUbUvOjQcUXhg9Cv1Ml
         SvINUH3QOgxpf2wj/7PvDFgt8Wvbyhxn0uAN4l/mbhE6pc2d90pAhd8HQsHEZjUpBJjM
         D52w==
X-Gm-Message-State: AOJu0Yzzw4eu1jqe0qTP/U08h5NNBSROHoTxGuEDvOlaYttdDPa4gQcs
	HK/ZQU9uEMPZd7QcU96c3F5JzBz+EfxRryIo0Dv4aje7em96SAGwTXZy
X-Gm-Gg: AeBDietMIAYt1iLnPB5C6H5jrNpLmSyUqrHSDbui3rGP8nu70liuunjHkHAm22PPWpA
	MC7EL1og2l0bSmNvQGWdMGfD/PHd1MiFa4XuE478H7TEHkwvKiwH01rVLAU5brsGb8vZU2a/Bn7
	/jROdy573+I6GhhTPSa4QZ5XAFa3mqNSAskntqA14g9hx+Gtee6Csq61umiJC6xPKG3tGi7qzyc
	pcdv8qryUtx5139bjRVHaO+azmwnUrZM2WvWVSl/Xt84pUYFsem6ZaLFxInjIMTsH2+YxKRGT8n
	UAr8rFFQI15ny9TILYmtP0JwhYEgUybJRjAO6Q+aR1NpvROPhtrN99RUaJ9oIPJ7wNc+8T/5bjy
	SVFOJ/9IPuUCMjgBkUJnNk8vWVvKwIjQ+f8mjwVNG++VX6k8RoT59PbJiQGlW46s8ggH6ixglxL
	SwYRwzi8+HQWxTEEWdzSPrU6L11guj/dpzCHIZaq7L
X-Received: by 2002:a17:90b:264e:b0:35e:55fd:1bd0 with SMTP id 98e67ed59e1d1-365ad0eaae6mr128506a91.1.1778011348365;
        Tue, 05 May 2026 13:02:28 -0700 (PDT)
Received: from magniquick ([45.112.148.110])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364ebec73aasm16024331a91.2.2026.05.05.13.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 13:02:27 -0700 (PDT)
From: Navon John Lukose <navonjohnlukose@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH] platform/x86: hp-wmi: Add charge behaviour support
Date: Wed,  6 May 2026 01:32:22 +0530
Message-ID: <20260505200222.157144-1-navonjohnlukose@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some HP laptops expose battery charge mode control through the existing
HP BIOS WMI GUID. On HP board 85C6, command types 0x1f and 0x2b map to
the ACPI GBCC/GBCO and SBCC/SBCO methods through the WMI command
dispatcher.

Expose the mode control through the standard power_supply
charge_behaviour property using a battery hook and power_supply
extension. The initial quirk is limited to board 85C6 and still
requires a successful charge mode read before registering the extension.

The firmware uses different commands for restoring auto mode and setting
explicit charge modes, so report the last successfully requested policy
after seeding it from firmware at probe time. The regular battery status
continues to report the live charging state.

Compile the battery hook support only when the ACPI battery driver is
reachable so non-battery hp-wmi configurations keep building.

Signed-off-by: Navon John Lukose <navonjohnlukose@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 207 +++++++++++++++++++++++++++++++
 1 file changed, 207 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index d1cc6e7d176c..b3da64aee4f7 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -35,6 +35,9 @@
 #include <linux/string.h>
 #include <linux/types.h>
 #include <linux/workqueue.h>
+#if IS_REACHABLE(CONFIG_ACPI_BATTERY)
+#include <acpi/battery.h>
+#endif
 
 MODULE_AUTHOR("Matthew Garrett <mjg59@srcf.ucam.org>");
 MODULE_DESCRIPTION("HP laptop WMI driver");
@@ -309,7 +312,9 @@ enum hp_wmi_commandtype {
 	HPWMI_HOTKEY_QUERY		= 0x0c,
 	HPWMI_FEATURE2_QUERY		= 0x0d,
 	HPWMI_WIRELESS2_QUERY		= 0x1b,
+	HPWMI_BATTERY_CHARGE_CONTROL	= 0x1f,
 	HPWMI_POSTCODEERROR_QUERY	= 0x2a,
+	HPWMI_BATTERY_CHARGE_MODE	= 0x2b,
 	HPWMI_SYSTEM_DEVICE_MODE	= 0x40,
 	HPWMI_THERMAL_PROFILE_QUERY	= 0x4c,
 };
@@ -378,6 +383,22 @@ enum hp_wireless2_bits {
 #define IS_HWBLOCKED(x) ((x & HPWMI_POWER_FW_OR_HW) != HPWMI_POWER_FW_OR_HW)
 #define IS_SWBLOCKED(x) !(x & HPWMI_POWER_SOFT)
 
+#if IS_REACHABLE(CONFIG_ACPI_BATTERY)
+#define HPWMI_CHARGE_BEHAVIOURS \
+	(BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO) | \
+	 BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE) | \
+	 BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_FORCE_DISCHARGE))
+
+#define HPWMI_CHARGE_MODE_AUTO			0x0000
+#define HPWMI_CHARGE_MODE_FORCE_DISCHARGE	0x0200
+#define HPWMI_CHARGE_MODE_INHIBIT		0x0500
+
+#define HPWMI_CHARGE_MODE_READ_AUTO		0x00
+#define HPWMI_CHARGE_MODE_READ_FORCE_DISCHARGE	0x02
+#define HPWMI_CHARGE_MODE_READ_INHIBIT		0x04
+#define HPWMI_CHARGE_MODE_READ_INHIBIT_EXT	0x06
+#endif
+
 struct bios_rfkill2_device_state {
 	u8 radio_type;
 	u8 bus_type;
@@ -465,6 +486,18 @@ static const char * const tablet_chassis_types[] = {
 	"32"  /* Detachable */
 };
 
+#if IS_REACHABLE(CONFIG_ACPI_BATTERY)
+static const struct dmi_system_id hp_wmi_charge_control_quirks[] __initconst = {
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
+			DMI_MATCH(DMI_BOARD_NAME, "85C6"),
+		},
+	},
+	{}
+};
+#endif
+
 #define DEVICE_MODE_TABLET	0x06
 
 #define CPU_FAN 0
@@ -694,6 +727,176 @@ static int hp_wmi_read_int(int query)
 	return val;
 }
 
+#if IS_REACHABLE(CONFIG_ACPI_BATTERY)
+static DEFINE_MUTEX(hp_wmi_charge_lock);
+static enum power_supply_charge_behaviour hp_wmi_charge_behaviour =
+	POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO;
+
+static enum power_supply_charge_behaviour hp_wmi_charge_mode_to_behaviour(int mode)
+{
+	switch (mode) {
+	case HPWMI_CHARGE_MODE_READ_FORCE_DISCHARGE:
+		return POWER_SUPPLY_CHARGE_BEHAVIOUR_FORCE_DISCHARGE;
+	case HPWMI_CHARGE_MODE_READ_INHIBIT:
+	case HPWMI_CHARGE_MODE_READ_INHIBIT_EXT:
+		return POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE;
+	case HPWMI_CHARGE_MODE_READ_AUTO:
+	default:
+		return POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO;
+	}
+}
+
+static int hp_wmi_charge_mode_read(void)
+{
+	int val = 0, ret;
+
+	ret = hp_wmi_perform_query(HPWMI_BATTERY_CHARGE_MODE, HPWMI_READ,
+				   &val, zero_if_sup(val), sizeof(val));
+	if (ret)
+		return ret < 0 ? ret : -EINVAL;
+
+	return val & 0xff;
+}
+
+static int hp_wmi_charge_write(enum hp_wmi_commandtype query, u32 mode)
+{
+	int ret;
+
+	ret = hp_wmi_perform_query(query, HPWMI_WRITE, &mode, sizeof(mode), 0);
+	return ret <= 0 ? ret : -EINVAL;
+}
+
+static int hp_wmi_charge_set_behaviour(enum power_supply_charge_behaviour behaviour)
+{
+	int ret;
+
+	guard(mutex)(&hp_wmi_charge_lock);
+
+	/*
+	 * HP firmware exposes normal charging through the GBCC/SBCC command
+	 * pair, while explicit charge modes use the GBCO/SBCO command pair.
+	 */
+	switch (behaviour) {
+	case POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO:
+		ret = hp_wmi_charge_write(HPWMI_BATTERY_CHARGE_CONTROL,
+					  HPWMI_CHARGE_MODE_AUTO);
+		break;
+	case POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE:
+		ret = hp_wmi_charge_write(HPWMI_BATTERY_CHARGE_MODE,
+					  HPWMI_CHARGE_MODE_INHIBIT);
+		break;
+	case POWER_SUPPLY_CHARGE_BEHAVIOUR_FORCE_DISCHARGE:
+		ret = hp_wmi_charge_write(HPWMI_BATTERY_CHARGE_MODE,
+					  HPWMI_CHARGE_MODE_FORCE_DISCHARGE);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (ret)
+		return ret;
+
+	/*
+	 * charge_behaviour is the requested policy. The live charging state is
+	 * still reported by the regular battery status property.
+	 */
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
+	.name = "HP WMI charge control",
+	.add_battery = hp_wmi_charge_add_battery,
+	.remove_battery = hp_wmi_charge_remove_battery,
+};
+
+static int __init hp_wmi_charge_control_setup(struct device *dev)
+{
+	int ret;
+
+	if (!dmi_check_system(hp_wmi_charge_control_quirks))
+		return 0;
+
+	ret = hp_wmi_charge_mode_read();
+	if (ret < 0)
+		return 0;
+
+	scoped_guard(mutex, &hp_wmi_charge_lock)
+		hp_wmi_charge_behaviour = hp_wmi_charge_mode_to_behaviour(ret);
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
@@ -2284,6 +2487,10 @@ static int __init hp_wmi_bios_setup(struct platform_device *device)
 	if (err < 0)
 		return err;
 
+	err = hp_wmi_charge_control_setup(&device->dev);
+	if (err)
+		return err;
+
 	thermal_profile_setup(device);
 
 	return 0;
-- 
2.54.0

