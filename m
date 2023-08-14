Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 607B4C001DB
	for <platform-driver-x86@archiver.kernel.org>; Mon, 14 Aug 2023 20:35:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231795AbjHNUep (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 14 Aug 2023 16:34:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232396AbjHNUeo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Aug 2023 16:34:44 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2053.outbound.protection.outlook.com [40.107.220.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBD33E5E
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Aug 2023 13:34:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OH+f0Dkcdx4RToY6utilXjGRCFsUqHYjFG0ELs7N/EdQnucDQWakl08vMkz/+XAme8tbXmo69h+TIcFN4izFQmDEogVx3c0cU32yTPSGl568UlN6HEBDTTTClRqyAGXq01rpa6iMCORP/eKeBGyRNzFO8z6hi+mNAYS1KpLnxppFJniFnHjI1Pc6AD2pkH42XCTR1zjEdOiZeTolvAmwi9QwhblmZ4PvF4Qrdy8KoAA0A2x2jvzdD4ZUMFGkckhshMx7/2NjSu2NlO+do/e3nu44CPVMIL+aXGbK/X/B5rbBadl9LGF0Qv8jscxIFfleOzRguhgoTABVJrLsVC2ClQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jEjt97RZAIxb0133HGDSCB6Hsq2fzOVjeaFc9eVn9t8=;
 b=KaLtWhnpYp8nQE2K1qpj1ae5kvN4b75wMCPDHehlYOFZMQ3/NaOZPfDS8eGWia6l/nedXHi77YKxPy2G9HJ6hBNNgKQg6m3AkZRPET06IfpzoWbhxD2s3W62NvCFLDukQrCd+Php0ZOfxXR9k5/3K4NYlcXKM/Bm0tHVdw2+H7p/VMR3DTuZcQgZGCzAwaswojl8GrwXidp8ETOltRf4Kuk6hdLcrggBdHZt9LqAA7LMWI3PWuBLRwFxacd95fNQqcYeMiYmIgO5YbTNNu26ByxhYk9oRMvIrEtoO5jJ6DvdGzt2DBut5IePtcR+bZ2peEzFY2E+q6nWfWPDFZJLjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jEjt97RZAIxb0133HGDSCB6Hsq2fzOVjeaFc9eVn9t8=;
 b=OnQioavW036MDOhVoUztutyGse5aRKNSR64OP1b/R63QWv68VmzGzHEKBAJjqtSFAeK+pQoPrgLDwk6pqhC9IpUVQDPaS35zBMjKBCy+kFFY57WY5pRUUcROGEKy0o5/8cscrebTeCRsl6ldvauTIYxr1/FoyUofWtClFAYN6EO0iyU/pydjQBUb3xkcQ7kYW3fO1R9Sw+BdNmOBNWAmO6EUSlPcgtyP43pkyyQGSobKJkNvC4PhycCxPOe8BbgBuBxBNpymxdkkD1NjZ61e1N4sEveBr62iebpyWxWvQvhAnbmV3TgRVC4Z1rmO98HKLSML+PGAbDx+wyx8PFEx/w==
Received: from MW4PR03CA0339.namprd03.prod.outlook.com (2603:10b6:303:dc::14)
 by SA0PR12MB4383.namprd12.prod.outlook.com (2603:10b6:806:94::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 20:34:40 +0000
Received: from CO1PEPF000042AC.namprd03.prod.outlook.com
 (2603:10b6:303:dc:cafe::41) by MW4PR03CA0339.outlook.office365.com
 (2603:10b6:303:dc::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Mon, 14 Aug 2023 20:34:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF000042AC.mail.protection.outlook.com (10.167.243.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.12 via Frontend Transport; Mon, 14 Aug 2023 20:34:40 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Mon, 14 Aug 2023
 13:34:26 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Mon, 14 Aug 2023 13:34:24 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <ilpo.jarvinen@linux.intel.com>,
        <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next v2 00/16] Add new features and amendments for Nvidia systems
Date:   Mon, 14 Aug 2023 20:33:50 +0000
Message-ID: <20230814203406.12399-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.37]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AC:EE_|SA0PR12MB4383:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b29c6d7-ea88-4b61-febd-08db9d05e2be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ukkWfGzQC/Q3TIKx8FvXH6oe4RgfrAiSX+CyzPOOufSY8rMhco2FgtQhGwf+fOFhZq2XwByWnU87TVyubAptvUqFtqybDAfkcnikgVRJMrvLomnmGqF+HW4prrWyNMThb4Kfg+j1qHPmxV+WngYuWG4YslgiQbNriGHy/tbrSPXomqPn0QfILNr16hAZHKxO5Y4Rm+WeO9pmBxB2G7dYzVS/Gd8vtisLYOBlFRaNthozZ+/WlfCKuAk3YPflNd3IuJaTe+YVg874Lk+vUoixVPb9yGaEXWRFvQC4QZGyCPaT+iCyqFByqXkjqGuC89H9tm13isee3A4CeCSvJHtvzcghtwRwLbSPhWjQPcu1sVs4akMcWQXadQI4Mi/xbN/x5so03leFtBjV7X3cTxWQiyQpuQRj5JIoy7+T456ZJQDsPuafVJN+Ke9rf4mLEE3lJrACPiciu59ChpSeEHn/BtZxAiZoEMTPIf5PxukmAdePkYfQrfVc1zlY4uii2aeKXLqUEB5lNBJPwya1qOCsplAmWKPJWMDpJkffbS8rXgjX664/BJ11pbALl5GyWLKmJ5gJR/5/5eUYNh3WYJUL3Qhgn60PYkfigzPhitAvJR4wl3vP470vNwOumkTsUgxEBuEgMKtOUiM03dIOHi6t6u4iWrV2QsfG2LWbei5CEFVakElKLaX+woGfMMe72wUW2DJ1bWiEFviZ5hylESpAevj/1O6Iou542JMONYuk09aWCUIzgoW0Qzk06df71p9/
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(376002)(136003)(39860400002)(451199021)(82310400008)(1800799006)(186006)(36840700001)(40470700004)(46966006)(40460700003)(6666004)(70586007)(70206006)(478600001)(47076005)(36860700001)(16526019)(36756003)(86362001)(83380400001)(40480700001)(426003)(26005)(107886003)(1076003)(336012)(2616005)(2906002)(82740400003)(356005)(7636003)(316002)(4326008)(8676002)(54906003)(8936002)(6916009)(5660300002)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 20:34:40.6059
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b29c6d7-ea88-4b61-febd-08db9d05e2be
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4383
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
 drivers/platform/x86/mlx-platform.c           | 376 ++++++++++++++++--
 4 files changed, 383 insertions(+), 49 deletions(-)

-- 
2.20.1

