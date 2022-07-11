Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4DF4C43334
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Jul 2022 08:48:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229934AbiGKIsc (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Jul 2022 04:48:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230249AbiGKIsW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Jul 2022 04:48:22 -0400
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1anam02on2087.outbound.protection.outlook.com [40.107.96.87])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 126AF21819
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Jul 2022 01:48:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WZDLH1mRacROXUmfEKpS0+WMyJX9HOVbMqAujSuFYljtpD1fkkK5OoRonvgOXXZ94iYfoeXIf4xqgp9XI9rpwOzieNU/hODkBynDRHTI8tHnW1PZ1eUaMFfmTQEctMI771N+fAfu8BV+dFVqtFWpVYFh8c1cG0wCtl+8KTd9WyXYFMMQz1pR2+4QW7wIJ9bZvbBcunONn5rPbKLQApwhWi7itASt68wlznCKOhgue9QLNoImrU4MyxKiLsojQRdBQIn0YbudxIjSnYXpXtKtl+1+Pd3TavzWbT4Ww/o/P+JxuDeqXO/m9CO6NVYsCgKprgJPZkeyuRLoGbaQu9fBuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cr6zSL21C9NeY9zRCiXFXMDn5InyiRXP65KEp2DLeZU=;
 b=oCDjNykJW2DuAmVCE+z+Sb1F+/hIQxUva4eIC9gxtTedeEqRjB33wzdAHEQN2k0mZRehPVOWO6NQSnSD1ZVJi2nOinl/NU/wdiT1rQckZZhK0mIlSfjNAEPeYF+kVED/CvM19fQqgghfg6LZ8lhH8ScyWmWO5UTsPiU4ifjaE92GSHwYz1OP2U1XWqDCLMY5R7YEpQCLYCy/6rpjss7IXWs7tug/6+8HrZpTsk3p7Be3R5KiJahQmxJh8ZQnEv5NVbBDLW6XiDPXYX4lUTQ5UPdD72GsU9Hu6Y5ciCSjdTEHb49CX3fO3+eIFOdNGTEWjmZJyJVWgn5ZKd63cViAIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.238) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cr6zSL21C9NeY9zRCiXFXMDn5InyiRXP65KEp2DLeZU=;
 b=EnLkJUNbfWlgEEm03B2hIFlLmBxs2bmrcEsI2+OJObf7BBcjZ98vMxvwdsdEjuWTJxydK7eFaKyprXefjKVCqQpMT3R9iK4IDqgS+GH/2UkUspKwGfZXdsrKFCOeugp0sp43LD97+p+dGwbj230kpvUXayr2OVkdLAFA4f+s/gkITNRs7OSyaXTVLXiOEpLRyfxq5YQzJXy1cY6tuY4PWSDoLoRLXnkXu59nOWJo7WRR8V6qhTFVxvRGl0ywAZDC7mUhzVwFsN5yMkMDgksWqlzxB/04V3zbi1NTu6hXTIQ8CD6nWRycjTAEGAyf38psyLkMX8gjnjpeoivTwb0Z5Q==
Received: from BN9PR03CA0434.namprd03.prod.outlook.com (2603:10b6:408:113::19)
 by SJ1PR12MB6196.namprd12.prod.outlook.com (2603:10b6:a03:456::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Mon, 11 Jul
 2022 08:48:02 +0000
Received: from BN8NAM11FT054.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:113:cafe::e9) by BN9PR03CA0434.outlook.office365.com
 (2603:10b6:408:113::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.19 via Frontend
 Transport; Mon, 11 Jul 2022 08:48:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.238)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.238 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.238; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.238) by
 BN8NAM11FT054.mail.protection.outlook.com (10.13.177.102) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5417.15 via Frontend Transport; Mon, 11 Jul 2022 08:48:02 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL105.nvidia.com
 (10.27.9.14) with Microsoft SMTP Server (TLS) id 15.0.1497.32; Mon, 11 Jul
 2022 08:48:01 +0000
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.26; Mon, 11 Jul 2022 01:47:59 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next 8/9] Documentation/ABI: mlxreg-io: Fix contact info
Date:   Mon, 11 Jul 2022 11:45:58 +0300
Message-ID: <20220711084559.62447-9-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220711084559.62447-1-vadimp@nvidia.com>
References: <20220711084559.62447-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 74560e5f-6382-49c7-83ae-08da631a10a6
X-MS-TrafficTypeDiagnostic: SJ1PR12MB6196:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ofabINc5utVpJm+VHnmd77sVA3EoN5+31qZRsUmOm7FTxsf1Y2oOSykl7pnOj23EV36RT0xWL0qFwusHtiqKsOglhsMpFXwomy0wAfHPWfyHNg6wsrGwsMJRYm37KUtH3SdQ2Gq4QTC+SakCZdj66nhE9+ch5ikhMjONTLT6uqwJ+UWiVzvr1ZvEWrmZgsfdKpiFyIeZwImwkTGLaeqJfng5cxnBfJEOME+ip2urjICHcI2NbmLjleA5/6r9wSaSjnd7fE2L8wXW4IZdC2ITpohKQ5CylBR5ZNWbEl4nzDGNinjK7nDCRT2JicU30c0/8KW9ulq+T6JompQ4BtUfzwJpGgsLh5Ta1PyBQZEtHAYpPvpobohKnhqxEI3xkDsMX93DgcnI9as51C8wQMp3i3bccISlr7iNu/gMoK5+YSoO09FbCsAUQylsWINQY99K60DXDbyOavB4zCp8D0b8r2Eq4kB+KZNLY1IYAIQVG78ZK9563Am5DMZuf4gEV36rPWHhMgOFSsmb8MCLLw/GGfluD9wH/SwOhUqR01/NwsrTiLBml3dr67LU7w2vtBRUUQivc1XzjNxLtu6FhvL29ic7UtoQrQEJlvYroCnbsaYnSrIkWdfWMlzMQrCv0xn5KTeYpwFFzY7Ql6v8cI90KeH4pSz2JqjW6hBG1PY0bb1u8E9EaCSOL5KCjdYP/KzYV0ZZqO4XKiyeSnCf8nlWSxSir46Nbk+d/lex0BdKsRBhJyRJEmFPWOJp23/AcPzQqLlNtmOklXT5IyAdVRlQi+tdzxpKAyjYZm1jv2FOEP2Pv8aP1hRYv58+wLJz+l8Y372xUTuNYVILpRjv2WR7cmRqt6JfLS2hmub4m0EEzWg=
X-Forefront-Antispam-Report: CIP:12.22.5.238;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(346002)(136003)(396003)(40470700004)(36840700001)(46966006)(82310400005)(36860700001)(86362001)(40460700003)(356005)(8936002)(82740400003)(81166007)(41300700001)(2906002)(5660300002)(478600001)(316002)(83380400001)(4326008)(70206006)(8676002)(6916009)(54906003)(70586007)(336012)(186003)(47076005)(16526019)(426003)(40480700001)(2616005)(26005)(1076003)(107886003)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2022 08:48:02.3338
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74560e5f-6382-49c7-83ae-08da631a10a6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.238];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT054.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6196
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Fix e-mail in contact fields.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 .../ABI/stable/sysfs-driver-mlxreg-io         | 42 +++++++++----------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/Documentation/ABI/stable/sysfs-driver-mlxreg-io b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
index b312242d4f40..3539b1839829 100644
--- a/Documentation/ABI/stable/sysfs-driver-mlxreg-io
+++ b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
@@ -1,7 +1,7 @@
 What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/asic_health
 Date:		June 2018
 KernelVersion:	4.19
-Contact:	Vadim Pasternak <vadimpmellanox.com>
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
 Description:	This file shows ASIC health status. The possible values are:
 		0 - health failed, 2 - health OK, 3 - ASIC in booting state.
 
@@ -11,7 +11,7 @@ What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld1_version
 What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld2_version
 Date:		June 2018
 KernelVersion:	4.19
-Contact:	Vadim Pasternak <vadimpmellanox.com>
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
 Description:	These files show with which CPLD versions have been burned
 		on carrier and switch boards.
 
@@ -20,7 +20,7 @@ Description:	These files show with which CPLD versions have been burned
 What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/fan_dir
 Date:		December 2018
 KernelVersion:	5.0
-Contact:	Vadim Pasternak <vadimpmellanox.com>
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
 Description:	This file shows the system fans direction:
 		forward direction - relevant bit is set 0;
 		reversed direction - relevant bit is set 1.
@@ -30,7 +30,7 @@ Description:	This file shows the system fans direction:
 What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld3_version
 Date:		November 2018
 KernelVersion:	5.0
-Contact:	Vadim Pasternak <vadimpmellanox.com>
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
 Description:	These files show with which CPLD versions have been burned
 		on LED or Gearbox board.
 
@@ -39,7 +39,7 @@ Description:	These files show with which CPLD versions have been burned
 What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/jtag_enable
 Date:		November 2018
 KernelVersion:	5.0
-Contact:	Vadim Pasternak <vadimpmellanox.com>
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
 Description:	These files enable and disable the access to the JTAG domain.
 		By default access to the JTAG domain is disabled.
 
@@ -48,7 +48,7 @@ Description:	These files enable and disable the access to the JTAG domain.
 What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/select_iio
 Date:		June 2018
 KernelVersion:	4.19
-Contact:	Vadim Pasternak <vadimpmellanox.com>
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
 Description:	This file allows iio devices selection.
 
 		Attribute select_iio can be written with 0 or with 1. It
@@ -62,7 +62,7 @@ What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/psu1_on
 		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/pwr_down
 Date:		June 2018
 KernelVersion:	4.19
-Contact:	Vadim Pasternak <vadimpmellanox.com>
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
 Description:	These files allow asserting system power cycling, switching
 		power supply units on and off and system's main power domain
 		shutdown.
@@ -89,7 +89,7 @@ What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_short_pb
 What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_sw_reset
 Date:		June 2018
 KernelVersion:	4.19
-Contact:	Vadim Pasternak <vadimpmellanox.com>
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
 Description:	These files show the system reset cause, as following: power
 		auxiliary outage or power refresh, ASIC thermal shutdown, halt,
 		hotswap, watchdog, firmware reset, long press power button,
@@ -106,7 +106,7 @@ What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_system
 What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_voltmon_upgrade_fail
 Date:		November 2018
 KernelVersion:	5.0
-Contact:	Vadim Pasternak <vadimpmellanox.com>
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
 Description:	These files show the system reset cause, as following: ComEx
 		power fail, reset from ComEx, system platform reset, reset
 		due to voltage monitor devices upgrade failure,
@@ -119,7 +119,7 @@ Description:	These files show the system reset cause, as following: ComEx
 What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld4_version
 Date:		November 2018
 KernelVersion:	5.0
-Contact:	Vadim Pasternak <vadimpmellanox.com>
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
 Description:	These files show with which CPLD versions have been burned
 		on LED board.
 
@@ -133,7 +133,7 @@ What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_sff_wd
 What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_swb_wd
 Date:		June 2019
 KernelVersion:	5.3
-Contact:	Vadim Pasternak <vadimpmellanox.com>
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
 Description:	These files show the system reset cause, as following:
 		COMEX thermal shutdown; wathchdog power off or reset was derived
 		by one of the next components: COMEX, switch board or by Small Form
@@ -148,7 +148,7 @@ What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/config1
 What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/config2
 Date:		January 2020
 KernelVersion:	5.6
-Contact:	Vadim Pasternak <vadimpmellanox.com>
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
 Description:	These files show system static topology identification
 		like system's static I2C topology, number and type of FPGA
 		devices within the system and so on.
@@ -161,7 +161,7 @@ What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_soc
 What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_sw_pwr_off
 Date:		January 2020
 KernelVersion:	5.6
-Contact:	Vadim Pasternak <vadimpmellanox.com>
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
 Description:	These files show the system reset causes, as following: reset
 		due to AC power failure, reset invoked from software by
 		assertion reset signal through CPLD. reset caused by signal
@@ -173,7 +173,7 @@ Description:	These files show the system reset causes, as following: reset
 What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/pcie_asic_reset_dis
 Date:		January 2020
 KernelVersion:	5.6
-Contact:	Vadim Pasternak <vadimpmellanox.com>
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
 Description:	This file allows to retain ASIC up during PCIe root complex
 		reset, when attribute is set 1.
 
@@ -182,7 +182,7 @@ Description:	This file allows to retain ASIC up during PCIe root complex
 What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/vpd_wp
 Date:		January 2020
 KernelVersion:	5.6
-Contact:	Vadim Pasternak <vadimpmellanox.com>
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
 Description:	This file allows to overwrite system VPD hardware write
 		protection when attribute is set 1.
 
@@ -191,7 +191,7 @@ Description:	This file allows to overwrite system VPD hardware write
 What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/voltreg_update_status
 Date:		January 2020
 KernelVersion:	5.6
-Contact:	Vadim Pasternak <vadimpmellanox.com>
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
 Description:	This file exposes the configuration update status of burnable
 		voltage regulator devices. The status values are as following:
 		0 - OK; 1 - CRC failure; 2 = I2C failure; 3 - in progress.
@@ -201,7 +201,7 @@ Description:	This file exposes the configuration update status of burnable
 What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/ufm_version
 Date:		January 2020
 KernelVersion:	5.6
-Contact:	Vadim Pasternak <vadimpmellanox.com>
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
 Description:	This file exposes the firmware version of burnable voltage
 		regulator devices.
 
@@ -217,7 +217,7 @@ What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld3_version_min
 What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld4_version_min
 Date:		July 2020
 KernelVersion:	5.9
-Contact:	Vadim Pasternak <vadimpmellanox.com>
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
 Description:	These files show with which CPLD part numbers and minor
 		versions have been burned CPLD devices equipped on a
 		system.
@@ -471,7 +471,7 @@ Description:	These files provide the maximum powered required for line card
 What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/phy_reset
 Date:		May 2022
 KernelVersion:	5.19
-Contact:	Vadim Pasternak <vadimpmellanox.com>
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
 Description:	This file allows to reset PHY 88E1548 when attribute is set 0
 		due to some abnormal PHY behavior.
 		Expected behavior:
@@ -483,7 +483,7 @@ Description:	This file allows to reset PHY 88E1548 when attribute is set 0
 What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/mac_reset
 Date:		May 2022
 KernelVersion:	5.19
-Contact:	Vadim Pasternak <vadimpmellanox.com>
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
 Description:	This file allows to reset ASIC MT52132 when attribute is set 0
 		due to some abnormal ASIC behavior.
 		Expected behavior:
@@ -495,7 +495,7 @@ Description:	This file allows to reset ASIC MT52132 when attribute is set 0
 What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/qsfp_pwr_good
 Date:		May 2022
 KernelVersion:	5.19
-Contact:	Vadim Pasternak <vadimpmellanox.com>
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
 Description:	This file shows QSFP ports power status. The value is set to 0
 		when one of any QSFP ports is plugged. The value is set to 1 when
 		there are no any QSFP ports are plugged.
-- 
2.20.1

