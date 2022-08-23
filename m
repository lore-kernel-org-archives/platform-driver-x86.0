Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E12BFC32774
	for <platform-driver-x86@archiver.kernel.org>; Tue, 23 Aug 2022 20:37:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229839AbiHWUhT (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 23 Aug 2022 16:37:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230300AbiHWUhA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 23 Aug 2022 16:37:00 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on20616.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5a::616])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C88313F0E
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Aug 2022 13:20:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n8CPEH6yoN8GhRajd8f2kqxegoqrFmqS8jQD/dCkGZKNmmE1+cUzWXcTv/P/iCzU3gHEH2+n+rydMmT2sOIWpTXjo7Gn3Nzxomj6OtUdaNJrUSAwqfsJI1VzpPl4ktO1fC3G5zDHEGuIxxAhAMaMRTcqKfL9epiYkR0hf0LVMJ2AXDjHEGm1WYJVy24OQWZTdIle1jy0rSuPTuGPu7pQqmzCJ5Pg1bc7scMIEoLmT1h+JjH9cdZXuMc9mm76hBmrNieCNnOSUQWX621plYntUq2/qUikT418TbLwo2w45C6dDvrbLpL9l/iqH7dfz1cLSQL6Tu8z4zYH5pDveZPAEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1N0wQnJ73TjmdjuW1TyRCRQNSuf0xFL+JeoB9ElYj6g=;
 b=i+haE3Jjuca5l0hBR5ynv3xl0v9gMos7zqZnBWh5MsOXCYuUxMNPAVTJjHuMxGs3VAB7hVQwRBjwpAPV4bOl7OEjDllQyroSj62Ua1BblLGEaSt58/huhf/Vhbsv9JV9dw2hOaKS9P4mis01Tlhw8pzBDarhEUodyisnscNZ+flSj8FiQySgDAcBYU/X/iOAQEbs4buFEja+n6KkumYE8uqUn+xXebL4l1u7tOrScFXRMH2yTg8xacVlFJXtWvwY73HsKkF1WDLVXlUDEKeWxwXovFfbhW6YNs9aIn1OA/tNW+kCef09rG/lkpHydDXxUwNOPA11hHogq76SPRNegQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1N0wQnJ73TjmdjuW1TyRCRQNSuf0xFL+JeoB9ElYj6g=;
 b=cYINd2S/lqtEdlSIe3vM8+5sxbKxyNgp809ds29tVPAXNd4i0BL8CJ22o+jnJp4lg+7MTCqjRY+/tahcudKSn3iAGGwK3Pgek6Sl004ilruzWr28Rx0kqNBHVXNyRG+RfKYkIwHD6C0I638A2fXueit3fg3CPxVhqohjoT9GYP5KS4NqLOg9VC3T6tCz1OpR2S1Pm0PtyLXLLKW2fRS/aKkH/E9eP4hnt5yIVtICHZmRbP9S1VSoGo3qRAnjJzoFYzYA8ywzhynzskt1PbVVX7QW/YkCiDI5+2m7s80BRwX9LsMFdMPd7jYk6Sc1CGgDvC8sfSNZm5FU2X6Dms+fDA==
Received: from BN9PR03CA0539.namprd03.prod.outlook.com (2603:10b6:408:131::34)
 by MN2PR12MB4456.namprd12.prod.outlook.com (2603:10b6:208:266::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.20; Tue, 23 Aug
 2022 20:20:14 +0000
Received: from BN8NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:131:cafe::61) by BN9PR03CA0539.outlook.office365.com
 (2603:10b6:408:131::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14 via Frontend
 Transport; Tue, 23 Aug 2022 20:20:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.235) by
 BN8NAM11FT025.mail.protection.outlook.com (10.13.177.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5566.15 via Frontend Transport; Tue, 23 Aug 2022 20:20:11 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.38; Tue, 23 Aug
 2022 20:20:11 +0000
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Tue, 23 Aug 2022 13:20:09 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <dan.carpenter@oracle.comq>, <platform-driver-x86@vger.kernel.org>,
        "Vadim Pasternak" <vadimp@nvidia.com>
Subject: [PATCH platform 4/4] platform/mellanox: Remove redundant 'NULL' check
Date:   Tue, 23 Aug 2022 23:19:37 +0300
Message-ID: <20220823201937.46855-5-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220823201937.46855-1-vadimp@nvidia.com>
References: <20220823201937.46855-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1abcb22b-ab54-4ad0-5668-08da8544e16e
X-MS-TrafficTypeDiagnostic: MN2PR12MB4456:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZA7wwCS+Xbf59kgdHr6iOSI2xpEF+CxU8sWDb2PBBej98RZjUlQQB5eLCxtcXmbH2sS2PHD7U/VkLNaNHQTe9Sd5bd7J8Y9UxR/MILxwwHiqL9Sgke6rL6l2Pp+44tbmUpmdWlu3ZMM/eqiYmqM2ZIBZpFs2VeYSdOvoi/eTbDGzq0aiM2Ze/QY8WRt29WfK9ns64xKCExWJXDrPVFlACNCm1YOrKy0ruwj4a1ceJiTp5Uo1zVKIWZ5Qj3S/tRStEBWwfngMoXZdijNC30NdESpBOakvyWwD06ydqb1+0IuKdJaYfRs8PmDNOuxpC6hb7G/vvp+foWn1hM2w88D00vA6VOUN+RNGC5v/qPcot5Y57ZtcZefDGQC6sBmG96ANfDSDL4txHC3JWE8EJi+2gPsxb3J9jgM24E6EpWTJhTX1UioWjooN6HvzFjPQ5wXb58suPaThuuLhOkGOdi95woYnj3pOWzu2HlNEP3KDNHC8eQA8S6+JCb9dx18IVsedCCuJRcOS0CRh/7oLxz38QfpyC3FG1zY1K8dPEWxLAGsAJMncsEWalTTCASluaZtHiMDTecV2Fu7XA1NURnQE9NO6eNAWp2vtduqoBqppkesW5VJAMgbwbewY0GW3/KILw61dQzMkWITrJr2J2vkyr4huytNR08mSoCrt+lvVZPukemuD9B9VsgXkac1Sjki07IJ6qdRbBa9CsVXwafQKpkpl2WeZgB3TeUIRySb3ZOl22+eGdy0YsN8M+ToIMqwgSAQwJmYC2/WaW6oQD9VEBgsPvQ7pg9+uzaPAZGeTT80=
X-Forefront-Antispam-Report: CIP:12.22.5.235;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(396003)(346002)(136003)(36840700001)(40470700004)(46966006)(426003)(83380400001)(47076005)(8676002)(26005)(2616005)(16526019)(336012)(186003)(1076003)(2906002)(356005)(81166007)(40460700003)(82740400003)(36860700001)(86362001)(40480700001)(82310400005)(70206006)(41300700001)(70586007)(5660300002)(316002)(478600001)(6916009)(36756003)(54906003)(6666004)(107886003)(8936002)(4326008)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 20:20:11.0846
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1abcb22b-ab54-4ad0-5668-08da8544e16e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.235];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT025.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4456
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Remove 'NULL' check for 'data->hpdev.client' in error flow of
mlxreg_lc_probe(). It cannot be 'NULL' at this point.

Fixes: b4b830a34d80  ("platform/mellanox: mlxreg-lc: Fix error flow and extend verbosity")
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/platform/mellanox/mlxreg-lc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/mellanox/mlxreg-lc.c b/drivers/platform/mellanox/mlxreg-lc.c
index 1e0c3ddc46cd..1e071df4c9f5 100644
--- a/drivers/platform/mellanox/mlxreg-lc.c
+++ b/drivers/platform/mellanox/mlxreg-lc.c
@@ -893,10 +893,8 @@ static int mlxreg_lc_probe(struct platform_device *pdev)
 regcache_sync_fail:
 regmap_write_fail:
 devm_regmap_init_i2c_fail:
-	if (data->hpdev.client) {
-		i2c_unregister_device(data->hpdev.client);
-		data->hpdev.client = NULL;
-	}
+	i2c_unregister_device(data->hpdev.client);
+	data->hpdev.client = NULL;
 i2c_new_device_fail:
 	i2c_put_adapter(data->hpdev.adapter);
 	data->hpdev.adapter = NULL;
-- 
2.20.1

