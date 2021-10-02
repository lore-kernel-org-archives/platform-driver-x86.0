Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3E9BC433FE
	for <platform-driver-x86@archiver.kernel.org>; Sat,  2 Oct 2021 09:33:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8B20661353
	for <platform-driver-x86@archiver.kernel.org>; Sat,  2 Oct 2021 09:33:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232743AbhJBJe7 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 2 Oct 2021 05:34:59 -0400
Received: from mail-bn8nam12on2058.outbound.protection.outlook.com ([40.107.237.58]:62145
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232691AbhJBJe7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 2 Oct 2021 05:34:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MAOx8Ku5CppV8yRsDwnHhdh0hgBsqGCJD1SZY2qNS4q+5W7b5S94Q2CSOOzCLClvTUEtUUZ7Or71tqRcUfq5rmlpes/gqJx6gxIC/lgZyIBq7HT0LXuDfyrKAgzI0FEyO+fikDApo+sPXbzyG5kWL9CuhXKG23hBHbbdDJpBCDmIoqHrDEACzSuEOfy3bCDUTWyYWmGJuLTpV9g/ZwS9UyofcZc+Xp9fzhhlrb1MgYjU2EfV/nCIArD1rrZyGYASFuYjZuTFWrK9eMpDLrWLYLOkgcyR9ZYRHTsZrNFELD43f7nH5m1VW/SEDFU4pCLVyWd5lxUfjJyAOQlrnDQl2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2uwoRYycgBMMjJ++kAmVxd6YdHxPAe0jEqzflPbFl2Y=;
 b=iQQqJ3HOW9fmu2rJ0kij37wlpAfuNPBCRtUrMcnvd9ptnFXSDnicKuXhO+Z/5SB3cte9rLk+7UGhgmT7EdFp4GtKJDRvZbAC511TsD6pmc0KcMdbiPPr9Ug+ApcDL3HMz1gRQ33SI6RvzNfTLzrmftvUU9DabVsK7Hh+aSIn/QR2PLJJbdQbizI8ziKXln9wU5EX/i1wg6szv0KZ2jVs6o7Hpn6LqEz/DWMfKcqs9pnrRd62KFXIn3shUrNusw7Uebq8gFSkSq0MM1IHgVByskHwYFgh0/xsEE/Po43rEmBqdJfsd8YtwMlNMOxKcId9X6lK7cVR3YX2TC3K0RhF8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2uwoRYycgBMMjJ++kAmVxd6YdHxPAe0jEqzflPbFl2Y=;
 b=OCQvhhNoMkeR7mOyZXDjlOiLWJBF8uxoOn3ea9+DfpvhidNbw3terUmmZrPVuAKYN9czhSQTTD/q11JqBnJgEydOVmVxCk1klx2ODI5IxAuVbeo/wE4phMDmkLOHETUTnzGhgLsz6XViOdU/RjpQXpb8wIIySYocZZvYxXGgNCARjJyCtiZLLi6wLNDu4UJTxxRS14Bq4HiNxwXc4UBZ4UEuoZX1iaxNYjv/MrVU8FgaGGuxOvyzB3lSbLKncSbvOgIWUmq+Ks/XOdXywAwy44t1a53ykyB17vx3+AoZEI3SyGCU589AqAKMzH5/LZxCUDD9A/yPRyqHrPBL8rx4Mw==
Received: from MW4PR04CA0181.namprd04.prod.outlook.com (2603:10b6:303:86::6)
 by BL0PR12MB4865.namprd12.prod.outlook.com (2603:10b6:208:17c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Sat, 2 Oct
 2021 09:33:12 +0000
Received: from CO1NAM11FT015.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:86:cafe::46) by MW4PR04CA0181.outlook.office365.com
 (2603:10b6:303:86::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Sat, 2 Oct 2021 09:33:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT015.mail.protection.outlook.com (10.13.175.130) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4566.14 via Frontend Transport; Sat, 2 Oct 2021 09:33:12 +0000
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.187.6) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1497.18; Sat, 2 Oct 2021 09:33:10 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>, <michaelsh@nvidia.com>,
        "Vadim Pasternak" <vadimp@nvidia.com>
Subject: [PATCH platform-next 06/10] platform_data/mlxreg: Add new field for secured access
Date:   Sat, 2 Oct 2021 12:32:35 +0300
Message-ID: <20211002093238.3771419-7-vadimp@nvidia.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211002093238.3771419-1-vadimp@nvidia.com>
References: <20211002093238.3771419-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 11e5b0fa-0861-4e1e-8bd4-08d98587a748
X-MS-TrafficTypeDiagnostic: BL0PR12MB4865:
X-Microsoft-Antispam-PRVS: <BL0PR12MB48652328C3D224ED49AF14B1AFAC9@BL0PR12MB4865.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9oLytCqrMjBQlmqhfrt0P/Ax7Dd1hVX9OhNcLtM+HeH7CYJ4HRErOGGnsWVcaZmuKNbdXv7lM70LpgTYJfq94smzSSM7TVWVirIEdVqrLIwdFF1B5OGAMY/Xfv2E3pXHQYdPzgh+jANunJIH8qO5ue+omfExAbIj/v04zyHzQo7yJVgK8FnTYa7tqeuyJwYSRd5i6OT5LKbrJkiFQvuEaUhh/LXC7t63+x6N1G11q1VrjYo8b2xrp7G2f6/0NfgjbsrK1UO6EZxXoNd3D/Rb4YyJ98OTPbG+/ii72duRzZsf0/RTnT1zzzC8sSWzyR9Qnb6BDFEPMNpFTQaslIB0LkLwKIHxeCmsgfYcho5NBogUrV/DgIHqcdQw356+/X0/0MV7rNKqXNMRS7EzBx1q8aee7tBjlRev9AUKbw9BSAXqj7X//zAJcmqM195YuM1lg4fLPX4VS8MIEfP69EZBumb3li3e3LZL+qGzabE4nt/Hsk3i/YFeuJl9NX5Pt8bLr1JLuSP8DxY3KMYy0ymfu1zvekz9rjqEcBZ8MhPZudKRedvjxZNFQbjA3UoyONz5QrWUbK4IHVlrgpSPK+a/GS/GrYwUXmJDuZx04J/T8djY5WNKjLoaLTz6qe8zq4/6y1uIshQINHxO1tK3I5Tq8CPcV3RKGuHFY7lsgBCyv1ZfsP82FsU6jZMOFNKox/oiDVo+H37hJn1RSrvOoxXukA==
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(36756003)(54906003)(47076005)(4744005)(6916009)(107886003)(16526019)(5660300002)(83380400001)(6666004)(82310400003)(8936002)(316002)(8676002)(186003)(336012)(508600001)(2906002)(426003)(1076003)(7636003)(2616005)(4326008)(36860700001)(26005)(70206006)(356005)(70586007)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2021 09:33:12.2051
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11e5b0fa-0861-4e1e-8bd4-08d98587a748
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT015.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4865
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Extend structure 'mlxreg_core_data' with the field "secured". The
purpose of this field is to restrict access to some attributes, if
kernel is configured with security options, like:
LOCK_DOWN_KERNEL_FORCE_CONFIDENTIALITY.
Access to some attributes, which for example, allow burning of some
hardware components, like FPGA, CPLD, SPI, etcetera can break the
system. In case user does not want to allow such access, it can disable
it by setting security options.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
---
 include/linux/platform_data/mlxreg.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/platform_data/mlxreg.h b/include/linux/platform_data/mlxreg.h
index 3122d550dc00..40185f9d7c14 100644
--- a/include/linux/platform_data/mlxreg.h
+++ b/include/linux/platform_data/mlxreg.h
@@ -150,6 +150,7 @@ struct mlxreg_core_data {
 	bool attached;
 	u8 regnum;
 	u8 slot;
+	u8 secured;
 };
 
 /**
-- 
2.20.1

