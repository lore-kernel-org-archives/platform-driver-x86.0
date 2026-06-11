Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010007.outbound.protection.outlook.com [52.101.56.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4CF2E7631;
	Thu, 11 Jun 2026 08:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781166656; cv=fail; b=ldW6CZj/c47rJsP5xWAUAbP2O9+y6U2/YbqLT6uDoYkBYg0PJ7NwzATFjrXbQJfvxrcmPY1ypLOQ+jsreOQ46K4yLZqKELp8RIHFP4M7ARhPsXfh+dPqkCBODVVE/kElKASnpQf18lFMEcjVFTp7v0pNdM/Rfanh2Ojsj7VulPo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781166656; c=relaxed/simple;
	bh=S6Og6O/FD9b7vEKweehJ27Gi4oeG+IbSvoXmXBThVvg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=kAyPzId9rdPm6wMDsGT6M2Wq5IRP9h9gEHJ7vExlu/zCtzz5u+CIyb4aq5NIBBQhK3IrXAgos5b6yKmPlQyDg4UFr1Ho7gJDE1hvqgam6EYyBKRrhU8GLUFGrGdxVLdiB5xHohfcFNmsR/bLPpU9Tv3F1eJnpLbbJ93HzHwItOk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=zB9rID0V; arc=fail smtp.client-ip=52.101.56.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="zB9rID0V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H+5EKTpexqjsFLo9ylyUDqdPCCIj/fikAY4QILZ5Efwaxd1Oc8hzJkHhQ8SfOs8a+0oHdaSBfsgWc3ipq1gVElo4411ytadwUHtW6gszTtYeAxUlhzil1MdY7mmKdJ88nRsirYlPvMnpya2kgpAfNOK8M/UrS5q/UYPcEytO3GVVFh3h6YTo/pNsKyXQYTZKtH28HpYFHZxw6dP89+ZmdAiBlahMryH1SsbgS5z8NGJ35cU3yU0CaGLrIkfOMFyHjJQkgpetm55NR4zAAVfb+rk5CrP6/YiX9iHzt98BDeGryJg3Sph1IxluO17PDB/fO0lMHmR8Ep5rXPjSQlruyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gbywjp7L8sZa2rEhuHqmfiH6XT1iHgVG0+M+ePoTcqI=;
 b=Xi68MuuXOWyS1ETobdHmwxEj1/pVdb+o3Ey2JUfhlRD8t+pSyyty0cYleYBc5OX9C98Scsi+/OrbMnICwyFuo6+oL/1wYdmaCayNkwckQ6U5MJFJBaH9exzrW8ZwZlA/Kl7AKUhti/a8G2CacRe6kU+ImYpXy8VSX/s9vYsO0gawBO8edvxThqKWdDdVml+zLG/mHmi80Ghk1FkZlFlPovgYqFwEcSUk/s59IW49lHnOoCZKHYpCPzeJ8zmQHolzwql3AKjkFerMhI/MZprN2p7So8NSJyenbN17JLfPuHZKFQgFFOmBDwj+uhio56ukp2Vtf6m4av2eEM+md3WLAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gbywjp7L8sZa2rEhuHqmfiH6XT1iHgVG0+M+ePoTcqI=;
 b=zB9rID0V6UUDLWBu0BcwXk4gpd9Pdk2ufPg9vFAJ2bA6crjfe9kwA4vWywScOFmNVU3IKVs2sBmUT4ckgQxBgGhZ2zSUdAttHjf07RPZz10BVYIOtRWAFFOVaub4nucpfCe7QiNQmVPvRaClLwzQ1m6pffwDEC7jj7JmPEtllfc=
Received: from MN2PR20CA0061.namprd20.prod.outlook.com (2603:10b6:208:235::30)
 by DM4PR12MB7503.namprd12.prod.outlook.com (2603:10b6:8:111::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 08:30:48 +0000
Received: from BL02EPF0001A0FB.namprd03.prod.outlook.com
 (2603:10b6:208:235:cafe::84) by MN2PR20CA0061.outlook.office365.com
 (2603:10b6:208:235::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.11 via Frontend Transport; Thu,
 11 Jun 2026 08:30:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0001A0FB.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Thu, 11 Jun 2026 08:30:47 +0000
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 11 Jun
 2026 03:30:44 -0500
From: "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>
Date: Thu, 11 Jun 2026 16:30:25 +0800
Subject: [PATCH v7] platform/x86/amd: Introduce Halo Box RGB LED driver
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260611-halo-leds-v2-plus-v7-1-8aad73fccb6b@amd.com>
X-B4-Tracking: v=1; b=H4sIACFyKmoC/23RzW6EIBQF4FeZsC4GrshPV/MeTRegl5FUxcCMa
 TPx3YvTRTVxRU7CdzgJT5IxBczk/fIkCZeQQ5xKUG8X0vZ2uiENXckEGEgmwNDeDpEO2GW6AJ2
 HR6YKoNVM19ajJsXNCX34fnV+fJbsUxzpvU9o902KATRCVlwwZaCmnObHjGnk1y9MEw5VTLetr
 Q/5HtPPa+ACW+dfQ8PEyZZycmo9A6VAlUvuaseuauNItiVLvff6zG9DDO+8aLSREu3Ri50HfuZ
 F8U4Y7Zx1tbRw9M3e12e+KV4Y1bVGcWO5Pnq592d/scjtfeW8coYJy+W/X9f1F41JlZXuAQAA
To: Hans de Goede <hansg@kernel.org>, =?utf-8?q?Ilpo_J=C3=A4rvinen?=
	<ilpo.jarvinen@linux.intel.com>, "Mario Limonciello (AMD)"
	<superm1@kernel.org>, "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>
CC: <linux-kernel@vger.kernel.org>, <platform-driver-x86@vger.kernel.org>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Armin Wolf <W_Armin@gmx.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=16029; i=Leo.Lin@amd.com;
 h=from:subject:message-id; bh=S6Og6O/FD9b7vEKweehJ27Gi4oeG+IbSvoXmXBThVvg=;
 b=owEBbQKS/ZANAwAKAV8XsZZKKe6GAcsmYgBqKnIzl++cKA4XFB/1lxL9nCdcex88c613oDqM9
 oTAlx5QzmaJAjMEAAEKAB0WIQQzqV4kW+yguuqHrw5fF7GWSinuhgUCaipyMwAKCRBfF7GWSinu
 hoMoD/94UZ8VVOAsfE52v6GPXOxlIpCSOEYXNdRrKp7AK5L8AHqPq2Tu6fnm1LREcv8XHuYNKRJ
 MZ+unmGAGICTj7sXK3djsQgUfAM55fTUl7ZLSLK+ocHPCUyfUT5PdpsBwL4fh4/MQr103TvJo+b
 cbsqWg0pMjqwZIXOjLqUZnbWgrnEUbjM0QWQ72HYTziIEZ18Gdir2mfU70+6UoXro3/H5rXdaP8
 HrXB6EJD0v7/fnaeZgtIyG/Dy/M0Zz0gyf3SDBRuQ7u7PhET6mQ4e2PsPOcp4xxHbSZSH08LGnn
 5dLOt7WeyO1McXmDeHf41EMPUk1JZ5sU4CFXkkBqH5HeaJE5lWHr87L1TztgOuqHxAa9ET29bRO
 yS517WGvymi6sHPBXVFh2+3dyPEUZNdIslanJe9qte4T2J6vnRrLSAVQQAZmvyZikh1pLqT5/zi
 bhaZmgLZo3QG7ArT+60tSSCgNvgShZJYXU1XqYZcMhJeex0W2d88rfdVGGormBsOTw/Ui/uYngY
 m7CV97094yPlzRq9MQBNsV8isPDjQXK5QiwegoXRgi1a8IwNpTxGORX6lRMErkXTcWpNXH20tbM
 lY3sFfteOb8EuJgcvNlnVEyZx5fosiCV6djJd3BX71eZFRISYdCHBN2rsNdCNpt/Y/kbre48JRd
 IKyuwl+kCdzycWg==
X-Developer-Key: i=Leo.Lin@amd.com; a=openpgp;
 fpr=33A95E245BECA0BAEA87AF0E5F17B1964A29EE86
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FB:EE_|DM4PR12MB7503:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e0da04a-e75d-43ed-e16f-08dec793bca4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|23010399003|13003099007|18002099003|56012099006|5023799004|11063799006|3023799007|6133799003;
X-Microsoft-Antispam-Message-Info:
	szhtXfFKDuCekuz1yClljBjgfArkSFzBYZyg4gtpmnJDnj12AnspApHm8vUsMQkJ53x0ae+SF2hoFfbsbYTu0Xw9mU5qve9A2LNsFI76mSdfiychq2eSZ1xQjnCjT9tvksF2J0PrR4lfEYDeJAAWCcL+z7pqXm9Xtked31HDgIqX0nRwsqvawK94Pgjx5uMnTA9bjjMsivE09B9fJTLKjVVK2/H+qeKSoiY39EEaaATrrXHRRN1DD6r45w+B7vfUHqB+yj5Xuc/epCCztPzpftm6VTPqMR2/ZQPGc/YuY4pg2mIqCXYVcq2k09f5XTdo/kT7dMUetlnW5MIT7fgRrdu6rD4ONssYkTenLvMzwRD2S3T+ozJfe/pZMGDSpt4SiFkDITszJ2jB8t5s4cLOHcSzUD09pvkL+1+jzRZKnPWRqBGPXt/ZBZFbrKfVgSV/d9piUa7rZWJnas+mzs6cbVoWBZr8rUfVH5Fdw7wT2l/pyOyx6lesmjdmTu7LNlF4ZybP/ze0dgw1UQaoQdz83OBofharCQ2YXnOX5P/1cpgwCFzRUSS9CRj2/0ND2Alca3K0R7RoU+1h1Ig8IAyjAH7hR8e5NOMdWoFGiz7Z/xVt09oeu3GFX9KIv9EL8dAdTfEK0XqenQBqpMHzRISOITyeE3puh26P/g6r2CdzrsJ+lEqcL5CYBKIFzrnEMMwkXRQTrrOxm2Ksqxjl1Ks66uL4PDFCpEGRadkTMnkdbqw=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(23010399003)(13003099007)(18002099003)(56012099006)(5023799004)(11063799006)(3023799007)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	h5W1yN5+X/O6+T8P4lWak/VmBgHQnp+ACPIt35umrygtHix7KU7vNGgn98H1dSgwIU2S+4iiWLf10hUYyo5P4kqbUdKEK1Wl9ZZ6uBMGjVWr1R8kVg3/URggY14d0DRomfoCot2OEy6FaONpAr8K1B87In+oKcQA9OK7NO9+VcEx2ljaOuDfC2EJQR2f/K6RX0SXMgIqiu9sKGSzUnIxbHHgS5KVaeNAvQhvkzf/p+BbI+JkPGO3clO1EZVmEncBAQbW4tyYs1w1rbu56uFKxxPvj8T76b16g4xpBDV8+2V/+GXX/x8rTLaJCSxnZE9xaFZZ5gGojlU7xoODtl+j03it7PU1ONiJ1m2yUS/KM43FQUHctREJzPeh/XgRt30tSSrA4j9vzmITSv8EEQxwPe4JhAYvmUkjbiLM6i7413opYcYYRsAQwU9iBo0UkdI6
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 08:30:47.1871
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e0da04a-e75d-43ed-e16f-08dec793bca4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7503

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
Send this patch revision because we now have better BIOS behavior which
allows us to remove of some hard-coded logic in the driver.

There used be a BIOS behavior where WMI values don't correctly reflect
LED colors after S5. Setting known default values to LEDs on probe is
a compromise for that.

That has been fixed in our new BIOS, so we no longer need to hard-code
the default colors in the driver.

v6 -> v7
- Introduce a amd_halo_wmi_get_rgb() to get WMI values of colors, and
  read them on probe.
- Remove hard-coded RGB values.
- Link to v6: https://lore.kernel.org/r/20260529-halo-leds-v2-plus-v6-1-b7bf7b904a16@amd.com

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
 drivers/platform/x86/amd/amd_halo_led.c | 322 ++++++++++++++++++++++++++++++++
 4 files changed, 341 insertions(+)

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
index 000000000000..824d3f7d680b
--- /dev/null
+++ b/drivers/platform/x86/amd/amd_halo_led.c
@@ -0,0 +1,322 @@
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
+#include <linux/compiler_attributes.h>
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
+struct amd_halo_wmi_output_rgb {
+	__le16 status;
+	u8 red;
+	u8 green;
+	u8 blue;
+} __packed;
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
+ * amd_halo_wmi_get_rgb - Get RGB values
+ * @wdev: WMI device pointer
+ * @r: output buffer for red value
+ * @g: output buffer for green value
+ * @b: output buffer for blue value
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+static int amd_halo_wmi_get_rgb(struct wmi_device *wdev, u8 *r, u8 *g, u8 *b)
+{
+	struct amd_halo_wmi_args_rgb args = {
+		.cmd = cpu_to_le32(AMD_HALO_RGB_CMD_GET),
+	};
+	struct wmi_buffer input = {
+		.length = sizeof(args),
+		.data = &args,
+	};
+	struct wmi_buffer output = {};
+	int ret;
+
+	ret = wmidev_invoke_method(wdev, 0, AMD_HALO_WMI_RGB,
+				   &input, &output, sizeof(struct amd_halo_wmi_output_rgb));
+	if (ret)
+		return ret;
+
+	struct amd_halo_wmi_output_rgb *data __free(kfree) = output.data;
+
+	ret = wmi_status_to_err(le16_to_cpu(data->status));
+	if (ret)
+		return ret;
+
+	if (data->red > AMD_HALO_MAX_HW_BRIGHTNESS ||
+	    data->green > AMD_HALO_MAX_HW_BRIGHTNESS ||
+	    data->blue > AMD_HALO_MAX_HW_BRIGHTNESS) {
+		return -EPROTO;
+	}
+
+	*r = data->red;
+	*g = data->green;
+	*b = data->blue;
+
+	return 0;
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
+	u8 r, g, b;
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
+
+	data->led_mc.led_cdev.brightness = AMD_HALO_MAX_HW_BRIGHTNESS;
+	data->led_mc.led_cdev.max_brightness = AMD_HALO_MAX_HW_BRIGHTNESS;
+	data->led_mc.led_cdev.brightness_set_blocking = amd_halo_brightness_set;
+	data->led_mc.led_cdev.flags = LED_CORE_SUSPENDRESUME | LED_RETAIN_AT_SHUTDOWN;
+	data->led_mc.num_colors = ARRAY_SIZE(data->subled_info);
+	data->led_mc.subled_info = data->subled_info;
+
+	ret = amd_halo_wmi_get_rgb(wdev, &r, &g, &b);
+	if (ret)
+		return ret;
+
+	data->subled_info[0].intensity = r;
+	data->subled_info[1].intensity = g;
+	data->subled_info[2].intensity = b;
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

