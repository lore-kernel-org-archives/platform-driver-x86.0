Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2050.outbound.protection.outlook.com [40.107.100.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3854514EC4D
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Jul 2024 13:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721741114; cv=fail; b=jGLKk1rzFINM/02qvO/DuioFC9NYwRbtzEWhkiySgPtBcL2+nPS7eFtCkzpbvAuXbtesR8UclVgseo0aGcu9xNQIcFzqM1FsQZwepT8vTY9B/yN3V3Ykp42nMpi34TiT40jcf/7FZsS73CjTTbatuPVAucJHsei+vPEQ6RXQgIA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721741114; c=relaxed/simple;
	bh=4JVTRxAXiVBzpjZvV3V5YynCAH5VG8htOw1APa/OeE8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UQ/c8+SDhkJtzQ8CzGEizeQ+MRFMOE1KCJO9fytzca+c3lI2nDoaJ5sNx2ju9KY2GrCRUmJ2c7qQ8ccdn+GfukZOhsfOxoa6lBoG3jviRiFFSgJDK7V0/PW3P8xwPWwVHL9ROZJ7lrSlVP4pOI3tQ5gNNcghAfS+CwYQR/XqmHc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ppulY0t6; arc=fail smtp.client-ip=40.107.100.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ppulY0t6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bENdPvF5evLvbweI0WsZEq1qJGLBk+CP6wymbBv1rU/q7qRku1OcQNZ6bDNCne/VJKPmnwkdYz2P7YaaOeQabX+xuHDHRK2h2eHywG83B2L8jYxd6S+Vp3tx5RbH/VdhJc0wTQyh+1GWmCzHfFYDhKeqtFyxemlxdINlQhYJO0Z/bWAOx/Pcax+oHNh8bAV4gPNB6NLa6vTEcGgkqVtQn2W0JJYzA9PZOFb4emzRsmLoTisjnTXOjERSRduLYtnDLM9BVpbThB9WFF4ygz1nJsXBkskzAwllkzH6tqomlnM3+17GVZcljWYkBElMw/uLQfwUDEyd391ZQHC3/L1MrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P+ov5qF8c0yeeEhZ0FoJH8hYml6W54u8Vg6xJu1TlBc=;
 b=hJjV/MJRpRb3tuq9qUY9nzYoQEkvcaO9SMa7vEcEIsIRuqB0Kiuijoyns8XKOp9uZQcS79qPwwBPjE4Nf+UkESeS2XbzGizQmbfQyJwl7Y8Y2FhooBsev8qp4AwcYspe2rSMoVBobKF52bnjkYbRqzMCiHMnkN3xmw2UJo4n8po/Fj6Rqr/y/LemDlzrGiko7EwAeaIZkQWw8CvDaNR38+vOo8P7ZBnenKuvFVUUENktAQ7BgRpx/Zu1PPYFpTURS7zj6FCQZwMHcRCuyKZDO23cLljQprzjUjouTdGf1KCuZCNWB4qPaXuFxpchE8SYOx6029yGArZ2h+T3NoLhHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P+ov5qF8c0yeeEhZ0FoJH8hYml6W54u8Vg6xJu1TlBc=;
 b=ppulY0t6JoAp6UgRETY5HoHEN5FDNpgJo7lMs4WWnLsa9TcJjHUeu9EFv1clbW4uEARPKg0KbnVd6afirCAxD+tiA3TY0qhRLCdgtg5AW3sbvmvj8k6w3ZlLAq/amEY4/6l9eiW2y1fHzXA7Rw7OY3bfnaus0jaX5up34Z5Hbks=
Received: from MW3PR05CA0026.namprd05.prod.outlook.com (2603:10b6:303:2b::31)
 by SJ0PR12MB5635.namprd12.prod.outlook.com (2603:10b6:a03:42a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Tue, 23 Jul
 2024 13:25:10 +0000
Received: from CO1PEPF000044FC.namprd21.prod.outlook.com
 (2603:10b6:303:2b:cafe::78) by MW3PR05CA0026.outlook.office365.com
 (2603:10b6:303:2b::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.18 via Frontend
 Transport; Tue, 23 Jul 2024 13:25:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044FC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.5 via Frontend Transport; Tue, 23 Jul 2024 13:25:09 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 23 Jul
 2024 08:25:06 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 1/2] platform/x86/amd/pmf: Add new ACPI ID AMDI0107
Date: Tue, 23 Jul 2024 18:54:50 +0530
Message-ID: <20240723132451.3488326-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FC:EE_|SJ0PR12MB5635:EE_
X-MS-Office365-Filtering-Correlation-Id: 88e9bb6c-4bd5-42c7-6dd2-08dcab1ae029
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bVChIR4NY1iHtEcSM7DjX5bWuwuk8MqzU+E5yHuMaUh6L/K08MdSxwIGeVSj?=
 =?us-ascii?Q?JPuVp8X6uTXYFJ/x7Z06UO4+xRAD7UCsFX8n+ZSemWD4fanSwNmcZ+r7Ndq7?=
 =?us-ascii?Q?G7C7lsZv9e4xxs6GUZDfmalfeaqGjGyILm0XNvJIaIPs6VHDh7ibAQ2ftFMv?=
 =?us-ascii?Q?RRy+L479wnmtxMzCOU2kpGf6HxVMOCCkWt1Y56s0qGzLfGZNHPFclaZ/AVNZ?=
 =?us-ascii?Q?QZZW/8vTSaAOPu82H9R0TRUihs7H1ulewbKeQYtkV+EtC3GChLCLrRx7WSXo?=
 =?us-ascii?Q?Xl8GJA63UCHNyil/cOPRUPfMpsI63XSbv6rceeLJeb1NsmCHkUna2yPMpau9?=
 =?us-ascii?Q?n8z48CXQTnnv+G4vzE9+Cfv1Ey72Ie2I1YID/M0ITjpHWQOuMCDdHs4JR+N1?=
 =?us-ascii?Q?HO/80lCFeSYrsVAcV3sbgELIAkBwd1KusxUS4ZkXfmuaQGq9Re4RLkBuwVKa?=
 =?us-ascii?Q?oFoOjja45hwSdN9EanYlXMC8/dEZ8E5sHg2Qm5DR5zNDxPza90As+0n9ZKO2?=
 =?us-ascii?Q?paqQTtoaZHxAr++TN2HzJ+VWWG6KXHwaeYyCAvn96VxEaP+i6BfRDUHYu6EZ?=
 =?us-ascii?Q?hOoY0Au48C4WjOARdbGhnm/3ZuxJhhAdoDv9GMQ8N0UQxpBBS2JTbAdgzX3W?=
 =?us-ascii?Q?6ubz3xtZNzZYb2ff6NjfAHlRS34RuItFZPNfKzjpVvzBBlk+lHfJ6WD9B+Tt?=
 =?us-ascii?Q?NGARv9wpzVoPKKVOdPmlhw++WQU8TuxZapbXgRIqV/fb/J6262XMZO+Vx0Oq?=
 =?us-ascii?Q?LKall4/0+pi62x/KrQ5+v86iTv/l+6kWPArKSHTaUeaHgLsvxNJi9WXN+9xk?=
 =?us-ascii?Q?HHxK+Hi7OFzwEcf9N3Ve8qDh2JQaNwIUWTpwZOQuXKe2DkR2ax7JeAcOVmzD?=
 =?us-ascii?Q?3XLSi7bpMh35HD4/HjqvrbK7U6/Uvbx4dKkgjOXcd2O7/9vuCBgqLwuAh7HG?=
 =?us-ascii?Q?wTWBXxAYZy03VnMb6Mlp2Vn0rGIBDolvKIFBmgsz0jhS6XDye+o+MKfI0Aq5?=
 =?us-ascii?Q?buMmt/u2ca7oVXmDojdkvCJPbHhq5eGxO1OFfSgCaLdOvb/6ls23dw9ZIyqJ?=
 =?us-ascii?Q?ecEudpj7zE98e1qZv1Tew5rMD31E443mzOBG2Sht/7H0P7kBsIv0mRmlo0uu?=
 =?us-ascii?Q?npZCaQ4YQv8hyAfvVb/yIPMl/NzXBPqv6aM845ZWxBDeqQ+TsFFX7FI6UYyG?=
 =?us-ascii?Q?5emTSFCpn5TvtAUamSGJhiOmhoSxiDe9xmOR4k/qgixTgnEAwy03Nvj5Jnd/?=
 =?us-ascii?Q?zqlclt8Uv0+FXHjwQJK5qswD8BoMvJ0tcTvQRgqG2kyqJSSFOV64Whnp5NIW?=
 =?us-ascii?Q?ZI1bYxp8Sz2Djh/7Z6yJrI+Gdi636CA5n8bI4bK35RjVthlELFfnGuQTi85O?=
 =?us-ascii?Q?mah5Sn8LgIiqqLXr7nlMnWk4jot28bB3qxEcJTb7lni6K78InjkcdPTAFT/j?=
 =?us-ascii?Q?3Nvf1yWvKSfjpHM8igxG4ZcalT/4OSEi?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 13:25:09.6516
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88e9bb6c-4bd5-42c7-6dd2-08dcab1ae029
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044FC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5635

Add new ACPI ID AMDI0107 used by upcoming AMD platform to the PMF
supported list of devices.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index 2d6e2558863c..8f1f719befa3 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -41,6 +41,7 @@
 #define AMD_CPU_ID_RMB			0x14b5
 #define AMD_CPU_ID_PS			0x14e8
 #define PCI_DEVICE_ID_AMD_1AH_M20H_ROOT	0x1507
+#define PCI_DEVICE_ID_AMD_1AH_M60H_ROOT	0x1122
 
 #define PMF_MSG_DELAY_MIN_US		50
 #define RESPONSE_REGISTER_LOOP_MAX	20000
@@ -249,6 +250,7 @@ static const struct pci_device_id pmf_pci_ids[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_RMB) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_PS) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_1AH_M20H_ROOT) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_1AH_M60H_ROOT) },
 	{ }
 };
 
@@ -382,6 +384,7 @@ static const struct acpi_device_id amd_pmf_acpi_ids[] = {
 	{"AMDI0102", 0},
 	{"AMDI0103", 0},
 	{"AMDI0105", 0},
+	{"AMDI0107", 0},
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, amd_pmf_acpi_ids);
-- 
2.25.1

