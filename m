Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 999A8C636CC
	for <platform-driver-x86@archiver.kernel.org>; Mon, 13 Feb 2023 12:15:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229897AbjBMMPc (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 13 Feb 2023 07:15:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229958AbjBMMP3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Feb 2023 07:15:29 -0500
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2053.outbound.protection.outlook.com [40.107.92.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4153E3C00
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Feb 2023 04:15:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dFMBaLSEy/9sYJ3GLeOFamRGBFvTlQADdggN50GSH1lUJ4B66mSGnlfS9SbmUwniu47yB2jqX6OpG6kL+hNOXvRqSz7A3PcfWOSwYiOEBZUmwo6IeWRDNt12v5hLSv5Ib/W/taLOtdRJxSiAhJyAQiP5I6ug15ZUqBXoy4Vw+Y6byXNXnQLgvb74VSeFMqg4SMePhSQ56KaOzpIJeK+/+eQ3ChmqDKj+UhQ2KhPXbQ0fuJ9CVEvj0jcWlt6Og4SOGuZ2qwkuWy8zWRz/eGSdW32atpTP7s2MSI3ZYOZ4JinxgJcLqRS3VU0EG5cuHhgJM+xvhG1t3D2ArwXbkSQC4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gbz4LjADfGVEyQ9sCiktd7u65Yad4GNGkAxmkf0FOXk=;
 b=XLXE53ilDIqtAeGU2J6kPW9QL4oPZh136Ck8bwpunD5zev/X9fWfTL/7FqjtDPUGi/xOefnOcvUE6mIFK03J/d9gjdrmwI7+uSR7CEa0nBSurjyMVuT9KB+XLw8gAOj9i5phLbAZhJOHOmPmZnsGg3LbnaV9OSPQDLzMqcME1F544132F0ehgD3OCMEf8VHc6UaNzANvKyNWTqcLeMxSO6mgm0dT8kPFuauzl0VWyWJLcQQvr6+mOZCtmNRcOMC8+74OFXoKoov6kLHsnGH/YdbdR60krxSWBqet9KVg6cWPRs68YjmPb8Q8Kn0s1IokUtGQIp0Zq16c4ttV8/cF4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gbz4LjADfGVEyQ9sCiktd7u65Yad4GNGkAxmkf0FOXk=;
 b=VItxSwtL1LaMruIcC73uGmB1706PaPGNjF5mU/0pLewOzVaF1fOmrng0wmfwXGTEbNx3QA6RwuBQgc4LV5uSECwFHT3qEPeTrEiLfLRpaqvP1/l0BJQl2bv43nAufXd01H8kyzDKbXY0+N/jQN5+y+JVrOya4HaCJVVu8+GCr4Y=
Received: from MW2PR2101CA0028.namprd21.prod.outlook.com (2603:10b6:302:1::41)
 by PH7PR12MB7914.namprd12.prod.outlook.com (2603:10b6:510:27d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Mon, 13 Feb
 2023 12:15:21 +0000
Received: from CO1NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2603:10b6:302:1:cafe::fc) by MW2PR2101CA0028.outlook.office365.com
 (2603:10b6:302:1::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.4 via Frontend
 Transport; Mon, 13 Feb 2023 12:15:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT010.mail.protection.outlook.com (10.13.175.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6086.24 via Frontend Transport; Mon, 13 Feb 2023 12:15:21 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 13 Feb
 2023 06:15:18 -0600
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        <mario.limonciello@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH] platform/x86/amd/pmf: Add depends on CONFIG_POWER_SUPPLY
Date:   Mon, 13 Feb 2023 17:44:57 +0530
Message-ID: <20230213121457.1764463-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT010:EE_|PH7PR12MB7914:EE_
X-MS-Office365-Filtering-Correlation-Id: c03a9340-6075-4f3d-9c38-08db0dbbfa5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yls4mCiWXaGRpoz1PRyPja1O0gAo+dGztOqwMseu4P9uxpitFOpP8dNm4DRD5NP1YNKbzraRL7OrYllQen5fY5FOVBtOdbVXietZUEkijRbnsDDTAPOWUduThj1kpltrMSwBa4CBuHWYHwkpWUX1m/1Q6RVWmXr7bC/ipDnx7nnEQIkUgp1f0OfANXmVTVcm+g3TE8Y8vxocBZ5xxIhIUfD++itSEesbes3WDeiCd82ujkzqH0AqFCUTqCVyQks3RUhT9luzUXw7gZRH/Vy9VOt3jiTv/zjHp1CqRPmkpvnzu/ODAwluuLKuhKcMl7d0O5EzI/B8PCNCMutsR90DX1bIbzb/J31MaHeFwKtIMCtkhQJbbW1dwP3FAlTZPJ68VOqc4x/rRqB5cE8uK2Bo6d/j0eDZTWm5Ze3XwTP9mF8WizO20hUVb2bWBqh161oYJq+ZnpNnMUTRzBDJhIjluu9zzwYfjSsQy4GJVtNUa2JpEK1J6OuKSHMrqzogx9FSfbNL+T06nQt3VbuTd+gKq9gl1lRFdiEmDM3GxjqBNpmD9B9ynebadi0CY8cdN6gyussWgwW3BbGnTbn3Xs2gf8KeQASHbyMlNNusTiEu2ZD98g70jGFvjmRF0Ws3Ka0pEKj8Iecs0h/HIb+WuCdw830NJf2NdjM+HrvJ5MgydsWdLt5qM62zG2qkEfwNZNcXeJ+V/g2cpil4XZFI7Evrah5/TC0Hfcyqco/B3U/7+c7YfFA4VNxRaHcEuh8um63FQhhjMbAIlsKs9uSVNBmohQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(376002)(136003)(396003)(346002)(39860400002)(451199018)(40470700004)(36840700001)(46966006)(82310400005)(36756003)(86362001)(40460700003)(40480700001)(426003)(47076005)(70586007)(8676002)(70206006)(4326008)(83380400001)(110136005)(316002)(1076003)(54906003)(2616005)(26005)(186003)(16526019)(966005)(336012)(7696005)(6666004)(478600001)(82740400003)(8936002)(356005)(41300700001)(2906002)(5660300002)(81166007)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 12:15:21.1938
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c03a9340-6075-4f3d-9c38-08db0dbbfa5a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT010.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7914
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

It is reported that amd_pmf driver is missing "depends on" for
CONFIG_POWER_SUPPLY causing the following build error.

ld: drivers/platform/x86/amd/pmf/core.o: in function `amd_pmf_remove':
core.c:(.text+0x10): undefined reference to `power_supply_unreg_notifier'
ld: drivers/platform/x86/amd/pmf/core.o: in function `amd_pmf_probe':
core.c:(.text+0x38f): undefined reference to `power_supply_reg_notifier'
make[1]: *** [scripts/Makefile.vmlinux:34: vmlinux] Error 1
make: *** [Makefile:1248: vmlinux] Error 2

Add this to the Kconfig file.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=217028
Fixes: c5258d39fc4c ("platform/x86/amd/pmf: Add helper routine to update SPS thermals")
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/amd/pmf/Kconfig b/drivers/platform/x86/amd/pmf/Kconfig
index c375498c4071..6d89528c3177 100644
--- a/drivers/platform/x86/amd/pmf/Kconfig
+++ b/drivers/platform/x86/amd/pmf/Kconfig
@@ -6,6 +6,7 @@
 config AMD_PMF
 	tristate "AMD Platform Management Framework"
 	depends on ACPI && PCI
+	depends on POWER_SUPPLY
 	select ACPI_PLATFORM_PROFILE
 	help
 	  This driver provides support for the AMD Platform Management Framework.
-- 
2.25.1

