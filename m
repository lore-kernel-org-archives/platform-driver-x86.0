Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13159EB64DD
	for <platform-driver-x86@archiver.kernel.org>; Mon, 14 Aug 2023 20:37:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231730AbjHNUgw (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 14 Aug 2023 16:36:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231672AbjHNUgV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Aug 2023 16:36:21 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2061.outbound.protection.outlook.com [40.107.237.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF5B410F4
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Aug 2023 13:36:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lFTBE82zbrYSSzpIP5N4711QjDwWCVCTzg7wifaql+Nhh0sXxYv0yGZ0+NzWpE5YsboT56lRTNziBpXxdrHKjfBnw+g5Xc8KOHOmCryqbmAdKzfg+iZBztVJ+iFD8ziABesnTEnObBlwrra59XrXAb2eVk5lAiHtx8AoUG33l6usMEpAinrq1pBQulee9wikL5EJpCkNFbwEGybiGLp96tF0xrwKqg9Mmo48/trdaY8NAeGrerJEh19mC7wZMuf8qqu3PmoXZAQxNFbSW2aOs/Ax+Hs3e3CE64ylg7VSia5G2plKzpzXbU3HDH6Li+R0gJC2xrJwlgsR05rgue67Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/5lkbwuXaKYhnHRx76HIGr0lMKCPiw3Uu3qMe14L4FQ=;
 b=YwbWP9UjLd6f00V3L3PoPlyOamS+9mcEzOfsZv4184svVFquzvA9MrBJtY3y3QCEbU86E7I2Q+8UxUpbRZPNGPUkArAzROmChJjTCD720/0VPBtO1Q2A4Wz1zDDNehAvV0eloYGexj3+ao8lA7bCN7yUbLdPr9cZhr5re3eKWbkaLIVQ8lCY25CQxuzSEjb3l5JAspajhmHhZIBp8Ul9CVhCl/uFJxX3EV0at50+0EfLFHj0muK5S6ZEFSwYWdKs/ndBgI+1Fr2RDv3FNp5lFuHqVVCmxJVsH3uoLWjpFM8wH1WR5P3gXRrgCV4CAF95HfhMAEAQMkD3mAexLzFO5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/5lkbwuXaKYhnHRx76HIGr0lMKCPiw3Uu3qMe14L4FQ=;
 b=H8SPu/A/fvt3zNzuXLTFNMpChA700wAD+i0A8cyyqqmcc9jIe0I6LE8yemwXju4myToBkiYm2im0DfEPL5dCzV4mxMLvlNl8Z49UAVQVxo6Gux6J+8pHcPS0XVcY3Vh5P1dA7yVobFMSr38DgCFpYoNo5FSuUl58k5gVhXGZmJquLV1PosYCWlYbVs/rdja2bpM/mdARfMUVyig9LZh7RUTnJlzMakZCmJk2wscyuTd3ZhHJ3xG8u6FcCe1WXLvOSfqXR+gkvWkNQvOIpmY0vcf7+habitTLw8hhbcKLEjka3do9QQUc5qfdFIPdxA/t1J/aUYJstZ6wRivbl9V3YQ==
Received: from SJ0PR03CA0141.namprd03.prod.outlook.com (2603:10b6:a03:33c::26)
 by DM4PR12MB6088.namprd12.prod.outlook.com (2603:10b6:8:af::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Mon, 14 Aug
 2023 20:36:19 +0000
Received: from CO1PEPF000042A9.namprd03.prod.outlook.com
 (2603:10b6:a03:33c:cafe::c3) by SJ0PR03CA0141.outlook.office365.com
 (2603:10b6:a03:33c::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Mon, 14 Aug 2023 20:36:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF000042A9.mail.protection.outlook.com (10.167.243.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.12 via Frontend Transport; Mon, 14 Aug 2023 20:36:18 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Mon, 14 Aug 2023
 13:36:02 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Mon, 14 Aug 2023 13:36:01 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <ilpo.jarvinen@linux.intel.com>,
        <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next v2 05/16] platform: mellanox: mlx-platform: Add reset cause attribute
Date:   Mon, 14 Aug 2023 20:33:55 +0000
Message-ID: <20230814203406.12399-6-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A9:EE_|DM4PR12MB6088:EE_
X-MS-Office365-Filtering-Correlation-Id: ee065ac2-c623-4236-a15f-08db9d061d2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 03Yw0ZhJvl6198x7RilniB9z5hZH/3hhgSCN22oMvV5ysZwu4G6DJYrmxeM/KxPlP6pytsEx2cKtlvruOGHX3O/LsoSCUZy697eKdFFgy6HVYtJFbcp2/8rOtXFsqH8t91sJt+VDe0ewCq52r7+crr7n48WPqxZaB4Nxu6ORK26Ul7Kogx1YVm7YqZtNy5c3r42xHu0X75mBiD8FlHDCoxZdpinOAkQ8UlpnOzgEKpPTWdIbRGTXU7i4Cbosie9vCUvGTC/Nn7Taf5sNZxCzzzLnvYjHdUxEWAH+DalmrgOSrRz5rdDxDysiTECincFlTs73d0Mn04OxACGKaXW9Ym0KzXS9I/OEZ21iJE5JpKSLb5qBt8q6a6AuSuOcoxZe50HRPdx8vFXCC1yllKf2AcWaXyo6lY0vurGQgnfIDY4Z4MUKZu7wT2yt+gme63PzbFQcnrYNKaMBk1M6K/sD8GSmOpMLM824MNsh4x5Z2uxscdLMDlWT35qF3zn+05og2j5mxm/Abi/4qdg4+59vEDemsa4LYM10oi0zgbmOKLQEc52NnH6lyva83Eipm/ad0/gnlC0rpnMWrhoPSFXuA5m4NoSTISRuLP1p/o5ZFWhzFd1hYUke78DyCk8l/IdlvL+7324EY7oAY+o/jKtg6XGI6s9xfxzIOQoNgRo4G28adqoIP5fBVMMul3cvRSw3u0W4KaReHphVrTT//PnTG5anYiGjrOZF+Fb7EAV99EkQVtzUi+0kYsId+SYuHQd4
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(136003)(396003)(346002)(186006)(82310400008)(451199021)(1800799006)(46966006)(36840700001)(40470700004)(83380400001)(36860700001)(40480700001)(40460700003)(86362001)(6666004)(7636003)(478600001)(2616005)(107886003)(36756003)(5660300002)(41300700001)(8676002)(8936002)(4326008)(316002)(2906002)(4744005)(82740400003)(356005)(70586007)(70206006)(6916009)(1076003)(54906003)(426003)(336012)(26005)(16526019)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 20:36:18.7014
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee065ac2-c623-4236-a15f-08db9d061d2d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042A9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6088
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Extend IO registers description for some system types with reset cause
attribute "reset_swb_dc_dc_pwr_fail" to indicate reset caused by switch
board DC-DC power failure.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
---
 drivers/platform/x86/mlx-platform.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 648b27eff0b0..8e07ed3dc552 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -3558,6 +3558,12 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_ng_regs_io_data[] = {
 		.mask = GENMASK(7, 0) & ~BIT(2),
 		.mode = 0444,
 	},
+	{
+		.label = "reset_swb_dc_dc_pwr_fail",
+		.reg = MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(3),
+		.mode = 0444,
+	},
 	{
 		.label = "reset_from_asic",
 		.reg = MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
-- 
2.20.1

