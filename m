Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793604035;
	b=gpPAmYIdcg6hl5H6ezhHCmempRODqqUQEtuChNVmzfUBLJW4LNQneY0Q9hEk6BhU6M3+
	 sQXJQXfEeI3AWKmZkc3usx1uSl63VjRNTxn7AW0qtCbOOw+JZu16D7xZS/oDH1gSVZ+oC
	 b4KHJOz9Y2gtQrZQpd45ZE5P/zW1f83/9ar7GsYQAFbGxByi43lJSW0Y7CnP8RqDtLmKq
	 P9M9JnvJy4wHZM5tc+CuEaJjwqgNeykgYzOYmdDH9+719e/87+3W/MZYkJ7PKhMJ0rGR+
	 oe1K9WVbPmlFmHH54OVCfzYA63EkkpS28BnD3QBlKMJyLgXkUjo8X+Ry+VlNMYMHc7A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793604035;
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
	bh=amcAuROQo5Q3r92HqiLeniFP3y4cH1slUtHmhmBadJ4=;
	b=EIv3Qg6J06PoVtftTdPEPtqVlRn2yGCKQxX0LH1hFGY1Lt/5lJmAkDETLI3wq7OD2CBA
	 VYGyJ7hDsjEbaRFTtlfN/f3r0OCf6uE/k4EHLPxU49LtdWsVaLxX3c3v2200BSPLtWxwn
	 GlkTyZslY8KnHj9U5DtFMIuEAHn23uenO/z1TbT10AyV7wVmUu7+iMVmO+ArX5jv/mMa0
	 dpWq/FYB3XUsGZcPyGTyaeXfx9oqq+l1ZUV2IYho+vQxiduNmasW50XvpXA9LLY32tA5M
	 kA1cb3bP7FwuIGFBNuxlkV5k8WCi8wwa0W4JABMAnvV8aGrSP6aNKpC13WPr7Nk4UTA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=4K2VGpkq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.30
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013030.outbound.protection.outlook.com [40.107.201.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450CE606A326
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Nov 2026 07:20:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 450CE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=4K2VGpkq
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OZm6uVxOJUzSFxR4H9RGTJTUMKHGFrvNbdVGsajMw3ocYKOcmgztUIAfJc0OjCFLUa+2z+N/1qIp2z0phIPjMYoZidLVSHSdAyCzlfrvna92v5ruSZIFyIPBfrEEPZypOGMiqqOegjaza0vUdb3XMObBBOmNvWAR0Bbb3SiPwXDim3mguYXNBm5/qsfJHugBwv/pPbcEZ+dwj3cGcZPZ0oKaQ1XOQ3G/M70UpOYHRKc6h7PUu+EF8tMMIJdPkhrw6kWmjn6VcU9NB+ZMdZ0KwDyWJr5xi/rhIwMMG27ff7TKrGNA/UZwXnejZnXFqVRSQ7YxEOUzR2PsNCVkaPhpqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=amcAuROQo5Q3r92HqiLeniFP3y4cH1slUtHmhmBadJ4=;
 b=Rh2w2gRNvQSqtZ5FH/cuZD00TnURWV1qjoTJzvEeGJ1YwHfDNGnBtZ81IldkHtvxkWaSAj1hPrivr90PpGtXxLQhK4+WbxOdTo7nXksQOuPrWO2F0HW7rVOyzyLHScrhCPpemP2XJzFTKnWl8SVFXJg8scc38dmsn4UD+3datXmf4zyUNp20scXAsaxVqQCmff7WI1SdTe18JCYJUJtTkYwjCCMMisnOhz1Y6w4BX3qmhtTFHUbKIoQyIOMfwGOpNJJgBdjQxj3P9TgmcWYhNM7zSp0QBy2B3fBuNokMIIC3zv8EQiHyuzqWZUYT9TpCu8+oLh3nwUsRTt9ku4gUrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=amcAuROQo5Q3r92HqiLeniFP3y4cH1slUtHmhmBadJ4=;
 b=4K2VGpkqq6lutY7E6CZTglt8UlY9l4hqnEQ+4Bd9USoxX2XAaBtWZsTViyCtqUAIFyYpdTKTBppOtev4xI6HBV0d+6b/o+PG6nxyj0KGLkPoLbuxXWSpplH1VHfwIAgW2rcPeCV6o1ULfk9q6d3f1qtquqQ1m46mcpWlqS+fhQI=
Received: from SJ0PR05CA0170.namprd05.prod.outlook.com (2603:10b6:a03:339::25)
 by SJ0PR12MB8613.namprd12.prod.outlook.com (2603:10b6:a03:44d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 07:20:28 +0000
Received: from SJ1PEPF000037A7.namprd04.prod.outlook.com
 (2603:10b6:a03:339:cafe::78) by SJ0PR05CA0170.outlook.office365.com
 (2603:10b6:a03:339::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.6 via Frontend Transport; Mon, 2
 Nov 2026 07:20:28 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000037A7.mail.protection.outlook.com (10.167.244.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 07:20:28 +0000
Received: from trento15c5.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 2 Nov
 2026 01:20:26 -0600
From: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <Suma.Hegde@amd.com>,
	<NaveenKrishna.Chatradhi@amd.com>, Muthusamy Ramalingam
	<Muthusamy.Ramalingam@amd.com>
Subject: [PATCH 08/26] platform/x86/amd/hsmp: Add xgmi_width sysfs file
Date: Mon, 2 Nov 2026 07:19:06 +0000
Message-ID: <cdaa48d5e1d276de212ead62d9ddcc7316411d15.1793602633.git.Muthusamy.Ramalingam@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A7:EE_|SJ0PR12MB8613:EE_
X-MS-Office365-Filtering-Correlation-Id: a148ada9-3718-4132-0649-08df38b1c5d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|82310400026|36860700016|261021121427099003|11063799006|56012099006|261021123027099003|261009223027099003|261026121527099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	gvXJ7d7xCQJmcw1g4YbWKU1Sg5IlwUrrku5d2OX7v14LmITnDDlYlgxtYgNL2KOo0qRWUlNGLUXJgjW/IEnj1p9CS5fT3lO8l2FjNTdg+CI7J2N0qXtvbuEde1GKUcBrtMBOulGzZ61zRqrFZW6LissRqEzEMs9dNr7JpqDX1yiCz3n0WZ5eRwhZap3oqhpfya7KJ+HCHEKKkEEwQ9j/PexGpZqWvsSVb4Zp+gtd0lzd9a7vzEWyhpVv9hkw8IqrSrPJnmRcwvgfBoIQXbCj0l7xQtK0MHuFsRacwzL/CBRpPfStE2kn3Rv+rT0/n1r/KiHy715I5CsmAZpEX0I7FJGZvJv9COacbXW4U6wVYmab63HarqFX+tMEda315ewTXmApg1R8MNUqhdzPNVgoWoTw42An7oFKlBafrOLoyOEWZ+abO7VFk1O5gbbt87BLcnSyhu4Bd/PY3O/itZyUQ2kHW7AwNw0hmoBmrXVm05c42Kne/oCdvozMJ6a7jrIJ82XgbtLRYFNSpKf/iIK37GjZgsVas5pifiygFff5PniGrm0VACYUwbRa+O92K4e8ADeQh8O6RKlyIXpQ26QG9OFY93Q6nR0cKDa1LE3S1ecINS4tLr6zkpE1Aom5J+dfMooEy48amhZqwVMdKoKbE1lsBk2zs446s63NfnZx3DMU8lKjFW1TSIJU0d7e56iRXKGFMawh04cWOSr7f9PTVA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(82310400026)(36860700016)(261021121427099003)(11063799006)(56012099006)(261021123027099003)(261009223027099003)(261026121527099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QbInqWGa5mxK03c1jm/sXj4cve31YxuGdNVRvklTktSjBvuFtEt1ZDxyjG5KI3Vj5aO7EgKB0VWjOKdVlozYvsZJTwf6t4JmiF4ijNFOqnX2wZKoMo8oPbiGCbFtroGjscYbQd/V2GExUvtTFPdpt5s1gAoGdsexHnT+bgsTn4NsdOZ1RAGHBBWB4QSliUcRoTaRwKwUNBDNG7T7BreLqNB3TKJuDr9SDr48Me1k3PfNoqALzVpj94x2wK4/ypKXt4Q/Xswv36R/J4a308rXTRdNOd7Wxoeq9N17KRbvek6vcWYSIt3y8YZp6FDLI4Unn9YnDDXpF7XRhYurxt/+j1x/eFKTLCBNPxLXZ49fL8vLmmJgkY5PYTwBrI9040irDU5T+9NEWXXWdt/Yj0fIoBpb3PfFmL3qtPiHO1v821LaMIgIvNCkD4eG8Hl18l0o
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 07:20:28.8233
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a148ada9-3718-4132-0649-08df38b1c5d4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037A7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8613

Add a read/write socket file for the xGMI link-width range on both the
ACPI and platform drivers.

Read and write are differentiated by bit 31. Setting the bit selects a
read, and resetting it selects a write. A read returns the minimum and
maximum widths. A write takes "min max", with the minimum in bits
[15:8] and the maximum in bits [7:0]. 0 is x4, 1 is x8, and 2 is x16.
Each value is an 8-bit field. Extra arguments are rejected. Firmware
rejects an unsupported width.

Co-developed-by: Suma Hegde <Suma.Hegde@amd.com>
Signed-off-by: Suma Hegde <Suma.Hegde@amd.com>
Signed-off-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
---
 Documentation/arch/x86/amd_hsmp.rst   |  3 +
 drivers/platform/x86/amd/hsmp/acpi.c  |  3 +
 drivers/platform/x86/amd/hsmp/plat.c  |  4 ++
 drivers/platform/x86/amd/hsmp/sysfs.c | 79 +++++++++++++++++++++++++++
 drivers/platform/x86/amd/hsmp/sysfs.h |  4 ++
 5 files changed, 93 insertions(+)

diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
index 694997308ffa9..134c94e71b006 100644
--- a/Documentation/arch/x86/amd_hsmp.rst
+++ b/Documentation/arch/x86/amd_hsmp.rst
@@ -122,6 +122,9 @@ write-only when the platform enables only that direction of the message.
 * df_pstate_range: Read/write DF P-state range as "min max". Each value
   is an 8-bit field. 0 is the highest performance. Extra arguments are
   rejected. Firmware rejects unsupported P-states.
+* xgmi_width: Read/write xGMI link width range as "min max".
+  0 is x4, 1 is x8, and 2 is x16. Each value is an 8-bit field.
+  Extra arguments are rejected. Firmware rejects unsupported widths.
 * socket_power_limit_max: Maximum socket power limit in mWatts (read only).
 * cclk_boost_limit: Socket boost limit in MHz (write only). Accepted range
   is 100-10000 MHz.
diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 417fca04a722f..4f4170d191850 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -541,6 +541,8 @@ HSMP_DEV_ATTR_RW(sdps_limit, HSMP_SDPS_LIMIT, HSMP_SDPS_LIMIT,
 		 hsmp_sdps_limit_show, hsmp_sdps_limit_store, 0644);
 HSMP_DEV_ATTR_RW(df_pstate_range, HSMP_SET_PSTATE_MAX_MIN, HSMP_SET_PSTATE_MAX_MIN,
 		 hsmp_df_pstate_range_show, hsmp_df_pstate_range_store, 0644);
+HSMP_DEV_ATTR_RW(xgmi_width, HSMP_SET_XGMI_LINK_WIDTH, HSMP_SET_XGMI_LINK_WIDTH,
+		 hsmp_xgmi_width_show, hsmp_xgmi_width_store, 0644);
 HSMP_DEV_ATTR_W(cclk_boost_limit, HSMP_SET_BOOST_LIMIT_SOCKET,
 		hsmp_cclk_boost_limit_store, 0200);
 HSMP_DEV_ATTR_RW(apb_disable, HSMP_SET_DF_PSTATE, HSMP_SET_DF_PSTATE,
@@ -574,6 +576,7 @@ static struct attribute *hsmp_dev_attr_list[] = {
 	&hattr_socket_power_limit.dattr.attr,
 	&hattr_sdps_limit.dattr.attr,
 	&hattr_df_pstate_range.dattr.attr,
+	&hattr_xgmi_width.dattr.attr,
 	&hattr_socket_power.dattr.attr,
 	&hattr_cclk_boost_limit.dattr.attr,
 	&hattr_tdelta.dattr.attr,
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index 3deb5480495dc..2c09a48b70471 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -377,6 +377,9 @@ HSMP_DEV_ATTR_RW_X8(df_pstate_range, HSMP_SET_PSTATE_MAX_MIN,
 		    HSMP_SET_PSTATE_MAX_MIN,
 		    hsmp_df_pstate_range_show, hsmp_df_pstate_range_store,
 		    0644);
+HSMP_DEV_ATTR_RW_X8(xgmi_width, HSMP_SET_XGMI_LINK_WIDTH,
+		    HSMP_SET_XGMI_LINK_WIDTH,
+		    hsmp_xgmi_width_show, hsmp_xgmi_width_store, 0644);
 HSMP_DEV_ATTR_X8(socket_power, HSMP_GET_SOCKET_POWER, hsmp_msg_resp32_show,
 		 0444);
 HSMP_DEV_ATTR_W_X8(cclk_boost_limit, HSMP_SET_BOOST_LIMIT_SOCKET,
@@ -415,6 +418,7 @@ static struct attribute _name[] = {					       \
 	&hattr_socket_power_limit##_sock_ind.dattr.attr,		       \
 	&hattr_sdps_limit##_sock_ind.dattr.attr,			       \
 	&hattr_df_pstate_range##_sock_ind.dattr.attr,			       \
+	&hattr_xgmi_width##_sock_ind.dattr.attr,			       \
 	&hattr_socket_power##_sock_ind.dattr.attr,			       \
 	&hattr_cclk_boost_limit##_sock_ind.dattr.attr,		       \
 	&hattr_tdelta##_sock_ind.dattr.attr,				       \
diff --git a/drivers/platform/x86/amd/hsmp/sysfs.c b/drivers/platform/x86/amd/hsmp/sysfs.c
index 8f10281cb97c1..4726b3dcdda3d 100644
--- a/drivers/platform/x86/amd/hsmp/sysfs.c
+++ b/drivers/platform/x86/amd/hsmp/sysfs.c
@@ -812,6 +812,85 @@ ssize_t hsmp_df_pstate_range_store(struct device *dev,
 	return count;
 }
 
+/* xGMI width show function - reads current min and max link width */
+ssize_t hsmp_xgmi_width_show(struct device *dev,
+			     struct device_attribute *attr,
+			     char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	struct hsmp_message msg = {};
+	u32 min_width, max_width;
+	int ret;
+
+	/* Set bit 31 to indicate GET operation for HSMP_SET_GET type messages */
+	msg.msg_id = HSMP_SET_XGMI_LINK_WIDTH;
+	msg.sock_ind = hsmp_sysfs_sock_ind(dev, hattr);
+	msg.num_args = 1;
+	msg.response_sz = 1;
+	msg.args[0] = BIT(31);  /* GET operation */
+
+	ret = hsmp_send_message(&msg);
+	if (ret)
+		return ret;
+
+	/* Extract min width[15:8] and max width[7:0] */
+	min_width = (msg.args[0] >> 8) & 0xFF;
+	max_width = msg.args[0] & 0xFF;
+
+	return sysfs_emit(buf, "%u %u\n", min_width, max_width);
+}
+
+/* xGMI width store function - sets min and max link width */
+ssize_t hsmp_xgmi_width_store(struct device *dev,
+			      struct device_attribute *attr,
+			      const char *buf, size_t count)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	struct hsmp_message msg = {};
+	u32 min_width, max_width;
+	u32 vals[2];
+	int ret;
+	int got;
+
+	/* Parse input in format: "min_width max_width" */
+	ret = hsmp_parse_u32_args(buf, vals, 2, 10, &got);
+	if (ret) {
+		hsmp_err(dev, "xgmi_width", HSMP_ERR_ARGC,
+			 "want=2 got=%d fmt=\"min max\"", got);
+		return -EINVAL;
+	}
+	min_width = vals[0];
+	max_width = vals[1];
+
+	/* Min and max are 8-bit fields. Firmware rejects unsupported widths. */
+	if (min_width > 0xFF || max_width > 0xFF) {
+		hsmp_err(dev, "xgmi_width", HSMP_ERR_RANGE,
+			 "min=%u max=%u valid=0-255", min_width, max_width);
+		return -EINVAL;
+	}
+
+	/* Clear bit 31 for SET operation, pack min[15:8] and max[7:0] */
+	msg.msg_id = HSMP_SET_XGMI_LINK_WIDTH;
+	msg.sock_ind = hsmp_sysfs_sock_ind(dev, hattr);
+	msg.num_args = 1;
+	msg.response_sz = 1;
+	msg.args[0] = (min_width << 8) | max_width;
+
+	ret = hsmp_send_message(&msg);
+	if (ret) {
+		if (max_width < min_width)
+			hsmp_err(dev, "xgmi_width", HSMP_ERR_ORDER,
+				 "min=%u max=%u rule=max>=min rc=%d",
+				  min_width, max_width, ret);
+		else
+			hsmp_err(dev, "xgmi_width", HSMP_ERR_HW,
+				 "min=%u max=%u rc=%d", min_width, max_width, ret);
+		return ret;
+	}
+
+	return count;
+}
+
 static ssize_t boost_limit_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
 {
 	struct hsmp_cpu_info *cpu_info = NULL;
diff --git a/drivers/platform/x86/amd/hsmp/sysfs.h b/drivers/platform/x86/amd/hsmp/sysfs.h
index 9631b9067c142..58340e0544af6 100644
--- a/drivers/platform/x86/amd/hsmp/sysfs.h
+++ b/drivers/platform/x86/amd/hsmp/sysfs.h
@@ -115,6 +115,10 @@ ssize_t hsmp_df_pstate_range_show(struct device *dev,
 ssize_t hsmp_df_pstate_range_store(struct device *dev,
 				   struct device_attribute *attr,
 				   const char *buf, size_t count);
+ssize_t hsmp_xgmi_width_show(struct device *dev, struct device_attribute *attr,
+			     char *buf);
+ssize_t hsmp_xgmi_width_store(struct device *dev, struct device_attribute *attr,
+			      const char *buf, size_t count);
 
 void hsmp_create_per_cpu_kobjects(struct device *dev, struct kobject *cpu_parent,
 				  struct hsmp_socket *sock);
-- 
2.34.1

