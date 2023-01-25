Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1064BC27C76
	for <platform-driver-x86@archiver.kernel.org>; Wed, 25 Jan 2023 10:00:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235216AbjAYKAS (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 25 Jan 2023 05:00:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235023AbjAYKAN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 25 Jan 2023 05:00:13 -0500
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2060b.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::60b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D86353B2D
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Jan 2023 02:00:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gc3S8krCr14SitHvyTGksarDSF2llOyZgmuMJSabydsgUmsVxf0ucEUNwJ4jieLxZti3i4+w+Vag8LEAgQsY8bZv/dN8HLSJxw5ld1ynlLO0pXpI4txihRdEm57KitB3S9Y6gCQljmM3za6qT2PfwoPrXFSTRWaVRnqjyTAPPeSPg5kDNnIB6W1+KFfbXPFHAGWoZ14sxung5LRvloWF3cVgdKPBgNtvvkZ1XRmpz4n/QD21XHwbhlKsmdt/58sJTwdK3Xb5e5mGygXxrn827xHiuprh3JdM0lK7bk3MneO9mSj2Pn0V39QPoiz7OhDgdYDespmUTFkYW/1h99waUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=McCf1gMo11JwQNE1yC2b85xqCjsPPEW5eK5XlgIUMoo=;
 b=PyT8LXaEJbzg4XDpToluz4InacwE/3/8rChB87gsZLtdwxI7DXB6GyJ8frIkTjBG6CbhjE6IoAunlylKPIczh15c8lS90Mao0XmQNoFEiOrR6DOQ8P9ZttN/5srkBNJnYiLVl6cDELe9qnxozOmhfkGFxRlOpfOD24K3MkCEUl7Sfnp5R/ZRepR38b3KmbVuNZG1x782JS8BI3FTJB9NTke9rrXIYn81rG+LkyE5Shdiyp0oKsMCCQKnkfsOwuLVijd2zjnoVbb4sbM0VhVW8kRDbeAexWbpQhuFvI5GLDICyhZqtbzNs0WPQZGwtMFijboz7M9d0sqBdlYcOInOow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=McCf1gMo11JwQNE1yC2b85xqCjsPPEW5eK5XlgIUMoo=;
 b=RAQY0z6aZPhvj6ApVFHrEn1rbIAARRZ4vtUKuiKWhSR4yaxk4mnMdhDC8M4aNGeNBNBIIhuEzEvfJJItz/BidVeyipX7vqDN/A3SjxQzpHCIa0fFlFw/BJCqU+Xq1qUPjhesKa1cnFhlhOigWBiv8o1vJ1Wm3IGmTc9pjgN+y1o=
Received: from MW2PR2101CA0017.namprd21.prod.outlook.com (2603:10b6:302:1::30)
 by SN7PR12MB7979.namprd12.prod.outlook.com (2603:10b6:806:32a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 10:00:08 +0000
Received: from CO1NAM11FT103.eop-nam11.prod.protection.outlook.com
 (2603:10b6:302:1:cafe::6a) by MW2PR2101CA0017.outlook.office365.com
 (2603:10b6:302:1::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.4 via Frontend
 Transport; Wed, 25 Jan 2023 10:00:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT103.mail.protection.outlook.com (10.13.174.252) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.17 via Frontend Transport; Wed, 25 Jan 2023 10:00:07 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 25 Jan
 2023 04:00:04 -0600
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 1/5] platform/x86/amd/pmf: Add helper routine to update SPS thermals
Date:   Wed, 25 Jan 2023 15:29:32 +0530
Message-ID: <20230125095936.3292883-2-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1NAM11FT103:EE_|SN7PR12MB7979:EE_
X-MS-Office365-Filtering-Correlation-Id: ea217f8b-a12e-4090-2ae4-08dafebaf0ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NqXf6tgcnrLVfrMwCuHdRdhyBZwegJxlKmut27dlmSVI14DzrIr+8d73gc0VeAvuU2lRosdvQodto8gl/rmVPvlMa8W3wwDPfBvnkUrK6tT8htpGVfY2NkShBemHMEMKJC19UVpqDQloSjeImNkKSDvZYYFIuejDMBolwMZ/6ZVnB5u735XoJIG7U3Wq5iXxJ3jVvG/fNM71GiUgpXhem0vyKzlSWQ3ZfEngVCbMuYCTOu9gvYtMMIUTGQz+qjz5VNnSzf42cl8COb6EbM3qUyHfc4176Hf/LaxIaZ1nRl1ci4tVVhPjmfciAjue8thwwyRDZ+LP/GUB2c/DMQv9cv/ERppw1ONKG53PZGcxkpVMf36njp+A1BgQnOPiGZQfZTvlmtwG05ffrutp+IyE2Nt+Y+5V7R2VLiEuZpKixs8sd8aOFrqnVJI4T1haKGyXrBPa6MdVeWlqNVBjXhkOpOephrlPtfdj0y1DIDgdKXs7E+LAUyoNU8yiNzvHLa9AW8jBaxzv8y2+Dydsm3w8sEN37L5C6VsTA64m4R83262xXnfyyYCdU1EklTSrlQCUKAKrlK3RJ2fwbIZcUFkAlKoyBg8Woh99zsNQMjzL7KESnwfM+z+JaZdILR6Zp4a7B7ewS0vDYrWNfJkVOFTeVLEGqDfx10oKVrPMSPZVAV+p9DON5gmpasriknXuMTE7YN3VQH3/eSo69lp0BFuAM9HqHpqn/emzYKiDH5TjwKk=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(376002)(39860400002)(136003)(346002)(396003)(451199018)(46966006)(36840700001)(40470700004)(36860700001)(83380400001)(426003)(336012)(54906003)(47076005)(2616005)(478600001)(8676002)(186003)(36756003)(1076003)(70206006)(70586007)(110136005)(7696005)(356005)(2906002)(86362001)(82740400003)(41300700001)(26005)(81166007)(5660300002)(16526019)(316002)(40480700001)(40460700003)(6666004)(4326008)(82310400005)(8936002)(15650500001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 10:00:07.9658
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea217f8b-a12e-4090-2ae4-08dafebaf0ac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT103.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7979
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add helper routine to update the static slider information
and remove the duplicate code occurrences after this change.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/auto-mode.c |  7 +------
 drivers/platform/x86/amd/pmf/cnqf.c      |  8 ++------
 drivers/platform/x86/amd/pmf/pmf.h       |  1 +
 drivers/platform/x86/amd/pmf/sps.c       | 20 ++++++++++++++------
 4 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/auto-mode.c b/drivers/platform/x86/amd/pmf/auto-mode.c
index 644af42e07cf..7564ef1bca7d 100644
--- a/drivers/platform/x86/amd/pmf/auto-mode.c
+++ b/drivers/platform/x86/amd/pmf/auto-mode.c
@@ -275,13 +275,8 @@ int amd_pmf_reset_amt(struct amd_pmf_dev *dev)
 	 */
 
 	if (is_apmf_func_supported(dev, APMF_FUNC_STATIC_SLIDER_GRANULAR)) {
-		int mode = amd_pmf_get_pprof_modes(dev);
-
-		if (mode < 0)
-			return mode;
-
 		dev_dbg(dev->dev, "resetting AMT thermals\n");
-		amd_pmf_update_slider(dev, SLIDER_OP_SET, mode, NULL);
+		amd_pmf_set_sps_power_limits(dev);
 	}
 	return 0;
 }
diff --git a/drivers/platform/x86/amd/pmf/cnqf.c b/drivers/platform/x86/amd/pmf/cnqf.c
index 3f9731a2ac28..21e00ba39f19 100644
--- a/drivers/platform/x86/amd/pmf/cnqf.c
+++ b/drivers/platform/x86/amd/pmf/cnqf.c
@@ -307,13 +307,9 @@ static ssize_t cnqf_enable_store(struct device *dev,
 				 const char *buf, size_t count)
 {
 	struct amd_pmf_dev *pdev = dev_get_drvdata(dev);
-	int mode, result, src;
+	int result, src;
 	bool input;
 
-	mode = amd_pmf_get_pprof_modes(pdev);
-	if (mode < 0)
-		return mode;
-
 	result = kstrtobool(buf, &input);
 	if (result)
 		return result;
@@ -325,7 +321,7 @@ static ssize_t cnqf_enable_store(struct device *dev,
 		amd_pmf_set_cnqf(pdev, src, config_store.current_mode, NULL);
 	} else {
 		if (is_apmf_func_supported(pdev, APMF_FUNC_STATIC_SLIDER_GRANULAR))
-			amd_pmf_update_slider(pdev, SLIDER_OP_SET, mode, NULL);
+			amd_pmf_set_sps_power_limits(pdev);
 	}
 
 	dev_dbg(pdev->dev, "Received CnQF %s\n", input ? "on" : "off");
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 84bbe2c6ea61..b5b77a353b96 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -394,6 +394,7 @@ int apmf_get_static_slider_granular(struct amd_pmf_dev *pdev,
 
 
 int apmf_update_fan_idx(struct amd_pmf_dev *pdev, bool manual, u32 idx);
+int amd_pmf_set_sps_power_limits(struct amd_pmf_dev *pmf);
 
 /* Auto Mode Layer */
 int apmf_get_auto_mode_def(struct amd_pmf_dev *pdev, struct apmf_auto_mode *data);
diff --git a/drivers/platform/x86/amd/pmf/sps.c b/drivers/platform/x86/amd/pmf/sps.c
index dba7e36962dc..5f842d6e6db2 100644
--- a/drivers/platform/x86/amd/pmf/sps.c
+++ b/drivers/platform/x86/amd/pmf/sps.c
@@ -70,6 +70,19 @@ void amd_pmf_update_slider(struct amd_pmf_dev *dev, bool op, int idx,
 	}
 }
 
+int amd_pmf_set_sps_power_limits(struct amd_pmf_dev *pmf)
+{
+	int mode;
+
+	mode = amd_pmf_get_pprof_modes(pmf);
+	if (mode < 0)
+		return mode;
+
+	amd_pmf_update_slider(pmf, SLIDER_OP_SET, mode, NULL);
+
+	return 0;
+}
+
 static int amd_pmf_profile_get(struct platform_profile_handler *pprof,
 			       enum platform_profile_option *profile)
 {
@@ -105,15 +118,10 @@ static int amd_pmf_profile_set(struct platform_profile_handler *pprof,
 			       enum platform_profile_option profile)
 {
 	struct amd_pmf_dev *pmf = container_of(pprof, struct amd_pmf_dev, pprof);
-	int mode;
 
 	pmf->current_profile = profile;
-	mode = amd_pmf_get_pprof_modes(pmf);
-	if (mode < 0)
-		return mode;
 
-	amd_pmf_update_slider(pmf, SLIDER_OP_SET, mode, NULL);
-	return 0;
+	return amd_pmf_set_sps_power_limits(pmf);
 }
 
 int amd_pmf_init_sps(struct amd_pmf_dev *dev)
-- 
2.25.1

