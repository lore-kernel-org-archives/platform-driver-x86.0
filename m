Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC9C9C19F29
	for <platform-driver-x86@archiver.kernel.org>; Thu, 28 Jul 2022 18:21:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231194AbiG1SVF (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 28 Jul 2022 14:21:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230171AbiG1SVE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 28 Jul 2022 14:21:04 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2043.outbound.protection.outlook.com [40.107.220.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2EC11C10C
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Jul 2022 11:21:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UppMEyfDAz0FpSq0Yndu/TJAR9V/N7vmUVYHJfSw34McjCoRsxRvp6kLNdlvUOga/nNrxghtqhX7WAqXcFJUEyd4W3TUKbEONkzFOx843iJxuHqtO/c2f1ANZwO6JEGB8yuG5bCeJwrRYkW+v6cmdYBMi7ADzGLu9EJbJ5JSsbgByvnayaA61AekOE9kFlcnFwso5xwIa7dnvg7T+xD3Q2hd2ALMhf30ps/rQiXZW2LKaOSVgb1/jdd4o4goh1329KG+azEGid8bo3gw+5AxmGkpTuUKPr72xWapKDHQID7r6/TWYXXpLFdvBtCS3LcUIqOb10RRqolymJvl+ydsdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4dmEODbXJZ7g8nKhqhv1aOplbb39t3KgL8xWdsA2ZUM=;
 b=kpsSfoliKqhl94+8SYpwHYbD5odhzQTqjL5HSN25ULxysWo/9BZO+tY9Q0mSFFFg2lLJTshu8uF1s2GzIlsDY+IZDPaoBW1WRp1jWUEvy4I9lC/1XciMK+qhNVP8mAYZesmcbaAy6HEc8uOjAZPbSkv5hPYlSz6F1WKWeaIBNCRbF+ccHkr5j28tHXSEiPvp1jRRj9gV/TjNQW94+N+eJ38p4G+Kmf7+bijNZA7ObTQIGtH1fLE16sJjzyF0DAC99jffogmsa76GSVSticMKE1RY8oDpRt/XOe77Pw5S2hF5wd6rP8KCob4cJXon90vihbb1v5HmEcX+CTM/iUr7ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4dmEODbXJZ7g8nKhqhv1aOplbb39t3KgL8xWdsA2ZUM=;
 b=ejFo2NGffG+bFAXbHLp+a/hW25DxszAN1avpvakvvFasgv0ZP2MGW71GbmCR8khvK/Tu1u7TczFnxnX5JzFcYL+ydV+mK8er/bDeJEF4JVjLozUnQnOVNpRKbFoWLzVKJf6asEkEVnuwjrmWJNhbBcFv2nXhvsyXNoC8Hi2kXD4=
Received: from BN9PR03CA0565.namprd03.prod.outlook.com (2603:10b6:408:138::30)
 by DM6PR12MB4124.namprd12.prod.outlook.com (2603:10b6:5:221::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Thu, 28 Jul
 2022 18:21:00 +0000
Received: from BN8NAM11FT019.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:138:cafe::13) by BN9PR03CA0565.outlook.office365.com
 (2603:10b6:408:138::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.21 via Frontend
 Transport; Thu, 28 Jul 2022 18:21:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT019.mail.protection.outlook.com (10.13.176.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5482.10 via Frontend Transport; Thu, 28 Jul 2022 18:21:00 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 28 Jul
 2022 13:20:57 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 RESEND 03/11] platform/x86/amd/pmf: Add support SPS PMF feature
Date:   Thu, 28 Jul 2022 23:50:20 +0530
Message-ID: <20220728182028.2082096-4-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220728182028.2082096-1-Shyam-sundar.S-k@amd.com>
References: <20220728182028.2082096-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ea4c064-36cb-406d-39e5-08da70c5ec6c
X-MS-TrafficTypeDiagnostic: DM6PR12MB4124:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IrQRT6q66zVratVyVrcq3RAOsfDboYf4+o+mHCvaTcnM+qB8Da3RYqme/dZnzyRIrQntHv+FFKdFvk2ZnExXo/kxvIUv0E/topT0a+YX3/i8DtlAexQiRNr7y9dHkUNwODKzPKDpbAVNzVlPsQ5ikJDjnelgM8lCOhmg12w3hGOyuGsEO/IE2Pr2dSRN0Rj3axuxNiwcMRdty0IN417ujnpkMPSIaHsRuE/nyRlQWvuM4ACpJF3J5cAp10QjQ0gu956AxzCzH0mG/g+8MIK8YkfCT193Ex116zwW/hQ6Pf62BGRK8OAPpmoXpUoIrRH0IJy6HhwhR0KvHA/IEo+SGqjG9n1Z/oKg57kwfDh5R2nma1UcKcSo4mYf9Yb+IIvGHGvqOR3xbiD1NSLTzN3sI4gUA+wyUrVPiYp7BT51KNSsrb9BKTf1mSimL7/v8zwVwZYmv8R5GMh7X4PHHKAf0jBTCuKtiZG5uTfpWMjVE6w3kQ7/eMloFkKLAqDClKMyNzcEqqWFO9VMW7NTXWKfX0oFb9Q342OZdAsSZM86mL+5LwWLVg/36MYgU+GG6PSP0wVgg3BfK4QX/stkGW+idc8tXfz9wGAjc8FTHlu10R/wxHyhXVBYKJaETxY+PnSvLRUfAX3H5DPVziwxD4E3dn4DycmwFT/jKQ4dx8jgIWgrF9959kZrhNOIgepltYIaxqY71XhQj3R2DuQoSnmclFMJKyR3GI8jtiu8O02pcOS1kWL2VoH957vXRsC0n6Fpgp3MFIApkZEHnfG7I+ZbFL45s2XcHeJUs96hnxHyaOWN903PdeRvXj3d086LGtBc/cPyVCiaS3nrp3VVVKGafQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(376002)(39860400002)(136003)(36840700001)(40470700004)(46966006)(6666004)(7696005)(70206006)(47076005)(70586007)(8676002)(336012)(5660300002)(426003)(26005)(40460700003)(82740400003)(40480700001)(83380400001)(4326008)(8936002)(478600001)(16526019)(82310400005)(356005)(186003)(41300700001)(81166007)(2906002)(110136005)(2616005)(54906003)(36860700001)(1076003)(30864003)(36756003)(316002)(86362001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 18:21:00.2792
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ea4c064-36cb-406d-39e5-08da70c5ec6c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT019.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4124
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

SPS (a.k.a. Static Power Slider) gives a feel of Windows performance
power slider for the Linux users, where the user selects a certain
mode (like "balanced", "low-power" or "performance") and the thermals
associated with each selected mode gets applied from the silicon
side via the mailboxes defined through PMFW.

PMF driver hooks to platform_profile by reading the PMF ACPI fn9 to
see if the support is being advertised by ACPI interface.

If supported, the PMF driver reacts to platform_profile selection choices
made by the user and adjust the system thermal behavior.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/Makefile |   2 +-
 drivers/platform/x86/amd/pmf/acpi.c   |   8 ++
 drivers/platform/x86/amd/pmf/core.c   |  26 +++++
 drivers/platform/x86/amd/pmf/pmf.h    |  64 +++++++++++
 drivers/platform/x86/amd/pmf/sps.c    | 152 ++++++++++++++++++++++++++
 5 files changed, 251 insertions(+), 1 deletion(-)
 create mode 100644 drivers/platform/x86/amd/pmf/sps.c

diff --git a/drivers/platform/x86/amd/pmf/Makefile b/drivers/platform/x86/amd/pmf/Makefile
index 2617eba773ce..557521a80427 100644
--- a/drivers/platform/x86/amd/pmf/Makefile
+++ b/drivers/platform/x86/amd/pmf/Makefile
@@ -5,4 +5,4 @@
 #
 
 obj-$(CONFIG_AMD_PMF) += amd-pmf.o
-amd-pmf-objs := core.o acpi.o
+amd-pmf-objs := core.o acpi.o sps.o
diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
index bd796d7e1d96..41abd8680d8d 100644
--- a/drivers/platform/x86/amd/pmf/acpi.c
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -98,6 +98,7 @@ static int apmf_if_call_store_buffer(struct apmf_if *apmf_if, int func, void *de
 static void apmf_if_parse_functions(struct apmf_if_functions *func, u32 mask)
 {
 	func->system_params = mask & APMF_FUNC_GET_SYS_PARAMS;
+	func->static_slider_granular = mask & APMF_FUNC_STATIC_SLIDER_GRANULAR;
 }
 
 int is_apmf_func_supported(unsigned long index)
@@ -106,6 +107,13 @@ int is_apmf_func_supported(unsigned long index)
 	return ((supported_func & (1 << (index - 1))) != 0);
 }
 
+int apmf_get_static_slider_granular(struct apmf_if *apmf_if,
+				    struct apmf_static_slider_granular_output *data)
+{
+	return apmf_if_call_store_buffer(apmf_if, APMF_FUNC_STATIC_SLIDER_GRANULAR,
+									data, sizeof(*data));
+}
+
 static int apmf_if_verify_interface(struct amd_pmf_dev *pdev, struct apmf_if *apmf_if)
 {
 	struct apmf_verify_interface output;
diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index c5002b7bb904..b6006e8ee1a1 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -12,6 +12,7 @@
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/platform_device.h>
+#include <linux/power_supply.h>
 #include "pmf.h"
 
 /* PMF-SMU communication registers */
@@ -45,6 +46,14 @@
 #define DELAY_MIN_US	2000
 #define DELAY_MAX_US	3000
 
+int amd_pmf_get_power_source(void)
+{
+	if (power_supply_is_system_supplied() > 0)
+		return POWER_SOURCE_AC;
+	else
+		return POWER_SOURCE_DC;
+}
+
 static inline u32 amd_pmf_reg_read(struct amd_pmf_dev *dev, int reg_offset)
 {
 	return ioread32(dev->regbase + reg_offset);
@@ -138,6 +147,21 @@ static const struct pci_device_id pmf_pci_ids[] = {
 	{ }
 };
 
+static void amd_pmf_init_features(struct amd_pmf_dev *dev)
+{
+	/* Enable Static Slider */
+	if (is_apmf_func_supported(APMF_FUNC_STATIC_SLIDER_GRANULAR)) {
+		amd_pmf_init_sps(dev);
+		dev_dbg(dev->dev, "SPS enabled and Platform Profiles registered\n");
+	}
+}
+
+static void amd_pmf_deinit_features(struct amd_pmf_dev *dev)
+{
+	if (is_apmf_func_supported(APMF_FUNC_STATIC_SLIDER_GRANULAR))
+		amd_pmf_deinit_sps(dev);
+}
+
 static const struct acpi_device_id amd_pmf_acpi_ids[] = {
 	{"AMDI0102", 0},
 	{ }
@@ -206,6 +230,7 @@ static int amd_pmf_probe(struct platform_device *pdev)
 
 	apmf_acpi_init(dev);
 	platform_set_drvdata(pdev, dev);
+	amd_pmf_init_features(dev);
 
 	mutex_init(&dev->lock);
 	dev_info(dev->dev, "registered PMF device successfully\n");
@@ -218,6 +243,7 @@ static int amd_pmf_remove(struct platform_device *pdev)
 	struct amd_pmf_dev *dev = platform_get_drvdata(pdev);
 
 	mutex_destroy(&dev->lock);
+	amd_pmf_deinit_features(dev);
 	kfree(dev->buf);
 	return 0;
 }
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 08c6bc0e2b42..30740a5cd30d 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -12,10 +12,12 @@
 #define PMF_H
 
 #include <linux/acpi.h>
+#include <linux/platform_profile.h>
 
 /* APMF Functions */
 #define APMF_FUNC_VERIFY_INTERFACE			0
 #define APMF_FUNC_GET_SYS_PARAMS			1
+#define APMF_FUNC_STATIC_SLIDER_GRANULAR       9
 
 /* Message Definitions */
 #define SET_SPL				0x03 /* SPL: Sustained Power Limit */
@@ -36,9 +38,12 @@
 #define GET_STT_LIMIT_APU	0x20
 #define GET_STT_LIMIT_HS2	0x21
 
+#define ARG_NONE 0
+
 /* AMD PMF BIOS interfaces */
 struct apmf_if_functions {
 	bool system_params;
+	bool static_slider_granular;
 };
 
 struct apmf_if {
@@ -60,6 +65,30 @@ struct apmf_system_params {
 	u8 command_code;
 } __packed;
 
+enum amd_stt_skin_temp {
+	STT_TEMP_APU,
+	STT_TEMP_HS2,
+	STT_TEMP_COUNT,
+};
+
+enum amd_slider_op {
+	SLIDER_OP_GET,
+	SLIDER_OP_SET,
+};
+
+enum power_source {
+	POWER_SOURCE_AC,
+	POWER_SOURCE_DC,
+	POWER_SOURCE_MAX,
+};
+
+enum power_modes {
+	POWER_MODE_PERFORMANCE,
+	POWER_MODE_BALANCED_POWER,
+	POWER_MODE_POWER_SAVER,
+	POWER_MODE_MAX,
+};
+
 struct amd_pmf_dev {
 	void __iomem *regbase;
 	void __iomem *smu_virt_addr;
@@ -68,11 +97,46 @@ struct amd_pmf_dev {
 	u32 cpu_id;
 	struct device *dev;
 	struct apmf_if *apmf_if;
+	enum platform_profile_option current_profile;
+	struct platform_profile_handler pprof;
 	struct mutex lock; /* protects the PMF interface */
 };
 
+struct apmf_sps_prop_granular {
+	u32 fppt;
+	u32 sppt;
+	u32 sppt_apu_only;
+	u32 spl;
+	u32 stt_min;
+	u8 stt_skin_temp[STT_TEMP_COUNT];
+	u32 fan_id;
+} __packed;
+
+/* Static Slider */
+struct apmf_static_slider_granular_output {
+	u16 size;
+	struct apmf_sps_prop_granular prop[POWER_SOURCE_MAX * POWER_MODE_MAX];
+} __packed;
+
+struct amd_pmf_static_slider_granular {
+	u16 size;
+	struct apmf_sps_prop_granular prop[POWER_SOURCE_MAX][POWER_MODE_MAX];
+};
+
 /* Core Layer */
 int apmf_acpi_init(struct amd_pmf_dev *pmf_dev);
+int is_apmf_func_supported(unsigned long index);
 int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32 *data);
+int amd_pmf_get_power_source(void);
+
+/* SPS Layer */
+u8 amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf);
+void amd_pmf_update_slider(struct amd_pmf_dev *dev, bool op, int idx,
+			   struct amd_pmf_static_slider_granular *table);
+int amd_pmf_init_sps(struct amd_pmf_dev *dev);
+void amd_pmf_deinit_sps(struct amd_pmf_dev *dev);
+int apmf_get_static_slider_granular(struct apmf_if *ampf_if,
+				    struct apmf_static_slider_granular_output *output);
+void amd_pmf_load_defaults_sps(struct amd_pmf_dev *dev);
 
 #endif /* PMF_H */
diff --git a/drivers/platform/x86/amd/pmf/sps.c b/drivers/platform/x86/amd/pmf/sps.c
new file mode 100644
index 000000000000..2601adbfe14a
--- /dev/null
+++ b/drivers/platform/x86/amd/pmf/sps.c
@@ -0,0 +1,152 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * AMD Platform Management Framework (PMF) Driver
+ *
+ * Copyright (c) 2022, Advanced Micro Devices, Inc.
+ * All Rights Reserved.
+ *
+ * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+ */
+
+#include "pmf.h"
+
+static int amd_pmf_profile_get(struct platform_profile_handler *pprof,
+			       enum platform_profile_option *profile);
+static int amd_pmf_profile_set(struct platform_profile_handler *pprof,
+			       enum platform_profile_option profile);
+static struct amd_pmf_static_slider_granular config_store;
+
+void amd_pmf_load_defaults_sps(struct amd_pmf_dev *dev)
+{
+	struct apmf_static_slider_granular_output output;
+	int i, j, idx = 0;
+
+	memset(&config_store, 0, sizeof(config_store));
+
+	if (dev->apmf_if->func.static_slider_granular) {
+		apmf_get_static_slider_granular(dev->apmf_if, &output);
+
+		for (i = 0; i < POWER_SOURCE_MAX; i++) {
+			for (j = 0; j < POWER_MODE_MAX; j++) {
+				config_store.prop[i][j].spl = output.prop[idx].spl;
+				config_store.prop[i][j].sppt = output.prop[idx].sppt;
+				config_store.prop[i][j].sppt_apu_only =
+							output.prop[idx].sppt_apu_only;
+				config_store.prop[i][j].fppt = output.prop[idx].fppt;
+				config_store.prop[i][j].stt_min = output.prop[idx].stt_min;
+				config_store.prop[i][j].stt_skin_temp[STT_TEMP_APU] =
+						output.prop[idx].stt_skin_temp[STT_TEMP_APU];
+				config_store.prop[i][j].stt_skin_temp[STT_TEMP_HS2] =
+						output.prop[idx].stt_skin_temp[STT_TEMP_HS2];
+				config_store.prop[i][j].fan_id = output.prop[idx].fan_id;
+				idx++;
+			}
+		}
+	}
+}
+
+void amd_pmf_update_slider(struct amd_pmf_dev *dev, bool op, int idx,
+			   struct amd_pmf_static_slider_granular *table)
+{
+	int src = amd_pmf_get_power_source();
+
+	if (op == SLIDER_OP_SET) {
+		amd_pmf_send_cmd(dev, SET_SPL, false, config_store.prop[src][idx].spl, NULL);
+		amd_pmf_send_cmd(dev, SET_FPPT, false, config_store.prop[src][idx].fppt, NULL);
+		amd_pmf_send_cmd(dev, SET_SPPT, false, config_store.prop[src][idx].sppt, NULL);
+		amd_pmf_send_cmd(dev, SET_SPPT_APU_ONLY, false,
+				 config_store.prop[src][idx].sppt_apu_only, NULL);
+		amd_pmf_send_cmd(dev, SET_STT_MIN_LIMIT, false,
+				 config_store.prop[src][idx].stt_min, NULL);
+		amd_pmf_send_cmd(dev, SET_STT_LIMIT_APU, false,
+				 config_store.prop[src][idx].stt_skin_temp[STT_TEMP_APU], NULL);
+		amd_pmf_send_cmd(dev, SET_STT_LIMIT_HS2, false,
+				 config_store.prop[src][idx].stt_skin_temp[STT_TEMP_HS2], NULL);
+	} else if (op == SLIDER_OP_GET) {
+		amd_pmf_send_cmd(dev, GET_SPL, true, ARG_NONE, &table->prop[src][idx].spl);
+		amd_pmf_send_cmd(dev, GET_FPPT, true, ARG_NONE, &table->prop[src][idx].fppt);
+		amd_pmf_send_cmd(dev, GET_SPPT, true, ARG_NONE, &table->prop[src][idx].sppt);
+		amd_pmf_send_cmd(dev, GET_SPPT_APU_ONLY, true, ARG_NONE,
+				 &table->prop[src][idx].sppt_apu_only);
+		amd_pmf_send_cmd(dev, GET_STT_MIN_LIMIT, true, ARG_NONE,
+				 &table->prop[src][idx].stt_min);
+		amd_pmf_send_cmd(dev, GET_STT_LIMIT_APU, true, ARG_NONE,
+				 (u32 *)&table->prop[src][idx].stt_skin_temp[STT_TEMP_APU]);
+		amd_pmf_send_cmd(dev, GET_STT_LIMIT_HS2, true, ARG_NONE,
+				 (u32 *)&table->prop[src][idx].stt_skin_temp[STT_TEMP_HS2]);
+	}
+}
+
+static int amd_pmf_profile_get(struct platform_profile_handler *pprof,
+			       enum platform_profile_option *profile)
+{
+	struct amd_pmf_dev *pmf = container_of(pprof, struct amd_pmf_dev, pprof);
+
+	*profile = pmf->current_profile;
+	return 0;
+}
+
+u8 amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf)
+{
+	u8 mode;
+
+	switch (pmf->current_profile) {
+	case PLATFORM_PROFILE_PERFORMANCE:
+		mode = POWER_MODE_PERFORMANCE;
+		break;
+	case PLATFORM_PROFILE_BALANCED:
+		mode = POWER_MODE_BALANCED_POWER;
+		break;
+	case PLATFORM_PROFILE_LOW_POWER:
+		mode = POWER_MODE_POWER_SAVER;
+		break;
+	default:
+		dev_err(pmf->dev, "Unknown Platform Profile.\n");
+		break;
+	}
+
+	return mode;
+}
+
+int amd_pmf_profile_set(struct platform_profile_handler *pprof,
+			enum platform_profile_option profile)
+{
+	struct amd_pmf_dev *pmf = container_of(pprof, struct amd_pmf_dev, pprof);
+	u8 mode;
+
+	pmf->current_profile = profile;
+	mode = amd_pmf_get_pprof_modes(pmf);
+	amd_pmf_update_slider(pmf, SLIDER_OP_SET, mode, NULL);
+	return 0;
+}
+
+int amd_pmf_init_sps(struct amd_pmf_dev *dev)
+{
+	int err = 0;
+
+	dev->pprof.profile_get = amd_pmf_profile_get;
+	dev->pprof.profile_set = amd_pmf_profile_set;
+
+	/* Setup supported modes */
+	set_bit(PLATFORM_PROFILE_LOW_POWER, dev->pprof.choices);
+	set_bit(PLATFORM_PROFILE_BALANCED, dev->pprof.choices);
+	set_bit(PLATFORM_PROFILE_PERFORMANCE, dev->pprof.choices);
+
+	/* Create platform_profile structure and register */
+	err = platform_profile_register(&dev->pprof);
+	if (err) {
+		dev_err(dev->dev, "Failed to register SPS support, this is most likely an SBIOS bug: %d\n",
+			err);
+		return -EEXIST;
+	}
+
+	dev->current_profile = PLATFORM_PROFILE_BALANCED;
+	amd_pmf_load_defaults_sps(dev);
+
+	return err;
+}
+
+void amd_pmf_deinit_sps(struct amd_pmf_dev *dev)
+{
+	platform_profile_remove();
+}
-- 
2.25.1

