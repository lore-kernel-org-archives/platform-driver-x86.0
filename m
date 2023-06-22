Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 392E7EB64D8
	for <platform-driver-x86@archiver.kernel.org>; Thu, 22 Jun 2023 06:03:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230265AbjFVGDh (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 22 Jun 2023 02:03:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229873AbjFVGDg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 22 Jun 2023 02:03:36 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2047.outbound.protection.outlook.com [40.107.93.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22DECEA
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Jun 2023 23:03:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b1F4oS5mh8R74YCJJ/j5/YML0Uzv6sX16tUtrFVUZrvizY347ak7BoX8cnu/xztzmYiA4dOPW/hgxlMlsni6YwPgTFnBq9Ud0YA9BrQNdMO8vt3qdwpflWOVw3EoTWZ9vgNoAnKDDfV9kaXfbObfVzl0j86k1J05tDJviY0nY5SCDy45h1UwWti3Z1LFw+17w06y9gTVVSky7WiT6bGh8vYrvo84NE28MKNhvcGdYZgGzsxepPeHMZjynGYi9VxS3tHnOPrn+0VDqNvLd/JIw8CS8s2BZx7++SAyatgjpH4bi0vK59ow0rGM4g5VCgTD7gxbx3Hp7F1yP6uLpvdytw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5iQ+p8E2LWziEeolBqMvckiXKmxkVkqeGVmeERp+Yuc=;
 b=ZNDnhV3OgkCzaaSFv9Z5LHlAMznhR1Nv6gqF99JrDEtQxAdNCYfOHLOuE08CbVhz8ktQ6OgVinn8Kzp4wZOe/rWj6X0eoKCYwZQjKeUdl+z93KaYy1moT13hRyyGeFzI/R/bGPsq3uuAk2pb4dr8rZeL1AoVbwNJ16T801l5mGcMt/DLWif8B+TNAv5K/kpHKa2oRo3w7Ukb1bKBePTOJEXPSrRpBGJ6BjMIvcN2DS1QIA7lBY+7d6OUC2ybOyi/hF9M3HtH0zp62pYkKVIbqifC0bwqZsXJ1pWvKKZa6B4grNlG+sgeQY3b194g3ZGr3xFXKJ7pr9hFC2UY0KN9BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5iQ+p8E2LWziEeolBqMvckiXKmxkVkqeGVmeERp+Yuc=;
 b=bsfCfZn4pH2YPnXX8RlZqM0iBLeQRI+GwQbHv15/PBDN6KpG+rHEezQzUnzEznc5wgvYbD+vsjUZ/sxbGB6iR+2McOyMzLCgyDiwBR+GmRdZ2uMFGRO3nW3SkGCyJWooLq+SKMJwx6UEuB9Pwvwr0GNQL0XFIL7iaYE50HgQPws=
Received: from DS7PR06CA0045.namprd06.prod.outlook.com (2603:10b6:8:54::26) by
 CY5PR12MB6381.namprd12.prod.outlook.com (2603:10b6:930:3f::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6500.36; Thu, 22 Jun 2023 06:03:33 +0000
Received: from DM6NAM11FT032.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:54:cafe::4b) by DS7PR06CA0045.outlook.office365.com
 (2603:10b6:8:54::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24 via Frontend
 Transport; Thu, 22 Jun 2023 06:03:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT032.mail.protection.outlook.com (10.13.173.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.41 via Frontend Transport; Thu, 22 Jun 2023 06:03:33 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 22 Jun
 2023 01:03:30 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        <mario.limonciello@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Allen Zhong <allen@atr.me>
Subject: [PATCH] platform/x86/amd/pmf: Register notify handler only if SPS is enabled
Date:   Thu, 22 Jun 2023 11:33:09 +0530
Message-ID: <20230622060309.310001-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT032:EE_|CY5PR12MB6381:EE_
X-MS-Office365-Filtering-Correlation-Id: 21eec468-ae48-42ba-2b2f-08db72e668ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ow/LwQGlPNH0gcIQ9XJ+h8fN2ybxcdJ2RbDdhjvVywtlysfmSTusdLA4jULnI1SgXsmUn/EIsSYVTfbIF/yFHmoHPrMlpACQy57yoTxoc1AvYvZUWh2h97jsAEP+BL6OAtQ8EAFtR7x6yxTottaezxNj2X4oo1hKyhg+AXRKFhvkM+sB8Bb6g+zNXscSdqVsKcjjKebVNYbpie/TMe0aP751YsZhxtRj3RebIRNcUuI+qwPHqI8dl4YLOiaaqWizyidcZrCyPO5W2cpOwfVSNOHud60mNJl4gRyKkaz6qGYoieVEogX21S1NFbOMXjZnoDIghooDVDEQmGrZnjN2td2/1bd+eAqcZZGwlsOXqBakot7xdx1QXVtJ3HclPZlwmMddeO22BZWeUa5XKKCJxDDOEWt0FcNiG2XmyGzgWv+75iCPon9YdFhap14tHbC7ZJLGSTCFeF5vAwL7E3+d1BdL4B4HdCbzGzWxAuADKfTlKVbWCFLAeDj0Xgz2bU9WG8pDEO95NuVXVssyX2qiwmXN8Z2fIHRlxUUKEAQprcgZTKiAcCWv3ugYVyVzPpS8u711O0YK+p75yqiSjvz/vH1MYhNtePghGrgs051wDMntBKiIEAHjJYFYyK1Zgv3gaXJ62jglPEnr7Zk4+ZmtOIIVhNmtm/yJrU16LrWAo50M52U2roE8KhelOvC8AUPJNEdFSEeLaMwL0Cq4ppWEp5iRvBPOKKrtfYKuEgp9jwsQMU9jEva4oeVee+ZTn6D8xG79fA1k7A8T8vo6BJ6NgA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(39860400002)(136003)(376002)(451199021)(36840700001)(40470700004)(46966006)(81166007)(356005)(426003)(336012)(2616005)(86362001)(83380400001)(2906002)(47076005)(36860700001)(5660300002)(82740400003)(40460700003)(4326008)(54906003)(110136005)(8936002)(70586007)(16526019)(82310400005)(70206006)(8676002)(186003)(41300700001)(478600001)(36756003)(40480700001)(1076003)(966005)(7696005)(26005)(316002)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 06:03:33.0759
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21eec468-ae48-42ba-2b2f-08db72e668ee
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT032.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6381
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Power source notify handler is getting registered even when none of the
PMF feature in enabled leading to a crash.

...
[   22.592162] Call Trace:
[   22.592164]  <TASK>
[   22.592164]  ? rcu_note_context_switch+0x5e0/0x660
[   22.592166]  ? __warn+0x81/0x130
[   22.592171]  ? rcu_note_context_switch+0x5e0/0x660
[   22.592172]  ? report_bug+0x171/0x1a0
[   22.592175]  ? prb_read_valid+0x1b/0x30
[   22.592177]  ? handle_bug+0x3c/0x80
[   22.592178]  ? exc_invalid_op+0x17/0x70
[   22.592179]  ? asm_exc_invalid_op+0x1a/0x20
[   22.592182]  ? rcu_note_context_switch+0x5e0/0x660
[   22.592183]  ? acpi_ut_delete_object_desc+0x86/0xb0
[   22.592186]  ? acpi_ut_update_ref_count.part.0+0x22d/0x930
[   22.592187]  __schedule+0xc0/0x1410
[   22.592189]  ? ktime_get+0x3c/0xa0
[   22.592191]  ? lapic_next_event+0x1d/0x30
[   22.592193]  ? hrtimer_start_range_ns+0x25b/0x350
[   22.592196]  schedule+0x5e/0xd0
[   22.592197]  schedule_hrtimeout_range_clock+0xbe/0x140
[   22.592199]  ? __pfx_hrtimer_wakeup+0x10/0x10
[   22.592200]  usleep_range_state+0x64/0x90
[   22.592203]  amd_pmf_send_cmd+0x106/0x2a0 [amd_pmf bddfe0fe3712aaa99acce3d5487405c5213c6616]
[   22.592207]  amd_pmf_update_slider+0x56/0x1b0 [amd_pmf bddfe0fe3712aaa99acce3d5487405c5213c6616]
[   22.592210]  amd_pmf_set_sps_power_limits+0x72/0x80 [amd_pmf bddfe0fe3712aaa99acce3d5487405c5213c6616]
[   22.592213]  amd_pmf_pwr_src_notify_call+0x49/0x90 [amd_pmf bddfe0fe3712aaa99acce3d5487405c5213c6616]
[   22.592216]  notifier_call_chain+0x5a/0xd0
[   22.592218]  atomic_notifier_call_chain+0x32/0x50
...

Fix this by moving the registration of source change notify handler only
when SPS(Static Slider) is advertised as supported.

Reported-by: Allen Zhong <allen@atr.me>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217571
Fixes: 4c71ae414474 ("platform/x86/amd/pmf: Add support SPS PMF feature")
Tested-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/core.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index d5bb775dadcf..a5b8f9bbc0d9 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -280,6 +280,8 @@ static void amd_pmf_init_features(struct amd_pmf_dev *dev)
 	/* Enable Static Slider */
 	if (is_apmf_func_supported(dev, APMF_FUNC_STATIC_SLIDER_GRANULAR)) {
 		amd_pmf_init_sps(dev);
+		dev->pwr_src_notifier.notifier_call = amd_pmf_pwr_src_notify_call;
+		power_supply_reg_notifier(&dev->pwr_src_notifier);
 		dev_dbg(dev->dev, "SPS enabled and Platform Profiles registered\n");
 	}
 
@@ -298,8 +300,10 @@ static void amd_pmf_init_features(struct amd_pmf_dev *dev)
 
 static void amd_pmf_deinit_features(struct amd_pmf_dev *dev)
 {
-	if (is_apmf_func_supported(dev, APMF_FUNC_STATIC_SLIDER_GRANULAR))
+	if (is_apmf_func_supported(dev, APMF_FUNC_STATIC_SLIDER_GRANULAR)) {
+		power_supply_unreg_notifier(&dev->pwr_src_notifier);
 		amd_pmf_deinit_sps(dev);
+	}
 
 	if (is_apmf_func_supported(dev, APMF_FUNC_AUTO_MODE)) {
 		amd_pmf_deinit_auto_mode(dev);
@@ -382,9 +386,6 @@ static int amd_pmf_probe(struct platform_device *pdev)
 	apmf_install_handler(dev);
 	amd_pmf_dbgfs_register(dev);
 
-	dev->pwr_src_notifier.notifier_call = amd_pmf_pwr_src_notify_call;
-	power_supply_reg_notifier(&dev->pwr_src_notifier);
-
 	dev_info(dev->dev, "registered PMF device successfully\n");
 
 	return 0;
@@ -394,7 +395,6 @@ static void amd_pmf_remove(struct platform_device *pdev)
 {
 	struct amd_pmf_dev *dev = platform_get_drvdata(pdev);
 
-	power_supply_unreg_notifier(&dev->pwr_src_notifier);
 	amd_pmf_deinit_features(dev);
 	apmf_acpi_deinit(dev);
 	amd_pmf_dbgfs_unregister(dev);
-- 
2.25.1

