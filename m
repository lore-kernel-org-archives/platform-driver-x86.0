Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793604046;
	b=4nEYX7haOivBmG4fjel0jy/bPsCsaNUVwhkKEGgpWQoMSoyNFKId8uGvlt3rrlIV8FrW
	 offQDeoF0/oRoRdhTJY/1G87e9p4oIo5pn3noOWZXfHMBAof+tpG3Xwwjkmt2Jyp4jTr4
	 pIA+7yEIfv7pMNQbyM9E5IMGnFzibXxInNgGjNGFtkMxKBsJraX1K+M6PRmIFDijO2fdY
	 kHAEjL/3VOuZYyZmficqjEMgHEajZd74K9oCEhGLfxOU5hsRrApKSI5h6AGnyWlQWE1Lu
	 6iORsaKd7TNywGEeR4RWr5gDZfc9biFNzk2w98ylq23Q8/CVz6v9qKabznDCOc3g+TQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793604046;
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
	bh=oxjIbOCg768FA/qJzpwbWxmaQTjaEgDFbYsdK1Fn3fM=;
	b=ylkRZIe4rP/shXoBrG6dpAaumMetjl8fwYFoqELMqztP9rtonGx2PbwEy4NSHEJgpBR4
	 NYYTQ8Vfo0ZnjoG2ovkJ7J1GCRrv3bZSYMWEFwS05h+wPVTUUDx1nnWcH48h/KChTz/yV
	 a0/qauO9TTEVVXAp35T5vUbX+BtaxyBE0b+RKvLOJwbJwmx/KprxAt5pwDSoj+fIy+ag3
	 2swiiH8aLcRNi758gxYMye6OoDI3LSRpuk6tBfMxpotu2ov7DY6PKGBFXayFH7MFSz9jM
	 65bplVvQ0iwPeKp04JY92s7a9v8OdGbrmfVFMFdy6JJgDu/WMi9ucHhY+gExrIWIvVA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="D7cvPd/H";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.45
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011045.outbound.protection.outlook.com [52.101.52.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F037606A324
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Nov 2026 07:20:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F037606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=D7cvPd/H
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NQw+uE/ayBGeIdNsajab/JImffzl061wDQWbIcs1XIR4up3QtbzNlOo89x8RgIwrZuu/pyieD45f/BxkEs9WVMcgKo6Ze8VwmEyAbckbOR9rz6TTT0TxAos5zRA4/qJartHozbXPVYwEDxomEqIu1wvc+HFGLyV5zaJOffuI83U9Sju0Jcv2p7zaohL8opRHxXI7sBNKpuW41y/QKPJCFpdYipmmi30ZHISiApYDoxEPylpYqX0nem3+K6PoYT4ofFOyzbEJ8S2VEGm02RGT77wlzHSFS9g+m2Btq+lrn/+aKZO0SU0g5NLi0LdILZI5Nq3V/HWv3jUrXbYLCLuTaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oxjIbOCg768FA/qJzpwbWxmaQTjaEgDFbYsdK1Fn3fM=;
 b=iWBtMV3sWpu4FaOGyzWgDMjiEui1s12SGcNVGlosCVcwAV3U0hj8ppAlPOcLn1d5MBX8bGPkHvDCQVUsB27NvoXyHJwR126GALyOK6gt3uaSeEw0OXY/pc4Vcxobq0jYerY81q1P9asDj/TncWBtVqk7ZMpntNvSbsG+6I5Ky3vBUWRYBAx7dJnoAqd05wKI4pWnC+Qhyp/uYMgebq0V+JD/DXlXz7Ww4evo69/C4wThyeotVriKgW+uDwKqxolVEzyMHu+jjzhvIPRgNvLmsehdbOzBoiuXEJorFWStWOfyfDwX2SpPX/v+hzwU5WbyFtBo/sBaGnX826Q8Je95VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oxjIbOCg768FA/qJzpwbWxmaQTjaEgDFbYsdK1Fn3fM=;
 b=D7cvPd/HdqPaWEugLS09LjbQmLR1ZtB/ZVXHM5rpiGGg3CXNqd/oEpAoDeNyTB0kk/NpvTxULc/BIyEqT0LF4X3R3HNZ4uvIBLIKEAtGeDhFSoVA/EWcN4fjQ+bli7bIvTb25SePpB70YfOt8AAw/CjBRZr4SDFpAySOO6CNzng=
Received: from MW3PR06CA0021.namprd06.prod.outlook.com (2603:10b6:303:2a::26)
 by CH1PPF2EB7CF87B.namprd12.prod.outlook.com (2603:10b6:61f:fc00::60b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 07:20:41 +0000
Received: from SJ1PEPF000037A5.namprd04.prod.outlook.com
 (2603:10b6:303:2a:cafe::8b) by MW3PR06CA0021.outlook.office365.com
 (2603:10b6:303:2a::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Mon, 2
 Nov 2026 07:20:40 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000037A5.mail.protection.outlook.com (10.167.244.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 07:20:40 +0000
Received: from trento15c5.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 2 Nov
 2026 01:20:37 -0600
From: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <Suma.Hegde@amd.com>,
	<NaveenKrishna.Chatradhi@amd.com>, Muthusamy Ramalingam
	<Muthusamy.Ramalingam@amd.com>
Subject: [PATCH 13/26] platform/x86/amd/hsmp: Add DIMM sideband sysfs files
Date: Mon, 2 Nov 2026 07:19:11 +0000
Message-ID: <7f7961fb899d26005ce25bcc2a3e5af9885fbf07.1793602633.git.Muthusamy.Ramalingam@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A5:EE_|CH1PPF2EB7CF87B:EE_
X-MS-Office365-Filtering-Correlation-Id: aae744e2-0bc6-4c5c-9970-08df38b1ccc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|1800799024|6133799003|10067099003|22082099003|18002099003|56012099006|11063799006|261021123027099003|261021121427099003|261026121527099003|261026140227099003|261022105027099003|261009223027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	c+LTRJTPgmUDRt3TRA5dEa5OYuKTb0FSjkMHNeFN7XYeQaUm9qDozxtiIogV1SbupNneSLoWAW6aJLRAebkVOxswSk8pK3wohwsuNQ+7JBTXcw3E1MAjV0LECYNBKYhBcCbqEag5Zq5XBA9nlzD+yl60aY+6ku7EpKWS7IJpgzhHVid93n/PdrxC0L6Fbcp0sXn/CgN6tn4TeRk+J9X1ANgckaaSYZqgxCovWrSP2x86i1WRH5vS7oL9b6HL4NLJ9H/bdjtqLlDYLWICM9UvK5o1nGTVwDLui3xzoX71hc1Ee6PWbsQL6oshbn6pyiMpsx+/2YYpHdrj1VifrKEfjJ8UOEGxDbe8/EirsVdGKOEiZ1gcKy5iNAroao+2CRdmRWtLzaqUQO2QW7F9Zm4PEODLVJruGhtQFkMIOTHsuDJ3BZlT+ebivdUAZRVKgdPmbUiThBqY6jZVBovu5GABZ2poiXvV6SK4JcDQt8nEfhJv1P4M1/8cboYado2YCL5wcv16uTsP2dbZllk3w1B26y/dbtrLHvwu3CIO/77ydqCmKIgxGU52Sx3qViJ4xlIRtW5VyihV9RdK3RQpL9hWC2QUm82ONAvE4XYcA7hg+Q0XbbZUTzj3KNeL5Odc/37/DYcIVrLGOEZvzre7jUsyzcd7AjVkFIag2HCJp3b+RwxtWsQeCoayVdgUA0mCfowedk/qk+lMdhndKHvs5AJiSA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(1800799024)(6133799003)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006)(261021123027099003)(261021121427099003)(261026121527099003)(261026140227099003)(261022105027099003)(261009223027099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fRU350cKH+QIAIXJCL/WSzBkkH5OZ3nYQAHOD4dVD9xhJwSpi0VEs/vWZg7szZYFVMM63oQtlSYAfpgRQ8CKNhB5RPotpeJ88a2bkLUJaEZ2NkuTzo+jxe34fRLu/SY5fv/3GQRCbSj2S0g+gYXqbfFXSoBpA9PczDlQWV7a85NauE4/ofKDJokgn6DUoMd9+KEaTo//ZMj3oq1VlGPMDdqjI3u0amCWZ475HR9FS53X2t70I28zKPqbKd9yr5hNPAxRECTwKGy2lGVs0QHCFOgMYYRURc5DQlztPkHeuKbPORe3SvZYU6Xr0TYeBqM3TjBY0E3mWhIA2nhF0WEoPZte+kcGDsyYSl2B8gyYN/XgReWPChJRWnTfXGyefX7zfz8j6CdCtodtebShkIb7kDRIsuYqOJ2hvo9PqBZXg4lupOYB40cou08U0gIsGBU7
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 07:20:40.4627
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aae744e2-0bc6-4c5c-9970-08df38b1ccc3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037A5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF2EB7CF87B

Expose dimm_sb_get and dimm_sb_set on both drivers. dimm_sb_get issues
HSMP_DIMM_SB_RD and caches the request and data. A read returns that
request and its data. Both stores reject extra arguments. dimm_sb_set
writes a register with HSMP_DIMM_SB_WR.

Co-developed-by: Suma Hegde <Suma.Hegde@amd.com>
Signed-off-by: Suma Hegde <Suma.Hegde@amd.com>
Signed-off-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
---
 Documentation/arch/x86/amd_hsmp.rst   |  10 ++
 drivers/platform/x86/amd/hsmp/acpi.c  |  11 +-
 drivers/platform/x86/amd/hsmp/plat.c  |  11 +-
 drivers/platform/x86/amd/hsmp/sysfs.c | 190 ++++++++++++++++++++++++++
 drivers/platform/x86/amd/hsmp/sysfs.h |  11 ++
 5 files changed, 231 insertions(+), 2 deletions(-)

diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
index 516e8391bfbd2..67f4c3b71f5e0 100644
--- a/Documentation/arch/x86/amd_hsmp.rst
+++ b/Documentation/arch/x86/amd_hsmp.rst
@@ -145,6 +145,16 @@ write-only when the platform enables only that direction of the message.
   aggregate, read, or write bandwidth. Probe keeps only the link and
   type combinations firmware accepts. The directory is absent when
   none respond.
+* dimm_sb_get: Read/write DIMM sideband read. Write
+  "<dimm_addr> <lid> <reg_offset> <reg_space>". Decimal and hexadecimal
+  values are accepted, and extra arguments are rejected. dimm_addr is
+  0-255, lid is 0-15, reg_offset is 0-2047, and reg_space is 0 or 1.
+  A read returns the last request and its data as
+  "0xAA 0xL 0xOFF S 0xDATA", or fails with -ENODATA until a read succeeds.
+* dimm_sb_set: Write-only DIMM sideband write. Write
+  "<dimm_addr> <lid> <reg_offset> <reg_space> <write_data>".
+  write_data is 0-255. Extra arguments are rejected. Field ranges match
+  dimm_sb_get.
 * socket_power_limit_max: Maximum socket power limit in mWatts (read only).
 * cclk_boost_limit: Socket boost limit in MHz (write only). Accepted range
   is 100-10000 MHz.
diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index d6bb8a849cca7..f2bd4d5369df5 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -358,8 +358,12 @@ static umode_t hsmp_is_sock_dev_attr_visible(struct kobject *kobj,
 	if (readable && writable) {
 		if (is_read_msg_enabled(sock, hattr->msg_id))
 			mode_updated |= mode & 0444;
-		if (is_write_msg_enabled(sock, hattr->wr_msg_id))
+		if (hsmp_sysfs_write_follows_read(hattr)) {
+			if (is_read_msg_enabled(sock, hattr->msg_id))
+				mode_updated |= 0200;
+		} else if (is_write_msg_enabled(sock, hattr->wr_msg_id)) {
 			mode_updated |= 0200;
+		}
 		return mode_updated;
 	}
 
@@ -550,6 +554,9 @@ HSMP_DEV_ATTR_W(gmi3_link_width, HSMP_SET_GMI3_WIDTH,
 		hsmp_gmi3_link_width_store, 0200);
 HSMP_DEV_ATTR_W(pcie_link_rate, HSMP_SET_PCI_RATE,
 		hsmp_pcie_link_rate_store, 0200);
+HSMP_DEV_ATTR_RW(dimm_sb_get, HSMP_DIMM_SB_RD, HSMP_DIMM_SB_RD,
+		 hsmp_dimm_sb_get_show, hsmp_dimm_sb_get_store, 0644);
+HSMP_DEV_ATTR_W(dimm_sb_set, HSMP_DIMM_SB_WR, hsmp_dimm_sb_set_store, 0200);
 HSMP_DEV_ATTR_RW(lclk_0, HSMP_GET_NBIO_DPM_LEVEL, HSMP_SET_NBIO_DPM_LEVEL,
 		 hsmp_lclk_0_show, hsmp_lclk_0_store, 0644);
 HSMP_DEV_ATTR_RW(lclk_1, HSMP_GET_NBIO_DPM_LEVEL, HSMP_SET_NBIO_DPM_LEVEL,
@@ -673,6 +680,8 @@ static struct attribute *hsmp_dev_attr_list[] = {
 	&hattr_xgmi_width.dattr.attr,
 	&hattr_gmi3_link_width.dattr.attr,
 	&hattr_pcie_link_rate.dattr.attr,
+	&hattr_dimm_sb_get.dattr.attr,
+	&hattr_dimm_sb_set.dattr.attr,
 	&hattr_socket_power.dattr.attr,
 	&hattr_cclk_boost_limit.dattr.attr,
 	&hattr_tdelta.dattr.attr,
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index 3af94db6fd5b7..46676d9f90633 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -124,8 +124,12 @@ static umode_t hsmp_is_sock_dev_attr_visible(struct kobject *kobj,
 	if (readable && writable) {
 		if (is_read_msg_enabled(sock, hattr->msg_id))
 			mode_updated |= mode & 0444;
-		if (is_write_msg_enabled(sock, hattr->wr_msg_id))
+		if (hsmp_sysfs_write_follows_read(hattr)) {
+			if (is_read_msg_enabled(sock, hattr->msg_id))
+				mode_updated |= 0200;
+		} else if (is_write_msg_enabled(sock, hattr->wr_msg_id)) {
 			mode_updated |= 0200;
+		}
 		return mode_updated;
 	}
 
@@ -385,6 +389,9 @@ HSMP_DEV_ATTR_W_X8(gmi3_link_width, HSMP_SET_GMI3_WIDTH,
 		   hsmp_gmi3_link_width_store, 0200);
 HSMP_DEV_ATTR_W_X8(pcie_link_rate, HSMP_SET_PCI_RATE,
 		   hsmp_pcie_link_rate_store, 0200);
+HSMP_DEV_ATTR_RW_X8(dimm_sb_get, HSMP_DIMM_SB_RD, HSMP_DIMM_SB_RD,
+		    hsmp_dimm_sb_get_show, hsmp_dimm_sb_get_store, 0644);
+HSMP_DEV_ATTR_W_X8(dimm_sb_set, HSMP_DIMM_SB_WR, hsmp_dimm_sb_set_store, 0200);
 HSMP_DEV_ATTR_RW_X8(lclk_0, HSMP_GET_NBIO_DPM_LEVEL, HSMP_SET_NBIO_DPM_LEVEL,
 		    hsmp_lclk_0_show, hsmp_lclk_0_store, 0644);
 HSMP_DEV_ATTR_RW_X8(lclk_1, HSMP_GET_NBIO_DPM_LEVEL, HSMP_SET_NBIO_DPM_LEVEL,
@@ -904,6 +911,8 @@ static struct attribute _name[] = {					       \
 	&hattr_xgmi_width##_sock_ind.dattr.attr,			       \
 	&hattr_gmi3_link_width##_sock_ind.dattr.attr,			       \
 	&hattr_pcie_link_rate##_sock_ind.dattr.attr,			       \
+	&hattr_dimm_sb_get##_sock_ind.dattr.attr,			       \
+	&hattr_dimm_sb_set##_sock_ind.dattr.attr,			       \
 	&hattr_socket_power##_sock_ind.dattr.attr,			       \
 	&hattr_cclk_boost_limit##_sock_ind.dattr.attr,		       \
 	&hattr_tdelta##_sock_ind.dattr.attr,				       \
diff --git a/drivers/platform/x86/amd/hsmp/sysfs.c b/drivers/platform/x86/amd/hsmp/sysfs.c
index 73010a889eaca..bcf1b802b3287 100644
--- a/drivers/platform/x86/amd/hsmp/sysfs.c
+++ b/drivers/platform/x86/amd/hsmp/sysfs.c
@@ -7,6 +7,8 @@
  * Common sysfs helpers shared by ACPI and platform HSMP drivers.
  */
 
+#include <asm/amd/node.h>
+
 #include <linux/array_size.h>
 #include <linux/bitfield.h>
 #include <linux/bits.h>
@@ -986,6 +988,14 @@ ssize_t hsmp_pcie_link_rate_store(struct device *dev,
 	return count;
 }
 
+bool hsmp_sysfs_write_follows_read(const struct hsmp_sys_attr *hattr)
+{
+	/*
+	 * dimm_sb_get's store issues HSMP_DIMM_SB_RD, which is a GET, so
+	 * the write bit follows the GET message bitmap.
+	 */
+	return hattr->msg_id == HSMP_DIMM_SB_RD;
+}
 
 /* IO link bandwidth. priv is the io_bw attribute index. */
 ssize_t hsmp_io_link_bw_show(struct device *dev, struct device_attribute *attr,
@@ -1080,6 +1090,186 @@ umode_t hsmp_xgmi_bw_file_visible(const struct hsmp_socket *sock, int id)
 	return (sock->xgmi_bw_valid & BIT_ULL(id)) ? 0444 : 0;
 }
 
+struct dimm_sb_cfg {
+	u8 addr;
+	u8 lid;
+	u16 reg_offset;
+	u8 reg_space;
+	u16 result;
+	bool configured;
+};
+
+static struct dimm_sb_cfg dimm_sb[MAX_AMD_NUM_NODES];
+
+static struct dimm_sb_cfg *dimm_sb_state(struct device *dev,
+					 struct device_attribute *attr)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	u16 sock_ind = hsmp_sysfs_sock_ind(dev, hattr);
+
+	if (sock_ind >= MAX_AMD_NUM_NODES)
+		return NULL;
+
+	return &dimm_sb[sock_ind];
+}
+
+static int dimm_sb_parse(struct device *dev, const char *attr_name,
+			 const char *buf, bool with_data, int *addr, int *lid,
+			 int *off, int *space, int *data)
+{
+	u32 vals[5];
+	int n = with_data ? 5 : 4;
+	int ret;
+	int got;
+
+	/* Accept decimal and 0x-prefixed hexadecimal. */
+	ret = hsmp_parse_u32_args(buf, vals, n, 0, &got);
+	if (ret) {
+		if (with_data)
+			hsmp_err(dev, attr_name, HSMP_ERR_ARGC,
+				 "want=5 got=%d fmt=\"dimm_addr lid reg_offset reg_space write_data\" input=hex_or_dec",
+				  got);
+		else
+			hsmp_err(dev, attr_name, HSMP_ERR_ARGC,
+				 "want=4 got=%d fmt=\"dimm_addr lid reg_offset reg_space\" input=hex_or_dec",
+				  got);
+		return -EINVAL;
+	}
+
+	if (vals[0] > 255 || vals[1] > 15 || vals[2] > 2047 || vals[3] > 1 ||
+	    (with_data && vals[4] > 255)) {
+		if (with_data)
+			hsmp_err(dev, attr_name, HSMP_ERR_RANGE,
+				 "dimm_addr=0x%x lid=0x%x reg_offset=0x%x reg_space=%u write_data=%u valid_dimm_addr=0-255 valid_lid=0-15 valid_reg_offset=0-2047 valid_reg_space=0-1 valid_write_data=0-255",
+				  vals[0], vals[1], vals[2], vals[3], vals[4]);
+		else
+			hsmp_err(dev, attr_name, HSMP_ERR_RANGE,
+				 "dimm_addr=0x%x lid=0x%x reg_offset=0x%x reg_space=%u valid_dimm_addr=0-255 valid_lid=0-15 valid_reg_offset=0-2047 valid_reg_space=0-1",
+				  vals[0], vals[1], vals[2], vals[3]);
+		return -EINVAL;
+	}
+
+	*addr = vals[0];
+	*lid = vals[1];
+	*off = vals[2];
+	*space = vals[3];
+	if (with_data)
+		*data = vals[4];
+
+	return 0;
+}
+
+static u32 dimm_sb_pack(int addr, int lid, int off, int space, int data)
+{
+	return (addr & 0xff) |
+	       ((lid & 0xf) << 8) |
+	       ((off & 0x7ff) << 12) |
+	       ((space & 1) << 23) |
+	       ((data & 0xff) << 24);
+}
+
+/*
+ * Last DIMM sideband read request and its data, or -ENODATA if none has
+ * succeeded. Fields are address, LID, offset, reg space, and data.
+ */
+ssize_t hsmp_dimm_sb_get_show(struct device *dev, struct device_attribute *attr,
+			      char *buf)
+{
+	struct dimm_sb_cfg *cfg = dimm_sb_state(dev, attr);
+
+	if (!cfg)
+		return -EINVAL;
+	if (!cfg->configured)
+		return -ENODATA;
+
+	return sysfs_emit(buf, "0x%x 0x%x 0x%x %u 0x%x\n",
+			  cfg->addr, cfg->lid, cfg->reg_offset, cfg->reg_space,
+			  cfg->result);
+}
+
+/* Issue HSMP_DIMM_SB_RD and cache the request and the returned data. */
+ssize_t hsmp_dimm_sb_get_store(struct device *dev, struct device_attribute *attr,
+			       const char *buf, size_t count)
+{
+	struct dimm_sb_cfg *cfg = dimm_sb_state(dev, attr);
+	struct hsmp_message msg = {};
+	int addr, lid, off, space;
+	int ret;
+
+	if (!cfg)
+		return -EINVAL;
+
+	ret = dimm_sb_parse(dev, "dimm_sb_get", buf, false, &addr, &lid, &off, &space, NULL);
+	if (ret)
+		return ret;
+
+	/*
+	 * HSMP_DIMM_SB_RD: reg space[23] + reg offset[22:12] +
+	 * LID[11:8] + DIMM address[7:0].
+	 */
+	msg.msg_id = HSMP_DIMM_SB_RD;
+	msg.sock_ind = hsmp_sysfs_sock_ind(dev, to_hsmp_sys_attr(attr));
+	msg.num_args = 1;
+	msg.response_sz = 1;
+	msg.args[0] = dimm_sb_pack(addr, lid, off, space, 0);
+
+	ret = hsmp_send_message(&msg);
+	if (ret) {
+		hsmp_err(dev, "dimm_sb_get", HSMP_ERR_HW,
+			 "dimm_addr=0x%x lid=0x%x reg_offset=0x%x reg_space=%u rc=%d",
+			  addr, lid, off, space, ret);
+		return ret;
+	}
+
+	cfg->addr = addr;
+	cfg->lid = lid;
+	cfg->reg_offset = off;
+	cfg->reg_space = space;
+	cfg->result = msg.args[0] & 0xffff;
+	cfg->configured = true;
+
+	return count;
+}
+
+/* Write one DIMM sideband register via HSMP_DIMM_SB_WR. */
+ssize_t hsmp_dimm_sb_set_store(struct device *dev, struct device_attribute *attr,
+			       const char *buf, size_t count)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	struct hsmp_message msg = {};
+	int addr, lid, off, space, data;
+	u16 sock_ind;
+	int ret;
+
+	sock_ind = hsmp_sysfs_sock_ind(dev, hattr);
+	if (sock_ind >= MAX_AMD_NUM_NODES)
+		return -EINVAL;
+
+	ret = dimm_sb_parse(dev, "dimm_sb_set", buf, true, &addr, &lid, &off, &space, &data);
+	if (ret)
+		return ret;
+
+	/*
+	 * HSMP_DIMM_SB_WR: write data[31:24] + reg space[23] +
+	 * reg offset[22:12] + LID[11:8] + DIMM address[7:0].
+	 */
+	msg.msg_id = HSMP_DIMM_SB_WR;
+	msg.sock_ind = sock_ind;
+	msg.num_args = 1;
+	msg.response_sz = 0;
+	msg.args[0] = dimm_sb_pack(addr, lid, off, space, data);
+
+	ret = hsmp_send_message(&msg);
+	if (ret) {
+		hsmp_err(dev, "dimm_sb_set", HSMP_ERR_HW,
+			 "dimm_addr=0x%x lid=0x%x reg_offset=0x%x reg_space=%u write_data=%u rc=%d",
+			  addr, lid, off, space, data, ret);
+		return ret;
+	}
+
+	return count;
+}
+
 static ssize_t hsmp_lclk_nbio_show(struct device *dev,
 				   struct device_attribute *attr,
 				   u8 nbio_id, char *buf)
diff --git a/drivers/platform/x86/amd/hsmp/sysfs.h b/drivers/platform/x86/amd/hsmp/sysfs.h
index 83358304da97b..2e7064df871bb 100644
--- a/drivers/platform/x86/amd/hsmp/sysfs.h
+++ b/drivers/platform/x86/amd/hsmp/sysfs.h
@@ -158,7 +158,18 @@ umode_t hsmp_io_bw_file_visible(const struct hsmp_socket *sock, int id);
 ssize_t hsmp_xgmi_link_bw_show(struct device *dev, struct device_attribute *attr,
 			       char *buf);
 umode_t hsmp_xgmi_bw_file_visible(const struct hsmp_socket *sock, int id);
+ssize_t hsmp_dimm_sb_get_show(struct device *dev, struct device_attribute *attr,
+			      char *buf);
+ssize_t hsmp_dimm_sb_get_store(struct device *dev, struct device_attribute *attr,
+			       const char *buf, size_t count);
+ssize_t hsmp_dimm_sb_set_store(struct device *dev, struct device_attribute *attr,
+			       const char *buf, size_t count);
 
+/*
+ * True when the attribute store issues a GET, or only records state for
+ * a later GET. The write bit then follows the GET message bitmap.
+ */
+bool hsmp_sysfs_write_follows_read(const struct hsmp_sys_attr *hattr);
 
 void hsmp_create_per_cpu_kobjects(struct device *dev, struct kobject *cpu_parent,
 				  struct hsmp_socket *sock);
-- 
2.34.1

