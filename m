Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2082.outbound.protection.outlook.com [40.107.243.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B39A283FF8
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Sep 2025 09:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757927179; cv=fail; b=TXTt54pZVcWCZ9aykanl6DtkAhguNYi5O36TCJ5Q4vye7zDgUBbJJXj+aqG7MxqGusveLEXeXdVLEG7kuNJPZ5WficXtHr5tTGlxI+jvLswdp19Dzy7/gFx6LcYzDJptEbbvtzgrE740oSWLfD8wZRc8v+MtUV27jxpDhtz7LKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757927179; c=relaxed/simple;
	bh=3vIoTo9r/iTluvOD8oJQhwc9fupUHCN2EsbLKNb932M=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Hba8vt3ZF7T0OZT90pp5hslxCe0UfRL9ZUwzx8HA0ClzAXo23i3ssQR5mTeo4brONv0pesdPxd7tv3mu/4BwbqFr/iFSkhn/m+b/3kwwnlWwxMWGCLuMB6PiwYg+T1rDojnpECuGgyp/GAiL0E8JTUJdHvieokyLB5pSxPbySAo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=E88TzbAv; arc=fail smtp.client-ip=40.107.243.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="E88TzbAv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YmYVA8OXPJA4U5HfUDelLizX4A3xGKZQ+LQBz6nFHIjD6uETa57jWtSoGxQmRVXsHnvgBtYCzU9uHA4YFzK5zeBSnan6mrp9sKh1EauHTxjb3LF5hOok7dWumontf7pxbg944X/cQaFiAaKzQ/+BTVe1Kb60+b/kRJk12UH4qChvXZXsKF5QZF5OND4/RTTgBHtaZ2KY7apRW7/u147UB9QVIA6G9p5JbeclLCE7MJ8O+G6rSaj8+XuPtWmy65nyFJpuxL9uCpIAkFEFQ6Y0Uem+Ea5kjl1PKmWluzrhmwblCh5HvTDVX1g7knS0sDX8NJvmsRj9jAs74S5CqsN4Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D/eWxelBOLbnHAyR3QRjV1f/5wm/jEknEO9As11iKg8=;
 b=pCszYfUccX3hV+nzD7NUTSNST6P0382XtDpZg8TlR4/z5hvCe/bgWIJJjUgoYaWqBtPoGKQdWU4yvxlU/RW30ia5D9BCnQctDJP6oMRxRjmvJs+jjrnAYR5cS4WIexVkCW3j/cnU5ZYhpERF1B6onloW1L3sf/eJJOw84NkkD4hG1ZRD10pOkZnNnnZTRIqvxurKsLtR4P2DkrO9HT195cQbPrT1LI/boyiLhlOn86G6xX1VBn6fwcAWLJM2s8lX/6cJ3UXJUAp97ZYekJGRIKFGYImDhOfhCZX4KZ/QJ2yR2LYayNQn3UH683rcpJZAlEdPAlncMOZMONem8UX0vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D/eWxelBOLbnHAyR3QRjV1f/5wm/jEknEO9As11iKg8=;
 b=E88TzbAvlSKELb/TB2LqVK1yazwuFfK0pGScXL4h+Ik1sNmBX/jxEkLMCuo/ksv0RR9bivlKQUr610KGrykfQgUlxqacQ6PbqsB9juZ2VfjLYILPmiwHOXvXXhn2aB4+spVq3Pm3l8l2KQwlFxZnwvQzw9N8nIrWD7flU44mRGw=
Received: from SN4PR0501CA0072.namprd05.prod.outlook.com
 (2603:10b6:803:41::49) by BL3PR12MB6379.namprd12.prod.outlook.com
 (2603:10b6:208:3b2::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Mon, 15 Sep
 2025 09:06:15 +0000
Received: from SN1PEPF0002636B.namprd02.prod.outlook.com
 (2603:10b6:803:41:cafe::de) by SN4PR0501CA0072.outlook.office365.com
 (2603:10b6:803:41::49) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.12 via Frontend Transport; Mon,
 15 Sep 2025 09:06:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002636B.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Mon, 15 Sep 2025 09:06:14 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 15 Sep
 2025 02:06:12 -0700
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH] platform/x86/amd/pmf: Support new ACPI ID AMDI0108
Date: Mon, 15 Sep 2025 14:35:46 +0530
Message-ID: <20250915090546.2759130-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636B:EE_|BL3PR12MB6379:EE_
X-MS-Office365-Filtering-Correlation-Id: f8dffd70-52ec-4243-927a-08ddf4371fb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zac9LyTT2R86OmqGmSPzs809Qe9yc0YrPoZKIeSIdfFR9TG3F/ZlXxr5pOAl?=
 =?us-ascii?Q?LKD5Hg50f33wKI9TBfkAqwyDimsDRqNlzWV6GVuMSYgAsTKXDi2VDb7x0OU4?=
 =?us-ascii?Q?dcGvXjU2uutSK+GPYaW0UsCCkSR1+r+LgtgjzES6jYDorP3kIbrqqO3WwXAO?=
 =?us-ascii?Q?mwNjYP58APH6+nWa5T6B73nDfnesaE4DMFacYgfcX/NWqT5XpYnlecWhKsmQ?=
 =?us-ascii?Q?ywl+MTe9GYS9Fr5NcfNpr9aV8M46zTltLUIOEwYYiGxUWv0g1+c0rN7pdoWs?=
 =?us-ascii?Q?sLlk4TkAXHueW6RvaMq7u2yJB+5YD3PXst1wRvf97IgNHeyc6apdpxKf9sGF?=
 =?us-ascii?Q?vHjAUJTjIpr9RdcNozBHFyf7gfXKU/9rCNgrxmiaFQO43nBuBnziYi0Z8YZ+?=
 =?us-ascii?Q?eIXJ+nQRBD+2KfEP+5+5ciNVbzX5WvQ6sZ2Lhhk17BwPnYsJN74k/2FzGaKk?=
 =?us-ascii?Q?lu4Uwhzzx7L0WkyWyTVNh9ae6EDSqthcfckU61kTWz+PlfjXtpUpbD+wfo6h?=
 =?us-ascii?Q?JjwbJTH4uCmnPxDiwt7+QFnVvW93VCTkXvw45OL35gl+sMlrNezlJeyufZC9?=
 =?us-ascii?Q?wEMMA0MewrMgqT2mSuWzX5T1Bb5kPSrm8PZrInLmnVR1op4QCiooPthhbDlP?=
 =?us-ascii?Q?aWeLwDQZQuB0Av1E8hd0Up/EBx1LBGUALlsqqk+VK1FaJIYAPBPJUrVuzYEK?=
 =?us-ascii?Q?Ea1WA/6N48nMrIc/RDU2MJTuou8jvcpu+/XM/HS0h5tbPxqnC+M5QXL/fuhJ?=
 =?us-ascii?Q?iRCXUdBiCreoFSO5CZIFi8gL1QNCEgxpuhKJnImMhwW8EeABBXLBGlZke48a?=
 =?us-ascii?Q?Uz/fAe5rjyS+2cFXY8xBRlLQXzXB7hWJlDq2TSPbdTZMkikrwl3YyNaPvD9O?=
 =?us-ascii?Q?m+f+G6eyWox3dbiBU6oXM2JgrQQf226kveShaGjGrQIjRn5IDYHvuEReJPNM?=
 =?us-ascii?Q?LGfuv8el55/LhnFy3X4y0VbTiM/0E1RkY11fP6uCfVHZO4HuE7cnBiRUxvEA?=
 =?us-ascii?Q?KbU+eIca3yjoagqimWdSNG6MLAtBsKqAI9zgegmQ6B1fMVAFkxFpgzYojPNE?=
 =?us-ascii?Q?UM90ui3hFiLcwVihk4jnPdnyDTG6iftHxysMXRDb4S9Kr0iDrp0tl0z5w3mu?=
 =?us-ascii?Q?XGlOZB6bCDqJpCkIlFWuQ8NBbLoJNjncWVNPJtiGXWjkfWRWIRjc5zkXCMM/?=
 =?us-ascii?Q?crZLuhsBcQyB4jYwhUqT2YN/yVCEFwRsKR2tqHzODVnPlS8XiAhqqK4Klkn9?=
 =?us-ascii?Q?GpM0wQpCX3rwLc3NNUlhAplUTZ3bBw7wTiwnXhBLt5UMCnAcae1X8Ii2/pDO?=
 =?us-ascii?Q?RedOufE3u5Cey0HWGoIhCENsDnnAj+KvQ3bt2vozkzUwTgCmMpc/owq8hgBD?=
 =?us-ascii?Q?Ir7qIVN1gTPWHcjOxreIV7Wp/0qD1H83HZkIaT6E9n7JyEiilEW/sai/s0Io?=
 =?us-ascii?Q?Yw6jcJgyGJDW4kiF5zpiYWp+62u9vDA/0i4/GlWaCSpYCkFnBjFlp/AOszdI?=
 =?us-ascii?Q?5ir3IEAx0Oc0pF4LYPZrVZ/bT8Ba0Dc/n3fp?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 09:06:14.8257
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8dffd70-52ec-4243-927a-08ddf4371fb5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6379

Include the ACPI ID AMDI0108, which is used on upcoming AMD platforms, in
the PMF driver's list of supported devices.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index ef988605c4da..bc544a4a5266 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -403,6 +403,7 @@ static const struct acpi_device_id amd_pmf_acpi_ids[] = {
 	{"AMDI0103", 0},
 	{"AMDI0105", 0},
 	{"AMDI0107", 0},
+	{"AMDI0108", 0},
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, amd_pmf_acpi_ids);
-- 
2.34.1

