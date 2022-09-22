Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5505BC54EE9
	for <platform-driver-x86@archiver.kernel.org>; Thu, 22 Sep 2022 17:56:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231896AbiIVR4r (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 22 Sep 2022 13:56:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230002AbiIVR4q (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 22 Sep 2022 13:56:46 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2081.outbound.protection.outlook.com [40.107.243.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D66FFFA48
        for <platform-driver-x86@vger.kernel.org>; Thu, 22 Sep 2022 10:56:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bvh3p7h5Em9SGiP1ZjvOEGr461sPlpGyTclHvBECIpw6R4FDQ1s3dfOK85FMwNnuWZjAXY0wzMk192tzBFfu4OqcxDIdwRL0QoaI0OrY5Y1+o6fFGEZbuomZVrWbcll5m1Z6kCUFMLa4NRVN+wEXuHwGeY7qPnvVdKLhO8XkwHD7aHpYqgDjaefQI6wxJJnXenre83uEoO0s5p6Zj2mFLnGfCZE1zgW1+0pwwBy/3k36MBu4T5amcwCZZVhMbPvsOA18XN11lg5K3OZewR3yhjGJ4rZ4Gzg3eTDyW/NQJMdmEsisXbzzTm6qqtoNP2ZrRyc67bvhVano3S9DLmYvaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8JdIiEgV3w4dJcEsnAkRlLH5igq4R+xBg8DWXLgIyZ0=;
 b=EEudgKiVgqxosiBB7SsuKh9lf5uJcAoLSArPCeeqDq8we1vMHDsv0CiNt+WEwLLG5YhrdzOU/wOcKWR8UYMkdPzUuDu+Vq1WCT9tsypb2G7PRfXzGZEm6C3NE5QGdpYbrQtzBxI1vwyQFUIqRemRxKcubSCqgn1GBYlGo/YLxzjeH7dPcUkvVIREVB3ZOuLlZBkn73uXR2pXVGabGfM8keV1rzZxBk6IdjaKHtvsiN4+tdbiX9LRgYnxkdQqB3mTnHBhoojewwsBrvYEu+Yf92G7yGBrDqW4SBwSIeHjvqU6unplRTpI/+3m+4YzkjXxk0P0MQUaEtvHPfWINM8gqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8JdIiEgV3w4dJcEsnAkRlLH5igq4R+xBg8DWXLgIyZ0=;
 b=2kP9o4TwB7Woe7P5h+EbGLTtXWzY0V0WxDDjrKDh1pCoS+179O+ld+OdbOvnvWX9NigF1PpSxz53gn5XVOqThofAC4Sl61j74Gvr8UyzBxAyB+oCJ4JaIMOESHJfH5tsSEf+65ao2DcK4fvCcJtCS9PiLnE8xBxnz8QIEIMH8Yk=
Received: from MW4PR04CA0229.namprd04.prod.outlook.com (2603:10b6:303:87::24)
 by SJ1PR12MB6050.namprd12.prod.outlook.com (2603:10b6:a03:48b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.17; Thu, 22 Sep
 2022 17:56:42 +0000
Received: from CO1NAM11FT102.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:87:cafe::46) by MW4PR04CA0229.outlook.office365.com
 (2603:10b6:303:87::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.18 via Frontend
 Transport; Thu, 22 Sep 2022 17:56:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT102.mail.protection.outlook.com (10.13.175.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Thu, 22 Sep 2022 17:56:42 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 22 Sep
 2022 12:56:39 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>,
        <Sanket.Goswami@amd.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH] platform/x86/amd: pmc: remove CONFIG_DEBUG_FS checks
Date:   Thu, 22 Sep 2022 23:26:08 +0530
Message-ID: <20220922175608.630046-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT102:EE_|SJ1PR12MB6050:EE_
X-MS-Office365-Filtering-Correlation-Id: c8bad89c-f37f-40d7-a71f-08da9cc3cea4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ntYGU9v/mpwg8jmKPnmI3TMO7mbKjy2jEaXwU1kr7Oj1ecZqqs5YufCY5DzsMmoKwfeXQHb+vtHsNvW5WasCT0fRxv8ClUrrtscJinbf43dOZwo9PJU+GOWg3MrlFZsEdPx/P2XMMCFqnfr4onnNgggHVdynPHKsvFQeoXPIUwmWQxlOGgSnGxjOXNDZPLj/mrvQWF7MHF+SRiAIv8CgvI6kUN6LGNTJlcRUC9mqVd4BadSnOeabzIlY+XJl+o1GISlkNrL3nMmb7xaMs+CWyPG+o2NmVbnv7EBsBXCNUO1AtD1VEMhPdxX11EDFx5lJ8jbSa1RBWwr0yRjCK72gWx9RkkW74HZqCeetGKzTKSgZl0MMs5CA09NODGqwpEfWyvtHmb+T+awUp6TzZmTX2xcdHF9qUTVROGp82CNQh8GdtUv7r76hc9v9BSYc9bKIIW8UvgFsDlLaL2FbRg3tmH+NNPXXpLX7w+gKvTfU1SdyptHJdujejVMw+Bexd2Hrk3zyM9dt4zLWy9Zi36KLaLsIcCj0mZQ3jt4+P5xCb/tPewZ/kNWG/5pQ4p27isfgheSGQc6t/A+ROlsxpZTV5rEtm5mvWfL+rtfrNDUAzKxOjXvitCgEYyV7pxcWArvzu7eWb0XodvIEXnZbSfb+XOc6gTF3DKegkZZSthcl7ciFZuYQ4+vo7xBFu0Fr6zj0MQh7yLFAXCJI/6VKHoeyFMkvvwTkIXNidGQZ760GtNXj3jp1aROF3sH2zoTUKcjLLQsdmZhJUuvoxjw+bUMWH8vRg/esI6869psl/ATsvX3aFwCLWdOi5TPbJ58OqEq/
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(396003)(136003)(39860400002)(451199015)(36840700001)(40470700004)(46966006)(47076005)(83380400001)(82740400003)(2906002)(426003)(7696005)(70206006)(6636002)(86362001)(356005)(478600001)(110136005)(6666004)(8676002)(70586007)(4326008)(54906003)(186003)(8936002)(82310400005)(2616005)(16526019)(1076003)(40460700003)(336012)(316002)(41300700001)(26005)(36756003)(5660300002)(81166007)(36860700001)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2022 17:56:42.3924
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8bad89c-f37f-40d7-a71f-08da9cc3cea4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT102.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6050
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Since linux/debugfs.h already has the stubs for the used debugfs
functions when debugfs is not enabled, remove the #ifdef CONFIG_DEBUG_FS
checks.

Fixes: 156ec4731cb22 ("platform/x86: amd-pmc: Add AMD platform support for S2Idle")
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
index e47e54b095af..047e47449ff9 100644
--- a/drivers/platform/x86/amd/pmc.c
+++ b/drivers/platform/x86/amd/pmc.c
@@ -153,9 +153,7 @@ struct amd_pmc_dev {
 	struct device *dev;
 	struct pci_dev *rdev;
 	struct mutex lock; /* generic mutex lock */
-#if IS_ENABLED(CONFIG_DEBUG_FS)
 	struct dentry *dbgfs_dir;
-#endif /* CONFIG_DEBUG_FS */
 };
 
 static bool enable_stb;
@@ -429,7 +427,6 @@ static struct attribute *pmc_attrs[] = {
 };
 ATTRIBUTE_GROUPS(pmc);
 
-#ifdef CONFIG_DEBUG_FS
 static int smu_fw_info_show(struct seq_file *s, void *unused)
 {
 	struct amd_pmc_dev *dev = s->private;
@@ -544,15 +541,6 @@ static void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
 					    &amd_pmc_stb_debugfs_fops);
 	}
 }
-#else
-static inline void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
-{
-}
-
-static inline void amd_pmc_dbgfs_unregister(struct amd_pmc_dev *dev)
-{
-}
-#endif /* CONFIG_DEBUG_FS */
 
 static void amd_pmc_dump_registers(struct amd_pmc_dev *dev)
 {
-- 
2.25.1

