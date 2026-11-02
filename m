Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793604055;
	b=V/hERCTB73d3OcE4DxFn8+IVARBylu39CnsONjQ6QVBt3ksUNWNu+YG/42ZeIG9aOq7l
	 oOQphm1VKU6VrVMW5TIzf5kYOrdsWMWwyDHkucDv4Pml6+aTv6c29SmHbuYOx+hDwT+wP
	 GqOWdtLslXWcjccx6dFRd8sj0Q81D45Lef6Smzip7EHvjHWylCDteIyXQD16mJbRLB/3H
	 BSPiqQn2usHir66ZE3Y3+qAels8RYc6EmvrKjIQvJey3BWGcsAaZ/yE8WRZXavuiPf3dj
	 EAkMuZBPC/hRZiMLcEGGsoW3pahjlYIcBVdY0LZ182verLk805CPxN7/5OgDZhDwY5A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793604055;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Vt7G/DRcq+gf0fE+3ApGBRwc1qiUcIV7XvN4bQYkw78=;
	b=bOsRmFQpEfQO5lkushc7tJmk8ZuaYOe0DGoroZeUSSb++O53xYp6qvnZ24tJ25NJAjzy
	 iExMqoFc1OVwBUZ01PrG4G57VHvyTAl9W8JpYzxNjtVvazWepJZXvqgee05gvf8poJGhh
	 oLz4unB+O1qHBa2l84L6eZjFnPwZcuHHQfXn20AvAlVQpCuLAveYRBKA/6h7soARgT3m3
	 udODYc7vCa0uoyP4PCB/EY+I/jA/z7egIB/DbnO47urSvnlwTyHpGo3zzko/t6W4dLgCK
	 +NXUl6A2sM8TglxzfFhRxbIOIuryP4R39K/7aVaIYkZ1hmco0XkneEO7zV2aCaSMueg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=F7a55fTX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.54
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012054.outbound.protection.outlook.com [52.101.43.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00876606A326
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Nov 2026 07:20:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00876606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=F7a55fTX
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RQsVPRTsd4bMz+BmKlYrtxRV/Jnug+pKB2W5fNtPBys6eQri8TgTWzLh3pl7es1TxlJ06d72klMrVEnpX0yXbIRBn0U3kKRLeqKssRcnu82/AQ8CVVKNytbDWDwGiSGEryzC6pb4srtmn/stHRfalmXtWPqvcdpxh3mAc7jx837By56A4Dot4VHq9I/6DxS5PTn5DW8x1cZ1Gkrmq8NJHz9PiGBzcSCyGN98Z6Nt3RGIp+Q5sdzEkFDtbn84z4jckrO3C0pCy/ig/jKtIbYi2pO0Ed4jxSi4inC3zpJebr4z/AXpTq8/YeVvgwSMjYxt518BtEPi7MsNExzYoPkylw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vt7G/DRcq+gf0fE+3ApGBRwc1qiUcIV7XvN4bQYkw78=;
 b=Hsdn6t8A+/mYKJwpl+C4VVOVEhy+/ZCyNuJZVvny1xABcriSRDFdRREgI6DjxRX7IIQ9H6IGpajP6By/WEMm5x5MAs11d7WLVhpxogtWthqiPp2t1o8zIWR51mUMqMJusk3PfmbUOatRH1sINUMLDa3lr/l45KA4lFF7F8+GhQqh/lwbcBtLu/fzGE6rEErjzlT9H2yJRDXvhHdHVUMA0q7U1vYJzLQufRalVa3BXKcSsrf0zYhdsGwEJpSK33MeKPXIO5XZIzRT7tFZ+a7sxnvXTLpBwFjerI49REI7bZVjyNkaqPNKRXxCeVteBwq+0pUAiNOoDGSf55cJjGd7vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vt7G/DRcq+gf0fE+3ApGBRwc1qiUcIV7XvN4bQYkw78=;
 b=F7a55fTXEgL8XKIvzOnNHjf/LUbjD4owKyGY0Ceo+KNuDryM1OpJEIZRyobVGBdUBGr1wjyvERUdEh8D/dVE9JMnCADEAiuELCZAi1WMbE0v8Aju38ivQYsP9Kf8Sav26KxehhzTcXs0evpz0WUVqmgPpsgUq2EyUh2GDtW0KvU=
Received: from MW3PR06CA0008.namprd06.prod.outlook.com (2603:10b6:303:2a::13)
 by LV2PR12MB806340.namprd12.prod.outlook.com (2603:10b6:408:422::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 07:20:50 +0000
Received: from SJ1PEPF000037A5.namprd04.prod.outlook.com
 (2603:10b6:303:2a:cafe::78) by MW3PR06CA0008.outlook.office365.com
 (2603:10b6:303:2a::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Mon, 2
 Nov 2026 07:20:50 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000037A5.mail.protection.outlook.com (10.167.244.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 07:20:50 +0000
Received: from trento15c5.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 2 Nov
 2026 01:20:48 -0600
From: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <Suma.Hegde@amd.com>,
	<NaveenKrishna.Chatradhi@amd.com>, Muthusamy Ramalingam
	<Muthusamy.Ramalingam@amd.com>
Subject: [PATCH 18/26] platform/x86/amd/hsmp: Add SVI3 temperature sysfs files
Date: Mon, 2 Nov 2026 07:19:16 +0000
Message-ID: <416536deccaca4bb219862915e366d36d50d3868.1793602633.git.Muthusamy.Ramalingam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1793602633.git.Muthusamy.Ramalingam@amd.com>
References: <cover.1793602633.git.Muthusamy.Ramalingam@amd.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A5:EE_|LV2PR12MB806340:EE_
X-MS-Office365-Filtering-Correlation-Id: c32250f7-5358-426d-d703-08df38b1d28f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|261021121427099003|261022105027099003|261009223027099003|261026121527099003|261026140227099003|261028144727099003|11063799006|10067099003|56012099006|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	OyesMLKCZwzrZyFJqPcHo8Dd/ej+J/Ybwgf4TNbYLyTboXrthV3Te4QpgfWW0LFj8kkUpBp2iOUBBcUp4+6m19yM0sAu6dHf04uPIispSkGCUWsIwAtJ3CagPrr2yhNxRgjb+1yiRQ4VjFM2NiDeJ3H17gigi1ggh7LhLNeyUSYPeI4OR/naQ8E6ZXFULSLu589vpLdzgvlR73wSOjbOFZcnd+uVY/e60MoCTE5n6oJseGBGuJpervtALwdZYv/Vx64ld7f0tnl+COI/EGcnhi0K+tyqJG4nXton/srS1g154kZYWCKVUFpyB7hsm3Hkb95wdwKILAbaPRDPRQGAK7WAYEDU5lHGPIbI1BCH534PHQ/RFgpOs7+L6kIjASIhsYcawFESJS2Kb4ixnb8iyFZ48wRJ37R5pKHXXoYaJTO7YWVqC42TLY4AgWDR17kvPUsSHJCiY7S/9BDv/LYuRfqbH6N8bee5+J8uL6x5vZK0I2Q3XRMup2Bf1gtMBuqrodbE3L5FYmhGat813dgohi0WhdPYmGREo5nNjQO7j4+BSZ8Dg9zqTSOob2oJAAehLD/MSIpE5c7ypG6iZ0qBZqAaCDoKpgHXnm0p7sm/eT8qyMDTYbjwHelRi2zFo8wzCEtGokKDneIt1FeqL+pNOVjI+0mgd8IZO78lhdrnlEVWmUXIQrrBWrU4MdozcHAbMcZmqaDt/8ZDHwqoFJBVvg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(261021121427099003)(261022105027099003)(261009223027099003)(261026121527099003)(261026140227099003)(261028144727099003)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4nBCDqm1Ip9coKBOkN/yX6Zbd5zY1e/Rord6jcg9/inlZ63niv1QSQwnpwWaJ0K0ib5teXYCqvnEeKlVu9faiUmXDbwjWPQrlLcm5BGSZFzLVxmFltKezS6jl+qYxmI91OHkBfSq27U0KpcBOLqFQFZH0HT0OR1GXUlDm8qY0ih6u0WBhhRQUVjaAtUAlEzNCas418T9r6IoR1qpiad0WViYuULhtVvkhTLCwfu/MBkplZW4IwfzB1G+McenRkwP+X2tsZOGgBxCwhPFHB5dlGzgVwTp30cmgucta89Iuen8oIlaysvawsIKbZDRqaD6OVrh6SScMOrPwblufaLzXiFSJTvKJueWRlYLztGzNka1DISiLChQ38OcTjoM3D9O8j3DYkXkboaf9eZlD2mrFENYA0ltjMRD0NG1nrKa87NRFQBwxD5qtzs/y3RklTLP
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 07:20:50.1610
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c32250f7-5358-426d-d703-08df38b1d28f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037A5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB806340

Expose a read-only svi3_temperature directory on both drivers. The
per-rail files report HSMP_GET_SVI3_VR_CTRL_TEMP. svi3_max_temperature
prints "<degrees> <rail_name>" for the hottest rail. Hide the directory
when that message is not enabled.

Co-developed-by: Suma Hegde <Suma.Hegde@amd.com>
Signed-off-by: Suma Hegde <Suma.Hegde@amd.com>
Signed-off-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
---
 Documentation/arch/x86/amd_hsmp.rst   |   4 +
 drivers/platform/x86/amd/hsmp/acpi.c  |  47 ++++++++++++
 drivers/platform/x86/amd/hsmp/plat.c  | 103 ++++++++++++++++++++++++++
 drivers/platform/x86/amd/hsmp/sysfs.c |  75 +++++++++++++++++++
 drivers/platform/x86/amd/hsmp/sysfs.h |   4 +
 5 files changed, 233 insertions(+)

diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
index 1a2fd95e21ac1..093468aa52eb2 100644
--- a/Documentation/arch/x86/amd_hsmp.rst
+++ b/Documentation/arch/x86/amd_hsmp.rst
@@ -182,6 +182,10 @@ write-only when the platform enables only that direction of the message.
   "<range> <1x|2x>". The directory is absent when no channel responds.
   dimm_max_temperature_range returns "<range> <1x|2x> 0xAA" for the
   hottest channel, or fails with -ENODATA when none respond.
+* svi3_temperature/: Read-only SVI3 regulator temperature in degrees
+  Celsius. vddcr_cpu0, vddcr_cpu1, vddcr_soc, vddio_mem_s3, and vddio
+  each return one rail. svi3_max_temperature returns "<degrees> <rail_name>"
+  for the hottest rail.
 * socket_power_limit_max: Maximum socket power limit in mWatts (read only).
 * cclk_boost_limit: Socket boost limit in MHz (write only). Accepted range
   is 100-10000 MHz.
diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 2028c1e8fc1c3..935cca42b642b 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -650,6 +650,20 @@ HSMP_XGMI_WR(g7, 39);
 #undef HSMP_XGMI_AGG
 #undef HSMP_XGMI_RD
 #undef HSMP_XGMI_WR
+#define HSMP_SVI3_ATTR(_name, _rail)					\
+	HSMP_SYS_ATTR_PRIV(_name, _name, hsmp_svi3_temp_show, U16_MAX,	\
+			   HSMP_GET_SVI3_VR_CTRL_TEMP, _rail)
+
+HSMP_SVI3_ATTR(vddcr_cpu0, 0);
+HSMP_SVI3_ATTR(vddcr_cpu1, 1);
+HSMP_SVI3_ATTR(vddcr_soc, 2);
+HSMP_SVI3_ATTR(vddio, 3);
+HSMP_SVI3_ATTR(vddio_mem_s3, 4);
+#undef HSMP_SVI3_ATTR
+
+HSMP_SYS_ATTR(svi3_max_temperature, svi3_max_temperature, 0444,
+	      hsmp_svi3_max_temp_show, NULL, U16_MAX,
+	      HSMP_GET_SVI3_VR_CTRL_TEMP, HSMP_GET_SVI3_VR_CTRL_TEMP);
 HSMP_DEV_ATTR_W(cclk_boost_limit, HSMP_SET_BOOST_LIMIT_SOCKET,
 		hsmp_cclk_boost_limit_store, 0200);
 HSMP_DEV_ATTR_RW(apb_disable, HSMP_SET_DF_PSTATE, HSMP_SET_DF_PSTATE,
@@ -835,6 +849,16 @@ static struct attribute *lclk_attrs[] = {
 	NULL
 };
 
+static struct attribute *svi3_temp_attrs[] = {
+	&hattr_vddcr_cpu0.dattr.attr,
+	&hattr_vddcr_cpu1.dattr.attr,
+	&hattr_vddcr_soc.dattr.attr,
+	&hattr_vddio.dattr.attr,
+	&hattr_vddio_mem_s3.dattr.attr,
+	&hattr_svi3_max_temperature.dattr.attr,
+	NULL
+};
+
 static umode_t hsmp_lclk_is_visible(struct kobject *kobj,
 				    struct attribute *attr, int id)
 {
@@ -952,6 +976,28 @@ static const struct attribute_group xgmi_bw_group = {
 	.is_visible = hsmp_xgmi_bw_is_visible,
 };
 
+static umode_t hsmp_svi3_is_visible(struct kobject *kobj,
+				    struct attribute *attr, int id)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct hsmp_socket *sock;
+
+	if (is_client_platform())
+		return id == 0 ? SYSFS_GROUP_INVISIBLE : 0;
+
+	sock = dev_get_drvdata(dev);
+	if (!sock || !is_read_msg_enabled(sock, HSMP_GET_SVI3_VR_CTRL_TEMP))
+		return id == 0 ? SYSFS_GROUP_INVISIBLE : 0;
+
+	return attr->mode;
+}
+
+static const struct attribute_group svi3_temperature_group = {
+	.name = "svi3_temperature",
+	.attrs = svi3_temp_attrs,
+	.is_visible = hsmp_svi3_is_visible,
+};
+
 static struct attribute *dimm_power_attrs[] = {
 	&hattr_dpwr_80.dattr.attr,
 	&hattr_dpwr_81.dattr.attr,
@@ -1132,6 +1178,7 @@ static const struct attribute_group *hsmp_groups[] = {
 	&lclk_group,
 	&io_bw_group,
 	&xgmi_bw_group,
+	&svi3_temperature_group,
 	&dimm_power_group,
 	&dimm_temperature_group,
 	&dimm_temperature_range_group,
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index 809dd2cbb9948..2c6d460c56d3a 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -878,6 +878,43 @@ HSMP_XGMI_WR(g7, 39, 7);
 #undef HSMP_XGMI_AGG
 #undef HSMP_XGMI_RD
 #undef HSMP_XGMI_WR
+#define HSMP_SVI3_ATTR(_name, _rail, _sock)				\
+	HSMP_SYS_ATTR_PRIV(_name##_sock, _name, hsmp_svi3_temp_show,	\
+			   _sock, HSMP_GET_SVI3_VR_CTRL_TEMP, _rail)
+
+#define HSMP_SVI3_X8(_name, _rail)					\
+	HSMP_SVI3_ATTR(_name, _rail, 0);				\
+	HSMP_SVI3_ATTR(_name, _rail, 1);				\
+	HSMP_SVI3_ATTR(_name, _rail, 2);				\
+	HSMP_SVI3_ATTR(_name, _rail, 3);				\
+	HSMP_SVI3_ATTR(_name, _rail, 4);				\
+	HSMP_SVI3_ATTR(_name, _rail, 5);				\
+	HSMP_SVI3_ATTR(_name, _rail, 6);				\
+	HSMP_SVI3_ATTR(_name, _rail, 7)
+
+HSMP_SVI3_X8(vddcr_cpu0, 0);
+HSMP_SVI3_X8(vddcr_cpu1, 1);
+HSMP_SVI3_X8(vddcr_soc, 2);
+HSMP_SVI3_X8(vddio, 3);
+HSMP_SVI3_X8(vddio_mem_s3, 4);
+#undef HSMP_SVI3_ATTR
+#undef HSMP_SVI3_X8
+
+#define HSMP_SVI3_MAX(_sock)						\
+	HSMP_SYS_ATTR(svi3_max_temperature##_sock, svi3_max_temperature, \
+		      0444, hsmp_svi3_max_temp_show, NULL, _sock,	\
+		      HSMP_GET_SVI3_VR_CTRL_TEMP, HSMP_GET_SVI3_VR_CTRL_TEMP)
+
+HSMP_SVI3_MAX(0);
+HSMP_SVI3_MAX(1);
+HSMP_SVI3_MAX(2);
+HSMP_SVI3_MAX(3);
+HSMP_SVI3_MAX(4);
+HSMP_SVI3_MAX(5);
+HSMP_SVI3_MAX(6);
+HSMP_SVI3_MAX(7);
+#undef HSMP_SVI3_MAX
+
 #define HSMP_DIMM_RO(_var, _name, _show, _msg, _priv, _sock)		\
 	HSMP_SYS_ATTR_PRIV(_var##_##_sock, _name, _show, _sock, _msg, _priv)
 
@@ -1922,6 +1959,26 @@ HSMP_LCLK_ATTR_LIST(5);
 HSMP_LCLK_ATTR_LIST(6);
 HSMP_LCLK_ATTR_LIST(7);
 
+#define HSMP_SVI3_ATTR_LIST(_sock_ind)					\
+static struct attribute *sock##_sock_ind##_svi3_attrs[] = {		\
+	&hattr_vddcr_cpu0##_sock_ind.dattr.attr,			\
+	&hattr_vddcr_cpu1##_sock_ind.dattr.attr,			\
+	&hattr_vddcr_soc##_sock_ind.dattr.attr,				\
+	&hattr_vddio##_sock_ind.dattr.attr,				\
+	&hattr_vddio_mem_s3##_sock_ind.dattr.attr,			\
+	&hattr_svi3_max_temperature##_sock_ind.dattr.attr,		\
+	NULL								\
+}
+
+HSMP_SVI3_ATTR_LIST(0);
+HSMP_SVI3_ATTR_LIST(1);
+HSMP_SVI3_ATTR_LIST(2);
+HSMP_SVI3_ATTR_LIST(3);
+HSMP_SVI3_ATTR_LIST(4);
+HSMP_SVI3_ATTR_LIST(5);
+HSMP_SVI3_ATTR_LIST(6);
+HSMP_SVI3_ATTR_LIST(7);
+
 static umode_t hsmp_lclk_is_visible(struct kobject *kobj,
 				    struct attribute *attr, int id)
 {
@@ -1955,6 +2012,39 @@ HSMP_LCLK_GRP(5);
 HSMP_LCLK_GRP(6);
 HSMP_LCLK_GRP(7);
 
+static umode_t hsmp_svi3_is_visible(struct kobject *kobj,
+				    struct attribute *attr, int id)
+{
+	struct device_attribute *dattr = container_of(attr, struct device_attribute, attr);
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(dattr);
+	struct hsmp_socket *sock;
+
+	if (hattr->sock_ind >= hsmp_pdev->num_sockets)
+		return id == 0 ? SYSFS_GROUP_INVISIBLE : 0;
+
+	sock = &hsmp_pdev->sock[hattr->sock_ind];
+	if (!is_read_msg_enabled(sock, hattr->msg_id))
+		return id == 0 ? SYSFS_GROUP_INVISIBLE : 0;
+
+	return attr->mode;
+}
+
+#define HSMP_SVI3_GRP(index)						\
+static const struct attribute_group sock##index##_svi3_grp = {		\
+	.name = "svi3_temperature",					\
+	.attrs = sock##index##_svi3_attrs,				\
+	.is_visible = hsmp_svi3_is_visible,				\
+}
+
+HSMP_SVI3_GRP(0);
+HSMP_SVI3_GRP(1);
+HSMP_SVI3_GRP(2);
+HSMP_SVI3_GRP(3);
+HSMP_SVI3_GRP(4);
+HSMP_SVI3_GRP(5);
+HSMP_SVI3_GRP(6);
+HSMP_SVI3_GRP(7);
+
 static const struct attribute_group *hsmp_sock_attr_grps[] = {
 	&sock0_attr_grp,
 	&sock1_attr_grp,
@@ -2145,6 +2235,17 @@ static const struct attribute_group *hsmp_sock_xgmibw_grps[] = {
 	&sock7_xgmibw_grp,
 };
 
+static const struct attribute_group *hsmp_sock_svi3_grps[] = {
+	&sock0_svi3_grp,
+	&sock1_svi3_grp,
+	&sock2_svi3_grp,
+	&sock3_svi3_grp,
+	&sock4_svi3_grp,
+	&sock5_svi3_grp,
+	&sock6_svi3_grp,
+	&sock7_svi3_grp,
+};
+
 #define HSMP_DIMM_PWR_LIST(_s)						\
 static struct attribute *sock##_s##_dpwr_attrs[] = {		\
 	&hattr_dpwr_80_##_s.dattr.attr,				\
@@ -2546,6 +2647,7 @@ static void hsmp_remove_plat_sock_kobjs(void)
 		sysfs_remove_group(hsmp_plat_sock_kobj[i], hsmp_sock_drange_grps[i]);
 		sysfs_remove_group(hsmp_plat_sock_kobj[i], hsmp_sock_dtemp_grps[i]);
 		sysfs_remove_group(hsmp_plat_sock_kobj[i], hsmp_sock_dpwr_grps[i]);
+		sysfs_remove_group(hsmp_plat_sock_kobj[i], hsmp_sock_svi3_grps[i]);
 		sysfs_remove_group(hsmp_plat_sock_kobj[i], hsmp_sock_xgmibw_grps[i]);
 		sysfs_remove_group(hsmp_plat_sock_kobj[i], hsmp_sock_iobw_grps[i]);
 		sysfs_remove_group(hsmp_plat_sock_kobj[i], hsmp_sock_lclk_grps[i]);
@@ -2577,6 +2679,7 @@ static int hsmp_create_socket_sysfs(struct device *dev)
 			hsmp_sock_lclk_grps[i],
 			hsmp_sock_iobw_grps[i],
 			hsmp_sock_xgmibw_grps[i],
+			hsmp_sock_svi3_grps[i],
 			hsmp_sock_dpwr_grps[i],
 			hsmp_sock_dtemp_grps[i],
 			hsmp_sock_drange_grps[i],
diff --git a/drivers/platform/x86/amd/hsmp/sysfs.c b/drivers/platform/x86/amd/hsmp/sysfs.c
index 5a2e79a574022..8fe67421ef6fc 100644
--- a/drivers/platform/x86/amd/hsmp/sysfs.c
+++ b/drivers/platform/x86/amd/hsmp/sysfs.c
@@ -1669,6 +1669,81 @@ umode_t hsmp_dimm_temp_range_file_visible(const struct hsmp_socket *sock, int id
 	return (sock->dimm_temp_range_valid & BIT(id)) ? 0444 : 0;
 }
 
+/* HSMP Table 183. Indices above this range are not named. */
+static const char * const svi3_rail_names[] = {
+	"vddcr_cpu0",
+	"vddcr_cpu1",
+	"vddcr_soc",
+	"vddio",
+	"vddio_mem_s3",
+};
+
+static int hsmp_svi3_query(struct device *dev, struct hsmp_sys_attr *hattr,
+			   u32 arg, u32 *raw)
+{
+	struct hsmp_message msg = {};
+	u16 sock_ind;
+	int ret;
+
+	sock_ind = hsmp_sysfs_sock_ind(dev, hattr);
+	if (sock_ind == U16_MAX)
+		return -EINVAL;
+
+	/*
+	 * HSMP_GET_SVI3_VR_CTRL_TEMP:
+	 * input args[0] = rail index[3:1] + selection[0]
+	 *   selection 0 asks for the hottest rail, 1 selects the index
+	 * output args[0] = rail index[30:28] + temperature C[27:0]
+	 */
+	msg.msg_id = HSMP_GET_SVI3_VR_CTRL_TEMP;
+	msg.sock_ind = sock_ind;
+	msg.num_args = 1;
+	msg.response_sz = 1;
+	msg.args[0] = arg;
+
+	ret = hsmp_send_message(&msg);
+	if (ret)
+		return ret;
+
+	*raw = msg.args[0];
+	return 0;
+}
+
+ssize_t hsmp_svi3_temp_show(struct device *dev, struct device_attribute *attr,
+			    char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	u32 raw;
+	int ret;
+
+	/* selection[0] = 1 selects the rail in index[3:1] */
+	ret = hsmp_svi3_query(dev, hattr, BIT(0) | ((hattr->priv & 0x7) << 1),
+			      &raw);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%u\n", raw & 0x0fffffff);
+}
+
+ssize_t hsmp_svi3_max_temp_show(struct device *dev, struct device_attribute *attr,
+				char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	u32 raw, rail;
+	int ret;
+
+	ret = hsmp_svi3_query(dev, hattr, 0, &raw);
+	if (ret)
+		return ret;
+
+	rail = (raw >> 28) & 0x7;
+	if (rail >= ARRAY_SIZE(svi3_rail_names))
+		return -ERANGE;
+
+	return sysfs_emit(buf, "%u %s\n", raw & 0x0fffffff,
+			   svi3_rail_names[rail]);
+}
+
 static ssize_t hsmp_lclk_nbio_show(struct device *dev,
 				   struct device_attribute *attr,
 				   u8 nbio_id, char *buf)
diff --git a/drivers/platform/x86/amd/hsmp/sysfs.h b/drivers/platform/x86/amd/hsmp/sysfs.h
index f620a58683904..716d9e4493a1b 100644
--- a/drivers/platform/x86/amd/hsmp/sysfs.h
+++ b/drivers/platform/x86/amd/hsmp/sysfs.h
@@ -185,6 +185,10 @@ ssize_t hsmp_dimm_max_temp_range_show(struct device *dev,
 umode_t hsmp_dimm_power_file_visible(const struct hsmp_socket *sock, int id);
 umode_t hsmp_dimm_temp_file_visible(const struct hsmp_socket *sock, int id);
 umode_t hsmp_dimm_temp_range_file_visible(const struct hsmp_socket *sock, int id);
+ssize_t hsmp_svi3_temp_show(struct device *dev, struct device_attribute *attr,
+			    char *buf);
+ssize_t hsmp_svi3_max_temp_show(struct device *dev, struct device_attribute *attr,
+				char *buf);
 
 /*
  * True when the attribute store issues a GET, or only records state for
-- 
2.34.1

