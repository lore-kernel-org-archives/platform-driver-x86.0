Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793604051;
	b=cFTix3xSmpMK2+vVIg2RXhLgnDZan0GtJ3Xa4vyuoTV7WlBtgQHumUelFa8x26nyYdDE
	 Iz93+PNSEGMH/f7gRScjGAYL+77RAAcnrcIFdnZeqp3CnVjb4UisJhWhgEyqKoVNk2uqp
	 +1Q6v+1xZySbxnf7CNr1Ig9I03kReKHqQpnVxNZms289pvp1SnGmin1myI2XslUfQ/Hc0
	 eg6m5C/nl1+2NM3MSa9pWVny0dWWNVHHNcEdUdjqxhNWcyC1zwK//bqqhkOlbfZ1yIGLC
	 kYkaav/tVnKujKLEfQDyD8+a/pn0eEAq6PCWo7UlfXd29waBlHOfkUzQh4dMP/CUkxQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793604051;
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
	bh=hN/GtvVB90oQ6ZM4y8jMc+uiGvNSE94f+n6bt7lk2kY=;
	b=G6RW81W5a7+cYaj/yprhasVacwKHRbb32aOKJSTdFzXWPsVnHvRI25sw6JQDquEg59O/
	 8mWsh0Ia1jzsWdpQ1y/P20GY6wNYfgcsaXE4agvCH1ALfNHEPrFKuJHnVG7km88gg56jI
	 HBIgskuKH/H6OkdWOmQmnOB9Pw69X5JjEwzXkyso02aeqVhMS8EBucbInhUfDcovco/hu
	 lKwTBrMatDxfeMtYhb4VHO2nn/ZuSImWMg1Sj6bDSO0oi7fx4jLYx63Bdynwj5ZvtIKhw
	 xy5xjacuRoFVm96dZKJVsaNRS2eD2oBiDZ5VrP48B6Rv+d93ha4tB3jKLfEb2/6WmUw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=zatouYL7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.49
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013049.outbound.protection.outlook.com [40.93.196.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BE9606A327
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Nov 2026 07:20:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69BE9606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=zatouYL7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MaYmDsoGD2fs1S11uIdRaDnzCgAQuI3o8rLoUc0l1KWR76fUxjw2fGLWBdYUkU8TZMgZfgCILuYqRVXrk+J5OaPGc85G/F+PmQXy1keNmEBeXt+O1PYhFY8jhyxJaOmcAMPstwkxNNkrPcGshsNeNK0jDCrq+gh3lnsmGUBKCTlKuOxK12szcIs9H0IIY9o5z8IHpEbhO66OoTAXHxmtYNgpLBV+Op38NLEhGPr8fZSSiizHVyydfBRMS61vYgw4gz2Vd+w4ChLusM2Gmx7J//iS6e6UPscHbsdj7nEUwXdtpHUf8FTUEzvU/sXJc4Nrwx/SNvKViqJyhFMQJzI+Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hN/GtvVB90oQ6ZM4y8jMc+uiGvNSE94f+n6bt7lk2kY=;
 b=WwrCv2s0RdB/dbTmNahNaxgGMhZtrxNeWSrmrD7yRGglNeBEYc56ycST5nG6gCtwo4N+bbFwEVENevOAmUgxBiLQi7KPMaL8IKyx+Lfr8RwzvTuz1DnVu7yw35R/UOolqvSOO58NoptlfzHS9QQnSsG5BfJU1IOGvVA50IIxlau27hiVMcnx1mIccO1VwICcibUxe1tBOO8mgbpR7sAqPdvMSlPfUsCXuLN2mglAbm5n7+Z65KuKAB+EjX5ZD/EXvBMIkLEgkhfDh5YqiNqPLUQTA0CA7t1pfNk4r46UcOoCPMWNtw3Q24XwkenAKyZ3dmOmgJreBNixLhsEH2cPsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hN/GtvVB90oQ6ZM4y8jMc+uiGvNSE94f+n6bt7lk2kY=;
 b=zatouYL7Qtnp09CVJqWn+OeUtwZeuP38FwGmrwc9FmQTAqxiskLdHJxBcHfLUZhm4TGXNLRkoVJmSgjjNDwXNL35h809MfVyBdkeQjmhmyhBUJh/FEotPnI1xqYq7ETpQbI/2HCUXcSwalZkyNXIwDFMkwIYdvi2V+KMDQvfVbI=
Received: from MW3PR06CA0005.namprd06.prod.outlook.com (2603:10b6:303:2a::10)
 by SA0PR12MB4447.namprd12.prod.outlook.com (2603:10b6:806:9b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 07:20:46 +0000
Received: from SJ1PEPF000037A5.namprd04.prod.outlook.com
 (2603:10b6:303:2a:cafe::33) by MW3PR06CA0005.outlook.office365.com
 (2603:10b6:303:2a::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Mon, 2
 Nov 2026 07:20:46 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000037A5.mail.protection.outlook.com (10.167.244.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 07:20:45 +0000
Received: from trento15c5.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 2 Nov
 2026 01:20:43 -0600
From: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <Suma.Hegde@amd.com>,
	<NaveenKrishna.Chatradhi@amd.com>, Muthusamy Ramalingam
	<Muthusamy.Ramalingam@amd.com>
Subject: [PATCH 16/26] platform/x86/amd/hsmp: Add enabled command sysfs files
Date: Mon, 2 Nov 2026 07:19:14 +0000
Message-ID: <e4f44ff0e31e59aa8da6da78860a9682fa3ac079.1793602633.git.Muthusamy.Ramalingam@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A5:EE_|SA0PR12MB4447:EE_
X-MS-Office365-Filtering-Correlation-Id: 20742a75-da30-4f79-c770-08df38b1d001
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|261021123027099003|261021121427099003|261009223027099003|261026121527099003|11063799006|10067099003|56012099006|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	1p/0yQoY0X7Vz1y5+RRK98pRHGhFIsSZ7Iyx+Ya6Zkd2hnQZgk0GwZlskDcCvxp9YFWOADLcuXjpZG0acJvOFJJH1eLOFJJJ/0+k0lfU1uDbej+SGCk/KoAbL/OjpLPwKI3DaERLzfIq5w6HG/A7hu2UUKmPlkNJ+F9KxpbIvs4EkK+4Rpdth//zQ4t8duCikFQ27nWywchwd7hhQIsRFE2oy3mOJ9nx8bwhGx6b62RqYRn3nJx/uhpGPXGdoMekj1GeZX72R0HneMcpH76SU08VN8Dz1YTVH71hRmlF2nlH9XoH6QhgzCE4aoNmR/bBXjYzq79uMuuYkW56M65PUxTay/lrBV0/+QBdB93I0WmKpAsQJrp4ilyWif4xuaIige36uRR99ZKbCY+nYRv/g2mrmvCYYwljk95ohPCgHOk371lfQ0rD83Yu/b1Qvy72RLQcIwG22eUzQl7oQVqKEcEgPovIhVWs9Q/is1uEjkZsoglx7b/igcDkQCU/uNEEMkBmSjAavBGrNCjxBnCNy4t+wDyHilqSU9EDDE8sto7lzIGHGyTiVTBdESgu8KrobSGKyt0XJhOFU/zoMhBVGxwCvBIPPrw1Eq0+dwIlHkYXArcHzHoiO043uoS0joXubAEfz+7pA8NDO7cXpkC+pf2menbwcAc5X+UKfpKv19Oj+2wqr5oTJgiNycp34L4f1wN80SGXU3SiZnPhTO4XYQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(261021123027099003)(261021121427099003)(261009223027099003)(261026121527099003)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XEsOxyg0fswQB9exGsU7lPLuNdsQw+qs8G60cLu1xC0y92abzufttet/AapxapWjaI63sCiSjjLNW9PADZe+iScy4zYYckWQBkCCtUhYjFeJe90kpjiE8MlaV6VEWn+My8G5Hh9rS1xbbxVKcb2B5LKutJ+oBK9nQD1/X551Hry5/CIKHM7I1catKp8OcH+O9t1DDb2Icju4GsAWuH1YAvthMUn0OK4YEtqMEpQjVFzl/XwOtOhdEJjDsAgdRbChWoqGSvptLjM7zFfbYWwBWMMmae6QqrzeZOD3ZkYFnCji4NvAWVvUF07oVHd04eq1I1Bpq55CYOKksPojwLTv8ab4OPKw7JRDEGDGlKNgKPAFFD3LB69lgbGJ8sz/0f5yV3HNBI/px3aXYKTca1OvS79RG7JIEtT0EWoTYzQGCcf7cgycokrO4l3IWHaHxkXs
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 07:20:45.8767
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20742a75-da30-4f79-c770-08df38b1d001
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037A5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4447

Expose read-only enabled_read_commands and enabled_write_commands on
both drivers. Each prints the three firmware bitmasks returned by
HSMP_GET_ENABLED_HSMP_CMDS.

Co-developed-by: Suma Hegde <Suma.Hegde@amd.com>
Signed-off-by: Suma Hegde <Suma.Hegde@amd.com>
Signed-off-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
---
 Documentation/arch/x86/amd_hsmp.rst   |  3 ++
 drivers/platform/x86/amd/hsmp/acpi.c  |  6 ++++
 drivers/platform/x86/amd/hsmp/hsmp.c  |  3 --
 drivers/platform/x86/amd/hsmp/hsmp.h  |  4 +++
 drivers/platform/x86/amd/hsmp/plat.c  |  6 ++++
 drivers/platform/x86/amd/hsmp/sysfs.c | 43 +++++++++++++++++++++++++++
 drivers/platform/x86/amd/hsmp/sysfs.h |  4 +++
 7 files changed, 66 insertions(+), 3 deletions(-)

diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
index b298906a32970..28cdb9d9ec645 100644
--- a/Documentation/arch/x86/amd_hsmp.rst
+++ b/Documentation/arch/x86/amd_hsmp.rst
@@ -103,6 +103,9 @@ write-only when the platform enables only that direction of the message.
 * smu_fw_version: SMU firmware version.
 * protocol_version: HSMP interface version, as eight hexadecimal digits.
 * metric_version: Metrics table version, as eight hexadecimal digits.
+* enabled_read_commands, enabled_write_commands: Read-only. Three
+  space-separated 32-bit hexadecimal masks of the HSMP commands firmware
+  enables for read and write.
 * ddr_max_bw: Theoretical maximum DDR bandwidth in GB/s.
 * ddr_utilised_bw: Current utilized DDR bandwidth in GB/s.
 * ddr_utilised_bw_perc: Percentage of current utilized DDR bandwidth.
diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 6ce8b138277a0..ee9fb3ed74dc6 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -527,6 +527,10 @@ HSMP_DEV_ATTR(prochot_status, HSMP_GET_PROC_HOT, hsmp_msg_resp32_show, 0444);
 HSMP_DEV_ATTR(smu_fw_version, HSMP_GET_SMU_VER, hsmp_msg_fw_ver_show, 0444);
 HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_hex_show, 0444);
 HSMP_DEV_ATTR(metric_version, HSMP_GET_METRIC_TABLE_VER, hsmp_msg_resp32_hex_show, 0444);
+HSMP_DEV_ATTR(enabled_read_commands, HSMP_GET_ENABLED_HSMP_CMDS,
+	      hsmp_enabled_read_commands_show, 0444);
+HSMP_DEV_ATTR(enabled_write_commands, HSMP_GET_ENABLED_HSMP_CMDS,
+	      hsmp_enabled_write_commands_show, 0444);
 HSMP_DEV_ATTR(cclk_freq_limit, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444);
 HSMP_DEV_ATTR(ddr_max_bw, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_max_bw_show, 0444);
 HSMP_DEV_ATTR(ddr_utilised_bw, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444);
@@ -665,6 +669,8 @@ static struct attribute *hsmp_dev_attr_list[] = {
 	&hattr_smu_fw_version.dattr.attr,
 	&hattr_protocol_version.dattr.attr,
 	&hattr_metric_version.dattr.attr,
+	&hattr_enabled_read_commands.dattr.attr,
+	&hattr_enabled_write_commands.dattr.attr,
 	&hattr_cclk_freq_limit.dattr.attr,
 	&hattr_ddr_max_bw.dattr.attr,
 	&hattr_ddr_utilised_bw.dattr.attr,
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 80721b13074d2..c690234a25426 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -869,9 +869,6 @@ static const u32 write_bitmap_zen6_variants[] = {0x00047320, 0x070007c6, 0x00000
 #define set_write_enabled_msg_bitmap(sock, src)	\
 	bitmap_from_arr32((sock)->enabled_write_msg_ids, (src), HSMP_MAX_MSGS)
 
-#define HSMP_GET_ENABLED_CMD_READ_MASK	1
-#define HSMP_GET_ENABLED_CMD_WRITE_MASK	0
-
 static int hsmp_fetch_read_enabled_msgs(u16 sock_ind, unsigned long *read_msg_bmap)
 {
 	struct hsmp_message msg = {};
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
index b41080c0f9555..582913812e060 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.h
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -30,6 +30,10 @@
 
 #define HSMP_MAX_MSGS			96
 
+/* args[0] bit 0 of HSMP_GET_ENABLED_HSMP_CMDS selects the bitmap. */
+#define HSMP_GET_ENABLED_CMD_READ_MASK	1
+#define HSMP_GET_ENABLED_CMD_WRITE_MASK	0
+
 #define HSMP_METRICS_TABLE_NAME	"metrics_bin"
 
 #define HSMP_ATTR_GRP_NAME_SIZE	10
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index bb3c0791362ef..61f7747c782ea 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -249,6 +249,10 @@ HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_hex_show, 04
 
 HSMP_DEV_ATTR_X8(metric_version, HSMP_GET_METRIC_TABLE_VER,
 		 hsmp_msg_resp32_hex_show, 0444);
+HSMP_DEV_ATTR_X8(enabled_read_commands, HSMP_GET_ENABLED_HSMP_CMDS,
+		 hsmp_enabled_read_commands_show, 0444);
+HSMP_DEV_ATTR_X8(enabled_write_commands, HSMP_GET_ENABLED_HSMP_CMDS,
+		 hsmp_enabled_write_commands_show, 0444);
 
 HSMP_DEV_ATTR(prochot_status, HSMP_GET_PROC_HOT, hsmp_msg_resp32_show, 0444, 0);
 HSMP_DEV_ATTR(prochot_status, HSMP_GET_PROC_HOT, hsmp_msg_resp32_show, 0444, 1);
@@ -898,6 +902,8 @@ static struct attribute _name[] = {					       \
 	&hattr_smu_fw_version##_sock_ind.dattr.attr,			       \
 	&hattr_protocol_version##_sock_ind.dattr.attr,			       \
 	&hattr_metric_version##_sock_ind.dattr.attr,			       \
+	&hattr_enabled_read_commands##_sock_ind.dattr.attr,		       \
+	&hattr_enabled_write_commands##_sock_ind.dattr.attr,		       \
 	&hattr_cclk_freq_limit##_sock_ind.dattr.attr,		       \
 	&hattr_ddr_max_bw##_sock_ind.dattr.attr,			       \
 	&hattr_ddr_utilised_bw##_sock_ind.dattr.attr,		       \
diff --git a/drivers/platform/x86/amd/hsmp/sysfs.c b/drivers/platform/x86/amd/hsmp/sysfs.c
index b0a939071b575..62d5b6c90ea47 100644
--- a/drivers/platform/x86/amd/hsmp/sysfs.c
+++ b/drivers/platform/x86/amd/hsmp/sysfs.c
@@ -107,6 +107,49 @@ ssize_t hsmp_msg_resp32_hex_show(struct device *dev, struct device_attribute *at
 	return sysfs_emit(buf, "0x%08x\n", data);
 }
 
+static ssize_t hsmp_enabled_cmds_show(struct device *dev,
+				      struct device_attribute *attr,
+				      u32 mask, char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	struct hsmp_message msg = {};
+	u16 sock_ind;
+	int ret;
+
+	sock_ind = hsmp_sysfs_sock_ind(dev, hattr);
+	if (sock_ind == U16_MAX)
+		return -EINVAL;
+
+	/*
+	 * HSMP_GET_ENABLED_HSMP_CMDS: args[0] bit 0 selects the read (1)
+	 * or write (0) bitmap. The response is three 32-bit masks.
+	 */
+	msg.msg_id = HSMP_GET_ENABLED_HSMP_CMDS;
+	msg.sock_ind = sock_ind;
+	msg.num_args = 1;
+	msg.response_sz = 3;
+	msg.args[0] = mask;
+
+	ret = hsmp_send_message(&msg);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "0x%08X 0x%08X 0x%08X\n",
+			  msg.args[0], msg.args[1], msg.args[2]);
+}
+
+ssize_t hsmp_enabled_read_commands_show(struct device *dev,
+					struct device_attribute *attr, char *buf)
+{
+	return hsmp_enabled_cmds_show(dev, attr, HSMP_GET_ENABLED_CMD_READ_MASK, buf);
+}
+
+ssize_t hsmp_enabled_write_commands_show(struct device *dev,
+					 struct device_attribute *attr, char *buf)
+{
+	return hsmp_enabled_cmds_show(dev, attr, HSMP_GET_ENABLED_CMD_WRITE_MASK, buf);
+}
+
 ssize_t hsmp_ddr_max_bw_show(struct device *dev, struct device_attribute *attr,
 			     char *buf)
 {
diff --git a/drivers/platform/x86/amd/hsmp/sysfs.h b/drivers/platform/x86/amd/hsmp/sysfs.h
index 2e7064df871bb..2b14c4135212d 100644
--- a/drivers/platform/x86/amd/hsmp/sysfs.h
+++ b/drivers/platform/x86/amd/hsmp/sysfs.h
@@ -67,6 +67,10 @@ ssize_t hsmp_msg_resp32_show(struct device *dev, struct device_attribute *attr,
 			     char *buf);
 ssize_t hsmp_msg_resp32_hex_show(struct device *dev, struct device_attribute *attr,
 				 char *buf);
+ssize_t hsmp_enabled_read_commands_show(struct device *dev,
+					struct device_attribute *attr, char *buf);
+ssize_t hsmp_enabled_write_commands_show(struct device *dev,
+					 struct device_attribute *attr, char *buf);
 ssize_t hsmp_ddr_max_bw_show(struct device *dev, struct device_attribute *attr,
 			     char *buf);
 ssize_t hsmp_ddr_util_bw_show(struct device *dev, struct device_attribute *attr,
-- 
2.34.1

