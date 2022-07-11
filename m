Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1E3AC433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Jul 2022 08:48:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230334AbiGKIsA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Jul 2022 04:48:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230140AbiGKIr4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Jul 2022 04:47:56 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2045.outbound.protection.outlook.com [40.107.243.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D99D25ED
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Jul 2022 01:47:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IK4fKMzBLF+KezSaOaAzA3RD/U+kV6iFin53LhGQs11uaVrXSTrpXxOAnF6wSJKZoC9KwVjP931Z61butsPrRTwgwsZT9qch407vlxIV5w70U7GUmO1KJQ5cq1ewVaXnxAd67MqQh9KXHoztq0FQXrmaQN92sM2RbGX1Q0/cqz2uXAJfY0gR6h32GFl5x0f4J0Jd/HM6oCpRsdncoF9aJdy+QZqS1gsiUXEPkk4e2CMS1rMtCCOjWSS0QXAaJwVHCNJgn/Xv/dZpv1DkjhnVcGlKfQAB3gHJqOe/cQ9IwIn5Uravimyyi4Zh3NpG7+JIxxxbVTYm5ckUBVVfYNGecg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wbfTOk/gmou23pYxqH4Gi0g2/L+EWqupU52nXNFIxnk=;
 b=n4Q7OCg+iinqgGD105zrOMYSDlAeGbR0DfzeUSJPoVJbmlvR6oEvWoNmW/LqoIGGusQLCeYHqE8zkUmPVVhMcrRp399/nIT7SmKZRsdsBbn9+67ktCDGkaVk9mjiJnMb0J2NXh0CGeI5UDBTTGiXaDe1qfJMUM1FN/WmXiZuejhrGtd5ibWp4Bbm/45BS6o0ZAM1l4e7dbbDt/wY3A6Zp0ShDA5cf7WF7JuEcTe5yxoFKiV2fXzLCCPx4l1NwxHjzCNkkG4qND0LKGrtMcBdPxMXOdTedbvd3BwqrS5UxB9s496kko/IVikfbBNYtuDHf1FCwA8ZnPblIMXEQn8s5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wbfTOk/gmou23pYxqH4Gi0g2/L+EWqupU52nXNFIxnk=;
 b=dcqyRYsO3p8P1/RYhYc+kbtE7bUcOMAxDSq7Bg14SJBiis+bXK4Zx3l6aEToipJtVdabw62l4Pv3XQvE4s28naNLdY0lvQ2Yscb2uWQK01wi0V+G4HD65umgz8YrDAoYFNd+xZ7puVCLjPmm3EB1xqGiXfw6ZaXrA0L+vkO17fYFrFMiMJe7H3IlbJfXcpXKs0U2+27Agjt3IXtxM1hwIKBpWogHZQrE2gEOlUZi4cCvVbaIHhv9YiXeOQ1DZsEAc+Up2tA30BUruMmvIgPSOuP8gqpD9dL81kt8FI6j8AvjooGeItSZcKtM9mFf7rKakgDoUPHOzRX8DSjsHDq2jA==
Received: from BN6PR11CA0005.namprd11.prod.outlook.com (2603:10b6:405:2::15)
 by BL1PR12MB5189.namprd12.prod.outlook.com (2603:10b6:208:308::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Mon, 11 Jul
 2022 08:47:53 +0000
Received: from BN8NAM11FT053.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:2:cafe::c6) by BN6PR11CA0005.outlook.office365.com
 (2603:10b6:405:2::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.25 via Frontend
 Transport; Mon, 11 Jul 2022 08:47:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.234) by
 BN8NAM11FT053.mail.protection.outlook.com (10.13.177.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5417.15 via Frontend Transport; Mon, 11 Jul 2022 08:47:52 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL101.nvidia.com
 (10.27.9.10) with Microsoft SMTP Server (TLS) id 15.0.1497.32; Mon, 11 Jul
 2022 08:47:52 +0000
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.26; Mon, 11 Jul 2022 01:47:50 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next 5/9] platform/x86: mlx-platform: Add support for new system XH3000
Date:   Mon, 11 Jul 2022 11:45:55 +0300
Message-ID: <20220711084559.62447-6-vadimp@nvidia.com>
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
X-MS-Office365-Filtering-Correlation-Id: ef06ae7d-5f9b-4b50-fd1c-08da631a0afc
X-MS-TrafficTypeDiagnostic: BL1PR12MB5189:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Dh8/GdSIhYufyRvCi7YHBVmcqk/jFC2cyoJLvIJzf5h/AMZ/jlutWYHRvaBbjhX+LU/nooSMfKJAp1JsDY7BZ8+Y3WdSAsyszopYgTSQ51gxf4PvFnPdpXzLK8QY1T19gZ5isQ4JvUHjH1zAVGC3R34MdrTiMaUDKcpC9DrP9QhmKr4LvcTYOzGY2qmHMBjY7wvK1vgpnWNrzzZ6zSzeBeblcfaRbcfWyer8TkwDrY+mO46i5Ij8tOk1h+lQw769dyXlWu/WQCogsVSiNDAGXdlsDhEwkmGCdBgrweguPUPfug95WTzppfN1NnL0LDZEsmZ9hgivfGfKwN0402J3pblNbGCMAu1UNMFrFsK/5RUAo7CNMCEPRCPduToYm46ILuOrdoZqlnctRvCrB4uwmOmA5W9zo+3KLbOx2M3fL1+Oc/lOCFexKDUSPadfUtFnU20KEXv8Tdcgrg2Jb0g6yDzayyXg8BTB7h4WXPFiuDhbVia48rfuDBghVs50EC4TFDvqKpoINhU8o3qAHSJa5qKSu84+gbpP1ntOMmEmpSAWA6rz9O8x/K1lM+62Qq5oscxT++JhMI+tEOmElMicOt0LPscxrE3kTsbgS9XHNQbR0NxRiWV+S2Mu6vkElrLp3AsGbJVbhHSldWi+jfmrQllkMQtHdHXCm7eEYpuOo3rpLmUdcwVUrj/oDt7z/WswcygcG2lgdvkL3qEs+cHOL+GOPXjbCcVSFikLBohfrBJEDRi/1r7WQjyBuxz5xXox8jo8yWS91gRQTIYeT39uMKCnrBiqN7DZGmpnWCCoB3YnEWqWuhR5o/DVE1WVz8W7OatOIkM5T9sqPBT3WXjg2fOjHMQjWBSqY270ASJgfAg=
X-Forefront-Antispam-Report: CIP:12.22.5.234;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(396003)(346002)(39860400002)(46966006)(40470700004)(36840700001)(82740400003)(81166007)(86362001)(36756003)(478600001)(336012)(426003)(70586007)(26005)(47076005)(54906003)(2616005)(316002)(6916009)(1076003)(70206006)(8676002)(4326008)(107886003)(186003)(16526019)(2906002)(40460700003)(41300700001)(5660300002)(8936002)(83380400001)(356005)(82310400005)(40480700001)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2022 08:47:52.9279
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef06ae7d-5f9b-4b50-fd1c-08da631a0afc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.234];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT053.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5189
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add support for new system type XH3000, which is a water cooling
Ethernet switch blade equipped with 32x200G Ethernet ports.

The system is recognized by "DMI_BOARD_NAME" and "DMI_PRODUCT_SKU" matches,
when these fields are set to "VMOD0005" and "HI139" respectively.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Felix Radensky <fradensky@nvidia.com>
---
 drivers/platform/x86/mlx-platform.c | 51 +++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 9e6054e2f0ac..31609c1df027 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -2161,6 +2161,25 @@ static struct mlxreg_core_platform_data mlxplat_default_led_wc_data = {
 		.counter = ARRAY_SIZE(mlxplat_mlxcpld_default_led_wc_data),
 };
 
+/* Platform led default data for water cooling Ethernet switch blade */
+static struct mlxreg_core_data mlxplat_mlxcpld_default_led_eth_wc_blade_data[] = {
+	{
+		.label = "status:green",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED1_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
+	},
+	{
+		.label = "status:red",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED1_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_LO_NIBBLE_MASK
+	},
+};
+
+static struct mlxreg_core_platform_data mlxplat_default_led_eth_wc_blade_data = {
+	.data = mlxplat_mlxcpld_default_led_eth_wc_blade_data,
+	.counter = ARRAY_SIZE(mlxplat_mlxcpld_default_led_eth_wc_blade_data),
+};
+
 /* Platform led MSN21xx system family data */
 static struct mlxreg_core_data mlxplat_mlxcpld_msn21xx_led_data[] = {
 	{
@@ -4708,6 +4727,31 @@ static int __init mlxplat_dmi_default_wc_matched(const struct dmi_system_id *dmi
 	return 1;
 }
 
+static int __init mlxplat_dmi_default_eth_wc_blade_matched(const struct dmi_system_id *dmi)
+{
+	int i;
+
+	mlxplat_max_adap_num = MLXPLAT_CPLD_MAX_PHYS_ADAPTER_NUM;
+	mlxplat_mux_num = ARRAY_SIZE(mlxplat_default_mux_data);
+	mlxplat_mux_data = mlxplat_default_mux_data;
+	for (i = 0; i < mlxplat_mux_num; i++) {
+		mlxplat_mux_data[i].values = mlxplat_msn21xx_channels;
+		mlxplat_mux_data[i].n_values =
+				ARRAY_SIZE(mlxplat_msn21xx_channels);
+	}
+	mlxplat_hotplug = &mlxplat_mlxcpld_default_wc_data;
+	mlxplat_hotplug->deferred_nr =
+		mlxplat_msn21xx_channels[MLXPLAT_CPLD_GRP_CHNL_NUM - 1];
+	mlxplat_led = &mlxplat_default_led_eth_wc_blade_data;
+	mlxplat_regs_io = &mlxplat_default_ng_regs_io_data;
+	for (i = 0; i < ARRAY_SIZE(mlxplat_mlxcpld_wd_set_type2); i++)
+		mlxplat_wd_data[i] = &mlxplat_mlxcpld_wd_set_type2[i];
+	mlxplat_i2c = &mlxplat_mlxcpld_i2c_ng_data;
+	mlxplat_regmap_config = &mlxplat_mlxcpld_regmap_config_ng;
+
+	return 1;
+}
+
 static int __init mlxplat_dmi_msn21xx_matched(const struct dmi_system_id *dmi)
 {
 	int i;
@@ -4924,6 +4968,13 @@ static const struct dmi_system_id mlxplat_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_BOARD_NAME, "VMOD0004"),
 		},
 	},
+	{
+		.callback = mlxplat_dmi_default_eth_wc_blade_matched,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "VMOD0005"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "HI139"),
+		},
+	},
 	{
 		.callback = mlxplat_dmi_qmb7xx_matched,
 		.matches = {
-- 
2.20.1

