Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97B53C77B7E
	for <platform-driver-x86@archiver.kernel.org>; Thu, 25 May 2023 14:20:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233992AbjEYOUH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 25 May 2023 10:20:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241241AbjEYOUG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 25 May 2023 10:20:06 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2060e.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e88::60e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 330F5189
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 May 2023 07:20:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UrjQa8FNNBkRNZzCTM1vFQvAAOaWi2NQKh1pfPtCAbmRcKRT4lEBdSpcx9tA9kKKVvaePtu0btH1HfAPKt+sor37jFW9ExC1AQlFa6uuLYkYztEbRDwSg/UNCp+tIMyfEWD3u9k9HYZSZJ8v9mEVG5aekPooghSJY8H4zmI8r2xR4RMv0viPjD+tUWlgfwkSOiIfDb5nZbflyEX68J8P5hUMAtPFO6MOgXboCGc142ljrPFob7fPO97FJ/iOHyKE9kKBQ0hcrbrRh7oxSShgGcziLIpT3grFXD28aCBti1V1IHh38WWePW32WrFunMTKiZGjxC2n+kNuzP1Fx8YkuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2DM0EgCKzA0GcMzTHspcHmkFkoUp33wFiKzHCNiuYXY=;
 b=NGS3zzcJlo/03D/i2MB5piwA4IzPIux0SHan60kEUD40vPHV1qYkRsRNj3CTB4/wk25asTGbAO6QPIIMOXfE4qsYhv0b/Qf+Qqjaiy5pZCHpzCjJbdk5Ge2imCOPD3+sS3UbKlY5l8Llp7HxevH5hgqNeHnsm3R5q/7EUKPt4Nu+NJ8WWAC7No6vdS1dTYntYUxAR/2me7x7HwcL+mh2lao1CGGnNcektPwvKp+sLyhreOucZvlt+8W0f2UmEUr+VUI9E6tZ3Rjmg4UOdHbTK4UqP3TWbAmqAWDySfRN6bfU0SXnYU4ymKa5eRsL6bLrU7ROdtZxexz4adb3xxq6ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2DM0EgCKzA0GcMzTHspcHmkFkoUp33wFiKzHCNiuYXY=;
 b=2+GEDU4pfaP5wMDtQI6JvRD4kTlk3DFWDJocRDPieW/H1e98hhww1r/tXZJIcMmb+coF8k83tPcF23Rg7iatjRPm+wbUphpHqMDVXpXiGhtj6N4++vuSSQhYZBqP/SDnUlzV5WS+hW/eVDYwdyW3OFKX0JyglYEmk39FSBAofmk=
Received: from BN9PR03CA0474.namprd03.prod.outlook.com (2603:10b6:408:139::29)
 by CH0PR12MB8549.namprd12.prod.outlook.com (2603:10b6:610:182::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Thu, 25 May
 2023 14:19:58 +0000
Received: from BN8NAM11FT054.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:139:cafe::33) by BN9PR03CA0474.outlook.office365.com
 (2603:10b6:408:139::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15 via Frontend
 Transport; Thu, 25 May 2023 14:19:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT054.mail.protection.outlook.com (10.13.177.102) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6433.16 via Frontend Transport; Thu, 25 May 2023 14:19:57 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 09:19:55 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <mario.limonciello@amd.com>,
        <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v5 3/4] platform/x86/amd: pmc: Add helper function to check the cpu id
Date:   Thu, 25 May 2023 19:49:28 +0530
Message-ID: <20230525141929.866385-4-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230525141929.866385-1-Shyam-sundar.S-k@amd.com>
References: <20230525141929.866385-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT054:EE_|CH0PR12MB8549:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b2b6967-a9da-4151-f29b-08db5d2b1e80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EAJPuz2a5LjgwegNMnJCHAakLB8MsJyKHVT0J9ehNIAZPyuhMdOKAswJGg35NypGTe4xtj5ZNelgnEKMvfyho8cTXgQAMVR9vK3b4MYHT6h6oafFc7T0GSOxkMwvkU1uAc/YCKiQ1qyMJqkfu1HWtli0SWzO6ERrMN7a5Ti8yYkF4szc3Lh4qmwmOli6ZEVogaNcJKYgQuyIQmGpQRRqD0NolCgtRR3s02L+Y0zgIUx42eefqMP3x/cot9Apomq3/iB5sMv3OvuaBd8EYSGOS6S3ySpD126qqaAw+duj0i4uzVydMwYgEl++2+ipMGCpiYqJ0n46YURz/WJex5Zm5UFOO+qUDDKpBmqNa4P+MOzMfkrd2HA8zuy1T/XNd0cfqydOR6n9lMAz3LpWTxRZMU2LCfv+xTnFWM9hxPBqvE53qbMznibUU2ufjmkFB8gEwfDXxRYc3tW6elvcU7hpQcXiET7UoJh6N6gqoVZUQz0Z0niw5D/wTmx8xfmtv7lyUHHKoCfoBEn/PqZ+dmVlK6/TzG+8sK3pDxYr7y+yVQIv+PmjFnP2GBUKOXhjoZw2kbsTEX5iZHs2u+n80omyfj2hfthWEAbvHqEPuMJ5sy0WUvY4uPhL1xmX4Hk10IAb5ACuvVDG/Hm5qzzowZUP8FhHJ92ogG45Mkzeh4qDjNh1iaGGfWrfeeK0tKUqzAlFBIwrnkvj8Ci5f5Rvv2LlsDg0clfCNj1U2Uj75ojOzRHG/X9ffcIzoY0RYBE9hlZWEHp+5CS/rrgMI5VAFTEHWw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(376002)(39860400002)(136003)(451199021)(46966006)(40470700004)(36840700001)(6666004)(426003)(110136005)(478600001)(40460700003)(2616005)(47076005)(83380400001)(36860700001)(336012)(86362001)(40480700001)(82740400003)(356005)(81166007)(7696005)(1076003)(26005)(36756003)(16526019)(186003)(41300700001)(8936002)(316002)(82310400005)(5660300002)(2906002)(54906003)(8676002)(4326008)(70586007)(70206006)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 14:19:57.9332
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b2b6967-a9da-4151-f29b-08db5d2b1e80
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT054.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8549
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
index e2439fda5c02..c2f03cdc9ca9 100644
--- a/drivers/platform/x86/amd/pmc.c
+++ b/drivers/platform/x86/amd/pmc.c
@@ -564,6 +564,18 @@ static void amd_pmc_dbgfs_unregister(struct amd_pmc_dev *dev)
 	debugfs_remove_recursive(dev->dbgfs_dir);
 }
 
+static bool amd_pmc_is_stb_supported(struct amd_pmc_dev *dev)
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
+		if (amd_pmc_is_stb_supported(dev))
 			debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
 					    &amd_pmc_stb_debugfs_fops_v2);
 		else
@@ -1036,7 +1047,7 @@ static int amd_pmc_probe(struct platform_device *pdev)
 
 	mutex_init(&dev->lock);
 
-	if (enable_stb && (dev->cpu_id == AMD_CPU_ID_YC || dev->cpu_id == AMD_CPU_ID_CB)) {
+	if (enable_stb && amd_pmc_is_stb_supported(dev)) {
 		err = amd_pmc_s2d_init(dev);
 		if (err)
 			goto err_pci_dev_put;
-- 
2.25.1

