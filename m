Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1F72C433EF
	for <platform-driver-x86@archiver.kernel.org>; Sat,  2 Oct 2021 09:33:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D768461353
	for <platform-driver-x86@archiver.kernel.org>; Sat,  2 Oct 2021 09:33:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232747AbhJBJfG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 2 Oct 2021 05:35:06 -0400
Received: from mail-bn8nam11on2080.outbound.protection.outlook.com ([40.107.236.80]:44512
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232655AbhJBJfG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 2 Oct 2021 05:35:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SHWiWKnrP6Xe1T56KEoPnPA98yQMygbmlMv9k+EJLK+q5Vj7r/h506rkg203EC9+LWLRcyU3GuT9mCAJbmYbjuKds2eUxixFxOh2he0UUoLqRuKpPDE09KPxVJrG+OwajpNml9EEcClQ/ncSiCKLmlxqycjkwElsYaa2ypPtZltgKcQO4Y5TaJ0m3iDShVRxrvllHuIOd8HzSHpRmIg9SxsJWvf9GnCBvvJ+nAKY8b5eoBTV8qc4B8CxVh+0FyDR1/EyRmkzj96Az6ZRSz5E9EBjuxukX/yfeV52H3Ib7ZjFDUTqyJAn8rA5Hu0PclAq9eM73UOLiDnl4eL5jtIgJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dQA6wCE6H2kNehL02hII5bAIopSj1RO47PSuKSRtPsw=;
 b=MdH1Zrx/enjWPOzGnXgkBjFs1InRrmZ6Zl6P9MlcdyB2vm2D8hwMjofoeaOWDpq3J7H4p061p2dV1rUP2vfduf5BWQ9SYG3hni8vwKLEwQVoPX2USGvNnqC7dQZY3Uw6zANKUFQzR18wWX45vqqRqESvWCxINo+6vMIT+h/uEssKSXeEKZmGLZzmtXiQ2EDbHy387iYV4ojtE1Kv7S2m5vxyuHwN0RLpNr7P1Thp57jPMD0+rPRIBTQ2yGmXH/8KEKCHSdOUJUPy6kMNiQ2WC2axKS06fq3JmcOBwmNy8yrli+v4OkK+Qcyv50+iLhO7lgOkkw1e7czmz2gOtBIeHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dQA6wCE6H2kNehL02hII5bAIopSj1RO47PSuKSRtPsw=;
 b=fD1uMI7VmM/D625adtt6qwE8WkUGWoWSnoUX7TsVG9+EvZTZHIEM7XasW/x+YqKk4y7L4K/umSLxITXP0WF/h75PrEIYzcUW/S+tJW4c2zbTbFXsPpSggl028h7jBY7tKzZa1sc7vo0+DfsutKnolD31zdnVVxoRKQN3IDbJcdTZQLJfs0v3mexMsghvIwywMl0BoZKUXLq9zQskUg0UVxImc6eLIQrUR2JMtGdboWiBv5Fr7QY70m8VbhoszRljCf/XHBYg4hxcSp7Yvb5imPVGUj1r8KobviY9ptP1qbaF3t9q43Z7c7a+LEkJATHW6Vvs0JQwkyrw4BIWLjcy3A==
Received: from MW2PR2101CA0016.namprd21.prod.outlook.com (2603:10b6:302:1::29)
 by MN2PR12MB4800.namprd12.prod.outlook.com (2603:10b6:208:3c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.19; Sat, 2 Oct
 2021 09:33:19 +0000
Received: from CO1NAM11FT033.eop-nam11.prod.protection.outlook.com
 (2603:10b6:302:1:cafe::90) by MW2PR2101CA0016.outlook.office365.com
 (2603:10b6:302:1::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.0 via Frontend
 Transport; Sat, 2 Oct 2021 09:33:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT033.mail.protection.outlook.com (10.13.174.247) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4566.14 via Frontend Transport; Sat, 2 Oct 2021 09:33:18 +0000
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.187.6) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1497.18; Sat, 2 Oct 2021 09:33:17 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>, <michaelsh@nvidia.com>,
        "Vadim Pasternak" <vadimp@nvidia.com>
Subject: [PATCH platform-next 09/10] Documentation/ABI: Add new line card attributes for mlxreg-io sysfs interfaces
Date:   Sat, 2 Oct 2021 12:32:38 +0300
Message-ID: <20211002093238.3771419-10-vadimp@nvidia.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211002093238.3771419-1-vadimp@nvidia.com>
References: <20211002093238.3771419-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 549dc131-41fd-4098-b48e-08d98587ab01
X-MS-TrafficTypeDiagnostic: MN2PR12MB4800:
X-Microsoft-Antispam-PRVS: <MN2PR12MB48004F4FB53907C012F92423AFAC9@MN2PR12MB4800.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OOAwgNVpcvSzcVxR20N2sym29bo5r8X7wRQQXYfWwR+JBffYZD0bmVgwQGqvlQN+zCPWw7PyPxtPfZiLnA40JkbEmnl9BJcJVQzKxBvai49PsMep2FnpZo1pD4GslZDf9CHaOBzssCbZil7v9lyM69OTQySUzLrr9EMWJ+Wmk7NFgebE7xZJwr0rnmoCD1wqwIUKf1ZZgXZffAGeot2C8wrmbgCsaL98DwvexfUgmaw36LlodvVOJ2IgqfwrOz1qyDvlkGlBn5D0I0ffewYmKSMdY7IhA2t8yToUXUKICH2GxDfnXWDy59PVhvhTJk6+iUaA5L8nMhbK5IgoimGIkyoowTAsoP37ugJ6AGVqyURbpo5jVyZYX1xR2PSuANKdegOYqK/WLVTgLsEeaU7LdX06gqrZRi8hrvukOO5Fx6DvY7z6Hoh5TsrK/gPEwP7pw/QsfkrQxw0ZNszmPL111x1u5vHhwr/P6PrnBAy1unCraOB6du56nmmWwaygxPt16YrD5Ke0ITeKDaVk8BRnbVZRosSx8nh4wptswf6v/1vtvroPMINiTDJtpR+uZ2ol0BEKDYJsqbZmQJG2qa/0apvG7SZmNdBEh8QCMLb7ILSe9ns3lmkrX/hljXigp58OK6wwcmOTdIf6T3im79oFGnRhu/fJWtSU1pXPHRBGjwXve4dD8Q1CKDaVREdWzFAuXIYU5j/L5FNzCSvURcS7IQ==
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(508600001)(107886003)(70206006)(83380400001)(36860700001)(26005)(70586007)(36756003)(2616005)(8676002)(6666004)(426003)(47076005)(186003)(4326008)(16526019)(336012)(8936002)(1076003)(2906002)(54906003)(82310400003)(86362001)(356005)(6916009)(5660300002)(316002)(7636003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2021 09:33:18.4647
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 549dc131-41fd-4098-b48e-08d98587ab01
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT033.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4800
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add documentation for the new attributes for line cards:
- CPLDs versioning.
- Write protection control for 'nvram' devices.
- Line card reset reasons.
- Enabling burning of FPGA and CPLDs.
- Enabling burning of FPGA and gearbox SPI flashes,
- Enabling power of whole line card.
- Enabling power of QSFP ports equipped on line card.
- The maximum powered required for line card feeding.
- Line card configuration Id.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
---
 .../ABI/stable/sysfs-driver-mlxreg-io         | 103 ++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/Documentation/ABI/stable/sysfs-driver-mlxreg-io b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
index 6ef6979c9448..b25e963ec0fa 100644
--- a/Documentation/ABI/stable/sysfs-driver-mlxreg-io
+++ b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
@@ -361,3 +361,106 @@ Description:	This file allows to unlock ASIC after thermal shutdown event.
 		Default is 1.
 
 		The file is read/write.
+
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/cpld1_pn
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/cpld1_version
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/cpld1_version_min
+Date:		October 2021
+KernelVersion:	5.16
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	These files show with which CPLD major and minor versions
+		and part number has been burned CPLD device on line card.
+
+		The files are read only.
+
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/fpga1_pn
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/fpga1_version
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/fpga1_version_min
+Date:		October 2021
+KernelVersion:	5.16
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	These files show with which FPGA major and minor versions
+		and part number has been burned FPGA device on line card.
+
+		The files are read only.
+
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/vpd_wp
+Date:		October 2021
+KernelVersion:	5.16
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	This file allow to overwrite line card VPD hardware write
+		protection mode. When attribute is set 1 - write protection is
+		disabled, when 0 - enabled.
+		Default is 0.
+ 		If the system is in locked-down mode writing this file will not
+		be allowed.
+		The purpose if this file is to allow line card VPD burning
+		during production flow.
+
+		The file is read/write.
+
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/reset_aux_pwr_or_ref
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/reset_dc_dc_pwr_fail
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/reset_fpga_not_done
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/reset_from_chassis
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/reset_line_card
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/reset_pwr_off_from_chassis
+Date:		October 2021
+KernelVersion:	5.16
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	These files show the line reset cause, as following: power
+		auxiliary outage or power refresh, DC-to-DC power failure, FPGA reset
+		failed, line card reset failed, power off from chassis.
+		Value 1 in file means this is reset cause, 0 - otherwise. Only one of
+		the above causes could be 1 at the same time, representing only last
+		reset cause.
+
+		The files are read only.
+
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/cpld_upgrade_en
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/fpga_upgrade_en
+Date:		October 2021
+KernelVersion:	5.16
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	These files allow CPLD and FPGA burning. Value 1 in file means burning
+		is enabled, 0 - otherwise.
+ 		If the system is in locked-down mode writing these files will
+		not be allowed.
+		The purpose of these files to allow line card CPLD and FPGA
+		upgrade through the JTAG daisy-chain.
+
+		The files are read/write.
+
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/qsfp_pwr_en
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/pwr_en
+Date:		October 2021
+KernelVersion:	5.16
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	These files allow to power on/off all QSFP ports and whole line card.
+		The attributes are set 1 for power on, 0 - for power off.
+
+		The files are read/write.
+
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/agb_spi_burn_en
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/fpga_spi_burn_en
+Date:		October 2021
+KernelVersion:	5.16
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	These files allow gearboxes and FPGA SPI flash burning.
+		The attributes are set 1 to enable burning, 0 - to disable.
+ 		If the system is in locked-down mode writing these files will
+		not be allowed.
+		The purpose of these files to allow line card Gearboxes and FPGA
+		burning during production flow.
+
+		The file is read/write.
+
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/max_power
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/config
+Date:		October 2021
+KernelVersion:	5.16
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	These files provide the maximum powered required for line card
+		feeding and line card configuration Id.
+
+		The files are read only.
-- 
2.20.1

