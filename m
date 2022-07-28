Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B67BC19F2B
	for <platform-driver-x86@archiver.kernel.org>; Thu, 28 Jul 2022 17:42:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231894AbiG1Rmr (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 28 Jul 2022 13:42:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231352AbiG1Rmr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 28 Jul 2022 13:42:47 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2065.outbound.protection.outlook.com [40.107.220.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27D85747AA
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Jul 2022 10:42:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YOI/+3hyEh7TBy0otv4TfjQo/FE9htFGhQV32mDkT6Mcfr/drzT5qpyxhH1Y0UjKgUFRX79J6x6FOi2v+fk7Y1NivMMnbqvUF7Asa2buD4zmIxE6hc4WyTkt6/JAeT82SdDZepviaGbZADOqj8SbVFaxqlIGHfWG0YuPfTocZ/u/DGs+KDI/DRGNoD7ricS/g2cWKvBKoMRnl5ctx6KF+ozd/+d49vJqufJ9P5xuyZBx0S58/GoRG+5QXagGIvQVQZPKt1YZSbyuxpPVgwYATJcW6S2I7O8S7vA6m5p8erzt9rL4hDkZMx+neCHi4LHd0hRWMsqxkX2xJ7RwKrOXIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=11jOfdIPL8Ox6Zmpuv9GOiK6R+A2xhJYnGIJV5ocVXM=;
 b=XNMJPeFaY5aUYAywd03PKSh6/u+jGTnI/C6Tgnt5vEkFj4WutpO8MKAuVfBA3al5Xb3DC3dYy3b6gc/KrECTgN7wBr7izEtqgGsU2SSBj6fnOxwqNwgbUnGQxSzH/R5uLe+gdknGTai1WJkjAEhghfSY9/JVfyfoTwMYKAgFyCfTndChnYgm4ufOq4+xkQY974XAspVqMIUo9ZLOUQXI++Z5g96097ske9yYYYbDGYtGTzxpUNTEDbfWrRUhd5nEKt2sjwZ6xXyU3xmeRRJKK/f5lYAmQGcnvnWO3xKKqiZFTxTIija+1vgO73RnJMPO9Bz9kBJ6TvxT8/pLDeC9eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=11jOfdIPL8Ox6Zmpuv9GOiK6R+A2xhJYnGIJV5ocVXM=;
 b=Q3TrEfOC6B7nsw14ZmFRyU+1AyRTH/Kq1IhfzKqzj9sEzk7QUl7fn+2L6U61hBJ0t5x22c0igz15LqFZwkznRCjRD72OJ9uGZkGLXH+7zgPqgIwnFTjYYvyBqudxp1xAJcw8rm2NW7SB1g32DXAJC/edwrmfjhPVnDLlMyN6AAg=
Received: from MW4P221CA0021.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::26)
 by CH2PR12MB4859.namprd12.prod.outlook.com (2603:10b6:610:62::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Thu, 28 Jul
 2022 17:42:44 +0000
Received: from CO1NAM11FT049.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8b:cafe::ad) by MW4P221CA0021.outlook.office365.com
 (2603:10b6:303:8b::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.10 via Frontend
 Transport; Thu, 28 Jul 2022 17:42:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT049.mail.protection.outlook.com (10.13.175.50) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5482.10 via Frontend Transport; Thu, 28 Jul 2022 17:42:43 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 28 Jul
 2022 12:42:41 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 02/11] platform/x86/amd/pmf: Add support for PMF APCI layer
Date:   Thu, 28 Jul 2022 23:11:59 +0530
Message-ID: <20220728174208.2081453-3-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220728174208.2081453-1-Shyam-sundar.S-k@amd.com>
References: <20220728174208.2081453-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed63706b-36f2-40fb-1da5-08da70c093c0
X-MS-TrafficTypeDiagnostic: CH2PR12MB4859:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: glSUYCQSToJ+OWcOG/oa42z+fP4qC1hzstUwDBtxatTemuz5mb/YMVWK4rmuwlEs9/kCW1dVs5RNPgJiAJtSaJDtLrJo3BiLakRNcvxrlLWIW+H6FtyVh/i1VAD4cTNYwjIVJUNCuuFaHtrAlsiLLpmyuPIUOqbRfgAYnIMrpRFTOZx/G5QBhrgtFre36FNty1zIDHr7RPwY630DBeh5wuPsa0GzBkalqFSwuzOvTBTkez0QFDFIxxtOvA/bUg1PT4yNYC62rBdQcAHXj9Elc2Ml5pFx2J4+QcmO5//pDmApvC9qjkagyKIjHTIpSidYgTBIUvb56sjsvBeliocX/ORx4UG36HyLEAfF8guiX5G2oqsyWX5hszuAyeehmjyLnzRVHD0FvppWcsvPBH0s9Ke6dDkGPxdv4TfoCCz9B5+Ku/aBTLFOSOY19AtJxtbz7FtVd9VOFKtx4x5PMQLMcOWaHNyZ1NTu+liDg+fj7jbDdVN3ZxyMXKeoPvG0SxSWHBsMT69Rq5d4ovfxHlU60ivu/u0NcaC033wAnbBFtpND8avtHRNAMSjL/ayUJgxgbckwbGbfyASbmO+4+lC4j9b2LCCepq6+i7GWZPg/FWmZFYaLjSr0wpOQZQTYZCAe4f7ApALuqZQrsKLM+3Id6t0bOOTNmfYaCiFsTfy9XcFYsimNZ/I5uE4WuO7g7LrVt3/2RmznaEfxgrW9WG6Fx/yH9s5nSyQxb06S9ixpoU2lRY3vW9WBxv/g9+S1cCj7AmjCW9avkbehpdZV6YZoCcLDilLEk3kcw8DxY/NcPKaam6z6PVB2f6kKPgPRBf4G0g9tCIq1gAsEXBlTIhAXhg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(346002)(376002)(396003)(36840700001)(46966006)(40470700004)(26005)(82740400003)(356005)(40480700001)(4326008)(81166007)(8676002)(70206006)(6666004)(54906003)(2906002)(41300700001)(7696005)(70586007)(82310400005)(186003)(36860700001)(16526019)(478600001)(86362001)(83380400001)(40460700003)(2616005)(110136005)(8936002)(426003)(336012)(1076003)(36756003)(316002)(5660300002)(47076005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 17:42:43.9344
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed63706b-36f2-40fb-1da5-08da70c093c0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT049.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4859
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

