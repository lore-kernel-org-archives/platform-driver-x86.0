Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2060.outbound.protection.outlook.com [40.107.243.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CCA179A4
	for <platform-driver-x86@vger.kernel.org>; Tue, 13 Feb 2024 07:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707809866; cv=fail; b=ib5w7QXYaU4HOfX1CH9wa8kgh8V6094QSSsvALnp2dIjssOo742ZeUR4FW7M/JT6X7WRAnY3ux/2Spoklj+Kex7cvAuXlqJemJ+Tm0nahoosF5bE9i8IQAfn2wpmPhb0MvGM5qyT4OJMXWyYCVQ83QLGl+WHz3WB79ZGmHHBwYw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707809866; c=relaxed/simple;
	bh=FpE4hHi3QH1F054nj9Nawtvqo6Q1NCPZPa9Zy/Xtmsg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uSCSlCLN/vbxqJAuMzdmNdV44ODUnNk2A4lva+mNVt8gxWUboOmgv2rkCRuN4ugZxu+IYHFSmYMIF35OGYsbiplHJvYJo+O8EtonEZ2mahfq3sHRhjA8gB9EucmoS3ImG9eMj2JX0nbbSxFgCUQQv25hdyzBl/AhSjQ1LdGk1KA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=XZ8oH7Pm; arc=fail smtp.client-ip=40.107.243.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="XZ8oH7Pm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FeU2SwCObhtcb1Ld/qtYSc9vwuWxDelfXbkFKGX/GNqzTDBcQ2cl0VfRfed99Z/nQTC4t0HqpAUYK/qMhkRXvUMEm9qT25Yxxp655HXgOOGpUW5uGY/OgJhN+HM5AjIFZqOUA94J2pMclBcRcQr8gtQKM4Qhkf4IcSsJdMgFCKmkVRumwkyHzslw1J1gb/v4l0KKBk8K4x4l1rbI1DQyubOz373pekUtDvRkvijD0Nqu7fCyzPg5RLob2fLCKDn2GeDLGawdWq6pdVxCS6kFYz88mQsgKDjvPoasWO+LNQ4z/OUw8348avQIoLTI7n34JkCv8pX3/w/j9rrJcHTwbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q0YUmZTN6hUPb/cbLidrnjiKn3RpepEW/AnZaN59mNo=;
 b=XbpwwbmHeXWVdYDvWP1Z3V8PguqhMx418Mma8bgJCHqQ24Djyr4HBu5/nsycqT7hXWQ8kXtPRD8eaq6OQ7ZwKaqbNneEidrzH7ahLwvQN29nl0b90OUnE1E7GZG5RHDms3ZpLhzqEGBP+kLE4ysGoM5w3QzVdedewwe5IhVoie/8lSA0o4tQAOrokfd9V7goUOTdDWrhJctncszrnj6WKXTymDBZ43cDESGZlaClmZ92dVS9cHz4vtLtiQfy/sXQL0aHc/POPqxSnlH9XmUnlmeSugXtSpJK3orhS6FCr31wWUDS3LNHUhCZHxwSDjZkibk4cwSLtkWiEAdNiPNKpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q0YUmZTN6hUPb/cbLidrnjiKn3RpepEW/AnZaN59mNo=;
 b=XZ8oH7PmGwNkDO4IOJWtFSYqDBl0JzfslzsT+k2K5DnXQNebsLpGbxEVifNnvM/rSNX8Iq6HZDFf6s1n2PPknfxCpWQCTjAIqv1CRsaZ/1U4jDkttLi/E+dGCU8bHFX/v+mAqJ3OMtmuQ0fMUVuBZ+7h3vkAeowVQjyFbSCpfP4=
Received: from SJ0PR05CA0013.namprd05.prod.outlook.com (2603:10b6:a03:33b::18)
 by DM3PR12MB9325.namprd12.prod.outlook.com (2603:10b6:0:46::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.21; Tue, 13 Feb
 2024 07:37:41 +0000
Received: from MWH0EPF000971E2.namprd02.prod.outlook.com
 (2603:10b6:a03:33b:cafe::14) by SJ0PR05CA0013.outlook.office365.com
 (2603:10b6:a03:33b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.24 via Frontend
 Transport; Tue, 13 Feb 2024 07:37:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E2.mail.protection.outlook.com (10.167.243.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Tue, 13 Feb 2024 07:37:41 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 13 Feb
 2024 01:37:38 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 1/2] platform/x86/amd/pmf: remove smart_pc_status enum
Date: Tue, 13 Feb 2024 13:06:50 +0530
Message-ID: <20240213073651.404220-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E2:EE_|DM3PR12MB9325:EE_
X-MS-Office365-Filtering-Correlation-Id: afcda7ba-22ac-4609-9929-08dc2c66a8e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7g9x5mVNEGp39ZMoRHLhyk73nJ+ZG6sCKsSMQhcWdhPHUqgU09RFT8XqTSj2FNj+amKTxFVwFCMj8FnyHKofnYK4ZqBt5peI7yLR1lZqsreW8op72yGE01/O/Y1QOnCbs61rwTrfW9b37aNAaric1B4nnDTnaAdhOGRMRvYsLH99fvUECDcsDapW2GpwUZhBdfh32l/MDryWezvxcYq/jEQxzNRowfy/6JTksU6CivP+YBSCHvUKwVZT5Qf5tjYw9XkL8FLbsvDX9JmNRs3r4HgO60m80NY8G/V+dwHAEO6nK5eJfIq9Xd4fJDBsjJizbiQXadx4nqOvGPNVlHrcyPfpJSyZou4h/4Q4mnKRrgsoPSRsaxmPNvlj4y4+otBV5rBodPoYIsddNY8d6TGCLoExh93gZFIaEdArbqbT/2zuMEwIZF3f7k8KPBz0FY6sBGElhHVWvNZhsebnHWM05rrv7llMRMk80RnnD0sl5QvY5E5Jowr5ewj/xZzuseyxiDi+OTXlo+8Shy8CH8/yFmssatgpC4Eb2BLPe6xngglt1i+PJlkQFzHpkMdwKU9AUkm3rB1bXs7udOPa3p/6CT7fSsczyWNlbEMDjURsv/c=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(136003)(376002)(39850400004)(230922051799003)(82310400011)(186009)(64100799003)(451199024)(1800799012)(40470700004)(46966006)(36840700001)(4326008)(2906002)(8936002)(8676002)(41300700001)(5660300002)(356005)(82740400003)(86362001)(83380400001)(36756003)(54906003)(2616005)(110136005)(426003)(6666004)(316002)(1076003)(336012)(81166007)(478600001)(16526019)(7696005)(70206006)(70586007)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2024 07:37:41.0005
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afcda7ba-22ac-4609-9929-08dc2c66a8e1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9325

Improve code readability by removing smart_pc_status enum, as the same
can be done with a simple true/false check; Update the code checks
accordingly.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
v1->v2:
- remove enum smart_pc_status and adjust the code handling

 drivers/platform/x86/amd/pmf/core.c   | 2 +-
 drivers/platform/x86/amd/pmf/pmf.h    | 5 -----
 drivers/platform/x86/amd/pmf/tee-if.c | 4 ++--
 3 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index feaa09f5b35a..ff0d61a56484 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -351,7 +351,7 @@ static void amd_pmf_deinit_features(struct amd_pmf_dev *dev)
 		amd_pmf_deinit_sps(dev);
 	}
 
-	if (!dev->smart_pc_enabled) {
+	if (dev->smart_pc_enabled) {
 		amd_pmf_deinit_smart_pc(dev);
 	} else if (is_apmf_func_supported(dev, APMF_FUNC_AUTO_MODE)) {
 		amd_pmf_deinit_auto_mode(dev);
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 16999c5b334f..66cae1cca73c 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -441,11 +441,6 @@ struct apmf_dyn_slider_output {
 	struct apmf_cnqf_power_set ps[APMF_CNQF_MAX];
 } __packed;
 
-enum smart_pc_status {
-	PMF_SMART_PC_ENABLED,
-	PMF_SMART_PC_DISABLED,
-};
-
 /* Smart PC - TA internals */
 enum system_state {
 	SYSTEM_STATE_S0i3,
diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index f8c0177afb0d..8b7e3f87702e 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -260,7 +260,7 @@ static int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev)
 	res = amd_pmf_invoke_cmd_init(dev);
 	if (res == TA_PMF_TYPE_SUCCESS) {
 		/* Now its safe to announce that smart pc is enabled */
-		dev->smart_pc_enabled = PMF_SMART_PC_ENABLED;
+		dev->smart_pc_enabled = true;
 		/*
 		 * Start collecting the data from TA FW after a small delay
 		 * or else, we might end up getting stale values.
@@ -268,7 +268,7 @@ static int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev)
 		schedule_delayed_work(&dev->pb_work, msecs_to_jiffies(pb_actions_ms * 3));
 	} else {
 		dev_err(dev->dev, "ta invoke cmd init failed err: %x\n", res);
-		dev->smart_pc_enabled = PMF_SMART_PC_DISABLED;
+		dev->smart_pc_enabled = false;
 		return res;
 	}
 
-- 
2.25.1

