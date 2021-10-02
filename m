Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EEE4C433EF
	for <platform-driver-x86@archiver.kernel.org>; Sat,  2 Oct 2021 09:33:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5BDBB61353
	for <platform-driver-x86@archiver.kernel.org>; Sat,  2 Oct 2021 09:33:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232736AbhJBJep (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 2 Oct 2021 05:34:45 -0400
Received: from mail-bn8nam11on2071.outbound.protection.outlook.com ([40.107.236.71]:32736
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232691AbhJBJeo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 2 Oct 2021 05:34:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wgj1bsqhUifDDbWv8aJh3EQAFopnQBniT2Ak+yxbCA51Z5HsLHjc6Hf5mIVESX2a0R4y/BdbK97l6XCv0mwxgK1KzRSC0CbgGwNERINoSBpL6qarxYB0OZoMUvc7LUBlZnq3YK7DmbCuJQWuptQfr6Kg82bQ//xRT2E31O9Wquq9W4DfVlSjhFP5OCa9CnYoYx04wyPQwrB6jLM6v2BB9MrB5D3dxWBlolasArIzgb3QLn5bX8rorBuj6jjn+O1fv76aRmWukp7vNE/xAnb0aI8+85Dth92T1KK+pqs+JIeR7veF6pelRyaRBO3S8GJXw7tu3EdH7n9NheranFvUgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/0OctpFdKMNEdrVk/om5rtl+tQ97zq+lE/s/VoaG+r8=;
 b=nZN9ZJTwYKLhtqZ92+xYC7Tpo+X3bUgeoFoIzSIOuuifcowDF6wv5hxy/yiUThTFXCKm1zp/fI9XQaac5Cx72Uwtjyl50itq6qxsTTjhxoHM7sQvP1YbyxRI7eBDqrklQmUVl7ehdxZRh6a+uShdk6MwAsA2PXSLgMPdAwKSLlsQP4vs3or4eYTLCwnG0dRwEZ6KdIyq3DocDyZJaMpyuQNPH+YiUifWXPNDoGI0wWiATpJIuBvpKPDN3kTY5lynN/bSBv0YxsVWT4oG1mYmCvp/wKxA/dlXlW/Pql4XqAMI45SyiriWL57RAXLNbnbJwVAHjOh1cBdSOUR/BY+3Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/0OctpFdKMNEdrVk/om5rtl+tQ97zq+lE/s/VoaG+r8=;
 b=ZncEEv9eksSF4spTjkeekBjwQugmg6RRxwmV0UdlK70A2BcSUtO6wswh1jUgiuqb643MoWhad6meQzPxm8EvBCFJDVpE95zP47C0dCiWq2CkW30nOonWKBRom1yaB5UuonXBamp8bcHrGbeKtpz4ec4rIehfSCyHjGU71lmsOT5H5nzjy7IZpaUr4grEgPb9cDEGKLA0iY/PofwO57MojMkKS9HF7knW1BpQHJxbPOXLyeI0epT9EnnNAqmBsBJ3eTY68SUP3qU6wKf//Bq32I8KVOqJSYEQj2P3+u44NuekR1Vwy+rI4swo7cTvDM7vFUoliUxJcJn90a0kycTHAA==
Received: from MW4PR04CA0205.namprd04.prod.outlook.com (2603:10b6:303:86::30)
 by CY4PR12MB1909.namprd12.prod.outlook.com (2603:10b6:903:124::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.19; Sat, 2 Oct
 2021 09:32:57 +0000
Received: from CO1NAM11FT020.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:86:cafe::ff) by MW4PR04CA0205.outlook.office365.com
 (2603:10b6:303:86::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15 via Frontend
 Transport; Sat, 2 Oct 2021 09:32:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT020.mail.protection.outlook.com (10.13.174.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4566.14 via Frontend Transport; Sat, 2 Oct 2021 09:32:57 +0000
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.187.6) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1497.18; Sat, 2 Oct 2021 09:32:55 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>, <michaelsh@nvidia.com>,
        "Vadim Pasternak" <vadimp@nvidia.com>
Subject: [PATCH platform-next 00/10] platform: mellanox: Introduce initial chassis management support for modular Ethernet system
Date:   Sat, 2 Oct 2021 12:32:29 +0300
Message-ID: <20211002093238.3771419-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 781997f8-a4c0-42db-a0cb-08d985879e4c
X-MS-TrafficTypeDiagnostic: CY4PR12MB1909:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1909FE999426417954742DDBAFAC9@CY4PR12MB1909.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /PPuGURkw1wIgYU2FAklW0LqDFXSnWdQsUqiHLQMr4rI3mf4odqfZcg0QdHngnHM1hVt187lEJGuIxmdss7x31+eWaW3WhtLA8eitMAqPbkpMisyEnufIuT6km/JRoWlNESv2AYdEj1UJ+1h7/CQxx+rp6mqvuR7DrICLp1tAdF2EkAy6hgaZM2pu8y7l0d/BLvYI0Aobjl9M2QSR5uJhJS0BJ7jG20FxPMr0nDYLImM8jNkQbVatSbci6mYXKJVzs4HnexkzRPbyzXZR/HrqiF0r5/pjWBfUSq8uGe0nXJnxx2sDal0oSewIi847HALMzLeDqB5AYtGC12vTRjnU2CG+B4hbYxK0qxW2o2o/uuh5Sva3jUcDk5VuBmeL6GZ/dVg4pO+zP8F6YyQaZvvqdTNNG5hUrfAtnfGj38FGPRknPjHnOnHUvkL9UQAlqVdnx4MOAoU8ouE4zHpkG3L5D6ppVhpiAAY7n7engZAeYZBfFHm/3koB3zni5lM9+kAClwn81M0fofn+RcTbsz8XPxhkOrcmcn12lEA5gOT0y0VaCTXGAbZUzOvdqAGzh3fulFYbGlm26OHtOxt428jzm0qvQLYHvcy9Zx5QOSa48IKjQqhumRSqHuH1vWENBhmMKgOfGBJIeKTDs2YqWNNGngSKB9b+UaqylL+zscQoLH9ZG+MlXjmfBF1beQCqERkuOrllxoC1EckQ2WpamqDfA==
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(5660300002)(336012)(4326008)(54906003)(36860700001)(36756003)(316002)(1076003)(86362001)(2616005)(7636003)(356005)(2906002)(186003)(16526019)(508600001)(26005)(426003)(6916009)(82310400003)(47076005)(70586007)(70206006)(6666004)(83380400001)(8936002)(8676002)(107886003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2021 09:32:57.1404
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 781997f8-a4c0-42db-a0cb-08d985879e4c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT020.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1909
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add initial chassis management support for Nvidia modular Ethernet
switch systems MSN4800, providing a high performance switching solution
for Enterprise Data Centers (EDC) for building Ethernet based clusters,
High-Performance Computing (HPC) and embedded environments.

This system could be equipped with the different types of replaceable
line cards and management board. The first system flavor will support
the line card type MSN4800-C16 equipped with Lattice CPLD devices aimed
for system and ASIC control, one Nvidia FPGA for gearboxes (PHYs)
management, and four Nvidia gearboxes for the port control and with
16x100GbE QSFP28 ports and with various devices for electrical control.

The system is equipped with eight slots for line cards, four slots for
power supplies and six slots for fans. It could be configured as fully
populated or with even only one line card. The line cards are
hot-pluggable.
In the future when more line card flavors are to be available (for
example line cards with 8x200Gb Eth port, with 4x400 Eth ports, or with
some kind of smart cards for offloading purpose), any type of line card
could be inserted at any slot.

The system is based on Nvidia Spectrum-3 ASIC. The switch height is 4U
and it fits standard rack size.

The next coming card generations are supposed to support:
- Line cards with 8x200Gbe QSFP28 Ethernet ports.
- Line cards with 4x400Gbe QSFP-DD Ethernet ports.
- Smart cards equipped with Nvidia ARM CPU for offloading and for fast
  access to the storage (EBoF).
- Fabric cards for inter-connection.

Patch set contains:
Patch #1 – adds new types for modular system support.
Patch #2 - adds support for the modular system equipped with replicable
	   line cards.
Patches #3-#4 - extend logic for hotplug devices operations for the
		modular system support.
Patch #5 - extends number of hwmon attributes for mlxreg-io driver,
	   since modular system introduces more attributes.
Patch #6 - adds field for security access validation.
Patch #7 - introduces initial support for Mellanox line card devices.
Patches #8-#9 – add documentation.
Patch #10 - extend support for cooling devices.

Vadim Pasternak (10):
  platform_data/mlxreg: Add new type to support modular systems
  platform/x86: mlx-platform: Add initial support for new modular system
  platform/mellanox: mlxreg-hotplug: Extend logic for hotplug devices
    operations
  platform/x86: mlx-platform: Configure notifier callbacks for modular
    system
  platform/mellanox: mlxreg-io: Extend number of hwmon attributes
  platform_data/mlxreg: Add new field for secured access
  platform/mellanox: mlxreg-lc: Add initial support for Nvidia line card
    devices
  Documentation/ABI: Add new attributes for mlxreg-io sysfs interfaces
  Documentation/ABI: Add new line card attributes for mlxreg-io sysfs
    interfaces
  platform/x86: mlx-platform: Add support for multiply cooling devices

 .../ABI/stable/sysfs-driver-mlxreg-io         |  241 ++
 drivers/platform/mellanox/Kconfig             |   12 +
 drivers/platform/mellanox/Makefile            |    1 +
 drivers/platform/mellanox/mlxreg-hotplug.c    |  123 +-
 drivers/platform/mellanox/mlxreg-io.c         |    2 +-
 drivers/platform/mellanox/mlxreg-lc.c         |  906 +++++++
 drivers/platform/x86/mlx-platform.c           | 2279 +++++++++++++++--
 include/linux/platform_data/mlxreg.h          |   82 +
 8 files changed, 3351 insertions(+), 295 deletions(-)
 create mode 100644 drivers/platform/mellanox/mlxreg-lc.c

-- 
2.20.1

