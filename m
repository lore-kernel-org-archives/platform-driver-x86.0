Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EF48EE49A3
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Aug 2023 11:36:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234729AbjHVLgh (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Aug 2023 07:36:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235004AbjHVLgh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Aug 2023 07:36:37 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2055.outbound.protection.outlook.com [40.107.93.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A40CCEB
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Aug 2023 04:36:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KnQdhs3teSafMZu9RKwS3DjghY8/TZNIA1yWywkZDe6IKMna1VSs7pcDYY9DK1SGrE++D7zlE+EJ8gkyR0sLaBJWf3V6QMNQZ+gDAIwXHIvnMR9/TFKRi/2MtG9WEVnoWxnQzrUd8XB+OQAMVZ85UjzE///HDW7s+lFtjK6u0byyYXl9M2BwhWE8qXNqHmf4fe/s6BZB2qeMJJ2JD529MmabAW9FJKM+hM8KqAPNOqft3PJNDTXAT7tcKW89bcei+wplhqPKN4ZoAUu3H7Tc/DvaTppg5xfPO4dD8HpDyag1M7a4Us5Als1lE1uI6jwD/cRqPptZ6+1hZZlzkq0wmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cSxH8ypDJHkNx2seGKfnvlZw7HzfD+zUNCf8f71loTM=;
 b=gSSVCAA2udTOhAQLTcThWbAuS2HnVqJJWVZBlnT41DNA0PkBZGU0cktPgJBAmPJ/HuteBCZMK7l3+Hc/ffeOLH3z6DaovSegp+G+K63HuAOXe4aWO7l3ENnz2TGutcJtUPM/jj7iwRzMiUttSdNeUTUb7n84Fkncj/RJ4TOzfFiA4JQPCWWK4PjjE6sKF0JWttNn++Tn74lplUNYtDDhykp55P0/IWqCfz03a1f394wSS1ctr17wXzOyzbK6yCQ7VEJAvVAwdBjtHFzBmMrRjYUvrGKwJ1llubrpIF/EI8Oq0D00Ej98csbDQt/gO46o9jpa17i1s6Q5YsTv9JD9cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cSxH8ypDJHkNx2seGKfnvlZw7HzfD+zUNCf8f71loTM=;
 b=diMHfBNPjHIlSkFxLrMEKHqZSzvKtxaKm0ni/h56dsTDyQGKSh2RRVVhXF+y8jFJKJrXscvGPeOaWLNGgarZd8dqPiAg2RBPf5EqGAC3mL71YbvluwPEYDa4r2Qt9YSF7Y5L9XW00b+JPH56OIuoLe+C/mYeg/5vakm2Df4nItln9diVvt1zk9CLOWkkZO1yrYYE6cR0VAfDK+y62D9HTYu8QKVg05KtugiCCXAucCZfHr3FJFZPtUC4bCDGNF1FkPVrS8E4d/HBRgSHGII9yj8SQfGcsAl4xj5HdAZTBG/zlUiWmdm7yrAW7+usmzNsFU6xIhWRr340Cv3fWF8e4A==
Received: from DM6PR08CA0029.namprd08.prod.outlook.com (2603:10b6:5:80::42) by
 MW6PR12MB8915.namprd12.prod.outlook.com (2603:10b6:303:23e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.25; Tue, 22 Aug
 2023 11:35:21 +0000
Received: from CY4PEPF0000EE33.namprd05.prod.outlook.com
 (2603:10b6:5:80:cafe::43) by DM6PR08CA0029.outlook.office365.com
 (2603:10b6:5:80::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Tue, 22 Aug 2023 11:35:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000EE33.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.15 via Frontend Transport; Tue, 22 Aug 2023 11:35:21 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Tue, 22 Aug 2023
 04:35:10 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Tue, 22 Aug 2023 04:35:08 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <ilpo.jarvinen@linux.intel.com>,
        <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next v4 00/16] Add new features and amendments for Nvidia systems
Date:   Tue, 22 Aug 2023 11:34:35 +0000
Message-ID: <20230822113451.13785-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.231.37]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE33:EE_|MW6PR12MB8915:EE_
X-MS-Office365-Filtering-Correlation-Id: 42983d7b-0523-486c-511d-08dba303de7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Llc0y1oVc+y4cB5Pq5jd2JmCTox4fTMgxFcLN7iu1Ol5E9C/k6rl4W90/en4IaqtBzkaqbPFIrhd/QkJ9DGSDdeBdhjDkj4nyHIS0ykx+C/d+JDLZmeb3Eg57cRcv6UxXorDqG1ksm5ykJDxSJ/JfvGOxjpyR9u1w5H10vlSDOHm8ugyY08TCvah5c106Vqef/8C3VTAV68/J8zLjTFpD7Egv3O0fqvg+g0Te/0EMnWtNVEe9j13t+lrjRVQdHhwqc4voOyMW2mnYeBV14QeJR6Q669RDmjB/b+qilEHpV0i2pdRA9LVcNwIsHyanCctf0LJdFA9/TouJ1mkuBgG33x+DN99sw1HZ/6w8UIjiv5a3i7wfVMP46Cq5MgxIX/qZ6qSiNdfOKK57jU5Os4sAmrCFdgYTV4D1Q9fGGpMREqhXekywqATSUj1ikHSPo/598mWTo2qFhbDGHE8621wSfy9gKdOzGYR+4ih71eh79C6VpkRHDGSjZgUsVWhNpmwcpsn/048TGgfP6s7E9j6eRwTxfSj+Mq5lXxmCwwddx7Aw5mwKlv6SnPhMZ9iujudSWIcoucj96boIuvakg8BCEN9LIgCMXjdm0CJSLKMSQvX9Fi8NCXQewJiUayrmoeTjQborfMJxGKY3JjPxUzxWkjVOkqPUH4ie9V6/YuUdy7tUCy6e9h/7CqFrP1AzQeQq+Zx3AvZFcF7RzPwK11wEfVedLMbotYFtAQCs4vBmHxDn4U2b6gbdrE7hYB6tS9VdRlydgFgVfSfW8aO1fuTDwpKfgYqhqipFku4BrXJFqc=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(136003)(396003)(39860400002)(451199024)(186009)(1800799009)(82310400011)(36840700001)(46966006)(40470700004)(70586007)(70206006)(54906003)(6666004)(8936002)(8676002)(4326008)(36860700001)(16526019)(26005)(966005)(2616005)(478600001)(41300700001)(316002)(6916009)(107886003)(5660300002)(1076003)(426003)(336012)(83380400001)(2906002)(40460700003)(86362001)(36756003)(40480700001)(47076005)(356005)(82740400003)(7636003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 11:35:21.4816
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42983d7b-0523-486c-511d-08dba303de7b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE33.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8915
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

Changes in v4:
- Address review comments from Ilpo, see patch 16/16 for details.
Changes in v3:
- Address review comments from Hans, see patch 16/16 for details.
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

