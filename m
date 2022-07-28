Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C48BC04A68
	for <platform-driver-x86@archiver.kernel.org>; Thu, 28 Jul 2022 17:42:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232135AbiG1Rmp (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 28 Jul 2022 13:42:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232746AbiG1Rmo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 28 Jul 2022 13:42:44 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2043.outbound.protection.outlook.com [40.107.244.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47FB974CC0
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Jul 2022 10:42:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cYPSK9NmsOGA8dnFyfeJGBztU4HWjOLP109zDSDW7xIunhD8IwxQCZ1oj6jubAvz11YATdUVSLGaK8B9GypRMS1jsIKS1vRaUFhFcy8BI3OjI7iE0EuzeVq6tShVQtVtqtbHX/ea0zcQ6Y6JAd/W+VHUo2jav2na7Pf2DtjTp0eDcPqYjkS7dshKtd/mvW/NgdO+HMMLKBZEBR0QuEHobUomu4/OefnovIE4WjOoPHb1nRcjEc2qEC6AIjKbeCl9nn8MmjWOEJLM3ea7D8xjIhiesJF+aHisxIDKsNQBs6WUUi4ytdapMWIGDRMPkC1lXvjbW32cQVcIV8s3Jlddcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fnuqpGuUR/hWU5VjCI5FCo3dziCFhBA1lf6vzrbmKoM=;
 b=XaWMWUlmW7dZX+4J5OZL70W3RXjMBsEDm+c9rsbzTsapvUJbnZCoGA7bnQVhJHjczsXyioLvom7fh3yQh/5KgKRcuGd5/2Uw39qExLn0dTuRud+lVqUAZhncLM7NCfGqdhZVySuxQ8RYstDw9sSldhVkgmGunMGi/wPmrexjSGqW0chwjQQuLXV+/PpE+9JrPC1z13nqfNZbhGKSgpaIz5EX4sQvAPsSn+TPQeFgxPdlqArj0MXa4rHEVrs4g/Bdzx0iwWJYE9vBm2XCdhHp8lJSSe+2OBIpb9y6Cbr3fpsVpi+NE0tF5T14wO9lh6WBb+HGLxL2UiforLbrc5VX3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fnuqpGuUR/hWU5VjCI5FCo3dziCFhBA1lf6vzrbmKoM=;
 b=d+QotMNWHeDNEUPMnVvOLDQYuAgI9OsPOFFeUh4WB3n4E0UNmzeuAOCBAGiUSyOQ1aeBhU/nNBXX4PKtX1yixe+vCHfEaTR4U/bKjdE2hcZeEdeGXo1B/xSRO6BH23cuhz8z2vv7FKGm/GdpTpjqLNy7Pi08yabUZXR1xyYvP7c=
Received: from MW4P221CA0025.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::30)
 by PH7PR12MB5928.namprd12.prod.outlook.com (2603:10b6:510:1db::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.23; Thu, 28 Jul
 2022 17:42:41 +0000
Received: from CO1NAM11FT049.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8b:cafe::df) by MW4P221CA0025.outlook.office365.com
 (2603:10b6:303:8b::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19 via Frontend
 Transport; Thu, 28 Jul 2022 17:42:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT049.mail.protection.outlook.com (10.13.175.50) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5482.10 via Frontend Transport; Thu, 28 Jul 2022 17:42:40 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 28 Jul
 2022 12:42:37 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 00/11] platform/x86/amd/pmf: Introduce AMD PMF Driver
Date:   Thu, 28 Jul 2022 23:11:57 +0530
Message-ID: <20220728174208.2081453-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b4e46588-9c64-428c-2f9b-08da70c0917f
X-MS-TrafficTypeDiagnostic: PH7PR12MB5928:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WP6Yv+EGHtSOVprNmojNnwD6x/dV3I+vMIaJMl0KHLFgrpEjmwAc02Yw94P18JP+CwYF9Qh2/pU8fNoy8JtVKZMdno170GK0uf/l9C3ruj6wSF5GUFQBgY6uUfYHGoG5LUc75hDgVOZsgrt6Sa1l133ZFTuzRwsfCGpxhWMo7151/lslvy8wd4l6db8QdxajPFpR04YhkqNEbnaIQnTJvZI87p00qsx+p6aaNnzGRmiAXPP53G/WbOQNz1w2Ap9oE7u/4K1jie8pYEoAkznbEvjcdPlrfqHtXH8I70rfVGVwXUuT/UtUWgtg00MWDSgWOvlQO1iKd0f2ob0MG2D6j0uMJbYsk2GmGxer0ey1B8JW5UZXt8acA5uC7EoSRYPnNRwHF8fHRoJRLTwG360w0SxLTT6nIVs/Hx6jotb/VYymbeD0bDRmYWdeLLDOF9eig604Tg81aO9BzmQILwrqSApdgtPDNIBWCUm8JP68c/9hFcI1QiMQsD4+LoXv/Bt1SO/HBj4Ehnab/OIinIuFFiFJjumJfj79CEZaMF+SeYcrCCKZYFk7Xouic0Q28L6f+m7SUc1CRTeUh1Zr4sRsBRBWix/57Y7Caa+BS0L9yo1cg7ntm4YvGnfORGc3mm1RshNpWH/1bYt/nEIHgKa3lNpJxwkUr4hSOe72C6B2+mXs++uFrpiMSoRXByXGBcxXSTsL7BpyQi6LtJPC3687A3xDcSa8+YkbcM8HDPjmTfwWD928KRT5MtekEzk8qa+YV7QIkR583BjMhvyhuIXtHTNnM7Qzb8e9ksjgJM3bkF1FzI91MkkXHhOHZOHTKpyLeNEh6UAueOVUZcf8UT2Nkg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(39860400002)(396003)(346002)(40470700004)(36840700001)(46966006)(47076005)(82740400003)(356005)(16526019)(426003)(8936002)(36756003)(26005)(6666004)(7696005)(186003)(1076003)(2616005)(36860700001)(336012)(86362001)(316002)(110136005)(82310400005)(41300700001)(54906003)(8676002)(40480700001)(70586007)(5660300002)(70206006)(81166007)(40460700003)(478600001)(2906002)(4326008)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 17:42:40.1534
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4e46588-9c64-428c-2f9b-08da70c0917f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT049.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5928
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

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

v1->v2:
-------
- optimize the ACPI path by having a common routine
  apmf_if_call_store_buffer()
- Simply Static slider interaction with platform_profile
- Remove CONFIG_DEBUG_FS stub code
- Drop changes introduced in platform_profile_get()
- Drop CnQF support. Will be sent as a patch-set later.
- Other code improvements

Shyam Sundar S K (11):
  platform/x86/amd/pmf: Add support for PMF core layer
  platform/x86/amd/pmf: Add support for PMF APCI layer
  platform/x86/amd/pmf: Add support SPS PMF feature
  platform/x86/amd/pmf: Add debugfs information
  platform/x86/amd/pmf: Add heartbeat signal support
  platform/x86/amd/pmf: Add fan control support
  platform/x86/amd/pmf: Get performance metrics from PMFW
  platform/x86/amd/pmf: Add support for Auto mode feature
  platform/x86/amd/pmf: Handle AMT and CQL events for Auto mode
  platform/x86/amd/pmf: Force load driver on older supported platforms
  MAINTAINERS: Add AMD PMF driver entry

 MAINTAINERS                              |   7 +
 drivers/platform/x86/amd/Kconfig         |   2 +
 drivers/platform/x86/amd/Makefile        |   1 +
 drivers/platform/x86/amd/pmf/Kconfig     |  16 +
 drivers/platform/x86/amd/pmf/Makefile    |   9 +
 drivers/platform/x86/amd/pmf/acpi.c      | 320 ++++++++++++++++++
 drivers/platform/x86/amd/pmf/auto-mode.c | 339 +++++++++++++++++++
 drivers/platform/x86/amd/pmf/core.c      | 412 +++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/pmf.h       | 346 +++++++++++++++++++
 drivers/platform/x86/amd/pmf/sps.c       | 152 +++++++++
 10 files changed, 1604 insertions(+)
 create mode 100644 drivers/platform/x86/amd/pmf/Kconfig
 create mode 100644 drivers/platform/x86/amd/pmf/Makefile
 create mode 100644 drivers/platform/x86/amd/pmf/acpi.c
 create mode 100644 drivers/platform/x86/amd/pmf/auto-mode.c
 create mode 100644 drivers/platform/x86/amd/pmf/core.c
 create mode 100644 drivers/platform/x86/amd/pmf/pmf.h
 create mode 100644 drivers/platform/x86/amd/pmf/sps.c

-- 
2.25.1

