Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792972392;
	b=XbdKxM0Y1q4xb9+w7T/TaKXowRxIy/yXIIc26IXkKFumASnkjrucUH8yVPbzFUXcjWZP
	 sC3h3s5vwszRhdSybxa5GnMKl7jDZXFnATPaO2Zn6rhPUZog2m3UqpT2p2SBV6hMafkmi
	 dLDKaIWFvaPPBHeOTsoapTiqYKRg/1awCOgRFloiXW9tIQjrmlPLADT3Cqgh0cnjEQMQY
	 QAGzOtlRoC4YTiDVnkaWHJda4Tf0zGqRaW7dXWVLLOSM2A77L0/CaIWmtt66qncIMvezw
	 DP90zS0YymowErgmsjo0+m9y9zBjMveMpGCQdn6KzKBZbl2NtLstrnfySP37IO9+Ofw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792972392;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RMjjdnj15EPIEp1Xcr7HJfBq/GiPgHey9XLhjsl06Uw=;
	b=R5n7binMK2HzIVAsF7YF3kmwnZv6sJL/9kBPddE+yBdkImfilk99+0m8LqSdoBWYB8d9
	 XnrW/ISObwC+WDWHfSezLYmCmS71G/t3Txt/LawJI9jyO1N2ZmaT1mAhoalInaLbibm4R
	 0bIrmLprF9eK8MY6qfZM5Gkp0lv+y4IXuM4Z+9Gp6PIuqigf3Rea/tw96Ib5DB/zF9d28
	 s/cudZLiFOi5/1c4g8CufrtlT2z98Vk5npXtTSnmlxJDLuwCbggQIOlzbaMW3KhNXKl2g
	 1vDrEr294hcEFfSoXJGjfCldgILqr2hgjMIesCN7yyr45z5vXFEnSmbuNSiePfBFnbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TFsf6XUX;
	arc=none smtp.remote-ip=91.218.175.199
Received: from mta0.migadu.com (out-199.mta0.migadu.com [91.218.175.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0440060A263E
	for <platform-driver-x86@vger.kernel.org>; Sun, 25 Oct 2026 23:53:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0440060A263E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TFsf6XUX
X-Envelope-To: platform-driver-x86@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=MpUp3asw/jvoPlK/e+cT5xP1Gg2dHYa/G4XvMJkytyc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792972390; v=1; x=1793577190;
 b=TFsf6XUX5fWf5MmxAYpiIQ5ByPuF38H7xprcswLv5cumqmicdlZ3t+d9RiLdMbXhbVFq0nPg
 Lee3YDA08oa+pvLBHF2cnGpHyUVmtzsSWib3F7K399fiUQp+I5b1HR+K2eJx6NbajsTQDAR0usK
 ejSDZVLIapk7Ty+PkDokOU3Q=
X-Envelope-To: platform-driver-x86@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id df730c9150d6efe1;
	Sun, 25 Oct 2026 23:53:10 +0000
X-Mizu-Trace-ID: df730c9150d6efe1
X-Migadu-Flow: FLOW_OUT
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-input@vger.kernel.org,
	kernel@lists.opengamingcollective.org,
	"Benjamin Tissoires" <bentiss@kernel.org>,
	"Jiri Kosina" <jikos@kernel.org>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Mateusz Schwartz" <matthew.schwartz@linux.dev>,
	"Denis Benato" <benato.denis96@gmail.com>,
	"Jonathan LoBue" <jlobue10@gmail.com>,
	"Khamunetri Clark" <khamunetriclark@gmail.com>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	"Joshua Leivenzon" <hacker1024@users.sourceforge.net>,
	"Nathan Chancellor" <nathan@kernel.org>,
	=?UTF-8?q?Rebecca=20Mara=20M=C3=BCller?= <rebecca.mara@posteo.de>,
	"Ivan Levchenko" <me@livan.pro>,
	"Corentin Chary" <corentin.chary@gmail.com>,
	"Hans de Goede" <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH v11 16/18] platform/x86: asus-armoury: pick the eGPU activation from the reported GPU
Date: Sun, 25 Oct 2026 23:52:29 +0000
Message-ID: <20261025235232.129945-17-denis.benato@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261025235232.129945-1-denis.benato@linux.dev>
References: <20261025235232.129945-1-denis.benato@linux.dev>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The egpu_enable attribute is a switch: writing 0 turns the eGPU off
and writing 1 turns it on. Turning it on has always sent the NVIDIA
activation value, which only works for NVIDIA stations, and the WMI
interface cannot tell which GPU is installed in the connected one.

Let drivers that detect the station report the GPU vendor through
asus-wmi: writing 1 sends the activation value matching the reported
vendor and falls back to NVIDIA when nothing has been reported, so
existing tools keep working unchanged on every station.

Signed-off-by: Denis Benato <denis.benato@linux.dev>
---
 drivers/platform/x86/asus-armoury.c        | 53 +++++++++++++---------
 drivers/platform/x86/asus-wmi.c            | 29 ++++++++++++
 include/linux/platform_data/x86/asus-wmi.h | 11 +++++
 3 files changed, 71 insertions(+), 22 deletions(-)

diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
index fb382de5b57b..6cc5f0f6b3f5 100644
--- a/drivers/platform/x86/asus-armoury.c
+++ b/drivers/platform/x86/asus-armoury.c
@@ -538,13 +538,27 @@ static ssize_t dgpu_disable_current_value_store(struct kobject *kobj,
 ASUS_WMI_SHOW_INT(dgpu_disable_current_value, ASUS_WMI_DEVID_DGPU);
 ASUS_ATTR_GROUP_BOOL(dgpu_disable, "dgpu_disable", "Disable the dGPU");
 
-/* Values map for eGPU activation requests. */
-static u32 egpu_status_map[] = {
-	[0] = 0x00000000U,
-	[1] = 0x00000001U,
-	[2] = 0x00000101U,
-	[3] = 0x00000201U,
-};
+/*
+ * egpu_default_enable_value() - Activation value for the connected station
+ *
+ * The eGPU switch activation value selects the vendor of the external
+ * GPU: 0x0001 activates NVIDIA, 0x0101 AMD and 0x0201 Intel. Pick the
+ * value matching the GPU vendor reported for the connected station,
+ * and fall back to NVIDIA when no vendor has been reported.
+ *
+ * Return: the activation value for the reported GPU vendor
+ */
+static u32 egpu_default_enable_value(void)
+{
+	switch (asus_wmi_egpu_vendor()) {
+	case PCI_VENDOR_ID_ATI:
+		return 0x0101;
+	case PCI_VENDOR_ID_INTEL:
+		return 0x0201;
+	default:
+		return 0x0001;
+	}
+}
 
 /*
  * armoury_pci_rescan() - Performs a PCI rescan
@@ -578,9 +592,14 @@ static ssize_t egpu_enable_current_value_store(struct kobject *kobj, struct kobj
 	if (err)
 		return err;
 
-	if (requested >= ARRAY_SIZE(egpu_status_map))
+	if (requested > 1)
 		return -EINVAL;
-	enable = egpu_status_map[requested];
+
+	/*
+	 * 0 deactivates the eGPU, 1 activates it with the value matching
+	 * the GPU reported for the connected station.
+	 */
+	enable = requested ? egpu_default_enable_value() : 0;
 
 	scoped_guard(mutex, &asus_armoury.egpu_mutex) {
 		/* Ensure the eGPU is connected before attempting to activate it. */
@@ -661,7 +680,7 @@ static ssize_t egpu_enable_current_value_store(struct kobject *kobj, struct kobj
 static ssize_t egpu_enable_current_value_show(struct kobject *kobj, struct kobj_attribute *attr,
 						char *buf)
 {
-	int i, err;
+	int err;
 	u32 status;
 
 	scoped_guard(mutex, &asus_armoury.egpu_mutex) {
@@ -670,20 +689,10 @@ static ssize_t egpu_enable_current_value_show(struct kobject *kobj, struct kobj_
 			return err;
 	}
 
-	for (i = 0; i < ARRAY_SIZE(egpu_status_map); i++) {
-		if (egpu_status_map[i] == status)
-			return sysfs_emit(buf, "%u\n", i);
-	}
-
-	return -EIO;
+	return sysfs_emit(buf, "%u\n", status != 0);
 }
 
-static ssize_t egpu_enable_possible_values_show(struct kobject *kobj, struct kobj_attribute *attr,
-						char *buf)
-{
-	return armoury_attr_enum_list(buf, ARRAY_SIZE(egpu_status_map));
-}
-ASUS_ATTR_GROUP_ENUM(egpu_enable, "egpu_enable", "Enable the eGPU (also disables dGPU)");
+ASUS_ATTR_GROUP_BOOL(egpu_enable, "egpu_enable", "Enable the eGPU (also disables dGPU)");
 
 /* Device memory available to APU */
 
diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index a65090429ca7..40b4cf32c0ac 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -881,6 +881,35 @@ static DEVICE_ATTR_RW(dgpu_disable);
 #endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
 
 /* eGPU ********************************************************************/
+
+static u16 egpu_gpu_vendor;
+
+/**
+ * asus_wmi_egpu_set_vendor() - Report the vendor of the external GPU
+ * @vendor: PCI vendor ID of the GPU installed in the connected eGPU
+ * station, or 0 to fall back to the default activation value
+ *
+ * Drivers that detect an eGPU station report the vendor of the GPU
+ * they found so that the eGPU activation can use the matching value.
+ */
+void asus_wmi_egpu_set_vendor(u16 vendor)
+{
+	egpu_gpu_vendor = vendor;
+}
+EXPORT_SYMBOL_NS_GPL(asus_wmi_egpu_set_vendor, "ASUS_WMI");
+
+/**
+ * asus_wmi_egpu_vendor() - Vendor of the external GPU
+ *
+ * Return: the PCI vendor ID last reported with
+ * asus_wmi_egpu_set_vendor(), or 0 when no station is known
+ */
+u16 asus_wmi_egpu_vendor(void)
+{
+	return egpu_gpu_vendor;
+}
+EXPORT_SYMBOL_NS_GPL(asus_wmi_egpu_vendor, "ASUS_WMI");
+
 #if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
 static ssize_t egpu_enable_show(struct device *dev,
 				   struct device_attribute *attr, char *buf)
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index b5ed8c83ace1..a53b2828bb1d 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -204,6 +204,8 @@ int asus_hid_register_listener(struct asus_hid_listener *cdev);
 void asus_hid_unregister_listener(struct asus_hid_listener *cdev);
 int asus_hid_event(enum asus_hid_event event);
 bool asus_wmi_custom_fan_curve_is_enabled(void);
+void asus_wmi_egpu_set_vendor(u16 vendor);
+u16 asus_wmi_egpu_vendor(void);
 #else
 static inline void set_ally_mcu_hack(enum asus_ally_mcu_hack status)
 {
@@ -239,6 +241,15 @@ static inline bool asus_wmi_custom_fan_curve_is_enabled(void)
 {
 	return false;
 }
+
+static inline void asus_wmi_egpu_set_vendor(u16 vendor)
+{
+}
+
+static inline u16 asus_wmi_egpu_vendor(void)
+{
+	return 0;
+}
 #endif
 
 #endif	/* __PLATFORM_DATA_X86_ASUS_WMI_H */
-- 
2.47.3

