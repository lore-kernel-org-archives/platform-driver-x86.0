Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA816C636CC
	for <platform-driver-x86@archiver.kernel.org>; Wed,  8 Feb 2023 06:34:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229490AbjBHGeI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 8 Feb 2023 01:34:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbjBHGeH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Feb 2023 01:34:07 -0500
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2058.outbound.protection.outlook.com [40.107.220.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B4A838B67
        for <platform-driver-x86@vger.kernel.org>; Tue,  7 Feb 2023 22:34:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eRVRzy4eGtiHlxo7nBycTuvM4fD5K4daqwDhaXJD+ZNaQ7Kjj+wXVoSf8fR7kgXNcHEN9c4v+rT2lfcC11H/J86yxj35mAMov4nGcHz24ZpuLN2tqaNL2VVwD3PisQ2yJuAhFz+c9pycluA/txl6hNIOyzGgpWUyO2Wy5elpFptqZHFj5mG+YAKFy6urOJycIgA43+0v5giE3sfwP6Fy7bXTEbM3jzocHbNjuZ6uX3wU4HugI+BiQ/g429J18l48bRDG3ggsfq4Pj/H2vU3u32SKoKAVWZvGBNcKQ5tD9ETWf8jhGiaM4FX+1IZzaNmfDxz5LEga2IXE+f0PKtTaXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FJOZ9glm9N9kWxhSumCzX8uXeTPBXuG1X6s6H4Z0wzM=;
 b=FxhQxJHt2IFdOVUiU7zsd8D6iWXXNlaC+IiT3ft+yKJUUoZ5krGbI8gCBQbsRrQ2NVo6Iad6RzEm5sDT0HYxYh1vFwFPZ8RBcWRfMhUEguY84qYFgD62SmE/kIAOpzu2Vz5sLI8NM3aDZO73BHeaZs9GqF24JlEHga7yafgUynX6F0D2WVwo0qEVrf6xm/wwgpNSYJevSqHd+6jK/KTdtJjdlrCs+AcvdFmfCTTu0GgpY7cy6bO70xb+dETrMYu7m8L/W9NrWUCB8w0lixo1xE/pjDdc/jfpc2T6qM18YC7ubkKFcob9tsjjr/qG4nsK7zo5T+sa4P7lDkHSNwCbaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FJOZ9glm9N9kWxhSumCzX8uXeTPBXuG1X6s6H4Z0wzM=;
 b=ncGIxufTG4Cc7T6rm8YGjuQ8vnxUwLbrmkKtcKDbPZ7I4mAvjapkJjQ0kTLDhCJjBSCWNMVQdxKbFjIgKEepsOV9Vbz6PB0+POHsGxspYC8uYHcS0EWY8wL7w01luFQvFFBzBJrherKRHBWrsYCo4W5Q+yntYgu4xwTr+geYBdZVdu7bOthBuPwC/PxYn+SWd4feLZfYN4jhzQ7GQ3ahAXc8pSilui7zz0ELxQKznaslv50VB+sLjapOZeFlOWoJu6PQY8wo9xoab1T+AN3t/zL8uYSe/ejuG6kZ5T3TyLvjqIQtBFP+Vr5a8k8EYfpg3SIOzaFTQb8QBlH4M6ljYg==
Received: from DS7PR03CA0206.namprd03.prod.outlook.com (2603:10b6:5:3b6::31)
 by PH8PR12MB7375.namprd12.prod.outlook.com (2603:10b6:510:215::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.35; Wed, 8 Feb
 2023 06:34:04 +0000
Received: from DM6NAM11FT083.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b6:cafe::95) by DS7PR03CA0206.outlook.office365.com
 (2603:10b6:5:3b6::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.36 via Frontend
 Transport; Wed, 8 Feb 2023 06:34:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DM6NAM11FT083.mail.protection.outlook.com (10.13.173.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.17 via Frontend Transport; Wed, 8 Feb 2023 06:34:03 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 7 Feb 2023
 22:33:56 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Tue, 7 Feb 2023 22:33:54 -0800
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next 00/13] platform/x86: Add new systems and features for Nvidia systems
Date:   Wed, 8 Feb 2023 08:33:17 +0200
Message-ID: <20230208063331.15560-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.231.37]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT083:EE_|PH8PR12MB7375:EE_
X-MS-Office365-Filtering-Correlation-Id: f263d242-ffab-4ee0-7eec-08db099e78c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0GzVfSHBJcbj8Hrw/PE9se+TPA5zoV3+Ztxmmv22RZRDZLxknnUj5Dzr4hJY4q4D6/fsV1save9UL7+xEBTMf888rniPbO0r3a++R5tCqcL0bGfkAju47hJjIV1HPpDXu6I98AzNocoTq3OjT0HhjtdsbPU5tA3kEv7v3bDqSHhnjRRPlWizz5HP5/wWuUlBquqGtZS+Cl+fFqEsrQEcDsTj6NmcthRVYfsGvcUmIMAo/+RmZpEHrgk+f/JWg2hW6WtZqiUDI6dqzKBWaBje7SUIkzB81eVoKLItTjScxdBItYt1CUpLpV90lyvLdwOO85lilrYJU5H4DJwXOmK4XSFpuJJ55PSBpHsExtBlgPN6BhguIGlt7Teri9SPBA2oereui7RvB/MUaIC/MszgsGolFSNl+6yWnhyJlgFNCW1RXAisE2nrCTXfC42ngziiWU0Vfo2qEByhA0P0yMouwudYxgvf619DbBujYjwPisqRFWIL4DqNk+CwKw14YQMCYdSw3XYynwycfNmogQzpXAPbIUEhe4PDeCvB3IFBX0A6WYLLu6GLGd/KxO17oS1oLoqAErp/+yq2YNboLrqNe0k4w6n5ZeDXib4fFHGcZGaqpUHnVkvWxFJU8up0b7vots6R7bDNKLI6ku6QQHG3sQ2pRPqQRRGG8uX5bu02rGSCkyjeGVfQKOntcVqPhnduJwlK+sv/SKOXpWCI9hC8Jg==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230025)(4636009)(376002)(136003)(346002)(396003)(39860400002)(451199018)(36840700001)(40470700004)(46966006)(82740400003)(36860700001)(70206006)(54906003)(82310400005)(70586007)(316002)(8676002)(41300700001)(8936002)(6916009)(4326008)(26005)(5660300002)(356005)(86362001)(7636003)(6666004)(107886003)(1076003)(186003)(16526019)(36756003)(2906002)(426003)(40480700001)(40460700003)(478600001)(47076005)(336012)(2616005)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 06:34:03.7252
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f263d242-ffab-4ee0-7eec-08db099e78c6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT083.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7375
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The patchset:
- Introduces new systems.
- Adds new features.
- Preparation for to support systems equipped PCIe based programming 
  logic device.
- Cosmetic changes.

Patches #1, #4-#5: introduce support for new systems.
Patch #2: changes attribute name.
Patches #3, #12: cosmetic changes and removing code out from the loop.
Patches #6 - #7, #10 - #11: infrastructure changes to prepare driver to
	support systems equipped with PCIe based FPGA.
Patch #8: provides synchronization between I2C main bus and other
	platform drivers using notification callback.
Patch #9: allows non-successive definition of hotplug signals
	configuration.
Patch #13 - documentation.

Vadim Pasternak (13):
  platform: mellanox: Introduce support for rack manager switch
  platform: mellanox: Change "reset_pwr_converter_fail" attribute
  platform: mellanox: Cosmetic changes - rename to more common name
  platform: mellanox: Introduce support for next-generation 800GB/s
    switch
  platform: mellanox: Introduce support of new Nvidia L1 switch
  platform: mellanox: Split initialization procedure
  platform: mellanox: Split logic in init and exit flow
  platform: mellanox: Extend all systems with I2C notification callback
  platform/mellanox: mlxreg-hotplug: Allow more flexible hotplug events
    configuration
  platform_data/mlxreg: Add field with mapped resource address
  platform: mellanox: mlx-platform: Add mux selection register to regmap
  platform: mellanox: mlx-platform: Move bus shift assignment out of the
    loop
  Documentation/ABI: Add new attribute for mlxreg-io sysfs interfaces

 .../ABI/stable/sysfs-driver-mlxreg-io         |  122 +-
 drivers/platform/mellanox/mlxreg-hotplug.c    |   28 +-
 drivers/platform/x86/mlx-platform.c           | 1394 ++++++++++++++---
 include/linux/platform_data/mlxreg.h          |    2 +
 4 files changed, 1339 insertions(+), 207 deletions(-)

-- 
2.20.1

