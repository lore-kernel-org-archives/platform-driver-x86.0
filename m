Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2080.outbound.protection.outlook.com [40.107.237.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874CB196C9B
	for <platform-driver-x86@vger.kernel.org>; Thu,  7 Nov 2024 07:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730964466; cv=fail; b=CVLPEnmgtteB6SgNuYPWBVb/ube+p59ohPx/zuxWvd+iLL/k8TsWo9Hh73lrhjJAsO9pJrLSXSwmMLaYcHE9C8v2MrV/x/NwEK1ty2fe1SCwCmJX4vDGcWdQuqX/uoyKiJBd1QsqrAFbTbZ5O8VjXNPANaSPrWvC+dLaEyk5ClM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730964466; c=relaxed/simple;
	bh=lIoiA8Gqu/0R44C2VkwRQZXaowbCC9K78mM3/pFnAGU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hWpOia6RyNvTmQvT0P4BUEqkyf/SJiEuOq32EWa5SL9L7quBg8927Ed7GeJ9ArQVnwdERqvjFRlgUrhoVGSwvE1h/4k0h7jFgDS6bKq1l1viB/428kVOlODBQSU2TRtiB+39V89KrqnO8aJYUbEg7Ql9zKKDf/XroaBqLV1e7DM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=MO7AXe4V; arc=fail smtp.client-ip=40.107.237.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="MO7AXe4V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wpXPRIhntTIEBWSbOHZxSuEXE7vA7b8C3riFJ/0OO3yoVS/VyktWHtqhPBDPQQ1UsOolDRYMdhalJMF1oPC2T4YEvs5fNeC1C7bB6l+jpvGqf+oWBCzIUlkXP/GTfjFLgxUz7CI/6uPAwWYbDUhWyloOnQ2y98QgmET0u3rZaTXJsHKc3uO6GZSuap6cwwLMDPWj9MwvhgGVmQNiDNCRTrjDnh1BPRJyVdL6zJKpO6v0gAOjcYyqki3GodLjjWNXnPfE8x530VqF2oamDATf43mzs6xbhZYV6FaWQ1aIfYB2AqMfzTAC6ehPJ60m1cQJ6zuS2AJEvCZcUjtmrp7zkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7PHngG2WGHi/K+Wl4eRA6aTmQyjThF/Cy7wKLZS16QE=;
 b=Io4pbScpXpfNQepbPOYY5BCzkLWwL8DlaLyzcO+oXjCLJCkiOJdasG/n+HK5h215FU2mAWtKJ8/mq6JFCQG1h3rNj/2FdvMmLHM7Xm3nxWHq2K7hs3OL/RnSeKaYlESt5i39BDv1QabYBYUq9a6GDFJ09C9n0CBXn2AAoMukKge0qd9oGYZqPeIMVWy7rAzJ2wa5whpxPSqTvGQBqGYrP76fdEAheBZGghonWvmItUue4CWYuidCoqaPeB6F4AwR7HqMNZgWh2zCZOqdDNNaRK36oiQZ8JA4t5ib+dh6HyZZdp39H09To3z0ikoMBa4UwhfydPvOUz08DWSISaoRjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7PHngG2WGHi/K+Wl4eRA6aTmQyjThF/Cy7wKLZS16QE=;
 b=MO7AXe4VF8x0/NBOvw2JzfRmIt5T4ln1ZQuK4qvlXdRk2OuBRQBpgUmxwU3h/62oNuo3xVbygwOkdviAIuFm3+aMVH7VeMXyRLFrQOrienswQE8phQYw7Rwc4PMrz824c3g4BAtuZU6gXvpB0XPbWA0Fd5sPdgZm5G0N4RhjiSw=
Received: from PH0PR07CA0025.namprd07.prod.outlook.com (2603:10b6:510:5::30)
 by PH8PR12MB6938.namprd12.prod.outlook.com (2603:10b6:510:1bd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Thu, 7 Nov
 2024 07:27:41 +0000
Received: from SN1PEPF00036F3D.namprd05.prod.outlook.com
 (2603:10b6:510:5:cafe::93) by PH0PR07CA0025.outlook.office365.com
 (2603:10b6:510:5::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.18 via Frontend
 Transport; Thu, 7 Nov 2024 07:27:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F3D.mail.protection.outlook.com (10.167.248.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Thu, 7 Nov 2024 07:27:41 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 7 Nov
 2024 01:27:39 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>, Mario Limonciello
	<mario.limonciello@amd.com>
Subject: [PATCH v4 05/11] platform/x86/amd/pmc: Define enum for S2D/PMC msg_port and add helper function
Date: Thu, 7 Nov 2024 12:57:08 +0530
Message-ID: <20241107072714.943423-6-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241107072714.943423-1-Shyam-sundar.S-k@amd.com>
References: <20241107072714.943423-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3D:EE_|PH8PR12MB6938:EE_
X-MS-Office365-Filtering-Correlation-Id: 942793a7-4786-4c8b-adf5-08dcfefdaa21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8dHwQZ5qYOB6nfS31PnpSh7yjC9wpZvMckjkZvHPoVrJP7Jmy3hY2NW1gHxb?=
 =?us-ascii?Q?JecKm53Z+p4SXXD6fGE7yvrnXf9Xw0XgX2QvdxfILwsoq9rC0F3xMjKUEgQ9?=
 =?us-ascii?Q?YEWDRGsc23v3YUKK8KUAg6a1E73Gs+Hjd//ro/OkqoTUk6q617hj1Tj6sSLO?=
 =?us-ascii?Q?MbLxRrOdKN/7hyz4uJPvZprTolYscR1twNW9C8FJtT9P2KHthCFpFo1AOfcX?=
 =?us-ascii?Q?QV7I+hOiZW+ibSLRLIuX/a+Dr7jfFMGvSQzsypt9iQLyIB9DHBjVS2FpwDBm?=
 =?us-ascii?Q?jgOo5FFoboKLqp/rLqIBaZoQ1EAlkPEK+VXQ+gFllwPP34TyuZHD+EYEBr0K?=
 =?us-ascii?Q?I3zAr/FVQf4CXiKZgv3Sy5/vSzUJDp7sb3amq/IayuVqDNJZp9Ve3GR2QLAk?=
 =?us-ascii?Q?AgESg4AYbE5VT906pA9+dBG+Zf6vXRkCq6ewfUwz4uHWOcuDLIkDJXD89j8j?=
 =?us-ascii?Q?stV9C8vqX6oFd2kKbsEkIpbl4cQMxs9grckZkaaMSidMb+9b3SPktWkZ1mp8?=
 =?us-ascii?Q?GDN9zlKgHBQc+09zEGgep1alWFtNssHAFvrcTG2aJGOdRAaIyokNexFopnDG?=
 =?us-ascii?Q?eUR3e5HGJy+PA+fuyp9myD/m2Kx9ZA4nUY2/+iOGj8TbtLMkAFQnP2BgK9/u?=
 =?us-ascii?Q?g7HIOYsobW7RLBm4bJj5C6Gn63hCHR1RfKvM8LT+HYoR6/JrQDbByNjtRnE1?=
 =?us-ascii?Q?bDYqqnZ05ac9abcvoWjtGDNKc5hgt31LEXIRrFfxeoapVlXtL0LaOlw8xbQu?=
 =?us-ascii?Q?ly6kZNBjujvpapfOBAspvH3V7hNjo9NNdbkiQuzrC4vHLO5G/eWJuLyHajqh?=
 =?us-ascii?Q?vrNonSZF4NDaHXGf6SXiJ+OJBh/HXdLU15odNHoMBlq83K/Gk8c1Ndpolcbb?=
 =?us-ascii?Q?2YUl63iEi7CWCg4hYNnF+8fOT4VfxLJCh5QHLWPM60/lUf1Hap+OsJ4Gh+1o?=
 =?us-ascii?Q?T6KMe0SfarBl/riNGxRJ1pqiPu3qS+VXNuxL0vFSZhdNrENX4FCaNxYL+6z2?=
 =?us-ascii?Q?HUej/dZa84Wc1iBIs6Gf1gO7El0OsZWnbnQe0C6gP3wmGM96z2FffbuEefPl?=
 =?us-ascii?Q?00/LRGHQUvCmOFSV4BtYgvJz20GzUL05tL9tgYdnSX6zifo0I6LJyCn0od80?=
 =?us-ascii?Q?E64BGFyx1P+xIFV9xcpX34OSiXqkdsfsZ3/Rr18C8jNLkk9lwcesS7bBGS9G?=
 =?us-ascii?Q?bZzb8c2y3IKySRUDuSpHt2ErcFsjiRTwg7yfTb0RqxSgdQCu4rZTF37oM7Qw?=
 =?us-ascii?Q?6ZpoXQD2ZAegn4FUUcoKe91BD6G49JNPu6LyKXK2k4VXYyvN1HS0xU5pxS07?=
 =?us-ascii?Q?F85bxsN9T0+GAVZBOisvSI1dI9JbJFOuwFVLXqOljTk2nZlNcOvjWKvQmn7O?=
 =?us-ascii?Q?S96UD9LSU6z+dIya/sKvFyfkin4PrKdpQLlTJRHVKeuTjPXsCA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 07:27:41.3501
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 942793a7-4786-4c8b-adf5-08dcfefdaa21
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6938

To distinguish between the PMC message port and the S2D (Spill to DRAM)
message port, replace the use of 0 and 1 with an enum.

To avoid printing the S2D or PMC port multiple times in debug print,
add new routine to retrieve the message port information, which can be
used to print the right msg_port getting used.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc/mp1_stb.c |  8 ++++----
 drivers/platform/x86/amd/pmc/pmc.c     | 15 ++++++++++-----
 drivers/platform/x86/amd/pmc/pmc.h     |  5 +++++
 3 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/mp1_stb.c b/drivers/platform/x86/amd/pmc/mp1_stb.c
index 5c03ac92558f..9ee629db9af9 100644
--- a/drivers/platform/x86/amd/pmc/mp1_stb.c
+++ b/drivers/platform/x86/amd/pmc/mp1_stb.c
@@ -155,7 +155,7 @@ static int amd_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
 		dev_err(dev->dev, "error writing to STB: %d\n", ret);
 
 	/* Spill to DRAM num_samples uses separate SMU message port */
-	dev->msg_port = 1;
+	dev->msg_port = MSG_PORT_S2D;
 
 	ret = amd_pmc_send_cmd(dev, 0, &val, STB_FORCE_FLUSH_DATA, 1);
 	if (ret)
@@ -172,7 +172,7 @@ static int amd_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
 	/* Get the num_samples to calculate the last push location */
 	ret = amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &num_samples, dev->s2d_msg_id, true);
 	/* Clear msg_port for other SMU operation */
-	dev->msg_port = 0;
+	dev->msg_port = MSG_PORT_PMC;
 	if (ret) {
 		dev_err(dev->dev, "error: S2D_NUM_SAMPLES not supported : %d\n", ret);
 		return ret;
@@ -267,7 +267,7 @@ int amd_stb_s2d_init(struct amd_pmc_dev *dev)
 	}
 
 	/* Spill to DRAM feature uses separate SMU message port */
-	dev->msg_port = 1;
+	dev->msg_port = MSG_PORT_S2D;
 
 	amd_pmc_send_cmd(dev, S2D_TELEMETRY_SIZE, &size, dev->s2d_msg_id, true);
 	if (size != S2D_TELEMETRY_BYTES_MAX)
@@ -285,7 +285,7 @@ int amd_stb_s2d_init(struct amd_pmc_dev *dev)
 	stb_phys_addr = ((u64)phys_addr_hi << 32 | phys_addr_low);
 
 	/* Clear msg_port for other SMU operation */
-	dev->msg_port = 0;
+	dev->msg_port = MSG_PORT_PMC;
 
 	dev->stb_virt_addr = devm_ioremap(dev->dev, stb_phys_addr, dev->dram_size);
 	if (!dev->stb_virt_addr)
diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index 7726a05091a5..ce0050699a5a 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -449,11 +449,16 @@ static void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
 			    &amd_pmc_idlemask_fops);
 }
 
+static char *amd_pmc_print_msg_port(struct amd_pmc_dev *dev)
+{
+	return dev->msg_port ? "S2D" : "PMC";
+}
+
 static void amd_pmc_dump_registers(struct amd_pmc_dev *dev)
 {
 	u32 value, message, argument, response;
 
-	if (dev->msg_port) {
+	if (dev->msg_port == MSG_PORT_S2D) {
 		message = AMD_S2D_REGISTER_MESSAGE;
 		argument = AMD_S2D_REGISTER_ARGUMENT;
 		response = AMD_S2D_REGISTER_RESPONSE;
@@ -464,13 +469,13 @@ static void amd_pmc_dump_registers(struct amd_pmc_dev *dev)
 	}
 
 	value = amd_pmc_reg_read(dev, response);
-	dev_dbg(dev->dev, "AMD_%s_REGISTER_RESPONSE:%x\n", dev->msg_port ? "S2D" : "PMC", value);
+	dev_dbg(dev->dev, "AMD_%s_REGISTER_RESPONSE:%x\n", amd_pmc_print_msg_port(dev), value);
 
 	value = amd_pmc_reg_read(dev, argument);
-	dev_dbg(dev->dev, "AMD_%s_REGISTER_ARGUMENT:%x\n", dev->msg_port ? "S2D" : "PMC", value);
+	dev_dbg(dev->dev, "AMD_%s_REGISTER_ARGUMENT:%x\n", amd_pmc_print_msg_port(dev), value);
 
 	value = amd_pmc_reg_read(dev, message);
-	dev_dbg(dev->dev, "AMD_%s_REGISTER_MESSAGE:%x\n", dev->msg_port ? "S2D" : "PMC", value);
+	dev_dbg(dev->dev, "AMD_%s_REGISTER_MESSAGE:%x\n", amd_pmc_print_msg_port(dev), value);
 }
 
 int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret)
@@ -480,7 +485,7 @@ int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool r
 
 	mutex_lock(&dev->lock);
 
-	if (dev->msg_port) {
+	if (dev->msg_port == MSG_PORT_S2D) {
 		message = AMD_S2D_REGISTER_MESSAGE;
 		argument = AMD_S2D_REGISTER_ARGUMENT;
 		response = AMD_S2D_REGISTER_RESPONSE;
diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
index 188284feca72..8252d3a52849 100644
--- a/drivers/platform/x86/amd/pmc/pmc.h
+++ b/drivers/platform/x86/amd/pmc/pmc.h
@@ -14,6 +14,11 @@
 #include <linux/types.h>
 #include <linux/mutex.h>
 
+enum s2d_msg_port {
+	MSG_PORT_PMC,
+	MSG_PORT_S2D,
+};
+
 struct amd_mp2_dev {
 	void __iomem *mmio;
 	void __iomem *vslbase;
-- 
2.34.1

