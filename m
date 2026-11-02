Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793604039;
	b=fRwhO9ymfE83BBq/JmuRTsfE8fN/vZfQguu/H0FjXluGnqFcUZeoqVA5vkPnnFtvtVD5
	 ykSTdPcypesmZIEhf/20rq0LX4Q0zErI2jcEomX7gAUeFXK/Q8xqTTLOwr/TAh+isBJGf
	 3B0rsBXSWrVTfvZ0tsE8C8T8Qp2wljoKdIwFH03k9v6ARuiJixDNVibuwjmlEAzYQGjjC
	 9hlG30mbOzXrlMaX9CourGzdi4efMOuYmVjnOgMgKszCrbEzSJMnwUQj2rbCrhybIjbwN
	 qxBPO1RTyo/1249Kv/E5yVThe8IMDWLQ4aohZ7AsA8zrSGLq1SsKp/EGqKv2VBktJRw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793604039;
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
	bh=c7oPnVgVHcYvHAtn6/RRZn6fSGYibVyzPJlGJQSfexc=;
	b=fmU7txkAdjZbAbMLhNtfv9d6G45lqPK3Y5xNLKAUn5YVebvsBS3asmQtGzjXYWpjs/4J
	 9DKPkHMa7RwWLTikBOhFei+8eQKzn73nJooq8BT1OUp+SIh2FBUgNJTn6PaUzRLwLYKxf
	 iyVWjjLn+PJyNCHzfoowNLxt7bZaYJLzcP/wOP3yL2ZLeO12HSQ2fRy4qnIffM9i8yxrU
	 m867TZhMHScRTDXjQdFJJnLAvo2RQgsqyfHXasU9ebaJnF2xy0KWDbmioELaP3woJy6CP
	 QsXyajINFFBLhKxill/HfOqMQoRI4NXWvt+bhNLIDyseqemV4eiMrEQcIYA2di5yjJg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=fxNoYGqa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.28
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012028.outbound.protection.outlook.com [52.101.43.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63548606A324
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Nov 2026 07:20:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63548606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=fxNoYGqa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qbhh1FABxH9ingzsDBhD6nZ7+mKNejUZWGzV4azrU1MNEP/zvnxDqUp2jNFWapl0OOHdvzT8SCRmvK2MaZ5CHmd3maf3V6jrAwQdH6lPeoOiUdvixc/dmhtkL0tyy7ZYY7nESbhUPOihtY7lWxxy1Vx/s2EGeMmkub2pY+bKjfZYjxALFLzaMZtLU9bpHFyVeGEZnCxFh4XeHdjxTBxT18xQikHmRvpdwKfStv3iK2xT1GCsLDzdqEJ4paWpfOp47/+1qlw+Np6hCJ7CnwLGiVvyzDqGCmgUosd3IVF/F8wRB2EgZ0QPJ7EhfMlIX/H88zdS5bxDFYHdGRV4CST5kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c7oPnVgVHcYvHAtn6/RRZn6fSGYibVyzPJlGJQSfexc=;
 b=JL5UgPiFiHDRSjS2G+9yIwqmyvVRetl7O01s8fJmml0Eac5glHO4rAzYCEm0CbkDzafFR2eextP4t73WENRwq8ivyyB66yixSSA/aRGBgWXOm1uMwBkQrA69L2V9DGq7UNNUmnrZ2R/X6ZlhhPRHuxD6k3N4CJeBgOgClSzHW9vgsGdWi4HoWKxBafitO0k7u5laxoMzN+imGFCuW0h9U0dmbemLRcewlwjyhuiNXKveIKLz8ZXOuRPcb83a/GChkUXxyiMkcsK9huI+DTQT7VTVxzFGjboa4lmmWMuohks33HNcPhgF4MNIhz0tz72gD2JVO8sFvCtiUJFOI+iVYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c7oPnVgVHcYvHAtn6/RRZn6fSGYibVyzPJlGJQSfexc=;
 b=fxNoYGqapDer4sEvYofuU+yBiJo9o9i2wGMX7jOC1bcRkpuKRRbyoBkWvi5COsw75pVEwcrDT+0OSdFHs1O0c09d58HV4pW4dD+MZkHQOzMcjJCFvqg46gJ5hZoCQbG4oX8ok1A7lokTiUWGRfadH4BTBc/RC6bYm0gPvG3Pp2w=
Received: from SJ0PR03CA0346.namprd03.prod.outlook.com (2603:10b6:a03:39c::21)
 by DM6PR12MB4467.namprd12.prod.outlook.com (2603:10b6:5:2a8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 07:20:33 +0000
Received: from SJ1PEPF000037A6.namprd04.prod.outlook.com
 (2603:10b6:a03:39c:cafe::65) by SJ0PR03CA0346.outlook.office365.com
 (2603:10b6:a03:39c::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Mon, 2
 Nov 2026 07:20:33 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000037A6.mail.protection.outlook.com (10.167.244.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 07:20:33 +0000
Received: from trento15c5.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 2 Nov
 2026 01:20:30 -0600
From: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <Suma.Hegde@amd.com>,
	<NaveenKrishna.Chatradhi@amd.com>, Muthusamy Ramalingam
	<Muthusamy.Ramalingam@amd.com>
Subject: [PATCH 10/26] platform/x86/amd/hsmp: Add pcie_link_rate sysfs file
Date: Mon, 2 Nov 2026 07:19:08 +0000
Message-ID: <e975ac85586d540eef16179a11f2966f9c60c5b1.1793602633.git.Muthusamy.Ramalingam@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A6:EE_|DM6PR12MB4467:EE_
X-MS-Office365-Filtering-Correlation-Id: a2fbd6fa-ec4e-4f69-906c-08df38b1c856
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|11063799006|56012099006|261009223027099003|261021121427099003|261021123027099003|261026121527099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	3+HKkzu6XYKbD2AwEHngARHK33L9PG8Ix+E8TG2wX1LYSxZZ7i3vYU8jNFQRjPg5NJou50XN5fMsqVh8yiyKFFgUWq1yaYNgGiXa7EO3Ksoc8Vd4FLz1PqUoVjuUTJeIXRPuI0gRgiCEuU/FT29D7NeNyaUfDgJrGZbFhRXYNpMVcSqQkCmHcnbYCmxdQrVx8XYQVWWyaX2Xp+YcVBkysMN3CNEGJc+qw2RVFsVEwdynTIrcuOvIDvwTLDs2XCia6XTaNRIJhmwzcR+BOMbJox7NKnf5pf/ooYLDEJJkFDsJXLK24h0Ew7Kh7rCYik41RmWL9wiI7D2/5+oHrZjVloCcL4OCdYg0des09yOd9O1d9wR0G+yITxr996DBQPtG5Hn5y3HCthjcuQoOyKFoWSuwXGdtCYcktgtt1uhdHRg93/pL++UJfFGQf5hR7Qohz3dMUIn2LG2JB9iUCHEX9NTcjJCtQVCt0kYZx6ZaCrT+prOLvik8qAU3EUHRs0n9Sb7HZZUzNpnouEXs3+MQh98oJ8WQd+uNy0CPUwwF+qNVwPn/eyz8zwJfkQsaX+OFzIUo+Fgt+BNRQ8wJKhvdOdqhUV6soN+FSVSKax1xHZNPWRGapGUuOfa8T9t/jA71iyiQDbuT+k3MeSqyq6nPAsKDEh/wPMZmrHbUxEmWTgf5ORfKDy3IAli7EY78mlkpdiRRayBKDaITJbL+Q4covA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(11063799006)(56012099006)(261009223027099003)(261021121427099003)(261021123027099003)(261026121527099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4WzF3SdSWYEgHOiHNXGFpfWYyFAFxnqjx17YYh2gXGpBi01snh0VvJoPjqscV6dJnIkHEpKf+8KKS7k562D0xYp6NKeBprlFIzqT/nwTRvMgeYdFfTQDE9Q70/tZR+WgMx7ACJueriC2nuQ9M3A7OvQIpqePNTt36N+6ZsGHRnwh9Ol/GYMYYwx+zTK5e/xrxh+PhTocq4pEU8IgpkVlJJPolMiiSYbAyqNN1BJ2zAM0t4rwK5ZnjAwXDdsNhHWALZ0ieePpf693+dxYYbbuF1YCvb+W8TqNWDkZeAc1U2UE4Hn9Imry5uPMmhG/yimU+FlmVPs39EBxstViK19H1UUQIzS5UD//bcQkXhZMw372Qn/lCLyLCGcVAbDb8atKfhPTjuatjBkT8LKR7u6gmOdDNjfrNmYgv5qityhPSzTbpimOOjdHctTziZ7yO3qM
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 07:20:33.0112
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2fbd6fa-ec4e-4f69-906c-08df38b1c856
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037A6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4467

Expose HSMP_SET_PCI_RATE as a write-only socket file on both the ACPI
and platform drivers. A write sets the PCIe link rate control value.

Co-developed-by: Suma Hegde <Suma.Hegde@amd.com>
Signed-off-by: Suma Hegde <Suma.Hegde@amd.com>
Signed-off-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
---
 Documentation/arch/x86/amd_hsmp.rst   |  2 ++
 drivers/platform/x86/amd/hsmp/acpi.c  |  3 +++
 drivers/platform/x86/amd/hsmp/plat.c  |  3 +++
 drivers/platform/x86/amd/hsmp/sysfs.c | 32 +++++++++++++++++++++++++++
 drivers/platform/x86/amd/hsmp/sysfs.h |  3 +++
 5 files changed, 43 insertions(+)

diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
index d7c4653f4f2f2..037029d1fdadd 100644
--- a/Documentation/arch/x86/amd_hsmp.rst
+++ b/Documentation/arch/x86/amd_hsmp.rst
@@ -128,6 +128,8 @@ write-only when the platform enables only that direction of the message.
 * gmi3_link_width: Write-only. Sets the GMI3 link width range as
   "min max". Each value is an 8-bit field. Extra arguments are rejected.
   Firmware rejects unsupported widths.
+* pcie_link_rate: Write-only. Sets the PCIe link rate control value
+  (HSMP_SET_PCI_RATE).
 * socket_power_limit_max: Maximum socket power limit in mWatts (read only).
 * cclk_boost_limit: Socket boost limit in MHz (write only). Accepted range
   is 100-10000 MHz.
diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 2f9228622fba4..beddcf30f252c 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -545,6 +545,8 @@ HSMP_DEV_ATTR_RW(xgmi_width, HSMP_SET_XGMI_LINK_WIDTH, HSMP_SET_XGMI_LINK_WIDTH,
 		 hsmp_xgmi_width_show, hsmp_xgmi_width_store, 0644);
 HSMP_DEV_ATTR_W(gmi3_link_width, HSMP_SET_GMI3_WIDTH,
 		hsmp_gmi3_link_width_store, 0200);
+HSMP_DEV_ATTR_W(pcie_link_rate, HSMP_SET_PCI_RATE,
+		hsmp_pcie_link_rate_store, 0200);
 HSMP_DEV_ATTR_W(cclk_boost_limit, HSMP_SET_BOOST_LIMIT_SOCKET,
 		hsmp_cclk_boost_limit_store, 0200);
 HSMP_DEV_ATTR_RW(apb_disable, HSMP_SET_DF_PSTATE, HSMP_SET_DF_PSTATE,
@@ -580,6 +582,7 @@ static struct attribute *hsmp_dev_attr_list[] = {
 	&hattr_df_pstate_range.dattr.attr,
 	&hattr_xgmi_width.dattr.attr,
 	&hattr_gmi3_link_width.dattr.attr,
+	&hattr_pcie_link_rate.dattr.attr,
 	&hattr_socket_power.dattr.attr,
 	&hattr_cclk_boost_limit.dattr.attr,
 	&hattr_tdelta.dattr.attr,
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index ca4aa13bfc4bc..479e6e9b90574 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -382,6 +382,8 @@ HSMP_DEV_ATTR_RW_X8(xgmi_width, HSMP_SET_XGMI_LINK_WIDTH,
 		    hsmp_xgmi_width_show, hsmp_xgmi_width_store, 0644);
 HSMP_DEV_ATTR_W_X8(gmi3_link_width, HSMP_SET_GMI3_WIDTH,
 		   hsmp_gmi3_link_width_store, 0200);
+HSMP_DEV_ATTR_W_X8(pcie_link_rate, HSMP_SET_PCI_RATE,
+		   hsmp_pcie_link_rate_store, 0200);
 HSMP_DEV_ATTR_X8(socket_power, HSMP_GET_SOCKET_POWER, hsmp_msg_resp32_show,
 		 0444);
 HSMP_DEV_ATTR_W_X8(cclk_boost_limit, HSMP_SET_BOOST_LIMIT_SOCKET,
@@ -422,6 +424,7 @@ static struct attribute _name[] = {					       \
 	&hattr_df_pstate_range##_sock_ind.dattr.attr,			       \
 	&hattr_xgmi_width##_sock_ind.dattr.attr,			       \
 	&hattr_gmi3_link_width##_sock_ind.dattr.attr,			       \
+	&hattr_pcie_link_rate##_sock_ind.dattr.attr,			       \
 	&hattr_socket_power##_sock_ind.dattr.attr,			       \
 	&hattr_cclk_boost_limit##_sock_ind.dattr.attr,		       \
 	&hattr_tdelta##_sock_ind.dattr.attr,				       \
diff --git a/drivers/platform/x86/amd/hsmp/sysfs.c b/drivers/platform/x86/amd/hsmp/sysfs.c
index 4c193fbcab013..dbc534ffeba20 100644
--- a/drivers/platform/x86/amd/hsmp/sysfs.c
+++ b/drivers/platform/x86/amd/hsmp/sysfs.c
@@ -951,6 +951,38 @@ ssize_t hsmp_gmi3_link_width_store(struct device *dev,
 	return count;
 }
 
+/* PCIe link rate store function - sets the link rate control value */
+ssize_t hsmp_pcie_link_rate_store(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, size_t count)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	struct hsmp_message msg = {};
+	u32 ctrl_rate;
+	int ret;
+
+	ret = kstrtou32(buf, 10, &ctrl_rate);
+	if (ret) {
+		hsmp_err(dev, "pcie_link_rate", HSMP_ERR_PARSE, "unit=ctrl_rate");
+		return ret;
+	}
+
+	msg.msg_id = HSMP_SET_PCI_RATE;
+	msg.sock_ind = hsmp_sysfs_sock_ind(dev, hattr);
+	msg.num_args = 1;
+	msg.response_sz = 1;
+	msg.args[0] = ctrl_rate;
+
+	ret = hsmp_send_message(&msg);
+	if (ret) {
+		hsmp_err(dev, "pcie_link_rate", HSMP_ERR_HW,
+			 "ctrl_rate=%u rc=%d", ctrl_rate, ret);
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
index 1831d817a6834..62954a46970cc 100644
--- a/drivers/platform/x86/amd/hsmp/sysfs.h
+++ b/drivers/platform/x86/amd/hsmp/sysfs.h
@@ -122,6 +122,9 @@ ssize_t hsmp_xgmi_width_store(struct device *dev, struct device_attribute *attr,
 ssize_t hsmp_gmi3_link_width_store(struct device *dev,
 				   struct device_attribute *attr,
 				   const char *buf, size_t count);
+ssize_t hsmp_pcie_link_rate_store(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, size_t count);
 
 void hsmp_create_per_cpu_kobjects(struct device *dev, struct kobject *cpu_parent,
 				  struct hsmp_socket *sock);
-- 
2.34.1

