Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2052.outbound.protection.outlook.com [40.107.93.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0CF155C82
	for <platform-driver-x86@vger.kernel.org>; Mon, 17 Feb 2025 08:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739780365; cv=fail; b=E+xaMErPuHtl0TuyikB19pwl9dc5WAk848EHhEaEZtJlF0wf6pwwm/2Z+g8CC/1nW3K8SkCKnbee9Na5yMmDpLXguvsQmwNc8YzwBfuwMw6vZIH+n+RYFwK+2d5VUvZtfOKhApt2mPl+lD3XWrz53AnHbiwtSraRAeDJe92GZr8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739780365; c=relaxed/simple;
	bh=YE5pkrycIEkFgC9g7cxtYAy2qQ2tFHDqWNn1pE9OBgQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r3Z1fm8o47vcbDXHNqfEssjSdukvbu+UtNHNBXsO5mqNHpaxQtQ/NInlqPjV2TnzQfsmP1DEI9qnh6ls90YtFUiGzOzRZ1a3TjD2PhIaugcDY+B/Lw+lWsPpiwrlD4HTo4lHAYtRuvK+q2JvfZnP8uMfNB4kNuPv/G4aKB8rLH0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ny2NRG8p; arc=fail smtp.client-ip=40.107.93.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ny2NRG8p"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z36h1KWRjGIlXfkdq6BcQIA7PBRP2FiBOD19vdbBcK4CjTFsUnO1YQm0/3XkKkMRXhDKJ+I4tZYBuDQmV/CC3jz1GNvRDQD5YD99PsDlayccaK0cfR1ziyBMQSBumXe3bEy1ulsQ/cBo6Y6yStu43Y9enMcFXUbyZhvZTnd75ev+QDLlFzKr19YDdmLfoRMleYD7yLMR7yzc8DdoB2LfGLknB2RR0Q3dKXgGgZwlraVyWjkOoLqAEvo+dqXfy9q++C1I6+G54zYVfLWGRReoKH19qLF6Ys1htCT+RqXxNm6AkJ5Ny1bLHiU0uIL/Itz5uoWb/lfxZyN3nYWItMPfoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GDXDWA+v5wgZWRahmJKU++VLKYUu7t7DTL7RcFH4Kl8=;
 b=TUtRqGAvNX5oA/9c+MozEjwfrd9cvXjuF3r99uFy4+EO8ebeu0W9zdqfy9PFPh+CjTV75kOA9HReVJ+fEKrnS4J+GrtcFwxvaXq5DGSi9zgTn+26NGXx9cDibwK6Jd7jvs2w1dovWpN/NKsQYKdP6xtUpOLB0hk43jcVw8gzVx3k7mnMbu/pGffjlulgxppaXzVeELgvwfPh9c9CRSM6ZmhcsYOSkFiYcTFVCtciftXgKsdR9lAgLklDFYLWq3X/pm6zmYJ2NjAJxEtitJpyCJp8DH+3tbfzU5201TCWYNlr/0R57gg9sBwZGHhosAGDjnazUL3qIsE9EhbpZeLrIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GDXDWA+v5wgZWRahmJKU++VLKYUu7t7DTL7RcFH4Kl8=;
 b=ny2NRG8pPf9mtrA+Ig/sHpZ67Kv1zZS0HvJFORIssn3vvqW7lxXdba7QOJY5BAD/55c8Oqdm4cdqBUYAz8bQIsseOKIX9gtDU3HsyVkD/IOKGjiQ3KsoZHotuH/bvN1K4W5n6bCVZ+vPxGfVr40Bl4CUueaSjb7cvHSrLG6MdUE=
Received: from BYAPR08CA0035.namprd08.prod.outlook.com (2603:10b6:a03:100::48)
 by PH7PR12MB6739.namprd12.prod.outlook.com (2603:10b6:510:1aa::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.17; Mon, 17 Feb
 2025 08:19:20 +0000
Received: from MWH0EPF000989E8.namprd02.prod.outlook.com
 (2603:10b6:a03:100:cafe::a0) by BYAPR08CA0035.outlook.office365.com
 (2603:10b6:a03:100::48) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.17 via Frontend Transport; Mon,
 17 Feb 2025 08:19:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E8.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8466.11 via Frontend Transport; Mon, 17 Feb 2025 08:19:19 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 17 Feb
 2025 02:18:48 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 2/4] platform/x86/amd/pmc: Move macros and structures to the PMC header file
Date: Mon, 17 Feb 2025 13:47:18 +0530
Message-ID: <20250217081720.107719-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250217081720.107719-1-Shyam-sundar.S-k@amd.com>
References: <20250217081720.107719-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E8:EE_|PH7PR12MB6739:EE_
X-MS-Office365-Filtering-Correlation-Id: 217b4f6e-d5eb-4ed0-084c-08dd4f2bc6e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6lHB0p/cUJGshJ8U3nhPt+kUeQ7DTtHnC73FPrHWHX/gFCnZ8ExlEG36hUAk?=
 =?us-ascii?Q?2jYp6nyX1sIO7M2SZuOCLu7yCwQoDsRQjjA+cFmIWMDDztQL+PNnuncm7mGZ?=
 =?us-ascii?Q?CxvTzALPv/hpOZIDOABjMrMplVprd4vKGD8vDk21RV7NJ16bM4zynvdElvvf?=
 =?us-ascii?Q?7OSbNv2lbgIA2+RNSuoduJNZgWZ6fPc+G90k3D10lbIEcj4pCe2aosEKziij?=
 =?us-ascii?Q?qP3Dp4VKDZqBHjvGI2/DWmT2BnO4EGL29G4mq2j/azzcIHWqM0WrSYACgw0U?=
 =?us-ascii?Q?68wVRKH+KrHFdfCteLJOyQJZq+TwkeMLjTTw1kwilFeGOCBaNGs5GkXgIozQ?=
 =?us-ascii?Q?w3v9bGB4ss7W5m0/mlDxnro6FfpL6DrlFk5KJsMKWawVf9K0BVoHYjwnX6nT?=
 =?us-ascii?Q?PYK53V+Jcoc4QdDo58oGQG5dzLtIbAOUHWkJVSFXGbx7+9zXR1rwZxzk30IR?=
 =?us-ascii?Q?fynSDh4AygC1/UOQdvNE8wEzifnzV7fYkUmwAuoq/u3IS01Og2t3G94/U8r8?=
 =?us-ascii?Q?cQ43yQVER+o6iwla1VOOBpdFaJtgYY6bM7g89AugY68Grxt1AfVc6SsYKPJc?=
 =?us-ascii?Q?mYNA2lmpLAJxw+NBucpLf+EsyUAt0ewihrUx4ctxjNJ3ipc7WNb3QAY6XhSj?=
 =?us-ascii?Q?2yVtwbi99k8cZgRIdWyfLEdlldvjr7CwrsEeYpQ5bbk8943m1Kedze2XwBYO?=
 =?us-ascii?Q?85c0WY3lnwI1I+fPik3SXEy/WmPY3Q6KoOdeVthtg15PHrVZmd7ic8AKtdpS?=
 =?us-ascii?Q?VALaTD2y0/Gyy8ia0y3yM0PYNn9a+IDoIGc4CdbUyqULmxjqdIPkGNDzdgSg?=
 =?us-ascii?Q?gR5ygLNjFwfZz4XwM5NB3Z28Xav4Js1v946BiYqytOgC/xNk1Fo8HBRuBXNX?=
 =?us-ascii?Q?d6oFXuybtWTkfHmXWcxqChDHhDJaCTuNv8n7nNaMhxDTtis4z6yyxGC1Sir3?=
 =?us-ascii?Q?eX6wMVYdqFvgSZOnKx4wyi23U/D/fosE6EryLrd3N3Dpc3OVKztLSSOVRj2E?=
 =?us-ascii?Q?GqqlbOsiRXKd2T7SWGbcgqriUDFe2nyCH8yhmuquasAqGOjNXLQYm7+7lsWJ?=
 =?us-ascii?Q?MgETXCotAib5QLvLSRJKgYyeG0KhEvr1EV+V61TKXnTcxAopyqI0ApsLNhIs?=
 =?us-ascii?Q?kSs8h3upW3Mf8Pa8Fzi1nzNTK24DEFhQEfQRK4iajXgp2p80YWiMYDVZitCT?=
 =?us-ascii?Q?O4FOkxe2l8bqtQmu0GWLE5R3RArHLCUb10Fr9axSG74+uHtcUTwkyAuew3km?=
 =?us-ascii?Q?hifBLLEEhE8fenkDh8gvYvyEzqNK3T0C6zUjZURScbQwrTJUKdVdbXUGsS3M?=
 =?us-ascii?Q?wiq1nEFZVaAxCAvUG/BguoRCNgZ/rNZPanf3MuW+udpeTEWygDVMGDNc2y0e?=
 =?us-ascii?Q?QSuikdsBIhyvKhNoezIfUwwymRx1PXM/y/8ni8ATbFchnTi88Z6m32LZPGrJ?=
 =?us-ascii?Q?3p1zLQDWn5kJL8emhCshrmzR4t1I29k1B8Kmm4Wi7LzoPGGR0yLb8/VSnPGj?=
 =?us-ascii?Q?JzK9G3+iogPjvE8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 08:19:19.3402
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 217b4f6e-d5eb-4ed0-084c-08dd4f2bc6e3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6739

To improve the code organization and readability, move the macros and
structures from the AMD PMC driver to the PMC header file.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc/pmc.c | 81 ------------------------------
 drivers/platform/x86/amd/pmc/pmc.h | 81 ++++++++++++++++++++++++++++++
 2 files changed, 81 insertions(+), 81 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index c7c7afb8a431..742920530987 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -32,70 +32,6 @@
 
 #include "pmc.h"
 
-/* SMU communication registers */
-#define AMD_PMC_REGISTER_RESPONSE	0x980
-#define AMD_PMC_REGISTER_ARGUMENT	0x9BC
-
-/* PMC Scratch Registers */
-#define AMD_PMC_SCRATCH_REG_CZN		0x94
-#define AMD_PMC_SCRATCH_REG_YC		0xD14
-#define AMD_PMC_SCRATCH_REG_1AH		0xF14
-
-/* STB Registers */
-#define AMD_PMC_STB_S2IDLE_PREPARE	0xC6000001
-#define AMD_PMC_STB_S2IDLE_RESTORE	0xC6000002
-#define AMD_PMC_STB_S2IDLE_CHECK	0xC6000003
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
-
-#define PMC_MSG_DELAY_MIN_US		50
-#define RESPONSE_REGISTER_LOOP_MAX	20000
-
-#define DELAY_MIN_US		2000
-#define DELAY_MAX_US		3000
-
-enum amd_pmc_def {
-	MSG_TEST = 0x01,
-	MSG_OS_HINT_PCO,
-	MSG_OS_HINT_RN,
-};
-
-struct amd_pmc_bit_map {
-	const char *name;
-	u32 bit_mask;
-};
-
 static const struct amd_pmc_bit_map soc15_ip_blk_v2[] = {
 	{"DISPLAY",     BIT(0)},
 	{"CPU",         BIT(1)},
@@ -165,23 +101,6 @@ static inline void amd_pmc_reg_write(struct amd_pmc_dev *dev, int reg_offset, u3
 	iowrite32(val, dev->regbase + reg_offset);
 }
 
-struct smu_metrics {
-	u32 table_version;
-	u32 hint_count;
-	u32 s0i3_last_entry_status;
-	u32 timein_s0i2;
-	u64 timeentering_s0i3_lastcapture;
-	u64 timeentering_s0i3_totaltime;
-	u64 timeto_resume_to_os_lastcapture;
-	u64 timeto_resume_to_os_totaltime;
-	u64 timein_s0i3_lastcapture;
-	u64 timein_s0i3_totaltime;
-	u64 timein_swdrips_lastcapture;
-	u64 timein_swdrips_totaltime;
-	u64 timecondition_notmet_lastcapture[32];
-	u64 timecondition_notmet_totaltime[32];
-} __packed;
-
 static void amd_pmc_get_ip_info(struct amd_pmc_dev *dev)
 {
 	switch (dev->cpu_id) {
diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
index 8f39988ce7a3..62f3e51020fd 100644
--- a/drivers/platform/x86/amd/pmc/pmc.h
+++ b/drivers/platform/x86/amd/pmc/pmc.h
@@ -14,6 +14,59 @@
 #include <linux/types.h>
 #include <linux/mutex.h>
 
+/* SMU communication registers */
+#define AMD_PMC_REGISTER_RESPONSE	0x980
+#define AMD_PMC_REGISTER_ARGUMENT	0x9BC
+
+/* PMC Scratch Registers */
+#define AMD_PMC_SCRATCH_REG_CZN		0x94
+#define AMD_PMC_SCRATCH_REG_YC		0xD14
+#define AMD_PMC_SCRATCH_REG_1AH		0xF14
+
+/* STB Registers */
+#define AMD_PMC_STB_S2IDLE_PREPARE	0xC6000001
+#define AMD_PMC_STB_S2IDLE_RESTORE	0xC6000002
+#define AMD_PMC_STB_S2IDLE_CHECK	0xC6000003
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
+
+#define PMC_MSG_DELAY_MIN_US		50
+#define RESPONSE_REGISTER_LOOP_MAX	20000
+
+#define DELAY_MIN_US		2000
+#define DELAY_MAX_US		3000
+
 enum s2d_msg_port {
 	MSG_PORT_PMC,
 	MSG_PORT_S2D,
@@ -65,6 +118,34 @@ struct amd_pmc_dev {
 	struct stb_arg stb_arg;
 };
 
+struct amd_pmc_bit_map {
+	const char *name;
+	u32 bit_mask;
+};
+
+struct smu_metrics {
+	u32 table_version;
+	u32 hint_count;
+	u32 s0i3_last_entry_status;
+	u32 timein_s0i2;
+	u64 timeentering_s0i3_lastcapture;
+	u64 timeentering_s0i3_totaltime;
+	u64 timeto_resume_to_os_lastcapture;
+	u64 timeto_resume_to_os_totaltime;
+	u64 timein_s0i3_lastcapture;
+	u64 timein_s0i3_totaltime;
+	u64 timein_swdrips_lastcapture;
+	u64 timein_swdrips_totaltime;
+	u64 timecondition_notmet_lastcapture[32];
+	u64 timecondition_notmet_totaltime[32];
+} __packed;
+
+enum amd_pmc_def {
+	MSG_TEST = 0x01,
+	MSG_OS_HINT_PCO,
+	MSG_OS_HINT_RN,
+};
+
 void amd_pmc_process_restore_quirks(struct amd_pmc_dev *dev);
 void amd_pmc_quirks_init(struct amd_pmc_dev *dev);
 void amd_mp2_stb_init(struct amd_pmc_dev *dev);
-- 
2.34.1

