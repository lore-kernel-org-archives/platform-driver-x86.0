Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9872C61DA0
	for <platform-driver-x86@archiver.kernel.org>; Wed, 25 Jan 2023 10:00:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235226AbjAYKAU (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 25 Jan 2023 05:00:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235137AbjAYKAP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 25 Jan 2023 05:00:15 -0500
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2071.outbound.protection.outlook.com [40.107.223.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C16394997B
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Jan 2023 02:00:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Acw/IP67lP8/CAKN54mb+pEvHnrr2GSMTCRgmQ0CfWH7eu7R1eZ0fx7tltIAV2MpX0F6FsPv8x17ofK49UhmTSpzklSTiyRUYT91vFHc2Q9fAV5m8CTEa0XOuQ3w5r/o4XTHoKSGPk4eQbMYBZi8AwQ9mJrfye1OT66XLnIEqLBTYCs5thTaQA7eKBkhsx74SyQKsnuXKLdnr3ssBF51GGhAQoL4c6fbhU/8/C3j3CwfAhGNPHd7OM+GGV44Nt34rURsHbLE/U8m6MeWDEaS4Sb9ocGb6F8DUf5UwvZL0cFLh3Ky65xAgnbWKT3w9WI5qIpGFZ5Uc2aF+VnaLzG0FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IERVCiG5vSZ2Sa0cLnv2oGw99VtZFIDx1g0Fx4EZ2BI=;
 b=h2in8cKCZaw6ZMXzfCMLZ/wYF3j7F0HcCsK3l5x5kKagYOG74ZDc26IHhxutt90LLDyxfUW7LS0/wbw4dfkoJ7bnGTVjz6eAuPgbShy/8Wf+eWG0U8s2ATO/pdwsDndaPfCzWWn8+ruONobqAgNNtiqA9lHDyni/ufRrb+A+LgA5e74puFfDF+/eIJ/0YL/IfqIgUWOWK78KDEFLiwGWS49hQ6KRafwGs2AK+1eAtMfd8m/fBZj+VbjeV/TYk+M6cuqidLqwPzlVPVDqW13jSzL0kIY6SyOkT+NDzh410zsCduoMoO/0KN3AApsb96dJ8gcfoYUsq+qc3dDob22x1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IERVCiG5vSZ2Sa0cLnv2oGw99VtZFIDx1g0Fx4EZ2BI=;
 b=zVsGfE6UKvlQFrnkqrr4Om7AG7S0dUvZu0toM0w3YgF+RiEYWd8weTkefkKR+7cTqN/d+CCq+Kh+pJKPH+wm9RLLToWCadUrxdDLB72Nof84S2BviS4NMSv/YZiGXb5rFTrQm5fu9NHG3mq4fyy23jFE/rTtkgwITwmvu/a9o5I=
Received: from MW2PR2101CA0026.namprd21.prod.outlook.com (2603:10b6:302:1::39)
 by BY5PR12MB5014.namprd12.prod.outlook.com (2603:10b6:a03:1c4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 10:00:11 +0000
Received: from CO1NAM11FT103.eop-nam11.prod.protection.outlook.com
 (2603:10b6:302:1:cafe::e) by MW2PR2101CA0026.outlook.office365.com
 (2603:10b6:302:1::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.4 via Frontend
 Transport; Wed, 25 Jan 2023 10:00:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT103.mail.protection.outlook.com (10.13.174.252) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.17 via Frontend Transport; Wed, 25 Jan 2023 10:00:10 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 25 Jan
 2023 04:00:08 -0600
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 3/5] platform/x86/amd/pmf: update to auto-mode limits only after AMT event
Date:   Wed, 25 Jan 2023 15:29:34 +0530
Message-ID: <20230125095936.3292883-4-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1NAM11FT103:EE_|BY5PR12MB5014:EE_
X-MS-Office365-Filtering-Correlation-Id: 74be6d9d-26cb-4c15-bf2b-08dafebaf24f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vHSShzQs/O5jJlefFsXRqMOc6+FWMHoidxJKZ9fsp773JBS0vhrmGgPIQNPFCiyLRV51bm0DS93D4RhzBTITP2y01cXVWPVv1TfU9joVYIiJqr8G9Pb+HuqNcDVgj1KtYN8nTsXmu87Pe9C1iFip1nmsfOKbvHFSj9JuXTB/s5BTsOKJ8lybmB0Z5z5MWvgiPml/6ylu7vqVwoAiHElluF0m5r1lx8eh0XVcfvu/gIucJ2ZgYog9EFfIJR5frNU+T/1zV3tGOOJU/HVRU/aUs52fPvJfbL1JlcIe7h/TMbXOVDtLtWvD6p6HZFj5n7nGmEjRo5+AYPtEhSZHs0w8R/uNeHVDNfJLKIJ0hN7DmiwVbGQN/Qrg/iYSVr/yhoFH2ZTKQxr5uF2mUj5kUU+2OaX5sDZ5iajtuZS7rSdp9SNNL5/08Q8xzky6WfRwYY6iz9jM4OXoZItusi+wHqHg7rgLUxET/OWUFRNpELD9qN/MA2VM7OcfRMTUYaQkT4hJWaTeDoG0xaWdsAxdkUt6XXeSXwUsHz8EmBIEpKdaPl1CviALsgdUBGAP8864GU/9iO0G8OdU35LpHRWEEgAezd1NIwdd2SGMhkpUhdceOMw+wvY+1TcMnnGVEFTv6rOPez2y4ml4P22BiRXM4iOIOxs5lxkD1VsbWhy9A/qgx5SXVuJA1tqo1RwmN5wHJWb96mXEyL5lQQ5KEIRQPuDvK6uNx9Yz5vz+vrWPHAxGZfc=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(136003)(39860400002)(396003)(346002)(376002)(451199018)(36840700001)(40470700004)(46966006)(70586007)(41300700001)(4326008)(8676002)(54906003)(36860700001)(110136005)(26005)(316002)(70206006)(2616005)(336012)(8936002)(356005)(1076003)(81166007)(5660300002)(15650500001)(82310400005)(40480700001)(40460700003)(426003)(2906002)(16526019)(83380400001)(7696005)(6666004)(82740400003)(86362001)(47076005)(478600001)(36756003)(186003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 10:00:10.7625
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74be6d9d-26cb-4c15-bf2b-08dafebaf24f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT103.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB5014
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Auto-mode thermal limits should be updated only after receiving the AMT
event. But due to a bug in the older commit, these settings were getting
applied during the auto-mode init.

Fix this by removing amd_pmf_set_automode() during auto-mode
initialization.

Fixes: 3f5571d99524 ("platform/x86/amd/pmf: Add support for Auto mode feature")
Suggested-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/auto-mode.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/auto-mode.c b/drivers/platform/x86/amd/pmf/auto-mode.c
index 7564ef1bca7d..96a8e1832c05 100644
--- a/drivers/platform/x86/amd/pmf/auto-mode.c
+++ b/drivers/platform/x86/amd/pmf/auto-mode.c
@@ -294,7 +294,5 @@ void amd_pmf_deinit_auto_mode(struct amd_pmf_dev *dev)
 void amd_pmf_init_auto_mode(struct amd_pmf_dev *dev)
 {
 	amd_pmf_load_defaults_auto_mode(dev);
-	/* update the thermal limits for Automode */
-	amd_pmf_set_automode(dev, config_store.current_mode, NULL);
 	amd_pmf_init_metrics_table(dev);
 }
-- 
2.25.1

