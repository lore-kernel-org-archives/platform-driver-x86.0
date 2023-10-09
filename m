Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C327EE95A91
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Oct 2023 14:48:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344513AbjJIOsi (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 9 Oct 2023 10:48:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344377AbjJIOsh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Oct 2023 10:48:37 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2084.outbound.protection.outlook.com [40.107.220.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B5F3A3
        for <platform-driver-x86@vger.kernel.org>; Mon,  9 Oct 2023 07:48:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RKZI4qOa4H3E/jNHSDldFKklgAm2ll3MyYlIoa6yycXsp9yQ12VqvOde/IUj6b1WT8Wg0SdBpYOcctf1vWpc9tXp2ZXr7GVNs3g4XqNytXTfufgPLS19o9gOUFcLoN+QXIIlPAF9PiXAAubY1agTs8SjCp5pe/wmMNaAOsHF6D8sjQicERo+VvKVURUzumEQGQ0s2z6xVwG+F+VQCJFIkJ9UySngo/Zsag6uTXqV6djS5o8Dbs8gd+XmOGMNFKqjUzqb92xPlUmZmx6OcowYBb5Jp4Hkr2QBcFPZTHz+7RbxahQnef8pC8TldF5cKa1CUJWbhzTRFcqw7dsft6WhVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FKnPi4+L7O7MyaCq+LCFt1bFpqb8FAlNnXnyXFQtxXc=;
 b=lFsFerhvZ5lnz5E++NP0pM/yz3f6TNEcTPjm+3QMyxBWJr7RX3V3BFUSYo15Sk4Wcfbo5YiERtZ95R3SB4OU+bjcgOiVr75749wC3BNMSvfApIUvN2Lf8xrIUXuucZE++Mz0kHlPu9xdlKFsLghaHu5P1/OkqwRbOogBcPd6zzzCTp7/T6461C7xXurMUwnxbuygYVXN4KOSc0vKHENrNCtLrXk6Idf8vWxF6ZmSRwYHs9XuHrthq2PFWleQadhECJFbUabg0bfyOmY9UNhVneCqr0ZxkTQYW8CCmrFmEyP8erSEEFL9TrdyJZi2CMmwnrXwdr6NjpuTTnZ1htPIkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FKnPi4+L7O7MyaCq+LCFt1bFpqb8FAlNnXnyXFQtxXc=;
 b=xsBA2owngizy5HFPp7OFjLrgCBC7TAurZ3Nn4KmDHCO0IgL+dqYMhGQ2cOEN8PXCHByaNw1Z5Lfn/UwExQwvCR1uq6GqJF+glpqxra8FghycsN0ot1x8qEsEdBxpVooy9cp5a2Qzvh4E9ryZq3VSGq+adqLxa4n7erC5Y8LM68k=
Received: from CH2PR10CA0024.namprd10.prod.outlook.com (2603:10b6:610:4c::34)
 by SJ2PR12MB8808.namprd12.prod.outlook.com (2603:10b6:a03:4d0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.37; Mon, 9 Oct
 2023 14:48:33 +0000
Received: from CY4PEPF0000EDD5.namprd03.prod.outlook.com
 (2603:10b6:610:4c:cafe::56) by CH2PR10CA0024.outlook.office365.com
 (2603:10b6:610:4c::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.37 via Frontend
 Transport; Mon, 9 Oct 2023 14:48:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD5.mail.protection.outlook.com (10.167.241.209) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.21 via Frontend Transport; Mon, 9 Oct 2023 14:48:32 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 9 Oct
 2023 09:48:29 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
        <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <mario.limonciello@amd.com>,
        <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 2/2] platform/x86/amd/pmc: Move structures to pmc header
Date:   Mon, 9 Oct 2023 20:17:48 +0530
Message-ID: <20231009144748.24054-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231009144748.24054-1-Shyam-sundar.S-k@amd.com>
References: <20231009144748.24054-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD5:EE_|SJ2PR12MB8808:EE_
X-MS-Office365-Filtering-Correlation-Id: 0507e807-455b-444f-d1ad-08dbc8d6cf06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: knbXT6xagWR3Cx3WvnJzex4dt9vx06fNG3M2Gv5xfKU/qpFOUsbToN/NGU+6EjKc9i4LwydzzmjU9Ug+cVCn8dZyySKKzGcat8VeQMbWpXDBA09EZrFI88mbuUKp2Ck3mv36E/YSDEGgzjnzNvwQXtdMj+Cjt/dUQgbX/2vBAOKp6GPZvA5I0/MjUkzDee2F9031zrKeStnFXjVTMPwFAmNFn1vvvdgTsnSPCth52r0/+xK1Ev4FPWH7gbPDBmn6S6/3f7ksZ041SSBm8d1JbD0R9ik1/L8ESL0D2DGsFh/2I8WZK9eA1172hexLop1YmTdPEcXYcgJAW2MHAgyUwkUjYc4ZVBEBQrzjbMwskql4s9nbTaoPIcLcKeAXmXLVFUQR0pfg/UKezJOXERjzhKpz8380jFM/5bOKJG/d1zJyom3iRstatWN387B5J3UhlDkWJk7XR7YVr35j+Dp3RGd08cIr2qShuAuL6BEk/16wAR/nnW+WNJ6tGoA7VHrcFec70jeHOKQIpSxi+9x0cj9n2bRJd7RFKGw22hNHbQH0hmzlpYUh1rks/2M9cGBGCBbM0fxLJpIpQQvgg+s2WIqSTooHFm3pt/sRsBlLkY7phtQLp3KC6/pNjZrmesoU33O50FEcpgWNlZcOC+WF87gstSN4OivqBlhqaQNRnJCzWpCJrnEvT09MbwmfDTabURRvGIWwW8w8o6X7GRJ42LxAuIIOOmYYBT3tkCQuQtmQp5pGN8kWnneUa+zl1VqBZp9M4ePhuwcqnD2WesbSzw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(376002)(346002)(136003)(230922051799003)(82310400011)(451199024)(1800799009)(64100799003)(186009)(46966006)(40470700004)(36840700001)(82740400003)(40460700003)(2906002)(40480700001)(41300700001)(316002)(4326008)(54906003)(8676002)(5660300002)(70206006)(81166007)(36756003)(70586007)(356005)(2616005)(1076003)(26005)(8936002)(426003)(336012)(16526019)(36860700001)(86362001)(83380400001)(47076005)(478600001)(110136005)(7696005)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 14:48:32.3537
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0507e807-455b-444f-d1ad-08dbc8d6cf06
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8808
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

As we have a separate header for amd_pmc driver, move the common strutures,
enums, and macros to the header file.

Suggested-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
based on review-ilpo, can be added on top of recent stb changes

 drivers/platform/x86/amd/pmc/pmc.c | 103 -----------------------------
 drivers/platform/x86/amd/pmc/pmc.h | 103 +++++++++++++++++++++++++++++
 2 files changed, 103 insertions(+), 103 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index 92adf4523736..943fb85af91d 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -30,109 +30,6 @@
 
 #include "pmc.h"
 
-/* SMU communication registers */
-#define AMD_PMC_REGISTER_MESSAGE	0x538
-#define AMD_PMC_REGISTER_RESPONSE	0x980
-#define AMD_PMC_REGISTER_ARGUMENT	0x9BC
-
-/* PMC Scratch Registers */
-#define AMD_PMC_SCRATCH_REG_CZN		0x94
-#define AMD_PMC_SCRATCH_REG_YC		0xD14
-
-/* STB Registers */
-#define AMD_PMC_STB_PMI_0		0x03E30600
-#define AMD_PMC_STB_S2IDLE_PREPARE	0xC6000001
-#define AMD_PMC_STB_S2IDLE_RESTORE	0xC6000002
-#define AMD_PMC_STB_S2IDLE_CHECK	0xC6000003
-#define AMD_PMC_STB_DUMMY_PC		0xC6000007
-
-/* STB S2D(Spill to DRAM) has different message port offset */
-#define AMD_S2D_REGISTER_MESSAGE	0xA20
-#define AMD_S2D_REGISTER_RESPONSE	0xA80
-#define AMD_S2D_REGISTER_ARGUMENT	0xA88
-
-/* STB Spill to DRAM Parameters */
-#define S2D_TELEMETRY_BYTES_MAX		0x100000
-#define S2D_RSVD_RAM_SPACE		0x100000
-#define S2D_TELEMETRY_DRAMBYTES_MAX	0x1000000
-
-/* STB Spill to DRAM Message Definition */
-#define STB_FORCE_FLUSH_DATA		0xCF
-
-/* Base address of SMU for mapping physical address to virtual address */
-#define AMD_PMC_MAPPING_SIZE		0x01000
-#define AMD_PMC_BASE_ADDR_OFFSET	0x10000
-#define AMD_PMC_BASE_ADDR_LO		0x13B102E8
-#define AMD_PMC_BASE_ADDR_HI		0x13B102EC
-#define AMD_PMC_BASE_ADDR_LO_MASK	GENMASK(15, 0)
-#define AMD_PMC_BASE_ADDR_HI_MASK	GENMASK(31, 20)
-
-/* SMU Response Codes */
-#define AMD_PMC_RESULT_OK                    0x01
-#define AMD_PMC_RESULT_CMD_REJECT_BUSY       0xFC
-#define AMD_PMC_RESULT_CMD_REJECT_PREREQ     0xFD
-#define AMD_PMC_RESULT_CMD_UNKNOWN           0xFE
-#define AMD_PMC_RESULT_FAILED                0xFF
-
-/* FCH SSC Registers */
-#define FCH_S0I3_ENTRY_TIME_L_OFFSET	0x30
-#define FCH_S0I3_ENTRY_TIME_H_OFFSET	0x34
-#define FCH_S0I3_EXIT_TIME_L_OFFSET	0x38
-#define FCH_S0I3_EXIT_TIME_H_OFFSET	0x3C
-#define FCH_SSC_MAPPING_SIZE		0x800
-#define FCH_BASE_PHY_ADDR_LOW		0xFED81100
-#define FCH_BASE_PHY_ADDR_HIGH		0x00000000
-
-/* SMU Message Definations */
-#define SMU_MSG_GETSMUVERSION		0x02
-#define SMU_MSG_LOG_GETDRAM_ADDR_HI	0x04
-#define SMU_MSG_LOG_GETDRAM_ADDR_LO	0x05
-#define SMU_MSG_LOG_START		0x06
-#define SMU_MSG_LOG_RESET		0x07
-#define SMU_MSG_LOG_DUMP_DATA		0x08
-#define SMU_MSG_GET_SUP_CONSTRAINTS	0x09
-/* List of supported CPU ids */
-#define AMD_CPU_ID_RV			0x15D0
-#define AMD_CPU_ID_RN			0x1630
-#define AMD_CPU_ID_PCO			AMD_CPU_ID_RV
-#define AMD_CPU_ID_CZN			AMD_CPU_ID_RN
-#define AMD_CPU_ID_YC			0x14B5
-#define AMD_CPU_ID_CB			0x14D8
-#define AMD_CPU_ID_PS			0x14E8
-#define AMD_CPU_ID_SP			0x14A4
-#define PCI_DEVICE_ID_AMD_1AH_M20H_ROOT 0x1507
-
-#define PMC_MSG_DELAY_MIN_US		50
-#define RESPONSE_REGISTER_LOOP_MAX	20000
-
-#define DELAY_MIN_US		2000
-#define DELAY_MAX_US		3000
-#define FIFO_SIZE		4096
-
-enum amd_pmc_def {
-	MSG_TEST = 0x01,
-	MSG_OS_HINT_PCO,
-	MSG_OS_HINT_RN,
-};
-
-enum s2d_arg {
-	S2D_TELEMETRY_SIZE = 0x01,
-	S2D_PHYS_ADDR_LOW,
-	S2D_PHYS_ADDR_HIGH,
-	S2D_NUM_SAMPLES,
-	S2D_DRAM_SIZE,
-};
-
-struct amd_pmc_stb_v2_data {
-	size_t size;
-	u8 data[] __counted_by(size);
-};
-
-struct amd_pmc_bit_map {
-	const char *name;
-	u32 bit_mask;
-};
-
 static const struct amd_pmc_bit_map soc15_ip_blk[] = {
 	{"DISPLAY",	BIT(0)},
 	{"CPU",		BIT(1)},
diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
index 12728eedecda..704256b07ef4 100644
--- a/drivers/platform/x86/amd/pmc/pmc.h
+++ b/drivers/platform/x86/amd/pmc/pmc.h
@@ -14,6 +14,109 @@
 #include <linux/types.h>
 #include <linux/mutex.h>
 
+/* SMU communication registers */
+#define AMD_PMC_REGISTER_MESSAGE	0x538
+#define AMD_PMC_REGISTER_RESPONSE	0x980
+#define AMD_PMC_REGISTER_ARGUMENT	0x9BC
+
+/* PMC Scratch Registers */
+#define AMD_PMC_SCRATCH_REG_CZN		0x94
+#define AMD_PMC_SCRATCH_REG_YC		0xD14
+
+/* STB Registers */
+#define AMD_PMC_STB_PMI_0		0x03E30600
+#define AMD_PMC_STB_S2IDLE_PREPARE	0xC6000001
+#define AMD_PMC_STB_S2IDLE_RESTORE	0xC6000002
+#define AMD_PMC_STB_S2IDLE_CHECK	0xC6000003
+#define AMD_PMC_STB_DUMMY_PC		0xC6000007
+
+/* STB S2D(Spill to DRAM) has different message port offset */
+#define AMD_S2D_REGISTER_MESSAGE	0xA20
+#define AMD_S2D_REGISTER_RESPONSE	0xA80
+#define AMD_S2D_REGISTER_ARGUMENT	0xA88
+
+/* STB Spill to DRAM Parameters */
+#define S2D_TELEMETRY_BYTES_MAX		0x100000
+#define S2D_RSVD_RAM_SPACE			0x100000
+#define S2D_TELEMETRY_DRAMBYTES_MAX	0x1000000
+
+/* STB Spill to DRAM Message Definition */
+#define STB_FORCE_FLUSH_DATA		0xCF
+
+/* Base address of SMU for mapping physical address to virtual address */
+#define AMD_PMC_MAPPING_SIZE		0x01000
+#define AMD_PMC_BASE_ADDR_OFFSET	0x10000
+#define AMD_PMC_BASE_ADDR_LO		0x13B102E8
+#define AMD_PMC_BASE_ADDR_HI		0x13B102EC
+#define AMD_PMC_BASE_ADDR_LO_MASK	GENMASK(15, 0)
+#define AMD_PMC_BASE_ADDR_HI_MASK	GENMASK(31, 20)
+
+/* SMU Response Codes */
+#define AMD_PMC_RESULT_OK                    0x01
+#define AMD_PMC_RESULT_CMD_REJECT_BUSY       0xFC
+#define AMD_PMC_RESULT_CMD_REJECT_PREREQ     0xFD
+#define AMD_PMC_RESULT_CMD_UNKNOWN           0xFE
+#define AMD_PMC_RESULT_FAILED                0xFF
+
+/* FCH SSC Registers */
+#define FCH_S0I3_ENTRY_TIME_L_OFFSET	0x30
+#define FCH_S0I3_ENTRY_TIME_H_OFFSET	0x34
+#define FCH_S0I3_EXIT_TIME_L_OFFSET	0x38
+#define FCH_S0I3_EXIT_TIME_H_OFFSET	0x3C
+#define FCH_SSC_MAPPING_SIZE		0x800
+#define FCH_BASE_PHY_ADDR_LOW		0xFED81100
+#define FCH_BASE_PHY_ADDR_HIGH		0x00000000
+
+/* SMU Message Definations */
+#define SMU_MSG_GETSMUVERSION		0x02
+#define SMU_MSG_LOG_GETDRAM_ADDR_HI	0x04
+#define SMU_MSG_LOG_GETDRAM_ADDR_LO	0x05
+#define SMU_MSG_LOG_START		0x06
+#define SMU_MSG_LOG_RESET		0x07
+#define SMU_MSG_LOG_DUMP_DATA		0x08
+#define SMU_MSG_GET_SUP_CONSTRAINTS	0x09
+/* List of supported CPU ids */
+#define AMD_CPU_ID_RV			0x15D0
+#define AMD_CPU_ID_RN			0x1630
+#define AMD_CPU_ID_PCO			AMD_CPU_ID_RV
+#define AMD_CPU_ID_CZN			AMD_CPU_ID_RN
+#define AMD_CPU_ID_YC			0x14B5
+#define AMD_CPU_ID_CB			0x14D8
+#define AMD_CPU_ID_PS			0x14E8
+#define AMD_CPU_ID_SP			0x14A4
+#define PCI_DEVICE_ID_AMD_1AH_M20H_ROOT 0x1507
+
+#define PMC_MSG_DELAY_MIN_US		50
+#define RESPONSE_REGISTER_LOOP_MAX	20000
+
+#define DELAY_MIN_US		2000
+#define DELAY_MAX_US		3000
+#define FIFO_SIZE		4096
+
+enum amd_pmc_def {
+	MSG_TEST = 0x01,
+	MSG_OS_HINT_PCO,
+	MSG_OS_HINT_RN,
+};
+
+enum s2d_arg {
+	S2D_TELEMETRY_SIZE = 0x01,
+	S2D_PHYS_ADDR_LOW,
+	S2D_PHYS_ADDR_HIGH,
+	S2D_NUM_SAMPLES,
+	S2D_DRAM_SIZE,
+};
+
+struct amd_pmc_stb_v2_data {
+	size_t size;
+	u8 data[] __counted_by(size);
+};
+
+struct amd_pmc_bit_map {
+	const char *name;
+	u32 bit_mask;
+};
+
 struct amd_pmc_dev {
 	void __iomem *regbase;
 	void __iomem *smu_virt_addr;
-- 
2.25.1

