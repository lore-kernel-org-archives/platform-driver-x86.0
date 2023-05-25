Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F6FDC77B7A
	for <platform-driver-x86@archiver.kernel.org>; Thu, 25 May 2023 11:51:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240843AbjEYLvF (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 25 May 2023 07:51:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231160AbjEYLvE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 25 May 2023 07:51:04 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2051.outbound.protection.outlook.com [40.107.94.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10627D8
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 May 2023 04:51:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mF2FcpMOHLr0UYh5WsRY5IBofxQ3SXFzdETQ1SYx26/sOk3TagPYMmR7jOATuwrbOQ5v7OtZCZ7XoAojnQiVZU68yzlW8xjMuFSDBQLzVr1j7eKV5cZRe1i2SFwp0IRS7j9dkYd02HfoWJaXFaDqG3jmNevY6VcgEKY39/czciB9dFwRgMn5F37+xzphOT0vzaF1NFh2/1qLcRqekVAasl6RRchnGQ75XSH2LAz78U2XmrWh/oA3wFHCtIkznhRMtnsVT92GwU364Nb2rOxvbZf0MgrmwqqPl5ZL7RgwQ4nPfWRj3x6TeV1RThLz2AEiz2Wpzq2j0Q6nQNhIi0jXiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9JfoH6l2PCVPUbGdCKIZAQksFeGwPlt9PnYgYMJ0Y8c=;
 b=S4HqbOx/jCPrAXcJioGkA8Znxi8O6MpbBZWG5oFK6GXtuNfheEFRzekuCQLZ2Plhl8M1cPhy/RhlIh9BcX9Pq7+wczqvgIeX5v0F1OpLG1jsMrYps5zVj6sKFQpSGP29Lcfu11DhpxW0Em82iGuGSkRqjjAB5sesJBjlqIm9z6z9diRl+fkANd4lSGkSCjzI/gJlu/Xa1EE7GarGLHMOV8vrYgCxsWgM9j4tisyCIv5wCvIqzLdcA9dvPmqFfvrzH+1b5cb0i5QHW6wcf6qEB/eLFTQuFz6YIn+f8bwpPL8k88Kry+koaQXY0Bdi4B/OHQ6bl2t4MLgNJ7QDzkHqsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9JfoH6l2PCVPUbGdCKIZAQksFeGwPlt9PnYgYMJ0Y8c=;
 b=kawAcH8i4VE4WLy9TbnhT+XUn7mh5uI08qZ4Upl6PtE5ppZL9ThNPoYEirgkl6YdrjErK83RUzj083ubNc9/b41ICycfWsqeNZmoIuFbCNvGPtZeCPQZZYSa/uCAtZn12RIGCCk8nxjy17MHXC9oFw9R0f+LTx4N5xXY0pMLnb4=
Received: from SJ0PR03CA0086.namprd03.prod.outlook.com (2603:10b6:a03:331::31)
 by DM8PR12MB5447.namprd12.prod.outlook.com (2603:10b6:8:36::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.15; Thu, 25 May 2023 11:51:00 +0000
Received: from DM6NAM11FT109.eop-nam11.prod.protection.outlook.com
 (2603:10b6:a03:331:cafe::fc) by SJ0PR03CA0086.outlook.office365.com
 (2603:10b6:a03:331::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17 via Frontend
 Transport; Thu, 25 May 2023 11:51:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT109.mail.protection.outlook.com (10.13.173.178) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6433.16 via Frontend Transport; Thu, 25 May 2023 11:50:59 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 06:50:56 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <mario.limonciello@amd.com>,
        <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v4 3/4] platform/x86/amd: pmc: Add helper function to check the cpu id
Date:   Thu, 25 May 2023 17:20:03 +0530
Message-ID: <20230525115004.865395-4-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230525115004.865395-1-Shyam-sundar.S-k@amd.com>
References: <20230525115004.865395-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT109:EE_|DM8PR12MB5447:EE_
X-MS-Office365-Filtering-Correlation-Id: f72b7aa9-031c-42ca-06cb-08db5d164f0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qdar5EKUHrnVgNPFfe8bqkLSKpOkcN+UxjPd4RNb1JDZNpEOaNbQPwTvG7cyvycePUO1j6XkvmuE/cootzGZu5muLmsTvJPQqQyAhvnJRGG+YyQK8wqnpynCLNHij0rFWZJGEiNPPh9TvmWGgdm2ayKE56xbj0kOOXVCajtqZLJ4nffOeVDtXSyfw7HR3ZI1W9dQOA56mGH54jFzaW8CJfLJ7Epie6HH2FS3UrsgRND7blUAuet4uJJew3FA65db1BzitfoLyXDP74FWbA6YwiVp0iiVs2yKB7TMceaMetWpy3kmGMaTeBsz0Wvv57dn8BV0B6MA2tTBeo3sLNcqZ21h6ejE54QEAfZZhCcG8dtJ7rMlnKISr20KnOcDGbHex2kxEbhxkdzwVmwonIjvFT22Gjn4lQgbjgx+K6P12CzgXe+sKL0rhe7nDqQy6z/7GN8n7n8jxOowP7w5V9YsonGvzX1uCQuB8TjmCSVOdJ8tVz0FYZukJFPferJyowz8hpfE7MQpS9BqJicuglN8q/vyUR481yw5aNnLKfws/nI7LRjqOFxdsTDgWpKJvsYYcIB5zk7FoPfee2H+h/ao0sdKHb95Qe+FWGmJDKCbr/HnlnVbczMDS4j1xuge9sidd905HsTQaZ1PQw3Lvvupy/CH1pj6ZMGIGgiWPr8e9O9133SiD2i+s/+aZQ+YUPBShNNqwQPTbxghqAnyPSmnrCoKgmjGXxmVKjtyB0PRgW4+Jq5SEz0FEwb13wtxpk137u1cY53xNdgh9FupNpGRAA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(39860400002)(376002)(136003)(451199021)(46966006)(36840700001)(40470700004)(82310400005)(86362001)(81166007)(356005)(82740400003)(40480700001)(36756003)(40460700003)(16526019)(26005)(1076003)(186003)(5660300002)(83380400001)(47076005)(2906002)(2616005)(336012)(70586007)(70206006)(110136005)(54906003)(7696005)(8676002)(8936002)(4326008)(41300700001)(478600001)(426003)(316002)(6666004)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 11:50:59.9127
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f72b7aa9-031c-42ca-06cb-08db5d164f0c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT109.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5447
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add a helper routine to check the underlying cpu id, that can be used
across the PMC driver to remove the duplicate code.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
index e2439fda5c02..db0c330d4b85 100644
--- a/drivers/platform/x86/amd/pmc.c
+++ b/drivers/platform/x86/amd/pmc.c
@@ -564,6 +564,18 @@ static void amd_pmc_dbgfs_unregister(struct amd_pmc_dev *dev)
 	debugfs_remove_recursive(dev->dbgfs_dir);
 }
 
+static bool amd_pmc_is_cpu_supported(struct amd_pmc_dev *dev)
+{
+	switch (dev->cpu_id) {
+	case AMD_CPU_ID_YC:
+	case AMD_CPU_ID_CB:
+	case AMD_CPU_ID_PS:
+		return true;
+	default:
+		return false;
+	}
+}
+
 static void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
 {
 	dev->dbgfs_dir = debugfs_create_dir("amd_pmc", NULL);
@@ -575,8 +587,7 @@ static void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
 			    &amd_pmc_idlemask_fops);
 	/* Enable STB only when the module_param is set */
 	if (enable_stb) {
-		if (dev->cpu_id == AMD_CPU_ID_YC || dev->cpu_id == AMD_CPU_ID_CB ||
-		    dev->cpu_id == AMD_CPU_ID_PS)
+		if (amd_pmc_is_cpu_supported(dev))
 			debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
 					    &amd_pmc_stb_debugfs_fops_v2);
 		else
@@ -1036,7 +1047,7 @@ static int amd_pmc_probe(struct platform_device *pdev)
 
 	mutex_init(&dev->lock);
 
-	if (enable_stb && (dev->cpu_id == AMD_CPU_ID_YC || dev->cpu_id == AMD_CPU_ID_CB)) {
+	if (enable_stb && amd_pmc_is_cpu_supported(dev)) {
 		err = amd_pmc_s2d_init(dev);
 		if (err)
 			goto err_pci_dev_put;
-- 
2.25.1

