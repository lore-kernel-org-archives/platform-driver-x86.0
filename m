Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D7FCC04A68
	for <platform-driver-x86@archiver.kernel.org>; Thu, 28 Jul 2022 18:20:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230357AbiG1SU5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 28 Jul 2022 14:20:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229894AbiG1SU4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 28 Jul 2022 14:20:56 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2063.outbound.protection.outlook.com [40.107.220.63])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CC971C10C
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Jul 2022 11:20:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KQh/eDwxR5x51WoG20gcPTM89Bp9HpOvkGahap5dqyd0yniEcRLlvQfSonJ2oCADlVKJaJbz/w0xoD6gl0jRwU3G+LXiS13X9hwFf6COY3yAjTsN1gClw41fw/Kb6Unlmtm9cOmPzepMImo9kPrZtd/qH03jyXAO1JFRKwGEybgSeFcJ0IQgjQ8F03fqvCeU/KLhsBjZiYEUksnRJ9xdMBxJRvrNM8c6p5Bo2efGLAp04YUH91ee4WXfcic1I575TiB7mfW8q42kCRqQoz3Oy9U3AJK5M1k4o5YJrWnp8eZBEFnOB3Pkab02hl0utMyXmKIh/WHIhLwFei5Jh8FrBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SOkeIE2L3sQ+3p2gDubXdxApyo5VH2uhyKW0lYgWk10=;
 b=bRGHzVwbi0JTw97K2gh0I5SDVhdau1t/MwIeMzwAmgu/PWA82GrL2Ikt+ugwxL7t+fEL88DnLFIAFUUURrhtjOpaRwSYssueRfobnsUyPtR2/nY1uVmo6nG/uBgxT9jOwl3LrVQYrLfIpz7AuvGWvxZzCOZo9eUo9Flh5+mIOt6ZpoyGaGT+WOUSYntOGbhN2wlXZGPNP0eykcLxP3Ma33dUKiF2lLB1YXIZDtw+dMFtJCD17TS1EW4G/ZallzCRpqn9TQyyjLTEfleDQ7kXB+jV6Q0jvxv/hdRQ+IldH51JVqwfM2Gil7+3GFkydZJfuQZ6VOJLyzbFOYxDyfhrBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SOkeIE2L3sQ+3p2gDubXdxApyo5VH2uhyKW0lYgWk10=;
 b=No/WyKOuuHmHzaDxUBJyEFNnzInjOfZ4Um7jfnogt8TDLjlGOS+0EXV+a9/B/Mqfl7eu4Wqv6cKoKXJLTu1cpU26aoSKkXSOnszkJUJxr8RPkr7GTD2TjlxlsqEzYoi3xzCz0ZeynrGCn4uAJdtu7gKOcYsfsfdtSHAo2mYALyQ=
Received: from BN9PR03CA0584.namprd03.prod.outlook.com (2603:10b6:408:10d::19)
 by CH2PR12MB4247.namprd12.prod.outlook.com (2603:10b6:610:7c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Thu, 28 Jul
 2022 18:20:53 +0000
Received: from BN8NAM11FT062.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10d:cafe::17) by BN9PR03CA0584.outlook.office365.com
 (2603:10b6:408:10d::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.20 via Frontend
 Transport; Thu, 28 Jul 2022 18:20:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT062.mail.protection.outlook.com (10.13.177.34) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5482.10 via Frontend Transport; Thu, 28 Jul 2022 18:20:53 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 28 Jul
 2022 13:20:51 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 RESEND 00/11] platform/x86/amd/pmf: Introduce AMD PMF Driver
Date:   Thu, 28 Jul 2022 23:50:17 +0530
Message-ID: <20220728182028.2082096-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a98dfd3a-8a1e-43e1-43b6-08da70c5e847
X-MS-TrafficTypeDiagnostic: CH2PR12MB4247:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0NugN4fj4DT7gr8w9urZEluMQWdgEhx5+dkaw2nu6nNv1jaQFgPnvGict5cS1coENZcXZsHL/OibwweUJ4oB5OxRlTvNF2f7nJdXr79S77ZKTcg0qRn1xEK9Pn2GfgZiHvuqBsmWVwfxn3v2L8FrqWi+XHIMWMhakvH5SqWIHtyj6VIC2gGSE/1vw6VZWqjKjxuKRdQ5Jjvn94xn0gEJqx9iXqwJM6eGYiAchjyrEW5Vqxe1/YLLnvIas8k9phgUt7jdr7M/SZwVqAKKLOygKOtjPUTcbWs7ks3Wli/jJn/9nIFkNStjHIfXpjM3qKscAcC+b1O6UX79PtuL80yzBWc676gHYevlAHuHWi5DPlpJM5XEznmVxhbVzORWX5Dp4WlJrmYpRky8tP8n5E9p3HidqSI7hWykfstbwy/pmfPVyIXgtq31hNkqcyrhx/psJqiCnKPn/jSNNMPdhAhR7MFEdHET+xVJx+QGMF3XTGxXUp61ee1edF5jOsL9urtAj+Wb3OT9iApek8DLYOHfoyh/mZj8VH9aMei2na4ASVXtSIeJB9V9pcik1AXP9kBX3nRDKmiPAhhGDsyYgT3mpB+9u56YSxtL2hlcCW8xqMHmCyM3ppuzo9Q1l0Vp85n5K+khaJzryG4ueuuN48ser9bMKxttOEHEKdhF2lt9/dwWan43j/lBrDCrY73woPRfEeLwLWOibIdbNP1sUSuoT0+szfBXw3+/1SGbcRIcGIKK5z4CqPCxbJg2ppmvbzPX4O90RCqAOwRGGPo+R6uT/Sg96fWjcpIv0Zjnbc69B0GQMWJ/daNZizGpFuleY+QNmBrBoKbKpQGpNP2Ieypi0Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(346002)(39860400002)(136003)(40470700004)(36840700001)(46966006)(40460700003)(70586007)(186003)(110136005)(478600001)(4326008)(86362001)(8676002)(426003)(316002)(36756003)(356005)(70206006)(82740400003)(8936002)(81166007)(54906003)(36860700001)(2616005)(16526019)(5660300002)(336012)(82310400005)(1076003)(41300700001)(40480700001)(47076005)(6666004)(26005)(7696005)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 18:20:53.3418
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a98dfd3a-8a1e-43e1-43b6-08da70c5e847
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT062.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4247
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

