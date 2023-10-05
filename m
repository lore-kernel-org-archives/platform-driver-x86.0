Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E4F2E92702
	for <platform-driver-x86@archiver.kernel.org>; Thu,  5 Oct 2023 13:57:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231980AbjJEN5K (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 5 Oct 2023 09:57:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243771AbjJENzH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 5 Oct 2023 09:55:07 -0400
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2061f.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8b::61f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20D6D559E
        for <platform-driver-x86@vger.kernel.org>; Wed,  4 Oct 2023 22:40:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eFPnDZA2REQkPVMVonGbVqB23hh194K0AT0llxBhpCs+zSSgj2I7u0h4XYJxzTPvSs685yeHN+uyvRLEezoA3P/+FWoUZm1sXwx5njs3hNFanLS5x8iLVkCZt88ufL+xXkRdMI6KxCeo6WbniSws3GxZs/qUuDwDoDx+59M8Wda1hLbguEsomQLNWRHRsD2oYmgEorMRpEgrV4gyK5zNL2Hn3L+utkdOuG5+tUowcAy+zy0LI9t5gKOgKrz6iZKzbodWdHaWy8N0uwLCvOx7tN4qBWIYWfpQXArLf9ppFZ2XDNp0hNhB0ei+IGk/NUyYCGbtt/E62wk82yOfvDd11Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dFFgQ/QhgUtXs07w/bKFmp+nU8RZKD/TLTqwDWY5ANY=;
 b=e353dwcVj/bsDem+NnpmUX6OGpF7ZMaMWF7YI2UwNhGrjs9FzFZ2QiQOoe1+K02fsIXubmCfd2Hj4n+oTdK40OD9H6LSwkVSpwCnvHy5vf7h0/ky3AhQSz4R5+Lamw9nxF3xUGDQmpntbIsK2vELV4dF0I9NIQ4slv4SA1jltZk1nUL8ralyIodH3dbqu09q7cUh2++mHfD3wvnmj/h37yiVSBoPvQjbPL+iClqDuBWCEDbEoyyvQOSxX8mKDPsSzcqVg4C7FqDHRvcIHBm3T+Lp1XC+zXQWb+izhsCenCHBB3NsrS+vX1S5xepJt1pYEJYk8fkbPqi3fVC/sdGY5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dFFgQ/QhgUtXs07w/bKFmp+nU8RZKD/TLTqwDWY5ANY=;
 b=1nHL1hH7DYPlb6ADe9ylqM8QCys3YJCuz7ki7mWOlykPUAIQwX//ncrFmDIpOnRmW9NYncOZQ3nStIugpMa++wGI/D0g2djZzE+nSSmhc/aa7PdHraM6+9qyf3ypOuo36HlP8OzxEB316rw9i8bJM1LjN1oj6DO/3e58j9xWjdM=
Received: from MW4PR04CA0109.namprd04.prod.outlook.com (2603:10b6:303:83::24)
 by SA1PR12MB7198.namprd12.prod.outlook.com (2603:10b6:806:2bf::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.28; Thu, 5 Oct
 2023 05:40:02 +0000
Received: from CO1PEPF000044FB.namprd21.prod.outlook.com
 (2603:10b6:303:83:cafe::63) by MW4PR04CA0109.outlook.office365.com
 (2603:10b6:303:83::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.25 via Frontend
 Transport; Thu, 5 Oct 2023 05:40:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044FB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6863.21 via Frontend Transport; Thu, 5 Oct 2023 05:40:02 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 5 Oct
 2023 00:39:59 -0500
From:   Suma Hegde <suma.hegde@amd.com>
To:     <platform-driver-x86@vger.kernel.org>
CC:     <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>,
        Suma Hegde <suma.hegde@amd.com>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH v4 3/3] platform/x86/amd/hsmp: improve the error log
Date:   Thu, 5 Oct 2023 05:39:32 +0000
Message-ID: <20231005053932.149497-3-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231005053932.149497-1-suma.hegde@amd.com>
References: <20231005053932.149497-1-suma.hegde@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FB:EE_|SA1PR12MB7198:EE_
X-MS-Office365-Filtering-Correlation-Id: b2191361-7609-4de1-105a-08dbc5658562
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AmEkLLTLkb4xKANG+ZEGfpQ5P7/tJ3uldCFUJu3jRUQo/lg7qZtoeX7RLRzla7DY0JxVDCCz9/kTg7EPzWbwGTxRZK59mr5xjYTumj6B7b/8b2JHxSoDkU+lPyx2AbG2HmHT1BGWCDOub10GaeKWZLqi72wq96AfYt78KSq/WhtlOEuii/U9hepZWhcASvqE2oMwP2dNyfVUondB3y/xQuiPYnxs92s53OF/U+UGuPKOFDht0OEcM3FLr9ZZ3TiX8BhaC3t8XWwvXV1t5+cajfP0r0hK1OMwMe347+xrnb7lufP1J5j9FoIQOpVvH5+I+kg13O0j0YNYlMyUZuqfN8412T8RBMgwiMYuS9W37pL1PY/XtVZM65o5bAe8fRLJXzjrZv3SGRK+EIB8lEYcPmd5GDku2lm+R3s5AiGEApHF5sAut/qmE7Yw0BPt+aTukpgGJEWqsPa3u61AlgrM4I5AY/H5d1Z4uMfJp1VxfI7xlPlvVcWDu7fTjjAF3ZmfWwj+l18wc+MEawikf0M3x02r7Xqv9omD574OPqJzoqL+XRIHepfKYnL/dav6gFH5Ap9sjvM6WZwwIzM73+6iD4DkOW9XCK1oJvDECTWX49SwtZIqjr4gLOay6npI/ygfKtmfexFePAlJdFDkaDyUjeJ++6xd+jHa+jpzYwAm8A8kSbyx81og3Py2itfTUgmp4Xisyo/ZaX40sfaParVgUimQG3apA0j2vu3uVjiZmeGQWKlh5M9QtvXmNunfqaXQL+6ok3AE22HmRSLX5LYRmw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(376002)(396003)(136003)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(82310400011)(40470700004)(36840700001)(46966006)(47076005)(7696005)(4326008)(8936002)(6666004)(41300700001)(478600001)(36860700001)(8676002)(26005)(2616005)(82740400003)(1076003)(336012)(426003)(16526019)(316002)(6916009)(70206006)(81166007)(70586007)(356005)(54906003)(44832011)(5660300002)(36756003)(83380400001)(86362001)(2906002)(40460700003)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 05:40:02.1659
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2191361-7609-4de1-105a-08dbc5658562
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044FB.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7198
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

1. Change print message during platform init to a more meaningful
   clear message.
2. Return the error code returned by hsmp_test() itself, rather then
   returning a common EOPNOTSUPP error.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
---
changes since v3:
none

 drivers/platform/x86/amd/hsmp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
index 5d8efff201d3..9a887243e5a4 100644
--- a/drivers/platform/x86/amd/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp.c
@@ -560,10 +560,10 @@ static int __init hsmp_plt_init(void)
 	for (i = 0; i < plat_dev.num_sockets; i++) {
 		ret = hsmp_test(i, 0xDEADBEEF);
 		if (ret) {
-			pr_err("HSMP is not supported on Fam:%x model:%x\n",
+			pr_err("HSMP test message failed on Fam:%x model:%x\n",
 			       boot_cpu_data.x86, boot_cpu_data.x86_model);
-			pr_err("Or Is HSMP disabled in BIOS ?\n");
-			return -EOPNOTSUPP;
+			pr_err("Is HSMP disabled in BIOS ?\n");
+			return ret;
 		}
 	}
 
-- 
2.25.1

