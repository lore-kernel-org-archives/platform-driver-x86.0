Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010047.outbound.protection.outlook.com [52.101.56.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0503AEF4F
	for <platform-driver-x86@vger.kernel.org>; Wed, 14 Jan 2026 22:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768429084; cv=fail; b=SaUMfJDp6oWW7Xroo4C+7usx7I7Nz08P0Lch20lVjWrccszSVPcYKyQQIu8sV+Zp6GB2hiekQoTMvjRDKdysJa2L121olZZQvPnqSNDT7bZ5056SzOn3n5gyzYQwurr0TP78gkMo1gbmtAyaxq/menm9ROH7wj7WoePEnd6g0yo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768429084; c=relaxed/simple;
	bh=vWVwVYpvcULZ0J9R+aGKo1NWXKWnAAKea3fnkQNCdkQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NndJ6BQZCe1vZdolpl+BfsEIThpQT5ZK3kv8i4i0GWAtp9KuYE3FE+DewLJyQKLvsN93NInxkI4n50ThEQfaq/IHaQnICrUZHysXQDJojU2K+WoEFMeuzfIv1YO7QawWmRnXnrOgsX+McpQPIo3TegmHzUxDhz7eL8axz8N87jw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=HLXchaCp; arc=fail smtp.client-ip=52.101.56.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="HLXchaCp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=soo9oQsXQCvqjn1DghCN+U/dCvze8qzCJV2XhLyNTxuwigErLGKXOE5awvkx9tJp+v4luCEytv6q78gEZIAXOOdQtp/kuuTKWixF7cRK8KL8FQaEDhD5gFJvzCDhM2YxEqIMkz2WtfS13eXAv3BD/ifa23uLaBShxwEJxXsaYu3G8lVdo6cR0aagLk+6nbOVsnRhIXHx+bXMiCEEQuv8CPP4C8b6nEkOUmYd2PE663IJAsqj1VuVcRwYN7kSo7CSbkdGI6UcGHOBd5ffjQRFCnrgzIDdRAEXO1P6prTPGo7Q4q93OTuaW2M84aNpfsNQgKQ6YDTUeA9SyQ/u6iYChg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w1eAnTA+ksYya2YzLFEkzU5nXfncE5Lh1xiGmnO2u1w=;
 b=evuIUetQ7m0oSJxsyfw66mLfge8XqELE91Pyv0AonMCAPmeeA9a1MrDViHtLPvbekX4cuGBS+IscoXGV4zoKOnEf8kphFLoLxcMgktojRUJSCbEB0FNzOmFbPGODqtylp010f+ZN7LlYESCstRx6avLfE6yr4z4hPWtnFYM6Al5pvtNRBjVPR96nA2FrmiTZfMJUoznjq/MZ0XqVtQ81fqAG5Xxx5lvkM86nZyyqqFN3nfPwddNyzXCA31uPhA7uQxVfiqcj3tem97Kirfsc4cLmU95o3fxOf4nsZ4S2+f+6sOAMUvgw88D1yf24exztk4UuDl+WReegkEVnq25v+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=hp.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w1eAnTA+ksYya2YzLFEkzU5nXfncE5Lh1xiGmnO2u1w=;
 b=HLXchaCpgNGUzTPd+JVD5yQUFtfdejvFVA7/lecBoi30Ze7te0kr/kzyzLzCTmY3cMao5YHc7flafedOLYt6rJqDogS79wDO+ZYQKpFAkf6Ji8BBdYyJzbs8HUgf3jemOoE9m2zPmTkvwEl/lzKq4u1zOpssF/pkdgBizkftW/8=
Received: from BY3PR04CA0014.namprd04.prod.outlook.com (2603:10b6:a03:217::19)
 by SJ0PR12MB5612.namprd12.prod.outlook.com (2603:10b6:a03:427::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Wed, 14 Jan
 2026 22:17:55 +0000
Received: from SJ1PEPF00001CE5.namprd03.prod.outlook.com
 (2603:10b6:a03:217:cafe::bf) by BY3PR04CA0014.outlook.office365.com
 (2603:10b6:a03:217::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.6 via Frontend Transport; Wed,
 14 Jan 2026 22:17:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CE5.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Wed, 14 Jan 2026 22:17:55 +0000
Received: from dogwood-dvt-marlim.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 14 Jan 2026 16:17:54 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: <mario.limonciello@amd.com>, <jorge.lopez2@hp.com>, <hansg@kernel.org>,
	<ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>
Subject: [PATCH] platform/x86/hp: hp-bioscfg: Fix kobject warnings for empty attribute names
Date: Wed, 14 Jan 2026 16:17:18 -0600
Message-ID: <20260114221730.653822-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.52.0
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE5:EE_|SJ0PR12MB5612:EE_
X-MS-Office365-Filtering-Correlation-Id: 99929990-5fe8-4948-9387-08de53bac448
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2FzqERKj5hFy0WnexV9E7OEni/jF0nx4NqyE229xaxTnPhMlz6Fs3lVzEFiJ?=
 =?us-ascii?Q?rPAI9fGzIaElMFAL5wK7I13lcGt0DilHcyyvNTgR5YkCvddhhZh6jvSDXE7m?=
 =?us-ascii?Q?ndL+E8A6CGOmBs3unv4hQYyQ1WP4HZlnTNoctFbmH8VoUEG43UR4alxbsnJy?=
 =?us-ascii?Q?YXzjGWkGKMtkAaBGZMKybjuqEkHYbBf/wkZVhKEsKUTBSAZdkjHubVeg12eI?=
 =?us-ascii?Q?NG9+UX57KRbz6Wv4VTdIPZQreMnse3xI/ru9o5diV3AQmRWbjgdUrKQok6r6?=
 =?us-ascii?Q?v0yiU6stVBHuGnMLCbVXw9qNOet3IAo/crNAGqAyGWn3gUuk+a+/ZyNzCGEn?=
 =?us-ascii?Q?Wlp8/ISnKwrSNxP8jcq1ZJqDcO1sRws5QIkOVY4DrXuCz5LJ1NX3igM9q2D8?=
 =?us-ascii?Q?PuObQsAlIMUFpQM0ahPHV1pC6YEq5Wr99NeGaeScvCFPD9LqVjBLki2LLPgP?=
 =?us-ascii?Q?ZMXgEEL+KXIuQd3IbOCADQQMilmKJJXWBOvR2wGB4saAcTvawZBJMCx2EwOD?=
 =?us-ascii?Q?zojciwGZHIzviJWp345UbDH6kXoCeH2wVteWgFDV3pghQxluio+TWfLfhm9M?=
 =?us-ascii?Q?ltDnWu5vxMU+iBKh1+XwG7DZ9RMc6d5UyTMY+SJ+V+jL1vk+VPPF7+wFKdMn?=
 =?us-ascii?Q?mXxnmladdJaULD8HDCJo0hF4BKTjSFIuMaMKsB+/mRpBJribZuIzKXVv4IHp?=
 =?us-ascii?Q?sWZ+5AQncHHh1p57SJuew9nROghe19h3lQW5xDpOEW2nOIZ9H3xcF2Jv6MLT?=
 =?us-ascii?Q?F7V964mTh/xeSj4TvTjeO8QvK7ZD+DKmMeWZkQ3ZFSRIr55wrJvs1b3x5aAJ?=
 =?us-ascii?Q?hEhjfqI5ol4F4prugHl3f15zBgBLdM7EPXsj9xuRYa7V99jL+Au63JrWK08F?=
 =?us-ascii?Q?9PxMYP4BBpol+jAg4tZGJEX5Venn8oZpjf4hTQfvCsRxP0Xq4zhTOmqPWG7P?=
 =?us-ascii?Q?d8si+yZCQY3tDzdkuUrWhNgdsyJVDsbfVtCcitUR2iET0JpqgxlSYeDbDLlH?=
 =?us-ascii?Q?Vpbp8nuVHmqKxf+Z23/4ggtXLyXa1Ep9h5ckAj8ZPvkB/Mu3f5ljos0jlF9D?=
 =?us-ascii?Q?V34j+4dmUnFss+RCuR7qifXqyAm3O+5i075T3jYwPAaLxiOIQBpbClQr26cQ?=
 =?us-ascii?Q?T1zt2WU0Jix017AxZYv2bYwHdKEjo9dwOsIxiDsCAH1NO/IgvD2mmlCZuepR?=
 =?us-ascii?Q?JGZxfq4N0OsA3PZkfyra0lDSK3/nD99Ut1s4vk2WFWG6Nx1X9uWwdF7l//QV?=
 =?us-ascii?Q?+DoY3xaTBYzMI5hbFJIgczdq5ji4apJ0bVSGp2BsFenbgCVV/PelWfkyRKG/?=
 =?us-ascii?Q?wXGDkx9EBU8cwE5txp1qScsUpaf946GYTm5oPhFMErpsY/l+8kKEwJQv3JVq?=
 =?us-ascii?Q?hNfK8Cr4gUWnhPoTXdobxJ6YTVwCJ+t9q3Y6tpqpJogDYddmLRbGkPA20mNc?=
 =?us-ascii?Q?kFVJIFXQRzwJe6aLUPrMW3dabXTfcSfne+fDK5ogkSF2WH0MuUmNPfnjcz7k?=
 =?us-ascii?Q?Lh/A+ANyGVv6t8Ydok+qc2WmgDIOoozWfqCb509o2/K3pkwaszx8GgX5CeLt?=
 =?us-ascii?Q?ZnIKJy+hctMjJx29lEl6yQOdfcVyBDC/DzcsV9IUSIMcXI3hpm6TiqHFucqk?=
 =?us-ascii?Q?tDHsSLin15T02IvJ9A1bA5ctQ35w/RYW6mUMljCewWOw?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 22:17:55.3964
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99929990-5fe8-4948-9387-08de53bac448
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5612

The hp-bioscfg driver attempts to register kobjects with empty names when
the HP BIOS returns attributes with empty name strings. This causes
multiple kernel warnings:

  kobject: (00000000135fb5e6): attempted to be registered with empty name!
  WARNING: CPU: 14 PID: 3336 at lib/kobject.c:219 kobject_add_internal+0x2eb/0x310

Add validation in hp_init_bios_buffer_attribute() to check if the
attribute name is empty after parsing it from the WMI buffer. If empty,
log a debug message and skip registration of that attribute, allowing the
module to continue processing other valid attributes.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
index 5bfa7159f5bc..5bee916429aa 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
@@ -781,6 +781,12 @@ static int hp_init_bios_buffer_attribute(enum hp_wmi_data_type attr_type,
 	if (ret < 0)
 		goto buff_attr_exit;
 
+	if (strlen(str) == 0) {
+		pr_debug("Ignoring attribute with empty name\n");
+		ret = 0;
+		goto buff_attr_exit;
+	}
+
 	if (attr_type == HPWMI_PASSWORD_TYPE ||
 	    attr_type == HPWMI_SECURE_PLATFORM_TYPE)
 		temp_kset = bioscfg_drv.authentication_dir_kset;
-- 
2.52.0

