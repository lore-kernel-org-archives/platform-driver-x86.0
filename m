Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A360FC433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 12 Jul 2022 15:06:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234035AbiGLPGV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 12 Jul 2022 11:06:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230251AbiGLPFu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 12 Jul 2022 11:05:50 -0400
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2041.outbound.protection.outlook.com [40.107.95.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E195C3AEF
        for <platform-driver-x86@vger.kernel.org>; Tue, 12 Jul 2022 08:00:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dC/8IrEfgXsxcX6SJOynTzIrSCFO8CidSSFhL/kWLCUqfJlSPUQ+BfqpzIRYmdArpofJWawY4SKiqOGbWK9zOgxd6Q9WHH3wLc0099E9kHuo1f0P826p58uZcO3oKfY8l6pbAWY1+FQSeeNbUC8jgcFnLo2gb/jB/VaPVcmjoXKUq11Cvve37HYhSfYq+AbTDy702hCZB2mhhb5KqyMwjUDJn5UjwURkKAKCd3tEDzj/x4UpNA0voMkri8/KqIwfvECuQUPODqp9pWO2edBuHUNTfmAnOBpXW0MPie/hHFpMQPDjlMzzG8NV4WmH+UQ0mcjKaUOTFCZio8u1BzOrtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+SfE3GFOebpNqZIYtIcY79K/JtB9+2nhPL66kqeDB8M=;
 b=Ocrmkj15cAR5zfkbA0QrwLpKkXNC48YghWFapVgvcdCj8c0TIpEAAdca/JH1cSE9OztV76Gkwm2lvvh1yKvcSx8xtL4SoBhql58MzEHpZa70yfJJJxkjje/RHV76wDqpCxejw8ZSQ479wMM1d5YtqNf8DlkD445aOm/t9C5iaMe6jF57aCN3YOfPnbFHzh38iUZbdnXxK1+oowpxQNxpiirEe/16xHx3Z7Zy1JgkM3yuK2NCInoFvQjQn2ATdSaTzqaKK+F5/JgCb6J1b4+hj62RH6v4AhbyQp3UrfNm82r9OIEdGKw5rA2M+JRHTG3aoZPzOhk55HyKbniNPmeD1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+SfE3GFOebpNqZIYtIcY79K/JtB9+2nhPL66kqeDB8M=;
 b=zN5BabmSE95SK0PN2eXHlIph3w/so+j9PISilIMBe0ywnDRjHypNgmWk1itZ0IS4n/1ooYJx9OrzasDTkohVMXYqsrzQFW7Z5lynNMiUi5qe869fHwacQsyqgzRkskD5twcT+NPUuv7ZuSsrOLybPzAjJGe0U4skd+s+mwMbeYU=
Received: from BN8PR15CA0045.namprd15.prod.outlook.com (2603:10b6:408:80::22)
 by DM6PR12MB4499.namprd12.prod.outlook.com (2603:10b6:5:2ab::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Tue, 12 Jul
 2022 14:59:29 +0000
Received: from BN8NAM11FT013.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:80:cafe::d1) by BN8PR15CA0045.outlook.office365.com
 (2603:10b6:408:80::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.21 via Frontend
 Transport; Tue, 12 Jul 2022 14:59:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT013.mail.protection.outlook.com (10.13.176.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5417.15 via Frontend Transport; Tue, 12 Jul 2022 14:59:29 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 12 Jul
 2022 09:59:27 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v1 00/15] platform/x86/amd/pmf: Introduce AMD PMF Driver
Date:   Tue, 12 Jul 2022 20:28:32 +0530
Message-ID: <20220712145847.3438544-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: de42d815-4582-4f8b-c908-08da64171f11
X-MS-TrafficTypeDiagnostic: DM6PR12MB4499:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2YMz3vXAp0qQQzrpurqmpMhEAZ7yir5dDV2LhfOxIVnTrj4Ml7i8mQs1LbemJQWLg9Lu8oDFMiPIJFBwZkx0pyf/jLQFZYQ0a4FF10sZQOpb9UOG02U0Fip6RxW3Ae1ZennnRZXyvLthy66zSucx6JuqcIRV8bKS2hQ4MC+EG7FehQOWBOlTfy46uIQllIB9yw5CY7c8ZepTGmhWCdgLlIDAfetYIIXMkqy10PsNtOd9esoEpzSBvfXnEZrB2tprV0C/A+z5aXlo09ZxLIOyxt9EMOqOgGY5PorUOMugHUnvpreUQPSHb0kjXYDf7lAIwLN9RuJ6vGFwjOJOwuLAdWbPqQRiNRux8hNlv+RlhdajV/jQ30yxcB3wA13+dsCRe2v/VuoF1fU7Um9eJZ/cmHF6NCVczsxDD3b6ig671mpfz0ShwOP5H+cAM1xu+evA7tIZmHu101RPRZ8VDnhfgeFuoeAVstsEre5qBaANf4a17y+DSY3BojaOQd1xXTHM7MhIEGcXV1CHiP3xOn/enUn6Hs0IMnhCZ5hQXOfF2yRUDAfQMUtdMCg8N7Kreho1LTqnKflxN/OD8BXe33Wb4CtuiV9zNrFY1NicYgiRFYHPEa1z3o7q5f+QmWf3rbc6RvCc5lbZverVGHfnquseWbPtdot59S7f4lxNG6e0PrC85WBrrLhOC2qRYiiLfXlujk+VJIESBA0MlgkKzWDxCT/AH47Ub3A2DAR3Kh8yp0qiCIomoeLerl00BnbMb9pT3aUH0htclZaMIVx2tF7zoLWeqdfcVr1BVL3XJaHNoxycjPBv3WVAgldcU9Wc/X7HOg0ODMKbJnExroFK5ohTSoLBPZirSCd1YCFeN2L/Pe4=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(136003)(346002)(376002)(46966006)(40470700004)(36840700001)(36756003)(36860700001)(26005)(82740400003)(81166007)(356005)(2616005)(83380400001)(86362001)(186003)(1076003)(426003)(40460700003)(336012)(8676002)(16526019)(47076005)(6666004)(54906003)(478600001)(7696005)(41300700001)(316002)(2906002)(110136005)(8936002)(4326008)(70206006)(40480700001)(82310400005)(70586007)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 14:59:29.4006
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de42d815-4582-4f8b-c908-08da64171f11
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT013.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4499
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

AMD PMF Driver (a.k.a Platform Management Framework) provides a
centralized framework based on sensor inputs, OS hints, platform state
and APU metrics to dynamically manage perf, power and system thermals.

The goal of the driver is to enhance end user experience by making AMD
PCs smarter, quieter, power efficient by adapting to user behavior and
environment.

The larger goals include:

- Enable easy customization of smart PC solutions by OEMs.
- Provide a framework for OEMs to add in custom algorithms and solutions
- Improve standby and dynamic platform power through active power
  management of platform devices.

In this series, support for following features has been added.
- "Static Power Slider" meant to manage the power budget based on the
  power modes or the slider position.
- "Auto Mode" tracks the moving power average of the APU and takes
  intelligent decisions to switch between different modes.
- "Cool n Quiet Framework (CnQF)" is an extension to the static slider,
  where the system power can be boosted or throttled independent
  of the selected slider position.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Mario Limonciello (1):
  ACPI: platform_profile: Add support for notification chains

Shyam Sundar S K (14):
  platform/x86/amd/pmf: Add support for PMF core layer
  platform/x86/amd/pmf: Add support for PMF APCI layer
  platform/x86/amd/pmf: Add support SPS PMF feature
  platform/x86/amd/pmf: Add debugfs information
  platform/x86/amd/pmf: Add heartbeat signal support
  platform/x86/amd/pmf: Add fan control support
  platform/x86/amd/pmf: Get performance metrics from PMFW
  platform/x86/amd/pmf: Add support for CnQF
  platform/x86/amd/pmf: Add sysfs to toggle CnQF
  Documentation/ABI/testing/sysfs-amd-pmf: Add ABI doc for AMD PMF
  platform/x86/amd/pmf: Add support for Auto mode feature
  platform/x86/amd/pmf: Handle AMT and CQL events for Auto mode
  platform/x86/amd/pmf: Force load driver on older supported platforms
  MAINTAINERS: Add AMD PMF driver entry

 Documentation/ABI/testing/sysfs-amd-pmf  |  11 +
 MAINTAINERS                              |   7 +
 drivers/acpi/platform_profile.c          |  26 ++
 drivers/platform/x86/amd/Kconfig         |   2 +
 drivers/platform/x86/amd/Makefile        |   1 +
 drivers/platform/x86/amd/pmf/Kconfig     |  16 +
 drivers/platform/x86/amd/pmf/Makefile    |   9 +
 drivers/platform/x86/amd/pmf/acpi.c      | 453 ++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/auto-mode.c | 339 +++++++++++++++++
 drivers/platform/x86/amd/pmf/cnqf.c      | 379 +++++++++++++++++++
 drivers/platform/x86/amd/pmf/core.c      | 431 +++++++++++++++++++++
 drivers/platform/x86/amd/pmf/pmf.h       | 457 +++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/sps.c       | 166 ++++++++
 include/linux/platform_profile.h         |   1 +
 14 files changed, 2298 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-amd-pmf
 create mode 100644 drivers/platform/x86/amd/pmf/Kconfig
 create mode 100644 drivers/platform/x86/amd/pmf/Makefile
 create mode 100644 drivers/platform/x86/amd/pmf/acpi.c
 create mode 100644 drivers/platform/x86/amd/pmf/auto-mode.c
 create mode 100644 drivers/platform/x86/amd/pmf/cnqf.c
 create mode 100644 drivers/platform/x86/amd/pmf/core.c
 create mode 100644 drivers/platform/x86/amd/pmf/pmf.h
 create mode 100644 drivers/platform/x86/amd/pmf/sps.c

-- 
2.25.1

