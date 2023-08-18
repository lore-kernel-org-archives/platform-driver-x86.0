Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CEFBC71143
	for <platform-driver-x86@archiver.kernel.org>; Fri, 18 Aug 2023 12:52:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376974AbjHRMwH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 18 Aug 2023 08:52:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376983AbjHRMv6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 18 Aug 2023 08:51:58 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2084.outbound.protection.outlook.com [40.107.220.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BE6726AB
        for <platform-driver-x86@vger.kernel.org>; Fri, 18 Aug 2023 05:51:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z4pC9BSAY3sNNS+hHF83pj7KCpN+Rg+PRey/VeDxnmdibaE0IvN237eVPBBVHGg/ekp+wvvmWaZgg3sxlF8vHkuCVBAICOLGyuHJci4JQ1zNQytbrr86n++pCxO8gSDB5p1t1gg/4aItJsn7jiImWzVYUu700PZTfNBgNPG3ZOtOOZAlGEdaFW/0NY2mu5pPIiULbVi7+BmQqKO2MMwDyPitNSLPFNTmCmbM1a1ox521+MjgxYWBp4ZiwVqlDMKnO0PTPo/PwpI7CDN2CKouSROXglADuTSa0Tepl+MKHlXNui0l/L1wdG72vhzhHgpoW8dS5PWygGJOe3Zzu8vZtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H3olOaVLBpw5eghEYVnrf9L/HTnEKbwmgDFDNtFpLrY=;
 b=iAW9U62CgEwx5WmzBcB0A6rlUNXU55xu8C+Vo4CvCM7E7o3ftoT+4cweAiWeuzCKSJ8fQpuLaAouQFwt3cBfuWmyPjo7D9g6mu+0mNPxrgVaKXpJ8nG/onvQz+BZEBJmGLUfFL3Hn/AhnnpxvJtsV1qbqkP1s3fYHr+9Bu15W01W4U4wnX5XqGriCwf5p+ek93lW5ewpAqYKsahHC3gr1E6gJB4FWFzcJp628ArcdpMucMp6EvhkUECh00JzmgNBdX+I9fKOl6AaLRcobMjoEvVARlOnvs4U3CdmLVkXWd62j8YmA+UDaVA0wR5LcYekeGPYeYsVFEIzagpsPp9JEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H3olOaVLBpw5eghEYVnrf9L/HTnEKbwmgDFDNtFpLrY=;
 b=TTrHCZwQquXix0aodJMEBHH1rgZWWGByEnpPCirFm9RmziV6OrQ5B1fAus8kUh0mvAp1MlzTSm4v+g4Uwb6cDuM+xoaLkFneFrGkdmUcjVzeKAlUjGHfTn9WQV2tmHFTO+v+8d7EN8Ey40egj13kfqeewZnt6+5fSScj88AbPUs=
Received: from SN7PR04CA0192.namprd04.prod.outlook.com (2603:10b6:806:126::17)
 by PH7PR12MB6935.namprd12.prod.outlook.com (2603:10b6:510:1b9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Fri, 18 Aug
 2023 12:51:54 +0000
Received: from SN1PEPF0002636D.namprd02.prod.outlook.com
 (2603:10b6:806:126:cafe::6b) by SN7PR04CA0192.outlook.office365.com
 (2603:10b6:806:126::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Fri, 18 Aug 2023 12:51:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002636D.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.15 via Frontend Transport; Fri, 18 Aug 2023 12:51:53 +0000
Received: from trento15c5.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 18 Aug
 2023 07:51:51 -0500
From:   Suma Hegde <Suma.Hegde@amd.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Suma Hegde <suma.hegde@amd.com>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH 3/4] platform/x86/amd/hsmp: change the print message
Date:   Fri, 18 Aug 2023 12:51:19 +0000
Message-ID: <20230818125119.1323499-4-Suma.Hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230818125119.1323499-1-Suma.Hegde@amd.com>
References: <20230818125119.1323499-1-Suma.Hegde@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636D:EE_|PH7PR12MB6935:EE_
X-MS-Office365-Filtering-Correlation-Id: 92a205cf-e0b9-4533-112d-08db9fe9e608
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p0jjX8K6/Vr1fPG6nB1OhYEccOW46lVnuxuU++TQWWXz61F6ExKXA7E/usTF2KSbyiAsRqkZEeYKV8+3GgcnsZgf2GxLQEdHoZubyNEzAgbLafdLBGhUcUvPWt4HDpTqN7/hyvburyr96aAth2Oc2gJ5NCf0mPGbPrHplAyzQraDBWDSfxJtdr5G6Ox4dmR113HuKiDQeupnUz+EvOzO31+dwdjXyIcxfpObgbq3K9Thc7LZ11TGzHenan+1336iQBNHr2s7TmW4xhvy0YJ7hqV0PToPsVpURxAidkFms/s17dE+H3P32Lh0QF/IVuAlfqxykAB32RBPI1cga7cQDBw+jA4mqvHJlBryIPCBZ1upFn7+s2u6BRA08PC3ZdwV/0A6c+WjzNHHmDPRMRnvQMqDW9Orvaz2ZPQRUSjlzvXHd4PQ2jCDarY9IqU8y9HQgx+RTmw1d11wrRQ8Y01DxG2LgR9FBHFN25mlRYhbHYlBoXjYPTUaC3Jh/FRDbRIWL+GNYzjYJqZ7Q4opddrUZVN74or0KctVbslU9d6RGIH7o27E4xCBE3AikNMdxIbkrgBfQZT6HQCx7IQRzR2tRaLz+yqxzrqZnd0Fk2D29jrf87rMuIY0Ld/mI5t/fZUYGq+3tiMon2RV9iT5G//yWtEZvCs9h65NU0iZKuM368/TYhrdEq7u2pwmUiNL5RBLPE+/tpdIrErcXwR89drOyIgtpwNqvpg66DxTgXGQFfJdBl/JblB3FiRNbVYHPP7K3YgHQo6gqBA5WRSDuxEgQg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(39860400002)(376002)(396003)(186009)(1800799009)(82310400011)(451199024)(36840700001)(46966006)(40470700004)(6666004)(7696005)(40460700003)(86362001)(16526019)(336012)(426003)(1076003)(26005)(40480700001)(83380400001)(36756003)(36860700001)(47076005)(81166007)(82740400003)(356005)(2616005)(2906002)(54906003)(316002)(6916009)(15650500001)(4744005)(41300700001)(70206006)(70586007)(5660300002)(8676002)(4326008)(8936002)(478600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 12:51:53.7916
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92a205cf-e0b9-4533-112d-08db9fe9e608
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6935
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Suma Hegde <suma.hegde@amd.com>

The print message during platform init is little ambiguous
so change it to a more meaningful clear message.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
---
 drivers/platform/x86/amd/hsmp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
index cab59750cde2..1f03a22a9d8a 100644
--- a/drivers/platform/x86/amd/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp.c
@@ -537,10 +537,10 @@ static int __init hsmp_plt_init(void)
 	for (i = 0; i < num_sockets; i++) {
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

