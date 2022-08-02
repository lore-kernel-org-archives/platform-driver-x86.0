Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1DDBC00140
	for <platform-driver-x86@archiver.kernel.org>; Tue,  2 Aug 2022 15:13:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230214AbiHBPNf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 2 Aug 2022 11:13:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbiHBPNe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 2 Aug 2022 11:13:34 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2057.outbound.protection.outlook.com [40.107.92.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E73ED167CA
        for <platform-driver-x86@vger.kernel.org>; Tue,  2 Aug 2022 08:13:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KiUJL2FChkTqjNrRC1IqqzWo/CO5n23YjWQMlII/vgWrGGitYDdjccp6m0pCFM/DU6qOjZ2IlLrN/X7TXPK0DYozdgDFHSUt/kR4s6jsJq9UGSuKqip7tXXg1UxWfNqQrROwMOHqd7YAnbunqi1OhqiVjEBgldOpcbMNKoafPWwvlnwLZwjSzIG6IZu1wFyuJmG88iSSUGbgAEdFUftRg7/VUIX3lQmJtXIS8Z+10/YUTKbWaB8iGS2c2qaSYClN1LV4ZuvFSOhuKzuuRntoUMHO+6GXL4Ma1aIYVblZKk5eOS6E3srtoUGKYKT51X17VFGVAEUkSueAzPIUVXiRzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OliFTEcvDgS/0PwGyShxiGreaUC8hLgQcBGoRvdPiuw=;
 b=YjuQ5Z4e0N9SaULdRazteLr73GPzHkSGYGHOBBw8mK1H6dzFLodMVR4netYo+sv59DZDSX1l5bgJbiwRMRWCghmyPRP4V7k0hAfKjkyHKoan4vCa7uz4U1dQU4NWmH3KLyailQqbeZHcPjNIPI7zT6fWBptZt52Lnbr6mvsilrFyv1jN1FDl4uzJ+FEY2Gf14AooQjR72fUGaca0VNriNoMWqUmV/VTjWPgLom1F7L7VihF7N2FhZUqN4H7cPUoU4R2ZDsOpxGSYsQ9AJdJ0dhnWYpB2xiG5WiL1RCuYAbkrhgdY51BPn3/jo08t6gcQRLHG4PsdcQWxhhkIAIeytQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OliFTEcvDgS/0PwGyShxiGreaUC8hLgQcBGoRvdPiuw=;
 b=mVZjg6B08HcUZgV/zI/tvclxHDrMaVfap4R4MRWI1YYxTGqCLQFdCXQuQhePPJ6ZoH6D+9vkyV/GG4fhmmBpBFh2BXr8l0nup8Dhvvn+jXFh+VHQ07qSUY+LVoDJqzwP4g1jH8xJDM86cPxlNuPN67THpHLTkeaGcIsQFK6qIRE=
Received: from BN0PR04CA0166.namprd04.prod.outlook.com (2603:10b6:408:eb::21)
 by BL1PR12MB5174.namprd12.prod.outlook.com (2603:10b6:208:31c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.12; Tue, 2 Aug
 2022 15:13:30 +0000
Received: from BN8NAM11FT066.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:eb:cafe::7f) by BN0PR04CA0166.outlook.office365.com
 (2603:10b6:408:eb::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.12 via Frontend
 Transport; Tue, 2 Aug 2022 15:13:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT066.mail.protection.outlook.com (10.13.177.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5482.10 via Frontend Transport; Tue, 2 Aug 2022 15:13:30 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 2 Aug
 2022 10:12:54 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v4 00/11] platform/x86/amd/pmf: Introduce AMD PMF Driver
Date:   Tue, 2 Aug 2022 20:41:38 +0530
Message-ID: <20220802151149.2123699-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a7d506be-793c-45ab-7093-08da74998ef0
X-MS-TrafficTypeDiagnostic: BL1PR12MB5174:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 694/lqfz0EY8ivcZFwropFGGsQJcY4s2irhyLZPwDSHFc3A9A8nsHm9QV8GtgD8p4MxsCtoE8ip7rQmpMzTY0/hKAbVTcXeoryoaWxEPYa85J56Sr2wQ0mD3zwT74bocDogs9u5gyJCOHsPKAiIw0eqYVB/iyqo3olfKBgvJL3Czde+iYrbu38DtCMNoWfuGLBL94wHNyU1IzMGWeINVFjXc923oBG+Ry4e6wUq/Gj0X2bOn5yTEGCxvqyDscmE8pKD1ZMO7D9SgKzHzLiAhCF8uwr9M269ueT7/m3xPCrrSl3L2FM5NgAeNFvzEgZxDYLQt1axI2xvK/OvBvBWIuOmRQXSsGoxUUecHgSWCFPk8At5w1PP9h+Np+6qWtpC/N+Nxgl8Bp6CDzwTHw5akHq4AKbOkAH/WhFahlQ/MS1rLGeY0z2usRL/Vls4c0AyUWHcO/MTjF6yFeJaLlx1yYDjwCKEajKRBj9QLaul6rVVr/5bWLZn75Z7BnyYbMFQ1BZpQiUL4KoGaFiRfMre8tMeOZJR5noF+4u41Rj5uzX979pRulUnn7EUTI/sCCBZz/PQOq/XJz6GnwbyIJ11CdpX8zeDrdLq7/DpZQPBy9vDRcRfKLKxnfO5okWdUK3TzQKvtln5kxp34Lw1BtXX8dL0gPrgGv6kfeWzRA7Z9W5ydJpGsTXW0FKDS4vZNivY5lhyD4ZViJA1DgA+9QkJHNoussDkCBka8Eot2lH/phTD6fiqp4K2D2uCX0ESwjg1t8cFEH/NB3FJLZwcA9cB3af6JLwv4pCAAd2JSavCSMZ6f/vxz9mqOJoohu6RYJpLcVGZhbA18SRnM32jUJBZaaQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(396003)(136003)(39860400002)(46966006)(40470700004)(36840700001)(82740400003)(40460700003)(86362001)(5660300002)(316002)(70206006)(70586007)(8676002)(4326008)(356005)(8936002)(81166007)(110136005)(54906003)(40480700001)(26005)(36860700001)(336012)(426003)(47076005)(2616005)(36756003)(16526019)(186003)(1076003)(478600001)(82310400005)(6666004)(2906002)(7696005)(41300700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2022 15:13:30.2661
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7d506be-793c-45ab-7093-08da74998ef0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT066.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5174
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

v4:
-----------
- Remove duplicate variables in auto_mode_mode_config() structure
- call apmf_event_handler() handler manually so that we don't miss out
  any notifies
- Misc. error handling.

v3:
-----------
- Cleanup ACPI code path
- Optimize metrics table collection mechanism
- Avoid races between the acpi handler and the metrics table worker
  thread.
- Remove redundant structures and functions.
- Improve the code handling the apmf handler routine.

v2 Resend:
-----------
- Patches from 9 to 11 were not sent due to wrong email address. Hence
  resending.

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
 drivers/platform/x86/amd/pmf/Kconfig     |  15 +
 drivers/platform/x86/amd/pmf/Makefile    |   9 +
 drivers/platform/x86/amd/pmf/acpi.c      | 287 +++++++++++++++++
 drivers/platform/x86/amd/pmf/auto-mode.c | 301 ++++++++++++++++++
 drivers/platform/x86/amd/pmf/core.c      | 385 +++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/pmf.h       | 329 +++++++++++++++++++
 drivers/platform/x86/amd/pmf/sps.c       | 149 +++++++++
 10 files changed, 1485 insertions(+)
 create mode 100644 drivers/platform/x86/amd/pmf/Kconfig
 create mode 100644 drivers/platform/x86/amd/pmf/Makefile
 create mode 100644 drivers/platform/x86/amd/pmf/acpi.c
 create mode 100644 drivers/platform/x86/amd/pmf/auto-mode.c
 create mode 100644 drivers/platform/x86/amd/pmf/core.c
 create mode 100644 drivers/platform/x86/amd/pmf/pmf.h
 create mode 100644 drivers/platform/x86/amd/pmf/sps.c

-- 
2.25.1

