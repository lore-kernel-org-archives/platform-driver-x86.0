Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38CFFCCA483
	for <platform-driver-x86@archiver.kernel.org>; Tue, 12 Jul 2022 15:03:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233430AbiGLPDH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 12 Jul 2022 11:03:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233872AbiGLPBz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 12 Jul 2022 11:01:55 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2078.outbound.protection.outlook.com [40.107.237.78])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03749BF546
        for <platform-driver-x86@vger.kernel.org>; Tue, 12 Jul 2022 07:59:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZvkZ4emN5ZGaaC5/TKs/UIQJ3NxiY2lualQ7A+z5heLoF8CpjDaGdWXi9fKDGh3LjuPsjJ3f6VSGkxrWRVSF2AcSxGamyLWf4oztN5jBvlFWmHP3B8x81z4O+bBDuamg6b6N5JEXH17vmQua0WMBgSTWmowSjEcQ9nG0TAzABCgLAMda2u2EDuYtWiF+XGxOr4BXj5J6wHoltS42Rnw42iZyHQS3ERNCJzUVa0vC/qgDlgqdnzJb7uuJ5L5qVJZmJSSUaBfsvuBrgQ24JUqnDkiAxrTURSwLR2koGi4wHZrsJ/h2KWpC8shx9+dIKsFpTO8pnZg24buQxYEJ8kUW4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tHhSBz5SdwkYK0VV0i8rLBPR4u05xqwZ4+x4DYojKbw=;
 b=VrnPWJH9GGkAeiakDVpw0g3rAuSkJA8kk6SLLEdj0e9HVh1/nO+qg6oCpWGYdOr3BW2E7N9YFiin9VcwCGGSM+wnAJ+qPybqvnj13oMhc7OEmUwGR0/eSxgRZGBi4jNezdSmrd2iciHyYAVa3FrIxGioZ6qip7dkA3Y8EWzQTuSRG/SPLEZwO3TNEmZeajP3rYKLmKHGAg59gOdNxF5SSKbj19sQ5YPZAiyO+uDSax2vyGeDg6UdoeDeV6S1LXVe2fOXt3sBarSqHAYAGwtpbydB3NwrGbuDkZR57RbNKMMcyyIXDFpeynMJLpDIH4Ow6AS5qNihlXIQLZlMRaplpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tHhSBz5SdwkYK0VV0i8rLBPR4u05xqwZ4+x4DYojKbw=;
 b=DR1mgCsg850f7Jun5sDDsceVJ1V/npAQvcFFsYiZrwjJP7tMvZjxRJqjlmTJPoWwAIg8DlvgUtApVZNkpPhRAkC1wC7/Y738yAempTg8dLK4isW9Y7PdCitiDiNepVgC7WYKTQBlkmJ5MHLcARJ08sK7/ONpBDJONyMGbAEwfxo=
Received: from BN8PR16CA0005.namprd16.prod.outlook.com (2603:10b6:408:4c::18)
 by DM8PR12MB5397.namprd12.prod.outlook.com (2603:10b6:8:38::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.16; Tue, 12 Jul 2022 14:59:36 +0000
Received: from BN8NAM11FT024.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:4c:cafe::6f) by BN8PR16CA0005.outlook.office365.com
 (2603:10b6:408:4c::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26 via Frontend
 Transport; Tue, 12 Jul 2022 14:59:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT024.mail.protection.outlook.com (10.13.177.38) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5417.15 via Frontend Transport; Tue, 12 Jul 2022 14:59:35 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 12 Jul
 2022 09:59:33 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v1 03/15] platform/x86/amd/pmf: Add support for PMF APCI layer
Date:   Tue, 12 Jul 2022 20:28:35 +0530
Message-ID: <20220712145847.3438544-4-Shyam-sundar.S-k@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: fc00b1fa-1327-446d-8fcc-08da641722f1
X-MS-TrafficTypeDiagnostic: DM8PR12MB5397:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /rNKVSkBUKV7TdZUCQqZB/nJ9klUp0Z+fLxxtxwm3nGbECYeGswRkn8XL628QdGFVs36eDQDS/R5nRfWefKC7KeZFORQ9tQxhtkQL5GSg6RiXcuPkCZK7zhEqqbT0sYT0fUINnUDKLLOTOr3etfmxyMwIb98duu+RI+xqI6Xp617qbt7Wz9mxKOyhoysNkv+eKK9wupqbVMeHrVRKpZbuh+WqCU27VPfgwpR6+PiQvouAqnoe/5p0f1ItOIdxCT+cKh2kFY5kLYiyZ79XWOh21pFLAHUG9+36WVfWzHjePOnQW1MjwvN7FJqiHu8ghuddTyNU7kIjlU+Zk7t7zakXsEJlUax76cRaaroL9CdgoJEZK6TheH8pwFPCNvJDVg0z12pFotnhoU6AavTQZSu1j4Vw0q7gGHKFWybw7rR7o47jhGQio1WtvxkmtTrC1uJ3scY6Zbu6ZEXFbXpMSkE9lRhY5M30HYb84f10bxbHnRvHHVhwmHUwvCEOx3HA315Z4SQFW7DkaGiO97UWjA4vSHrsUdwlAwuTd1YP4wmDhyVZ0PVv/SAGKfOkw/IP61NO83nZg4QBf0mA7RFslar9ARTP8tInwYUhMYvytnO870+9fZWQex6lHavrLY5Uy96+aOEacFxSBjdX/Fnf+TML0c/fx1iiXpb+0A1txlrnh56my3XLsn7NgKVX9nc4WZ3cpQUK/8C8q59QfIpHYx/OvrdH/Ol/I8a63q6phBjVsXr9k+oX9dzK37xe+9Fq2qLz2761gGUiKqZNserSxPnpjoyv8U/+Ep5AbMhSl5+jgiiSbkpeGdBvFuPQYuRrV+qI1EGorsFCG5ZiyYAO35RX/KrxRRB7vuNG2st/iKpRgg=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(346002)(376002)(396003)(40470700004)(36840700001)(46966006)(186003)(2616005)(26005)(47076005)(70206006)(426003)(40460700003)(1076003)(16526019)(81166007)(7696005)(336012)(82740400003)(356005)(86362001)(40480700001)(82310400005)(36860700001)(478600001)(70586007)(5660300002)(83380400001)(54906003)(8936002)(110136005)(36756003)(41300700001)(2906002)(4326008)(8676002)(316002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 14:59:35.8847
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc00b1fa-1327-446d-8fcc-08da641722f1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT024.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5397
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
 drivers/platform/x86/amd/pmf/acpi.c   | 188 ++++++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/core.c   |   1 +
 drivers/platform/x86/amd/pmf/pmf.h    |  32 +++++
 4 files changed, 222 insertions(+), 1 deletion(-)
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
index 000000000000..addcaae5675c
--- /dev/null
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -0,0 +1,188 @@
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
+static void apmf_if_parse_functions(struct apmf_if_functions *func, u32 mask)
+{
+	func->system_params = mask & APMF_FUNC_GET_SYS_PARAMS;
+}
+
+static int apmf_if_verify_interface(struct amd_pmf_dev *pdev, struct apmf_if *ampf_if)
+{
+	struct apmf_verify_interface output;
+	union acpi_object *info;
+	size_t size;
+	int err = 0;
+
+	info = apmf_if_call(ampf_if, APMF_FUNC_VERIFY_INTERFACE, NULL);
+	if (!info)
+		return -EIO;
+
+	size = *(u16 *)info->buffer.pointer;
+
+	if (size < sizeof(output)) {
+		dev_err(pdev->dev, "buffer too small %zu\n", size);
+		err = -EINVAL;
+		goto out;
+	}
+
+	size = min(sizeof(output), size);
+	memset(&output, 0, sizeof(output));
+	memcpy(&output, info->buffer.pointer, size);
+	apmf_if_parse_functions(&ampf_if->func, output.supported_functions);
+	supported_func = output.supported_functions;
+	dev_dbg(pdev->dev, "supported functions:0x%x notifications:0x%x\n",
+		output.supported_functions, output.notification_mask);
+
+out:
+	kfree(info);
+	return err;
+}
+
+int is_apmf_func_supported(unsigned long index)
+{
+	/* If bit-n is set, that indicates function n+1 is supported */
+	return ((supported_func & (1 << (index - 1))) != 0);
+}
+
+static int apmf_get_system_params(struct apmf_if *ampf_if)
+{
+	struct apmf_system_params params;
+	union acpi_object *info;
+	size_t size;
+	int err = 0;
+
+	info = apmf_if_call(ampf_if, APMF_FUNC_GET_SYS_PARAMS, NULL);
+	if (!info) {
+		err = -EIO;
+		goto out;
+	}
+
+	size = *(u16 *)info->buffer.pointer;
+
+	if (size < sizeof(params)) {
+		pr_err("PMF: buffer too small %zu\n", size);
+		err = -EINVAL;
+		goto out;
+	}
+
+	size = min(sizeof(params), size);
+	memset(&params, 0, sizeof(params));
+	memcpy(&params, info->buffer.pointer, size);
+
+	pr_debug("PMF: system params mask:0x%x flags:0x%x cmd_code:0x%x\n",
+		 params.valid_mask,
+		 params.flags,
+		 params.command_code);
+	params.flags = params.flags & params.valid_mask;
+
+out:
+	kfree(info);
+	return err;
+}
+
+static acpi_handle apmf_if_probe_handle(void)
+{
+	acpi_handle handle = NULL;
+	char acpi_method_name[255] = { 0 };
+	struct acpi_buffer buffer = { sizeof(acpi_method_name), acpi_method_name };
+	acpi_status status;
+
+	status = acpi_get_handle(NULL, (acpi_string) APMF_METHOD, &handle);
+	if (ACPI_SUCCESS(status))
+		goto out;
+
+	pr_err("PMF: APMF handle not found\n");
+	return NULL;
+
+out:
+	acpi_get_name(handle, ACPI_FULL_PATHNAME, &buffer);
+	pr_debug("PMF: APMF handle %s found\n", acpi_method_name);
+	return handle;
+}
+
+int apmf_acpi_init(struct amd_pmf_dev *pmf_dev)
+{
+	acpi_handle apmf_if_handle;
+	struct apmf_if *apmf_if;
+	int ret;
+
+	apmf_if_handle = apmf_if_probe_handle();
+	if (!apmf_if_handle)
+		goto out;
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
+	if (apmf_if->func.system_params) {
+		ret = apmf_get_system_params(apmf_if);
+		if (ret) {
+			dev_err(pmf_dev->dev, "APMF apmf_get_system_params failed :%d\n", ret);
+			kfree(apmf_if);
+			goto out;
+		}
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
index ab773aa5a6e1..40f038eb6197 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -10,6 +10,12 @@
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
@@ -29,6 +35,30 @@
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
@@ -38,10 +68,12 @@ struct amd_pmf_dev {
 	u32 hi;
 	u32 low;
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

