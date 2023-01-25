Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7925C54E94
	for <platform-driver-x86@archiver.kernel.org>; Wed, 25 Jan 2023 10:00:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235477AbjAYKAW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 25 Jan 2023 05:00:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235471AbjAYKAV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 25 Jan 2023 05:00:21 -0500
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2086.outbound.protection.outlook.com [40.107.212.86])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8254953E5A
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Jan 2023 02:00:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bur6lkVHisxwE9MlM4INUzc5Het8quAS7NtDvMhXFBEe6gNOtfjuk0eekrD7S609LkoGN25/h0g8x+GRB7KAd01brfz7pJD72DfaZanIBaoCIkU6htPul8Wnnwqg995ACKJCb+l46HqXm1pgl0Y9ClL9tct4deeBQmUDx5iJXNKWmnQ+NDh+N+/dmvQXtbYwvPg+giJeiXKiOxbqDp1NukfqDU10yN06U4glaxE4mbPpsS+M+JFZhIOHnsE6Pvg3pSaJx6W3WLaakYJPHr/AIFn1v7aYD/DO7orXbZwz9caBkNq5y3xrsgnLhg/0Jgu+uePWyj0BJsh//8u+UZ5yiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kFQ9iUzsc4MllCsmKFhsufK8d2Pyo4EscP9o56b94eA=;
 b=C3MucVJEfatI0h7L1xS2Vk4RzZg8rhy7oNs8ZHlvyWD7gZdDFNeJuZWDSsO6kRUwpheoOiuSZP0hCcLbjPxKfurcPv7j+j9/B6SXQern1qWFaikfJZxvpX4Inliua1Ky8yc7BEb86uPthtw2LiucRGADbHdRGscR/bbdUVrjczEl5U2s7vtgajSwJeNKPo8PH2dbJHwg4ASB75FSexzsYdHEjSbxbMS6bNaT2LEOKumZJssSawzt1+aDDuzEzRAEblCsIijvsRW3E62ueRAbTa8ble0d42r+c5dmSS0X36sAvk1wQlkjBuKE4fk1/GeZ3Duw+5zrkbVBXWbiH+C/ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kFQ9iUzsc4MllCsmKFhsufK8d2Pyo4EscP9o56b94eA=;
 b=K/4TRpSIfCq3wZf14fdN9KxgtL1ukIKkLdpb9vKOHP6fdqi7UTUNmgBI8nn23Z3yIlQjxWKIauOS89Fnk8fIVcgSMkGMmudR5mOeSABJ4jzQRWYp+AMa23UCZEALYKKVmyteoVDHl8aZ1/sHl0RcbCxagTAvfIKZwnQBn9FQSpY=
Received: from MW4PR04CA0046.namprd04.prod.outlook.com (2603:10b6:303:6a::21)
 by SN7PR12MB6959.namprd12.prod.outlook.com (2603:10b6:806:261::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 10:00:18 +0000
Received: from CO1NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:6a:cafe::85) by MW4PR04CA0046.outlook.office365.com
 (2603:10b6:303:6a::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33 via Frontend
 Transport; Wed, 25 Jan 2023 10:00:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT025.mail.protection.outlook.com (10.13.175.232) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6023.16 via Frontend Transport; Wed, 25 Jan 2023 10:00:16 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 25 Jan
 2023 04:00:12 -0600
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 5/5] platform/x86/amd/pmf: Fix to update SPS thermals when power supply change
Date:   Wed, 25 Jan 2023 15:29:36 +0530
Message-ID: <20230125095936.3292883-6-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230125095936.3292883-1-Shyam-sundar.S-k@amd.com>
References: <20230125095936.3292883-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT025:EE_|SN7PR12MB6959:EE_
X-MS-Office365-Filtering-Correlation-Id: f3ff96d9-ad6f-46bb-2ace-08dafebaf5b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Odr+43KUllh5Htsim74KvwO9b8PAiRontlug1FyOCYfYNPs6nEoKjT2NZjWJueYfjO8Kk7a3yRmLBIdF0uAn2AY33i8ZabfvwgeXpCTqdVEsNVjXXdWP+wJ8Zocx/mfP1Cwbsmjk+pBuFVSGaNEgYIHgyMGAyAet3vo4XAG3R/6x5/VJBsBKbuPZXqK3v7rXJUE0OLYzaODCcj1zGsI9m89uMrF2WfaTTIItMYZhewdeJBcW2tde75gKFT3Fy/UE44Dgpb+LBImKsY5j2tGsP3qi0XVzvgOLfB5i7B1QrMoIo/luOQuAZMyBpI09vnzxU+OOcPRQ0m/Hab9mSJ4tmhSkPfA3o9vangy6narNInMWDVzy8YIKl1BgBa3shTsk1LhJTf0aEV7tjrj0awa1qBuHcinlqXHrou8CWjehZg+7vW0wTDYjCQvo0Tr6CKBJZ2YQIzIkPXsMFH+AGhc6pyKGIHEaDCU6M8W5MUxo5xPtKV3bga7YwrH77NEbaQWLZjfloyELM+EySzPLdqdP/Th71ZWL32U1ckE5kiZ5xmAuhzTSGSELVRwES1xTty+55dAJ3hyM6uLWbS4wF6biRUr47iRR7iPa0O7RfTxGe68N3JnfEbYlKeRp/4GoJjgmH5n1STlNfZzcO8FsEsiyuRz+8nDgsNFIgW/NYYkDYxLflAHpPGTsUoArIPqxZQ7MrwMy3WNgSDo4U3YtjilUH/Cxf0yp+T6SIj94QesQ9nw=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(376002)(346002)(136003)(396003)(39860400002)(451199018)(46966006)(36840700001)(40470700004)(4326008)(36860700001)(70586007)(86362001)(54906003)(70206006)(36756003)(1076003)(8936002)(5660300002)(426003)(2906002)(82740400003)(41300700001)(15650500001)(82310400005)(40460700003)(47076005)(6666004)(26005)(83380400001)(16526019)(40480700001)(110136005)(186003)(8676002)(2616005)(316002)(336012)(81166007)(478600001)(7696005)(356005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 10:00:16.4250
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3ff96d9-ad6f-46bb-2ace-08dafebaf5b2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT025.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6959
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Every power mode of static power slider has its own AC and DC power
settings.

When the power source changes from AC to DC, corresponding DC thermals
were not updated from PMF config store and this leads the system to always
run on AC power settings.

Fix it by registering with power_supply notifier and apply DC settings
upon getting notified by the power_supply handler.

Fixes: da5ce22df5fe ("platform/x86/amd/pmf: Add support for PMF core layer")
Suggested-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/core.c | 23 +++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/pmf.h  |  1 +
 2 files changed, 24 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index a5f5a4bcff6d..f7ace0e8fbee 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -58,6 +58,25 @@ static bool force_load;
 module_param(force_load, bool, 0444);
 MODULE_PARM_DESC(force_load, "Force load this driver on supported older platforms (experimental)");
 
+static int amd_pmf_pwr_src_notify_call(struct notifier_block *nb, unsigned long event, void *data)
+{
+	struct amd_pmf_dev *pmf = container_of(nb, struct amd_pmf_dev, pwr_src_notifier);
+
+	if (event != PSY_EVENT_PROP_CHANGED)
+		return NOTIFY_OK;
+
+	if (is_apmf_func_supported(pmf, APMF_FUNC_AUTO_MODE) ||
+	    is_apmf_func_supported(pmf, APMF_FUNC_DYN_SLIDER_DC) ||
+	    is_apmf_func_supported(pmf, APMF_FUNC_DYN_SLIDER_AC)) {
+		if ((pmf->amt_enabled || pmf->cnqf_enabled) && is_pprof_balanced(pmf))
+			return NOTIFY_DONE;
+	}
+
+	amd_pmf_set_sps_power_limits(pmf);
+
+	return NOTIFY_OK;
+}
+
 static int current_power_limits_show(struct seq_file *seq, void *unused)
 {
 	struct amd_pmf_dev *dev = seq->private;
@@ -372,6 +391,9 @@ static int amd_pmf_probe(struct platform_device *pdev)
 	apmf_install_handler(dev);
 	amd_pmf_dbgfs_register(dev);
 
+	dev->pwr_src_notifier.notifier_call = amd_pmf_pwr_src_notify_call;
+	power_supply_reg_notifier(&dev->pwr_src_notifier);
+
 	mutex_init(&dev->lock);
 	mutex_init(&dev->update_mutex);
 	dev_info(dev->dev, "registered PMF device successfully\n");
@@ -389,6 +411,7 @@ static int amd_pmf_remove(struct platform_device *pdev)
 	apmf_acpi_deinit(dev);
 	amd_pmf_dbgfs_unregister(dev);
 	kfree(dev->buf);
+	power_supply_unreg_notifier(&dev->pwr_src_notifier);
 	return 0;
 }
 
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index b94e1a9030f8..06c30cdc0573 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -169,6 +169,7 @@ struct amd_pmf_dev {
 	struct mutex update_mutex; /* protects race between ACPI handler and metrics thread */
 	bool cnqf_enabled;
 	bool cnqf_supported;
+	struct notifier_block pwr_src_notifier;
 };
 
 struct apmf_sps_prop_granular {
-- 
2.25.1

