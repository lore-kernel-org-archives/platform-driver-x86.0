Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013025.outbound.protection.outlook.com [40.107.201.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F72629CE1;
	Sat, 23 May 2026 15:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779548566; cv=fail; b=CpeAlf8gCVxtmTscWXPT/qtM2AGhC+LxZ5kF8PaDeBS5ZxOrnhlCSQtOuwvQSdHddgfprOTRuU9j4OWJz7BHGZSusbiCcgA+ubaewpLZk+mLzf3u4F7T6GLC0U6EVMdFA4Kn6y/QrKMUmHytn3mMl8L41wrQKoYL13kJz/3tv6o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779548566; c=relaxed/simple;
	bh=XKfhsJZTTZthV5S2kdNAqRSGpntSbc6RyZymeqPlvjU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=Z+BjZeZAHruD01ktgZTLCPtTlljjUC/ZVfPC9zFSycfGeRKmHdxLelaAqIHflifnO8Vs6/lq7aGl6k6rSpMVHhz5CZIXtkyoB7va1j7zsZwKMfCV2KnXqEYySzh2VLLLsSP1WfWHOqwfW70GqGdYDD2rNd7yxojZFeCezKtfBzY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Ug9TijhR; arc=fail smtp.client-ip=40.107.201.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Ug9TijhR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I3bi6YD+JBGGIC9r3ydQpEwLMUmGgEQOC3WCGpJYoMAE/9PPmngcw0IS7uyXl2LH/LLYM5bgGhWr/8h3iE7tiSfIQWLVz9dUUyxjxNyYNJscLd5AU90hfXLI5bz2nJDhF32EvAV8dfZJXAKSCRqZ10HXR52yw2+8JNUMOUr3ClU8Ck7LrCitqZQOnWGR142IoK7u/aUddaHr5sCaFhE0bPxPYSKREW/QefEeZyvsAFCUFhda7cEVcR85unAgEJf9XyaLmFlP7l7qHSM132j9SrFkeoo6WVb6uWFvi2EHDN2sEL8mugDGY5+v0BQ7D+3xsNc7ZYNOLNUJD5VifwaYuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pocs0/140qMXCcFsEhRQTJ/eBl5hkJM2r7pv/pRkK3k=;
 b=lM2Qcux5NPHK/s4ZmScc/LcN0+zCtJFbFOcWXnUkI4v0xpxSYwDqzTquEQHKl0W7Me/vpZ4PtxrtIJ+p+20pTAsESXLVngIZ8MM3nrm5o1sDlk7v9NH5AXScFjKl8uSw0JF2JOCLCtV1YHULgSUmjGffQ0xYqGgA1gjq9xneu7BsZSy2uw9WB9ojw7F57NrCW0fkG9n+lH8+2s/600GCOuQOhOUBhyuXfxGKTL7e/1fNdbOK7+mrjZYmlvjabP6RAj61KySmeICsRr1D+4FE/Yoxq34h0ztDWXazwAbdTUjqwqdmyidpO144kLWah5AGuIwzUszyIs+w+xqc2JGdsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pocs0/140qMXCcFsEhRQTJ/eBl5hkJM2r7pv/pRkK3k=;
 b=Ug9TijhRlotN2snUZ4cRqOXOMITRA+lmE4VcF9dxMSFzZOpdWXWEarAlvWeX5Gng8oiBS9is5L6YSjSumt4y1M9GaYGQBwTR5jaNEf2skdIXfsHjyit77IIVGbx+QDeevikMaO0AYm5aKWqYytzxsEjkBthaaM4e5GVRrwz73HE=
Received: from IA4P221CA0002.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:559::8)
 by BL3PR12MB6524.namprd12.prod.outlook.com (2603:10b6:208:38c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.16; Sat, 23 May
 2026 15:02:39 +0000
Received: from BN3PEPF0000B36F.namprd21.prod.outlook.com
 (2603:10b6:208:559:cafe::5b) by IA4P221CA0002.outlook.office365.com
 (2603:10b6:208:559::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.18 via Frontend Transport; Sat, 23
 May 2026 15:02:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B36F.mail.protection.outlook.com (10.167.243.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.0 via Frontend Transport; Sat, 23 May 2026 15:02:38 +0000
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Sat, 23 May
 2026 10:02:34 -0500
From: "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>
Date: Sat, 23 May 2026 23:02:14 +0800
Subject: [PATCH v5] platform/x86/amd: Introduce Halo Box RGB LED driver
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260523-halo-leds-v2-plus-v5-1-497dc9719a18@amd.com>
X-B4-Tracking: v=1; b=H4sIAHXBEWoC/22OzW6DMBAGXyXyuUb2YvyTU96j6sGGdbAKGNkJS
 hTx7jXpoVTitPqkndG8SMYUMJPz6UUSLiGHOJXRfJxI29vpijR0ZRNgIJkAQ3s7RDpgl+kCdB7
 umSqAVjNdW4+aFG5O6MPj7fz8KtunONJbn9DuTYoBNEJWXDBloKac5vuMaeSXb0wTDlVM183Wh
 3yL6fkOXGBz/hoaJg5ayuXUegZKgSpP7mLHrmrjSLaSpd7z+ojfQgzvvGi0kRLtf17seOBHvCi
 8E0Y7Z10tLfzx67r+AIxLhJtuAQAA
To: Hans de Goede <hansg@kernel.org>, =?utf-8?q?Ilpo_J=C3=A4rvinen?=
	<ilpo.jarvinen@linux.intel.com>, "Mario Limonciello (AMD)"
	<superm1@kernel.org>, "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>
CC: <linux-kernel@vger.kernel.org>, <platform-driver-x86@vger.kernel.org>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Armin Wolf <W_Armin@gmx.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=13744; i=Leo.Lin@amd.com;
 h=from:subject:message-id; bh=XKfhsJZTTZthV5S2kdNAqRSGpntSbc6RyZymeqPlvjU=;
 b=owEBbQKS/ZANAwAKAV8XsZZKKe6GAcsmYgBqEcGKdg8jggQiiWYID/RTcddfjVuuEIFP/M69F
 80LQEdjESWJAjMEAAEKAB0WIQQzqV4kW+yguuqHrw5fF7GWSinuhgUCahHBigAKCRBfF7GWSinu
 hsVnEACzr+n2TxnKHWZ23YU3q2t0c9mzEIVrwLot6xjBw0NaUtgQAY9WVqhV93auj5pzKKRcZTo
 K1jHFw0/F152jn7WzefZGlhMtzuLh8Qzi3VXHEbg8YsK+b5pNgBJTlVAecAMhTb2OxiwSzkPa5U
 8M2BLugopvdsPTCgQlQ3RrlnNWkqZmFkkNLCRVkDOI658jvRSp+Malev8YQ5GH5/XN80+nxegl4
 vdRqhBvJyHhVpMlcOyJ9ecYKnsd8COCGs+FODiTOpANz2DbZy54uL5gHNs6lsKFle/nQ93YrKyf
 wRva/ekgzTJmmXrbSd5FLGlQUuIzJeqBjHvlhxfddFYY7lEBg/rlOGRsLA56IHAoFZ3hax05D9r
 6Xs6pHuJv54fkMYaFR5ZM77gyvehgE91jYn6utQyL9pW3493jKsPqD1+PUw4FMEmUYdhi7XE5MB
 GuP7yPXYVDPv8nZOT4RmFB+fBTVLBmcrp9AGZo3U4wGhXqYUhhXMl7m3F+BTaLMjTyaITaSAWJf
 aS94BR/CkCXZKzF9dkxBYrzOnkbawrVL5FoM34S67aTa9wrAa2qVdnxAmP/R0MZKrg+VNmvr+Yj
 asDlZp9jXOUJEeC4iLQdnuMxzIzr2fGAlrD36rShLH6IeolXzz1CihG7QEj8Rj0ucT0n0rOE0Dy
 sECr+EtTwkCoC1A==
X-Developer-Key: i=Leo.Lin@amd.com; a=openpgp;
 fpr=33A95E245BECA0BAEA87AF0E5F17B1964A29EE86
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36F:EE_|BL3PR12MB6524:EE_
X-MS-Office365-Filtering-Correlation-Id: c02cda1c-2ffa-4848-3abd-08deb8dc545c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|5023799004|3023799007|11063799006|18002099003|56012099003|13003099007|6133799003;
X-Microsoft-Antispam-Message-Info:
	Nvd4UYVLPZuz5UMbmYPmn/76TgCWdQbF0U4QK+ojZaRS07m2FH1LFZcTcFNReRXrcQt6KZXXukg5d+H7r9Y3/WRM2u5BclDaTtWfF+YxLzOASNtlcx4LhHZiviPe5D+/YvSLn1I5RySR0571Wv2gOAd0+yFB0LkN1+tFKdmJ/vQFo3E0UZM5TUsQnzM/CslZDjMC2ndB/fAh79iLJPsDXnrmjsFXXCm3rlGmyJWELO3F+i3IvupOuO4YHs8ClxcChnK8s1AmT0UwnZolCRCsClyGAR1HhXgUb8l29Y2jgLd1DL77DI3nL8thnoyLm4wTFt25lqa7V8TDnbW/YYz8oAPSJcMaE47kkiMraDT9YjDxvcZEfd0eB+jDe7QOW6DL6GNfeVi1UV8curfeYLLwV+2KE28DHCqpuDva277/4nP2F9p2QOb3oK0nmOrl8y+Y8W/QGmBjqgqT2Re985acekvHKpcdb/IQbT6+Py6EkpbV5hja0vWWE2VEmaob9V2ZIt1Q0ijAgEhMI13kb4IYwpGasH4f7iVH9LldlB8bHli3S+Xto52xbXSNxksCnsIPA3uA+XIhbKWgv4JJDDZUO21C6mGyUtbJZf5tiX0LpIsluCR2LcjHiKVe2ACUkomkJYaEiv11LF+41j74030kmLlU9PgT7Vbn4i8UAzodQvt+Y4dcGwf+UwBvZOz02dz9jf0IAw9eYncj8M0y5yRMiEgf5lGazrqbhucwakLcsak=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(5023799004)(3023799007)(11063799006)(18002099003)(56012099003)(13003099007)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KmiA9AfZOWjan3IcaxWiA2zBPnIUfPI1G+YB9gE8vfVeksfZqyxTIwgadqIZHx6H2w0f8nZYV1+Fzau5IGOJf/CXnty3HO+tzz4ysu8BZAFqVORwk1/emxv+QuNZDP5mGSbj6COdFBMnz9KfUK7Yf5SJXXlEEKHE+qYLt14W4sbn1qif224r3iPOUxDAESmb6Kvhab4qsTFgpZMixR5PoUVteCFTJaSSUyeeKYfZX/OCMCugnPa0YTQRMJDu6F/OPO1xTwDIjLWE5ntGru9gbnSV8GDw9Eyp1G6B80LiODRxWNkhnOLjioUt96Epmu9u6Rwx3kfkALc8oO7xV/ss+grEMvJz5LCpqDV9YR+zBFa+OqJvgzljDXrqxA/QMZeEqsXbsj/YvtPMPUJPxeiRR8+HpQewkTwW9thaZ1LWQnqSsuOmRVUGY3IoqiiZmYho
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2026 15:02:38.0444
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c02cda1c-2ffa-4848-3abd-08deb8dc545c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6524

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
 drivers/platform/x86/amd/amd_halo_led.c | 267 ++++++++++++++++++++++++++++++++
 4 files changed, 286 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8063cb56feef..cde3865addb4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1138,6 +1138,13 @@ F:	drivers/char/hw_random/geode-rng.c
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
index 000000000000..f9ee6368f8ea
--- /dev/null
+++ b/drivers/platform/x86/amd/amd_halo_led.c
@@ -0,0 +1,267 @@
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
+#include <linux/led-class-multicolor.h>
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/wmi.h>
+#include <linux/byteorder/generic.h>
+#include <linux/slab.h>
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
+	__le16 *result_status __free(kfree) = NULL;
+	struct wmi_buffer output = {};
+	int ret;
+
+	ret = wmidev_invoke_method(wdev, 0, method_id,
+				   &input, &output, sizeof(*result_status));
+	if (ret)
+		return ret;
+
+	/* Return buffer per spec: Bytes[0:1] = Status (little-endian) */
+	result_status = output.data;
+	ret = wmi_status_to_err(le16_to_cpu(*result_status));
+
+	return ret;
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
+		.blue = cpu_to_le32(b)
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
base-commit: 687da68900cd1a46549f7d9430c7d40346cb86a0
change-id: 20260429-halo-leds-v2-plus-722c8083afe8

Best regards,
-- 
Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>

