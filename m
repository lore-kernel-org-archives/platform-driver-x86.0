Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F0CFC19F2B
	for <platform-driver-x86@archiver.kernel.org>; Tue,  2 Aug 2022 11:27:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236888AbiHBL1k (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 2 Aug 2022 07:27:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236900AbiHBL1i (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 2 Aug 2022 07:27:38 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2042.outbound.protection.outlook.com [40.107.94.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6BE52C114
        for <platform-driver-x86@vger.kernel.org>; Tue,  2 Aug 2022 04:27:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hvoiNEPyxGBAU7eMyINuk7NtzgFZVhxYfWoPGB00eA9FQ36fC95QPYAUrVA+G7rSxL0Z2QtAjuS+0uDxmyku6GTAPk8eQqohEsg9CFyNcGY4gLpZuX4sVmGP3XTEY61JipzYZxl9bJEtOxkk90eQuu6xV9/1YYdwv4Y2uMyE2pqVSyXium8GdYeOJU3rpFfctHipzX1lCkuNBSb60hqLWpRkST/fI8924r0tAkhFsYEZgKnMPxH2yaHYXes9A3cvnd8SNJG4T8CqhyPyJfOv0iu3bh1d1P3+qXnFf5uaf9J7YNQQzznpA8eJLU0Djntw8lTKpdDI1gu9cL+d1KeA6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sUP4Gx3LspCFdUubrof8jl3nA/5x/WEXHDI5CBYaP1o=;
 b=f6SRKVDY7/soy5DsV06gSOvBASAqm8hmxjFP4aCm/zOw4En2GU6lRfAGQF7FN83CCDS6DlhlGEZ5MVDYcCGp77PsdAfbGEsaYVBRs0GJDZ2dyL0k88gX7SQWsWFXE88mkQYRGd7OZ8whXUuab5n+TO7zlKFm+2DfynfsWo5DYeQIDqq9Y560iW3OWtEohN+FAEBa2vSgKmpEGbysVkU0NRxHOIto8zzMnJvMAMwMJTg/Ql7tc/gtAUBiIrBS/Qx7959og5s0pKP/Ee6PRMoMibnFXsAi2/2cAQXD2jWMzowArHPDkfRxT33FQZ1KxuUuQBwtKGdcRq4tI3AiFiJZnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sUP4Gx3LspCFdUubrof8jl3nA/5x/WEXHDI5CBYaP1o=;
 b=qmq4AW8PB2tKONBwoM1wX55cZiX0gvWVMia89XI2O//jcW/E0DQUQ4NLVrLY9SR1u4rL08gVdDnH9XXmY3qL5dtw2nlR2LvKBcL9H1v5lIo+XL7GEPhaDyv0yXPD1hfe9YI7LcSj1mODPptw8VnDdy1PF5JBoBG9bqTt0FZWHJM=
Received: from MW4P220CA0022.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::27)
 by DM4PR12MB5964.namprd12.prod.outlook.com (2603:10b6:8:6b::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.14; Tue, 2 Aug 2022 11:27:31 +0000
Received: from CO1NAM11FT020.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:115:cafe::94) by MW4P220CA0022.outlook.office365.com
 (2603:10b6:303:115::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11 via Frontend
 Transport; Tue, 2 Aug 2022 11:27:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT020.mail.protection.outlook.com (10.13.174.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5482.10 via Frontend Transport; Tue, 2 Aug 2022 11:27:30 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 2 Aug
 2022 06:27:19 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 02/11] platform/x86/amd/pmf: Add support for PMF APCI layer
Date:   Tue, 2 Aug 2022 16:55:36 +0530
Message-ID: <20220802112545.2118632-3-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220802112545.2118632-1-Shyam-sundar.S-k@amd.com>
References: <20220802112545.2118632-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a6c4671-ff0e-48f7-a7bc-08da7479fcf9
X-MS-TrafficTypeDiagnostic: DM4PR12MB5964:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 69XQ3ru1JlJM8JlO6p/qJSI2PuXOc01GdX3fGjFTK4oVEsyS/XJVhnqND6M4MMBu86InS/qUr5JhcoEZ7b6DFAmTSY3BgBtRp8yGdSTTMMRTAjvzsKSaYJAHHEVTpUCyOr3+Eqd2SKdDPJXLB/DudXIFuNi4DapvJtvWfvgg/QAOsVJjWYnmcYmbvbsCbUC6djUhgpuvVafO8ArbBp7M9TnIA87NMazhfhOkHtQB56c15Og+bH1OjCZW+8lIFkps/1lGzIUopaCyGchNybq3lnyyZW6OSNvCEpAxp5zusvfalpaSfKPppIWoZ1ybHVfTgnz29493eCbP/ag9yxMcvyb9Jl4iA3rihsbP2VntdpZUlKclCrviR/cNBHZpV9HgWM2bhNl5YAkvJawIxkVqr8AJjDfXh/YqHhxPlnU7IeP5eWetBpA/gdvz7g3HAoG6IPQTvXSkoA9oVDXiN9Y/jszyimyfn8mZZZXQlsn0rS9NvWQuePAudx8FrecVfHjjrHEIbvApxclrtC4mws9+IXQPI0Ucdoa2pBJvdc4t2XvwltksA8iCYYIggAA4gtjPCvCbPNMs5edhrTUJ/0GsXHMvxOdlsbxWdMNrtpZNGI9c4BLjfLx92IuzkygWi8MUg4yOMpv3rsu50f1W0nXpCtBBQvlbkWzVPfqJ/MFvi5V91pRVCV92YeERBcBy77oR61yCkMl+2kO6ScilLQt8FKyACcEpsYFjp3xQALYgq+gnGy1396X+3oIrvv9RvAyb8DI4mQIXOwVo+rfyWMn9hT5Qa7WWPUs3Fz9pe4N4DXgQ+EKeO0hFmHTo3WF1as0JuhnBsoBKNbvu4shhiAKg0g==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(396003)(346002)(39860400002)(46966006)(40470700004)(36840700001)(54906003)(316002)(7696005)(6666004)(36860700001)(26005)(36756003)(82310400005)(86362001)(110136005)(40480700001)(41300700001)(356005)(2906002)(82740400003)(70206006)(8676002)(70586007)(4326008)(1076003)(478600001)(2616005)(426003)(16526019)(186003)(336012)(47076005)(83380400001)(40460700003)(5660300002)(81166007)(8936002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2022 11:27:30.3244
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a6c4671-ff0e-48f7-a7bc-08da7479fcf9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT020.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5964
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

PMF driver implements the ACPI methods as defined by AMD for PMF Support.
The ACPI layer acts as a glue that helps in providing the infrastructure
for OEMs customization.

OEMs can refer to PMF support documentation to decide on the list of
functions to be supported on their specific platform model.

AMD mandates that PMF ACPI fn0 and fn1 to be implemented which
provides the set of functions, params and the notifications that
would be sent to PMF driver so that PMF driver can adapt and
react.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/Makefile |   2 +-
 drivers/platform/x86/amd/pmf/acpi.c   | 153 ++++++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/core.c   |   1 +
 drivers/platform/x86/amd/pmf/pmf.h    |  23 ++++
 4 files changed, 178 insertions(+), 1 deletion(-)
 create mode 100644 drivers/platform/x86/amd/pmf/acpi.c

diff --git a/drivers/platform/x86/amd/pmf/Makefile b/drivers/platform/x86/amd/pmf/Makefile
index 459005f659e5..2617eba773ce 100644
--- a/drivers/platform/x86/amd/pmf/Makefile
+++ b/drivers/platform/x86/amd/pmf/Makefile
@@ -5,4 +5,4 @@
 #
 
 obj-$(CONFIG_AMD_PMF) += amd-pmf.o
-amd-pmf-objs := core.o
+amd-pmf-objs := core.o acpi.o
diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
new file mode 100644
index 000000000000..5269d48b1f5f
--- /dev/null
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -0,0 +1,153 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * AMD Platform Management Framework Driver
+ *
+ * Copyright (c) 2022, Advanced Micro Devices, Inc.
+ * All Rights Reserved.
+ *
+ * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+ */
+
+#include <linux/acpi.h>
+#include "pmf.h"
+
+static union acpi_object *apmf_if_call(struct amd_pmf_dev *pdev, int fn, struct acpi_buffer *param)
+{
+	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
+	acpi_handle ahandle = ACPI_HANDLE(pdev->dev);
+	struct acpi_object_list apmf_if_arg_list;
+	union acpi_object apmf_if_args[2];
+	acpi_status status;
+
+	apmf_if_arg_list.count = 2;
+	apmf_if_arg_list.pointer = &apmf_if_args[0];
+
+	apmf_if_args[0].type = ACPI_TYPE_INTEGER;
+	apmf_if_args[0].integer.value = fn;
+
+	if (param) {
+		apmf_if_args[1].type = ACPI_TYPE_BUFFER;
+		apmf_if_args[1].buffer.length = param->length;
+		apmf_if_args[1].buffer.pointer = param->pointer;
+	} else {
+		apmf_if_args[1].type = ACPI_TYPE_INTEGER;
+		apmf_if_args[1].integer.value = 0;
+	}
+
+	status = acpi_evaluate_object(ahandle, "APMF", &apmf_if_arg_list, &buffer);
+	if (ACPI_FAILURE(status)) {
+		dev_err(pdev->dev, "APMF method call failed\n");
+		if (status != AE_NOT_FOUND)
+			kfree(buffer.pointer);
+
+		return NULL;
+	}
+
+	return buffer.pointer;
+}
+
+static int apmf_if_call_store_buffer(struct amd_pmf_dev *pdev, int fn, void *dest, size_t out_sz)
+{
+	union acpi_object *info;
+	size_t size;
+	int err = 0;
+
+	info = apmf_if_call(pdev, fn, NULL);
+	if (!info)
+		return -EIO;
+
+	if (info->type != ACPI_TYPE_BUFFER) {
+		dev_err(pdev->dev, "object is not a buffer\n");
+		err = -EINVAL;
+		goto out;
+	}
+
+	if (info->buffer.length < 2) {
+		dev_err(pdev->dev, "buffer too small\n");
+		err = -EINVAL;
+		goto out;
+	}
+
+	size = *(u16 *)info->buffer.pointer;
+	if (info->buffer.length < size) {
+		dev_err(pdev->dev, "buffer smaller then headersize %u < %zu\n",
+			info->buffer.length, size);
+		err = -EINVAL;
+		goto out;
+	}
+
+	if (size < out_sz) {
+		dev_err(pdev->dev, "buffer too small %zu\n", size);
+		err = -EINVAL;
+		goto out;
+	}
+
+	memcpy(dest, info->buffer.pointer, out_sz);
+
+out:
+	kfree(info);
+	return err;
+}
+
+int is_apmf_func_supported(struct amd_pmf_dev *pdev, unsigned long index)
+{
+	/* If bit-n is set, that indicates function n+1 is supported */
+	return !!(pdev->supported_func & BIT(index - 1));
+}
+
+static int apmf_if_verify_interface(struct amd_pmf_dev *pdev)
+{
+	struct apmf_verify_interface output;
+	int err;
+
+	err = apmf_if_call_store_buffer(pdev, APMF_FUNC_VERIFY_INTERFACE, &output, sizeof(output));
+	if (err)
+		return err;
+
+	pdev->supported_func = output.supported_functions;
+	dev_dbg(pdev->dev, "supported functions:0x%x notifications:0x%x\n",
+		output.supported_functions, output.notification_mask);
+
+	return 0;
+}
+
+static int apmf_get_system_params(struct amd_pmf_dev *dev)
+{
+	struct apmf_system_params params;
+	int err;
+
+	if (!is_apmf_func_supported(dev, APMF_FUNC_GET_SYS_PARAMS))
+		return -EINVAL;
+
+	err = apmf_if_call_store_buffer(dev, APMF_FUNC_GET_SYS_PARAMS, &params, sizeof(params));
+	if (err)
+		return err;
+
+	dev_dbg(dev->dev, "system params mask:0x%x flags:0x%x cmd_code:0x%x\n",
+		params.valid_mask,
+		params.flags,
+		params.command_code);
+	params.flags = params.flags & params.valid_mask;
+
+	return 0;
+}
+
+int apmf_acpi_init(struct amd_pmf_dev *pmf_dev)
+{
+	int ret;
+
+	ret = apmf_if_verify_interface(pmf_dev);
+	if (ret) {
+		dev_err(pmf_dev->dev, "APMF verify interface failed :%d\n", ret);
+		goto out;
+	}
+
+	ret = apmf_get_system_params(pmf_dev);
+	if (ret) {
+		dev_err(pmf_dev->dev, "APMF apmf_get_system_params failed :%d\n", ret);
+		goto out;
+	}
+
+out:
+	return ret;
+}
diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index aef97965c181..c5002b7bb904 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -204,6 +204,7 @@ static int amd_pmf_probe(struct platform_device *pdev)
 	if (!dev->regbase)
 		return -ENOMEM;
 
+	apmf_acpi_init(dev);
 	platform_set_drvdata(pdev, dev);
 
 	mutex_init(&dev->lock);
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 1c2e942e5096..bdadbff168ee 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -11,6 +11,12 @@
 #ifndef PMF_H
 #define PMF_H
 
+#include <linux/acpi.h>
+
+/* APMF Functions */
+#define APMF_FUNC_VERIFY_INTERFACE			0
+#define APMF_FUNC_GET_SYS_PARAMS			1
+
 /* Message Definitions */
 #define SET_SPL				0x03 /* SPL: Sustained Power Limit */
 #define SET_SPPT			0x05 /* SPPT: Slow Package Power Tracking */
@@ -30,6 +36,21 @@
 #define GET_STT_LIMIT_APU	0x20
 #define GET_STT_LIMIT_HS2	0x21
 
+/* AMD PMF BIOS interfaces */
+struct apmf_verify_interface {
+	u16 size;
+	u16 version;
+	u32 notification_mask;
+	u32 supported_functions;
+} __packed;
+
+struct apmf_system_params {
+	u16 size;
+	u32 valid_mask;
+	u32 flags;
+	u8 command_code;
+} __packed;
+
 struct amd_pmf_dev {
 	void __iomem *regbase;
 	void __iomem *smu_virt_addr;
@@ -38,9 +59,11 @@ struct amd_pmf_dev {
 	u32 cpu_id;
 	struct device *dev;
 	struct mutex lock; /* protects the PMF interface */
+	u32 supported_func;
 };
 
 /* Core Layer */
+int apmf_acpi_init(struct amd_pmf_dev *pmf_dev);
 int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32 *data);
 
 #endif /* PMF_H */
-- 
2.25.1

