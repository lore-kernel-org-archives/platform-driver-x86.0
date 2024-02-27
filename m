Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2080.outbound.protection.outlook.com [40.107.244.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E4C1386CF
	for <platform-driver-x86@vger.kernel.org>; Tue, 27 Feb 2024 12:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709038566; cv=fail; b=pt5sdEhS30zBCqvB3MMIB/ivNl6BbhpYvZgBk6PwGzpUenbJKwAMQX6Ob7rzwHCSRa1hQ6ZOfr4xJcKu/sx/FIZmeykhG68/mu4009uZ3TmJ4OAHlmUf6o5VArNlluGobsyurC7ltb9y3nhpH6dcaimXgBT9Pz9qiZTrbd7qsRE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709038566; c=relaxed/simple;
	bh=POl0k//QV8QvXRyYx/rfoJxMQJVqreEoqZHQllZyAdc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y8mZQQI9NG+B894F4PqPaVJHNX9mj56xkuaXisxedRbIlcx9toGlBI5T/L8XQvoCooQnUYQeToWtsxzgd23F2lHMdl4js6cj38EF2b2ICQypsHKJO02P1c1XGMLnS4/fUoNGNrL0TiHA770JTRdHyMH4JUZLXi7DUxChb/by604=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=24ytN89t; arc=fail smtp.client-ip=40.107.244.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="24ytN89t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hdTf56mqIq2VAvq+d0zfCoug4/3bF5HDSrcesYE/xtJIvOxdJDk+0KTA2Ev1Ja65SoweRVxTshA6UU2LvlMA+O/d5DEu+VaY2WQIzrOQkm9uH2Ltu8SPRc1M00HDcRPmZOI4mteTGfmIlXr52Qfvr+h5qnMXIjY5DCYW5mEKJsGkZksOfN/dc1bZoCWDEHcy0I8gFIUwmrEMdTwIFAUtE0JsHXgupbD4FBbUYhGMDZMDKNL/Mb+gP3WxVow/jRMza/bHd/IIL3sbJZY/jTdh24bHxAo9F58e8u5PHxAdBo3FpRcQPapH8pU3ebonaXFnJdfVK+H6wyDHZOLUvptoEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tP/ijOjjRdCibl+hSZpg0ZeEPPHy5GuHyrPgzH1W9tQ=;
 b=TGVyDYwPyzhvSgHEu0gH19WgIWWntRHO7MPKr0JJJL7j6KR+NfuMzGTgCHtNbPrWTAmJLV4FsqkVh3CoOO+vXbH0WZyI2au4QhRSr1HGUWvJF5pdhMINOJsbXXHg3FDlQ8OGr2oguaLZNHnl7KVTeNxKVgtMVW/Ow2AjzvxEumDh8sU4lfJ/dlpTrpDry41WCW1f2z4sm3Y67IOK1Fw83dm/aSG6Awb2PrtwFBFhA5r91Cmad59msv8WGFb9vF6EFc8yfR/yFdz55Eayn8cwdHb28fjqBku5wyrwpCZsBRY5QnbgF56/Dv0+Ze6Eyi+f5bTZI3M/ZYjqLTUaGHcJMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tP/ijOjjRdCibl+hSZpg0ZeEPPHy5GuHyrPgzH1W9tQ=;
 b=24ytN89tid0EL2OMehGvSdMRiPQPkkHynV+mDJxr4L3oD7bd2l4GjOnvRe4FaGwT/c2SxF5EtfaVFTUmfJwxPkWYGuoaIkfLyx7A/JJbOtyE3IzU1tnKvaL3wVETQ8xaAgoyFUU2db5lrAW4MWThZ3IV+aNioRGQAAhFM4rCT6k=
Received: from DM6PR18CA0010.namprd18.prod.outlook.com (2603:10b6:5:15b::23)
 by DS7PR12MB6144.namprd12.prod.outlook.com (2603:10b6:8:98::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7316.39; Tue, 27 Feb 2024 12:55:58 +0000
Received: from CY4PEPF0000EE3E.namprd03.prod.outlook.com
 (2603:10b6:5:15b:cafe::df) by DM6PR18CA0010.outlook.office365.com
 (2603:10b6:5:15b::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.49 via Frontend
 Transport; Tue, 27 Feb 2024 12:55:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3E.mail.protection.outlook.com (10.167.242.18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Tue, 27 Feb 2024 12:55:57 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 27 Feb
 2024 06:55:55 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 1/7] platform/x86/amd/pmf: Differentiate PMF ACPI versions
Date: Tue, 27 Feb 2024 18:25:14 +0530
Message-ID: <20240227125520.3153140-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240227125520.3153140-1-Shyam-sundar.S-k@amd.com>
References: <20240227125520.3153140-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3E:EE_|DS7PR12MB6144:EE_
X-MS-Office365-Filtering-Correlation-Id: db246728-4398-4f16-72c7-08dc3793710f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9M0cjV/p4ldfloGXMSn8b9Bsbjnq2iMgIk6Akoew/S0Iuy43oQExmUAZ5OeAt45M7BPxG2baW9BpgCqXRuIFOuSgoYOi0+BtbuFzwMcTL6guMGUW5dUsVhAif0HaJgByBCq0uYctINtXDiDcMms1cJJKh1Dqt9BAvViVmFy/L7ISVLvJlZKrycSjg7mH4fDYpX5L9f4mR3kZNGN7yR3xY1dJZlbalU9fVerI2JwK9pvlt9WTi1r+Xp0R6bYM7Sg4dU5lC5ZKpF+RqmHbhwrQX+2FeexP8d8k08v5PZZm4KXoQujgdCwyThzySratINS51zfoflONQ9kOcrS0GB6/f5VsyCZeqcGMG6DAvJuHeL39CnN+begjCfZ6L3Pue3x/gC7Z5wJRPFqgm91DNWkMc3f1+9W7L6qsbQBd4vOZY5GlpWcs/R3I9S8rSnH9zlVEMCikTdVwLM+NP2HL3Mslh/2TTMum48wen6KzQJGnOqpePJdeaB6CqBhGtZ3hkF9mjjplp32YjSQ30bvBMZoX6HZwkyqKNPzc8Quq+/MWnsjXWw6JHCyPlid4mJ/vswiG1XXVISgB9CN0HreqLnQP431tH5XqXjmVMPQln6ectRZoKIDJvYzB/nDCRdUsj+cQoD5eTBz3JTlrbGwfL9IOJZolJ9sV3fWlHCRVyroSzPp/WEMAVK3Jeqqvof6zBCIQN/E9m1oip39JvWndTJgKUCVbkntw9uYAiEwNrHO51tFQT2YEq0mAnPqd2dmjl7lY
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2024 12:55:57.5232
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db246728-4398-4f16-72c7-08dc3793710f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6144

For family 1AH, certain PMF features have been enhanced - leading to a
newer APMF (AMD PMF) spec (BIOS and PMF driver interface) called v2.

This information would be fed into the if_version field of the
verify_interface method of the APMF call from the BIOS.

Use this information to store the version number to differentiate
between v1 or v2 and also store the information into the PMF private
data structure, as this information would be required for further code
branching to support the latest silicon.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/acpi.c | 6 ++++--
 drivers/platform/x86/amd/pmf/pmf.h  | 1 +
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
index f2eb07ef855a..1f287a147c57 100644
--- a/drivers/platform/x86/amd/pmf/acpi.c
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -218,8 +218,10 @@ static int apmf_if_verify_interface(struct amd_pmf_dev *pdev)
 		return err;
 
 	pdev->supported_func = output.supported_functions;
-	dev_dbg(pdev->dev, "supported functions:0x%x notifications:0x%x\n",
-		output.supported_functions, output.notification_mask);
+	dev_dbg(pdev->dev, "supported functions:0x%x notifications:0x%x version:%u\n",
+		output.supported_functions, output.notification_mask, output.version);
+
+	pdev->pmf_if_version = output.version;
 
 	return 0;
 }
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 66cae1cca73c..e51ac981af73 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -231,6 +231,7 @@ struct amd_pmf_dev {
 	u64 policy_addr;
 	void *policy_base;
 	bool smart_pc_enabled;
+	u16 pmf_if_version;
 };
 
 struct apmf_sps_prop_granular {
-- 
2.25.1

