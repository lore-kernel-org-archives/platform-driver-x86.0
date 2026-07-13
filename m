Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010052.outbound.protection.outlook.com [52.101.201.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2EAC3537CD
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jul 2026 18:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783968010; cv=fail; b=auh6/otYtCmLfFsbZrfmuOxEx3eYjteiE4R4MWSO4dQyHlaK5ygvsxP74wwWmu9bPkqUfzVYPyIrwqdUv9x2uEct4UQPTpMQXntYk6UzCyyc40VpobEQZIFUCru7SirfaVN/rWWdA8CoSLXdYgkOdBCPL+mmN8MMGjyEnLWm+pQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783968010; c=relaxed/simple;
	bh=t4A6N73YGR+whJ+i8vwx6WcKj3CeooIO2WgomKewXM8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eM7tCdey7gXJbQmKTyLJTNXlvnhtGrVePkmGkB517cTjjTITgurKQQOKSy58+LJfttyRoT8KBpVQEDi9jFpDNbGmnQ4w6PXuHUkOb25eo175dyxajXPcEwuZbzi02Ym5SYWTc8RQrkqGA2CQ+j1CNsVD+FjJVrH4T4Z6ASbEzdk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=lkTK6r7Y; arc=fail smtp.client-ip=52.101.201.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="lkTK6r7Y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kmgqVqACoFOU3mt+i/HmdPGW1VinlXM4jIp4Y0T7WEYNygFFZcPnAzv/xBocQEW9oKBUZWlapIg/nB4HGyz3J8f0NSlsL31YwrkW9mCpn8GjEZcUi4ZHh7mc+HURuIGmdMPbNtozyod0SfmuVkCa/7U4bXBo+6ioZtt2s3R2ZpfTOn6YHpnZ1QOgMNhPwOVKKEndVv5xS4B+pVSeDQ5MWyckNfTKhpSJLw9ofthzmXdWHiHX684eOJhg0uIRlo8dos2CEcxxzgWUqolFL6TdxEuX7gNkuapBhsLSdTyie6kOoqn/757drqbHVuYqyo9M6jsWmFcStnsf8UbENtA7vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jr2/A4zk+uSnH2kSMD2QN5ENC+ti+ZZE4rjj5nF0+oI=;
 b=EuGqz7SXUmq35lGzDp4dHwBH+wG5LaPqZJqr0gwCSYn7QC0YaRIMnnbAOeCQ+51df171F1PfRojTuNs8fbruLerg3lMB5360e9UErHYZh1sNKuULeEDWhdV9tTFyUdYOMNfhpE0dR+TMgot9CywP3cP+3d/jvcD4vOpxWjy2yHaxXgyqjCTU+SNe0OngmF5UGAOv9gtis2u7hWjt/0ZmBVKzPHbzijM9qMF2vJYbSlKVe+waO3ZzV//5jksO3RcQB7nwi2drsSfh/IIWmZAQFdvQ1B/EvAaCZFBva+ttfZyAutvCAtJDPcf/7x/VuQ+WJiPdmi0PVzYKl49n/jeMQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jr2/A4zk+uSnH2kSMD2QN5ENC+ti+ZZE4rjj5nF0+oI=;
 b=lkTK6r7YrkPbbbLTzGvDLc5p5yWvKo+KOd+hHTVuSMx79YesLmbUiiBZMQl5bpmg65NsXJkNd0bzZxe33gBnoU7HZbsxmwAh2sIFVDLrNIuLBI3k0Oeshzu5g5pcsAj70rmBrxbGPi/wgAW/xdcbjBHg1kztqhDNxguDhZrSiQA=
Received: from SJ0PR13CA0154.namprd13.prod.outlook.com (2603:10b6:a03:2c7::9)
 by PH8PR12MB7423.namprd12.prod.outlook.com (2603:10b6:510:229::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Mon, 13 Jul
 2026 18:40:03 +0000
Received: from SJ1PEPF00001CE5.namprd03.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::20) by SJ0PR13CA0154.outlook.office365.com
 (2603:10b6:a03:2c7::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.9 via Frontend Transport; Mon, 13
 Jul 2026 18:40:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CE5.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Mon, 13 Jul 2026 18:40:03 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 13 Jul
 2026 13:40:00 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 1/6] platform/x86/amd/pmf: Use per-SoC smu_regs struct for SMU mailbox registers
Date: Tue, 14 Jul 2026 00:09:31 +0530
Message-ID: <20260713183936.690228-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260713183936.690228-1-Shyam-sundar.S-k@amd.com>
References: <20260713183936.690228-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE5:EE_|PH8PR12MB7423:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cbd2d52-d3dc-451c-ec7f-08dee10e26eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|36860700016|82310400026|22082099003|6133799003|18002099003|11063799006|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	PFz2ZHWw3j14xV7nhxWnfOQ84OoF9pM12cZlSCkVdVeCubuj1d6a3NeYAp0n17sgpzctRULp0oeHt7DqzSFhpmSkKDLoPEj9WZeYtwpRCq/YcbahkAXV4qOAckgqTXijdN5PnZVIJohLESqw+WmfQ2JVgTcloJvlK+X98G1B0WFRZUo0MCNJlwHQSceaFSFuY4+mqpMHRoNj3lt/HfkQqHAFW1X9XEXWBo0j9u4vbyGovbLGM31gLRJGncE4smORCHm1J3yIlP4jnUBLvUfggQuslOH7O5E9FBMgOhgrch3nEQgrXCbfhggMv2Cp67aKvZjvppUvUxh8d1C0Z+tOffvI6gyauJzw1tWEh/LnZHmFmpostMcpyjaNwD0UE/wtxsYueedfZJNFVNJ0FO2PsSNNK24nbTQMb8g9uWp9kGmuq34hD6tHyN5Fbqf0dWW5xSg9g0PXeBEiT9dI1Zf8jNjQmsTc+tPDzhEkISgj+JBaUtA3WLTGlFIIP2S4zY3RlGHiDw9hlVSDEOq9APB1LZXJLUMrHqM13mPnrzK6EuXawMGQgET7lTc8l6Edtqoa7oiGUDChEUXg8P214oKbrtqrbORZR7EyXSdcWZKFIVlyCynolzqW3+NbaynyLbmo7gBcsvm3wRn2PpqdhBhk1ljRuWdHK53lFfiKUNfs7rN3sQtl/9JVT7veCZV0w7r5rcZLBMxmo3BtJT7njkWf8A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(36860700016)(82310400026)(22082099003)(6133799003)(18002099003)(11063799006)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mkQvKq5lNcZeSBazEfNKuP/2OS/Wc86SeVjdBL2eDqIfdZLd4fMzFxFcMWuIdjURG6+srIw417fJSq8r0f3RiYNNfyhyXAvQ7T7kyLBndXkVWFYSkBZZ0nXFo/AMV6M2gi2V4bDElPy6G0RjtMHlUFaXVh0UPo0pjVbka+IfjqSe9r9Zk6MX9uOtV5YBg+qVzufCXELH2XhW9ocFzS+fucxupAcj52G0nn5PutrXM+g2v6jnGUBBpY5RUxPh1eVzBesTKFGGyj8LvWyp/kf+vlG99yMDbezHeCa4GCoH7FMEjwjA/fk3pdReJo6C3O5QOHo/qwHTO0zl1plAqbjzY8alUvuMePdXcaGGNbg9oSfiEE4TChUQ8bOU2OlPMPkPGYbHQgTXGjLR5h72yXWabLaoUgMeroaCnscnTxa21KZ0HvVGLyEvQyXe0VfTYW2J
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 18:40:03.1255
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cbd2d52-d3dc-451c-ec7f-08dee10e26eb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7423

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

