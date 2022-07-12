Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE7CEC433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 12 Jul 2022 15:03:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233908AbiGLPDG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 12 Jul 2022 11:03:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233855AbiGLPBm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 12 Jul 2022 11:01:42 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2072.outbound.protection.outlook.com [40.107.220.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 725CCBFAFE
        for <platform-driver-x86@vger.kernel.org>; Tue, 12 Jul 2022 07:59:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b+vV9jXHis4vzP1vG8G1Ikcfz22Bg/8hCfDRZ05oMiyZkh4cyR9W4bOj643JUc8sJx/1aoXiR5IkjIAB+Xh5V1HH+lyqp+onrIHjUDSXCKYwf5kaj0oG0zZCzJNtNdAD+IMILtOGagGUon9KYrB1yY2El56dnIhDfK0fdU//GkDLx9yLD4Ewzwl3mjspLBSmyoT1l/5nEQzgbSeUPccGiecfNwLxrgxBkRUOJYjIGinUb5Fuc+8WMHhzomtKB1kIv0GGTM5X0wYNh9wrwAwrNldA72uKFoyEtV/a77JuT8icBcotxxzHQjJVWceOLHWw9zbbsmsi80zyksLdVjqjdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v5RHKZTDgg9y7StpiO5KS1yYgWlWGA9R7y9Gn6SoB1E=;
 b=bgkpDmFsWYeeqjiZdZApyg1gqLfsuxTzJATVIuqkej4RIPNYv5Og1SoJ4W+JCUylLkCiz/QQy7F+VuVt9duCzj/jdoNT30o+I1NV6k0Fp2Ca3gFiXc+V1Y/+N4h9UOM/Xpzm7G/f+eCPhSQVEoPGCfwr9zEtDt11xfe3Qjg9uhb6rwDwvepf9cqpLIpMCYDHpTuRIg6xshAA2MZSHnOExvUORgTkc4VeEniDzNXBTy+6nzVkiCjxGx0EQ8blH62T3mCwt89/gt0eaiadQjaaEZL+Or7xQJuY1/z/hmcR41ZD03vtObavSY9hCiNJ+rOat8jiIaDhOvx+XXflsAY+2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v5RHKZTDgg9y7StpiO5KS1yYgWlWGA9R7y9Gn6SoB1E=;
 b=4p8qVkS9bMIWIJiZGzSNv/qfXLXbiiASV7gX+yXYNQ3VlImKac3tM4/fCQi3Z6lriXPiKaBW0c3s7Jx+qQgBB1F54shNbxxiz8pYyB0XFJ78R7xoUA/KR4pB8Sew2ppPQ0yo1ndmjoBaHVn3PEXRDfvy/bRn0utMTLcUITnbm8s=
Received: from BN6PR14CA0003.namprd14.prod.outlook.com (2603:10b6:404:79::13)
 by SN6PR12MB2751.namprd12.prod.outlook.com (2603:10b6:805:6c::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Tue, 12 Jul
 2022 14:59:38 +0000
Received: from BN8NAM11FT066.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:79:cafe::ab) by BN6PR14CA0003.outlook.office365.com
 (2603:10b6:404:79::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20 via Frontend
 Transport; Tue, 12 Jul 2022 14:59:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT066.mail.protection.outlook.com (10.13.177.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5417.15 via Frontend Transport; Tue, 12 Jul 2022 14:59:38 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 12 Jul
 2022 09:59:35 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v1 04/15] platform/x86/amd/pmf: Add support SPS PMF feature
Date:   Tue, 12 Jul 2022 20:28:36 +0530
Message-ID: <20220712145847.3438544-5-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220712145847.3438544-1-Shyam-sundar.S-k@amd.com>
References: <20220712145847.3438544-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3bc21647-f4bb-4237-d05d-08da64172446
X-MS-TrafficTypeDiagnostic: SN6PR12MB2751:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f5eo7IAlxyyU9keIUhfsFAEmzy5SBV34+vG0P3N70ipId1nQHCkGO97Kvh1/Po1y52r2qL3B3X4Uy5JqGlCvJ+n5AuKiG31KOymETA75D7sE2xoG3sNv/khMlmBkZ9uRkm1eAHOUg+V1t24fAJaXzs96+zPUnE2hdzkndORkQisoT/1iRmYRHmyWGhpjr1RK6eTiZZ3DufMRBm8G4nQslk/DaJLnYjyzQJ1DwDpR+xFZ1JladqAepkK0L+F5uz4tpO5Shm+JbBFHtcyDznz4qM7EoRoQT7yYLrR3zWioQJ30WHVq1JCONr8UWjEPvSnvHRR7h/FKu4e6p06hn8YKawDxJK/U/6F+GggAPd9vzctFAFHivZQ+OQzDfQGZjKvhu6K2G7a72UEPhlxargWM/mlfdOaRkk8k7VCy0e9F3HhuZu69hbm5lXgcPWFvIscdvuBEKPHLf3t525iUjRxImTllCW8nl/K6VSnMTy5BZE+/QQDJp5mdVCMNtCAMCnLKqZ3YxR1PpdFdnEsYqSomVEWyG6hqCI7tZucaK0G4V5Udr3zbqqDsrVKF2imtfk1ow+TW69XXl5mXWxIq36sI9tW4dcjsAbKZfkz/POYW9VC9EAszuhatqwSvyu++tR6CY423LLQy4lwJUmB9iJ7tvEFT4PW4s4v1sdGVNU5sPGHTjXwaLZEVrm9984zMiMAXZsYyhBpBoM/UlDnf9ybsv6Tqg9ESdCM3/eGkMTBzwYJkt7yfTWx+zaZtwZfTsJSGZfQDfvYmPSogmltKftS20VFuega3fFoMeJ8N4Gi6h7mB6CczoTgtaR3qrHOuwh+jmIMC3AoWurwGQBbalhZepUXLsQKtjXgt4RugpekEOfc=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(396003)(136003)(39860400002)(46966006)(40470700004)(36840700001)(2906002)(5660300002)(110136005)(8936002)(336012)(316002)(426003)(30864003)(36756003)(47076005)(82310400005)(54906003)(40480700001)(86362001)(40460700003)(356005)(36860700001)(82740400003)(70206006)(4326008)(70586007)(8676002)(81166007)(7696005)(41300700001)(83380400001)(26005)(1076003)(478600001)(16526019)(2616005)(186003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 14:59:38.1211
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bc21647-f4bb-4237-d05d-08da64172446
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT066.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2751
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
 drivers/platform/x86/amd/pmf/acpi.c   |  29 +++++
 drivers/platform/x86/amd/pmf/core.c   |  26 ++++
 drivers/platform/x86/amd/pmf/pmf.h    |  65 ++++++++++
 drivers/platform/x86/amd/pmf/sps.c    | 166 ++++++++++++++++++++++++++
 5 files changed, 287 insertions(+), 1 deletion(-)
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
index addcaae5675c..fd5ab7a116f0 100644
--- a/drivers/platform/x86/amd/pmf/acpi.c
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -54,6 +54,7 @@ static union acpi_object *apmf_if_call(struct apmf_if *apmf_if, int func, struct
 static void apmf_if_parse_functions(struct apmf_if_functions *func, u32 mask)
 {
 	func->system_params = mask & APMF_FUNC_GET_SYS_PARAMS;
+	func->static_slider_granular = mask & APMF_FUNC_STATIC_SLIDER_GRANULAR;
 }
 
 static int apmf_if_verify_interface(struct amd_pmf_dev *pdev, struct apmf_if *ampf_if)
@@ -130,6 +131,34 @@ static int apmf_get_system_params(struct apmf_if *ampf_if)
 	return err;
 }
 
+int apmf_get_static_slider_granular(struct apmf_if *ampf_if,
+				    struct apmf_static_slider_granular_output *data)
+{
+	union acpi_object *info;
+	size_t size;
+	int err = 0;
+
+	info = apmf_if_call(ampf_if, APMF_FUNC_STATIC_SLIDER_GRANULAR, NULL);
+	if (!info)
+		return -EIO;
+
+	size = *(u16 *)info->buffer.pointer;
+
+	if (size < sizeof(*data)) {
+		pr_err("PMF: buffer too small %zu\n", size);
+		err = -EINVAL;
+		goto out;
+	}
+
+	size = min(sizeof(*data), size);
+	memset(data, 0, sizeof(*data));
+	memcpy(data, info->buffer.pointer, size);
+
+out:
+	kfree(info);
+	return err;
+}
+
 static acpi_handle apmf_if_probe_handle(void)
 {
 	acpi_handle handle = NULL;
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
index 40f038eb6197..a405987ae653 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -7,14 +7,17 @@
  *
  * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
  */
+
 #ifndef PMF_H
 #define PMF_H
 
 #include <linux/acpi.h>
+#include <linux/platform_profile.h>
 
 /* APMF Functions */
 #define APMF_FUNC_VERIFY_INTERFACE			0
 #define APMF_FUNC_GET_SYS_PARAMS			1
+#define APMF_FUNC_STATIC_SLIDER_GRANULAR	9
 
 /* Message Definitions */
 #define SET_SPL				0x03 /* SPL: Sustained Power Limit */
@@ -35,9 +38,12 @@
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
@@ -59,6 +65,30 @@ struct apmf_system_params {
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
@@ -69,11 +99,46 @@ struct amd_pmf_dev {
 	u32 low;
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
+};
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
index 000000000000..25289cf5608c
--- /dev/null
+++ b/drivers/platform/x86/amd/pmf/sps.c
@@ -0,0 +1,166 @@
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
+		mode = 0;
+		break;
+	case PLATFORM_PROFILE_BALANCED:
+		mode = 1;
+		break;
+	case PLATFORM_PROFILE_LOW_POWER:
+		mode = 2;
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
+static void amd_pmf_profile_refresh(struct amd_pmf_dev *dev)
+{
+	enum platform_profile_option profile;
+
+	/* Set intially to Balanced Mode */
+	profile = PLATFORM_PROFILE_BALANCED;
+
+	if (profile != dev->current_profile) {
+		dev->current_profile = profile;
+		platform_profile_notify();
+	}
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
+	/* Ensure initial values are correct */
+	amd_pmf_profile_refresh(dev);
+
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

