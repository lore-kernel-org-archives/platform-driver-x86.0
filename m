Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C010C00140
	for <platform-driver-x86@archiver.kernel.org>; Tue,  2 Aug 2022 15:13:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234534AbiHBPNi (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 2 Aug 2022 11:13:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbiHBPNh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 2 Aug 2022 11:13:37 -0400
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam07on2062.outbound.protection.outlook.com [40.107.212.62])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36064167CA
        for <platform-driver-x86@vger.kernel.org>; Tue,  2 Aug 2022 08:13:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ld+At1CB9kIHmk88GNqSFqBIDwoPX9+TgnxdoBdtxpncdWEEQ2peBi99m8SLUlA19pWGisNuPVURDLzQYmTEcBEG5xcBAL8PVMDRjO1dnK9hQR9CRcXUfL9cDIqmhnvk+bnd+GE/ADCjubX1fMpGWiYKt1Gtdw4vCoGTACi3d8L61PFK13+R9RpRiT5S1eac6Ze7QcQZalHABHp9ba8QFLrh4WtDNGC9Ls8H9KGN6xgV/Q6JD4wMFrs8E9SfoymaiV2oxs+UVXSq8aoS2K7KKlfF8r3Fr8YXs/HdDuxiVFIBTwLbX/wcDOmyPQaRSYb+hOFAquo4Wg+5R5at97duVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qEfp4ldm16oSN9d3efOkwmvwp8vQ4ETb0EGmM04DzVc=;
 b=crBaHhImWX+OxJbOwR+0X9pmFp/WD47YJZLWNf17rEnjZX9UPjeRa0A8UUcFLFZRoKC5bZiEWLBdGAzOt1SCsbTvrJsg6d82De/S6oE1/+r5QXHNQhv4j68jO+HeziC7Opb+Pvl56lj5fYmmtu30mctFhNBzt4ewDS2/n6U9Q6de1I/CzyzxYuW5XpGtstgBmrO9awx8jBQMX+Hwv+NepaQsErf8kdCsPwEpX/sqZovWAFZVg/zfFa2vL52e1Eknjn+s6s4rj41awwXXlmOuAvEsMbyB78SUPPQxavO+gnjekbtJ1ZI0xloFpRddqwWUgiV56gjLLMvRDaXDHSOVlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qEfp4ldm16oSN9d3efOkwmvwp8vQ4ETb0EGmM04DzVc=;
 b=B4ClFI1UcT0TRPVNhhQKPSOmjw74e66zljVysEJq8vyw5xvEqg+0jmQHHqvkPUgI3Xd0iZnzL4eUU9cq36sO4mThvJ+lQYZMjbCGz4khxa6fVZ/lX2QY94G1tiLd+uOuDAU5qYuu0UgwrJEtM1RSAsDjDMUhT51UQBbeoJj+BdA=
Received: from BN0PR04CA0166.namprd04.prod.outlook.com (2603:10b6:408:eb::21)
 by BN6PR12MB1348.namprd12.prod.outlook.com (2603:10b6:404:1f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Tue, 2 Aug
 2022 15:13:33 +0000
Received: from BN8NAM11FT036.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:eb:cafe::1) by BN0PR04CA0166.outlook.office365.com
 (2603:10b6:408:eb::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.12 via Frontend
 Transport; Tue, 2 Aug 2022 15:13:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT036.mail.protection.outlook.com (10.13.177.168) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5482.10 via Frontend Transport; Tue, 2 Aug 2022 15:13:33 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 2 Aug
 2022 10:13:30 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v4 02/11] platform/x86/amd/pmf: Add support for PMF APCI layer
Date:   Tue, 2 Aug 2022 20:41:40 +0530
Message-ID: <20220802151149.2123699-3-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220802151149.2123699-1-Shyam-sundar.S-k@amd.com>
References: <20220802151149.2123699-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d900993c-a828-4947-78bd-08da749990e4
X-MS-TrafficTypeDiagnostic: BN6PR12MB1348:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ubfqa2+QBWC3h5xJUclMVnTJsgafplJ37IAdw4eq3yTAVaVp+VLOney5IaG7rmuE+nNYl6Yh42DrgQXT/e0gKJDlmHDVi7wNEfj4GIyf3Oo6jtFuSQbqhSApCbLXZ64UBfcuv43lPER9+GyjTKlwuIlB17yDNcOPTdEDBvGcTPSLcYvip8jEekWyLolOi2OVkxlUcIy0/L/AZXd2MSLe6utldFdgztjSWa5xukPfZSJePi9iMqDBkVUjSn0rDPS7P6cT388mBCdx94gf/Hqbcc3ojHm0+j8bZFPJ/oN5PajaZyCVgkdnLcGqijJ4OqIAGZWIsUi0hGbahSXGU1/j5g149g26H9VHbIeYOqKquo90gClkC2zfQhfR+S7aZxzfOYnHkViOtSVUwSr89NEHzrulOX/AJ88ZN7guDMVWEyx4YOnbEL/hodvdNVMpFes0LsfDK7DSdWPbaz7LJaNNgjvBXJ1/6TeJGYm6ol2S6bS7W8QSD5WwgI5rLbfZV/bjcLjsBYuh+K91JVh5EVqAcMY/00qaEf43mF7UUphbnDtGHiHBwbvz0siPOxKKKDgk8Zr3BjsQk2nfk4iJ1yYFP4ssfqdP8mEvhhLheR/5qvWfMrNNb2tHSQh/ZPigsioN6p+juWTZrfB36ffMw8qVsTS5pfhNydUhCLBkapVVDuIYqEoEcYXBNN3p7tPYdgBEyYwR9C8vRVCc3tlSa4gF86JA7GJPCtNFtPt9XNKL49f2qBCTqkzjJKGjVqFHbPODVZyhAxvuSxCbeuBnwdmfigXjyHnz4oXfYSd3dQBqTjhDdUcx/tiTliJ2T1ur6v7jfg0aQvQUbRcQGZDK4ITkOg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(39860400002)(376002)(346002)(46966006)(40470700004)(36840700001)(186003)(16526019)(336012)(83380400001)(426003)(47076005)(8676002)(478600001)(54906003)(110136005)(316002)(36756003)(70586007)(70206006)(26005)(40460700003)(2906002)(4326008)(8936002)(41300700001)(6666004)(86362001)(36860700001)(356005)(82740400003)(82310400005)(81166007)(40480700001)(7696005)(2616005)(1076003)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2022 15:13:33.5432
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d900993c-a828-4947-78bd-08da749990e4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT036.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1348
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
 drivers/platform/x86/amd/pmf/acpi.c   | 151 ++++++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/core.c   |   1 +
 drivers/platform/x86/amd/pmf/pmf.h    |  23 ++++
 4 files changed, 176 insertions(+), 1 deletion(-)
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
index 000000000000..b378f9e31194
--- /dev/null
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -0,0 +1,151 @@
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
+		dev_err(pdev->dev, "APMF method:%d call failed\n", fn);
+		kfree(buffer.pointer);
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

