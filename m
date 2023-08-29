Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC694C6FA8F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 29 Aug 2023 13:40:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbjH2NkI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 29 Aug 2023 09:40:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236526AbjH2Njw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 29 Aug 2023 09:39:52 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20600.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eae::600])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6AAB1B1
        for <platform-driver-x86@vger.kernel.org>; Tue, 29 Aug 2023 06:39:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Krv7U7UvsMs9V8Xxf73KAOeQtrfXMhatnlO0amvI76Oh1nmNZmTG8L0WbasMc50yEQBfj5vlnGk0lQxh4it/ziEN7ZQyeDin4SA7NUk26ZeaDKZZnojas9opmvxDEBIr3ZS/c/gv+bgt7o9r1iaTqNk+PwoXHDkSFVWqQbpjkUx71ZE27/+ljOXon5fsbnIwaBMeXA29CfdcjWWxD63lU1A00SWcfxWZGywfNhPCg4PZIu3y+QLR5sAjv1kb1JZ0M7GVZc+XWhALHhaTDDYzDVivaQ3Cz6vtSeC3ga05BmaVEsEQSUW2m1Z59nCwFPaI0F6SBdh3m/LOF1yCQ/bOfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D3VhOeL6P3jhDt7LnvyqbsprtVeoAdU/auw5uJ9WBmg=;
 b=dlJ0iA6pf2WZCNN/1gbckejU7AqWF4wEov6APTqMZos9ErxJ6F1mfqr9b3c1g56Kl3hEf7uV8X8Y8FRdAJpi0C12Tg1ocgSPV9v1hOeAIK5Tbvff2/x5R3UkdiV3r2M7A4l1N8lQ4ebBR/Se4rJbsV/sLLI/cuJfvFImd1gaONiYtRLZys6VYEIeM0Wj9Jqh+iOuqanezACwTJvv+5G8JHE2F1iGW06xJaWnJg8gl5NxYouqyFu+6HROn9YFJVw9iMIuru3te4fRIj8+gBI0T3g8aaidabuQiv1AHi8VXhw/LuPjWEb5Edr/v49YP1RQzxlKE2yv+Ogudj4nU+f8qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D3VhOeL6P3jhDt7LnvyqbsprtVeoAdU/auw5uJ9WBmg=;
 b=IXQviw07XLY4nqViOLk1bgQYOlO/+DWDnnleTq27j4TKeA7pBJT3iPAF/aLvcMtmsSBVuADfwZiQQl/quGDmJ4fghvaqls7UBtqfoTzX5o6WynAaJYInjnwVUl/31RfTNClViQo4t9+UkWeZ75DhBCAZyl/SD5B0VMOkCfNV+PrbQI8bHtZEa00D0U/+exa3zyTNrTCNyMAZisYmPXTtB1CzvCFvgm9RmiaraakElxvUOFYTwL2eIRQG27wNECyTG3nRD6is6F2oxSrhHSQpYsVUguOZLJ11Zyb6Z+iC6v33VjLkndXtV1JCKIaMSqV/04gBbyDz32hmO69n4lAYVQ==
Received: from MW2PR2101CA0035.namprd21.prod.outlook.com (2603:10b6:302:1::48)
 by DM6PR12MB5024.namprd12.prod.outlook.com (2603:10b6:5:20a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.18; Tue, 29 Aug
 2023 13:38:13 +0000
Received: from CO1PEPF000044FD.namprd21.prod.outlook.com
 (2603:10b6:302:1:cafe::68) by MW2PR2101CA0035.outlook.office365.com
 (2603:10b6:302:1::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.9 via Frontend
 Transport; Tue, 29 Aug 2023 13:38:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF000044FD.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6768.2 via Frontend Transport; Tue, 29 Aug 2023 13:38:13 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Tue, 29 Aug 2023
 06:38:07 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Tue, 29 Aug 2023 06:38:05 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <ilpo.jarvinen@linux.intel.com>, <rdunlap@infradead.org>,
        <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next 0/1] platform/x86: mlx-platform: Kconfig 
Date:   Tue, 29 Aug 2023 13:37:47 +0000
Message-ID: <20230829133748.58208-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FD:EE_|DM6PR12MB5024:EE_
X-MS-Office365-Filtering-Correlation-Id: dfcf98e4-94d8-49ab-ef7a-08dba8953181
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZoHthjGlpxE7KySN6YMIyJmwKoZBhks52vrYhB7Nhwd8krgrrurA7SA913R1phnIZ0gOgJ+6XjjS1AN2R4kK90r0gKJgeudMzhYFODbMOa3UTf7MgH4TT9+J3hjQlE00g7/qz2GummUdGy69Lu4IOtlQNEEW5diI/ff8k/v9XdQP7b8oJL8AiBrcSbqM+6qzQn0giIgnq84exXIXR5db5ArxwtQgnNg2GyIZPxVSxHS0Nmyrrd6LuhBZQHd35/EpuQeiUCEfBGi3ZIDMxhw4aOlQliLf7aOtB0Untx9vMMHVuwP4Mq051pz9XcHUnB7dDV9gT9eqWIEjAt2Hqs9DAMrUd8922dknjl/Sr0srG/KJzTwc/RqgN/E/Jyhte3uq5NA+EZiKEcLg2Fluj+D9zF+FSYzXQxrXu8I3asK71RnyEtwGrtkP2Xefen10C6KstsHwlHmZcfpQQvTjOY27cU+fC4UndupbQw6okH4yv+R4PYVPjxdloYFpd6ELevMkYAcAn3BkG4sTY6ADNzEHDoIsXa7hhIUfFnQxZh/yUteHm8z/xZ8fssm0wMoLZfWWYZDU9z8O6d96zGFdgJSFOhQf9bkBdFWk5kjyvtwuUSl9kjNLHZCTjaH4J8rK+iLZfLVCLYbRdDxQ+JoerQTxLeQeffJjbWSNlp9sLyIol6myGe5wDp4o1dZJXTxLVv1cBsx2AAv6wkfjtE6ygqLc/s/muxzX8vPdHctiNJhb3GjCpJxgKzKQzz4Pwv/nECnxjCRyuI9CWZeQC5JyPxqrcbiekFDemuyImQZryYluUkg=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(376002)(136003)(346002)(82310400011)(1800799009)(451199024)(186009)(36840700001)(40470700004)(46966006)(40460700003)(316002)(6916009)(41300700001)(4326008)(426003)(336012)(4743002)(2906002)(83380400001)(4744005)(47076005)(86362001)(107886003)(2616005)(36756003)(26005)(16526019)(5660300002)(1076003)(8676002)(36860700001)(40480700001)(8936002)(6666004)(356005)(7636003)(82740400003)(966005)(54906003)(70586007)(70206006)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 13:38:13.6312
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dfcf98e4-94d8-49ab-ef7a-08dba8953181
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044FD.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB5024
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This fix is produced on top of:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=for-next

Fixes: 1316e0af2dc0 ("platform: mellanox: mlx-platform: Introduce ACPI init flow")
from for-next branch.

Vadim Pasternak (1):
  platform/x86: mlx-platform: Add dependency on PCI to Kconfig

 drivers/platform/x86/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

-- 
2.20.1

