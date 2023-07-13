Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82494EB64DD
	for <platform-driver-x86@archiver.kernel.org>; Thu, 13 Jul 2023 09:33:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233256AbjGMJdw (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 13 Jul 2023 05:33:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233136AbjGMJdu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 13 Jul 2023 05:33:50 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2081.outbound.protection.outlook.com [40.107.220.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89FB72123
        for <platform-driver-x86@vger.kernel.org>; Thu, 13 Jul 2023 02:33:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d81paDnc5DgkGzGPduNfjWABBA/RA/YhU8Iv7e8ETYlRI2Skt39aAX7157B8/V7zMZG7xtYgXfThf/wjLeDqOtEPzeeFkkb9KK9wn/wzLN/vMRLl6mI9MKjjSTPa2R5Lqi/EnzhMH4B41HJtdJOmC9hkYe/5zKjxP2DJ/R7US8/vn+C/zRia7Xw9eK48WgefzFxb1IWLzYRJBQiTSLWN9B1TcX4EhKQgnyniAL9IowUayx71n0dFgFpsdTuhbSmA/bxDfLoUDslok3Rr0d3EZPy+n/hE1S94nGwvRzD5fQCWNCNjb2YnbIcqh4lbSFdlfCN/DMpYdefj5FVV8xpGGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zeMOXdKoDK9yNa8h/h8Q1zGe0Ppqyy21kGSYDkotKp0=;
 b=T7IPDyXVYzhci7Kg4aTHWXDhaOeRBIIO5glcDAAgo8E288qQ/bxT3MV19Lqc+3ww4/NEHaAZeUETS7TnioOSIDYf3UtOlcNCjR0TKTyI1Wa5Frse80nn+EZ3z4pC4tyqDWwKDhA6EuqfTYfKm+5E8vIlWE+kP7Bg36O+24ZvhHpZHgKFzwk3O0XM5n3uWVXtkl21CqbPEPIokki9jgD2B9JJCsaABypJQy+E2UIt6j19fJlNXgUmSfQpRwbKoYFz2ll+DeoV6V+TIJj2SBOpn3JQZciHb9ST1acGNpiw/CHbAaeww0aXZBRdswKXKNzdkfghuhOmFtTPQubkrWi9Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zeMOXdKoDK9yNa8h/h8Q1zGe0Ppqyy21kGSYDkotKp0=;
 b=PjhmSmtiJvg9OleqocVuJAylIhnumdvr2yomzTDSU9tlc6mV+5hLSaDmMVprwhH268shzX8vzV2N3GXQb5cXtP+lr6XXFpKMBt1zk8R8ITsdv+9wbBBSh917xr6LR3uRm67J7VYXT/Cvih0yK9TRWL3idhHDQC/fk4bihdx6Gyc=
Received: from DM6PR08CA0048.namprd08.prod.outlook.com (2603:10b6:5:1e0::22)
 by DS0PR12MB8456.namprd12.prod.outlook.com (2603:10b6:8:161::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.24; Thu, 13 Jul
 2023 09:33:42 +0000
Received: from DM6NAM11FT056.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1e0:cafe::dd) by DM6PR08CA0048.outlook.office365.com
 (2603:10b6:5:1e0::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.25 via Frontend
 Transport; Thu, 13 Jul 2023 09:33:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT056.mail.protection.outlook.com (10.13.173.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6588.26 via Frontend Transport; Thu, 13 Jul 2023 09:33:42 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 13 Jul
 2023 04:33:39 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        <mario.limonciello@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 1/2] platform/x86/amd/pmf: reduce verbosity of apmf_get_system_params
Date:   Thu, 13 Jul 2023 15:03:11 +0530
Message-ID: <20230713093312.1233743-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT056:EE_|DS0PR12MB8456:EE_
X-MS-Office365-Filtering-Correlation-Id: c23b20d1-9736-406a-c533-08db83843f5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: umzzm4nrm0gr7sU/2g693AYVe8F8n6JCDoYIx2g5oFFlbmgBcvFfxZwYJFkoKD3pfdJRQcZNJns10x/iGi9H6JfdFczetmU7uJf8c/Ny7nZchAVC9s2oqPUGQdoFETNFSre9r5+oZvvP50f31lVUTqjWaVvmtG7a5f2B3lH02f/X8gOnIKMxGv2YbqLkpY/P2UpTEoAQqAtelrOK2pwZ7v03mFdapupMDPOlwZtOdenFcQb2e7Aq35DA/f1TMbaASlR60ATlkiJua4AvJ6zTE6E2v9EekbnxFAzaf5kW2WwPzlSNmNzAhx6ORS6EJmoT3RakzmQ4r8WvrTm3gxV1+2diXe+nDamAI1M8mFEKjf931XlLN66yYSBu9VfwvG5rjNhFIbIC3Fec+3K7g2RS62FHKnBCs261UqD5eKIi/UrjpGJgM+DFrIHEM/lTpflm10DbdstWBHtK+lfNb0i6vIFzzAd6CH30O77JjYYLa14RPNsSH6X0p6/6hbFtdPP51NWcTCTO4P9X7qgCcIHyg780cLR9HB73Dh9WU2Yi0yHf9InM9CFtAVQYRzl5WXHJO/VMy3EIDymkm25pEZlAqg5N5DB5gbBrV6VW/xildMM9UjywqT9nDVRP3xRr1l4hAZ70NdhT0Ltl/tkLQR+JtBF4NxIrgvhmAqRqMAq3w9VDcdpDMugWMXFs8gU0r7rTHIyDt1fUlY2SrpVvg5ry8mafpVsu1HrH5Sz9nxHKXe3+cSSHs4Egij+8UoNn8PVQmEuezjNnR+dXJJuvMN/o3g==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(39860400002)(376002)(396003)(451199021)(46966006)(40470700004)(36840700001)(82310400005)(2906002)(54906003)(478600001)(110136005)(7696005)(6666004)(4744005)(8676002)(8936002)(36756003)(41300700001)(70206006)(4326008)(70586007)(316002)(82740400003)(83380400001)(426003)(47076005)(81166007)(356005)(16526019)(5660300002)(40460700003)(86362001)(26005)(186003)(336012)(2616005)(36860700001)(1076003)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2023 09:33:42.4529
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c23b20d1-9736-406a-c533-08db83843f5e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT056.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8456
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

apmf_get_system_params() failure is not a critical event, reduce its
verbosity from dev_err to dev_dbg.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
index 081e84e116e7..732b15b392ab 100644
--- a/drivers/platform/x86/amd/pmf/acpi.c
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -289,7 +289,7 @@ int apmf_acpi_init(struct amd_pmf_dev *pmf_dev)
 
 	ret = apmf_get_system_params(pmf_dev);
 	if (ret) {
-		dev_err(pmf_dev->dev, "APMF apmf_get_system_params failed :%d\n", ret);
+		dev_dbg(pmf_dev->dev, "APMF apmf_get_system_params failed :%d\n", ret);
 		goto out;
 	}
 
-- 
2.25.1

