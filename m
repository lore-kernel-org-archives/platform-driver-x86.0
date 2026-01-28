Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012045.outbound.protection.outlook.com [40.93.195.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00152C326D
	for <platform-driver-x86@vger.kernel.org>; Wed, 28 Jan 2026 08:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769587209; cv=fail; b=oCp8XXAEx06rYZ26tAbVg2BJYKqV2BoZDOFYYfcTsz5+AmCz5ys9KOCm1xaKVsmvB0bcFQwOsGoPemb12yMTB2FDOERyPnbQY5hlmkk8n9cHbeDOxZB17pdf63F/iakKGlDvcWm2BksA9BIBVWaIsFTmpg/lZ2PMompsoTx9fZ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769587209; c=relaxed/simple;
	bh=dgf2rkoBGbmTuvYYSV/BCHEvtQgOxoRNkuyplq9Cn84=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZZbWHRrUUOJkQ52gZvu/Wc4re9IqUA0VQJweftwC7cs397xVKkMHMGGsSjV/RCD72VInpbnTwcrPz4k25UL+D4/1RLoWyPo3LbPFP4PmP5NlXH9kjvimKkZFlpxuX1OYtfKsd+YoGFZFUxSBg763Muc1Oc5RFWZC4TTyqJ3ztJA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nibzrKeW; arc=fail smtp.client-ip=40.93.195.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nibzrKeW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kOXi6qoINGVPN+7VFGpw+MpJS/SpVIefMOiX+sIj1dJmPvDQEf8xNVGsxR0vzE121pUTVFVZZLa11NrcNRMkf1sTkBti3Vlhbxd3N0YS2XwWD6m3Iu0biqGE3rirzs5LwHPRFLgliMBbYC2Bb8pbhCN1SJrTDgrzX7Ge7kpsQW9jeKSWCqvNQuvUO0UbkeLYniRA7dJPRjWS5Vgg6sHhYpshSDsZvwoHtuxnhWbsNRWiOTvzO2OGeaFBHgJo87KZBTJkSmThONrxKVygafclsI/25dWyZfnYnRqMwpAeWac4hwysW745OppM+fQjvI5dZxHqJVAy85pHWRsBr/1kIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CFBTGEx1hodMiOnoL0yTAW0iD2y9Mkr7OmjqzP1Aapk=;
 b=A3fOZ3SCrChodgmJN0FD2TyGroRr+fgZf/9Ild1f5ehff022vGor8vt1spxxMvQPmJAqvlqSKI6mBdSUxJ5bDulJ6qcT4QdRkBm9CO9YVVeYONQ5qVVSg2fg8aDB3ILCrq4buAEkFoTJYXkEIJwNx2DEwoOYrYQe3A6Cv1YP1BPZjsF81Pn7oE7O0qf246VUnEgWxB62MXTkt9jihKtVFZ+eAOP1L4ouyQGpdgTw6TO/NsjfhxKFajVBgGRTvPuJf3i3yxjyTZt7InC8Qze3cw/tWrMY3xxWfvdpML5h+OAb1FdjFAPSn8W1HmMFc/ChIabL6F6uquduiNkrXYuNaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CFBTGEx1hodMiOnoL0yTAW0iD2y9Mkr7OmjqzP1Aapk=;
 b=nibzrKeWMh0gV2wPiPhHjlyBdBpRO0HnTL6rpcm/aOn+Z1/utXOFo8a396aHxcQV+/rudvYWDKI3+BJ+/8E4EJq2U3y57huujn47mAxZVDDC7l2MEvBbhdLtF0USy9gm52LGJeh2RCTORN5TN1qP02VZQdlWQcZrdcwhUBWWvQ8mcIhAtHTKiL4iyanPb7ZJVIyJ5isDEcYFCP9vfoo4h4N0sMmxfHMHy3hLTXAoiLMFlhKFAS8TMqv/dcFSsu7BepK26IvU7QimlGTvITsG09d/sSs+ioD7Ddd/tKDLGYABCth1I+GA5PboKinuzYzJEuokg/CHm9HZwRTDDMMigw==
Received: from DM6PR03CA0027.namprd03.prod.outlook.com (2603:10b6:5:40::40) by
 LV2PR12MB5965.namprd12.prod.outlook.com (2603:10b6:408:172::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Wed, 28 Jan
 2026 08:00:01 +0000
Received: from DS1PEPF00017096.namprd05.prod.outlook.com
 (2603:10b6:5:40:cafe::d8) by DM6PR03CA0027.outlook.office365.com
 (2603:10b6:5:40::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.7 via Frontend Transport; Wed,
 28 Jan 2026 08:00:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF00017096.mail.protection.outlook.com (10.167.18.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Wed, 28 Jan 2026 08:00:01 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 27 Jan
 2026 23:59:47 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 27 Jan
 2026 23:59:46 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.127.8.9) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 27 Jan 2026 23:59:45 -0800
From: Oleksandr Shamray <oleksandrs@nvidia.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <vadimp@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Oleksandr
 Shamray" <oleksandrs@nvidia.com>
Subject: [PATCH platform-next v3 2/2] platform: mellanox: mlx-platform: Add support DGX flavor of next-generation 800GB/s ethernet switch.
Date: Wed, 28 Jan 2026 09:59:39 +0200
Message-ID: <20260128075939.2704019-3-oleksandrs@nvidia.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260128075939.2704019-1-oleksandrs@nvidia.com>
References: <20260128075939.2704019-1-oleksandrs@nvidia.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017096:EE_|LV2PR12MB5965:EE_
X-MS-Office365-Filtering-Correlation-Id: 82662f85-5136-4846-9313-08de5e433d1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0aYaGALDNXcA4bHAMKaRGF1amwbqItZMMx854+WeTzzbfT1HTBgUrb83RS6F?=
 =?us-ascii?Q?6Hgp1j5w9g9ESLCXPhTH7AFn2DOJRrkB5reEi+ehpavqphIza8JcWIwyVF7H?=
 =?us-ascii?Q?xU7XtHbXIgcMwXQrzy7RyOrVrsA1KRo0AlpAY3fq9h9BTf9Op4JzS1d/0o3R?=
 =?us-ascii?Q?qsi174deryompuZiYYzNndCCvBiVozJ4Y4HlwVupw8CpuY+Z1Mpa3nFfH18D?=
 =?us-ascii?Q?uXumO1aKU27lrV9kZlRJi9A6USMLny/D2Yd/RBkJbjODP7UzpNh57RqJMiPN?=
 =?us-ascii?Q?at1glLvNnFcsTOLx58c6jBTrVK4GjmAW9GnLgu+drRVwXUgfIq9JFmKWgs7z?=
 =?us-ascii?Q?tpl2XIUnx4G2tG9r2MATh2cb6OgMTZpX/Rlap3JugF4vgNhp24iDjKfpAC1k?=
 =?us-ascii?Q?x5W3LiJSOjIl28TeNGFjMYs9NlRNg6XFLFQ9UhlXD8y1GfTfSa8QTIHz6CEg?=
 =?us-ascii?Q?rTS22UYoDaCcoUQuR6C2iudBYti0evfOqnj1tMCxZ82Kv5eMa2NKKNjcKnwx?=
 =?us-ascii?Q?e7KGI444+zDRgYbmzhhSjuzkVkwk+ogsqBPjRchhVdwCIxg5ghDgAJeC7I4y?=
 =?us-ascii?Q?s4INY0tL7xQI0oG5xvBM0n6DiR435t+iPNCLCf87Z87p7EP0GX6asCVryivQ?=
 =?us-ascii?Q?RrlUecOnxb3BCkKaTGJhHcCprqZgsXRnzCgUZuM+kCggEXjUxfxmt3NRjjTA?=
 =?us-ascii?Q?jPBMLjquqoDySDhiMpPzmASisjkw63CETxp8GdwIRTJuTVjZUNFds3VTPnXL?=
 =?us-ascii?Q?X5gtNFVf085moUaxpvE4H5BEWNzYgWQCojG79MqNld65hJiKAcP+ZC2vCAwA?=
 =?us-ascii?Q?Gre+hI2lUdGstMnHiDQDC4lOmM2Hbo7EDT9bF72pfPEnhXC4wO5tIIo0wXsC?=
 =?us-ascii?Q?rEm4kE+tKHMAnUwCfef8Udq2acOpHC91FCPyMB+vt3O86XtU5+VrnIpis/19?=
 =?us-ascii?Q?ZPFOGEiwPTKfv+70lvL6BzHJKdm1eY32WZ1FO8ld1A3rckAJOhl24cJBrveB?=
 =?us-ascii?Q?kttlL64I7w9DrjXfaHvO4cZhOohfFCdkZN1ACR4/73GQ3P++G9m0sPXDwoJ8?=
 =?us-ascii?Q?wSaXkf8Z323vfraAMCfdJ4LGQfiY+dwjDUkkPZB2aK2hfyJBBgIk/NQ1FZkL?=
 =?us-ascii?Q?rFfMLQWCzrrfFvjwVX+jlLe2jmTKqw0TaviSL/wT3stWSICT9iOOHESeQy9+?=
 =?us-ascii?Q?0/1JeOQOhcYWkcyQQRPD40aLoXaSR/d+Cxh+IdDIouDyeWkAXOfR9q3onzWJ?=
 =?us-ascii?Q?CjwWemPSPHwSdXZorAkZIFvyH42SkBssP3KAyyNJGhLh2oe1cUQ9JEuAC5gl?=
 =?us-ascii?Q?xhpBNZ7NItYLMVTscSjhKkA6DfeiBAi189psHvYJ9eYY9pXgSUSUtuVycn9G?=
 =?us-ascii?Q?dXUAmgxTCDCtsMjitLmqfapZUwfHXyLOIfF1tzpfA5sQ065JHN3xBweJt4W3?=
 =?us-ascii?Q?rTRn0bkAfn2C2l2gwZgWLQUGpXTw8WUvEyaaK5JZmTv2pCoOKIi69nQ+TGqj?=
 =?us-ascii?Q?TXHjifiIu/Blu20S28VL4c2taEbnfJ+kKMh4K7d0YucuFC3Aw1Yu+tRGO70k?=
 =?us-ascii?Q?GUHA22YZ46duxtL4wDZtDtyRFeUL7fnGaMlorMhl3ThNde0Jq2mxTN9CIIZT?=
 =?us-ascii?Q?GRY36Hu0wudCShlc6BJLH+wNFlzFBwMHGXiSgSV2/eV9JX8Yg/hYgIa2svGA?=
 =?us-ascii?Q?EypzLg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 08:00:01.2814
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82662f85-5136-4846-9313-08de5e433d1d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017096.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5965

This system is based on Nvidia SN5600 Spectrum-4 Based 64x800Gb/s ETH Switch System, with the
following key changes:

Key changes:
  1 New system SKU: HI174.
  2.Power Supply: PSU AC replaiced with PDB board (added pdb/pwr attributes).
  3.CPLD: Update register map with new PDB related signals.

Signed-off-by: Oleksandr Shamray <oleksandrs@nvidia.com>
Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
---
v0 -> v3
- Comments pointed out by Ilpo:
 - modify commit text.
 - fix patch version (by mistake v2 version was not specified).
---
 drivers/platform/mellanox/mlx-platform.c | 28 ++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/platform/mellanox/mlx-platform.c b/drivers/platform/mellanox/mlx-platform.c
index af0c6f4e8c12..1d1b7caef5f0 100644
--- a/drivers/platform/mellanox/mlx-platform.c
+++ b/drivers/platform/mellanox/mlx-platform.c
@@ -7772,6 +7772,27 @@ static int __init mlxplat_dmi_ng800_matched(const struct dmi_system_id *dmi)
 	return mlxplat_register_platform_device();
 }
 
+static int __init mlxplat_dmi_ng800_dgx_matched(const struct dmi_system_id *dmi)
+{
+	int i;
+
+	mlxplat_max_adap_num = MLXPLAT_CPLD_MAX_PHYS_ADAPTER_NUM;
+	mlxplat_mux_num = ARRAY_SIZE(mlxplat_ng800_mux_data);
+	mlxplat_mux_data = mlxplat_ng800_mux_data;
+	mlxplat_hotplug = &mlxplat_mlxcpld_dgx_ext_data;
+	mlxplat_hotplug->deferred_nr =
+		mlxplat_msn21xx_channels[MLXPLAT_CPLD_GRP_CHNL_NUM - 1];
+	mlxplat_led = &mlxplat_default_ng_led_data;
+	mlxplat_regs_io = &mlxplat_dgx_ng_regs_io_data;
+	mlxplat_fan = &mlxplat_default_fan_data;
+	for (i = 0; i < ARRAY_SIZE(mlxplat_mlxcpld_wd_set_type2); i++)
+		mlxplat_wd_data[i] = &mlxplat_mlxcpld_wd_set_type2[i];
+	mlxplat_i2c = &mlxplat_mlxcpld_i2c_ng_data;
+	mlxplat_regmap_config = &mlxplat_mlxcpld_regmap_config_ng400;
+
+	return mlxplat_register_platform_device();
+}
+
 static int __init mlxplat_dmi_l1_switch_matched(const struct dmi_system_id *dmi)
 {
 	int i;
@@ -7926,6 +7947,13 @@ static const struct dmi_system_id mlxplat_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_BOARD_NAME, "VMOD0011"),
 		},
 	},
+	{
+		.callback = mlxplat_dmi_ng800_dgx_matched,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "VMOD0013"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "HI174"),
+		},
+	},
 	{
 		.callback = mlxplat_dmi_ng800_matched,
 		.matches = {
-- 
2.47.3

