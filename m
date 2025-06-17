Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2058.outbound.protection.outlook.com [40.107.220.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B239A2609C8
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Jun 2025 07:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750144487; cv=fail; b=fiCv82tIVi2p8V7+wsHDTUHiKNmLK4BnYzzZEElIBtH6+PMz0nzalad8GYE76zPU1b9bq+Chh+mQ9yxocC+Y4jL1uumEDnJbAsCLDhmjFR/ZDlKaWW8XA1kqq829DqasNKS19frg29vOhOTvjyly9JKFMQO4FrWBmfgD0KNcfW0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750144487; c=relaxed/simple;
	bh=Dk7dzoUp91kcmi1pBLqUQ+q23fNQrVTuS71k4NY5Agw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o9dERxigwHZU6I4Ivp38eEvjlirfy1JHJYHnLUXfXAdpK/dlgnXwa1E5JI7xDphxGzoXUtaoOa4MVROvDKNAtbWRMQX3zd0kSCbcYEwBIVFak2Les+3V5GfIu0y3fFVt+6IDmoFd1yf3L44/aYq7l5pXMOe6uYydmrR5eeDg2Wk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=HmEz6Cqf; arc=fail smtp.client-ip=40.107.220.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="HmEz6Cqf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ocb22XASVjex87cN4v63WBBxKDS1Qo3Wj++4aplVySbM9ZdQMKRQG295vpZu9QPXLbuLkNQUGzhWxERyavvxpUfKtueN1UYfywYEDKb25g1/DilIPsCcUe5zRQ/M7MFLPJLyKx2FPylrCT2Gf2llzCsA4N91O0ESEVX9pk01Hly2eYr6QVBmyn15Sa7/GrplVeOawdBVUBSiLz6tP2MpU77bp5nnhn0PDAu/FIoze2VLLNoWJWJ/96fDGDGhfMGI9bjR7+wEvo+rJcjQuK4/+MPFscau9qtUu3GMn4T6Kr83USAziOU4kz6mF4NDmI+thIWnv5FQIjD0Jr5x82G7Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gp5tE86px4DDSXn63UCYPqNWEOaQmpGTsZHO0VGuJI4=;
 b=rL3tL+Zo8smlw4KEoiVTHeU3KJRJRw5MSpLFTTLub5DcHw1PhlKnw/lzKtc5WmIl8UWWDAUflgIlpewKR4x2rGVfqXjDki1jFeYnPM4XMsCF6+i5kYgDgtslcSnt80s02A5ccFauM5nlOWlQqDmxUPMduT+5vc6m4B+v4riCBkqCNc9wLtp6FivmeHaVLPbV/2dHirKfMsB6hCFJk0RJmyTeIHSem51dGt9bjiZHQhBQDJ6df6v2e3lp/FQ39ISS795EB8Vil3frrNAKSIObC8F7ZuBl5aZ6hTq49LeBvwJgdU2r1JTUpzeSrBWXJvWvV6kW8aqpWUbqZU9Zom0QpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gp5tE86px4DDSXn63UCYPqNWEOaQmpGTsZHO0VGuJI4=;
 b=HmEz6Cqf2cryKMPYH+cp2qTZj+ZHeqawmx6mkzICFnjXOqIVscV3t8+kJUud89KvilXqvoiF3eYZ8FudJnE3QzVnEl2uE2bymXL+8Ys0+a4xPsYSud7JP8E3IjWZAkFKK7LcU/mml1jn0uwSVlVJ5QpwbClDhknpCu7C/qVzvWQ=
Received: from DS7PR03CA0168.namprd03.prod.outlook.com (2603:10b6:5:3b2::23)
 by SA1PR12MB8119.namprd12.prod.outlook.com (2603:10b6:806:337::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Tue, 17 Jun
 2025 07:14:41 +0000
Received: from CH3PEPF00000013.namprd21.prod.outlook.com
 (2603:10b6:5:3b2:cafe::18) by DS7PR03CA0168.outlook.office365.com
 (2603:10b6:5:3b2::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Tue,
 17 Jun 2025 07:14:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000013.mail.protection.outlook.com (10.167.244.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.0 via Frontend Transport; Tue, 17 Jun 2025 07:14:41 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Jun
 2025 02:14:38 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, <Yijun.Shen@dell.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 4/9] platform/x86/amd/pmf: Update ta_pmf_action structure member
Date: Tue, 17 Jun 2025 12:44:07 +0530
Message-ID: <20250617071413.3906284-5-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250617071413.3906284-1-Shyam-sundar.S-k@amd.com>
References: <20250617071413.3906284-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000013:EE_|SA1PR12MB8119:EE_
X-MS-Office365-Filtering-Correlation-Id: fafd7abc-5fb5-4954-0c36-08ddad6ea0d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3Ywwj6LsBBCwq7fYEFA8WROm4xZ8NnYaI9jtalf09YHjDvhXtHnIqFOSfFyu?=
 =?us-ascii?Q?wgX3EDfFf/hNolQdozxu3q/PZn8lpUJwIuqf0aSxTNAZcoTnEXmj+Svs3sMG?=
 =?us-ascii?Q?/QvxUAid4QFW+IQLllmGYUqbM7rDSj54zLhWe4GhPOW7yvtTMFz93lvCR2fL?=
 =?us-ascii?Q?UoW/PSz890+7rgu/hdJjXlucejo92miqvA//5Ggjl0SZ3HfZVFY8LSsa1D4s?=
 =?us-ascii?Q?mGkyT0FgKO8NiTphARgwq3uIwaapbYUOUMPSby6B2Ay9y6/ghv+oxbN5VGRx?=
 =?us-ascii?Q?ZCmpaQ8J1TpNmprgwONCf7WjkxUR7lkPBXzh8zEEkeS4qYorPW3JoU2d3AJv?=
 =?us-ascii?Q?G1BH6oL32iNKpRUB3CVkM9fy80iQQ8Q/Hrao5uAidxHQSCd8lOt7p+TRefAz?=
 =?us-ascii?Q?dKbWm8FbDqjXlKoovt3MEzef8vEuk0Bb/NMRqSOWHZqSjGtTE8eh+R0yI9AR?=
 =?us-ascii?Q?8pYDluiVUOVpWaAZPbV11VPp9Y0ayRlgzAWEZtSU0yPDU18bslOY6RZomfef?=
 =?us-ascii?Q?sVRrXGIFvT3Y+T/vicdcdWm02hAJ13VKIc4Qj6FNfdV2H64YnwzutzLLUtWD?=
 =?us-ascii?Q?fiUZTyYMfUzJKGUqkXLMpSr4ecsalEiqGHFlRy4qcZJaHwhItUrJp2Q7ZeIa?=
 =?us-ascii?Q?DYDVvL7tcIFPu1DdyaVKnOCLwWE+JTc+it7n+6u1cYZ5dfZie1LST4I2M4st?=
 =?us-ascii?Q?Js+Q6zymjSifsXayUUN99XEXzfL6KND1y+ew1PkJ+Ip2GBU1DfK+IIOMiDPX?=
 =?us-ascii?Q?yYlu0r15Ntd2S+g9LouyKaBPZWGijbg4L3gc4flWCwXcLY2tHRwymxURZ5Rp?=
 =?us-ascii?Q?QNFGQH/coAqURNWyvyKS1W/ufEZeDlr2gQyCavwTKP3YvXwMiNKwSJuXx3nh?=
 =?us-ascii?Q?GCKw92G1vlt2HcrV7DrjYGe2MIzsK1wkMhq1SgicV0TuOtuWF6amtxJ5L0uN?=
 =?us-ascii?Q?K3I/AUAu0IGdZn7TRyQ1wjSCKKfhw99ZIdD7FuVUOvphdnIiH4qZBvp1aSTB?=
 =?us-ascii?Q?Tl0mVNCCSZGnLCfqgSl3goizK9cDxxm1Eg6jnLqmbF+0eRuS8sPtOVPjTxK7?=
 =?us-ascii?Q?wdpp4SQmqrRE51twm9A/GuE2qUNymZLB/s4cZZD0lMgqVl8AdZZ/rbZhHZQE?=
 =?us-ascii?Q?eIxcZ7iku27BtELZN1UGucR8vTK3J+I3yVjpDbZVGYww8+urIe/jBl/w6rOf?=
 =?us-ascii?Q?gCCxGYb0iDldtlHMhrK+RsmHK4nCw8/hPKTZj64BlMaUOpeI179S2EAIcXYP?=
 =?us-ascii?Q?xkFvBs4Euci8FAdSCk2A+5L21ue/5NnkyGWPuH84Cgs0Jb1dHJDJLYrPx4qV?=
 =?us-ascii?Q?Rb/EkZboy95el3Zx+sV+akArOvn5bl36YnslEKehg1zKa4APvdPLkm6W/woC?=
 =?us-ascii?Q?PdwFGJS6VRbET6mA/JjvcivI9nW0F+l55713Ql8G+6g6H3yUbr+UQTTYsw1e?=
 =?us-ascii?Q?PhHrRa/KUM5SyyS3KszWwFRys8qnueIB/jKvNPOW+qsehS1hxrNaT8q0am8S?=
 =?us-ascii?Q?aCclTeRnMsDtdEmrnH8N1nK1TLcWVLVzT3Po?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 07:14:41.2076
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fafd7abc-5fb5-4954-0c36-08ddad6ea0d2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000013.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8119

The latest PMF TA has been updated with the additional structure members
for internal evaluation. Since this same structure is utilized in the
driver, it also needs to be updated on the driver side. Otherwise, there
will be a mismatch in the byte sizes when copying data from shared memory.

Suggested-by: Yijun Shen <Yijun.Shen@dell.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/pmf.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 10d658dd66cf..b65fd5310fe0 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -751,6 +751,7 @@ struct ta_pmf_enact_table {
 struct ta_pmf_action {
 	u32 action_index;
 	u32 value;
+	u32 spl_arg;
 };
 
 /* Output actions from TA */
-- 
2.34.1

