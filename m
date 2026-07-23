Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012057.outbound.protection.outlook.com [40.107.209.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5B946D2BD
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Jul 2026 11:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784805375; cv=fail; b=q7iqO+jt7DrOOOlx/jl7SJRt3R+NEvI2odq1K+Lk0aY6AOdY7vZZyH1TNWO1HBnv3WhsL7YDdjys8dAoMmrEqGTZE2Ww6McmJadjcAbjx64RpMHyYKWdn/umKJgAXTGwrs0d2OuMRZHsceL3vuldO2Iz+Sleo0ix1u/AiDvcims=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784805375; c=relaxed/simple;
	bh=oSKzn3eGoTt6cao1cA4xr1zuhZcRN2ZpDvoihy992gM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PflER8KBoXEKbHNETSxSAXjFoiJpWh3lCt25OMRfZxOOuWayNLiuvw5O+HTzOYGzd1Cm2TtaZtmn5dzBbk6Fcv78MtYeWD4sA1PJJuQ51cBfrlCltBLfBT5UwNkP8Kce51nv8CRY4vEb6lCwHHxu1QoSaYGbInn/VT6AmHm8QCA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=N50gizE+; arc=fail smtp.client-ip=40.107.209.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="N50gizE+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XopgtKRMZH6qTkF0WO82vP1r/vFQIClLkf4mauHTMXsypllDgZsD5hAi3Il/yqqGjVXtm190oLhV8q04YqrbAY6UJrTY61c3qE9SYJkg2jAC5l2AMrhdt9L2NEtN47t02sq8E0lZ5YY/k3G7B8qSOdZnA/1lYYKcbD1p1pJfNCm90hFeWjkgwq+SIlMYsvpCHhwIMOZC96aTPFeLPe2ersDqh+TzIYf5BDfDoQ4VVb130l00C0fnbJbf+DHWLPyCCp0Yq27JWzQh6pV5B/2jXK0n6Il0X/2mPUZ+omiQh7AV4n9frdabPj5Ryqug8mW26WO8A1hl9rCpufCgSiJJpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0mtqJmsmd2q8E4Fmf2E5wp4PfroThY+eoplS/CnMQfQ=;
 b=I3AOD/Yeeqx47wtF+49QvBiL29IWSSXsxxtz06ujpq94iDOmkQ6a7cg7//JE5+aJ91S0s2hJhgeJGIDjA+4fnYUe6tFrMojcCUvDg6rJuO5VXLXz6k/aHwWdCM6e8wjSHmKpvY5AS8AkiJZrjsiQnRZOmdgSyTqPobutOh4gexOYAqIT4GvqXexb8EB7akcaJsuM/ikV3MFPFbIZYAu6dmzwVnk6LPFEWfrcH4CnAQjCANIcItquN7WIab3Gki5v42IPA52+6lLdVr61O9ODVeOHf3ThwGCLk9QLTsUI+bEo4phAQ6mvweDqFEV/tDi+HEg9MdE82XHsLGorYloWIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0mtqJmsmd2q8E4Fmf2E5wp4PfroThY+eoplS/CnMQfQ=;
 b=N50gizE+1FRAkJ5NoJ0b9sSlvvKJGL5HwgPdtgNQ1+MJGaVALvm+bcXceyXQWJoOAHbZjnnzGfmEtoq8rwti5681C9PgQkD1jsyV2tcjqkHtC1t5wzc6d8xlbT5t+fsatu1LvEWyhOyRmP//IDVmQDfptkHE6YW4909Dr28dLRg=
Received: from BY3PR10CA0023.namprd10.prod.outlook.com (2603:10b6:a03:255::28)
 by PH7PR12MB8156.namprd12.prod.outlook.com (2603:10b6:510:2b5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Thu, 23 Jul
 2026 11:16:05 +0000
Received: from SJ1PEPF00001CE8.namprd03.prod.outlook.com
 (2603:10b6:a03:255:cafe::85) by BY3PR10CA0023.outlook.office365.com
 (2603:10b6:a03:255::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Thu,
 23 Jul 2026 11:16:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CE8.mail.protection.outlook.com (10.167.242.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Thu, 23 Jul 2026 11:16:05 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 23 Jul
 2026 06:16:02 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Mario Limonciello <superm1@kernel.org>
Subject: [PATCH v3 1/7] platform/x86/amd/pmf: Use per-SoC smu_regs struct for SMU mailbox registers
Date: Thu, 23 Jul 2026 16:45:28 +0530
Message-ID: <20260723111534.1940925-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260723111534.1940925-1-Shyam-sundar.S-k@amd.com>
References: <20260723111534.1940925-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE8:EE_|PH7PR12MB8156:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cd743ed-dc2d-4f6b-0fca-08dee8abc98d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|23010399003|36860700016|1800799024|6133799003|18002099003|22082099003|11063799006|56012099006|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	kwpkCmE5IZZdH6DR4wMjzrgQyKW+swTlgjEtUNpGe/Cj91IUhCHB/QcAJ2e6x5LOuR/elqu7juk8Jmh1DVtDQ7gk5jHlPrlGFgCkD+9swakWQ7zbIDoh6EJstLTJS0MOrUKqeIduWOZTqWzQk1I47cWyRLj2Nj9l8RRyujccNpKNGSNAOS/ia5zjVw5GUPy1XHtj7d1Mdrz9QPzf1DRbKOczN77Hfn1jdQXlx8s6/v8bS87tWeUgMrEhDwQ3iYHXXyLoFO7QRcsRHLbhCJoviTRpIwNfjY0EgfPIPKtRWCuqCZjeOa76pMU7yWnfQ3275d0Pmk+xTzL3w1MvN1jYq+OncqGJ0M5HCqzCz3vwgahBmzKPVOsHvdUainsJ3HlwQ3DVRd2BDMO98cLEof0kBWbgSsNrjtsvKIzwZQhZnMEhpfHZI1F0ohK/v6JN8kMcVzIGia7VqCgfCt5wnZKck5XJDoq6gcNmzdsAPpy/xXWqY0yLMcov3SfgKzouf/S+mgTgq/VcNxXllTkkohnDmRvSkgtrNcmi/hDtotZUAnCZfui1mCuC4S2EQhmMwQp9u30PZHMVkBHlgFCi6BlfkqhCgvVphMGEUeWThLLpWGPTDIdcdH/sPu1+Fw3jY+CpI95s+fCgaBMVbDwYrZzaQxvPotu+87mxRsa08eDyuNIzaXd/p6s9RwSfKHr/4sotG0ZWCo7V4pH1plm8BPIlQQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(23010399003)(36860700016)(1800799024)(6133799003)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4MiiZOA99qppInTCo2Ps1PK4tfkTSQiLJ9lvoU5/6wFDrMIdkSR31CdJy5fPai9l20TjJ8tj2a+mCgpGnLVsCvZfMyh8TGxBPJN6RbfY1KI3zVCcoSwsCTJNQxBImpaGLzS7pFNoAly4lzp9gSnEnZr0+OrJypPaVBaD61iD1Lu2ToPiWnGEumM3WpOh6I0QM79FuAkXxTH9LN0n2UsWtJPstXN1k63JAcC+cJgy5ArML6e2KMutPGFs8e2sw1eHlV6QFwZhDZ1/+mQc9kj2mOenv0VQnkUYiKWP6i20qlD4KZHOOC0AZ+ITje66cPC9aVfuh+CVICUae7GRd48APCOGe9pMNU0QDnc+V5tZKyZPRZgQ961XCk2ET9U/4pqBcSwDANM+CrNV5dWoqPGeoi1hK/VsidmZik3m30VaC/tKiQICQwtLRmgBG0soYjIS
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 11:16:05.0423
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cd743ed-dc2d-4f6b-0fca-08dee8abc98d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8156

Different AMD platforms use varying SMU register layouts for PMF-SMU
mailbox communication. The register offsets are currently hardcoded as
AMD_PMF_REGISTER_MESSAGE, AMD_PMF_REGISTER_RESPONSE and
AMD_PMF_REGISTER_ARGUMENT directly in amd_pmf_send_cmd() and
amd_pmf_dump_registers(), making it difficult to support platforms that
use a different mailbox register layout without scattering per-platform
conditionals across the send path.

Introduce struct amd_pmf_smu_regs to capture the SoC-specific SMU
mailbox register offsets (msg_reg, resp_reg, arg_reg) and add a
pointer to it in struct amd_pmf_dev. RMB, PS, 1AH_M20H and 1AH_M60H
all share the same legacy register layout and point to a single shared
amd_pmf_smu_regs_v1 instance, avoiding redundant struct definitions.

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

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/core.c | 51 +++++++++++++++++++++--------
 drivers/platform/x86/amd/pmf/pmf.h  | 12 +++++++
 2 files changed, 50 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index 58d86b4c2828..3018c861776b 100644
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
 
+/* RMB, PS, 1AH_M20H and 1AH_M60H share the same v1 SMU mailbox registers */
+static const struct amd_pmf_smu_regs amd_pmf_smu_regs_v1 = {
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
+	{ PCI_DEVICE_DATA(AMD, CPU_ID_RMB,    &amd_pmf_smu_regs_v1) },
+	{ PCI_DEVICE_DATA(AMD, CPU_ID_PS,     &amd_pmf_smu_regs_v1) },
+	{ PCI_DEVICE_DATA(AMD, 1AH_M20H_ROOT, &amd_pmf_smu_regs_v1) },
+	{ PCI_DEVICE_DATA(AMD, 1AH_M60H_ROOT, &amd_pmf_smu_regs_v1) },
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

