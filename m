Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C9E2EE4996
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Aug 2023 08:14:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233693AbjHVIOG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Aug 2023 04:14:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233708AbjHVIOE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Aug 2023 04:14:04 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2078.outbound.protection.outlook.com [40.107.220.78])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66717198
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Aug 2023 01:14:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aPJwLZRDUSDaJKjKodINuER6MOVifRxH23lGFzoHwqXpoonF7k2YiUCxlfunKgfKCGDmns4hgjz6lIyVtLuP/OrnSo1mmF0qDAjf8z3jow1tkYgaV3IuCTAbz+kyrdHqLhqhQoGaYw5GOB4fJoO9x5y4KrVlIPJFToPQbV+5224Wwd8zKNJ/FCkjHBZU5cCkHnBmd/C/zZUR64uUOQj+X+6+qNyUTh5Fw+zIVBnNKTu4BOXrLs1mwbwtPEFFLDGc2yHcp+PzH4cNEDd3qaFEPE2egMlp8ryquk9FuJQxWjdK1DELhpF/iL70IT/YB+x8o3YT+g+FYzHdoz/CDa/Hew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tSaZGTLuATwljnmUn3T/QK3H4BfqQwlXy3BxAf4lp3M=;
 b=IdANVgF52gC6/ZIGkUhJCl95L/QW8ovgUbkeffrcDVQhRMWx9ZfiuIXi/fTGInuDj/E+BYqMDFcFxUdNoo+lk+dKvXYPPrAXPb7n1AwYqRp9Db2gwEDrv6MtTV5fiEhsYi/5rWtb9EVJvUvmdKovbqGk8ug3L0MveLAW5CciBBKdeyAfzrFQ4ax2I7f6rD7yEV9S+jn33mA/0BQwj/LwzDgwrGHyBqf0LVfeR/NkKpAb2pqgqioKK37sfIOS/UTrDSMKP2UEPGXzYFEpoI5E80mAq2TBbSftdCw8WxBC7gxwGFHlkncxuR31viOSPhvveArPcuaqTLJkc0ggNdAASQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tSaZGTLuATwljnmUn3T/QK3H4BfqQwlXy3BxAf4lp3M=;
 b=p8JBpBAC194jBzkJpwNFfhOOg6yYH1rWvGX2RElCa8/tA3/ZvO4FjKGM3ncoBaoYWv90NBVSB+1LURRRfAw+L+8LgJ3v2TzdeYMyxs7qo0FXYFUw/JxSZaypD4bLbP1zb6eVxiCIR2t2hILDZIEJ67Ix2pcWNAJk17W2vvppzw1q33bc6Qi0NshrUjBy6pCu6+jMXFw5qc7/o+mYnpP2dnDLVdKoElE09Zp/wJXKT6kS1yQdrVaJwNR+yeJupq10HFKTqoLfdr0sBANimjrjAZ+V1SDgQpelip+xLAc4r9iMbDjgIo8XcdP/i6eOXuVoEbVnblOgsD7NHCuFlShEjw==
Received: from SN7PR04CA0179.namprd04.prod.outlook.com (2603:10b6:806:125::34)
 by SJ0PR12MB7474.namprd12.prod.outlook.com (2603:10b6:a03:48d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Tue, 22 Aug
 2023 08:14:00 +0000
Received: from SA2PEPF00001505.namprd04.prod.outlook.com
 (2603:10b6:806:125:cafe::4b) by SN7PR04CA0179.outlook.office365.com
 (2603:10b6:806:125::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Tue, 22 Aug 2023 08:14:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF00001505.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.15 via Frontend Transport; Tue, 22 Aug 2023 08:13:59 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Tue, 22 Aug 2023
 01:13:52 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Tue, 22 Aug 2023 01:13:51 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <ilpo.jarvinen@linux.intel.com>,
        <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next v3 00/16] Add new features and amendments for Nvidia systems
Date:   Tue, 22 Aug 2023 08:13:19 +0000
Message-ID: <20230822081335.64344-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.37]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001505:EE_|SJ0PR12MB7474:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ba4d0fa-54d7-40c8-2df2-08dba2e7bd59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sybAMZRk+xV9+kzaseNJLkWCEaxQov4dF1o843cx3k/Q/NDkfoURPk1zrA0N9IRGvIrLGjAHvg2hv9JWFBAIwdj7ZDAtbdjT39t3RO4wD4jGo9qGW5Wk2g3qj3ZGxP1HomJPosFFgjbxf5cPXvPddQLJVYQuSnppfp3NOJvNVbbLeNm40Wsty2Rg4sHfSa/g33cHl2xipmWbZs0fYu+T33jNnD0HmgjZquPmYk2/pgyTSa/BPmbhJwaevUTvMAOZQvdZMhcg7OpFqehE9Q7SESPIvVkg8qAuSFaxOu3n1ICcvanTufXApej4z9egXIlU/Lf4/zM+2897XQKM02hSaOaHxI4+tOXAA7Phr3iLT64d244dzpm+1pp7ck1BFoOwx9u1OOpXBbWcnI5SaNCK5oBQsEJy9FcP+PpO+QKv4JSD+IGlLxuKU7Wmc+ZzL/DcI9FR12h5cghZmIDu4bNRH0KBqDVICffUsOUB13WtQzin+KNH1n1Qqj4HbdWjgrMdFaIeJRLFVp6Fb8xPJCG5dfMw6rDcwY4pUxbSSqpodHjos6VidyQRwU9AobkAnfWn1qOsMikpb5GHUzfknjRVQ8vAqErL16ugx39Cssijy/lqQUjarixP0SRVgmZ1LLsOP9L96XH0peqtokFNo32KiAKmiWOcfBEJwCcy9KCQBApU+XKHk+yJqw1HTQzdzhTyY/6FpFWOGLvBjBbipUnGys7v4ctiumGEpiaNKDHrcF/WqG2TlJXww2N2T+iQEUIPE8NA40VZtdy8G9kUkHrh1Dpp45Cw2gwHe9NypkkTgtI=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(39860400002)(136003)(396003)(451199024)(82310400011)(1800799009)(186009)(36840700001)(40470700004)(46966006)(2906002)(40480700001)(83380400001)(5660300002)(336012)(426003)(16526019)(26005)(86362001)(36860700001)(47076005)(8676002)(2616005)(8936002)(4326008)(107886003)(70206006)(316002)(70586007)(6916009)(54906003)(966005)(478600001)(356005)(82740400003)(6666004)(40460700003)(36756003)(1076003)(41300700001)(7636003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 08:13:59.9378
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ba4d0fa-54d7-40c8-2df2-08dba2e7bd59
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001505.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7474
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

Changes in v3:
- Address review comments from Hans, see patch 00/16 for details.
- Rebased on top of:
  https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

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

 .../ABI/stable/sysfs-driver-mlxreg-io         |  52 +++
 drivers/platform/mellanox/mlxreg-hotplug.c    |   2 +-
 drivers/platform/mellanox/nvsw-sn2201.c       |  12 +-
 drivers/platform/x86/mlx-platform.c           | 376 ++++++++++++++++--
 4 files changed, 393 insertions(+), 49 deletions(-)

-- 
2.20.1

