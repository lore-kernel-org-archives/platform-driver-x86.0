Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56F90C43334
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Jul 2022 08:46:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229526AbiGKIq1 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Jul 2022 04:46:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229725AbiGKIq0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Jul 2022 04:46:26 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2042.outbound.protection.outlook.com [40.107.244.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CB0BE1
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Jul 2022 01:46:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UJ5B2o+3ev6Vcyil95b9YSoADhjM2pRGjzY+0oac6v34kIXDAIjMlGnA7hwzWlMtKHsIgukxzlfuN/9KR0u+puM/+bkHcNlUoQhlscxGxK5kIQRidC1X79szN0M+D1ptTnBfS5q7GajnlyXlyBr2DBO+cBZMCmiIBOolFmGwiS4NvTubN6x0GeLdX4x7npYLijuTpzPcwm1XkVc7mrcVHHSRTjLx7Ibh03c6NlaZLKE6Y5G71uFmyHh95ezae5tZbaQ3+0r2OcbdPeX1HKfHgGAiVSku7ufSIzdQ0bpSva9SatDWpip30t9S7jx+COtCrRdLqQMrQbhcMRRFUU6g8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J+UAglLSYOss4M9efvV/lfjgGo+aXuZ4/Tunbi7xfnw=;
 b=NQrrLYcbBtt8j7RdrJrkeHZ6hz5vcfQ+ElRrSDNj0K2Erk9mTaCadqjNTK2K4B9jCaNqyHVRdPSRsRY6EVh+JK8h1UmtD4zz2Ba/T7sZGOOI1ikEH7/H/MUCli0Ec97Vki/HU5QB27tKeVkpsO7uQvfnao6tCIWvj5+qo69bwzmeiIvlLzlCxekDUVWwWexCzTFH6YJF3RZdRaGPHPNSuIAWEBgNcVuPV1g0D7qJuAM9pSZxKsE5RJPF6I9HXlE3QhPh+sYF1Si89XyP7VHV+e9EsMrPCUgjToNMhUhCmTGPOFygZtALS48KcFOnjB4cOVA6r63H1ba3n0eofVEm2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J+UAglLSYOss4M9efvV/lfjgGo+aXuZ4/Tunbi7xfnw=;
 b=rqw1OZEkLOJXnzUDlNKpw4eLLpo198+GgAqgFArqZrAfl/AVuWSnp+KvPfbMNNz+w8hift047ws0ATwPxCtU8GGms4JgbLUBKAmSxnO7EAJbv5CxmIggDhZ/uJieKER0YCco9FCZy4vUE+vY2y/UbCjAMRAWfOPV0GO19WiNo5pt4wUBdAqFUSAmputdVTuugtdXFZSCwW2MS5XNrBY0TpvoU5DMobqIDPwSTkYsBp8nyGTn1mCCZsb19GMUXAMeg9W6DjA29LC0dHsceK74LKplqzpc5lAHqXClEhVsF04c1Jy6t3UbnQhNnUo+dfl02qKKBC2ZrjQK9eEstzM2bw==
Received: from MWHPR10CA0003.namprd10.prod.outlook.com (2603:10b6:301::13) by
 SN6PR12MB2831.namprd12.prod.outlook.com (2603:10b6:805:ec::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.16; Mon, 11 Jul 2022 08:46:20 +0000
Received: from CO1NAM11FT054.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:0:cafe::ac) by MWHPR10CA0003.outlook.office365.com
 (2603:10b6:301::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.17 via Frontend
 Transport; Mon, 11 Jul 2022 08:46:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.235) by
 CO1NAM11FT054.mail.protection.outlook.com (10.13.174.70) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5417.15 via Frontend Transport; Mon, 11 Jul 2022 08:46:20 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.32; Mon, 11 Jul
 2022 08:46:19 +0000
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.26; Mon, 11 Jul 2022 01:46:17 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next 0/9] platform/x86: mlx-platform: Extend to support new systems and additional user interfaces
Date:   Mon, 11 Jul 2022 11:45:50 +0300
Message-ID: <20220711084559.62447-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d49b8928-089d-45e1-cd89-08da6319d3ce
X-MS-TrafficTypeDiagnostic: SN6PR12MB2831:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RVjgMeKVX23MBltsp7RtwAol+5CIGhfOvPt7SYqBjFYHTApjHT2WLCWy+gHtrGAWEEj9vyCsqVywp6v4pII2Sf0VZyn55WComum6B0u7ztNU/oFl9Ov8iDNG4qY48ghsDn4ssmrMwutH6WRrSUMa/PfSWZ3OdX4ZRiat1eKl8Hg+p9dopmsFhEqQGzVsyzkB57y/liObTF3+caAY0+MbnNKZepjGRrBQ7/5j2ijgAEBNR1htZJtsTrrx8mV1aVu8P109dlHQcnsobxjB896xWDZTkfhXZ6hgpoxyWHbRVo7xBfkgQzoEJbfOpZoUb633LYfdezPqSqxQzynjHYtV07pVd1UcWCVnqA6+ESa+/KBYcnbfg9qSjQYeOOy+0oBWErZoW6yr8UMikE7DtK/Qekb0FxjyGlZ72TL77PEoexQOrYhVv5Mr7On2FTbVfIftSdDE3HHZgIr/MmBZlpMN9CU/871dg3B4mS6J//aHMNUfOrQesdRt1EM1zb/dgbBsvJpZaY2jGjVnC1z2mn/FomZnD26kgC2jtejnGqmI7IQhf4J/Ho+bLdGWcTIcw7BB8kUeGZ66gQgcZLaDOqSqY6P9vgaRTpeFxReRxaG5dLb5rl2O8YHszWR8PPA57Lv5Qzqny2W7z8hMq1vZJoH0ZctEPZmm+EWCsFvkapVsH/cEhmQTd5PWQhN8g6WIA7DuLLk3XURiqeuHRw9C5MJ2N1WHlkAiy1xj/plQKk9ZKWHH2AsHCTtTOj31J81NtyO4hiGl9kUo+3S0KZq4NusoEBABfIltk7roSEInP3gKODX8k+H0cI0VR37KQr0ixYXxMDwO+/+6tePgitwmzWv6jPsrU1wLrWOmxyaqqa6FnMI=
X-Forefront-Antispam-Report: CIP:12.22.5.235;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(136003)(346002)(376002)(40470700004)(46966006)(36840700001)(36756003)(83380400001)(107886003)(2616005)(336012)(82740400003)(4326008)(47076005)(186003)(1076003)(5660300002)(70586007)(356005)(16526019)(8936002)(70206006)(426003)(2906002)(8676002)(40480700001)(82310400005)(40460700003)(41300700001)(6916009)(6666004)(54906003)(26005)(36860700001)(86362001)(81166007)(478600001)(316002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2022 08:46:20.4130
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d49b8928-089d-45e1-cd89-08da6319d3ce
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.235];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT054.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2831
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The patch set adds:
- Support for new systems:
  - COMe NVSwitch management module for Vulcan chassis containing
    Nvidia's Hopper dGPU (GH100), NVswitch (LS10) based HGX
    baseboard.
  - XH3000 system, which is a water-cooling Ethernet switch blade
    equipped with 32x200G Ethernet ports.
- Support for systems equipped with two ASICc.
- Logic for selective activation of some drivers.
- Documentation fixes and introduction of new attributes.
- Locking protection for IO operations over register space.

The patch set contains:
Patch #1 - extends logic for selective activation of some drivers,
	   depending on system type.
Patch #2 - contains cosmetic changes.
Patch #3 - adds support for systems with two ASICs.
Patches #4-#5 - introduce new systems.
Patch #6 - adds new feature for system minor revision changes.
Patch #7 - adds locking for IO operations.
Patches #8-#9 - documentation changes.

Vadim Pasternak (9):
  platform/x86: mlx-platform: Make activation of some drivers
    conditional
  platform/x86: mlx-platform: Add cosmetic changes for alignment
  platform/x86: mlx-platform: Add support for systems equipped with two
    ASICs
  platform/x86: mlx-platform: Introduce support for COMe NVSwitch
    management module for Vulcan chassis
  platform/x86: mlx-platform: Add support for new system XH3000
  platform/x86: mlx-platform: Add COME board revision register
  platform/mellanox: mlxreg-io: Add locking for io operations
  Documentation/ABI: mlxreg-io: Fix contact info
  Documentation/ABI: Add new attributes for mlxreg-io sysfs interfaces

 .../ABI/stable/sysfs-driver-mlxreg-io         |  81 ++-
 drivers/platform/mellanox/mlxreg-io.c         |  23 +
 drivers/platform/x86/mlx-platform.c           | 491 ++++++++++++++++--
 3 files changed, 526 insertions(+), 69 deletions(-)

-- 
2.20.1

