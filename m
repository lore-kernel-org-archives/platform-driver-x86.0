Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB41CEB64DD
	for <platform-driver-x86@archiver.kernel.org>; Mon, 14 Aug 2023 09:05:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233521AbjHNJEr (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 14 Aug 2023 05:04:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229957AbjHNJEb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Aug 2023 05:04:31 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2063.outbound.protection.outlook.com [40.107.237.63])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CF3310B
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Aug 2023 02:04:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A8ssCEI9K0xdV7CTs/TsjukId//XcYiv3KMZefV+CBgYsYrpkNNwaTT/PITC+ZL3lclQCFuWP7QbivoIlydMBCyoIkd0Znb5dP7566csgStRkWCBW0wR/FkcJRMMsx2bLYWVSTVY7B+X9eHzqexSYZnLmkVKBjpvETUX7RgwTOvxsjzbJuhZJ7y3KM1KWzPFPVgM9yPH6pbsFv+B7VVXjX3v9nqTcMuEbrtlucIlz4goaA+jM5gVfMqMWuxq3qM3ovCsXby3gCn/vPB6D6+SmDjEMHxAWgka272W/USTzdn0Ttl2e263gavM4naKIk6YtAwMOqYveQJm6MWeMd/Ziw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=weOk10MDBUQYhj0gbqxOz2vJzRheG88GF4qAUMkOjcY=;
 b=LP7k5Nq0qlm0IyAsWXmnAlPvjvhWwIqjW7qo5Pb0vXCDjDwN7JCVJ+GD6vEqFnT8Hi8e9xumoRo6RVlsZSUOAZPoaMZ+PKxIu8wMJ2a5lKBgbPy1mI2JaZRe+DE5XQRePNYq8woxPXBnVpx5J0KxtaaBUia7k3KsKV5SgG9qLiuKsv1nC0AQUNmLGCQpZ5wjgRdDbAxqGoeP6CQaA9XO3k1bKyCL5Ao/8KgLHrEzR/ypnxJEdkonlcjB2lBYIdy0+NUdXf2zTOznvkZ+ZMMo9gdpTgIOgtzwRXpuWLx13YrElvMAAKlUZK4vGGZ08h0IEyoJVxCnhn7L3Az8k/f++A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=weOk10MDBUQYhj0gbqxOz2vJzRheG88GF4qAUMkOjcY=;
 b=FmAfnRPl3/TlS1ubWxoq+ruc2E6NDcrin63z2KoSSxGnws+3Y0S3aXfVZnNJqOPzr9ps3bi0yX/JzbttNvM9Pw05w9rYTqEBOJBq+4vbucJNTH9Xif6nGHh4i0iKf9lDwpmBOaTsbky6K3BMyNTjkjpKI7hFyMlDgg2ZmK9mJ8nkcFf9cNa4Hm9xM8ZkkI9qKmj3vnpf8Oqi4Utt1IakTui4a0ZWGiLblVNKj+/sOh6EP3IIJmMQlpSKNqRDCr/QtaYRLp42Bqdv+YiHRQEvsbGlCjygdsr06aPglheK1PPYWsaD9s9KE77dnFVok6dV0OgPyf3IB0mjCz5mBv+b2A==
Received: from DM6PR13CA0019.namprd13.prod.outlook.com (2603:10b6:5:bc::32) by
 MN2PR12MB4357.namprd12.prod.outlook.com (2603:10b6:208:262::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Mon, 14 Aug
 2023 09:04:28 +0000
Received: from CY4PEPF0000EDD2.namprd03.prod.outlook.com
 (2603:10b6:5:bc:cafe::3) by DM6PR13CA0019.outlook.office365.com
 (2603:10b6:5:bc::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.13 via Frontend
 Transport; Mon, 14 Aug 2023 09:04:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000EDD2.mail.protection.outlook.com (10.167.241.206) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.12 via Frontend Transport; Mon, 14 Aug 2023 09:04:28 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Mon, 14 Aug 2023
 02:04:16 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Mon, 14 Aug 2023 02:04:14 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next 16/16] Documentation/ABI: Add new attribute for mlxreg-io sysfs interfaces
Date:   Mon, 14 Aug 2023 08:59:10 +0000
Message-ID: <20230814085910.56069-17-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230814085910.56069-1-vadimp@nvidia.com>
References: <20230814085910.56069-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.37]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD2:EE_|MN2PR12MB4357:EE_
X-MS-Office365-Filtering-Correlation-Id: 57550045-f04c-4b07-350f-08db9ca57728
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qnmJ8DNlMsXRMJf9DOI0vvjDI/+Mq/pBfPh6PFAWYIudOPDwQSkXxbtbhpWqTCEAW/jmNyAFkmLROoEjgUmxgNuPt46tzH5tfmCK2J+rpzDJBSA6FLoWNBD8g0Gc2q6L8eYGoNn2TwWw16R9m4B+s0R5Xe0RYDWhKPN2oKUHVSP0RqRj1cTkcDGJFt9vvy0p7eExKHDu0nXv16Oyuvitw2Xb7RR4kD4OSAowXBikOvMfN4EiGNbauEVaedsDJp4nDG6n5XO/55SzMOAGNZrUGvqiKWQfh7sbAT5FDRCWXg05RWrgSkJyn+MExCRQ3Zko1J7n7Uc8gzYp4YH/6BLE94yLfyFaVmT3I0ev6u+zcDYSl/J8LbhkLz4zoKvUBOWaHVWQKWjvfil4oSOiHKKJOJ7Yyf6ioGaN0zDPaZLNALpV/xgpUYW0kFOYq9YY0EDU0qHRy52G2Psh0u4dzo0rbDwD9jcxmgA+jMNOkh3xLR9EJTQ7JXGdf84bD+nY/iKMgXHkirzOJPZsXTK+06DjEfEGbZgZEAs/rtPYLP9Zd0YH/ESP+Xzso8DxUiLaAFygwAa0ui6Y0Udpr5JjyxFd+OjSml4AT/N4MWu6QlBBc+t+WJUmt2cX4j1H2QLOniHFl3GjvlHjsnEsghJ8ASudKtCQKoqNQU/72y73A3d9Vxwl3Q05bjrc53AMiDm/pl0Jkdpcdf19SW10WVFNHc/3hxQ2qBPv4hE+sbW28MCUOg0YzBbn40zz00CN4U/lTuX+
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(376002)(346002)(39860400002)(82310400008)(451199021)(1800799006)(186006)(46966006)(40470700004)(36840700001)(40480700001)(54906003)(6666004)(40460700003)(478600001)(7636003)(356005)(82740400003)(5660300002)(2906002)(36756003)(86362001)(6916009)(4326008)(70586007)(70206006)(41300700001)(8936002)(336012)(8676002)(316002)(16526019)(107886003)(1076003)(26005)(36860700001)(47076005)(83380400001)(2616005)(426003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 09:04:28.4311
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57550045-f04c-4b07-350f-08db9ca57728
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4357
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add documentation for the new attributes:
- CPLD versioning: "cpld5_pn", "cpld5_version", "cpld5_version_min".
- JTAG capability: "jtag_cap", indicating the available method of
  CPLD/FPGA devices field update.
- System lid status: "lid_open".
- Reset caused by long press of power button: "reset_long_pwr_pb".

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
---
 .../ABI/stable/sysfs-driver-mlxreg-io         | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/Documentation/ABI/stable/sysfs-driver-mlxreg-io b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
index 60953903d007..633be2bf2cd0 100644
--- a/Documentation/ABI/stable/sysfs-driver-mlxreg-io
+++ b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
@@ -662,3 +662,45 @@ Description:	This file shows the system reset cause due to AC power failure.
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
-- 
2.20.1

