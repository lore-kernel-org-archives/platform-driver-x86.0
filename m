Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E14A2C00140
	for <platform-driver-x86@archiver.kernel.org>; Tue,  2 Aug 2022 11:27:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231860AbiHBL1j (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 2 Aug 2022 07:27:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236899AbiHBL1h (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 2 Aug 2022 07:27:37 -0400
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2052.outbound.protection.outlook.com [40.107.95.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9780B2AE29
        for <platform-driver-x86@vger.kernel.org>; Tue,  2 Aug 2022 04:27:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KTXrX2ESbIzYrYsIBoLnushWREhYXAkq1Tf0qagDzEDcyukMkVSxxDEcFRk4ZV0biJ7CUW748j8iCA994LOOYqRnX2jO4WW9PIqobbi4CpG6K5j7j7OdUftwW9Jt3XRDcwlkkVV8M1GAR84MISPdAriqLdoA3f7gr6m+fkJl0jhIxKkLRT73Xnpe2fuaL4oYf8gl6MO1FAR9/RlNdDmjgw3Q2TLOlW3o3Bs4dqltoYFUACaMfXNUrS2ZkMf2nuWn4tskV7cRgtllUGciHVI8DhM1YHZAyhJU8rAlzXqDiMqDA7syrU4e+K0eprjiDojYetSAnJ+fNrpkJOmv+akbFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OElxEeig2gwQj3Us2Wl0Psd1v3xr6ovKZHSL4sS1vbc=;
 b=Wu1UfGYEVVkldgLbg+2tsysrR3dWH5OQ5ybKjzck7kJams05KZzNq9lH3GzHbpkwvh0JkrW0npWuiGRLvpF5kvqcwkXTlh5eokqY5wsCWT0lxUwxDFXnSA229HGXakrThE0q6XaS9BXrSVqnd2BUwn3uNck2VEjk4xft639UMqLrbLF9VzU4AStxjqI/ovcKZZUc7wR9ATesyc90mhhZ5v8E+W+xmJibEQ3D4JiSBI0KbiV4HayNkULgsTQOQJGu9XP/wOUTeDb+vG6pNqUyIsJsDuwEaFiFmMrI3Y15gAhlojMV3chOZJWYXcPAT1MClG2RGGTh0e0i2RXJsso3yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OElxEeig2gwQj3Us2Wl0Psd1v3xr6ovKZHSL4sS1vbc=;
 b=PGRix6tXbGaGmDM+aixSgfXqGsoE7vo1xRBW7pXr2YnSh6DUr5TWi4kUaZdikolLZiTXGPpEUUF5yiJCO+gsaKl2Y/mC9WQfFoniPmex5TpVFtso2NzcIE9E+Xvt2+Uz05B7NLuyYiWB1vh16ywzoiVcvezj0Nyi/WKow2PgNtY=
Received: from MW4PR03CA0203.namprd03.prod.outlook.com (2603:10b6:303:b8::28)
 by PH7PR12MB6442.namprd12.prod.outlook.com (2603:10b6:510:1fa::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.16; Tue, 2 Aug
 2022 11:27:31 +0000
Received: from CO1NAM11FT007.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b8:cafe::e2) by MW4PR03CA0203.outlook.office365.com
 (2603:10b6:303:b8::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.15 via Frontend
 Transport; Tue, 2 Aug 2022 11:27:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT007.mail.protection.outlook.com (10.13.174.131) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5482.10 via Frontend Transport; Tue, 2 Aug 2022 11:27:28 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 2 Aug
 2022 06:27:15 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 00/11] platform/x86/amd/pmf: Introduce AMD PMF Driver
Date:   Tue, 2 Aug 2022 16:55:34 +0530
Message-ID: <20220802112545.2118632-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 07939d55-239b-45ee-0fcc-08da7479fd0f
X-MS-TrafficTypeDiagnostic: PH7PR12MB6442:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hzLCVQJd9D4OH2FKotacJBidbeTClEucbFUu8oSjFwDSuKZBNQ1IUXGGbEzTcuTyu4Ogjv6mHsY5qISvdp6MnO1ouE5+z58ineb7PR3LsgLBBaDg3x1ff1w12CkYTSGeepZ6pI97P2kX9XLeJ7HO7yYNb7Lb0IzChO318rAnWS4eJREtEBvImGr1f60n7qeMq6xgxHT77wBFRXflUutx7c1wvtL/2hD3ymlltA0w+6nxwyPxXHNtj5T+QUzrlJPedM15gm8q7QrXtm90KIWIvABvTDlN5zzVtVO2WjNf+wkVic3in9UptK7CZdSXKAu3WJPCfbkNd8sDCoLWdpjPo/xHTt+p/nOUqZAyT7WOpu/BHkZV+jRljeQQ7+MRk0eIaE5l3RLJ0eiCkoB+mwpDgha+8CgdcuQzyTzNR+1umesbKFjfEFWs2PgKTtJz8xcm3iRvhaXu2ooJ0muzIvdybUmJq7USFaHI0eyYzYYWVoEmebbk8HtXev7qbk/y73y6HkabDOYWSh5gSvi3TS4XNFBH44VTdIHvFf36RoAJRt5zabHHd6/5RvdrvTKz9XkBiHeOt5VwYCp4Espmmb9IYiUzNcvf4T63WYyP9vx8WAfgUqt/S5V5YDXXlYQ/qedL50KYtqCbCKSPFin2DNC2iL4GIq0oFAwbpFSy4NOWMeYYr9t8p9GDgMOj97Bnv7D61sFy2dkp5VD2RdaYgg1ncxhAHRwd0pGQv2mI/PS+a5KTJZMYUhvDK4QwcmV5jG1ME6tNmd5jOoZAZFWtSeI+OBjZYLBP6lKtsVCQ/tYooQxbMSNjM2cAizKxu6IlOLDQQTE3yHH4zLmIigxwg1fGBg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(346002)(136003)(376002)(46966006)(36840700001)(40470700004)(36860700001)(6666004)(316002)(2906002)(41300700001)(40480700001)(8936002)(86362001)(70206006)(70586007)(478600001)(4326008)(8676002)(5660300002)(40460700003)(82310400005)(356005)(82740400003)(81166007)(47076005)(426003)(2616005)(1076003)(7696005)(36756003)(16526019)(336012)(186003)(26005)(54906003)(110136005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2022 11:27:28.6523
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07939d55-239b-45ee-0fcc-08da7479fd0f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT007.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6442
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
 drivers/platform/x86/amd/pmf/Kconfig     |  16 +
 drivers/platform/x86/amd/pmf/Makefile    |   9 +
 drivers/platform/x86/amd/pmf/acpi.c      | 290 +++++++++++++++++
 drivers/platform/x86/amd/pmf/auto-mode.c | 301 ++++++++++++++++++
 drivers/platform/x86/amd/pmf/core.c      | 385 +++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/pmf.h       | 333 ++++++++++++++++++++
 drivers/platform/x86/amd/pmf/sps.c       | 149 +++++++++
 10 files changed, 1493 insertions(+)
 create mode 100644 drivers/platform/x86/amd/pmf/Kconfig
 create mode 100644 drivers/platform/x86/amd/pmf/Makefile
 create mode 100644 drivers/platform/x86/amd/pmf/acpi.c
 create mode 100644 drivers/platform/x86/amd/pmf/auto-mode.c
 create mode 100644 drivers/platform/x86/amd/pmf/core.c
 create mode 100644 drivers/platform/x86/amd/pmf/pmf.h
 create mode 100644 drivers/platform/x86/amd/pmf/sps.c

-- 
2.25.1

