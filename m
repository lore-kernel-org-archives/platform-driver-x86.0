Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECDAFEB64DD
	for <platform-driver-x86@archiver.kernel.org>; Mon, 14 Aug 2023 20:34:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231575AbjHNUeM (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 14 Aug 2023 16:34:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231499AbjHNUd6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Aug 2023 16:33:58 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2044.outbound.protection.outlook.com [40.107.243.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F53810F4
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Aug 2023 13:33:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mp+8zsHJkIDP35dqXm2yT/Xgf/xRISU5qMWjNoLQqujHPkBMMwqy0bVbb3fldZSGoPwPvWcu8Z7PvTXQdEX7aBYO4BfxQHcq21tYYKNcmtfD8J+s6A0aDqfpDlf8kBMrLQcWzsS+qcLzjMZ3M3xn5NXiAHbI4xfccsWxq4ULoX82ks/hBsAqybZTyt03LhVKy/1zyPtqyqQgTq3LrEHuCf/geUC88DMWInFeZnNtHCqRnj3IQp4sOAyqQqNNaIIChFW5QGMH8mg4e5uOmnzoct1JOSOm9hXQ/mtR9vjxjMyXg2EkIE/tKkYHB5asE+QYUXvZTMi0oOaxmFWcQ5W2AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WKup1nM2q52phjb/Qt2JjZwPFQ1LEG69kUy89XCx4LY=;
 b=dTJi8OYjQDkYW/YFhLiKdP3hmFE5Dp4OpmdFsXekTulUFusTGPydf8Ug1wfSefoodDVv519KUdpkksq0NJdQRl2BlRSI3cDtwljiQTp9y/bXQeY8Css2Eadni1tLnQCb7+MaGqLZtWTh2Q/YQ52NDiwkOoxGXe5myOSYzmskv1g62HdVdddDFLudGC7WWgwvPWv/SgrXvxFtHX/5X/e8xG0nU1H18b8pts7hetCgpIiZ0kMkN80W9wqVKN+jnnsSfHpP7+6xiYHm332M26KmIv/xmR9GqvIKKiTAINLG/X8l/cds9B2Ewgibkr9waA5uxvchx9GVmKKtVLr3xcvjFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WKup1nM2q52phjb/Qt2JjZwPFQ1LEG69kUy89XCx4LY=;
 b=YDs7IKTXZFzjmFBu5Kdcv8WakdFNwbhjs1NunVEkswN7SDpCbaA5IAXgvKwMUQvH0wz2uLDFj5TMSIVyC+Cr/Ti0e2W8pdEr+sFWDGlqHRto8/3RACFTsMiBcZ2k9CAuBZiBSiyNQXDAWDgp0ugTB7R8kz2fy9mYeG8IJV6WIY8u9316VEcVes0Qlr7AyQZpbEDvcHDfd3Yb2yTiCbMdp4OdVw2ZSdRpo30p2dlrsnKVqaNVh6aqFRbfe2xSFnfcMCfFgWx2rBtwUlkqI39pn2aVvZ+4BFjtp13OuUFjjbiCwQ3eueVmeoZ0ndd3nC1bghYWJ+xUSrRbBK2gIx2MDw==
Received: from MW2PR2101CA0007.namprd21.prod.outlook.com (2603:10b6:302:1::20)
 by PH7PR12MB6884.namprd12.prod.outlook.com (2603:10b6:510:1ba::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 20:33:55 +0000
Received: from CO1PEPF000042AE.namprd03.prod.outlook.com
 (2603:10b6:302:1:cafe::c7) by MW2PR2101CA0007.outlook.office365.com
 (2603:10b6:302:1::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.7 via Frontend
 Transport; Mon, 14 Aug 2023 20:33:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF000042AE.mail.protection.outlook.com (10.167.243.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.12 via Frontend Transport; Mon, 14 Aug 2023 20:33:54 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Mon, 14 Aug 2023
 13:33:42 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Mon, 14 Aug 2023 13:33:41 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <ilpo.jarvinen@linux.intel.com>,
        <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next 00/16] Add new features and amendments for Nvidia systems
Date:   Mon, 14 Aug 2023 20:33:09 +0000
Message-ID: <20230814203325.12314-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.37]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AE:EE_|PH7PR12MB6884:EE_
X-MS-Office365-Filtering-Correlation-Id: ed87eadd-2a84-43f2-2899-08db9d05c765
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 53ZeIx/8EChjWigPm36sHd//zyK5id/zMzGbMv3gPAnXvjyaHjzknctmC8Rxdz91Won3xn6s0p7IwMPmoN40jcNlyGNdALBI8OCUYRx542X0NtCFn/WG4U0t9xqhpORUUWaM8VDzCF4tEKWzApcRbbQ3Jv7Bzcdy4OGF7hJcAf5Znphj8G/z8D7konbTy/ImpQc6t46obUtaKlLT9zebQ0KZa/Xikl5P1IMwzTRQQfjYQj9IYk9frt4z5hqdfrEjDuD9TmxYPLU6Yf/gZKHS985mC+2gvbGbzqDsarVcgxqfmEdBEUKJhcaVJtV8iFWrt6hXwKtV55zxeJvgnb7mJN+gzI+o4UfsPHyqYkzEBy7vFEl+sABl+qEi9/UytmSCIAd1+LyDREjIhwbToJKiwOqCw6XP51Ff145B/saK9qIJtllGt6RmF5gMGIsVZIy9amHlq7ov1Y+5LZMVtXrpBviNb7zR6RmOavhO7Rs8QL/CbjGZVHUHfyAmbcdbBGddxCZO7c07KxGUT6uA8va/ioSWwl9dm7Pc9C/O05iZmtdnk4VGdVZZuhwg0dk233uIIykU/qI60tH2t1Pd5XeMkbo1jqlrDB6Qpz0rhfzaRKRhDjKQN2llDmoRglvHPQV87g86Xlg5RDQVv2v9CbxSja+ud9P4YguZqziEZbYHAGDEFR72FH8Vg3ZoXIhwIZtkFb+WrT/K/3ZkwF25jVQO2Hepoxlr0O/Vag5402IdJd3wHLl2bgeOccQ0JQ7xjt8y
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(39860400002)(396003)(136003)(82310400008)(451199021)(186006)(1800799006)(36840700001)(40470700004)(46966006)(36756003)(5660300002)(86362001)(2906002)(40460700003)(40480700001)(83380400001)(36860700001)(6916009)(4326008)(316002)(54906003)(70206006)(70586007)(41300700001)(426003)(26005)(16526019)(1076003)(107886003)(2616005)(336012)(47076005)(8936002)(8676002)(6666004)(356005)(82740400003)(7636003)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 20:33:54.7812
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed87eadd-2a84-43f2-2899-08db9d05c765
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6884
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The patch set:
- Provides New system attributes for monitoring.
- Adds system reboot callback to perform system specific operations.
- Adds support for ACPI based initialization flow.
- Adds support for FPGA device connected through PCIe bus.
- Adds additional logic for hotplug events handling.
- Contains some amendments and cosmetic changes.

The patch set includes:
Patches #1 - #3, #5: add new attributes for monitoring.
Patch #4: sets hotplug event action for health and power signals.
Patch #6: adds CPLD versioning registers for systems equipped with five
	  CPLD devices.
Patch #7: modifies power off callback.
Patch #8: cosmetic changes - fixes misspelling.
Patch #9: provides system reboot callback through system reboot
	  notifier.
Patch #10: prepares driver to allow probing through ACPI hooks along
	   with probing through DMI hooks.
Patch #11: adds ACPI match hook for initialization flow.
Patch #12: adds support for getting system interrupt line from ACPI
	   table.
Patch #13: adds initial support for programming logic device connected
	   through PCIe.
Patch #14: Extends condition for notification callback processing.
Patch #15: defines the exact i2c bus of fans on the SN2201 system.
Patch #16: Documents new attributes.

Michael Shych (1):
  platform: mellanox: nvsw-sn2201: change fans i2c busses.

Vadim Pasternak (15):
  platform: mellanox: Add new attributes
  platform: mellanox: Add field upgrade capability register
  platform: mellanox: Modify reset causes description
  platform: mellanox: mlx-platform: Modify health and power hotplug
    action
  platform: mellanox: mlx-platform: Add reset cause attribute
  platform: mellanox: mlx-platform: add support for additional CPLD
  platform: mellanox: mlx-platform: Modify power off callback
  platform: mellanox: Cosmetic changes
  platform: mellanox: mlx-platform: Add reset callback
  platform: mellanox: mlx-platform: Prepare driver to allow probing
    through ACPI infrastructure
  platform: mellanox: mlx-platform: Introduce ACPI init flow
  platform: mellanox: mlx-platform: Get interrupt line through ACPI
  platform: mellanox: Add initial support for PCIe based programming
    logic device
  platform/mellanox: mlxreg-hotplug: Extend condition for notification
    callback processing
  Documentation/ABI: Add new attribute for mlxreg-io sysfs interfaces

 .../ABI/stable/sysfs-driver-mlxreg-io         |  42 ++
 drivers/platform/mellanox/mlxreg-hotplug.c    |   2 +-
 drivers/platform/mellanox/nvsw-sn2201.c       |  12 +-
 drivers/platform/x86/mlx-platform.c           | 375 ++++++++++++++++--
 4 files changed, 382 insertions(+), 49 deletions(-)

-- 
2.20.1

