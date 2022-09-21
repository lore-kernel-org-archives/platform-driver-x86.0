Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C2A4ECAAD8
	for <platform-driver-x86@archiver.kernel.org>; Wed, 21 Sep 2022 10:25:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbiIUKZ2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 21 Sep 2022 06:25:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229733AbiIUKZ1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 21 Sep 2022 06:25:27 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B05508673F
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Sep 2022 03:25:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mNqq+b5QNhcyrhjUj20zcinoJgIOf//E4Q9cPVhuxJ066MADr1lEq4gzYl2IQS7slBmxmAst+v2L6rYg7WGx8LzWvmXxmMsnHwmXfjV9bB6gXZxe3pK2dZEJQ5qoOOhcOfCSOO4ta7YIMSZpUGxH2n+WRkm0Sagwqg7Fn7P9nPoppu1wuEXXA2D4zDaNNeLSUqU0beNygHzZ6GfeiMqv1GVvkeZ9s/HSHtfC/i4DOogPDRX+OQZkpGxT/aLL0UaoDOPHFBDJft7IlQaZKggPj4nE2g6Cc7+uTjdlLVJzrk/+wNtsi6ysnWpxQ6S50RUfiT9xtL1gsNCLdg17gpP3lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mtcbm5UVCj6sbeFicTmSku5yrQfEWV+VMWj8QnpzrAY=;
 b=SIQJSeLftCskD/6rlBZzM5uTIMkFrzgjY1OUFddQrUHicuCfTaiK5rmMvD8pDkbhahU59j07dmaci35WZ/RmqiO1M7ksnYLa1zlRNyNebg9yKuOL4Ebz4haAOzghO5uDEz4plcuqIkuPnv/V9O5ObkuisyWeQ6lmosK41bj7oZ0OlPW8FWHBtfGydZmLe3tB/qk6Ikk+0aFIfy8vBILZvQiVBCvDW9ymChiUh/WQoLxK1bRx3+DKCdfknz61QOrFPrFZmyZ0wnNiAP1402LqI1KVqKz1ZQVftW3Z9gyeTU1gTaYrVUW/rnzMmxH2W3pHs/PZuG9X4YPJ/L8D4p9PTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mtcbm5UVCj6sbeFicTmSku5yrQfEWV+VMWj8QnpzrAY=;
 b=wOo2hMczm7booVQvCjVmFYSzZzr45WVASH7OEvX2YB/Wk1vIvsf18n1SnzLrR+pa4mJbCS3CbGqZr9MJPZi8qw1rX5v+vF3D7AOU6l+IgB3Tub7W7GKDjtebBHG1i3W7QiV7KZuX7HIHPjDkxhqEEUDiogmps/yiHBSH+Rel8Cg=
Received: from BN9PR03CA0640.namprd03.prod.outlook.com (2603:10b6:408:13b::15)
 by SA0PR12MB4446.namprd12.prod.outlook.com (2603:10b6:806:71::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.16; Wed, 21 Sep
 2022 10:25:22 +0000
Received: from BN8NAM11FT067.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13b:cafe::9e) by BN9PR03CA0640.outlook.office365.com
 (2603:10b6:408:13b::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.17 via Frontend
 Transport; Wed, 21 Sep 2022 10:25:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT067.mail.protection.outlook.com (10.13.177.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Wed, 21 Sep 2022 10:25:21 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 21 Sep
 2022 05:25:19 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>,
        <mario.limonciello@amd.com>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        <bnocera@redhat.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 0/3] platform/x86/amd/pmf: Introduce CnQF feature for AMD PMF
Date:   Wed, 21 Sep 2022 15:54:52 +0530
Message-ID: <20220921102455.1792336-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT067:EE_|SA0PR12MB4446:EE_
X-MS-Office365-Filtering-Correlation-Id: 991be1f3-b169-42dc-a16d-08da9bbb96f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2kagbJtDViTGEjYZDeU5p3vt4PSa7uFm9E6jXlOqr4vta9Gw2XCp5rWISXO85keBkUOqB5EpfAhrlBorYQZltWz7y4FAD1BezrnDOSIuTKyUEk+xacHDjJHiGNPubCFqDLQBhrM2RaX82A3uDTAYMJg/dppW0vSy5nu7W4138TqwDKQek4ZNe4Ii1Us3EJAPTwmSHnj2q1IEJkx6QYndewYKBCS/Y89YDD63ykof6uAabVHBTxekYKRrLBUBEtaJ1N+Ka482Ahyx3VV2Xv6WjX4xFf6w68AVxN2sa80ynE/AQTtv/lPL6YpNbMzrby/mIKStTq2zpzMdbNUH9q5v5PVjxmNZFXmKJsQn6kzSYd3yQbGTogGkT2aVG0AslSdayspZp+r2RphX1A3+EqTgilA0hGcg5Oo0J8Vbl0WR94954lKClB1o73p478QgBkuDkSp1dt2sQLnLVUO6yIZmLYMa/dGfwCM2iqEFDZKKtl+Vx/j3hgab/h4JEFm50/ssznxlFpHUKkzenG9vhkQwkOSoMQXstqi6uLmuyaIuvHWjU7wsLhQ4Cuf9+y7cX995Uv3W/YW78TItXloBML4rfvGrb2vJrLhy0XKqAG3wBZy+BkyFjshDhBmZ2ra0otnLb1c8goRkFrT6YQMhzyGPr6vdetrLEfEOdXi7x9qQYPIc2IOpw74D1cVH7wVrHRfZt8/UCvv/3kXVQN/rai0e/xagifDJXGYBHIXMTxuv+pu6lBGeZipYt71PfbxnkWr02JzXqFaFc4aQ2ZxJrFuUyPdkQnlN+blIp5bCHtvxOYyIiu/sLPR4OXF6sCtHeekx
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(39860400002)(136003)(396003)(451199015)(46966006)(36840700001)(40470700004)(478600001)(6666004)(26005)(41300700001)(40480700001)(5660300002)(40460700003)(36756003)(2906002)(110136005)(54906003)(6636002)(316002)(7696005)(86362001)(82310400005)(8936002)(81166007)(70206006)(70586007)(8676002)(356005)(4326008)(426003)(83380400001)(47076005)(36860700001)(1076003)(186003)(2616005)(16526019)(82740400003)(336012)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2022 10:25:21.9263
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 991be1f3-b169-42dc-a16d-08da9bbb96f0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT067.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4446
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

In this series, support for following features has been added.
- "Cool n Quiet Framework (CnQF)" is an extension to the static slider,
  where the system power can be boosted or throttled independent
  of the selected slider position.
- On the fly, the CnQF can be turned on/off via a sysfs knob.

v3:
-----------
- use "is_visible" and ".dev_groups" for sysfs registration and
  handling.
- Squash patch 3/4 and 4/4 into one.
- update ABI doc with changes as suggested by Mario.
- Fix amd_pmf_load_defaults_cnqf() error handling.

v2:
-----------
- Enable CnQF only when static slider is set to "balanced" and other
  cases keep it turned off.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>


Shyam Sundar S K (3):
  platform/x86/amd/pmf: Add support for CnQF
  platform/x86/amd/pmf: Add sysfs to toggle CnQF
  Documentation/ABI/testing/sysfs-amd-pmf: Add ABI doc for AMD PMF

 Documentation/ABI/testing/sysfs-amd-pmf |  12 +
 MAINTAINERS                             |   1 +
 drivers/platform/x86/amd/pmf/Makefile   |   2 +-
 drivers/platform/x86/amd/pmf/acpi.c     |  10 +
 drivers/platform/x86/amd/pmf/cnqf.c     | 393 ++++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/core.c     |  25 +-
 drivers/platform/x86/amd/pmf/pmf.h      | 100 ++++++
 7 files changed, 541 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-amd-pmf
 create mode 100644 drivers/platform/x86/amd/pmf/cnqf.c

-- 
2.25.1

