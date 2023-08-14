Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98BEEC001DB
	for <platform-driver-x86@archiver.kernel.org>; Mon, 14 Aug 2023 09:02:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233038AbjHNJCH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 14 Aug 2023 05:02:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235136AbjHNJBj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Aug 2023 05:01:39 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2080.outbound.protection.outlook.com [40.107.237.80])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DFFC127
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Aug 2023 02:01:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=daQAjaBUUbJzeF1hN67MjyQHUGXBot5zVMacKMWsu9r2y3Q1X0uWUpBMcNmAlIlBtiZ450AibOIw24lFIjv4LQpEFQk8rf0cAOD8i/qU9c+6nDHEZgjShlv2QEbHGPQXe94k4vfENnI5oVxMyq7PPvbEBWu/tuDLyvaKT2X66pZcgjEgLvJZb/+Jn0mmARIJ1QkDG6R0+ZXVc6Cxt8bCl7jVeV4/7xDdg3kRN44Njd+iFmXLDKRXfQK9uenb+vHWz1SH4d1HsSCiyn7MyByY8DXeo33yNmFW7yUlF54yHDdAgsMzMI/Gn3wgSSgknFeb/FKtN/HxdMJGBm1BItfovQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WKup1nM2q52phjb/Qt2JjZwPFQ1LEG69kUy89XCx4LY=;
 b=W3DKrmKqvvZcTvdoMNMUo4yPd7dpED4MpsMgxXTm5VTLd8z65e5QhgIPc2PagycLpOpx18wQ3vr8fgNSmIn5+4gtgoLnUyYKOxHyKjHcWwzqSpl8SSV43c0U/2Xlh4mS/Uz472gbPuJB21ywhT2IPvoNr41xod4dO2pJ2MYnBUy43nIsw0Maw5c7uVfQ9b+JD19K/z8C4dp+WDJRzRpU+TBono9UTUDwRYwDvDhGqJWP4+z0vl4GPx9CtbcDaY1AwwRNFMFeIUChTfSrW34f+E3K3J5lJruEiHhDSunxUqrsQupvsrGNyhAhzvK3lKuUdUflPL3x0ZhbEBHV993R2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WKup1nM2q52phjb/Qt2JjZwPFQ1LEG69kUy89XCx4LY=;
 b=MDYy+CkkNojHvwOHtvPxkODVG/wwSkWfFwze7i1LPXFTSKAhb5PGjchvhhoT37eqQiGlUjuiBvo9tSHSj8UofuS4t901tOQvO8GzPuOeHuTKchJgjZqmOdI0GBju2Hzk9Zfkj+REeUHYb65Zr1HfkRXD6WBSWQ9Vjw3cGf0fMLtuIr4a5IXiZ0ikyhOzA0GLWOd6DzBXdnFZIUpO3Y5A+J4lXrn7TBwxYwYCUC+n9cSA7IYsXPC1g/Ue1ZPynsQd0fcNqGHw4qA5Zk/jDcoqsq5MEfnEKobnpiZc+XEZDcJhJm9xagZJAt9Mzk5ZJ/yg+6qcoAsYYIkzGwK/XTBbAA==
Received: from CYXPR02CA0067.namprd02.prod.outlook.com (2603:10b6:930:cd::18)
 by DS0PR12MB6630.namprd12.prod.outlook.com (2603:10b6:8:d2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 08:59:44 +0000
Received: from CY4PEPF0000EDD6.namprd03.prod.outlook.com
 (2603:10b6:930:cd:cafe::10) by CYXPR02CA0067.outlook.office365.com
 (2603:10b6:930:cd::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Mon, 14 Aug 2023 08:59:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000EDD6.mail.protection.outlook.com (10.167.241.210) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.12 via Frontend Transport; Mon, 14 Aug 2023 08:59:43 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Mon, 14 Aug 2023
 01:59:30 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Mon, 14 Aug 2023 01:59:28 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next 00/16] Add new features and amendments for Nvidia systems
Date:   Mon, 14 Aug 2023 08:58:54 +0000
Message-ID: <20230814085910.56069-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.37]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD6:EE_|DS0PR12MB6630:EE_
X-MS-Office365-Filtering-Correlation-Id: 49de9dd5-b873-4a0f-5416-08db9ca4cd8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vKl/pXdLEHQokPdM9Cl5QgOTX5V9JrZU7gq+T+sb1Z95/1ZswKjm220fOdrjCeeH2KBmecomBJnTvF45KzNstLolWE988x9N6Kz3ZFStvlVuumreripxOap19/Dw3CWtwcdwQHXONhVmX1BOlU6iWE8K9wV+x0HLZSc9YJHhawOgDCpMdZKjj0XsCaxHYualMvsykTuaJUW6S4pMUKKFaum18imsCjmD29qDAtahQ47J9OvUNowEpLTdjjYftnzHNrYcWTc9smIilRNTruT1srBwVbBkahMB8Bp8MiDOt6JaAIPtsDbOtJ9YXpI83e4rEXdMtt/WVxKat5NVUz5GS7y26cfzpo8pO2/n3XIorliMiHSHABhJqYCNhw7Xih+aqbhH9p+gNcVJrHqw6wjfzP5CvHnwkx8JK5vPOvcZ881F6mbL4fdMuzxs6HXV5UHdZbksJ+FQ0+qYjJRFw9kI121v6hpAbkuEtqIdKho3GUONMglrRmopTNp8v+uj1gOLq5qvayDtVLSMsicGk2uA/Yi9VJVX5niHgB7FvvoFfJvBqVl4cFvNphg1y3Bkzulk5/tVeSzhxhXzL2A1Zhy3nNtGpurMpv8Wi3xbauH8nxy17b1npR4RxPEEtHZU2rR8Z2iMCjUa4cBbY9Yg+/VYYDWpzNO0pHzMgjIudUbda6kDInZ/nGZAmdp9jO5T+T24WDd6HcX+VUJQxqe3T4YmVnFnTy5tXuY5ZTRPGwoHPwVAYfrpsVy9QInItX1Gd8Z5
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(39860400002)(376002)(136003)(451199021)(82310400008)(186006)(1800799006)(36840700001)(40470700004)(46966006)(40460700003)(6666004)(70206006)(70586007)(478600001)(47076005)(83380400001)(36860700001)(16526019)(36756003)(86362001)(2906002)(40480700001)(426003)(1076003)(107886003)(26005)(2616005)(336012)(82740400003)(356005)(7636003)(316002)(4326008)(8676002)(6916009)(54906003)(5660300002)(8936002)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 08:59:43.8942
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49de9dd5-b873-4a0f-5416-08db9ca4cd8f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6630
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

