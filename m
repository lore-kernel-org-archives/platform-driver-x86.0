Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B69C9C433EF
	for <platform-driver-x86@archiver.kernel.org>; Sat, 30 Apr 2022 11:58:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235226AbiD3MBj (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 30 Apr 2022 08:01:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230444AbiD3MBi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 30 Apr 2022 08:01:38 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2051.outbound.protection.outlook.com [40.107.93.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9261C888C2
        for <platform-driver-x86@vger.kernel.org>; Sat, 30 Apr 2022 04:58:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JCUCInvHDTdkt5HkrY1co0Da6p9RLJWn91AsLjqioPggaU/sr+TSoAPp6ydAQLwY/Tcg7HMcuAwC4JwJ0K4kRVBN0vs2L3Xr880e8XEQ3QQ0B+X7drJldh9QcM9SkPqjLo1qKMRceBj8R7VlNo0dRN43zlX+b8J3Srj7o4JHunQ8vZZJNcw50BJldnsoKi2g4AC5+OplIt2dbxi7vFK91Drb6p4rmRHbeJJObez52O46dDRWiK0Q4l622wWqUP1Z8hdzQb+WctQV/ecRu06qesdFUFu88izqFBdXlkX7qHaaf+bbVtslkhkSiBWVXw7T3h1B139RKviylsn/Re7hAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0e2gYGix02a4KFqzjDT4iOKE2oABIGTNIstabBf2dxQ=;
 b=Nx8cIjVAcq+qcvcLWM33n+/cJzx0KTwJpQ4u0us1Jt4qxBLQ1fa9us+q/sFQSHQJILETYTgdw+3HHZe+jGICXd4iyDzEoVboAzHJ7XE0bwNjbr4DeYy+/T0yYd3ABhyOf0hVvFYE2Kklk9aWZK8zOSY4KtF81AE6XxdLdwE1nT+MyIzb5yMWx9Xqk0+HMOdMm4E399T/QMaSLHcVVOLVc3wLzb4vrr1ghkxWiJS9RAlznBcPfcJjT0t8QHyPP6ZorRjuLn2pxqlGzO5VpoP4HVteOPtISTarGZsp/bs2L36E0G5Oao8RWVKORoxfPQywaEKQ+bQ40Pj0V0M+P3P5Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0e2gYGix02a4KFqzjDT4iOKE2oABIGTNIstabBf2dxQ=;
 b=ob1Oy1x913Z9wOJhUgyJsblunbPdBZ5wz8xO4W2ITJpizKfJ8C74N9wKjF/zCtL60v5iUkgdQ79QJ9g3J549IV+2dnJb/yia5sneezM0Oe/7TACI1aNQ38T4wq8liXQnt1tWyPsL1xtscVX4Jp8YYtMGsfUW0ayYOJVuze/8nwWVvLS1bft5tpWHAuGC6PYcO4TOD8X+KZEXQggjJ86OiOFc0af2TfmTll2zFW80+WIIBRI14gj831GBafrPqTXfnfghdDHDZrlF3s1h1pP+dzNXBLAK2MuuJQZFS2MqAfQTIp7lwHDyInSkYH4FYzbDmuYMbZEN7H7TCW62QLHXSg==
Received: from DS7PR06CA0027.namprd06.prod.outlook.com (2603:10b6:8:54::6) by
 MW2PR12MB2587.namprd12.prod.outlook.com (2603:10b6:907:f::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.17; Sat, 30 Apr 2022 11:58:14 +0000
Received: from DM6NAM11FT009.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:54:cafe::c7) by DS7PR06CA0027.outlook.office365.com
 (2603:10b6:8:54::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12 via Frontend
 Transport; Sat, 30 Apr 2022 11:58:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.234) by
 DM6NAM11FT009.mail.protection.outlook.com (10.13.173.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5206.12 via Frontend Transport; Sat, 30 Apr 2022 11:58:14 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by DRHQMAIL101.nvidia.com
 (10.27.9.10) with Microsoft SMTP Server (TLS) id 15.0.1497.32; Sat, 30 Apr
 2022 11:58:13 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Sat, 30 Apr
 2022 04:58:12 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.127.8.9) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.986.22 via Frontend
 Transport; Sat, 30 Apr 2022 04:58:11 -0700
From:   <michaelsh@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>, <vadimp@nvidia.com>,
        Michael Shych <michaelsh@nvidia.com>
Subject: [PATCH v1 0/3] Add support for new SN2201 system
Date:   Sat, 30 Apr 2022 14:58:06 +0300
Message-ID: <20220430115809.54565-1-michaelsh@nvidia.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80149792-9f0a-4df4-dce2-08da2aa0b508
X-MS-TrafficTypeDiagnostic: MW2PR12MB2587:EE_
X-Microsoft-Antispam-PRVS: <MW2PR12MB2587D1B0890E196F6EBE5B9ED4FF9@MW2PR12MB2587.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JLdCcK0MjhFDac+UM4EILm4umPwDmajPKNst3MYcJxUFqA8jX0qrRJwjcgY8+RnPMpTZQXFHjFXYo2R7zwrc90kclEmBFHPs63TuwcpRtaNSx3DZcA/4nFfM2p+tw2aj2MVhpunAd3GDwytIEEFCkI7bLucnW8Jl82GlGS1U36yRu4i3y6yW3HFveqyw9yRaMaDQLgqziBSel8lqw4vDiQqOl/pQS1EaZf6oIots/aZt3iFbSMoCvL59oo042EzKU3oram2JCkBHiK3XoYrBqAvET1ebkkXlPjUymIAU59yykedAUkIdMdEkTFJtnbpujO6ThKHkqlXRHKTUsYZpMwdAfzrvJ99x1Lq2p15ZC843IywForWnVlxCRhYpZnhNeKJzYrCuSxhLGNvSLP/guewPkoyPAq0GB4Y4lubOIqyqsWo6eQSW57SKABPhrk/g9zmqMQtymitYlDy7amPXlHBcbHY+oFEExl6vRMDM+A6WfTC1wrNZazLJ6gy7GLud0rNTwY7XV3cszK/BcngbtB59Qkrvi4ABohYBzl8AGm5suxvgfry8sG4rKb3yklOc4067Wu2L6aKVGJbzK+fBwB9xhqhnWsVsWWFtNrPUfUeMx42UmJQTiUKjE6FHJhyVH0vJ5I5/9o4L5KkaTE724le62uR1Sl6a+zGprxUq+/EiALoFvXjE5QmJdP3nrHc/AJUzw00IO375zsQK6hy0mQ==
X-Forefront-Antispam-Report: CIP:12.22.5.234;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(36756003)(70206006)(70586007)(8676002)(2876002)(2906002)(86362001)(82310400005)(4326008)(5660300002)(316002)(81166007)(6666004)(356005)(40460700003)(8936002)(47076005)(36860700001)(2616005)(508600001)(6916009)(54906003)(83380400001)(1076003)(336012)(426003)(186003)(107886003)(26005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2022 11:58:14.5643
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80149792-9f0a-4df4-dce2-08da2aa0b508
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.234];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT009.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2587
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Michael Shych <michaelsh@nvidia.com>

Add support for new SN2201 system

The SN2201 is a highly integrated for one rack unit system with
L3 management switches. It has 48 x 1Gbps RJ45 + 4 x 100G QSFP28
ports in a compact 1RU form factor. The system also including a
serial port (RS-232 interface), an OOB port (1G/100M MDI interface)
and USB ports for management functions.

The processor used on SN2201 is Intel Atom®Processor C Series,
C3338R which is one of the Denverton product families.

Series includes following patches:
#1 - extends platform data with notification callback field.
#2 - introduces driver for SN2201 system.
#3 - adds documentation.

Michael Shych (3):
  platform_data/mlxreg: Add field for notification callback
  platform/mellanox: Add support for new SN2201 system
  Documentation/ABI: Add new attributes for mlxreg-io sysfs interfaces

 drivers/platform/mellanox/Kconfig       |  17 ++
 drivers/platform/mellanox/Makefile      |   1 +
 drivers/platform/mellanox/nvsw-sn2201.c | 505 ++++++++++++++++++++++++++++++++
 include/linux/platform_data/mlxreg.h    |   4 +
 4 files changed, 527 insertions(+)
 create mode 100644 drivers/platform/mellanox/nvsw-sn2201.c

-- 
2.14.1

