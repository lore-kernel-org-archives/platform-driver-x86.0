Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013031.outbound.protection.outlook.com [40.93.201.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A122D27E1DC;
	Mon, 12 Oct 2026 08:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791795272; cv=fail; b=fX79yEas/Szp13+iqI3jCRVwr/Eu/EvSJjwGh3PX+CGKwIs6tDxmwHfHZHLw723y6tC4FoD8sm6fP/buOcD8eyMoJiQrX6mHdjScSlNI2FSk0SWdGoU8yWihd7zcIriKiaoPtIICatk1wQyJJ+v9CsVn1eshlG5YJ0loisPMLp4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791795272; c=relaxed/simple;
	bh=LxSvjREfYehifLSrdqSSznjygOTXn6Jmi9YiCVyhOnQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tt4K4nf9qliA3yi9BE2QWhypjxCkroq1My2tahletloBtwObPCHX0qFu5X1qq0uxsNTvLmexKYDuNgV2YMVWVD9xZAxYgiEt7w9Zmnl8nbMCzcRnnIPDvJvFovhLl06RU14bbjsYcl5R1vk8yg6sNfAT5bh7eB2Mj4DnCWCuf48=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=1+imz8b6; arc=fail smtp.client-ip=40.93.201.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="1+imz8b6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YMJc4PwCs5wH7pspqxlULuhO8FFSyxnyxibfiKjyJ32BIq6ZnYvgmRwOo0cx+muhKyYEx6P/heDO5nRd46p2mQLDBaMN4pVz79fi1NH0wH0al9AoNDQwNS+S0ZeqDGjBVmMQfYKWys80Tr5/vzjaQ6nCcovZwbijb1TwTYAJXi8aL9gUrTPTlkxNSoCtsvOAkKcbUr7h47A654/OkAQ2jKA5SOxR0Byl8bIW2XAU1lPcpFn5bYnQ1yDdwkSXtx15DRO98Ei4EVTjIDB2yx2udpzCkCRN6tguRgwmqLb+a/BAbM38gdkYyy8sGr//qDR6nbQ6Gki742iOnDji7aCr8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j9fS7Gu/CRn3oNACghhi+/7ayNS9UdCkrVQ4YEDjcYo=;
 b=U9YOvVeLzFkp2Z5SDNv5YH9z0z/Ap/skVNuYK9C9RtfpJchmlfAZLrWDzu9kZbUf51u/Rnuq6/bxx/Nzfr2HJYxffEDVcXk5vw+Qia6RznJEqyzjJIiWr4//qk0wyM4mDauWpmD6l1XM9fJ4TQCf24yH0m3+NT701BKyBs7rFwsGMVOh9FB4E74a6ajwBB8rqZn/t+W/+wNFMF1WyHvqwvLxs5EisBgOnfNLMdAS2JujR25oE+Zg/cdZeCDiuCMBX2ZG2+b15ExBJp8S5CgVkDajIKxawI6KUgN0xyxzGk88bWmGHIyBtJoHclDpXm58f4Qk2wHd7OaxY4hBXfyiug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9fS7Gu/CRn3oNACghhi+/7ayNS9UdCkrVQ4YEDjcYo=;
 b=1+imz8b6y+h7AN/MjpLS0MbKscWFw8cGljaRWR7/3Ztzz45wp2IRD377ANq0ExHW1lLnP/p++1GU22NqfOdsOn/83J0+yFB0Owud+A2ndAHfnj/jWVn0r631tMudHUYsQH/Mjufo9hFYaCNJTf6xgJO+LVs3+dGl6iGjx0Dl6hQ=
Received: from SJ0PR05CA0107.namprd05.prod.outlook.com (2603:10b6:a03:334::22)
 by DS0PR12MB9399.namprd12.prod.outlook.com (2603:10b6:8:1b8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 08:54:26 +0000
Received: from SJ5PEPF00000203.namprd05.prod.outlook.com
 (2603:10b6:a03:334:cafe::98) by SJ0PR05CA0107.outlook.office365.com
 (2603:10b6:a03:334::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Mon, 12
 Oct 2026 08:54:26 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF00000203.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 12 Oct 2026 08:54:26 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 12 Oct
 2026 03:54:17 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v9 1/4] platform/x86/amd/hsmp: Recognize Family 1Ah client platforms and hide server-only paths
Date: Mon, 12 Oct 2026 14:24:04 +0530
Message-ID: <20261012085407.1202295-2-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261012085407.1202295-1-muralidhara.mk@amd.com>
References: <20261012085407.1202295-1-muralidhara.mk@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000203:EE_|DS0PR12MB9399:EE_
X-MS-Office365-Filtering-Correlation-Id: a8cdd541-8108-4249-7508-08df283e6b5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|1800799024|376014|10067099003|22082099003|18002099003|3023799007|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	rp07fWrX+r1/STRjDB7vKl0Aag5oARorncydGzAbpeN3vBNnlHB/mV6Nb+Pd/kyGdjxVv9hibTEuIQY2uYl6X4wy3/+IDFPKF1+j9LGlaoxKbgjCuCBsO6J69J3MZ02R9x7jUWfhujrKQwYFYathKJHwXF6Wvh/y8h4px5A/90F94579UoYUPtfPZimwUR0jhfzEJCAdlVpY+VY+BfyAIrW7oAqh2nUYfThN2ozOT3EBhOm8SeV/SY/AleonTPLwhDIaDcXtemLvVaHRWEXO7ZRsCqDyk8QhCN+u0TmO+Nra0Dge98jrZu3EEEzkSY5M6i5TVr3180I+6SOwH/kO7W4yjxYm1NAmRqOiXXFDIhBHGkn4Y/Csf3RIoBcfkUdcJrWoGtuX3s5Vlj2Z1XHPfB3dfBfhdVyEI5mBRMlC3aQhINGExCmz3a9rJt1bEpbwwfxB5EleZj8bDXn3K2ADzaGO69OzpKF+TPbQmAQ+ZSD2ifBxtS0DxGOtg+pva+U+CtxS4qVqclA7wrZxpWVC9kWdhLmCKrO1sqHPI6aF4Sg5hPfa0STKFuaeiV0ubeLm4TsssLxWOD1twK9udSld5oY0rYjHRRzZQQ/GI5vbvLfbCRE40iueOaOatN3lO5Zpm257JndutYYg1+PfJ7Zxhgz0vofxYVM2l/NqiFI3fxJpvhyaO03Am10tkmLNsY2BWjZLJrbpkc9tL5dCefSWlw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(1800799024)(376014)(10067099003)(22082099003)(18002099003)(3023799007)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hrC4ZvivZ5ee3VE2lJyhMkxX0dAsUYSkY4hHagUu/Isci7a0IneqZu0lNcq/440EfcvoArw5a/7NDjfEkhqXmyZusOZo2fqp9hIxc7MSaakTKAIBQOT2HICT7e2uY8uyTEIVxb/nKpMPdj/JUP4WRJuz8oSo22UW+l+p6qJAHvEYeeveMHvVXn/Up8enPDw20BIUU1jqNEmbnEYZq8v1w9WFiOp8h0BY8Tu3bUh6ajkFvHll8pQoGgshjeVGM+Lx6PcTa3VvFMScQwOKDArcOUOCqw1VyDbSBR2gmc8EL7OZK8OEOSsyoH03TKRdWskT9PwknR6W5H3z+QVEDN2LpJeHWeSO2zjFW9+g2qg/eRbvba1UEQevYdSFfUYWX6RPFiPw8o3wSelNSl+MgnBaPNGIrQbHebEzj/sNxSBcemB9KgOU3M5o544rj8PCIBZu
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 08:54:26.2919
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8cdd541-8108-4249-7508-08df283e6b5c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000203.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9399

Add is_client_platform(), based on the ACPI-reported PM profile and
an AMD vendor check, to detect Family 1Ah client platforms, Models
80h-8Fh and E0h-E3h.

Use is_client_platform() to:

- Hide every ACPI sysfs device attribute except smu_fw_version and
  protocol_version on client platforms.
- Hide the metrics_bin sysfs binary attribute on client platforms.
- Skip hsmp_create_sensor() in init_acpi() on client platforms.
- Exclude client platforms from the HSMP_GET_METRIC_TABLE_DRAM_ADDR
  lookup in init_acpi().
- Register /dev/hsmp at 0600 on client platforms, 0644 on server.

Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
 drivers/platform/x86/amd/hsmp/acpi.c | 24 +++++++++++++++++++-----
 drivers/platform/x86/amd/hsmp/hsmp.c |  8 +++++++-
 drivers/platform/x86/amd/hsmp/hsmp.h | 24 ++++++++++++++++++++++++
 3 files changed, 50 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index ddd7a04ee753..1e5028aea54b 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -300,16 +300,26 @@ static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
 	 * so that userspace which expects the file to exist gets a clear
 	 * -EOPNOTSUPP from the read handler instead of -ENOENT, and is
 	 * pointed at HSMP_IOCTL_GET_TELEMETRY_DATA as the supported path.
+	 * Hide metrics_bin on client platforms.
 	 */
-	if (hsmp_pdev->proto_ver >= HSMP_PROTO_VER6)
+	if (!is_client_platform() && hsmp_pdev->proto_ver >= HSMP_PROTO_VER6)
 		return battr->attr.mode;
 
 	return 0;
 }
 
+/* Defined below by HSMP_DEV_ATTR() */
+static struct hsmp_sys_attr hattr_smu_fw_version;
+static struct hsmp_sys_attr hattr_protocol_version;
+
 static umode_t hsmp_is_sock_dev_attr_visible(struct kobject *kobj,
 					     struct attribute *attr, int id)
 {
+	/* Hide every attribute except smu_fw_version and protocol_version on client platforms */
+	if (is_client_platform() && attr != &hattr_smu_fw_version.dattr.attr &&
+	    attr != &hattr_protocol_version.dattr.attr)
+		return 0;
+
 	return attr->mode;
 }
 
@@ -557,15 +567,19 @@ static int init_acpi(struct device *dev)
 		return ret;
 	}
 
-	if (hsmp_pdev->proto_ver >= HSMP_PROTO_VER6) {
+	/* Exclude client platforms from the metric table DRAM base lookup */
+	if (!is_client_platform() && hsmp_pdev->proto_ver >= HSMP_PROTO_VER6) {
 		ret = hsmp_get_tbl_dram_base(sock_ind);
 		if (ret)
 			dev_info(dev, "Failed to init metric table\n");
 	}
 
-	ret = hsmp_create_sensor(dev, sock_ind);
-	if (ret)
-		dev_info(dev, "Failed to register HSMP sensors with hwmon\n");
+	/* Skip hwmon registration on client platforms */
+	if (!is_client_platform()) {
+		ret = hsmp_create_sensor(dev, sock_ind);
+		if (ret)
+			dev_info(dev, "Failed to register HSMP sensors with hwmon\n");
+	}
 
 	dev_set_drvdata(dev, &hsmp_pdev->sock[sock_ind]);
 
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 5e123a4ecea9..d32d5a907aae 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -720,7 +720,13 @@ int hsmp_misc_register(struct device *dev)
 	 */
 	hsmp_pdev.mdev.parent	= dev;
 	hsmp_pdev.mdev.nodename	= HSMP_DEVNODE_NAME;
-	hsmp_pdev.mdev.mode	= 0644;
+	/*
+	 * hsmp_msg_desc_table[] only describes server messages. On client
+	 * platforms, msg_id mappings differ, making access checks unreliable.
+	 * Restrict /dev/hsmp to root until client-specific validation is
+	 * added.
+	 */
+	hsmp_pdev.mdev.mode	= is_client_platform() ? 0600 : 0644;
 
 	return misc_register(&hsmp_pdev.mdev);
 }
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
index 8dbff16a87b1..3302c1517369 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.h
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -10,6 +10,9 @@
 #ifndef HSMP_H
 #define HSMP_H
 
+#include <asm/amd/hsmp.h>
+
+#include <linux/acpi.h>
 #include <linux/compiler_types.h>
 #include <linux/device.h>
 #include <linux/hwmon.h>
@@ -17,6 +20,7 @@
 #include <linux/miscdevice.h>
 #include <linux/mutex.h>
 #include <linux/pci.h>
+#include <linux/processor.h>
 #include <linux/rwsem.h>
 #include <linux/semaphore.h>
 #include <linux/sysfs.h>
@@ -32,6 +36,26 @@
 
 #define DRIVER_VERSION		"2.6"
 
+/* True when the ACPI-reported PM profile indicates a client platform */
+static inline bool is_client_platform(void)
+{
+	if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD)
+		return false;
+
+#if IS_ENABLED(CONFIG_ACPI)
+	switch (acpi_gbl_FADT.preferred_profile) {
+	case PM_DESKTOP:
+	case PM_MOBILE:
+	case PM_TABLET:
+		return true;
+	default:
+		return false;
+	}
+#else
+	return false;
+#endif
+}
+
 struct hsmp_mbaddr_info {
 	u32 base_addr;
 	u32 msg_id_off;
-- 
2.34.1

