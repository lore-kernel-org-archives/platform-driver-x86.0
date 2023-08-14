Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DC7EC001DB
	for <platform-driver-x86@archiver.kernel.org>; Mon, 14 Aug 2023 09:05:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233409AbjHNJEq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 14 Aug 2023 05:04:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233902AbjHNJE1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Aug 2023 05:04:27 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2066.outbound.protection.outlook.com [40.107.93.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A80A10B
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Aug 2023 02:04:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WocBfEOwhHRzN5DPm2FMVWESRPKjgFvcBn7Uc2oVoaaneoK3QaijqkYdZS/Ql6VGa+WHHmsR20jdmVuPpbUDnET1MoG6aiVqijmMB6O4pR8tXA0l6E6oKENgiuT57FYsdEeH37ireLD4rzkW/63UeqX4/LvaRHyCwHUq/2HaLzcHuCSe/fry4qI4tpf2+bRnWVaqyIF+SU9i3GNq6/YRiUR4pdhjtWuLnfAII4nhaymGbouRCjaq20vGNJFQ0hBuDkKeiDlyo0fze5a0UolaFJHJAob7CzDTeF3uGV7tCZpv/2tVjw8Y0hYwSvQNfQhIzfa4jMYDPMY5qxc426o/rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yiI6U8wQcgnkhQB3bbIxE4I3kErVDwm8RWVfnjHWesw=;
 b=j1bm5BS9JIQljCsxmHQAZwKQK2QbzxlGSJmh0QQkcPXJeaqaEaUNAvrJogQRdGqvIW2+yg3F2Efqnelv9tBGeS97dlCR9ulLVwpC6tYxaQPQWU3lkJ8yeBWfQM9kGY08I6Fz3oE3dZiO068MYa6bSzPVFup9l29MUe1tIdmNUzTGlITkzhjU7klXhOOWbfFEp3//INjaKQYofIhiQkK73LKh0SlOqz1Imo0+IRbGSSTncm4QjfO5zpeOsQs0FjglT1okf5lFEv8tHk6EClzlMezAq1kTFtYXkW9v7gRbtcm7ffc29cr/P7IoAEuhSk2NOLcLJvGJ3wb5a4XqE62aXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yiI6U8wQcgnkhQB3bbIxE4I3kErVDwm8RWVfnjHWesw=;
 b=QaP3fM3h/XmcuM9ISRNvvpGRIAYpqacs1YgdFbOG59B40G4cfK2xMgrH03rWwVapAvJkRPP/qfXAEG0JJDR7kA02yDlfKuHxws9dpVRJTbnZZsq0ThTVeC+bSkt0+iDyPTwmTocvyAfLnFcRLWB0y7tdh3wklgq6VmaZTc7a/NgiNY0zCQ5FS7ovF5c/h4zgNk194VlzQXqbczoa7kwdrI6z5cZK45dbZIEMhEK3SLDzAOWQY1iAUvaIM5TBJDtumxJLxRzgBfw7Gx8xhGRo3LDNrdAGysAxXA0Q91D2IvjlDp7MvYlLjA/FxeKx+g3MWPUGOJ5KKMEY+1zXM9e+Hg==
Received: from MW4PR04CA0382.namprd04.prod.outlook.com (2603:10b6:303:81::27)
 by SJ1PR12MB6194.namprd12.prod.outlook.com (2603:10b6:a03:458::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 09:04:24 +0000
Received: from MWH0EPF000971E5.namprd02.prod.outlook.com
 (2603:10b6:303:81:cafe::cb) by MW4PR04CA0382.outlook.office365.com
 (2603:10b6:303:81::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Mon, 14 Aug 2023 09:04:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 MWH0EPF000971E5.mail.protection.outlook.com (10.167.243.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.12 via Frontend Transport; Mon, 14 Aug 2023 09:04:24 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Mon, 14 Aug 2023
 02:04:13 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Mon, 14 Aug 2023 02:04:11 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Michael Shych <michaelsh@nvidia.com>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next 15/16] platform: mellanox: nvsw-sn2201: change fans i2c busses.
Date:   Mon, 14 Aug 2023 08:59:09 +0000
Message-ID: <20230814085910.56069-16-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E5:EE_|SJ1PR12MB6194:EE_
X-MS-Office365-Filtering-Correlation-Id: 46f7b65f-3e73-4629-848d-08db9ca574a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sICrKr8lItetcUMQwDHPYkC+zvfpvlaf2Fe0gLgNlaA72iZj6iYWZOWuLRVyF7Un3Od04XBsOqGjz+oWkLTezrakNIiBggnSyunKfJhoj9NNG8f709+bxm/IruWEdZjP9Ox0U97wJBRnoDOw0ANJLuuYpHoteB+DVBRJAr3VAUcjWM7nFkY0mFn4y3UGuYVyr3lv/ZPuXP+AzQDXR/o4KG3BVtR+MJO1dAtyUGpAdaKUbc+qoiJS7uWb2gF6iJLCvlCXKJSD5XwMiBKWyfYMzRQ0OOlzmScEuZtVJ7+Vtr5hXPaSyMOXmL9Yh2COdbW+4hj0tsk3M9KeA5MFVYHbCynwwWikZAmHA5svcepXCQG/eG6BksXutCIWsYR+dDhzqCkrZoLYSWndNmK7OC8Ie57xETbO+gjScD/iviXtaLmVE0SgCv8FgjLlHsU+ADNlMa8M/JfgQgytPDUh623n0A4YbHdWoWzp3uIN2PwOuwp5dAbSBKvZZBt9cMCBCBZHdxtBuNyMC+wphXU3mHzj+GMmmJ9W/nuqBDFBTwWC10C0BvhjCAfMnZAEOJQpPi5/H7Re+cptMZzNN8iSwd+yJy3rXr3peRaR6hy9xyQ3XMs2NF+ukE/wNN1+zIoxXPiays99u+pLwd1uLV2ptWB9EWRABF1v2Bpk8X7iRwvJmfXqcE0p/d/fHMa+h0iPZtcBm+0iiyQvCvRYSob/f1Svi9LwiWpIEgE4oWVA355QVts/j/reFDg4+oCrzeAw4rFh
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(346002)(136003)(39860400002)(186006)(1800799006)(82310400008)(451199021)(46966006)(40470700004)(36840700001)(83380400001)(336012)(36756003)(426003)(47076005)(36860700001)(86362001)(40480700001)(41300700001)(478600001)(356005)(7636003)(54906003)(70206006)(70586007)(6916009)(316002)(8676002)(5660300002)(4326008)(8936002)(82740400003)(40460700003)(2616005)(16526019)(1076003)(107886003)(26005)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 09:04:24.2766
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46f7b65f-3e73-4629-848d-08db9ca574a9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000971E5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6194
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

