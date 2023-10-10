Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27480CD80B0
	for <platform-driver-x86@archiver.kernel.org>; Tue, 10 Oct 2023 12:04:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231872AbjJJMEQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 10 Oct 2023 08:04:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232066AbjJJMD6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 10 Oct 2023 08:03:58 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2048.outbound.protection.outlook.com [40.107.94.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2924D1B5
        for <platform-driver-x86@vger.kernel.org>; Tue, 10 Oct 2023 05:03:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PmdmqJlVFov/uTXjwP9uTUFuNBE94+Y3VvaZ9lxvDAdE6edJQn8URUzI0n+dwrSODbcFjm6FLbW+Oby2rSohn6Wa+sMttAbiV9ZdsiH40v749GaC4MCzshBEtM9R4MdVeCNj8yrCRU3JzihgtVNd0J9n9TyONEAVY+O8MW0suzVY0PEsQu3rd+cNb9OEk9PiI8SNxc1i2vCcHJ4hTZFnZCfmqPc1Wj6CZ/5CTF0WXOaoXWX20EPWmOfMPoxliFdqqIsHZq8A/uaCm+Y6FtiSK2bvg2RSJNPF8aTvc+AYl+c37ub6zors9fOlO55iBWdZkfgbfnDDWtX7PzJW6+zeCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ts95/oePC0zQc8Vj1znUNIukyMqpkyDCR33buFLyQhY=;
 b=itF2pb0rYkecQBdFbMYlKCYEpNE2oPOdp/2FA3ThM0xqrWrvsB6b+7jjRJwo6eLOPtbgAJRSrJsSqI3ne8RVmRQ7lWMQFhYGix8LuIhtuXL9pzXIe7nqx0FtV6LjXBmMD5fBNbZ3j4jTpDL5dh8ZLwlYbGAKZCzEExvWmXfsLQrpyq0QT8MAKuQRScVz6cs449xbnJ0z+3PxcCu8tNwAh1ymukGMCbnsjgeRNhITSu2buKDvlTPyZhN58JYkpcx238/j4k+dy9q80p9Dv5JD+/uM3fTr3O9nU4V6IoK5lJUijDWmh+++yNssSn3ivdn05fOnDMaieGw2GALBTSvinw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ts95/oePC0zQc8Vj1znUNIukyMqpkyDCR33buFLyQhY=;
 b=AVzH/GP19/gWjVve6HChGRreHE2tAVZgl6+zPXAdLj92w/3wte2bP1uLjSXxgSymqmxzO+r7Krfjj1vRlgO+zENXDumrITNj3sSpanDjB1lcO5nXBDZvgeBXUa+pQ4+6d4bIov5zhnAv5mvDkbyM5jJv+LFpjck3NDz9QoYESLQ=
Received: from BLAPR05CA0011.namprd05.prod.outlook.com (2603:10b6:208:36e::26)
 by MW3PR12MB4458.namprd12.prod.outlook.com (2603:10b6:303:5d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Tue, 10 Oct
 2023 12:03:39 +0000
Received: from BL02EPF0001A0FD.namprd03.prod.outlook.com
 (2603:10b6:208:36e:cafe::d9) by BLAPR05CA0011.outlook.office365.com
 (2603:10b6:208:36e::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.21 via Frontend
 Transport; Tue, 10 Oct 2023 12:03:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0FD.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Tue, 10 Oct 2023 12:03:39 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 10 Oct
 2023 07:03:37 -0500
From:   Suma Hegde <suma.hegde@amd.com>
To:     <platform-driver-x86@vger.kernel.org>
CC:     <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>,
        Suma Hegde <suma.hegde@amd.com>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH v5 3/3] platform/x86/amd/hsmp: improve the error log
Date:   Tue, 10 Oct 2023 12:03:10 +0000
Message-ID: <20231010120310.3464066-3-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231010120310.3464066-1-suma.hegde@amd.com>
References: <20231010120310.3464066-1-suma.hegde@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FD:EE_|MW3PR12MB4458:EE_
X-MS-Office365-Filtering-Correlation-Id: a26688d7-0365-4953-f8f4-08dbc988f0a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N3esTIMGwQZOLZ1Oe1crE406eE4HulL58bXq60KLpA3p0WV97Ev7NYdXvInHncAMWl5eRd1vMp5uHT5Y/O0uXQ6gN0xAMnae2NtYY8sXbjyUM31pkNendZ+jc5YVup4KeM3ozP6Nzw9GlZGZcwoJ4QdPApGUg3Jnmw4LUKLQSGQbWYP2sZSyeJTpqsKq6F9qDwwwbnHCEIvLPJ15KCD0d3VDsgoUaz1yEw9uW11/FVQPHFmCj3rao8lZDnGCx0YrTudI1pHluqdBdpigbZcvxzr7um3vW44Mr/oXnGovWqFSwFGSGt68g6Fz5vjb8RCEwyVGyxgLXaoG0I2WqkoCfMEaPwzK5JkfGven2OKmAqyNZGfPCr2Zg6p6fvJxcbQ3UOUkt0g/ur4O4x/J7CtatfD66J6ruooFyi7x6BQPgNdeAtuYfk3Iu5UwM5mkVUSZ0Ws93NJpmAjU4SG/yi8DOC28VKdh+pKvb0d/GmWQmOPOrckOQO/C7OKjR2vy503qo40u8KnY+sbVODMwz73x54aIqhRKyK6hM8qUJm1TLqboRPZXHdA24klqu2/ehTlKcUCNRI7DK/NnWt3JMGar0BP6km434AEl5Mc+7PmuD23AYjkAOeOzmt8loPKEX6zyoGdAcyftnKyBcwlE+NeixLdSA0ULuD+jbAgHQ+XXAXm/Xcaj5H6VmefudK7VX8SMmozISzLZUr58r09VbFSGRHe6FZhCi4LW5h9UWgjSiWfEZtdCeB89OqhnZH+3w1QQFKRRoNhse5JJHthOE6pRiQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(136003)(346002)(39860400002)(230922051799003)(451199024)(82310400011)(1800799009)(64100799003)(186009)(36840700001)(46966006)(40470700004)(40460700003)(86362001)(47076005)(2906002)(36860700001)(81166007)(82740400003)(356005)(40480700001)(316002)(70206006)(70586007)(6916009)(54906003)(7696005)(26005)(1076003)(2616005)(478600001)(16526019)(36756003)(6666004)(41300700001)(44832011)(83380400001)(5660300002)(8936002)(8676002)(4326008)(336012)(426003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 12:03:39.2798
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a26688d7-0365-4953-f8f4-08dbc988f0a6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4458
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
changes since v4:
none

 drivers/platform/x86/amd/hsmp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
index c620967a5162..e714e7abcac8 100644
--- a/drivers/platform/x86/amd/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp.c
@@ -564,10 +564,10 @@ static int __init hsmp_plt_init(void)
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
2.39.3

