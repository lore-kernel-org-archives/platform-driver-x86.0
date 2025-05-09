Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2072.outbound.protection.outlook.com [40.107.220.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928FF26C39F
	for <platform-driver-x86@vger.kernel.org>; Fri,  9 May 2025 07:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746775676; cv=fail; b=YJEvOhc9KQmljaYyvp/gL82DG90hQIE3f3rnQ5nbL/oSfy44k+PjfbyPq4lDBciXUDJFaEOnHWV7ZsGypwEei6ViaTSNRMtN5cV9zvMcqSDNt+2qxre4mNjYhq7PB6dF12iVdxB8GUscEYrRjy5s7Y15LdlpFyMUSaOWUaMtiiU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746775676; c=relaxed/simple;
	bh=+v4Di8UMi8QMcPTUjD9hSJNRO97Bf6ZwUSvwrq8b6PQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xv7VPfMEtVuNxx4PkF6CvTKLtk1tevVUpyf9ENFPG9a6UiKhZp8jWBRgNNzscys62ygf+5xgJqdL5bfCvlBFWy5xw7vYrylN3kcuo82kVGDJZ8MiycgWe6hnEyfudW/5LN7T9Qlg4NzwMeKVP35XIrC8lVjYDAfgxDiV8MHbCLQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=vamNOPWU; arc=fail smtp.client-ip=40.107.220.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="vamNOPWU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g9kzb4QbyeIKrLC1KvHvnbsjKmV+TpBoP/O3wbZ6gNM6OUepWwDwXzSXhvqeJ3tJzGUAnhybvqeaWRBexS/kStR6yChKvB+aXHMxl7f+fnyyNQ5sx8TiqhieP4q5amo4/5YjJwT6bbejHuipa1pUJCj1nL5lXZtLqMWaNjJmcKstnEIQXiKpY5ujwsiGRWnPj43Ek7lhM81GUMngoKhcxirCemEF62HtVdMvw5R2aLkDM7tKWPPMJ0Ze9HSfpRY13inSFSPJAOMskLVX99Nhg3Adnw45Q+Dwln4uNfAK9T+NZwnF+E5DSILaoP0ZksgUu3CklFfOd1G47sKB9sWyKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QfltJkltCl3K1B6g6ZvvFN7nvGYmvjxRfYfP7x0IVrc=;
 b=CQg03PJ8EJlOISIBL0dcFim5jN2SHQxfNfiuZ92VPr1hxbE1+UFPzMK4/S5v4QOXTPDanTEWmVlspYvJRhwKnSfTjxy6TD53PrBIVF9tgon8sHn9HJMTrK1jRFerci8AP0AFdIlUi++rRSyOvIF6KX9jfAVhcACvqhx2nXeb+ikeQkMS/xMODGo7V8wHTWi6KsI5eQ1gpaFPxby+pUhlLlBCYKN4K2qzCLYlKoQxNU5xIVmP2bfTsPGgMu8D5UzPdUZAsO2oSGWOS3gkxshCpbS1mgKjW+NIgjiIffznZSWZnP9AtuIZ6YCSb7a10RkTiT15y06vdyizYxShgaym9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QfltJkltCl3K1B6g6ZvvFN7nvGYmvjxRfYfP7x0IVrc=;
 b=vamNOPWU8GEbmcAyL9i9ptfyYJ2Yeh8k1pijvtDaQk7/6FgeeVigvumOzln0lb+9VU4jmdCNR3Cld38IosXwxK2jPNA5bKAf2LIZko7BxIw3CpOzmyZcu13vYGafv1jzADZz/T5BHDhe6Z8MhOsF7LSP0rkHms5CVSftlfC+V4E=
Received: from CH2PR08CA0010.namprd08.prod.outlook.com (2603:10b6:610:5a::20)
 by LV3PR12MB9185.namprd12.prod.outlook.com (2603:10b6:408:199::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.25; Fri, 9 May
 2025 07:27:52 +0000
Received: from CH1PEPF0000A345.namprd04.prod.outlook.com
 (2603:10b6:610:5a:cafe::b0) by CH2PR08CA0010.outlook.office365.com
 (2603:10b6:610:5a::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.27 via Frontend Transport; Fri,
 9 May 2025 07:27:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A345.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Fri, 9 May 2025 07:27:51 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 9 May
 2025 02:27:49 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, <Yijun.Shen@dell.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH 05/10] platform/x86/amd/pmf: Add helper to verify BIOS input notifications are enable/disable
Date: Fri, 9 May 2025 12:56:49 +0530
Message-ID: <20250509072654.713629-6-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250509072654.713629-1-Shyam-sundar.S-k@amd.com>
References: <20250509072654.713629-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A345:EE_|LV3PR12MB9185:EE_
X-MS-Office365-Filtering-Correlation-Id: f12d0c2e-213a-4c5d-73ed-08dd8ecb01f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4aXhTHdJSoEyDvWq2j3YiVFol7oy6F9SOhbd36snIO0gV0mBvSe7tfB5YPlK?=
 =?us-ascii?Q?+kRhXxeQ8nyW4q+dvgBNP+OdKzSwqpvw+fZxE3F/aqCG8on0qhX6NXFe/htB?=
 =?us-ascii?Q?I6nBbBdY0dXkmCrA6Gt/KKMD/9X/Xg55B2oSMi0t6a2YoQok9328YedDo2Ji?=
 =?us-ascii?Q?u/Y7oIiTY/5a1mEI3zc052E+G0upfpgHQnmwJvfPxcRPeC3VxIB87ux9ZPWI?=
 =?us-ascii?Q?KPkCP0rge6Dk66cryO1Iky9ifgHlWPIWBNK48REIQkzwMLVxmW4+UgXhQenv?=
 =?us-ascii?Q?iJUHwQPhVNzmf/whrpGaxOvmqDeI3aSI9o7rD5KJR1LTfVB/t5xhjfRvhsiE?=
 =?us-ascii?Q?um1O1DnZ1jh7mo/nVFkPsOZzRX4cDj4CdyqbVTC1C20475QGfgkEhoi2xSCW?=
 =?us-ascii?Q?cE4gT8KVlDKTEup82Ivtu9vXqwN5Jq8+uAwF1iOSincPHjd8AAPJ7zHMAp9N?=
 =?us-ascii?Q?pNbJ25N5RBQOGGpwaDClm7UYCA4mzU97BQBY7U7Bsr5TdhhjpWyTbSIv0YBQ?=
 =?us-ascii?Q?LTCJpdQndUYkju2RvFpx0XfT7sCPUVkELHZ3Y6793wN2zz0cKUt1XwMb6G5D?=
 =?us-ascii?Q?+rGw3O4salCRLQQ4k2edkWtwPIOELfCflLgH9HOhnSV7ChbHOaPe4phtjwmO?=
 =?us-ascii?Q?YtelygTwzsHLt748t6lzd0FflUHqo9UQLqTuboecGMcyAvMQIZ/6ASPP83rL?=
 =?us-ascii?Q?yYGOyRS5J5BymmI6vdhd7JY4yA44QUQNninzh+gFWJ3YfKUfc1b+x3wX4B4o?=
 =?us-ascii?Q?bYXzCPSI8jEq7A0L3MiWwAzaz5wKAIxPApFLzjh5zLC32shQ9ap4WbQBLdFJ?=
 =?us-ascii?Q?ugAwBWztGVKH9QP+4TDgF5K9gvfR8HK8ahSf7cPVCjBxK2uzcNN1ZRIwxkgs?=
 =?us-ascii?Q?QVH/gJUOzKDK/vM6WHQ12qbpvUsE6GSO+m0J9I0p9tMg5Jp+qWWLStYOVjiW?=
 =?us-ascii?Q?By4sRLpaNNi2UJP3Z33pJanGSLFB0vsr5UOJcIjbIlRFUHqG5z7U3rAWri2n?=
 =?us-ascii?Q?txcFVJJEFyrdIbZKpiVX8zQ+IJTWvs491BA9lOkJamniZfy8INDVrcTwCvGd?=
 =?us-ascii?Q?N5A5mNx0haRy2jag2Gw/BI38IaAGp9Yz96KQGRWchDbKc6A31FI3JBA4eEYy?=
 =?us-ascii?Q?m56ZF2ikerQ6P8Gw+QnVK7r9NgdTmvAtZslGruxZAD9f43plvgNfNOdPKpNe?=
 =?us-ascii?Q?x3TBizk1YyTU4W2fzWZ9Es2TzsMMvi8GqOJr0Vxq2F6ga+uDskVvO6VF1Fdo?=
 =?us-ascii?Q?ls3jDc3FqetvzmA1qpAAQYd6TDzWGFec5Trtz/3cIrPmt/gCZcFkE0zNNhGX?=
 =?us-ascii?Q?ECZ5dqbwjqsy3jod85PAq9bt4hzti2WgLQ7WEPg20ginus9ArxitfEvR/wGM?=
 =?us-ascii?Q?l6wDAz5xSongEeIxBGjypWNwkkC3M+OkmVFd5s86rvnQY/xweNUcZ4hPwJ1l?=
 =?us-ascii?Q?VgMs9E2iU9sZ1uOmIH7C/3HPB8lF+1vSDFdDh1xijboL2xsqRvd1imK88P8D?=
 =?us-ascii?Q?6fFEprui8cjkLbuOsSJOeuXYp5Zo9/4jaVU5?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 07:27:51.8116
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f12d0c2e-213a-4c5d-73ed-08dd8ecb01f2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A345.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9185

Implement a helper function to check if BIOS input notifications are
enabled or disabled.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/acpi.c | 7 +++++++
 drivers/platform/x86/amd/pmf/pmf.h  | 2 ++
 2 files changed, 9 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
index f75f7ecd8cd9..ab63582c9d0b 100644
--- a/drivers/platform/x86/amd/pmf/acpi.c
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -161,6 +161,11 @@ int is_apmf_func_supported(struct amd_pmf_dev *pdev, unsigned long index)
 	return !!(pdev->supported_func & BIT(index - 1));
 }
 
+int is_apmf_bios_input_notifications_supported(struct amd_pmf_dev *pdev)
+{
+	return !!(pdev->notifications & GENMASK(16, 7));
+}
+
 int apts_get_static_slider_granular_v2(struct amd_pmf_dev *pdev,
 				       struct amd_pmf_apts_granular_output *data, u32 apts_idx)
 {
@@ -385,6 +390,8 @@ static int apmf_if_verify_interface(struct amd_pmf_dev *pdev)
 
 	pdev->pmf_if_version = output.version;
 
+	pdev->notifications =  output.notification_mask;
+
 	return 0;
 }
 
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 27458a7c221b..2deae43aca63 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -377,6 +377,7 @@ struct amd_pmf_dev {
 	struct resource *res;
 	struct apmf_sbios_req_v2 req; /* To get custom bios pending request */
 	struct mutex cb_mutex;
+	u32 notifications;
 };
 
 struct apmf_sps_prop_granular_v2 {
@@ -799,6 +800,7 @@ int apmf_install_handler(struct amd_pmf_dev *pmf_dev);
 int apmf_os_power_slider_update(struct amd_pmf_dev *dev, u8 flag);
 int amd_pmf_set_dram_addr(struct amd_pmf_dev *dev, bool alloc_buffer);
 int amd_pmf_notify_sbios_heartbeat_event_v2(struct amd_pmf_dev *dev, u8 flag);
+int is_apmf_bios_input_notifications_supported(struct amd_pmf_dev *pdev);
 
 /* SPS Layer */
 int amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf);
-- 
2.34.1

