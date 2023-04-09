Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55EC9C77B61
	for <platform-driver-x86@archiver.kernel.org>; Sun,  9 Apr 2023 18:54:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbjDISyu (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 9 Apr 2023 14:54:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbjDISyt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 9 Apr 2023 14:54:49 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2041.outbound.protection.outlook.com [40.107.237.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6CB52D49
        for <platform-driver-x86@vger.kernel.org>; Sun,  9 Apr 2023 11:54:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZGUGC6rpN++0vHrHqYPp/1ydp/eHPSpVCsh6YgrYG82RAHHgnlbxvIQIJQ4m59Mhb/0pb81BFG2GPIe2dELkoEn8kHX9TmLXwxhy5XW8dk3FwXvNcDlKOjHNXzAiT6WkA4/f6CWfoyXYMNSdZ6elphrNKe2KyG5238OoWfiv5C/RWiM+UIGFd+gWrl9+Y+R9CDXS+StkSjdN1bQlkoMSn4ExtWisE78/xPGuXtIQe6iSptiShr0O+Et0XAPsUCWuK6YWMne9UJR5XVNICAaXCKO6Q6FLGE3NJ3mxOaBO4K8cJRvvvp09VNgt/oNIIPXk3XaRYnXzXErMllKKrLrz8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=noWXdNZ4/GJ6M4jUgLkO/E4+vRroT7+CylC4StW/uYM=;
 b=dRImY4iuoy5rzcJWIi/DxKcGdCw0JrNTTDE55nlnKmbyB1TuUtZc2v3pRpb/5Fb+OoFUbHBJOSZQISXCdDXZa3W50in7GJkz1ow4/Z9UQFpbOHP4TTGlKhn5QW22iNX1LcuGSXtbuikUz4MKsck+U6yaDr1237EV7xrovshsiDinLTISfTsc9gp9PZ3e+lATFCOplCQxErmXcFhctQSRWoD0lYzO4PMGN+KG5uGVqwKNuFcCns4NtF38QMVaPbBHQlPnHu73WeKg6ZYTKoDIsKWevFyOsgbMCqqXpFoqQCvyueUUckKjQCS/j6wXp2364F3yvK0m+5SdUyVAtfzNeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=noWXdNZ4/GJ6M4jUgLkO/E4+vRroT7+CylC4StW/uYM=;
 b=dp2Ha5n7FFwXC+RcFAliwxDgua9nxLcBIWF+dk7d43eIRxA1EVKQsnHVCG/LRalvb4s+uM5car035xSaLMhy+Yb0O69l1IJlahNalCGoisz7m0a9r0f40aeLQoSfCBEmwzS1zaA2dKq3GlffZISlfO6hcMsgPOyHEtrIkdxVRkk=
Received: from MN2PR16CA0015.namprd16.prod.outlook.com (2603:10b6:208:134::28)
 by DM4PR12MB7645.namprd12.prod.outlook.com (2603:10b6:8:107::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.36; Sun, 9 Apr
 2023 18:54:44 +0000
Received: from BL02EPF00010207.namprd05.prod.outlook.com
 (2603:10b6:208:134:cafe::ae) by MN2PR16CA0015.outlook.office365.com
 (2603:10b6:208:134::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.22 via Frontend
 Transport; Sun, 9 Apr 2023 18:54:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00010207.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6277.30 via Frontend Transport; Sun, 9 Apr 2023 18:54:44 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sun, 9 Apr
 2023 13:54:40 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>,
        "Mario Limonciello" <mario.limonciello@amd.com>
Subject: [PATCH 1/8] platform/x86/amd: pmc: Don't try to read SMU version on Picasso
Date:   Mon, 10 Apr 2023 00:23:41 +0530
Message-ID: <20230409185348.556161-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230409185348.556161-1-Shyam-sundar.S-k@amd.com>
References: <20230409185348.556161-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00010207:EE_|DM4PR12MB7645:EE_
X-MS-Office365-Filtering-Correlation-Id: 1365bfb9-9adf-4e8e-4295-08db392be202
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hs3wDbAmwnOP7nk4FPi+IdgQr2Bp/L06mjoRDkTgKpZ+Ewp64Eupip/EQ8DcnRzfc5Me7TJRQyDTQ/7DflRklHSWAxua+wit+YJs2pb+NMjlLceyJvL//ZToVAPV+kPexNiGor6pNopd29+0Ag4wU2JCOU+DarQP4gf180/MGuQaOFS9NaTlrCP5DXsnfva46tox+tXYGekQPa17OOLT2jIdFVMdCX/sNwRWOKGKw0CkHgbs2ciE/4G77RQZ6raaYACSdYT+cbJvvZN8aJKnuZh/WNO3X8sZf6xyZoDaxt2rrGzhFldh1T1gFhyOBaVZZDIn9g0cpmRz6oJCW1RJeVRVCOOaIidgPr7/IOI2v36Fx4IDxitYSLUrsYI5OpweeyjXtErnEPbfjn11XD/3r9tjhD9ml1z7JVwtDya3kyXDs8CfhOp/bRPxsoAigkJSjRz0z6RVEFx8OvMiNvIRLFvMlljSkf6GjE98W1ALtvVB3zhvSUlJ0HcNLb2DdsBklujaiDLz+I9XC5LIsPLlSXkqWBefpjDuakMpPtodVEXrAyeTLOOV+SNa/TFNG3vSXLbyjK689BdIRoauIwTtI1NK9VUIyiUvRlc8qLZ58FHVEC2UUxtT4cgaG5BKOq2MxcNty1jaDR3dNtxKR9ndP/IH2BpQ5OVgN9CNTTiKAZCfu/nxNyVFJrEMR0idYd1f
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(39860400002)(376002)(396003)(451199021)(46966006)(36840700001)(40470700004)(86362001)(36756003)(110136005)(316002)(41300700001)(70586007)(8676002)(4326008)(966005)(7696005)(70206006)(54906003)(478600001)(40480700001)(82310400005)(5660300002)(2906002)(8936002)(4744005)(36860700001)(82740400003)(356005)(81166007)(16526019)(186003)(1076003)(26005)(336012)(2616005)(426003)(47076005)(83380400001)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2023 18:54:44.0764
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1365bfb9-9adf-4e8e-4295-08db392be202
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00010207.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7645
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Mario Limonciello <mario.limonciello@amd.com>

Picasso doesn't support the command in the uPEP mailbox to try to
read the SMU version.

Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2449
Fixes: f6045de1f532 ("platform/x86: amd-pmc: Export Idlemask values based on the APU")
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/platform/x86/amd/pmc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
index ab05b9ee6655..627677c3a335 100644
--- a/drivers/platform/x86/amd/pmc.c
+++ b/drivers/platform/x86/amd/pmc.c
@@ -407,6 +407,9 @@ static int amd_pmc_get_smu_version(struct amd_pmc_dev *dev)
 	int rc;
 	u32 val;
 
+	if (dev->cpu_id == AMD_CPU_ID_PCO)
+		return -ENODEV;
+
 	rc = amd_pmc_send_cmd(dev, 0, &val, SMU_MSG_GETSMUVERSION, 1);
 	if (rc)
 		return rc;
-- 
2.25.1

