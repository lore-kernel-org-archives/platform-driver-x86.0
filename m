Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012042.outbound.protection.outlook.com [40.107.209.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31428370AE3
	for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jul 2026 17:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783705368; cv=fail; b=nvbx2SQgYP/jn7qAUXqyo5ePSi7GfIxuoUZwaxREUZGfOiNv9YG4OIXErpPcjx+hGv03jti/6Rvul9e/IqbVkwQJSwCwqkMRV3YMg4xO67wHleCcY93E4ZFMWh1HDMY+b5JmZ3G5/TntvoOfvHYMffOeAsG2Qc/UdE8YIA901u0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783705368; c=relaxed/simple;
	bh=rP7XnFJhOAcCLEt5PhQ2oLowBVHhyKiilT9+p/zZCEQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Na5GocunsnhqMQ5PCJ7KVuMJ4sapl5NmPp4mxTBy36Rrrx30CSQw9Q9dU6C//1gokJ7Br6S24dO1IgmA/37kMY5lB2l/7x4GivUr8GiqVVDdjhgfJAkLqRYIKuRdczhAzNOw9b3Nxwc+mdyVXY0q1zMsui0CAomXdfJsayPahEo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=3vatSIxQ; arc=fail smtp.client-ip=40.107.209.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="3vatSIxQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rYW16Fu90TgUCqjt8UKlu6EOz3WG4HPfG1SAB/dzS47JoWeAJBHfqNvTk4UdbOjaW+Lh9Fw/kGdx/yI/yDNTyZHEyLeURckVTxBeQ8mXbI3tKhFx/jMhLvUcZ0Sa+QykomufboPFYNs1uqy4E82V/tZSpzO2aXE1uwwgAxfbPL9+KbpGzXYFt7UlK94h1T+4KIZkI/jhcu7bfdE/OwG2O9HE1NAt0g61NOU0ex6jD/DNPEKBhwtedtN4RuC3U9v/lo/DSVcotxvHDYsY6bFyhVd8ZPTSX0zkyOoMSzdD3hROS1kT85GRlQhxKQnkcb9hODtHHyfDIzeT0SUUJuMIuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rPmk32St9lCjZ+ERkCEXarSPThoXqi7dvewNr1U6xdY=;
 b=fMO1R85+t9jSAMV06OjLM3xARm2fCTz0UIMvHWpeAtTeTVsRZaYS6IAyZE/WFM4CnFBMaqk0f1MXGeiOYGgQLxMauq/C2YG+zW2N1S6Y20NTNDi++xjbDcxvIGiSxs9P67B+CgnmKBuHRJ25FyELJFczPZDTyvS2hIwkV3ebjLDw3u1Pd18XbisoIP6iQI1/ggX4nkLJiUbgzpv8KJYq3Ssmt/c3jRlRAsK/h9e0JV7MxJhuyYxcmHAENT6IH07qoe569luCUXdz6uBtI5QL2nPT5JQDccfM1PM6QMC/fxNn1wIsEe/BDqGjzq9cZFLeBXtEz6VfWztpaxHiLiTVdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rPmk32St9lCjZ+ERkCEXarSPThoXqi7dvewNr1U6xdY=;
 b=3vatSIxQuuOVmLVY2drAcAQJBRxZreZtYHalpw47l2SuUg8w1CVQEomTBcL4PtMX5zoqqzyEBy9QXHdoNFAb/1ZU+/TVDbnDsoBgySVakgNY4FJCyPO6zglaSFOUQhH4DivyDPCz2u4l8GRr6U0rHn6ai/lxWs9d6t0SdLSnAKY=
Received: from SJ0PR03CA0096.namprd03.prod.outlook.com (2603:10b6:a03:333::11)
 by MN0PR12MB6032.namprd12.prod.outlook.com (2603:10b6:208:3cc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.16; Fri, 10 Jul
 2026 17:42:41 +0000
Received: from SJ1PEPF000026C7.namprd04.prod.outlook.com
 (2603:10b6:a03:333:cafe::69) by SJ0PR03CA0096.outlook.office365.com
 (2603:10b6:a03:333::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Fri,
 10 Jul 2026 17:42:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000026C7.mail.protection.outlook.com (10.167.244.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 10 Jul 2026 17:42:40 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 10 Jul
 2026 12:42:37 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 1/5] platform/x86/amd/pmf: Use per-SoC smu_regs struct for SMU mailbox registers
Date: Fri, 10 Jul 2026 23:12:15 +0530
Message-ID: <20260710174219.2522269-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260710174219.2522269-1-Shyam-sundar.S-k@amd.com>
References: <20260710174219.2522269-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C7:EE_|MN0PR12MB6032:EE_
X-MS-Office365-Filtering-Correlation-Id: 483b7c81-70b7-49c0-fc9d-08dedeaaa3ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|23010399003|18002099003|22082099003|11063799006|6133799003|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info:
	ya4xwoKzM730k0Sk7xPBFbLt75Y6DTQ+I52X2qfNAuNbdCrFmDOZAbzBKWBgcBV4/A0kGZa+kTKdKBi1Rf3fdpMFsYyhpaGCfeknvkIOEd7GfKIGHkIoUhrwnMqegSyrrxzR10uQu5XThcG4BYg3x2nZX9fz2cnumDqEUWQiLhkLQnweGvgxEhXmJ9xksRDk/k8r98drnhiAaFIJVa5/zVDE3pCW6GjIWAFwtqydfNeXll88Y7StFHwppctJH+bRJZc5GewFuZOg6aD+ttlQrIpZJZItX2kPJQKGgETjZUQ6hehLZg0meNSv2jfUosrAnult6BLN0jWfzZaOytQYMAxLg4ebXNtSKZQhGh0RUaHnsL989js2IIgS+fdMe19kjgfQk3TiGKsBBhkdn2lwbc0tCX7xt0S2lxUlHtAE7Wu+RmJz68xTgxAHz3XGxuOslQSTZjnoFUwMhtVKLyjGlTacQRK3aycBeeN6z7lNHUohgRiabGNJuzOQx+nfKN9g0lyE7e/V6XqHXNLEwI4cElL0OdtwoGe2SsLhf7XZVuMyoQPWympBGJa7jr7Acic+E7igKmAbv4zBPKMbgye+6GPjOgunsFGG9C326n4oC8JlrV78FPA+mTD2JUzG5/y37pJ+EwGC1Npg6d3vQzWTUQ0rfgYY5BP/1ZY/pKbNA71wx4MY9T5MKOANHHDdEdqF72pNAaUdm8iTu+EEhWDpgw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(23010399003)(18002099003)(22082099003)(11063799006)(6133799003)(3023799007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	SnO5pnEPnUCa9CYX07pjgtev9gucEmNwzQyJbV9/6jeNjwD0QAbCbGgTlabJEOXG3EXRWTl5iM06miCItEf4SdE71X2uiTRaDF4iZAWzmGiVVQamSeu7lGza5S5s60/lDAZJ6FdMrt+usdBEurG3GbJjF9ICp0iMP1fYIUjiqeCOjebv2SoUI0i7lz3FtP2MlYBiWr3mv+erb6tzM/z9tkJEsKfM0VMNI977Q9ofr/HXi1BXtZIhMFY8E4vAkpNoYE8pCQgDz7cNUGIyTXS7cOfQnMDEhpRgviMY31whjQ2WTPbwXQQGKSqNblhtGhd862y51sGrafk+HPYhUg+G7q48p/aG6pWBt2xfJ+rbj9nvLBmnFV31/9Nue2ml7MB7PaWWqUY+y4SvXH2D5e06RDmHtjBMh8/k56mNCkim4+BCCv1zA6Y8CBkPIdQDECYd
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 17:42:40.3878
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 483b7c81-70b7-49c0-fc9d-08dedeaaa3ae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6032

Different AMD platforms use varying SMU register layouts for PMF-SMU
mailbox communication. The register offsets are currently hardcoded as
AMD_PMF_REGISTER_MESSAGE, AMD_PMF_REGISTER_RESPONSE and
AMD_PMF_REGISTER_ARGUMENT directly in amd_pmf_send_cmd() and
amd_pmf_dump_registers(), making it difficult to support platforms that
use a different mailbox register layout without scattering per-platform
conditionals across the send path.

Introduce struct amd_pmf_smu_regs to capture the SoC-specific SMU
mailbox register offsets (msg_reg, resp_reg, arg_reg[]) and add a
pointer to it in struct amd_pmf_dev. RMB, PS, 1AH_M20H and 1AH_M60H
all share the same legacy register layout and point to a single shared
amd_pmf_legacy_smu_regs instance, avoiding redundant struct definitions.

Convert the pmf_pci_ids[] table from PCI_DEVICE() to PCI_DEVICE_DATA(),
embedding the smu_regs pointer directly as driver_data. Introduce
amd_pmf_get_smu_mb_offset() which resolves the matching PCI entry via
pci_match_id() at probe time and assigns driver_data to dev->smu_regs.

Update all SMU register accesses in amd_pmf_send_cmd() and
amd_pmf_dump_registers() to go through dev->smu_regs. Remove the
hardcoded register offset references from the send path. New platform
support requires only a new smu_regs instance and a corresponding
PCI_DEVICE_DATA() entry.

No functional changes for existing platforms.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/core.c | 51 +++++++++++++++++++++--------
 drivers/platform/x86/amd/pmf/pmf.h  | 12 +++++++
 2 files changed, 50 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index 58d86b4c2828..1826fc64bf56 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -176,13 +176,13 @@ static void __maybe_unused amd_pmf_dump_registers(struct amd_pmf_dev *dev)
 {
 	u32 value;
 
-	value = amd_pmf_reg_read(dev, AMD_PMF_REGISTER_RESPONSE);
+	value = amd_pmf_reg_read(dev, dev->smu_regs->resp_reg);
 	dev_dbg(dev->dev, "AMD_PMF_REGISTER_RESPONSE:%x\n", value);
 
-	value = amd_pmf_reg_read(dev, AMD_PMF_REGISTER_ARGUMENT);
+	value = amd_pmf_reg_read(dev, dev->smu_regs->arg_reg);
 	dev_dbg(dev->dev, "AMD_PMF_REGISTER_ARGUMENT:%d\n", value);
 
-	value = amd_pmf_reg_read(dev, AMD_PMF_REGISTER_MESSAGE);
+	value = amd_pmf_reg_read(dev, dev->smu_regs->msg_reg);
 	dev_dbg(dev->dev, "AMD_PMF_REGISTER_MESSAGE:%x\n", value);
 }
 
@@ -208,7 +208,7 @@ int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32
 	guard(mutex)(&dev->lock);
 
 	/* Wait until we get a valid response */
-	rc = readx_poll_timeout(ioread32, dev->regbase + AMD_PMF_REGISTER_RESPONSE,
+	rc = readx_poll_timeout(ioread32, dev->regbase + dev->smu_regs->resp_reg,
 				val, val != 0, PMF_MSG_DELAY_MIN_US,
 				PMF_MSG_DELAY_MIN_US * RESPONSE_REGISTER_LOOP_MAX);
 	if (rc) {
@@ -217,16 +217,16 @@ int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32
 	}
 
 	/* Write zero to response register */
-	amd_pmf_reg_write(dev, AMD_PMF_REGISTER_RESPONSE, 0);
+	amd_pmf_reg_write(dev, dev->smu_regs->resp_reg, 0);
 
 	/* Write argument into argument register */
-	amd_pmf_reg_write(dev, AMD_PMF_REGISTER_ARGUMENT, arg);
+	amd_pmf_reg_write(dev, dev->smu_regs->arg_reg, arg);
 
 	/* Write message ID to message ID register */
-	amd_pmf_reg_write(dev, AMD_PMF_REGISTER_MESSAGE, message);
+	amd_pmf_reg_write(dev, dev->smu_regs->msg_reg, message);
 
 	/* Wait until we get a valid response */
-	rc = readx_poll_timeout(ioread32, dev->regbase + AMD_PMF_REGISTER_RESPONSE,
+	rc = readx_poll_timeout(ioread32, dev->regbase + dev->smu_regs->resp_reg,
 				val, val != 0, PMF_MSG_DELAY_MIN_US,
 				PMF_MSG_DELAY_MIN_US * RESPONSE_REGISTER_LOOP_MAX);
 	if (rc) {
@@ -239,7 +239,7 @@ int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32
 		if (get) {
 			/* PMFW may take longer time to return back the data */
 			usleep_range(DELAY_MIN_US, 10 * DELAY_MAX_US);
-			*data = amd_pmf_reg_read(dev, AMD_PMF_REGISTER_ARGUMENT);
+			*data = amd_pmf_reg_read(dev, dev->smu_regs->arg_reg);
 		}
 		break;
 	case AMD_PMF_RESULT_CMD_REJECT_BUSY:
@@ -262,11 +262,18 @@ int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32
 	return rc;
 }
 
+/* RMB, PS, 1AH_M20H and 1AH_M60H share the same legacy SMU mailbox registers */
+static const struct amd_pmf_smu_regs amd_pmf_legacy_smu_regs = {
+	.msg_reg	= AMD_PMF_REGISTER_MESSAGE,
+	.resp_reg	= AMD_PMF_REGISTER_RESPONSE,
+	.arg_reg	= AMD_PMF_REGISTER_ARGUMENT,
+};
+
 static const struct pci_device_id pmf_pci_ids[] = {
-	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_RMB) },
-	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_PS) },
-	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_1AH_M20H_ROOT) },
-	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_1AH_M60H_ROOT) },
+	{ PCI_DEVICE_DATA(AMD, CPU_ID_RMB,    &amd_pmf_legacy_smu_regs) },
+	{ PCI_DEVICE_DATA(AMD, CPU_ID_PS,     &amd_pmf_legacy_smu_regs) },
+	{ PCI_DEVICE_DATA(AMD, 1AH_M20H_ROOT, &amd_pmf_legacy_smu_regs) },
+	{ PCI_DEVICE_DATA(AMD, 1AH_M60H_ROOT, &amd_pmf_legacy_smu_regs) },
 	{ }
 };
 
@@ -536,6 +543,19 @@ static void amd_pmf_deinit_features(struct amd_pmf_dev *dev)
 	}
 }
 
+static int amd_pmf_get_smu_mb_offset(struct amd_pmf_dev *pdev, struct pci_dev *rdev)
+{
+	const struct pci_device_id *id;
+
+	id = pci_match_id(pmf_pci_ids, rdev);
+	if (!id)
+		return -ENODEV;
+
+	pdev->smu_regs = (const struct amd_pmf_smu_regs *)id->driver_data;
+
+	return 0;
+}
+
 static const struct acpi_device_id amd_pmf_acpi_ids[] = {
 	{"AMDI0100", 0x100},
 	{"AMDI0102", 0},
@@ -624,6 +644,11 @@ static int amd_pmf_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
+	/* Populate smu_regs with SoC-specific SMU mailbox register offsets */
+	err = amd_pmf_get_smu_mb_offset(dev, rdev);
+	if (err)
+		return err;
+
 	apmf_acpi_init(dev);
 	platform_set_drvdata(pdev, dev);
 	amd_pmf_dbgfs_register(dev);
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 752fa5dd2267..7a8fd9d399de 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -29,6 +29,10 @@
 #define PCI_DEVICE_ID_AMD_1AH_M20H_ROOT 0x1507
 #define PCI_DEVICE_ID_AMD_1AH_M60H_ROOT 0x1122
 
+/* Aliases required by PCI_DEVICE_DATA() macro naming convention */
+#define PCI_DEVICE_ID_AMD_CPU_ID_RMB	AMD_CPU_ID_RMB
+#define PCI_DEVICE_ID_AMD_CPU_ID_PS	AMD_CPU_ID_PS
+
 struct cookie_header {
 	u32 sign;
 	u32 length;
@@ -392,6 +396,13 @@ struct pmf_cbi_ring_buffer {
 	int tail;
 };
 
+/* SoC-specific SMU mailbox register offsets */
+struct amd_pmf_smu_regs {
+	u32 msg_reg;
+	u32 resp_reg;
+	u32 arg_reg;
+};
+
 struct amd_pmf_dev {
 	void __iomem *regbase;
 	void __iomem *smu_virt_addr;
@@ -444,6 +455,7 @@ struct amd_pmf_dev {
 	struct mutex cbi_mutex;		     /* Protects ring buffer access */
 	struct mutex metrics_mutex;
 	u32 bios_output[BIOS_OUTPUT_MAX];
+	const struct amd_pmf_smu_regs *smu_regs;
 };
 
 struct apmf_sps_prop_granular_v2 {
-- 
2.34.1

