Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793604041;
	b=aunIi/r6tuklg3buvDnTyZwnCIzAjfw99fgFQC2hdC7vnQUFKpYD9EK1ZNMnKqhS0Z8Q
	 yyGPzUp6Mi3vGU+UFqa7onYbRuqrVxJaOtpHKJWZjAKo23omfSTO45Ifs7DlSES0PXorY
	 ac/+xI7FbVjxpw8M7iBYTuXoOKRoGxbKFzRcSL0qk/FVPUjuVzVyMJ6C5bSvPnbWGhQuE
	 VbxWz/7uHPkznJDjEaBtGmwI3Tm/0JKcL+dCzPLUYSw78hF6mSw+ZpU6YYrKZ1VATPlVb
	 uBzyIf1N5OYAFrlzUGLfo2H9kJcdsIeiGGeWAKvbaYS9t5pQW38YQWun9z+VMReau6A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793604041;
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
	bh=DpobA75oWy/jJs/lnt65wGZ3o+nmf108yLG6N0e2fWM=;
	b=DRX+PAKD3XiRMKuP1eYMEP+6+eQkqA1jKTBHl+4GwYBP6Z7g7RkoUwxcZj8Df1BYcLY9
	 jR7amCkY2WbZxQiu/arUHmh+I0tdXvS6PoqLQT669b5RieyRGyDZgSF0fcv6QqTT4LqUW
	 KuVSynsgQB+jWWqpnp7CGgRE2ly/NzqgSvrwbJMoutGraV3w3lWqyzcezf8mdLaJkhOpZ
	 fyQkQg1a6DBWWB3ZBT7E/9m1yt8vARzdVo/cooFkCkP3bpN0CDy6F2Mx4IcWD9mI/R7XS
	 qIuVkF76XHM1TxVHv+C3lXc85gcJy4xOBJnKYUSdeXUIfxhugPNPouLzWeD6ieH5yZg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=HEJb5aBk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.25
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010025.outbound.protection.outlook.com [52.101.201.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9908D606A329
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Nov 2026 07:20:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9908D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=HEJb5aBk
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GCEowxmDei+PXJlgX24kYlKCLT+ltLtlwzeErG8gHEgevvDrs4XYb64MRXUkyA1/mOD9yq9/KscnvSwtCXzla4mS3oqMeLj/ohcTDb8DwPXSEirta7JJbGZ28cwHZC0fA/C43B+qoSiKZJy+DDeHF+3d2Scjvai1GTXZ924WH+dNzgems31tQdgs82HKkpWBFH4KuDS7N2Yi1MsjrkhGeGerJgcH2HIuGlvZUgAJqvhbHCW+4VlV/QFAA6Au99gSBWx5aAS4W5hFaRaBp8O9WcBkVgDmu6tNb/cY5Ku3ls3labAVrpgX65qHIe+Ua2aR7UuOGQBDKIsLEfjPn6FE1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DpobA75oWy/jJs/lnt65wGZ3o+nmf108yLG6N0e2fWM=;
 b=PFOCryKX/trK55Lh2C3v++22MQgkyQtcD2IcDOwu47+Khs1r4T0WOMaAznuprAREkFAkW1CSVQVfBsAy8EgpEVL2LBnnvaTT1WJsmdqITiNqFfu3+R0vt58qNwIrR23bwbMAybHu+WRH/V0W9/N4nntXuwRPrLrfxMIbwcfh262ZlJMJSRK3bsRb5aBZMBcKa1UoVntyBcxssgzjHFEiLVaaFORZcOdsxi/nl/Xnvz+veKamt4PHlCFq+N4sACEi8VyxTgazapb50DYDVbfOuS5afqeGQfCWsAtS39vqIXa6gR/KD4mGtu6LFTBlUdMDEATIz5g/IkbF1Srh0qaXKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DpobA75oWy/jJs/lnt65wGZ3o+nmf108yLG6N0e2fWM=;
 b=HEJb5aBkdjlmxZsTDc9eEIM1gBm+qYK+yW0iFWxz0MuJz1dCPcdUv6akue7NxLK28KwoqB2qb3FyCSlWy+BshqQXjPTbLlwlbQ7YCJ4NUcvETiCgT/OC6hlwZqsHLL4f3gHrwTO5KJip3xtxeGLjam41+NKk0QiNBlbEtsqUDW8=
Received: from MW3PR06CA0029.namprd06.prod.outlook.com (2603:10b6:303:2a::34)
 by SA9PR12MB666623.namprd12.prod.outlook.com (2603:10b6:806:a5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 07:20:36 +0000
Received: from SJ1PEPF000037A5.namprd04.prod.outlook.com
 (2603:10b6:303:2a:cafe::43) by MW3PR06CA0029.outlook.office365.com
 (2603:10b6:303:2a::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Mon, 2
 Nov 2026 07:20:36 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000037A5.mail.protection.outlook.com (10.167.244.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 07:20:36 +0000
Received: from trento15c5.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 2 Nov
 2026 01:20:32 -0600
From: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <Suma.Hegde@amd.com>,
	<NaveenKrishna.Chatradhi@amd.com>, Muthusamy Ramalingam
	<Muthusamy.Ramalingam@amd.com>
Subject: [PATCH 11/26] platform/x86/amd/hsmp: Add lclk DPM sysfs files
Date: Mon, 2 Nov 2026 07:19:09 +0000
Message-ID: <1a703104b19f58f96008ee83ccf33479f0b16b4d.1793602633.git.Muthusamy.Ramalingam@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A5:EE_|SA9PR12MB666623:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b9200b6-c151-4a8b-380c-08df38b1ca5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|376014|36860700016|261021121427099003|261021123027099003|261022105027099003|261009223027099003|261026121527099003|261026140227099003|261028144727099003|11063799006|10067099003|56012099006|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	JnL5JsTKZ4hPpLrxopDcaFTuGJwuSJgYB539pQ5DWPMhuR8komTUCz2oAZVfJ9aijwoXN2Y82HA14PjDNyQvG9l5mwsZHqo3wiqdh63wU1Kj3T3B4p+x5nzUQRCzpzydIA+lPfH0Onqe0g2pdLm/kXJV33BKTHG5X+Ai5Q0Y3JUMigfnh6kcMqyP9Krv+DBEit09bZyXTMKc1qoH7eG+ZigqP7LdiPuhaA7yxvwwNCXH1EPPVpz9+s+OmIXlQ91Z5rsG9LclklujF3ZcOnJ0oYDoGZyDSzF6MUE1hpdYWMK/M/DlCF1zj9qgO6L/Yrv9ynmUSjDdgVYXvRgs3ZRBBe3OavKDk2osoQkYFqlKAfQcC9C+eFY48+yFbfv8mzSfM/cmBegO47VqjG0j1InbtoT4VD7m4X6JxS6hdjbax96lZV9r8NX7uTna2JElTC0SFPbAlqpYMp//rCw02RRCKZrEBKDRKlu+OpUlEl9gb+zwLKW5oy6Q95mLPnYt/75fKWbuy9ww04kO98rqXv0/Drhcu4gYsTHH8KGcZfPMQ4FSIvFCmIEooOQt11Jm/syGV6W7gGUuV3+tBSfwdnjPDzapbsEsY9wd2rmh3/B6u4Y1mx0/TZzGqm2Ecq5Tnn9gP9cHftlu6UFGZwz5UKsMw7qSAQOrmp5eQtQi19sErmFJW46m4/ufuwV4H3XJ09jxdcSGNq/8gWS8gBUqlzZrBw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(376014)(36860700016)(261021121427099003)(261021123027099003)(261022105027099003)(261009223027099003)(261026121527099003)(261026140227099003)(261028144727099003)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	u8qiPgDprQn1RZB6tCuqurrZb045Fv+rsTnB5i7/9mfWcum6THMW9FfvO1RfWA4yGiP8Fcllg3E137CR6n7sC2siOgVbPZLmUMH3+udsmULouuMZ9nE9McUQSJlsatBz7Zdo65faEOhRHDhTOcjAX/otiJIexznIbW2IM9iRdWUm+bbrJZdiPhfu8Ib/SgDPE0zVowy0sqi0CmQ/Lu9NAxc3lLPbvf8XSR9a4yHYA3DJwVtHfzjMUUbWLTd03QmDvtrzT38nxhvlAdF0Jc+0XWEAVItQczgAW2nOjwH0OcDSYU0F0mwuORyHjxqnDaSdQYrnR1hXSHMCxfM3tAtYEHPDyDhWKv10yrq+y2/MdYPvzQvKcNjwGFdnx3KEZO7LvXI01d0sSMIZEOuABTcMQ18Qm+EX4lpn4watqPFfGBmRzFtNTpFmLDmv08MKUr2M
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 07:20:36.4232
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b9200b6-c151-4a8b-380c-08df38b1ca5f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037A5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA9PR12MB666623

Expose read/write lclk_dpm_range/lclk_0 through lclk_dpm_range/lclk_3
on both drivers. Each file reads HSMP_GET_NBIO_DPM_LEVEL for one NBIO
and prints "min max". A write accepts "min max" (the NBIO id is the N
in lclk_N). Extra arguments are rejected. Firmware
rejects an inverted range. Hide the directory when that message is not
enabled.

Make each platform socketN directory a kobject so it can hold the
nested lclk_dpm_range group. Attribute groups can only add one
directory level.

Co-developed-by: Suma Hegde <Suma.Hegde@amd.com>
Signed-off-by: Suma Hegde <Suma.Hegde@amd.com>
Signed-off-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
---
 Documentation/arch/x86/amd_hsmp.rst   |   5 +
 drivers/platform/x86/amd/hsmp/acpi.c  |  39 ++++++
 drivers/platform/x86/amd/hsmp/plat.c  | 166 ++++++++++++++++++++++----
 drivers/platform/x86/amd/hsmp/sysfs.c | 153 ++++++++++++++++++++++++
 drivers/platform/x86/amd/hsmp/sysfs.h |  16 +++
 5 files changed, 359 insertions(+), 20 deletions(-)

diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
index 037029d1fdadd..c63fc52316361 100644
--- a/Documentation/arch/x86/amd_hsmp.rst
+++ b/Documentation/arch/x86/amd_hsmp.rst
@@ -125,6 +125,11 @@ write-only when the platform enables only that direction of the message.
 * xgmi_width: Read/write xGMI link width range as "min max".
   0 is x4, 1 is x8, and 2 is x16. Each value is an 8-bit field.
   Extra arguments are rejected. Firmware rejects unsupported widths.
+* lclk_dpm_range/lclk_0, lclk_dpm_range/lclk_1,
+  lclk_dpm_range/lclk_2, lclk_dpm_range/lclk_3: Read/write LCLK DPM
+  range for NBIO 0-3. Read returns "min max". Write accepts "min max"
+  (the NBIO id is the N in lclk_N). Extra arguments
+  are rejected. Firmware rejects an inverted range.
 * gmi3_link_width: Write-only. Sets the GMI3 link width range as
   "min max". Each value is an 8-bit field. Extra arguments are rejected.
   Firmware rejects unsupported widths.
diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index beddcf30f252c..89c9e944b5537 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -547,6 +547,14 @@ HSMP_DEV_ATTR_W(gmi3_link_width, HSMP_SET_GMI3_WIDTH,
 		hsmp_gmi3_link_width_store, 0200);
 HSMP_DEV_ATTR_W(pcie_link_rate, HSMP_SET_PCI_RATE,
 		hsmp_pcie_link_rate_store, 0200);
+HSMP_DEV_ATTR_RW(lclk_0, HSMP_GET_NBIO_DPM_LEVEL, HSMP_SET_NBIO_DPM_LEVEL,
+		 hsmp_lclk_0_show, hsmp_lclk_0_store, 0644);
+HSMP_DEV_ATTR_RW(lclk_1, HSMP_GET_NBIO_DPM_LEVEL, HSMP_SET_NBIO_DPM_LEVEL,
+		 hsmp_lclk_1_show, hsmp_lclk_1_store, 0644);
+HSMP_DEV_ATTR_RW(lclk_2, HSMP_GET_NBIO_DPM_LEVEL, HSMP_SET_NBIO_DPM_LEVEL,
+		 hsmp_lclk_2_show, hsmp_lclk_2_store, 0644);
+HSMP_DEV_ATTR_RW(lclk_3, HSMP_GET_NBIO_DPM_LEVEL, HSMP_SET_NBIO_DPM_LEVEL,
+		 hsmp_lclk_3_show, hsmp_lclk_3_store, 0644);
 HSMP_DEV_ATTR_W(cclk_boost_limit, HSMP_SET_BOOST_LIMIT_SOCKET,
 		hsmp_cclk_boost_limit_store, 0200);
 HSMP_DEV_ATTR_RW(apb_disable, HSMP_SET_DF_PSTATE, HSMP_SET_DF_PSTATE,
@@ -594,6 +602,36 @@ static struct attribute *hsmp_dev_attr_list[] = {
 	NULL
 };
 
+static struct attribute *lclk_attrs[] = {
+	&hattr_lclk_0.dattr.attr,
+	&hattr_lclk_1.dattr.attr,
+	&hattr_lclk_2.dattr.attr,
+	&hattr_lclk_3.dattr.attr,
+	NULL
+};
+
+static umode_t hsmp_lclk_is_visible(struct kobject *kobj,
+				    struct attribute *attr, int id)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct hsmp_socket *sock;
+
+	if (is_client_platform())
+		return id == 0 ? SYSFS_GROUP_INVISIBLE : 0;
+
+	sock = dev_get_drvdata(dev);
+	if (!sock || !is_read_msg_enabled(sock, HSMP_GET_NBIO_DPM_LEVEL))
+		return id == 0 ? SYSFS_GROUP_INVISIBLE : 0;
+
+	return attr->mode;
+}
+
+static const struct attribute_group lclk_group = {
+	.name = "lclk_dpm_range",
+	.attrs = lclk_attrs,
+	.is_visible = hsmp_lclk_is_visible,
+};
+
 static const struct attribute_group hsmp_attr_grp = {
 	.bin_attrs = hsmp_attr_list,
 	.attrs = hsmp_dev_attr_list,
@@ -603,6 +641,7 @@ static const struct attribute_group hsmp_attr_grp = {
 
 static const struct attribute_group *hsmp_groups[] = {
 	&hsmp_attr_grp,
+	&lclk_group,
 	NULL
 };
 
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index 479e6e9b90574..162a5b1468a76 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -44,8 +44,9 @@
 
 static struct hsmp_plat_device *hsmp_pdev;
 
-/* Parent for per-socket attribute groups: amd_hsmp/socket/socketN/ */
+/* Parent for per-socket kobjects: amd_hsmp/socket/socketN/ */
 static struct kobject *hsmp_sock_kobj;
+static struct kobject *hsmp_plat_sock_kobj[MAX_AMD_NUM_NODES];
 /* Parent for per-CPU attributes: amd_hsmp/cpu/cpuX/ */
 static struct kobject *hsmp_cpu_kobj;
 
@@ -384,6 +385,14 @@ HSMP_DEV_ATTR_W_X8(gmi3_link_width, HSMP_SET_GMI3_WIDTH,
 		   hsmp_gmi3_link_width_store, 0200);
 HSMP_DEV_ATTR_W_X8(pcie_link_rate, HSMP_SET_PCI_RATE,
 		   hsmp_pcie_link_rate_store, 0200);
+HSMP_DEV_ATTR_RW_X8(lclk_0, HSMP_GET_NBIO_DPM_LEVEL, HSMP_SET_NBIO_DPM_LEVEL,
+		    hsmp_lclk_0_show, hsmp_lclk_0_store, 0644);
+HSMP_DEV_ATTR_RW_X8(lclk_1, HSMP_GET_NBIO_DPM_LEVEL, HSMP_SET_NBIO_DPM_LEVEL,
+		    hsmp_lclk_1_show, hsmp_lclk_1_store, 0644);
+HSMP_DEV_ATTR_RW_X8(lclk_2, HSMP_GET_NBIO_DPM_LEVEL, HSMP_SET_NBIO_DPM_LEVEL,
+		    hsmp_lclk_2_show, hsmp_lclk_2_store, 0644);
+HSMP_DEV_ATTR_RW_X8(lclk_3, HSMP_GET_NBIO_DPM_LEVEL, HSMP_SET_NBIO_DPM_LEVEL,
+		    hsmp_lclk_3_show, hsmp_lclk_3_store, 0644);
 HSMP_DEV_ATTR_X8(socket_power, HSMP_GET_SOCKET_POWER, hsmp_msg_resp32_show,
 		 0444);
 HSMP_DEV_ATTR_W_X8(cclk_boost_limit, HSMP_SET_BOOST_LIMIT_SOCKET,
@@ -445,25 +454,75 @@ HSMP_DEV_ATTR_LIST(*sock5_dev_attr_list, 5);
 HSMP_DEV_ATTR_LIST(*sock6_dev_attr_list, 6);
 HSMP_DEV_ATTR_LIST(*sock7_dev_attr_list, 7);
 
-#define HSMP_ATTR_GRP(index, _list, _name, _dlist)		\
+#define HSMP_ATTR_GRP(index, _list, _dlist)			\
 static const struct attribute_group sock##index##_attr_grp = {	\
 	.bin_attrs = _list,					\
 	.attrs = _dlist,					\
 	.is_bin_visible = hsmp_is_sock_attr_visible,		\
 	.is_visible = hsmp_is_sock_dev_attr_visible,		\
-	.name = #_name,						\
 }
 
-HSMP_ATTR_GRP(0, sock0_attr_list, socket0, sock0_dev_attr_list);
-HSMP_ATTR_GRP(1, sock1_attr_list, socket1, sock1_dev_attr_list);
-HSMP_ATTR_GRP(2, sock2_attr_list, socket2, sock2_dev_attr_list);
-HSMP_ATTR_GRP(3, sock3_attr_list, socket3, sock3_dev_attr_list);
-HSMP_ATTR_GRP(4, sock4_attr_list, socket4, sock4_dev_attr_list);
-HSMP_ATTR_GRP(5, sock5_attr_list, socket5, sock5_dev_attr_list);
-HSMP_ATTR_GRP(6, sock6_attr_list, socket6, sock6_dev_attr_list);
-HSMP_ATTR_GRP(7, sock7_attr_list, socket7, sock7_dev_attr_list);
+HSMP_ATTR_GRP(0, sock0_attr_list, sock0_dev_attr_list);
+HSMP_ATTR_GRP(1, sock1_attr_list, sock1_dev_attr_list);
+HSMP_ATTR_GRP(2, sock2_attr_list, sock2_dev_attr_list);
+HSMP_ATTR_GRP(3, sock3_attr_list, sock3_dev_attr_list);
+HSMP_ATTR_GRP(4, sock4_attr_list, sock4_dev_attr_list);
+HSMP_ATTR_GRP(5, sock5_attr_list, sock5_dev_attr_list);
+HSMP_ATTR_GRP(6, sock6_attr_list, sock6_dev_attr_list);
+HSMP_ATTR_GRP(7, sock7_attr_list, sock7_dev_attr_list);
+
+#define HSMP_LCLK_ATTR_LIST(_sock_ind)					\
+static struct attribute *sock##_sock_ind##_lclk_attrs[] = {		\
+	&hattr_lclk_0##_sock_ind.dattr.attr,				\
+	&hattr_lclk_1##_sock_ind.dattr.attr,				\
+	&hattr_lclk_2##_sock_ind.dattr.attr,				\
+	&hattr_lclk_3##_sock_ind.dattr.attr,				\
+	NULL								\
+}
+
+HSMP_LCLK_ATTR_LIST(0);
+HSMP_LCLK_ATTR_LIST(1);
+HSMP_LCLK_ATTR_LIST(2);
+HSMP_LCLK_ATTR_LIST(3);
+HSMP_LCLK_ATTR_LIST(4);
+HSMP_LCLK_ATTR_LIST(5);
+HSMP_LCLK_ATTR_LIST(6);
+HSMP_LCLK_ATTR_LIST(7);
+
+static umode_t hsmp_lclk_is_visible(struct kobject *kobj,
+				    struct attribute *attr, int id)
+{
+	struct device_attribute *dattr = container_of(attr, struct device_attribute, attr);
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(dattr);
+	struct hsmp_socket *sock;
+
+	if (hattr->sock_ind >= hsmp_pdev->num_sockets)
+		return id == 0 ? SYSFS_GROUP_INVISIBLE : 0;
 
-static const struct attribute_group *hsmp_groups[] = {
+	sock = &hsmp_pdev->sock[hattr->sock_ind];
+	if (!is_read_msg_enabled(sock, hattr->msg_id))
+		return id == 0 ? SYSFS_GROUP_INVISIBLE : 0;
+
+	return attr->mode;
+}
+
+#define HSMP_LCLK_GRP(index)						\
+static const struct attribute_group sock##index##_lclk_grp = {		\
+	.name = "lclk_dpm_range",					\
+	.attrs = sock##index##_lclk_attrs,				\
+	.is_visible = hsmp_lclk_is_visible,				\
+}
+
+HSMP_LCLK_GRP(0);
+HSMP_LCLK_GRP(1);
+HSMP_LCLK_GRP(2);
+HSMP_LCLK_GRP(3);
+HSMP_LCLK_GRP(4);
+HSMP_LCLK_GRP(5);
+HSMP_LCLK_GRP(6);
+HSMP_LCLK_GRP(7);
+
+static const struct attribute_group *hsmp_sock_attr_grps[] = {
 	&sock0_attr_grp,
 	&sock1_attr_grp,
 	&sock2_attr_grp,
@@ -472,7 +531,17 @@ static const struct attribute_group *hsmp_groups[] = {
 	&sock5_attr_grp,
 	&sock6_attr_grp,
 	&sock7_attr_grp,
-	NULL
+};
+
+static const struct attribute_group *hsmp_sock_lclk_grps[] = {
+	&sock0_lclk_grp,
+	&sock1_lclk_grp,
+	&sock2_lclk_grp,
+	&sock3_lclk_grp,
+	&sock4_lclk_grp,
+	&sock5_lclk_grp,
+	&sock6_lclk_grp,
+	&sock7_lclk_grp,
 };
 
 static inline bool is_f1a_m0h(void)
@@ -599,8 +668,29 @@ static int hsmp_create_cpu_sysfs(struct device *dev)
 	return 0;
 }
 
+static const char * const hsmp_plat_sock_names[] = {
+	"socket0", "socket1", "socket2", "socket3",
+	"socket4", "socket5", "socket6", "socket7",
+};
+
+static void hsmp_remove_plat_sock_kobjs(void)
+{
+	int i;
+
+	for (i = 0; i < MAX_AMD_NUM_NODES; i++) {
+		if (!hsmp_plat_sock_kobj[i])
+			continue;
+
+		sysfs_remove_group(hsmp_plat_sock_kobj[i], hsmp_sock_lclk_grps[i]);
+		sysfs_remove_group(hsmp_plat_sock_kobj[i], hsmp_sock_attr_grps[i]);
+		kobject_put(hsmp_plat_sock_kobj[i]);
+		hsmp_plat_sock_kobj[i] = NULL;
+	}
+}
+
 static int hsmp_create_socket_sysfs(struct device *dev)
 {
+	unsigned int i;
 	int ret;
 
 	hsmp_sock_kobj = kobject_create_and_add("socket", &dev->kobj);
@@ -609,15 +699,51 @@ static int hsmp_create_socket_sysfs(struct device *dev)
 		return -ENOMEM;
 	}
 
-	ret = sysfs_create_groups(hsmp_sock_kobj, hsmp_groups);
-	if (ret) {
-		dev_err(dev, "Failed to create socket attribute groups\n");
-		kobject_put(hsmp_sock_kobj);
-		hsmp_sock_kobj = NULL;
-		return ret;
+	/*
+	 * socketN is a kobject so it can hold both the socket attributes and
+	 * an lclk_dpm_range/ subdirectory. Attribute groups can only add one
+	 * directory level under a kobject.
+	 */
+	for (i = 0; i < hsmp_pdev->num_sockets; i++) {
+		hsmp_plat_sock_kobj[i] = kobject_create_and_add(hsmp_plat_sock_names[i],
+								hsmp_sock_kobj);
+		if (!hsmp_plat_sock_kobj[i]) {
+			dev_err(dev, "Failed to create %s kobject\n",
+				hsmp_plat_sock_names[i]);
+			ret = -ENOMEM;
+			goto err;
+		}
+
+		ret = sysfs_create_group(hsmp_plat_sock_kobj[i],
+					 hsmp_sock_attr_grps[i]);
+		if (ret) {
+			dev_err(dev, "Failed to create %s attributes\n",
+				hsmp_plat_sock_names[i]);
+			kobject_put(hsmp_plat_sock_kobj[i]);
+			hsmp_plat_sock_kobj[i] = NULL;
+			goto err;
+		}
+
+		ret = sysfs_create_group(hsmp_plat_sock_kobj[i],
+					 hsmp_sock_lclk_grps[i]);
+		if (ret) {
+			dev_err(dev, "Failed to create %s lclk attributes\n",
+				hsmp_plat_sock_names[i]);
+			sysfs_remove_group(hsmp_plat_sock_kobj[i],
+					   hsmp_sock_attr_grps[i]);
+			kobject_put(hsmp_plat_sock_kobj[i]);
+			hsmp_plat_sock_kobj[i] = NULL;
+			goto err;
+		}
 	}
 
 	return 0;
+
+err:
+	hsmp_remove_plat_sock_kobjs();
+	kobject_put(hsmp_sock_kobj);
+	hsmp_sock_kobj = NULL;
+	return ret;
 }
 
 static void hsmp_destroy_socket_sysfs(void)
@@ -625,7 +751,7 @@ static void hsmp_destroy_socket_sysfs(void)
 	if (!hsmp_sock_kobj)
 		return;
 
-	sysfs_remove_groups(hsmp_sock_kobj, hsmp_groups);
+	hsmp_remove_plat_sock_kobjs();
 	kobject_del(hsmp_sock_kobj);
 	kobject_put(hsmp_sock_kobj);
 	hsmp_sock_kobj = NULL;
diff --git a/drivers/platform/x86/amd/hsmp/sysfs.c b/drivers/platform/x86/amd/hsmp/sysfs.c
index dbc534ffeba20..77bb9c70c1c7f 100644
--- a/drivers/platform/x86/amd/hsmp/sysfs.c
+++ b/drivers/platform/x86/amd/hsmp/sysfs.c
@@ -47,6 +47,9 @@ static struct hsmp_cpu_info cpu_kobj_info[NR_CPUS];
 
 /* GMI3 link width encodes 3 levels (0-2); upper bound for range diagnostics */
 #define HSMP_GMI3_LINK_WIDTH_MAX		2
+/* LCLK DPM level upper bound: protocol v6 supports levels 0-2, others 0-3 */
+#define HSMP_LCLK_DPM_LEVEL_MAX_VER6	2
+#define HSMP_LCLK_DPM_LEVEL_MAX_DEFAULT	3
 
 static const char * const freqlimit_srcnames[] = {
 	"cHTC-Active",
@@ -983,6 +986,156 @@ ssize_t hsmp_pcie_link_rate_store(struct device *dev,
 	return count;
 }
 
+static ssize_t hsmp_lclk_nbio_show(struct device *dev,
+				   struct device_attribute *attr,
+				   u8 nbio_id, char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	struct hsmp_message msg = {};
+	u32 min_dpm, max_dpm;
+	u16 sock_ind;
+	int ret;
+
+	sock_ind = hsmp_sysfs_sock_ind(dev, hattr);
+	if (sock_ind == U16_MAX)
+		return -EINVAL;
+
+	/*
+	 * HSMP_GET_NBIO_DPM_LEVEL: input args[0] = nbioid[23:16]
+	 * output args[0] = max dpm[15:8] + min dpm[7:0]
+	 */
+	msg.msg_id = HSMP_GET_NBIO_DPM_LEVEL;
+	msg.sock_ind = sock_ind;
+	msg.num_args = 1;
+	msg.response_sz = 1;
+	msg.args[0] = (u32)nbio_id << 16;
+
+	ret = hsmp_send_message(&msg);
+	if (ret)
+		return ret;
+
+	max_dpm = (msg.args[0] >> 8) & 0xFF;
+	min_dpm = msg.args[0] & 0xFF;
+
+	return sysfs_emit(buf, "%u %u\n", min_dpm, max_dpm);
+}
+
+static ssize_t hsmp_lclk_nbio_store(struct device *dev,
+				    struct device_attribute *attr,
+				    u8 nbio_id, const char *buf, size_t count)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	struct hsmp_message msg = {};
+	u32 min_dpm, max_dpm;
+	u32 vals[2];
+	u16 sock_ind;
+	int ret;
+	int got;
+
+	sock_ind = hsmp_sysfs_sock_ind(dev, hattr);
+	if (sock_ind == U16_MAX)
+		return -EINVAL;
+
+	/* Parse input in format: "min_dpm max_dpm" (NBIO id from filename) */
+	ret = hsmp_parse_u32_args(buf, vals, 2, 10, &got);
+	if (ret) {
+		hsmp_err(dev, "lclk_dpm_range", HSMP_ERR_ARGC,
+			 "want=2 got=%d fmt=\"min max\" valid=0-255", got);
+		return -EINVAL;
+	}
+	min_dpm = vals[0];
+	max_dpm = vals[1];
+
+	/* Max and min are 8-bit fields */
+	if (min_dpm > 0xFF || max_dpm > 0xFF) {
+		hsmp_err(dev, "lclk_dpm_range", HSMP_ERR_RANGE,
+			 "nbio_id=%u min=%u max=%u valid=0-255",
+			  nbio_id, min_dpm, max_dpm);
+		return -EINVAL;
+	}
+
+	msg.msg_id = HSMP_SET_NBIO_DPM_LEVEL;
+	msg.sock_ind = sock_ind;
+	msg.num_args = 1;
+	msg.response_sz = 0;
+	/* args[0] = nbioid[23:16] | max_dpm[15:8] | min_dpm[7:0] */
+	msg.args[0] = ((u32)nbio_id << 16) | (max_dpm << 8) | min_dpm;
+
+	ret = hsmp_send_message(&msg);
+	if (ret) {
+		struct hsmp_plat_device *pdev = get_hsmp_pdev();
+		u32 max_dpm_level = HSMP_LCLK_DPM_LEVEL_MAX_DEFAULT;
+
+		if (pdev && sock_ind < pdev->num_sockets &&
+		    pdev->sock[sock_ind].proto_ver == HSMP_PROTO_VER6)
+			max_dpm_level = HSMP_LCLK_DPM_LEVEL_MAX_VER6;
+
+		if (max_dpm < min_dpm)
+			hsmp_err(dev, "lclk_dpm_range", HSMP_ERR_ORDER,
+				 "min=%u max=%u rule=max>=min rc=%d",
+				  min_dpm, max_dpm, ret);
+		else if (min_dpm > max_dpm_level || max_dpm > max_dpm_level)
+			hsmp_err(dev, "lclk_dpm_range", HSMP_ERR_RANGE,
+				 "min=%u max=%u valid=0-%u rc=%d",
+				  min_dpm, max_dpm, max_dpm_level, ret);
+		else
+			hsmp_err(dev, "lclk_dpm_range", HSMP_ERR_HW,
+				 "nbio_id=%u min=%u max=%u rc=%d",
+				  nbio_id, min_dpm, max_dpm, ret);
+		return ret;
+	}
+
+	return count;
+}
+
+ssize_t hsmp_lclk_0_show(struct device *dev, struct device_attribute *attr,
+			 char *buf)
+{
+	return hsmp_lclk_nbio_show(dev, attr, 0, buf);
+}
+
+ssize_t hsmp_lclk_0_store(struct device *dev, struct device_attribute *attr,
+			  const char *buf, size_t count)
+{
+	return hsmp_lclk_nbio_store(dev, attr, 0, buf, count);
+}
+
+ssize_t hsmp_lclk_1_show(struct device *dev, struct device_attribute *attr,
+			 char *buf)
+{
+	return hsmp_lclk_nbio_show(dev, attr, 1, buf);
+}
+
+ssize_t hsmp_lclk_1_store(struct device *dev, struct device_attribute *attr,
+			  const char *buf, size_t count)
+{
+	return hsmp_lclk_nbio_store(dev, attr, 1, buf, count);
+}
+
+ssize_t hsmp_lclk_2_show(struct device *dev, struct device_attribute *attr,
+			 char *buf)
+{
+	return hsmp_lclk_nbio_show(dev, attr, 2, buf);
+}
+
+ssize_t hsmp_lclk_2_store(struct device *dev, struct device_attribute *attr,
+			  const char *buf, size_t count)
+{
+	return hsmp_lclk_nbio_store(dev, attr, 2, buf, count);
+}
+
+ssize_t hsmp_lclk_3_show(struct device *dev, struct device_attribute *attr,
+			 char *buf)
+{
+	return hsmp_lclk_nbio_show(dev, attr, 3, buf);
+}
+
+ssize_t hsmp_lclk_3_store(struct device *dev, struct device_attribute *attr,
+			  const char *buf, size_t count)
+{
+	return hsmp_lclk_nbio_store(dev, attr, 3, buf, count);
+}
+
 static ssize_t boost_limit_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
 {
 	struct hsmp_cpu_info *cpu_info = NULL;
diff --git a/drivers/platform/x86/amd/hsmp/sysfs.h b/drivers/platform/x86/amd/hsmp/sysfs.h
index 62954a46970cc..eb364fbc338bd 100644
--- a/drivers/platform/x86/amd/hsmp/sysfs.h
+++ b/drivers/platform/x86/amd/hsmp/sysfs.h
@@ -125,6 +125,22 @@ ssize_t hsmp_gmi3_link_width_store(struct device *dev,
 ssize_t hsmp_pcie_link_rate_store(struct device *dev,
 				 struct device_attribute *attr,
 				 const char *buf, size_t count);
+ssize_t hsmp_lclk_0_show(struct device *dev, struct device_attribute *attr,
+			 char *buf);
+ssize_t hsmp_lclk_0_store(struct device *dev, struct device_attribute *attr,
+			  const char *buf, size_t count);
+ssize_t hsmp_lclk_1_show(struct device *dev, struct device_attribute *attr,
+			 char *buf);
+ssize_t hsmp_lclk_1_store(struct device *dev, struct device_attribute *attr,
+			  const char *buf, size_t count);
+ssize_t hsmp_lclk_2_show(struct device *dev, struct device_attribute *attr,
+			 char *buf);
+ssize_t hsmp_lclk_2_store(struct device *dev, struct device_attribute *attr,
+			  const char *buf, size_t count);
+ssize_t hsmp_lclk_3_show(struct device *dev, struct device_attribute *attr,
+			 char *buf);
+ssize_t hsmp_lclk_3_store(struct device *dev, struct device_attribute *attr,
+			  const char *buf, size_t count);
 
 void hsmp_create_per_cpu_kobjects(struct device *dev, struct kobject *cpu_parent,
 				  struct hsmp_socket *sock);
-- 
2.34.1

