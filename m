Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F08CC001DB
	for <platform-driver-x86@archiver.kernel.org>; Mon, 14 Aug 2023 20:40:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230518AbjHNUkJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 14 Aug 2023 16:40:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232626AbjHNUja (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Aug 2023 16:39:30 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2047.outbound.protection.outlook.com [40.107.220.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19575171A
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Aug 2023 13:39:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hqwuUVDzuQH/I9e+VKTUAQlAcMgbzdM6xXIhKgqUBdC7aPIrZIL5EdniuzzLRD2pHVSzGPOeHbh3f7FG/+UHQUKKZoxyEbgG0Uyb+qwxM4jl44PzyP7NxLKF63/8SocIhfWbvz+/JPdcifZNYtaHxgZicm04IGxJgs1eXdBr71w3S4BGh3pWOXluvPB0RdOK2WtwJNpJqyX6+r6pDpXBmUqO5o/poEUoYobhnHoyV1q0BKCWkv0kAael+sMwd6KacbniFPtSH48sor9UbMGxgRLNOPdtbf9oGMhr/yk1IVxLv+U7LhEteZFMrEMkMpE8BQBizO0RZF3rij3qFiHxaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=weOk10MDBUQYhj0gbqxOz2vJzRheG88GF4qAUMkOjcY=;
 b=U9bteyAfKSMsaFBCpt/mW7YWqWea0ft+cvIlFAYrFwWwyuTO9ZZATmgN/gdf7U0HuxqW7OvVzg+NVGdZ6KyKUJPKRJZ9DwKluApjwDua90/TzN4gcwQ9MkWzvq0pfA9GajsjD+HOeNMVaCgrcjqURCPNh7YJhUlCAW0uP5j5CZzvcJ9MJCJUmTRj+PrtcgGyKh+K0ExT+b8wad0iWymPzkfMGeSUX+YjxAFpuEFLC0vsnjulSSABitp51fstdE1MvuX1gwnkrREz4zWbSF6fJZOXaM7GyUUN9LcZ7hGqB0LmwKZt30/vt/lqHVXJkWZkKUabi356zTyoYK5tAHgtSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=weOk10MDBUQYhj0gbqxOz2vJzRheG88GF4qAUMkOjcY=;
 b=Pbg0b2q2dPwqhpkS54wgRPCF4lcRTYx7S5EIx1DW++/6sfD8/oaFbyCNCWHiaomp3UN5g4HT9tLfDRzSv0ND6zjQ/zKl6wHExk5zwfPJXc8wuuuUgNtzxs7IYw6rQLNsarOAYs8BGDH1InNP9mqp/2qc+K15GVN+bmTJtgrUkbfWczW1lcjdzcTbJ3QVTeY21aPautZBzFF2XwOhUu2lgRoLCyKMlnaqBNigl3G2ZkgbgzDxISGr56XO1YOeB3vQmsiG5VCviGCQtysflRev4WMPdAgaFkHRECuYsDYoKw/wWaCEYHMfQ7mFmi4M6EDZM2PiGKi0IGEkY4zyzpZgGw==
Received: from BN7PR06CA0061.namprd06.prod.outlook.com (2603:10b6:408:34::38)
 by PH8PR12MB6892.namprd12.prod.outlook.com (2603:10b6:510:1bc::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 20:39:26 +0000
Received: from SN1PEPF000252A1.namprd05.prod.outlook.com
 (2603:10b6:408:34:cafe::14) by BN7PR06CA0061.outlook.office365.com
 (2603:10b6:408:34::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Mon, 14 Aug 2023 20:39:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF000252A1.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.12 via Frontend Transport; Mon, 14 Aug 2023 20:39:26 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Mon, 14 Aug 2023
 13:39:14 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Mon, 14 Aug 2023 13:39:12 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <ilpo.jarvinen@linux.intel.com>,
        <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next v2 16/16] Documentation/ABI: Add new attribute for mlxreg-io sysfs interfaces
Date:   Mon, 14 Aug 2023 20:34:06 +0000
Message-ID: <20230814203406.12399-17-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230814203406.12399-1-vadimp@nvidia.com>
References: <20230814203406.12399-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.37]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A1:EE_|PH8PR12MB6892:EE_
X-MS-Office365-Filtering-Correlation-Id: fbde4f03-00a8-4201-39e8-08db9d068d0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aoI99PQC0ric2hoP2K0yqlw6wRq2yw53fdS0KDu5bTHAeotF/zYxxOxVNJ1Z+4MtovvQroVN50Sjtw2ezxncKdc06xxAkhCuT+YU+2TH9TawaZaXQq2n1gGdblg3jQxqElJKzJLEguiHWF1vt3R19BbOsxZAlmF9cAo5kwLPKqYpzFtb9UZr7FWR9Pk3yNYvMAh+n8EKnjyDVEeMiLsBoUw0gQhmX4Oxw2YpI+/7uMjbRGH3X2y8RExh+AjcgS+2AgfEFgDh0PN2CVK7/3fXAWlKlToczMgTrVnJmuvakCunJ4Cr+f4Myc91N0iHacjdPDyezOSk4iLjOWAULi3cIyTWJoFe1eRv3cspma2WW5MTBwkXAShaYE2b3txJC0/gGU8frqxkc23M8+f7GYbYY1YO4TKYsrWF0SQw0kk/X+B7vDzbyoIuu5RiaMTQ84yNAr02ok7/cZd4ZaylA1VLDavwJcUI59uijFI1HvGyPs9CJf4DU7PdH58wuq544pcC2VOC0Lf2s0PePdDADNf5hHnHqyIpxO5nKB3zjFrdI/kPWhaX13E18Lp0AB3QmV7OJiGtxO60sS+023Y9XbL0xVNHeDMRdJZdYjurFOellMGntJsvfpQEj1S2qL6gInCTMPSPQMo9XzB4nVlIPsWzcZxYoO+gAWUJ97CeN7FA4Pc9/J1mQmVElGN93B6cxtct9Qqa8ZxLk1pmLTSbUBv4rIE6nnC9VZTwUjGpfC9kgqA2ksWr+7Da87aGZ2XpKWc1
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(136003)(39860400002)(346002)(186006)(1800799006)(82310400008)(451199021)(46966006)(40470700004)(36840700001)(83380400001)(336012)(426003)(36756003)(47076005)(36860700001)(86362001)(40480700001)(41300700001)(82740400003)(478600001)(356005)(7636003)(54906003)(70206006)(70586007)(6916009)(316002)(8676002)(8936002)(5660300002)(4326008)(40460700003)(2616005)(16526019)(1076003)(107886003)(26005)(6666004)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 20:39:26.3535
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fbde4f03-00a8-4201-39e8-08db9d068d0e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6892
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

