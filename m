Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D42CC3F6B0
	for <platform-driver-x86@archiver.kernel.org>; Thu, 28 Jul 2022 18:21:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229735AbiG1SVB (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 28 Jul 2022 14:21:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231194AbiG1SVA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 28 Jul 2022 14:21:00 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2058.outbound.protection.outlook.com [40.107.94.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4D0F5A89B
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Jul 2022 11:20:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C/EQPIK0G/SdlDnD+vwNBmZSD9lvqfpG2V/OehQv8Da4ZgqEYKcD6OZTsMjzHT0pYwTWiSXC9Pq3eVJtf/fiBxbh/eNq0CvdldlXjhBx/OwBf+ot65jeXdTPFWEFdiMCaiac7ahisaSmUqTzrv0vP6/2OlQuuHTXxGUUpgBMjtPYfFSOYjFdVh1jSoEshp5RIe0wbUl+qhRG7z2qTy30QP4Hz3Hr9nzekBeyD9OtKZ3A02dDt60d20BJqcS+WEkgEuw6WXoyZz/79ggNcD2N+MKt+zK/IFlcwqOjOkg7TjdbHVhQ519ounU2z7Fh3WRlcbpU4yfVpuexYEmHuweOdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=11jOfdIPL8Ox6Zmpuv9GOiK6R+A2xhJYnGIJV5ocVXM=;
 b=UIq39oONZI4MmAlbopw/R3r+mVWKrtZWcdHhGdDDg6kseWWv8qZqztpM3NhI9dLGqEkKvFAOacyTgdNc6/E8NpXB8C38pTGhqSXPp4OQ09UDb11ti/pTAXPNTGPDWRN795s+ZHjkKQhvsI85GXCDaLbd0xQuU/SsF/JVVZUl24SU7c0EsqAaZTx5i4TRc02Yir69AGP+xq9rbYilGr/gdGuoDfTcQYCsP+hfNKifnlExc+Vidt+x2Au0FfiugADCQkKLhDIpcRPoK6/KY8deyx9IcnbXi+v4Jy95WTeed8xbEmxkKe1K+36n26XMu6WI5+hOjJhVl2h4hdnfWsM7Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=11jOfdIPL8Ox6Zmpuv9GOiK6R+A2xhJYnGIJV5ocVXM=;
 b=eeCo093aLOCFOxe3fCT0azV2ChlG8H67g1Jt+mdZCXjXgU9H6k1b77S5LHxAlU6nbxdkewouDKdiukHte8YbtvXhfCNEcVgvmQYJ5r++qzLEruZMQN/nmnPFHl3wTmfC0wS2R9W4jbkgGGUHmSl2wjkpUd0uSOE/37UrUP2fGMY=
Received: from BN8PR16CA0033.namprd16.prod.outlook.com (2603:10b6:408:4c::46)
 by DM4PR12MB5844.namprd12.prod.outlook.com (2603:10b6:8:67::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Thu, 28 Jul
 2022 18:20:57 +0000
Received: from BN8NAM11FT026.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:4c:cafe::74) by BN8PR16CA0033.outlook.office365.com
 (2603:10b6:408:4c::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.30 via Frontend
 Transport; Thu, 28 Jul 2022 18:20:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT026.mail.protection.outlook.com (10.13.177.51) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5482.10 via Frontend Transport; Thu, 28 Jul 2022 18:20:57 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 28 Jul
 2022 13:20:55 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 RESEND 02/11] platform/x86/amd/pmf: Add support for PMF APCI layer
Date:   Thu, 28 Jul 2022 23:50:19 +0530
Message-ID: <20220728182028.2082096-3-Shyam-sundar.S-k@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 4960e9f1-486c-4d74-a2b4-08da70c5eadc
X-MS-TrafficTypeDiagnostic: DM4PR12MB5844:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: djrmgmksKZjuzRmSZMRxAXIx/sRZWig05PSZ+Faki0zsAVWp7/pPo7FLjcIEXBywhEHgUI/eRS/sHOilegR4evqqiZGsz2bXyibPJUijzqSc3xmlWmhCvi78hr6P9gGFW/OO9dnncTjL/en2j43OfFmclmBQvjmMrOsyNcIL0RQNfA6oIE8AymJiRZA7BaOBS+HM4ILlZBMsysg6WDhMSxqhcuiPZJQX6e0K8ljGRGra4f+6ufosfYlqJL4FdwrVJ2F893F+p1pt98nwfMcNaMwIP7q606MmkfTOdqmKFQQ5nnkomnKBlSPgiT2CVbenawmDODld3oRLDrpw++TqyPtsExf/ajo0ACcIclh/tVU/8g3eban6PqPRxYYMYm5V6k6u2AcQ5SlmyGwwBlYXOocKABEx6/rvCNqkuwtbmE13Zwt6Y6OXmvOJABBBpcD0lCug/CAbpnXAL72ubOAG0xw3hw3PW7rlNfSsjYDLhONJizVwobb/KL+BZfFgzpalfwfGFz5XadpxDNnHmXRFlaI1y/ClFe3aBr9qHhubj6tWsWZCqEM0PsPnbUidYyHhOGCBkYwYue5M2qtWKpOV55UDns4glh2zG0Sl4bksUBqgbQnDU/HxxlonHF6PiuNpNDA3mbz8Dx4Tlf37alNa/ar7OeVE3cMMjJ/xvqZDOK8fSGi6eBtAR46D2mLMPzOU5JHxDrB5cKYiKCI5UVWb+UF4+uMiuKPVbKAB8TE9VX2sRpQhhLH1KPSjTvcGK32WM/RrqyDoECTa+fmYmiSrdd0VFi9Gd6Tc82eQtikm4lQOtC1toYYHb+vf6mZ/HgZ+HUBdK4Pi0fm7Z8nxf252VQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(396003)(376002)(346002)(46966006)(40470700004)(36840700001)(82740400003)(316002)(86362001)(36756003)(41300700001)(186003)(16526019)(7696005)(1076003)(6666004)(426003)(336012)(54906003)(478600001)(81166007)(110136005)(26005)(47076005)(2616005)(40480700001)(82310400005)(356005)(40460700003)(8936002)(5660300002)(70206006)(4326008)(70586007)(2906002)(36860700001)(83380400001)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 18:20:57.6136
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4960e9f1-486c-4d74-a2b4-08da70c5eadc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT026.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5844
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
 drivers/platform/x86/amd/pmf/acpi.c   | 182 ++++++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/core.c   |   1 +
 drivers/platform/x86/amd/pmf/pmf.h    |  32 +++++
 4 files changed, 216 insertions(+), 1 deletion(-)
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
index 000000000000..bd796d7e1d96
--- /dev/null
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -0,0 +1,182 @@
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
+#define APMF_METHOD "\\_SB_.PMF_.APMF"
+
+static unsigned long supported_func;
+
+static void apmf_if_parse_functions(struct apmf_if_functions *func, u32 mask);
+
+static union acpi_object *apmf_if_call(struct apmf_if *apmf_if, int func, struct acpi_buffer *param)
+{
+	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
+	struct acpi_object_list apmf_if_arg_list;
+	union acpi_object apmf_if_args[2];
+	acpi_status status;
+
+	apmf_if_arg_list.count = 2;
+	apmf_if_arg_list.pointer = &apmf_if_args[0];
+
+	apmf_if_args[0].type = ACPI_TYPE_INTEGER;
+	apmf_if_args[0].integer.value = func;
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
+	status = acpi_evaluate_object(apmf_if->handle, NULL, &apmf_if_arg_list, &buffer);
+	if (ACPI_FAILURE(status)) {
+		pr_err("PMF: APMF method call failed\n");
+		if (status != AE_NOT_FOUND)
+			kfree(buffer.pointer);
+
+		return NULL;
+	}
+
+	return buffer.pointer;
+}
+
+static int apmf_if_call_store_buffer(struct apmf_if *apmf_if, int func, void *dest, size_t out_sz)
+{
+	union acpi_object *info;
+	size_t size;
+	int err = 0;
+
+	info = apmf_if_call(apmf_if, func, NULL);
+	if (!info)
+		return -EIO;
+
+	if (info->type != ACPI_TYPE_BUFFER) {
+		pr_err("object is not a buffer\n");
+		err = -EINVAL;
+		goto out;
+	}
+
+	if (info->buffer.length < 2) {
+		pr_err("buffer too small\n");
+		err = -EINVAL;
+		goto out;
+	}
+
+	size = *(u16 *)info->buffer.pointer;
+	if (info->buffer.length < size) {
+		pr_err("buffer smaller then headersize %u < %zu\n",
+		       info->buffer.length, size);
+		err = -EINVAL;
+		goto out;
+	}
+
+	if (size < out_sz) {
+		pr_err("buffer too small %zu\n", size);
+		err = -EINVAL;
+		goto out;
+	}
+
+	size = out_sz;
+	memcpy(dest, info->buffer.pointer, size);
+
+out:
+	kfree(info);
+	return err;
+}
+
+static void apmf_if_parse_functions(struct apmf_if_functions *func, u32 mask)
+{
+	func->system_params = mask & APMF_FUNC_GET_SYS_PARAMS;
+}
+
+int is_apmf_func_supported(unsigned long index)
+{
+	/* If bit-n is set, that indicates function n+1 is supported */
+	return ((supported_func & (1 << (index - 1))) != 0);
+}
+
+static int apmf_if_verify_interface(struct amd_pmf_dev *pdev, struct apmf_if *apmf_if)
+{
+	struct apmf_verify_interface output;
+	int err;
+
+	err = apmf_if_call_store_buffer(apmf_if, APMF_FUNC_VERIFY_INTERFACE,
+					&output, sizeof(output));
+	if (err)
+		return err;
+
+	apmf_if_parse_functions(&apmf_if->func, output.supported_functions);
+	supported_func = output.supported_functions;
+	dev_dbg(pdev->dev, "supported functions:0x%x notifications:0x%x\n",
+		output.supported_functions, output.notification_mask);
+
+	return 0;
+}
+
+static int apmf_get_system_params(struct apmf_if *apmf_if)
+{
+	struct apmf_system_params params;
+	int err;
+
+	if (apmf_if->func.system_params) {
+		err = apmf_if_call_store_buffer(apmf_if, APMF_FUNC_GET_SYS_PARAMS,
+						&params, sizeof(params));
+		if (err)
+			return err;
+	}
+
+	pr_debug("PMF: system params mask:0x%x flags:0x%x cmd_code:0x%x\n",
+		 params.valid_mask,
+		 params.flags,
+		 params.command_code);
+	params.flags = params.flags & params.valid_mask;
+
+	return 0;
+}
+
+int apmf_acpi_init(struct amd_pmf_dev *pmf_dev)
+{
+	acpi_handle apmf_if_handle;
+	struct apmf_if *apmf_if;
+	acpi_status status;
+	int ret;
+
+	status = acpi_get_handle(NULL, (acpi_string) APMF_METHOD, &apmf_if_handle);
+	if (ACPI_FAILURE(status))
+		return -ENODEV;
+
+	apmf_if = kzalloc(sizeof(*apmf_if), GFP_KERNEL);
+	if (!apmf_if)
+		goto out;
+
+	apmf_if->handle = apmf_if_handle;
+
+	ret = apmf_if_verify_interface(pmf_dev, apmf_if);
+	if (ret) {
+		dev_err(pmf_dev->dev, "APMF verify interface failed :%d\n", ret);
+		kfree(apmf_if);
+		goto out;
+	}
+	pmf_dev->apmf_if = apmf_if;
+
+	ret = apmf_get_system_params(apmf_if);
+	if (ret) {
+		dev_err(pmf_dev->dev, "APMF apmf_get_system_params failed :%d\n", ret);
+		kfree(apmf_if);
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
index 1c2e942e5096..08c6bc0e2b42 100644
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
@@ -30,6 +36,30 @@
 #define GET_STT_LIMIT_APU	0x20
 #define GET_STT_LIMIT_HS2	0x21
 
+/* AMD PMF BIOS interfaces */
+struct apmf_if_functions {
+	bool system_params;
+};
+
+struct apmf_if {
+	acpi_handle handle;
+	struct apmf_if_functions func;
+};
+
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
@@ -37,10 +67,12 @@ struct amd_pmf_dev {
 	u32 base_addr;
 	u32 cpu_id;
 	struct device *dev;
+	struct apmf_if *apmf_if;
 	struct mutex lock; /* protects the PMF interface */
 };
 
 /* Core Layer */
+int apmf_acpi_init(struct amd_pmf_dev *pmf_dev);
 int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32 *data);
 
 #endif /* PMF_H */
-- 
2.25.1

