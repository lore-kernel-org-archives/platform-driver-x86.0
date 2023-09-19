Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86A25CD54A9
	for <platform-driver-x86@archiver.kernel.org>; Tue, 19 Sep 2023 09:21:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229522AbjISJVs (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 19 Sep 2023 05:21:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbjISJVr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 19 Sep 2023 05:21:47 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80518DA
        for <platform-driver-x86@vger.kernel.org>; Tue, 19 Sep 2023 02:21:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hoBbcdHU7bzEQnOcT+c9cmkhihSKWXCJOjLxbER6uVpCnLwU3XQFgSpLUOE1mOKdjqGMeujopNi1ksqdu9yBVwvcrSOi+6vs+LGQJnD08lEKtDbOhSfucyLUY7iwuSl9zgesBFeqAK4fMHrg5FyN3n+D0buN8JjF6gOVd3Bpe63gGdylXb15LHPy1JkBW/1/nIK2t8o2Q8HCqHC/OPTuR2H1VlyU+Vlu26ouM/CdY6LPIfxGr3L2M0Lo3+aH467FH79c7baFhfOX4gvKQ3Um8p3XOtK2U97/TR5jc25Em0Oc3NNMt9IxhwUyBVGgY2bzw/LjHm5H5J5W/tRLRwkS7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vw/giExdxWXTNErHEpG8cPYf815zOUBr0jq4IaRtwzc=;
 b=bU3/jJEQagFSwYuDzjl9ZnUO7gp9QhuF6Z/nBQTCS9xDiHwhdPsQDzXd+R4FQuYxv9dekF054EDEVGdbwlAViLe7qx4D+kVM9HiMyzpAkWpjpereiV0qgCN4e9kcekA7Nb2RaJZf7+Bx7MHFlWmMWDU+/5PWaxciniQtSeEoxPFJexRNbZg/AfVazxOgrGA7UCv/KGUf70EsUp+ncSix3soOO0sZUUl7UfIbvaxh2FMUb2CAaY33EQnT7L3V3RHLOdRTtPCe1rCnwiUtjyyEMRHmA+/7R4xGJtga5CfTv6OP4X1E0RDprg1dfDxgPhytD90pHDUkbrajCvo3+XtDAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vw/giExdxWXTNErHEpG8cPYf815zOUBr0jq4IaRtwzc=;
 b=WROlO2VE9ppU6JdIgjRLe6q0z2RgUIPo8PW0Hqo9HI6+WZrR7/x0AHPPkdWkKYoh5V6+SqPeQ9LGheXi0PWzqRQ0d8sR+wzDmdjT2Us/nAYI2J76oN2MI1IscIPQ58BWOn3eqeTx5qbQbBaF03lzBicaI1uh4D4Z4VCyQmDrCJQ=
Received: from MW4PR04CA0133.namprd04.prod.outlook.com (2603:10b6:303:84::18)
 by SN7PR12MB7129.namprd12.prod.outlook.com (2603:10b6:806:2a1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26; Tue, 19 Sep
 2023 09:21:38 +0000
Received: from CO1PEPF000044F7.namprd21.prod.outlook.com
 (2603:10b6:303:84:cafe::34) by MW4PR04CA0133.outlook.office365.com
 (2603:10b6:303:84::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27 via Frontend
 Transport; Tue, 19 Sep 2023 09:21:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F7.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.0 via Frontend Transport; Tue, 19 Sep 2023 09:21:38 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 19 Sep
 2023 04:21:24 -0500
From:   Suma Hegde <suma.hegde@amd.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Suma Hegde <suma.hegde@amd.com>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH v3 3/3] platform/x86/amd/hsmp: improve the error log
Date:   Tue, 19 Sep 2023 09:20:57 +0000
Message-ID: <20230919092057.2235437-3-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230919092057.2235437-1-suma.hegde@amd.com>
References: <20230919092057.2235437-1-suma.hegde@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F7:EE_|SN7PR12MB7129:EE_
X-MS-Office365-Filtering-Correlation-Id: f827b726-e9ea-49e9-e423-08dbb8f1d3ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DxpUoALACz/MfZq9y4tG+9EDDaoKyNLr5XZ+Oeue2FHijU+BrB48OFeRCcuSw0sOPIApkNuTP1/TGFP4ob4cqrXwTTv1YYdiPQ5z1l7GCADQ1ht8zMb4wqYsg8IpBbCP4MlSxBTTKQdznaNcLfanHqdjwLFWjcdY8UKaxzFaia4w4fh/4/nnrdNM0CCFQkSjscEDMurtiu/QQF9x52nxTWFlSl7AtEMfv8o+L9APpB5lUT77UlZ3S+QxMgrtybSx57rNuQ3GRiTMmULRUySJiNVAeFWt2GuDNi5GcEqpPNh9FpFedPRhoxrpcvghL6o+mHDNeWzxvoQte0WT5jmCn/pfOm4hiZOt4+fJhVlic7EFjexksgbABfOkzHByTK3u8FXLdI10ofKp7mbM4VSqBVlvLowlTI30VkhpaMnN9rz7E2dH4dUAn9piYZ1Fi8bM4ymPkt/wYN61ZLmll87apCk/hlpDm6qBcZXZmgyzPDXnN4i5Liccin2tkfV/1KBTVy+14D1K5KOjmsK3etUgLbLMSMglWcK49IEF8WSeoY+bN2Bq5EeQkgwo6aJntXTllXgtXK+Cm9E9jI5o/0L7CognHpwlcGeTuhhd1bBJ//U+hBX7teC2GfOLMVRNZMwg5GzoS332F5MOOBoUf0KVbOjHYHRw+PvLkU8h6ialCM+YM3kWdpzUx84eqD1EcGRMvVcDHOaqmtW4bZN0tbJQlygbQjtRnnjNNYypVYIHmCYHi+b/gug2ioxterNecw6nF0MKUaxsHtdJO40pSRqQEQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(376002)(136003)(396003)(451199024)(1800799009)(82310400011)(186009)(40470700004)(36840700001)(46966006)(40460700003)(41300700001)(54906003)(8676002)(40480700001)(4326008)(8936002)(36756003)(5660300002)(316002)(6916009)(44832011)(7696005)(70586007)(6666004)(2616005)(70206006)(1076003)(2906002)(336012)(36860700001)(426003)(86362001)(16526019)(356005)(26005)(81166007)(82740400003)(83380400001)(47076005)(478600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 09:21:38.3863
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f827b726-e9ea-49e9-e423-08dbb8f1d3ed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F7.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7129
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
Changes since v1:
1. changed commit message
Changes since v2:
No change

 drivers/platform/x86/amd/hsmp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
index fc6fba18844e..c4d324436a40 100644
--- a/drivers/platform/x86/amd/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp.c
@@ -568,10 +568,10 @@ static int __init hsmp_plt_init(void)
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

