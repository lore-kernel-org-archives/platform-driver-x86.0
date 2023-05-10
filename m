Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF92FC77B7C
	for <platform-driver-x86@archiver.kernel.org>; Wed, 10 May 2023 14:49:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237519AbjEJOtH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 10 May 2023 10:49:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237341AbjEJOtC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 10 May 2023 10:49:02 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2065.outbound.protection.outlook.com [40.107.223.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC84C7EED
        for <platform-driver-x86@vger.kernel.org>; Wed, 10 May 2023 07:48:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xn/bOXAxcLm8/gqv3LgfQW7HsglzzIbnwMMAdDsphvFYjjKU3AG3cD0Y05lHAwdeRH6uqyGeYCohN6tPHpxsGLHE25bO+yxASks5C1peQLzV4HWOknzR9XCdzSk5vqihij7cadZczeP9SX4Wufni6BO0QJBWY7ARgHUpveJTxVsttNJp4MTHRSZ3OQ44dYcpKbKTR/FxTADlcPGwOI2fTr368BAIK77VXYCslw20+CHx+jlxuGSRAzGOveEWhMUYf1G5EGZvYp633qacvKoQ2qpBC3AlSlhWxnZOZlWykJTsiwO2L/RJmQtgGdfX+GBh9VKU0rOqZMcUTOymvHdSDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rV45UhFWVbD08bXiKnfW96bCffZvapXL+6iPukj9nWw=;
 b=Ac93oq9SdeS7VKs7Mny0J7CABd7Z9z4klLcxbvLBAoOVWwoM1c+AVj0SdpMdY8QpDS4U72HZtiTYccerSSNQJHUggS4/sSj/AoklIIXFyvvKN4MKGtgKQE2cQKOTicM9cKRRVr+EhPlNfkDASfUIrhM4mWpOh4YO5TK3yYZIgc3qmJeHVVOJaXrulVJNS1g/6OZ4RW+CROMQnK6O1A29af9PycWj2ofzAZTg+8HLnAwA9n8PldBGuW2ijki1Rxw8CSSzpjCpQPPnMlKEp5W/vyCPwuLTd+QpKtbeBsEG3OVk2zU+SfBHF/74u6fnv+//z080JGn2xr1dqGxoQ6h0zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rV45UhFWVbD08bXiKnfW96bCffZvapXL+6iPukj9nWw=;
 b=aR2vg3uvBwu2yttEyhIITTuguY+3Zvglv15wKA3ZImgjLyj1peS/lj+sFFPZaVEMqZ18pHEzGm7kRZyJT01PixjWpzK+Mz1NPM+Os3OTWkhRN98oijyunhG0zk2icysYelwt/7BgywSHKCEMj2yMLJQqGJIXvGrNGlINUhK4iT0=
Received: from SJ0PR03CA0181.namprd03.prod.outlook.com (2603:10b6:a03:2ef::6)
 by CH0PR12MB8508.namprd12.prod.outlook.com (2603:10b6:610:18c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Wed, 10 May
 2023 14:48:48 +0000
Received: from DM6NAM11FT046.eop-nam11.prod.protection.outlook.com
 (2603:10b6:a03:2ef:cafe::7f) by SJ0PR03CA0181.outlook.office365.com
 (2603:10b6:a03:2ef::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.20 via Frontend
 Transport; Wed, 10 May 2023 14:48:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT046.mail.protection.outlook.com (10.13.172.121) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6387.20 via Frontend Transport; Wed, 10 May 2023 14:48:48 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 10 May
 2023 09:48:44 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        <mario.limonciello@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v4 2/2] platform/x86/amd/pmf: Add PMF debug facilities
Date:   Wed, 10 May 2023 20:17:51 +0530
Message-ID: <20230510144751.66601-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230510144751.66601-1-Shyam-sundar.S-k@amd.com>
References: <20230510144751.66601-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT046:EE_|CH0PR12MB8508:EE_
X-MS-Office365-Filtering-Correlation-Id: 244040c1-b726-4eeb-247e-08db5165a9c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rlTxmlrElA7pQtCg3ffqQmCO7PMy92dsOtCH+FaYYZ0DsWd4yslD0YK5O8iCyQhHigRA02zSn5sYHuaohhFDqIGmh7mRKPEOzx1lbmnGJ4ZnyXdGUWKUws0jUOvmY6YRhACoxBm80nyi0dU3Y50qDNaQnegzePrFS+FeyJ3xYU3XWIXCOMe4wFPqSFg3shcXiZJZRivoWJ4yeUskOgSxib2v+rpRSIARfXI45VvTd65JHb9BL/tjEyvEci1swrJ8nLTJnkL5tiqFfj0t7mJnQCbsEZcyjQoH0znV27G0mBe/XcWVFXVnwXk/YGy5KdH+QqvNPGv8W47bkX1upwnYRjtIJse2fMP6QR7+mDdl5qqGtWwX4KFB7FOl+m3rZ+sgt2KmnvkvlNS9f+YemvxsTFK3sO4GxX1VFD70J6IU4+DVkQtT3jB2zEicmgXQhDA2h7YXZmF3vgBAce7ruNyCKbZAn+RZhl+Fww8h7/nDB4/WDdMgv1ZA/37n78yLkYbkHXcPUWXL5sFuMar8f3YPJW7psrbAvbUDN0ZNJzRueo5BYNNps64mqYoWtph4Xw6GZ63lzCxx2UbLui5sCiISW+x99L1GxHDoqWAvj6xUk8wxx4MyGRQ1AzpcbkhfCHXpuGZ9PWKZkoOrXHsgD2EZns/Xd335kpou9JN23RZpS5PaYaCHbRhzZoea4HyBUOBswhI/RyEikEVY1m6RfCsdkKviqJ1/zWztfqmHu9yaPTI=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(39860400002)(376002)(346002)(451199021)(36840700001)(40470700004)(46966006)(5660300002)(54906003)(478600001)(110136005)(26005)(7696005)(6666004)(41300700001)(8676002)(316002)(8936002)(1076003)(4326008)(70586007)(45080400002)(70206006)(2616005)(2906002)(83380400001)(47076005)(16526019)(336012)(40480700001)(426003)(186003)(36860700001)(81166007)(356005)(40460700003)(82740400003)(82310400005)(86362001)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 14:48:48.4288
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 244040c1-b726-4eeb-247e-08db5165a9c8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT046.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8508
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

At times, when the mode transitions fail to happen, the current
driver does not give enough debug information on why the transition
failed or the default preset values did not load. Having an on-demand
logs guarded by CONFIG would be helpful in such cases.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
v4:
 - Remove extra space as pointed by Ilpo.

v3:
 - Based on review-hans branch
 - Address Ilpo's review remarks
 - use the right format specifiers while printing the data

v2:
 - Based on review-hans branch
 - Drop extra CONFIG item based on feedback from Hans

 drivers/platform/x86/amd/pmf/auto-mode.c | 23 +++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/cnqf.c      | 19 +++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/auto-mode.c b/drivers/platform/x86/amd/pmf/auto-mode.c
index 64425201d353..02ff68be10d0 100644
--- a/drivers/platform/x86/amd/pmf/auto-mode.c
+++ b/drivers/platform/x86/amd/pmf/auto-mode.c
@@ -179,11 +179,34 @@ void amd_pmf_trans_automode(struct amd_pmf_dev *dev, int socket_power, ktime_t t
 			config_store.transition[i].applied = false;
 			update = true;
 		}
+
+#ifdef CONFIG_AMD_PMF_DEBUG
+		dev_dbg(dev->dev, "[AUTO MODE] average_power : %d mW mode: %s\n", avg_power,
+			state_as_str(config_store.current_mode));
+
+		dev_dbg(dev->dev, "[AUTO MODE] time: %lld ms timer: %u ms tc: %u ms\n",
+			time_elapsed_ms, config_store.transition[i].timer,
+			config_store.transition[i].time_constant);
+
+		dev_dbg(dev->dev, "[AUTO MODE] shiftup: %u pt: %u mW pf: %u mW pd: %u mW\n",
+			config_store.transition[i].shifting_up,
+			config_store.transition[i].power_threshold,
+			config_store.mode_set[i].power_floor,
+			config_store.transition[i].power_delta);
+#endif
 	}
 
 	dev_dbg(dev->dev, "[AUTO_MODE] avg power: %u mW mode: %s\n", avg_power,
 		state_as_str(config_store.current_mode));
 
+#ifdef CONFIG_AMD_PMF_DEBUG
+	dev_dbg(dev->dev, "[AUTO MODE] priority1: %u priority2: %u priority3: %u priority4: %u\n",
+		config_store.transition[0].applied,
+		config_store.transition[1].applied,
+		config_store.transition[2].applied,
+		config_store.transition[3].applied);
+#endif
+
 	if (update) {
 		for (j = 0; j < AUTO_TRANSITION_MAX; j++) {
 			/* Apply the mode with highest priority indentified */
diff --git a/drivers/platform/x86/amd/pmf/cnqf.c b/drivers/platform/x86/amd/pmf/cnqf.c
index 35af7c18f600..539b186e9027 100644
--- a/drivers/platform/x86/amd/pmf/cnqf.c
+++ b/drivers/platform/x86/amd/pmf/cnqf.c
@@ -175,6 +175,13 @@ int amd_pmf_trans_cnqf(struct amd_pmf_dev *dev, int socket_power, ktime_t time_l
 		config_store.trans_param[src][i].count++;
 
 		tp = &config_store.trans_param[src][i];
+
+#ifdef CONFIG_AMD_PMF_DEBUG
+		dev_dbg(dev->dev, "avg_power: %u mW total_power: %u mW count: %u timer: %u ms\n",
+			avg_power, config_store.trans_param[src][i].total_power,
+			config_store.trans_param[src][i].count,
+			config_store.trans_param[src][i].timer);
+#endif
 		if (tp->timer >= tp->time_constant && tp->count) {
 			avg_power = tp->total_power / tp->count;
 
@@ -195,6 +202,18 @@ int amd_pmf_trans_cnqf(struct amd_pmf_dev *dev, int socket_power, ktime_t time_l
 	dev_dbg(dev->dev, "[CNQF] Avg power: %u mW socket power: %u mW mode:%s\n",
 		avg_power, socket_power, state_as_str(config_store.current_mode));
 
+#ifdef CONFIG_AMD_PMF_DEBUG
+	dev_dbg(dev->dev, "[CNQF] priority1: %u priority2: %u priority3: %u\n",
+		config_store.trans_param[src][0].priority,
+		config_store.trans_param[src][1].priority,
+		config_store.trans_param[src][2].priority);
+
+	dev_dbg(dev->dev, "[CNQF] priority4: %u priority5: %u priority6: %u\n",
+		config_store.trans_param[src][3].priority,
+		config_store.trans_param[src][4].priority,
+		config_store.trans_param[src][5].priority);
+#endif
+
 	for (j = 0; j < CNQF_TRANSITION_MAX; j++) {
 		/* apply the highest priority */
 		if (config_store.trans_param[src][j].priority) {
-- 
2.25.1

