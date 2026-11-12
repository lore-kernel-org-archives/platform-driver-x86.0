Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794513969;
	b=wJKaY3hgJIb3C8xq8rm5svjRJbYTuJdV5uN1uymxMLl8iwqGKqPxMeqEs+2FhFPceCB2
	 mNjSC6M7tV9orrsh2ALmnWfNyoSZwZr1d/QvmTSUuQsbDz9aY6yMiZSeI7Z7/WUe3q5nP
	 4Cp3YYq7FamIikc/uZDsWt2QLTD0Ls1v3af/zw7KRMcG1QzJOPPb9v9rIeQRPjLW8xJXC
	 8iPyWhH1iDMD4jB9s0oZh1mXu3c5mHnaDYcuwb2PVfk0/HT6DAjhDXi05fIsYwTBQAMYp
	 VHSkW96jKPsSPBpzw2YGn//SB2Fdxfj1iaDPfDzS9hNUv+9dQf5vbDuFP+SdCrYtGoA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794513969;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=1o6vOQ+BdoI110KlNdh5r77pIHKFe1kk7/XkmPVOXgY=;
	b=gpSekEhrzjea/jOGYVBSqfORLKiroq2F851eS7XuAbaSEwPxoItoVdodFXDxS9L+YVcr
	 jtmxEBXrYkANqKp9LDN9SBKHVGljON6UcAbdBbfuAG5hBuGakwp0WeQYx+cyF2eCaco+R
	 LfjG7Dm99PD7g74/fEQv47+aS9QMg3cKLWiAAFCIHq9L+RLPUkunpWLdcld2isatyN3It
	 sXWbVazx3naK/W58jqXLJDGeU1YZrMtxBj2DnPqldfsTheYN9yEFWiUhEoSG8YZsNXg8l
	 zovHzw1Ur2ol9STM6P49o+LEEM4416RNiGrrDU0Jy6tan6b9dHIYrSKIxiqQVcSlRuw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HIG1CGh7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43782606A31C;
	Thu, 12 Nov 2026 20:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HIG1CGh7
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794513969;
	b=BJgKfl/wBMW+ZObL9RaVg4nXgt+wOS/39HkxWFw/Q3okGRUSKxpwU/xg6pM1Zkw4PKvv
	 gj2zN7q1Ne6Xyd5YsglFAeDJP1Hncog46QiDKFEZs7lz4PWhn0n1QQlrD8NgreHl2yKQk
	 M9ABYGEGAqIwqmQa7+0ALww+P4yaiWjWReJh6mM0P6OCO3iM0fcfn3vzAGUwzLjJAjWuX
	 XXRWdEZ0mCIXyOX5t4RfJCo9Y9zV4CnU9AZ2n62sMwQ/9EwR2RMr4ogOrGVfFA3UMGngP
	 oR4b9Oud+7R8JZqMjlNzAbiHyZciklPziqTvDo4wgnUWl1NclYMGkA5fSh6hMPfAfFw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794513969;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=1o6vOQ+BdoI110KlNdh5r77pIHKFe1kk7/XkmPVOXgY=;
	b=bIfpDfGyo0DLX5F19hGEIwxRSbhCOOiem1R3ldmh8I5H6LNNNxoIwKtCo94i4IrJbJuf
	 sX0VEm4n4d/Weos9ot4fym6NajmsPjt9St/I4WGVi6U6xjdAWW7QEM222jZGsjOmsfuoQ
	 GSbf3z4kudf6auPy6+8PgvyUgmFPBjDnAQCcER0alODXwdmHv+qJaC8nFRla0/LtfNIRl
	 ZfGONJtXrmFUsYRL7mgfHZLdpqsKv2cKnCaa8gr0bK1168WFCmE9F3NFIC+1IKDJrigr0
	 YZ19yzVHD2y+lZfO+mVdXwxYDFsOVfHQUxNn++7ZReHiFPSCMXekavgDBw8dplUDR1A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 388641F000C4;
	Thu, 12 Nov 2026 20:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794513969;
	bh=1o6vOQ+BdoI110KlNdh5r77pIHKFe1kk7/XkmPVOXgY=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=HIG1CGh7Ge2lm+D7Uy9aJQKB0iOISUwBBUM8qlrsB6Ss38tO+B0TlT496OosVvSQI
	 TgLq7OCOiavrRV7s/3bBlc+R1zlGmJYom4x/GDmJpsYUsjwMVX86Icxum6sM/hDSas
	 8zc8RMSSBMDunBuz70G6FAGRPIepprl+4ZmpFxakiSdFcEOZCYkGINE8C06Au7COxG
	 CTPrkoDXP2AVZrigkx9X9o1KdoVId9D68vqDScw1u7exM87DX9+NZk/54VWac8IxCq
	 Iiy9GU/3sxRWT+gBk9EpGeCT3P9KGA0GDHLZ9ibqNnicdnYvD195aJDhALpb9sBPvK
	 AQRvnKOvqZhig==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id ABDC5474BE;
	Thu, 12 Nov 2026 20:06:07 +0000 (UTC)
From: lilytaylor42 via B4 Relay <devnull+lily.jler.org@kernel.org>
Date: Thu, 12 Nov 2026 20:05:53 +0000
Subject: [PATCH] platform/x86: ayaneo-ec: Restore controller power when the
 modules are refitted
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261112-ayaneo-ec-module-power-v1-1-00d42014bed3@jler.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MywqDMBBG4VeRWTvgRBqkr1JcBP3TDtREErwhv
 rvB5bc456SMpMj0rk5KWDVrDAVSVzT8XPiCdSwm0xgrIobd4QIiY+ApjssfPMcNia310rWme/k
 WVOI5wev+jD/9dd3IAUqlaAAAAA==
X-Change-ID: 20261112-ayaneo-ec-module-power-66f183285f3e
To: Antheas Kapenekakis <lkml@antheas.dev>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: =?utf-8?q?Mat=C3=ADas_Mart=C3=ADnez?= <hello@matias.me>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 lilytaylor42 <lily@jler.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794513967; l=8180;
 i=lily@jler.org; s=20261112; h=from:subject:message-id;
 bh=jW2HyVQ8Ywdpdb7a+sBHcxofF/Hh5v+nteoMbvbzkT8=;
 b=f9rbWr719YIr6qhVYs8hL5cWHpFrm46hn6nZRXJwpoZdoHIhD3CaKmaiMK+1eOIXPh/F4zxEl
 TEMmygxfpunC1ul2XB4m0imBSjTyeBfZYHfbcchPaVWPSnwaQ4/EKjY
X-Developer-Key: i=lily@jler.org; a=ed25519;
 pk=59Yvs49eRu9o5I304gXZMP7KaSEjE3OTY8rsvnzkYOA=
X-Endpoint-Received: by B4 Relay for lily@jler.org/20261112 with
 auth_id=1503
X-Original-From: lilytaylor42 <lily@jler.org>
Reply-To: lily@jler.org
Content-Transfer-Encoding: 7bit

From: lilytaylor42 <lily@jler.org>

On the AYANEO 3, releasing a Magic Module means writing the eject
command and then turning controller power off. Once the modules are
fitted again, power has to be turned back on before the controller
reappears. Today userspace has to watch for that. If nothing is
running when the modules are refitted, the controller stays off and
the device has no built-in input.

The EC raises no event when a module is attached or removed, so poll
the module register while controller power is off. Once a module has
been taken out and both are attached again for a second, turn the
power back on, as the vendor's Windows software does. Power turned off
with both modules left in place stays off. Notify controller_modules
and controller_power so userspace can poll() instead of re-reading.

The investigation, code and this changelog were produced with an AI
coding assistant (Claude Code). It decompiled the DSDT and traced EC
query events to confirm that module changes raise no event, wrote the
patch, and ran the tests below on my AYANEO 3 while I removed and
refitted the modules.

Signed-off-by: lilytaylor42 <lily@jler.org>
---
Built in-tree on platform-drivers-x86 for-next (568051916) with W=1 and
x86_64_defconfig plus AYANEO_EC=m: no warnings before or after.

Tested on an AYANEO 3 (Bazzite 45, 7.3.3 kernel), built as a module
against the running kernel, with no userspace module handling running:
after eject and power off, refitting both modules turned power back on
1.2 s after both were seated and the controller re-enumerated. Power
turned off with both modules attached stayed off.

Independent of this patch: after power returns, the controller first
connects in a state that does not answer GET_DESCRIPTOR and reconnects
about 11 s later, so enumeration takes ~32 s with the default scheme and
~12 s with the port's old_scheme quirk set. That happens with the
unpatched driver too.
---
 Documentation/ABI/testing/sysfs-platform-ayaneo-ec | 10 ++-
 drivers/platform/x86/ayaneo-ec.c                   | 90 ++++++++++++++++++++++
 2 files changed, 99 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-platform-ayaneo-ec b/Documentation/ABI/testing/sysfs-platform-ayaneo-ec
index 4cffbf5fc..8c70be0c3 100644
--- a/Documentation/ABI/testing/sysfs-platform-ayaneo-ec
+++ b/Documentation/ABI/testing/sysfs-platform-ayaneo-ec
@@ -7,13 +7,21 @@ Description:
 		the controller power (e.g. for power savings). Write 1 to
 		turn on, 0 to turn off. File is readable and writable.
 
+		After power is turned off, the driver turns it back on
+		once a module has been removed and both modules are
+		attached again, as the Windows software for this device
+		does. Power turned off with both modules left attached
+		stays off. Userspace can poll() this file for changes.
+
 What:		/sys/devices/platform/ayaneo-ec/controller_modules
 Date:		Nov 2025
 KernelVersion:	6.19
 Contact:	"Antheas Kapenekakis"  <lkml@antheas.dev>
 Description:
 		Shows which controller modules are currently connected to
-		the device. Possible values are "left", "right" and "both".
+		the device. Possible values are "left", "right", "both"
+		and "none". While controller power is off, changes can be
+		waited for with poll().
 		File is read-only. The Windows software for this device
 		will only set controller power to 1 if both module sides
 		are connected (i.e. this file returns "both").
diff --git a/drivers/platform/x86/ayaneo-ec.c b/drivers/platform/x86/ayaneo-ec.c
index 7c6a06330..3f89f8f9d 100644
--- a/drivers/platform/x86/ayaneo-ec.c
+++ b/drivers/platform/x86/ayaneo-ec.c
@@ -9,6 +9,7 @@
 
 #include <linux/acpi.h>
 #include <linux/bits.h>
+#include <linux/devm-helpers.h>
 #include <linux/dmi.h>
 #include <linux/err.h>
 #include <linux/hwmon.h>
@@ -19,6 +20,7 @@
 #include <linux/pm.h>
 #include <linux/power_supply.h>
 #include <linux/sysfs.h>
+#include <linux/workqueue.h>
 #include <acpi/battery.h>
 
 #define AYANEO_PWM_ENABLE_REG	 0x4A
@@ -43,6 +45,13 @@
 #define AYANEO_MODULE_RIGHT	BIT(1)
 #define AYANEO_MODULE_MASK	(AYANEO_MODULE_LEFT | AYANEO_MODULE_RIGHT)
 
+/*
+ * The EC raises no event when a module is attached or removed, so the
+ * module register is polled, and only while controller power is off.
+ */
+#define AYANEO_MODULE_POLL_MS	500
+#define AYANEO_MODULE_SETTLE	3	/* polls with both attached before power on */
+
 struct ayaneo_ec_quirk {
 	bool has_fan_control;
 	bool has_charge_control;
@@ -58,6 +67,12 @@ struct ayaneo_ec_platform_data {
 	struct mutex hwmon_lock;
 	bool restore_charge_limit;
 	bool restore_pwm;
+
+	/* Turns controller power back on once the modules are refitted */
+	struct delayed_work module_work;
+	bool module_removed;
+	unsigned int module_settle;
+	u8 module_state;
 };
 
 static const struct ayaneo_ec_quirk quirk_fan = {
@@ -395,11 +410,69 @@ static int ayaneo_remove_battery(struct power_supply *battery,
 	return 0;
 }
 
+static void ayaneo_module_watch(struct ayaneo_ec_platform_data *data)
+{
+	data->module_removed = false;
+	data->module_settle = 0;
+	data->module_state = AYANEO_MODULE_MASK;
+	queue_delayed_work(system_freezable_wq, &data->module_work,
+			   msecs_to_jiffies(AYANEO_MODULE_POLL_MS));
+}
+
+/*
+ * While controller power is off, wait for a module to be taken out and
+ * for both modules to be attached again, then turn the power back on.
+ * This mirrors the vendor's Windows software and means a refitted
+ * controller works even when no userspace program is watching. Power
+ * turned off with both modules left in place stays off.
+ */
+static void ayaneo_module_work(struct work_struct *work)
+{
+	struct ayaneo_ec_platform_data *data =
+		container_of(to_delayed_work(work), struct ayaneo_ec_platform_data,
+			     module_work);
+	struct kobject *kobj = &data->pdev->dev.kobj;
+	u8 power, modules;
+
+	if (ec_read(AYANEO_POWER_REG, &power) ||
+	    ec_read(AYANEO_MODULE_REG, &modules))
+		goto again;
+
+	/* Turned back on elsewhere, e.g. by userspace */
+	if (power == AYANEO_POWER_ON)
+		return;
+
+	modules = ~modules & AYANEO_MODULE_MASK;
+	if (modules != data->module_state) {
+		data->module_state = modules;
+		sysfs_notify(kobj, NULL, "controller_modules");
+	}
+
+	if (modules != AYANEO_MODULE_MASK) {
+		data->module_removed = true;
+		data->module_settle = 0;
+		goto again;
+	}
+
+	if (!data->module_removed || ++data->module_settle < AYANEO_MODULE_SETTLE)
+		goto again;
+
+	if (!ec_write(AYANEO_POWER_REG, AYANEO_POWER_ON)) {
+		sysfs_notify(kobj, NULL, "controller_power");
+		return;
+	}
+
+again:
+	queue_delayed_work(system_freezable_wq, &data->module_work,
+			   msecs_to_jiffies(AYANEO_MODULE_POLL_MS));
+}
+
 static ssize_t controller_power_store(struct device *dev,
 				      struct device_attribute *attr,
 				      const char *buf,
 				      size_t count)
 {
+	struct ayaneo_ec_platform_data *data = dev_get_drvdata(dev);
 	bool value;
 	int ret;
 
@@ -407,10 +480,15 @@ static ssize_t controller_power_store(struct device *dev,
 	if (ret)
 		return ret;
 
+	cancel_delayed_work_sync(&data->module_work);
+
 	ret = ec_write(AYANEO_POWER_REG, value ? AYANEO_POWER_ON : AYANEO_POWER_OFF);
 	if (ret)
 		return ret;
 
+	if (!value)
+		ayaneo_module_watch(data);
+
 	return count;
 }
 
@@ -518,6 +596,18 @@ static int ayaneo_ec_probe(struct platform_device *pdev)
 			return PTR_ERR(hwdev);
 	}
 
+	if (data->quirks->has_magic_modules) {
+		u8 power;
+
+		ret = devm_delayed_work_autocancel(&pdev->dev, &data->module_work,
+						   ayaneo_module_work);
+		if (ret)
+			return ret;
+
+		if (!ec_read(AYANEO_POWER_REG, &power) && power == AYANEO_POWER_OFF)
+			ayaneo_module_watch(data);
+	}
+
 	if (data->quirks->has_charge_control) {
 		data->battery_hook.add_battery = ayaneo_add_battery;
 		data->battery_hook.remove_battery = ayaneo_remove_battery;

---
base-commit: 5680519168f65666d2c03cc6ed8fe2b7052aee12
change-id: 20261112-ayaneo-ec-module-power-66f183285f3e

Best regards,
-- 
lilytaylor42 <lily@jler.org>


