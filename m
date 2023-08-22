Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 324E1EE49A3
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Aug 2023 11:43:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235095AbjHVLnd (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Aug 2023 07:43:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235102AbjHVLnc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Aug 2023 07:43:32 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on20619.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::619])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3A73CD4
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Aug 2023 04:43:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lorET7YQWkxgbJSc6c8AXbTkGVXpurT4HdKKuDMmIMZLlgSUEOB/AkjwlTgxHUJPeTOcnDcm4YLsogA9L0A7AfRYz30WrP9Jp96yUZoIe29KJkl8BOpHEU1FK9xZBTWoOf/gOSk2kTLaT+n3XqUFqjT882pxuuQ7bc7vdYpJ5345QWXcWLR3I7d0tFGYUzN2YjKXOrBgDfJAZju6lRgTzdHmdJN7ilauIC8xSPs9LDEHgTUi6z3sPTWyh9uV5lVs2dHeiaJ9Rl8hSURbzk/ONwtsFQxygiHlsx+l9piE1dleH/ZHxboXTbcYDHb4xKIG80ceKIGF9Q2yQqLO5n1csQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AIyWXVrZdaVC7ufs1PIBd+WymvgdYPwkbJE3NTr/u70=;
 b=oYFUQ1O+D/F1sfEvdfUSqCn5NxUfVidQtuA8a+KBGAog09Ps5c7w30/WUuDnC21AqdCNW8E0BZgTL0QfZzbS19EU1Uwh6VuzJZVtYL0Ruf/zPJFAGNXxLb/uW21mSwUv3Cn5ti+yyFww9XX2+BU+uzsb1A2ZDbEJYODa0IZBbB01eFA5pMkWYjp1ik1Ot4rzWkmGJloZIEdQ/DIv/8ZOQ9gLsh6b8C52xCNrWyxz4GDMLxjgXqyEvceZ6cZ+BwscFZtMuRgyhfHm12t2aC1/OX0uDMii4KjZeHI8n6y0gzP9ghcTXt80eqmtldJ8JgZG+eez0/36JUNE5W1Cx50Frg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AIyWXVrZdaVC7ufs1PIBd+WymvgdYPwkbJE3NTr/u70=;
 b=AZvBmFo05bvInX7r3izBUFGtT2qZ4PKH6nDzHJ0s9nJrsZZNYVKb1Lq4LupVUygA/IMwUJ9Ed0lmioLneH8qzihvSMFiDFgkyw2p27WMgjFTQiF+AERGHGnBII9jP+zvkaZboZc23uzJtY04c3arYrta8pz5FpC21mc8/hA5I+1niJLhZkeW3AoRQjAv4Ahv2tDhM2e0IJ3ryjoKEmC3LCQ+mirbhP5Rpvlru+6tCTfbwqrCASPD0Kf0b213Cii4cXYpH4eW+ehif/XkFgzohwB0RCR568pvtbKFTILA/T+ep6snjfbxANsCmgJJKjumJhyqtC9qni0+n1DzHHgMSg==
Received: from CY5P221CA0054.NAMP221.PROD.OUTLOOK.COM (2603:10b6:930:4::25) by
 SJ2PR12MB8692.namprd12.prod.outlook.com (2603:10b6:a03:543::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Tue, 22 Aug
 2023 11:40:06 +0000
Received: from CY4PEPF0000E9CE.namprd03.prod.outlook.com
 (2603:10b6:930:4:cafe::48) by CY5P221CA0054.outlook.office365.com
 (2603:10b6:930:4::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Tue, 22 Aug 2023 11:40:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000E9CE.mail.protection.outlook.com (10.167.241.141) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.14 via Frontend Transport; Tue, 22 Aug 2023 11:40:06 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Tue, 22 Aug 2023
 04:39:52 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Tue, 22 Aug 2023 04:39:50 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <ilpo.jarvinen@linux.intel.com>,
        <platform-driver-x86@vger.kernel.org>,
        Michael Shych <michaelsh@nvidia.com>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next v4 15/16] platform: mellanox: nvsw-sn2201: change fans i2c busses.
Date:   Tue, 22 Aug 2023 11:34:50 +0000
Message-ID: <20230822113451.13785-16-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230822113451.13785-1-vadimp@nvidia.com>
References: <20230822113451.13785-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.231.37]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CE:EE_|SJ2PR12MB8692:EE_
X-MS-Office365-Filtering-Correlation-Id: a4802391-0e41-43b2-ca5c-08dba304882c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i4fLhfFlZMBYrCbQKNeTqIxpcTr1o7fWdVjemg7UDa57/Iig9gXD4LRdWQN4y9R5jJIxKMj8txLc5+kKlguYnK5Okm/mwweWOWS25lxDTwobEUgE2ZjLXjeppPW3kq7vxNrT7r4GKsAkNL5AUMr9fkAn08LHUAfyYjewiP81vsnFRIcLAii5Nr/Mb2WIVpJW9G2DDBLVBmfhh3QGuPpj++Wguj0fPxC4SlvZMeAbvg0Z6C78FkRgLaQms1eSHXqtZpHPt2FHNqjKfWlLp6fTnHjgRw+xkyHH5LWv4vZu6FFxNjcnCRM8iTZt86qee8znLE1FD0xCc4yAluP6AtM3zwq+JAV1i4kx+miJmIJzWXcKE/rzz3byuvK3gVspltv1BL1vzBHEoU2RdebRnE+hJCf2iO3gBawpelvf7ixF/xEDEdLR2fq2ca4xH3Kho4bBrkfzE8ZU/W4keO+ueV5OXlAIoE3ajv8oGOlXBzLeYjh2m1BctVDd3nxykGzzbuRFAw869XmXlRBjaOfUaZHw753ssznqu2XnOwlTj7Jf+s5ODnNU53epCMpFNl+rA0Ba+IJ9/GvdNMUEuUNNL+7CenOC3HVfyi79FRxxsTgsHSCsrv6YwKmKpt0WwMuPC9tKI9fcX+jwq7ImyI05xjwHHLt1LyXzZ3DFnyAyL9RNtasErCmmNN7FBQtwiHNtVXZb2fpp3DTdDSxm1im7eGQywCi9GMeHrNgFTD1qCvsiLg+QABZA8hg96T6+dB+6WkGp
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(136003)(396003)(376002)(82310400011)(451199024)(1800799009)(186009)(46966006)(40470700004)(36840700001)(356005)(40460700003)(2616005)(8676002)(336012)(426003)(107886003)(26005)(16526019)(36860700001)(47076005)(83380400001)(4326008)(8936002)(2906002)(5660300002)(1076003)(41300700001)(70586007)(478600001)(316002)(54906003)(6916009)(70206006)(82740400003)(40480700001)(86362001)(36756003)(7636003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 11:40:06.1796
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4802391-0e41-43b2-ca5c-08dba304882c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9CE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8692
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
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
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

