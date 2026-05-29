Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013038.outbound.protection.outlook.com [40.107.201.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36623C3420;
	Fri, 29 May 2026 09:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780047839; cv=fail; b=QTSrcFDSFniA3QCXncjKJf/gBn8DK+41DUa/NvHNNs+McZdb/GoPijouct7cTRBVbjlyKQN0XRMQjVF4mnomqIwVxoiH6rT89PilggaZ0KiiWdi5ypqD1r7SbWz/ACghYFoW9wxeX8TuyE5sWh9UbSb0BLsa7eLaCocEDf/bPiA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780047839; c=relaxed/simple;
	bh=F5MLi2P8lv9tFBTjEIOZIxBNYAFtipOBItbV3/0jcvc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=miHRxd/Q/26Nc8liNLVwg5y9899+OeKVzOAST5cOfKQMI2fD33PNT3v40/AsBOGOpRcqFKNZemUi1FfsWBw9iWJgeftV4xn0z17RLuVCKNRtWXGc52kAjQ9C/bbQRzERrt4ikViIk02bhlcFR5Dh9nFgPm1GgBBxQIwhsEUy9HM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=uNGpnjZr; arc=fail smtp.client-ip=40.107.201.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="uNGpnjZr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M/fJ8zJwWUSH+5TRNtXcKGS4V9ZkyAUIgCiQn3Bdeci08k6TYVycavm+AF7clahQGQfMPLWGI26cTV8LKSJ+CbvRTahB/nw8/xil8VzORFTmKuiQOPe6bMBITWZt0mz7ufMrJxuUOvi0hAQzlldRzlX20RVwAEJ4FBfe8EJ3TrSFZ3XDT8bKCDPQr32Zqu3kr9vuqwLhp8Ae1Lb/i3eIM9McnnkNiE/Pa0exIgYwa8JXSJbi7bJTo35TMKfJSaRRUdTHVsMfSnqcsH3z1LVcYppzosBwZcfS5G0ieu0n2fzxQe8oEh3iOALWGJjWD+SbRhvo2cvx2K8JXnhNg4yBYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aN9jme7+APmFStd90/JYYbR8MfTIZ7atrAc7dCD4FJk=;
 b=lanW56n9tIZ4Cpx9Pf2co8plT7HJ2KoUA9UtJVxneZ7Fe0eblGa/dNPbxOFL+oJJxnunGKHEfL0xLrt1GYqYPvtTwpzjE/8VYnSljUsRmQz1lDga7BXfH8T7xGIh2ntRZx5gGstgU5sCO31dz2EYcNtNVjmlfOOfCVmupLzHpOr7XPuByfqJbSp9cxCHIlGGZdmosptCbkK9MoiXUOYbWMJRdoA+qaYT2k7541XU5W9ZC1cvnpvCquLkHE7v1jG/sG2uCFpj/YIwPpaNWCvPCWTJ79bLtni8k8Ch/QEJrwFgqahsisFsTD4AfHfufCS+6gaTyxuhW0ScuPtFnB9f2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aN9jme7+APmFStd90/JYYbR8MfTIZ7atrAc7dCD4FJk=;
 b=uNGpnjZrMnfY+f4vhEBNoN6H3GQPTfC117dcJ6LWm8M8ihCf0yqzneJAA9H5ur7uMrjcwHYxOQ0dLuT3Jzi7keMJnnp2yfyvCxq4B8hau5PPotHxAvpEjUntDXTEy7FyKouVkCY2b0OmZgGMCWIul4iBwWZznMlY8i3OhSby+o8=
Received: from MN2PR01CA0040.prod.exchangelabs.com (2603:10b6:208:23f::9) by
 PH0PR12MB5631.namprd12.prod.outlook.com (2603:10b6:510:144::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.14; Fri, 29 May 2026 09:43:46 +0000
Received: from BL6PEPF00022574.namprd02.prod.outlook.com
 (2603:10b6:208:23f:cafe::e) by MN2PR01CA0040.outlook.office365.com
 (2603:10b6:208:23f::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Fri, 29
 May 2026 09:43:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00022574.mail.protection.outlook.com (10.167.249.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Fri, 29 May 2026 09:43:45 +0000
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 29 May
 2026 04:43:43 -0500
From: "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>
Date: Fri, 29 May 2026 17:43:15 +0800
Subject: [PATCH v6] platform/x86/amd: Introduce Halo Box RGB LED driver
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260529-halo-leds-v2-plus-v6-1-b7bf7b904a16@amd.com>
X-B4-Tracking: v=1; b=H4sIALJfGWoC/23OTW6DMBAF4KtEXtfIHhv/dJV7VFkYPASrgJGdo
 FQRd69JFyUSq9GT5nt6T5IxBczk8/QkCZeQQ5xKUB8n0vZuuiINvmQCDBSTYGnvhkgH9JkuQOf
 hnqkGaA0zwnVoSHFzwi48Xp1fl5K7FEd66xO6fZNmALVUFZdMWxCU03yfMY38/I1pwqGK6bq19
 SHfYvp5DVxg6/xrqJk82FIup65joDXo8tSc3eirNo5kW7KIvTdHfhtiue9kbaxS6N693HngR14
 W30hrmsY1Qjl49/XeiyNfFy+t9q3V3Dpu/v26rr+juxaDrgEAAA==
To: Hans de Goede <hansg@kernel.org>, =?utf-8?q?Ilpo_J=C3=A4rvinen?=
	<ilpo.jarvinen@linux.intel.com>, "Mario Limonciello (AMD)"
	<superm1@kernel.org>, "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>
CC: <linux-kernel@vger.kernel.org>, <platform-driver-x86@vger.kernel.org>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Armin Wolf <W_Armin@gmx.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=14338; i=Leo.Lin@amd.com;
 h=from:subject:message-id; bh=F5MLi2P8lv9tFBTjEIOZIxBNYAFtipOBItbV3/0jcvc=;
 b=owEBbQKS/ZANAwAKAV8XsZZKKe6GAcsmYgBqGV/O2sSqRiRV578m6GsfD10wAjtAxswz55RF5
 aqMEt2JcVyJAjMEAAEKAB0WIQQzqV4kW+yguuqHrw5fF7GWSinuhgUCahlfzgAKCRBfF7GWSinu
 hjTuEACX1GjM+1uxphqUnwERZHfYJiyAepz1PD5EkfWD6VwkyzbgQSPSOzJ0DmnNlFmwgo5FPLV
 YjtmFr7Q90pUxJ2LtDqseRxD+/80lEDK/4slV56irQT+TN1sqcqoNaKhBLgkTko3DsD6foDHvlV
 ncgBRMvpO49UAt8n1GRVtzEag6RSOfMndfuHGPYv+pTeZ3LdhWn4R2qd0S3Hav6AFvuNQFVaD7U
 3WwSYksB9U5171zl8/OFnhEiAz77cEo7vtqCLqWeJXm0HofWj8UEuN7M3z+HND09DmX3W+s919t
 RO68dfNVmagSPfVA1kHPNO1OjBunuJxOnpapwBzaGDCCfqa0B8j5nRdbbgQrJAvau85LOGuO7Ro
 m+j4cIuZhBBp8YUz9TXSWeHGPUcxapMQNRGrfHqyVuepozwgsawuT6a4nexT/lsb0+mcH1OiEyo
 HrgJTyZisKrTrsleUUmuB1GIMjQuUtmSoE5T4LhekvACTr7wmmfFJ7T+UuMSkSL+XQhm/q2dkQJ
 7DacCYV6SahparmgaLWUBxQnQ+D/nCj7nOjSy9ZlKiLNMh8E5+N3Hiz+A4xeozZbcAePD2XHn+u
 /9/5c5Hf2RT0mGJO+Rt8SZxQRAAaDxuuogUyI5D1/OpCJImK0uHoy678YEGMM/R8anuuwxcjDwz
 aXrfb36ntU8XioA==
X-Developer-Key: i=Leo.Lin@amd.com; a=openpgp;
 fpr=33A95E245BECA0BAEA87AF0E5F17B1964A29EE86
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022574:EE_|PH0PR12MB5631:EE_
X-MS-Office365-Filtering-Correlation-Id: bf9a9ef6-5f8e-42ed-fce4-08debd66c739
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|13003099007|6133799003|18002099003|11063799006|56012099006|5023799004|3023799007;
X-Microsoft-Antispam-Message-Info:
	SGBiUeCabobRu65LSB+Rv5rez0eQW/WHxYMwl2I+DgyVBs0RCoBM4ZaXr/Q9WfDvkEMGzDIdGd8N2qpJ5G5B8rbaTvCVwN5QS/lwI0o2gW2BQoPol7N041S8iNd0zvG+PpUDCN2E491vQWcDfWedaeVk0pUvgL77chFS5odDog4VdqfvShznM/mzR1X6dsb3sLVAZNnvx0Mw7YkkQDZLppXfLgZ6MV9OxRq3dySVREu7WHqzG/h5bOYqERVPlOdgH8m/D743Bgy5F1EQDgSvMEy1VQYfFJ36hmNRua3gOzxe1S+00CKEPNlcBUBE1ZVfX3r/KM68toaIjGirPKBJ65/AUFkWPTqq+osQI1MR4f2A8p7BZ9bTXPlkSdUSNsVy+ijlGQLTq10K1lyFbTLgo9LV4qzqbGI6qPtwsUm352cT/cPbPaxmqFWtw2QsFzKWOyIBz7/SWZ5LCkXFcTCEAy1Zm/uy9cdZNTUOTrE85xapKUpR9UctOZj4fmgbxrypvk/V/Jul0XObniQRCrI9FiwdHNjeAAgLy0l68Zej0nSKMM8bToCqm9pogYSTlbJugSvxlvBnqTeglqp++WCXJkYEhntSMc5YjX65oaBR3mcemFltoNiwNkA9Hsjm9iDnWgQtbnChQmaXHRGtsAKL7SCmiuFJS4hq6+lzAbvrgzVDmRi9haHIhZCwJCEB1hGjlFji0M+SlqHiAMREBjQq+zOz2cAyfNpL3HAduZHEQJ0=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(13003099007)(6133799003)(18002099003)(11063799006)(56012099006)(5023799004)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gTS6+PFb+hkFQWn80jo0AWFuY3kvt9/VqVfHkjcpXu3RQfkmifNBdomvqk6r9ddF6kK0Ivp8sGv8XBbQrORpfPNTrkSegxE1OvJjZ7bNUo25eQzwo83TzPuJaC/gJ1cXhg5tX+6n38ub0XdtLNjzla1qQx5pCNJ2EW67kULKg2HZ1Z1DPHKZmiJeAi9LdM4hyoPviRPoFvYvBIAObGDPDhCVrRiC3AeQav9qFT48PZ+bJS9hGSuoLinHHa93lUWGHjo/D5MgrRqN2rMvcySS0SP4MOa+VkeSipVBbwiaLHH0Koyv76aDanVhRIrvyjQzW2v2Vt11wQD88Q9gMVAlHVjSxxm4hjlOGQNvwP2rbURy4mBrCS3xy00uPp0lo41RHFVbir7ffA4kUv+rUUcOepm1NxH29qezsKg4louJUIt5friJfdJpG1098/xP+gGZ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 09:43:45.9606
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf9a9ef6-5f8e-42ed-fce4-08debd66c739
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022574.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5631

The Halo Box features an RGB LED light bar that can be controlled
through WMI methods to display any color combination.

The driver exposes the LED through the LED multicolor subsystem,
allowing userspace to control RGB values via sysfs:
  /sys/class/leds/amd_halo:multicolor:status/multi_intensity
  /sys/class/leds/amd_halo:multicolor:status/brightness

Hardware interface:
- Three separate RGB channels (Red, Green, Blue)
- All 3 channels are configured at once with a single WMI method call
- Value range: 0-100 (matching hardware range directly)

Co-developed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
Reviewed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>
---
v5 -> v6
- Add missing includes and sort/group them accordingly
- In __amd_halo_wmi_call, remove some unnecessary intermedaite variable assignments
- In __amd_halo_wmi_call, move declaration of pointer managed by scope-based cleanup
  helpers closer to where it is used
- Add trailing comma to designated initializers
- Link to v5: https://lore.kernel.org/r/20260523-halo-leds-v2-plus-v5-1-497dc9719a18@amd.com

v4 -> v5
No code chang. Only email etiquette fixes
- Fix the "From: " in the mail from leo.lin@amd.com to Leo.Lin@amd.com,
  so that it matches s-o-b
- Pull the Reviewed-by trailer from previous threads.
- Link to v4: https://lore.kernel.org/r/20260521-halo-leds-v2-plus-v4-1-b498bbab36a2@amd.com

v3 -> v4
There's a new WMI method we introduced in BIOS for color setting, to
replace the original ones, so in this version:
- Introduce a new "AMD_HALO_WMI_RGB" method ID. This WMI method takes 1
  command argument (GET/SET) and 3 RGB values. This method is capable of
  turning on and setting all RGB channels at once in a single call, reducing
  some undesirable visual effects when setting them separately.
- Replace color setting code with this new "AMD_HALO_WMI_RGB" method.
- Remove implementations of unused WMI methods.

This version also fixes things pointed out in the previous version:
- Explicltly specify the endianess of WMI arguments as __le32, and use
  endian-conversion helpers accordingly.
- Use scope-based cleanup helper for WMI buffer.
- Remove cleanup for channel setting WMI in probe.
- Explicitly include headers for kfree and le16_to_cpu
- Fix white spaces
- Fix designated initializor style
- Link to v3: https://lore.kernel.org/r/20260508-halo-leds-v2-plus-v3-1-91df458966ea@amd.com

(Didn't pull Shyam's Reviewed-by because this is a relatively bigger change.)

v2 -> v3:
- Re-introduce OF/OFF method: implement them with wmidev_invoke_method
- Explicitly call the ON method on brightness_set callback for
  brightness != 0; call the OFF method when brightness == 0
- Turn off light bar if TURN_ON/SET_LIGHTBAR can't function normally
- Replace get_unaligned_le64 with casting and le16_to_cpu()
- Add an inline function (wmi_status_to_err) to convert WMI return
  values to errno
- Use amd_halo_wmi_set_channel in probe to set default color
- Use devm_mutex_init() instead
- Remove unused includes
- Link to v2: https://lore.kernel.org/r/20260504-halo-leds-v2-plus-v2-1-af027727605b@amd.com

v1 -> v2:
- Fix Kconfig dependencies
- Remove amd_halo_wmi_turn_off(). Handle the case where brightness=0 with the
  same logic where brightness != 0
- Remove the brightness_get callback, because currently there isn't a
  well-defined global bightness in hardware. Note that the sysfs brightness
  stil works. It just caches the value last set.
- Convert to wmidev_invoke_method()
- Convert to ARRAY_SIZE()
- Convert some macros to enum
- Convert to devm_led_classdev_multicolor_register_ext()
- Rename sysfs path to amd_halo:multicolor:status
- Fold default LED colors setting in probe, before registration
- Add no_singleton option
- Make default RGB values into macros and adjust their values
---
 MAINTAINERS                             |   7 +
 drivers/platform/x86/amd/Kconfig        |  11 ++
 drivers/platform/x86/amd/Makefile       |   1 +
 drivers/platform/x86/amd/amd_halo_led.c | 273 ++++++++++++++++++++++++++++++++
 4 files changed, 292 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b539be153f6a..6450962b003e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1130,6 +1130,13 @@ F:	drivers/char/hw_random/geode-rng.c
 F:	drivers/crypto/geode*
 F:	drivers/video/fbdev/geode/
 
+AMD HALO BOX RGB LED DRIVER
+M:	Mario Limonciello (AMD) <superm1@kernel.org>
+R:	Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>
+L:	platform-driver-x86@vger.kernel.org
+S:	Supported
+F:	drivers/platform/x86/amd/amd_halo_led.c
+
 AMD HSMP DRIVER
 M:	Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
 R:	Carlos Bilbao <carlos.bilbao@kernel.org>
diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd/Kconfig
index b813f9265368..a1a74ef6c859 100644
--- a/drivers/platform/x86/amd/Kconfig
+++ b/drivers/platform/x86/amd/Kconfig
@@ -34,6 +34,17 @@ config AMD_WBRF
 	  This mechanism will only be activated on platforms that advertise a
 	  need for it.
 
+config AMD_HALO_LED
+	tristate "AMD Halo Box RGB LED Driver"
+	depends on ACPI_WMI && LEDS_CLASS_MULTICOLOR
+	help
+	  This driver provides RGB LED control for AMD Halo Box devices
+	  through the LED multicolor subsystem. The Halo Box light bar can
+	  be controlled via sysfs to display any RGB color combination.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called amd_halo_led.
+
 config AMD_ISP_PLATFORM
 	tristate "AMD ISP4 platform driver"
 	depends on I2C && X86_64 && ACPI
diff --git a/drivers/platform/x86/amd/Makefile b/drivers/platform/x86/amd/Makefile
index f6ff0c837f34..2f467dbbfc8a 100644
--- a/drivers/platform/x86/amd/Makefile
+++ b/drivers/platform/x86/amd/Makefile
@@ -10,5 +10,6 @@ obj-$(CONFIG_AMD_PMC)		+= pmc/
 obj-$(CONFIG_AMD_HSMP)		+= hsmp/
 obj-$(CONFIG_AMD_PMF)		+= pmf/
 obj-$(CONFIG_AMD_WBRF)		+= wbrf.o
+obj-$(CONFIG_AMD_HALO_LED)	+= amd_halo_led.o
 obj-$(CONFIG_AMD_ISP_PLATFORM)	+= amd_isp4.o
 obj-$(CONFIG_AMD_HFI)		+= hfi/
diff --git a/drivers/platform/x86/amd/amd_halo_led.c b/drivers/platform/x86/amd/amd_halo_led.c
new file mode 100644
index 000000000000..e44e00b6846c
--- /dev/null
+++ b/drivers/platform/x86/amd/amd_halo_led.c
@@ -0,0 +1,273 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * AMD Halo Box RGB LED Driver
+ *
+ * Copyright (C) 2026 Advanced Micro Devices, Inc.
+ *
+ * This driver provides RGB LED control for AMD Halo Box devices through
+ * the LED multicolor subsystem. The Halo Box light bar can be controlled
+ * via sysfs to display any RGB color combination.
+ */
+
+#include <linux/array_size.h>
+#include <linux/cleanup.h>
+#include <linux/container_of.h>
+#include <linux/dev_printk.h>
+#include <linux/device.h>
+#include <linux/device/devres.h>
+#include <linux/led-class-multicolor.h>
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+#include <linux/wmi.h>
+
+#include <linux/byteorder/generic.h>
+
+#define AMD_HALO_GUID "081E747B-E028-4232-AF24-EAAEAB2B1E86"
+
+/* WMI method IDs from MOF */
+enum {
+	AMD_HALO_WMI_TURN_OFF = 0x04,
+	AMD_HALO_WMI_RGB = 0x07
+};
+
+/* Arg0 of the AMD_HALO_WMI_RGB Method */
+enum {
+	AMD_HALO_RGB_CMD_GET,
+	AMD_HALO_RGB_CMD_SET
+};
+
+/* Status codes from spec */
+#define AMD_HALO_STATUS_SUCCESS		0x0000
+#define AMD_HALO_STATUS_INVALID_PARAM	0xFFFD
+
+/* Brightness uses 0-100 range */
+#define AMD_HALO_MAX_HW_BRIGHTNESS	100
+
+/* Default RGB brightness */
+#define AMD_HALO_DEFAULT_RED		50
+#define AMD_HALO_DEFAULT_GREEN		30
+#define AMD_HALO_DEFAULT_BLUE		30
+
+/**
+ * struct amd_halo_led_data - Driver private data
+ * @wdev: WMI device pointer
+ * @led_mc: LED multicolor class device
+ * @subled_info: RGB channel information
+ * @lock: Mutex to protect WMI calls
+ */
+struct amd_halo_led_data {
+	struct wmi_device *wdev;
+	struct led_classdev_mc led_mc;
+	struct mc_subled subled_info[3];
+	struct mutex lock;	/* Protects WMI method calls */
+};
+
+struct amd_halo_wmi_args {
+	__le32 arg0;
+	__le32 arg1;
+};
+
+struct amd_halo_wmi_args_rgb {
+	__le32 cmd;
+	__le32 red;
+	__le32 green;
+	__le32 blue;
+};
+
+static inline int wmi_status_to_err(u16 status)
+{
+	switch (status) {
+	case AMD_HALO_STATUS_SUCCESS:
+		return 0;
+	case AMD_HALO_STATUS_INVALID_PARAM:
+		return -EINVAL;
+	default:
+		return -EIO;
+	}
+}
+
+static int __amd_halo_wmi_call(struct wmi_device *wdev,
+			       u32 method_id, void *data, size_t length)
+{
+	struct wmi_buffer input = {
+		.length = length,
+		.data = data,
+	};
+	struct wmi_buffer output = {};
+	int ret;
+
+	/* Return buffer per spec: Bytes[0:1] = Status (little-endian) */
+	ret = wmidev_invoke_method(wdev, 0, method_id,
+				   &input, &output, sizeof(__le16));
+	if (ret)
+		return ret;
+
+	__le16 *result_status __free(kfree) = output.data;
+
+	return wmi_status_to_err(le16_to_cpu(*result_status));
+}
+
+/**
+ * amd_halo_wmi_turn_off - Turn off all LED channels
+ * @wdev: WMI device pointer
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+static int amd_halo_wmi_turn_off(struct wmi_device *wdev)
+{
+	struct amd_halo_wmi_args args = { };
+
+	return __amd_halo_wmi_call(wdev, AMD_HALO_WMI_TURN_OFF, &args, sizeof(args));
+}
+
+/**
+ * amd_halo_wmi_set_rgb - Set all RGB channels atomically
+ * @wdev: WMI device pointer
+ * @r: brightness for red channel (0 - 100)
+ * @g: brightness for green channel (0 - 100)
+ * @b: brightness for blue channel (0 - 100)
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+static int amd_halo_wmi_set_rgb(struct wmi_device *wdev, u32 r, u32 g, u32 b)
+{
+	if (r > AMD_HALO_MAX_HW_BRIGHTNESS ||
+	    g > AMD_HALO_MAX_HW_BRIGHTNESS ||
+	    b > AMD_HALO_MAX_HW_BRIGHTNESS) {
+		return -EINVAL;
+	}
+
+	struct amd_halo_wmi_args_rgb args = {
+		.cmd = cpu_to_le32(AMD_HALO_RGB_CMD_SET),
+		.red = cpu_to_le32(r),
+		.green = cpu_to_le32(g),
+		.blue = cpu_to_le32(b),
+	};
+
+	return __amd_halo_wmi_call(wdev, AMD_HALO_WMI_RGB, &args, sizeof(args));
+}
+
+/**
+ * amd_halo_brightness_set - Set LED brightness and color
+ * @cdev: LED class device
+ * @brightness: Brightness value
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+static int amd_halo_brightness_set(struct led_classdev *cdev,
+				   enum led_brightness brightness)
+{
+	struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(cdev);
+	struct amd_halo_led_data *data = container_of(mc_cdev,
+						      struct amd_halo_led_data,
+						      led_mc);
+	u32 red_hw, green_hw, blue_hw;
+	int ret;
+
+	guard(mutex)(&data->lock);
+
+	led_mc_calc_color_components(mc_cdev, brightness);
+
+	if (brightness == 0)
+		return amd_halo_wmi_turn_off(data->wdev);
+
+	red_hw = mc_cdev->subled_info[0].brightness;
+	green_hw = mc_cdev->subled_info[1].brightness;
+	blue_hw = mc_cdev->subled_info[2].brightness;
+
+	ret = amd_halo_wmi_set_rgb(data->wdev, red_hw, green_hw, blue_hw);
+	if (ret)
+		goto out;
+
+	return 0;
+
+out:
+	/*
+	 * Consider the light bar non-functional if AMD_HALO_WMI_RGB failed.
+	 * Attempt to turn the LED off completely as clean-up.
+	 */
+	if (amd_halo_wmi_turn_off(data->wdev))
+		dev_warn_ratelimited(&data->wdev->dev, "Failed to turn LED off on cleanup\n");
+
+	return ret;
+}
+
+/**
+ * amd_halo_probe - Driver probe function
+ * @wdev: WMI device
+ * @context: Context data (unused)
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+static int amd_halo_probe(struct wmi_device *wdev, const void *context)
+{
+	struct led_init_data led_init_data = {
+		.devicename = "amd_halo",
+		.default_label = "multicolor:" LED_FUNCTION_STATUS,
+		.devname_mandatory = true,
+	};
+	struct amd_halo_led_data *data;
+	int ret;
+
+	data = devm_kzalloc(&wdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	ret = devm_mutex_init(&wdev->dev, &data->lock);
+	if (ret)
+		return ret;
+
+	data->wdev = wdev;
+	dev_set_drvdata(&wdev->dev, data);
+
+	data->subled_info[0].color_index = LED_COLOR_ID_RED;
+	data->subled_info[1].color_index = LED_COLOR_ID_GREEN;
+	data->subled_info[2].color_index = LED_COLOR_ID_BLUE;
+	data->subled_info[0].intensity = AMD_HALO_DEFAULT_RED;
+	data->subled_info[1].intensity = AMD_HALO_DEFAULT_GREEN;
+	data->subled_info[2].intensity = AMD_HALO_DEFAULT_BLUE;
+
+	data->led_mc.led_cdev.brightness = AMD_HALO_MAX_HW_BRIGHTNESS;
+	data->led_mc.led_cdev.max_brightness = AMD_HALO_MAX_HW_BRIGHTNESS;
+	data->led_mc.led_cdev.brightness_set_blocking = amd_halo_brightness_set;
+	data->led_mc.led_cdev.flags = LED_CORE_SUSPENDRESUME | LED_RETAIN_AT_SHUTDOWN;
+	data->led_mc.num_colors = ARRAY_SIZE(data->subled_info);
+	data->led_mc.subled_info = data->subled_info;
+
+	ret = amd_halo_wmi_set_rgb(wdev, AMD_HALO_DEFAULT_RED, AMD_HALO_DEFAULT_GREEN,
+				   AMD_HALO_DEFAULT_BLUE);
+	if (ret)
+		return ret;
+
+	ret = devm_led_classdev_multicolor_register_ext(&wdev->dev, &data->led_mc,
+							&led_init_data);
+	if (ret)
+		return dev_err_probe(&wdev->dev, ret,
+				     "Failed to register multicolor LED\n");
+	return 0;
+}
+
+static const struct wmi_device_id amd_halo_id_table[] = {
+	{ .guid_string = AMD_HALO_GUID },
+	{ }
+};
+MODULE_DEVICE_TABLE(wmi, amd_halo_id_table);
+
+static struct wmi_driver amd_halo_driver = {
+	.driver = {
+		.name = "amd_halo_led",
+	},
+	.id_table = amd_halo_id_table,
+	.probe = amd_halo_probe,
+	.no_singleton = true,
+};
+
+module_wmi_driver(amd_halo_driver);
+
+MODULE_AUTHOR("Mario Limonciello (AMD) <superm1@kernel.org>");
+MODULE_AUTHOR("Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>");
+MODULE_DESCRIPTION("AMD Halo Box RGB LED Control Driver");
+MODULE_LICENSE("GPL");

---
base-commit: e7ae89a0c97ce2b68b0983cd01eda67cf373517d
change-id: 20260429-halo-leds-v2-plus-722c8083afe8

Best regards,
-- 
Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>

