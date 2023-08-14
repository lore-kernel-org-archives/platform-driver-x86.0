Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD621C001DB
	for <platform-driver-x86@archiver.kernel.org>; Mon, 14 Aug 2023 20:40:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230287AbjHNUjf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 14 Aug 2023 16:39:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232607AbjHNUj3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Aug 2023 16:39:29 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA7E810F7
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Aug 2023 13:39:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YZfb+dMb2tuzNpa6pAeNiVcj1PPZOTtEjxjEYObogAId564bs0sb52E8Buf3PEpJxYg7xqdQdNb3LsuDW7r/7JKUcj3NuTrpibe1GfrfRneq+cjAeJ1mAQl2zcEjN/yQAcr9Szy2NkObXQ0RBaZ6XPhWUh8ehWxzyxMP9kihrfFVrfSOidhiV4A/OLFl4kE4heZRaUvGsHIhP94EJkbFNupp6YxpMYiGf8cRQGzdkPcfsXuhKKVTY+6+UDZl7u4viAlVOpTF/VQ7sK68GUOONokzKDHRGlQUd5USC6I5cqczjLc4GF7zElC/J+jAbOZWM79emOyEmQNtf7So0GhWoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yiI6U8wQcgnkhQB3bbIxE4I3kErVDwm8RWVfnjHWesw=;
 b=U03RUk368eqixTfyNIvvCAfchSogwNpXg10FZ01dpBnPi/sV5y1i4zGkJkA1SD5+O5Ch4N7Li3afdmTSsN4W766l4Ac3ieOBVfmcV5q1zz5IyICtSU8hTgClKRT520Sfk5H6+/SX8W1tIG05fpREIi0/vivlJk//A+et8kHaR6JnVGY8VudVEOl/cbYBEvkxKF2uSUHmLRq8HSwXptMhqRD2ZmykDgaxXfEWGER+Qqm3I1h0y5pToFiVsLQbsKzdpTRrktl/bJgKXxD34WOlULF4H3fRGdiKRMAwTBrN56rMr2aaGK0moq70CobVjKVmGKi+Awnt1jdNEwWxeXz9gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yiI6U8wQcgnkhQB3bbIxE4I3kErVDwm8RWVfnjHWesw=;
 b=X7FN5zRQW0xKlsLP/KW/UwB3c0Rh43NuLJ4skuYTKxQnkhXGUWqLouNGEL6gjO+fE36X6y0IoKhLeIT9OkaPQBPB+yS8XAXiezUqOBf97xuFXWZekvdEcLxdouhrFXITOXMygptJMZWEAaMXmwsWie4JRu8Mr7XxXCMQPPUXKMun0EV3Mj+wFOw+hok3CTRgwH/IdCj14N7DUL3DaA4D3SZfV+Rq97IqC/4Ay2ejTSN86ukSf8TIkd3DN9Oyq9sexS9HQkPLzN/nYETIUkl/vlXYaPtI9HPYctRNPyP91Qj8lnrTIaaAYG+n5NOe+76tjyAdR4dBb4e9LZCZ5IiOzg==
Received: from SA9PR13CA0163.namprd13.prod.outlook.com (2603:10b6:806:28::18)
 by PH7PR12MB6561.namprd12.prod.outlook.com (2603:10b6:510:213::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 20:39:23 +0000
Received: from SN1PEPF0002529F.namprd05.prod.outlook.com
 (2603:10b6:806:28:cafe::e2) by SA9PR13CA0163.outlook.office365.com
 (2603:10b6:806:28::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.12 via Frontend
 Transport; Mon, 14 Aug 2023 20:39:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF0002529F.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.12 via Frontend Transport; Mon, 14 Aug 2023 20:39:22 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Mon, 14 Aug 2023
 13:39:11 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Mon, 14 Aug 2023 13:39:09 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <ilpo.jarvinen@linux.intel.com>,
        <platform-driver-x86@vger.kernel.org>,
        Michael Shych <michaelsh@nvidia.com>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next v2 15/16] platform: mellanox: nvsw-sn2201: change fans i2c busses.
Date:   Mon, 14 Aug 2023 20:34:05 +0000
Message-ID: <20230814203406.12399-16-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529F:EE_|PH7PR12MB6561:EE_
X-MS-Office365-Filtering-Correlation-Id: 46611018-e31b-4741-0acf-08db9d068afc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WHhWc/4Z7ql1xul5tGUGw+NUKK9d81W7sy01Hk0RwYeT9PL3Qce/VgkhMFtNCXJtnWniWGvIzAYSYc2Ze3CiGJrkuxWq97+wI7zyWX+KjXvl+x4OBDHVTP7nIFPk/+cKQpN536FeVndVeMnSEPkTGd05EpUYx9U7VOZcAlrkU/GB2euiopYOubXKm/jXVUOIkx7cbGQoCabLb7dvVHtaD8az6Rv/d044gYxeCfAYbA9DGJOgTLvxrzg5cMQOP0q3UdmeeUvw6gJpPHk0qgDT5GJ/snwqXCrqp37gVohulIDIxC5R+vFcI9EUwJ+xcZWzAXY+TcnNFPjprzw4F9slFMTIp36qZmZZELIrPpet6rYGbh0co9EPzTDLpDWg9Ww71uuMKbMXACnoBQrFt9eVwXEjpwSWB29xLLTtUoZdbr6xqaTpk6IK4kGG/6r7UjOmVg4LmNcskN2AXiA58IWaH/NsWjAMean/+jJC1l9DOo0wgVQy/w9BnCR0O2NKvi4VKS0ULJ3P3QjJzJdg/RYbqFATbFpJf7GuG9IfqH21GZW3+wrKb6n++nmiJ2caTWgnIS/N1jcBwz83THG7iM9XZ5ViILSO8I3MKsiDmvctwQVEh3ju0/bNFQYk6zRR7LN17lzEIXEpKQfQGaAwolaW6gXuy6jjZfbp3L/k47/iQbBMT2s89ohp8abr3h+N9386/kH7xqPu5sZTf+ExUOkpQ5CTEunc4gleJk3iZPAu6yvgpYuQemq2K6CMEiCtPBi4
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(39860400002)(396003)(136003)(82310400008)(451199021)(186006)(1800799006)(36840700001)(40470700004)(46966006)(36756003)(5660300002)(86362001)(2906002)(40460700003)(40480700001)(83380400001)(36860700001)(6916009)(4326008)(316002)(54906003)(70206006)(70586007)(41300700001)(426003)(26005)(16526019)(1076003)(107886003)(2616005)(336012)(47076005)(8936002)(8676002)(6666004)(356005)(82740400003)(7636003)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 20:39:22.8945
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46611018-e31b-4741-0acf-08db9d068afc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002529F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6561
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Michael Shych <michaelsh@nvidia.com>

Define the exact i2c bus (adapter number) of fans on the SN2201 system.
This will cause fan's EEPROMs be connected already from nvsw-sn2201
platform driver and not from user space after receiving udev events.

Signed-off-by: Michael Shych <michaelsh@nvidia.com>
Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/platform/mellanox/nvsw-sn2201.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/mellanox/nvsw-sn2201.c b/drivers/platform/mellanox/nvsw-sn2201.c
index 7b9c107c17ce..75b699676ca6 100644
--- a/drivers/platform/mellanox/nvsw-sn2201.c
+++ b/drivers/platform/mellanox/nvsw-sn2201.c
@@ -84,6 +84,10 @@
 #define NVSW_SN2201_MAIN_MUX_CH5_NR	(NVSW_SN2201_MAIN_MUX_CH0_NR + 5)
 #define NVSW_SN2201_MAIN_MUX_CH6_NR	(NVSW_SN2201_MAIN_MUX_CH0_NR + 6)
 #define NVSW_SN2201_MAIN_MUX_CH7_NR	(NVSW_SN2201_MAIN_MUX_CH0_NR + 7)
+#define NVSW_SN2201_2ND_MUX_CH0_NR	(NVSW_SN2201_MAIN_MUX_CH7_NR + 1)
+#define NVSW_SN2201_2ND_MUX_CH1_NR	(NVSW_SN2201_MAIN_MUX_CH7_NR + 2)
+#define NVSW_SN2201_2ND_MUX_CH2_NR	(NVSW_SN2201_MAIN_MUX_CH7_NR + 3)
+#define NVSW_SN2201_2ND_MUX_CH3_NR	(NVSW_SN2201_MAIN_MUX_CH7_NR + 4)
 
 #define NVSW_SN2201_CPLD_NR		NVSW_SN2201_MAIN_MUX_CH0_NR
 #define NVSW_SN2201_NR_NONE		-1
@@ -425,28 +429,28 @@ static struct mlxreg_core_data nvsw_sn2201_fan_items_data[] = {
 		.reg = NVSW_SN2201_FAN_PRSNT_STATUS_OFFSET,
 		.mask = BIT(0),
 		.hpdev.brdinfo = &nvsw_sn2201_fan_devices[0],
-		.hpdev.nr = NVSW_SN2201_NR_NONE,
+		.hpdev.nr = NVSW_SN2201_2ND_MUX_CH0_NR,
 	},
 	{
 		.label = "fan2",
 		.reg = NVSW_SN2201_FAN_PRSNT_STATUS_OFFSET,
 		.mask = BIT(1),
 		.hpdev.brdinfo = &nvsw_sn2201_fan_devices[1],
-		.hpdev.nr = NVSW_SN2201_NR_NONE,
+		.hpdev.nr = NVSW_SN2201_2ND_MUX_CH1_NR,
 	},
 	{
 		.label = "fan3",
 		.reg = NVSW_SN2201_FAN_PRSNT_STATUS_OFFSET,
 		.mask = BIT(2),
 		.hpdev.brdinfo = &nvsw_sn2201_fan_devices[2],
-		.hpdev.nr = NVSW_SN2201_NR_NONE,
+		.hpdev.nr = NVSW_SN2201_2ND_MUX_CH2_NR,
 	},
 	{
 		.label = "fan4",
 		.reg = NVSW_SN2201_FAN_PRSNT_STATUS_OFFSET,
 		.mask = BIT(3),
 		.hpdev.brdinfo = &nvsw_sn2201_fan_devices[3],
-		.hpdev.nr = NVSW_SN2201_NR_NONE,
+		.hpdev.nr = NVSW_SN2201_2ND_MUX_CH3_NR,
 	},
 };
 
-- 
2.20.1

