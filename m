Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72E53EE49A8
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Aug 2023 08:19:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233763AbjHVITK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Aug 2023 04:19:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233777AbjHVITE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Aug 2023 04:19:04 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2075.outbound.protection.outlook.com [40.107.244.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18A9C198
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Aug 2023 01:19:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W7AA7G7ztsvngiP5915pym0sv/aai9QghUClL3Y8zvmpsHqh5P/BuiYgovhG5hr91sxP5kQaJmgkyLqjrGWm6PafvwXp7fzAw6am5p/9aXewTH5jZTNDMyVooR/UZOQKXelr93fSEewKygp6tI4Z9W0BZV1q9CYBlWU4sM6LPKy1QNvACc8b/QJtu2E2oo6kwOhO69BstnydIbBxYGIKTic/oe/ANC00zqpgsRGMRInigNduDZkZpJHK1O9gP8knPHDeM8sCIFLRZSvk0X1FSxdKvXCQ8rAlHtWG+3VX0acjQ5eovdkOURXs3dtl5aaGjYxSXDPdyEZUnwRoOMDNvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J+bZZE/cViRYKMi0Yxni27AyWdHCktkJp4OHJffAcLo=;
 b=dZEFPJ9Bxqsm/idY3FgpkZ0JHrVvTB1K7Q3vnECp5gdB/PUU8Sznsl5Qi+GS0JMzhjAIl9R7Ajiz52qbdYOD0f3amD9O0RJ8fP6xJmOcxnKSYSJKNT0s9ltIHRrmq2GdP8c2P+aM/zJqtLX4X0cj6Rvz6DboEWooCXem4gjgBTWPB5/QCvuMjNF1l+EedghIL3agugz+ZcXu9QTgky50IFILPk1d/nesfBHrVVAzKp+yFDH29GaWQwHvl3nLxB99Tx8/UeXRu0/OZamXf/+xpXVo84Q0411KfFM9u41O+f8GTa8A74O+PdG34qzSNw/WRMuBFJtj1gKzdRs1+5BA3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J+bZZE/cViRYKMi0Yxni27AyWdHCktkJp4OHJffAcLo=;
 b=RK6TX+zdwxvyrZeYO1dpKz75PEREAVfdAKB849zFtxWoyjQf2ZuiQJMoNmiXZjXpInYaCFQb8uY714+7TpBSIZwjwxBHuK7v3NQ9dgjWois2NSnfzgilNPvnMftordVvNl1TvPsVrz/G0kksCQba6fp22vJXeLtRLrCqtNxggrYPUnUfCHT4bajGCX+/QmfM8nn9RGwX6AJ6rxHBx9qMQ+3wOhF7UfET3gW/VuW1tGjppLLvvWLuQxWNdAlYXnhHihZoHsaNZtkK/e5KaWS58eIR9EH54wI7IzeUCOxMtyWWbp2Pua0yuJvrI9op/PRxNKZ8Pgw+o52NZES7kAms1Q==
Received: from SN7PR04CA0183.namprd04.prod.outlook.com (2603:10b6:806:126::8)
 by IA1PR12MB7662.namprd12.prod.outlook.com (2603:10b6:208:425::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Tue, 22 Aug
 2023 08:19:00 +0000
Received: from SA2PEPF000015C7.namprd03.prod.outlook.com
 (2603:10b6:806:126:cafe::57) by SN7PR04CA0183.outlook.office365.com
 (2603:10b6:806:126::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Tue, 22 Aug 2023 08:18:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SA2PEPF000015C7.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.14 via Frontend Transport; Tue, 22 Aug 2023 08:18:59 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Tue, 22 Aug 2023
 01:18:50 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.37) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Tue, 22 Aug 2023 01:18:47 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <ilpo.jarvinen@linux.intel.com>,
        <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next v3 16/16] Documentation/ABI: Add new attribute for mlxreg-io sysfs interfaces
Date:   Tue, 22 Aug 2023 08:13:35 +0000
Message-ID: <20230822081335.64344-17-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230822081335.64344-1-vadimp@nvidia.com>
References: <20230822081335.64344-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.37]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 drhqmail201.nvidia.com (10.126.190.180)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C7:EE_|IA1PR12MB7662:EE_
X-MS-Office365-Filtering-Correlation-Id: c345b2c2-30c0-44fe-eb9c-08dba2e8700b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zs3/t2p3MsKUAWUvi+O2XhcUr2h8vEeHmubYDYmucudgKFsYK/W6zG7PhmRmeIwVuYcz0PFrR3IOxTQEPjdeK7m7jlbnd6nOxgfbi8L0yg5Ra6bf/AS1e3cxpg7HWjyHNFTTehuwkHt/bZL4cqtCAqj6D8gI9qC3Z/I0s1ecwjuc5VDb2W1qy4vstMeBPmS3uOyWgzZT2YMRFdIdlE7sDeslCzmwICYhXoZjS5FQJIIo0E5Ib7+d86QmdPof0QlrSseMg9Lb9noGX8Oc/D/3BANqUMJS4uNbYfGXO7ekU/z7vshKvFl/sON0aNHDETKZ9tVr+7Pn3VYjBf7Z+qMdLWT6aY2fIpDmKSNfs7CJWBrV39J5ZUoguXH5gyTlFMGKRH09UXso5TGdM+PZ3XpvZ+Ph4ZWZ8mB2dPoR7D1KbQ8rE24BMnMGt9zY5r/HJ4huyC/+jGi+Tv+3E2K10BWtl/NmLMra3s6iVsR9YxXORF6Vh4NRpVrcg1w31oDl3cHJ1b60iVoOUQLoYl7UFq0ZcvaWc8Bz6ctTl0cb4/BtyNTRY/T2O98wrRZ2QNBGZ1KZPjc2+XD7srsvlwzVzucYxRAAP10wOX90jtvWmMjkf5Ff5YZsjOh/U4NRICGIh9Eekv1BMRsU0DQPQ3i3TycGLIm2zKUSgsQNEEjao5s3x11MKtrb2+JGkkuQUVDi/dxmRCpfK8FUNkWX01XntNX5au+/Vwn16VWhwbv7rrUwZ6ys/DBNTLVuNpe+3RNVvQAg
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(376002)(39860400002)(396003)(82310400011)(186009)(1800799009)(451199024)(46966006)(36840700001)(40470700004)(6666004)(40460700003)(426003)(36860700001)(336012)(16526019)(40480700001)(107886003)(83380400001)(1076003)(36756003)(26005)(356005)(7636003)(82740400003)(47076005)(41300700001)(2616005)(2906002)(6916009)(316002)(54906003)(70206006)(86362001)(5660300002)(70586007)(478600001)(8676002)(8936002)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 08:18:59.7748
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c345b2c2-30c0-44fe-eb9c-08dba2e8700b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015C7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7662
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add documentation for the new attributes:
- CPLD versioning: "cpld5_pn", "cpld5_version", "cpld5_version_min".
- JTAG capability: "jtag_cap", indicating the available method of
  CPLD/FPGA devices field update.
- System lid status: "lid_open".
- Reset caused by long press of power button: "reset_long_pwr_pb".
- Reset caused by switch board DC-DC converter device failure:
  "reset_swb_dc_dc_pwr_fail".

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
---
Comments provided by Hans:
v2->v3:
- Document new attribute "reset_swb_dc_dc_pwr_fail".
---
 .../ABI/stable/sysfs-driver-mlxreg-io         | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/Documentation/ABI/stable/sysfs-driver-mlxreg-io b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
index 60953903d007..7022c623075b 100644
--- a/Documentation/ABI/stable/sysfs-driver-mlxreg-io
+++ b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
@@ -662,3 +662,55 @@ Description:	This file shows the system reset cause due to AC power failure.
 		Value 1 in file means this is reset cause, 0 - otherwise.
 
 		The file is read only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld5_pn
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld5_version
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld5_version_min
+Date:		August 2023
+KernelVersion:	6.6
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	These files show with which CPLD part numbers, version and minor
+		versions have been burned the 5-th CPLD device equipped on a
+		system.
+
+		The files are read only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/jtag_cap
+Date:		August 2023
+KernelVersion:	6.6
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:    This file indicates the available method of CPLD/FPGA devices
+		field update through the JTAG chain:
+		 b00 - field update through LPC bus register memory space.
+		 b01 - Reserved.
+		 b10 - Reserved.
+		 b11 - field update through CPU GPIOs bit-banging.
+
+		The file is read only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lid_open
+Date:		August 2023
+KernelVersion:	6.6
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	1 - indicates that system lid is opened, otherwise 0.
+
+		The file is read only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_long_pwr_pb
+Date:		August 2023
+KernelVersion:	6.6
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	This file if set 1 indicates that system has been reset by
+		long press of power button.
+
+		The file is read only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_swb_dc_dc_pwr_fail
+Date:		August 2023
+KernelVersion:	6.6
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	This file shows the system reset cause due to the failure of
+		DC-DC power converter devices, equipped on the switch board.
+		Value 1 in file means this is reset cause, 0 - otherwise.
+
+		The file is read only.
-- 
2.20.1

