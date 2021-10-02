Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 273C7C433EF
	for <platform-driver-x86@archiver.kernel.org>; Sat,  2 Oct 2021 09:33:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0EFDD61A6F
	for <platform-driver-x86@archiver.kernel.org>; Sat,  2 Oct 2021 09:33:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232746AbhJBJfE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 2 Oct 2021 05:35:04 -0400
Received: from mail-dm6nam10on2081.outbound.protection.outlook.com ([40.107.93.81]:46625
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232655AbhJBJfE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 2 Oct 2021 05:35:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hejYjMNQG7omCJ2YeagpXF2UJWsURdhkP7sftOvS00zVMfRRMutvXJlYumi6ZBy4saloDOinmp4YlZbM4hgifnG1gczGOfKi1PUa3rTdaPKmvHj5DhCBYAgFoRfNCpwwGCTWQ5HAOr9eMYP2Lv3a7oOmTZfHgnqAFTG8Ys1tkRQDPSt5DygJTSWSC0ziWezZm1O9zmU8dlf9eTgt//6xY0yb1U0W7RPqHd2rdTbJ6OH/CZWL1BR8ujQ+/nhCzfgUuMQGv8+2cEWVnX4vAur8Yi+R81FRVBFmaGZ74ZbHill9B0YECUwvly5dlo1lbgcrehj3sdz+RCOa0zjF1L4hQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UAtqnsG5C6yGgs73Txq9hJb++M0EoJCC2tK4uhdI5iI=;
 b=ZhC5jzh3yqfftWFTZVUzlu8aYuMddiO/6u+ZxJPZhNV3gkDpa7FSsJQutmCxVcX4uDw1NEUmw59DzDn8+Py8RXjpNrXHcCpBZL1cQwk9G6MPkh/ya1Ka6Ifzhudkv29fZoX8XbjiVv0jLExmBQqklsj2TTBVj/7kubYB3K6tB8vns12+lk4uJHLhO01mRw/yALkU2MaQAO8dMzzoumz4/Vcdpay0hawh6GmDK1ty8KfweIJGw3zw0snRO+eFGGutiFPFQUpR5glI+NW4mgK448gzCnnRPt+4vvaeLbFwUw4KUYChzyO+dZhsMkhKhIHsgAnvN58leUoBAbaTqYuaBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UAtqnsG5C6yGgs73Txq9hJb++M0EoJCC2tK4uhdI5iI=;
 b=jusX3oCXhoOU/bZ8c/5PxULWyhtC3wsFqhJsmbCAuqbi82KT9EOF+gCq0ZLZ9ffCfyiVrHxFnwdpUN/RZngWYUHV/zfzSYfCEMbTQQgNMxZcg1TeEqL8i2e6j474iAbg7B46hZuXmgltNfPOymrheGajyFG3ok2VQCUFc9NDZbU62CUTOESbw34JXWOIB8TbUb/UAMsbcNcG6QAWd+NliUhNOjFU/znGLvhAkyimlcrA3BlAYwbYm4XKpNRf5pP/bF9+H+LE6Zxp+vUBVdj5idiCRh5Q33XHjwj2FoFOQVKVoGuYB7sh+T7WYEnNJ9NjIIHyooLI8wJLFaYgnIId4Q==
Received: from MW2PR2101CA0006.namprd21.prod.outlook.com (2603:10b6:302:1::19)
 by BYAPR12MB3062.namprd12.prod.outlook.com (2603:10b6:a03:aa::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.19; Sat, 2 Oct
 2021 09:33:17 +0000
Received: from CO1NAM11FT033.eop-nam11.prod.protection.outlook.com
 (2603:10b6:302:1:cafe::2d) by MW2PR2101CA0006.outlook.office365.com
 (2603:10b6:302:1::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.1 via Frontend
 Transport; Sat, 2 Oct 2021 09:33:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT033.mail.protection.outlook.com (10.13.174.247) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4566.14 via Frontend Transport; Sat, 2 Oct 2021 09:33:16 +0000
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.187.6) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1497.18; Sat, 2 Oct 2021 09:33:14 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>, <michaelsh@nvidia.com>,
        "Vadim Pasternak" <vadimp@nvidia.com>
Subject: [PATCH platform-next 08/10] Documentation/ABI: Add new attributes for mlxreg-io sysfs interfaces
Date:   Sat, 2 Oct 2021 12:32:37 +0300
Message-ID: <20211002093238.3771419-9-vadimp@nvidia.com>
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
X-MS-Office365-Filtering-Correlation-Id: 6e9a8a7e-0a1c-4e17-fe9f-08d98587a9da
X-MS-TrafficTypeDiagnostic: BYAPR12MB3062:
X-Microsoft-Antispam-PRVS: <BYAPR12MB30628C3787DB2AFA94B84435AFAC9@BYAPR12MB3062.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rYwGfwbIeN1ar3gDWe04NKnhzqFeg4QCEgjsrZQABcQNDLc2ryVnlAEnmmtIg0YKR03yB65WycJ5fzfQ2E2rSeKgLTVLlApb092DJ8xKQ7mkk61mL1Tf5wSIm9l+4/7A9ws3W+JGGB75EbONZ62s1QFy9HnBMvG4NcYbqJLUDK5B5OHVMlXW6DPeiPQZ2pUlsKOWETFM+JIH8PcgJGdGF4xhmI+cEiGPIlggVS4dhvWu0MDfDFwCI6qSl0rkq3s/DmPOb3S1iH0HxRPUO193ixOLZFVxhYzEuAfHLyYoKYiegJuX5DChMz5gjIoNoLSMdbSxSdz/NYXs2pE7htfxYkZroVYYR57hnLpAEGl3Zr1bcC/U5E2mE/fC8+wQrwcnkabmRu4p9Ld+EgTfnXSbwntGWfn5kmnbpX8Tw1bb8RHqPbwH1DwYgnAcDysbKf5PBDVpAToAjJUtqmRiTgu0RgqII/JGarXtIz7DALfJa+Z+AHHIiewxICuy2Bs9DU71BwO9Y6uANaNnYaelzVAua10XR3r+BEf+erp8liAzHTkEKuSGYA/mUxMsem+leMn6o23u/JDGWBi1ba61In+s1r3rJii2Tqrw46IT02QEDZCzCaJJ3JQ7nfOb8u440W1Ikd6//YiYvcZ3GJYoH4sS9wciy09EoqAdxE6arremsRBbKY0r1JqmWktSZU1EUjatNJx5wqU9w7W7k4j9JSv31A==
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(36860700001)(1076003)(82310400003)(6916009)(316002)(2906002)(86362001)(426003)(8936002)(8676002)(336012)(70206006)(70586007)(356005)(508600001)(6666004)(2616005)(4326008)(16526019)(186003)(83380400001)(36756003)(47076005)(26005)(7636003)(54906003)(5660300002)(107886003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2021 09:33:16.5243
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e9a8a7e-0a1c-4e17-fe9f-08d98587a9da
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT033.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3062
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add documentation for the new attributes:
- "bios_active_image"; "bios_auth_fail"; "bios_upgrade_fail";
  "bios_safe_mode" to represent various BIOS statuses.
- "lc{n}_enable" - for put/release the line card to/from enable state.
- "lc{n}_pwr" - for power on/off the line card.
- "lc{n}_rst_mask" - for line card reset state enforced by ASIC, when
  it sets it due to some abnormal ASIC behavior.
- "psu3_on"; "psu4_on" - for connection/disconnection power supply unit
  to/from the power source.
- "pm_mgmt_en" - for setting power management control ownership. When
  power management control is provided by hardware, it means that
  hardware will automatically power off one or more line cards in case
  system power budget is under power required for feeding all powered
  on line cards. It could be a case, when some of power units lost
  power good state.
- "shutdown_unlock" - for unlocking system after hardware or firmware
  thermal shutdown, which causes locking of the all interfaces to ASIC.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
---
 .../ABI/stable/sysfs-driver-mlxreg-io         | 138 ++++++++++++++++++
 1 file changed, 138 insertions(+)

diff --git a/Documentation/ABI/stable/sysfs-driver-mlxreg-io b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
index b2553df2e786..6ef6979c9448 100644
--- a/Documentation/ABI/stable/sysfs-driver-mlxreg-io
+++ b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
@@ -223,3 +223,141 @@ Description:	These files show with which CPLD part numbers and minor
 		system.
 
 		The files are read only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/bios_active_image
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/bios_auth_fail
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/bios_upgrade_fail
+Date:		October 2021
+KernelVersion:	5.16
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	The files represent BIOS statuses:
+		- bios_active_image: location of current active BIOS image:
+		  0: Top, 1: Bottom.
+		  The reported value should correspond to value expected by OS
+		  in case of BIOS safe mode is 0. This bit is related to Intel
+		  top-swap feature of DualBios on the same flash.
+		- bios_auth_fail: BIOS upgrade is failed because provided BIOS
+		  image is not signed correctly.
+		- bios_upgrade_fail: BIOS upgrade is failed by some other
+		  reason not because authentication. For example due to
+		  physical SPI flash problem.
+
+		The files are read only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc1_enable
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc2_enable
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc3_enable
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc4_enable
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc5_enable
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc6_enable
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc7_enable
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc8_enable
+Date:		October 2021
+KernelVersion:	5.16
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	These files allow line cards enable state control.
+		Expected behavior:
+		When  lc{n}_enable is written 1, related line card is released
+		from the reset state, when 0 - is hold in reset state.
+
+		The files are read/write.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc1_pwr
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc2_pwr
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc3_pwr
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc4_pwr
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc5_pwr
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc6_pwr
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc7_pwr
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc8_pwr
+Date:		October 2021
+KernelVersion:	5.16
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	These files switching line cards power on and off.
+		Expected behavior:
+		When  lc{n}_pwr is written 1, related line card is powered
+		on, when written 0 - powered off.
+
+		The files are read/write.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc1_rst_mask
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc2_rst_mask
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc3_rst_mask
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc4_rst_mask
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc5_rst_mask
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc6_rst_mask
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc7_rst_mask
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc8_rst_mask
+Date:		October 2021
+KernelVersion:	5.16
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	These files clear line card reset bit enforced by ASIC, when it
+		sets it due to some abnormal ASIC behavior.
+		Expected behavior:
+		When lc{n}_rst_mask is written 1, related line card reset bit
+		is cleared, when written 0 - no effect.
+
+		The files are write only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/os_started
+Date:		October 2021
+KernelVersion:	5.16
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	This file, when written 1, indicates to programmable devices
+		that OS is taking control over it.
+
+		The file is read/write.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/pm_mgmt_en
+Date:		October 2021
+KernelVersion:	5.16
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	This file assigns power management control ownership.
+		When power management control is provided by hardware, hardware
+		will automatically power off one or more line previously
+		powered line cards in case system power budget is getting
+		insufficient. It could be in case when some of power units lost
+		power good state.
+		When pm_mgmt_en is written 1, power management control by
+		software is enabled, 0 - power management control by hardware.
+		Note that for any setting of pm_mgmt_en attribute hardware will
+		not allow to power on any new line card in case system power
+		budget is insufficient.
+		Same in case software will try to power on several line cards
+		at once - hardware will power line cards while system has
+		enough power budget.
+		Default is 0.
+
+		The file is read/write.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/psu3_on
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/psu4_on
+Date:		October 2021
+KernelVersion:	5.16
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	These files switching power supply units on and off.
+		Expected behavior:
+		When  psu3_on or psu4_on is written 1, related unit will be
+		disconnected from the power source, when written 0 - connected.
+
+		The files are write only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/shutdown_unlock
+Date:		October 2021
+KernelVersion:	5.16
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	This file allows to unlock ASIC after thermal shutdown event.
+		When system thermal shutdown is enforced by ASIC, ASIC is
+		getting locked and after system boot it will not be available.
+		Software can decide to unlock it by setting this attribute to
+		1 and then perform system power cycle by setting pwr_cycle
+		attribute to 1 (power cycle of main power domain).
+		Before setting shutdown_unlock to 1 it is recommended to
+		validate that system reboot cause is reset_asic_thermal or
+		reset_thermal_spc_or_pciesw.
+		In case shutdown_unlock is not set 1, the only way to release
+		ASIC from locking - is full system power cycle through the
+		external power distribution unit.
+		Default is 1.
+
+		The file is read/write.
-- 
2.20.1

