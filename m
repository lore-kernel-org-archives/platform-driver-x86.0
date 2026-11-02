Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793604080;
	b=KTwc/muhivk530dTx9gfupQFpiRHvSeKgM+bCgy5K7XIfJkdsbFi/fUhRalS4jW3sqis
	 9OLAvPgnl4fA2WlE4NGaf1kckU2QwFufgXMRnZ6F9fdX4UE6yxLOFfIqBf4cO3SsmX25I
	 Tw6untmk5DQ5k9JIpN2DUrla1vVUBCIjl8zZXu0ITnbk7F/R8juuN91ZxgrQv2YVrZgIK
	 yOO24vl07/+3551xHeQ4VWwUSOKuhpckupuQvJUy+vcLRNdfl+lGQjUiHIqPOZLe3RZlf
	 2VMsKuJCHPDMsuQxJjqPocI9LGWdsl7LVsPiCuh+ah6Y2hXmTMCXJ9ArQlfCa583flw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793604080;
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
	bh=RBv/a6WHj5SlD43BYFeLqJnDNg3muuYdpsbvk44GNp4=;
	b=pBl3X8n7yKZY9ZPWtcaXMNj8l+10CfxwxHirii3y7vB0X9PmxtXV7/eHovrqo21qpB8o
	 /eULU+v6AylvmPfCnlIf+iIWDdWoJk26BnoZXwdN79eK0rQ85KkTueTUV3xlcpvml3y6U
	 oVVDFA8j3rwPJ7YMHXAYNIS1FLfwLfjN2KIiYLV4yiAhlyHsuGV0TEw9XKaIDDgdzUfbh
	 E7y4Wg1BGVwLPhD/Jj9iaEt62EbcZozYj7TTcZvHbHqv4BBDhPTSnqx3YnW6kwfSXXE/l
	 vvvBzBnNMrgb5hLsfg2QVFBzpLzsYyL1KVV5ImsSA9IHlNpHJDh5LcPisXXUIQl1/fA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=svHk6pDk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.32
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012032.outbound.protection.outlook.com [40.107.209.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B751606A336
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Nov 2026 07:21:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B751606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=svHk6pDk
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dg+LLh7SH7XKoLGlHr72kUqfxWBSXLkRkXXeDG6aSY4IX8HAEPRVmFZWAj/4g+NdnmDvFOqV1ziDIJcs4wrYuujUwboVmmNKUUM3y3D+fMtYexqAcXHWSX9piEhPjrqWnwx6xfsjgyVOWnNAsVaLBe4shW/n0Zrzth0YR3Nw1iAM8eYGOUNFa9ch1XF6FP1mtb192SEFxg0HUSOFC3UtqtOTh840UorKpDgKPkWiOyxEBRmK4jIFSOizEtXXSeE/5/dSbBXaRsE5D96p9eVGvY1undwmu+NYxCJ6EwkezNa0S0f0bwuyTBGJd2Wjc7jkuvxHOIEgbIEKigJeNK+uBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RBv/a6WHj5SlD43BYFeLqJnDNg3muuYdpsbvk44GNp4=;
 b=FlPmlTY0tWPD1gypKQ9/6/vsdzXS+nnPM7ydrXhmE+9sQXQY+e9VFY1z1s7NjfaBsEEptlg2tROmYaVOWMVn4WmyF77864wVETKz2LpZn2bUpM//6vGFhVqE8vFDoeJCQO1575BEingcyhdBN67pVAgFYs7kDi5XgBL5CMy1dHMc5LrtbfQbwkpnyEFXUhUNh5xfG7K7kQRO5p1ckQ7PMCN9JtBIWETfXNSkL2U+3Dj0lrm6feup9O8v45cElt1eITo5KSesgQjfFN+m7YWPQAexhEKUdVhlE2p7/H03oQgjLl/Ua+5FTxGRt933cT83kj1tdvwan2ZsYrWcxfqSvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RBv/a6WHj5SlD43BYFeLqJnDNg3muuYdpsbvk44GNp4=;
 b=svHk6pDkfLpSRBUzEKqQbODIibUfjv/921PEQ2hBtjsRn5fE6p4iKqeoPua1Slqi9p/jbS0TFggjkrIr2XCDfN5J+HdnR504EyJyo1c5btTmUTRNb3YmutckpdYJFZa5P5poqkTOCaiXM6Dn4RkclfJC0mw35yxUbjMNDyrlIyc=
Received: from MW3PR06CA0030.namprd06.prod.outlook.com (2603:10b6:303:2a::35)
 by DM6PR12MB4139.namprd12.prod.outlook.com (2603:10b6:5:214::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Mon, 2 Nov 2026
 07:20:14 +0000
Received: from SJ1PEPF000037A5.namprd04.prod.outlook.com
 (2603:10b6:303:2a:cafe::7c) by MW3PR06CA0030.outlook.office365.com
 (2603:10b6:303:2a::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Mon, 2
 Nov 2026 07:20:14 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000037A5.mail.protection.outlook.com (10.167.244.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 07:20:14 +0000
Received: from trento15c5.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 2 Nov
 2026 01:20:12 -0600
From: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <Suma.Hegde@amd.com>,
	<NaveenKrishna.Chatradhi@amd.com>, Muthusamy Ramalingam
	<Muthusamy.Ramalingam@amd.com>
Subject: [PATCH 01/26] platform/x86/amd/hsmp: Drop _input from socket sysfs names
Date: Mon, 2 Nov 2026 07:18:59 +0000
Message-ID: <129415f212369a0581b48c1992191c0fb61b4a0d.1793602633.git.Muthusamy.Ramalingam@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A5:EE_|DM6PR12MB4139:EE_
X-MS-Office365-Filtering-Correlation-Id: 258e1148-47ad-4e35-70b0-08df38b1bd5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|376014|1800799024|18002099003|22082099003|56012099006|11063799006|261026121527099003|261028144727099003|261021121427099003|10067099003|261022105027099003|261021123027099003|261026140227099003|261009223027099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	wOboYsDXILgZVui1hcO45HZVq08f/yBzdW6AuBxqQxaxIdxHzuXaWEqzKyUo+xqM+aYzuPb927GoloJ0BVRG+l06cRpAcWdGH1guRPnBYHuLTUKnNI21NwSTccMPC3sIg5DACefvfOTYStbj5KmKyjmRH749TY8kQhPCoq5u25Vi2Pxhzc8n10L2J1Lz7ujS1CsrInR+biiEvSs9dgj2rMzBH9yg2URhXxKjma4nw941qHc7CrwsEK0suXuVQNDCcxVW3OLjUlWIIqKjPYeUVdmJztK/wwNTTr1/aSWeGHSi4Q2uytKTVd4EdaC5ouEOZ8/pfsBTPplWhkFcq+NisJNKpaECf2j9cJGKkkcbOCC8o/qq5wwUI97YoFVYYdljxx2ZBZgHPAZ6OoCW2iL+zK6mvJHqC8UQ7urIKJeIcROBW/XB/qil+c+H9OYOR+xT17RUwXBaBVcVC6xZxZMRy2wCOjk7Yg/KThTRwZCtGNF/llJ1UnDgcEkBlKZoMTi657BNN6d0u828LScxZJiYekHcDILTJre+x6EJyMGljggEnA5Fl7Ko9nn9zv3PgT7Xv9Xg0dejJOvZXjLMF75MgYkBohL4Ph+vk6a5CljGEG7ooLvhjoyL7wHpueoWBkwz32t5EhyYXO2n/aulA8usPnA5VIyXw2SR4j10mGWzOk3XLs4Vfsq1BTXNK9Ky1jL08cyaZbh4clJVvYWZo/OjWw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(376014)(1800799024)(18002099003)(22082099003)(56012099006)(11063799006)(261026121527099003)(261028144727099003)(261021121427099003)(10067099003)(261022105027099003)(261021123027099003)(261026140227099003)(261009223027099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9R+k//q3eL9OB/UJunwtER3ElHHbONlp/1EnfTRqbxb/niGyp2kBJ32srHvfW+ZfXtBj+LPOaprIjB7+S1tEtcWnwYQS5uNSk+yuERweIPZYau9rfsSIcrbziCReBieLbZj1RiR4v6luu3ntieQ8453tDPBxohdW0ZHvUkOYfKJaDCuVU+JKwzifDX3pUiat6M0WRGQETl5C0HMVB+CcKy7g8daCMI2dYHH9IUJbfp4D2tbZ+RRMUkgaoNd9x9KFUCltOhmTZEr1iqszrkpu/NrH3ZL0qLImXHoJUdzGLNF0tpwxhhlIYLuc7zT2fYFAXMpuLSosuA3n+JR82qbfqEDONfEkLq0iWkIEE2ZJppW+y5yKPHxLRo7nq8+MchYyc3ZyAPzF6C3rV3vdngDOOaDpdWjuNGmGxygEWezJAXdrm3mNPJUm9W1kIvs5roks
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 07:20:14.6147
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 258e1148-47ad-4e35-70b0-08df38b1bd5b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037A5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4139

These socket files are not hwmon attributes. Name them for the value
they report.

Co-developed-by: Suma Hegde <Suma.Hegde@amd.com>
Signed-off-by: Suma Hegde <Suma.Hegde@amd.com>
Signed-off-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
---
 Documentation/arch/x86/amd_hsmp.rst  |  12 +--
 drivers/platform/x86/amd/hsmp/acpi.c |  24 +++---
 drivers/platform/x86/amd/hsmp/plat.c | 112 +++++++++++++--------------
 3 files changed, 74 insertions(+), 74 deletions(-)

diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
index bd29ab9dd2385..6384935e7fe16 100644
--- a/Documentation/arch/x86/amd_hsmp.rst
+++ b/Documentation/arch/x86/amd_hsmp.rst
@@ -97,19 +97,19 @@ directory under amd_hsmp/socket/.
 A file that is normally readable and writable is created read-only or
 write-only when the platform enables only that direction of the message.
 
-* c0_residency_input: Percentage of cores in C0 state.
+* c0_residency: Percentage of cores in C0 state.
 * prochot_status: Reports 1 if the processor is at thermal threshold value,
   0 otherwise.
 * smu_fw_version: SMU firmware version.
 * protocol_version: HSMP interface version.
 * ddr_max_bw: Theoretical maximum DDR bandwidth in GB/s.
-* ddr_utilised_bw_input: Current utilized DDR bandwidth in GB/s.
-* ddr_utilised_bw_perc_input(%): Percentage of current utilized DDR bandwidth.
-* mclk_input: Memory clock in MHz.
-* fclk_input: Fabric clock in MHz.
+* ddr_utilised_bw: Current utilized DDR bandwidth in GB/s.
+* ddr_utilised_bw_perc: Percentage of current utilized DDR bandwidth.
+* mclk: Memory clock in MHz.
+* fclk: Fabric clock in MHz.
 * clk_fmax: Maximum frequency of socket in MHz.
 * clk_fmin: Minimum frequency of socket in MHz.
-* cclk_freq_limit_input: Core clock frequency limit per socket in MHz.
+* cclk_freq_limit: Core clock frequency limit per socket in MHz.
 * pwr_current_active_freq_limit: Current active frequency limit of socket
   in MHz.
 * pwr_current_active_freq_limit_source: Source of current active frequency
diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 9da4d9fb88be2..d7a7c40e40ccf 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -515,16 +515,16 @@ static const struct bin_attribute *hsmp_attr_list[] = {
 	HSMP_SYS_ATTR(_name, _name, _mode, NULL, _store, U16_MAX,	\
 		      _msg_id, _msg_id)
 
-HSMP_DEV_ATTR(c0_residency_input, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444);
+HSMP_DEV_ATTR(c0_residency, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444);
 HSMP_DEV_ATTR(prochot_status, HSMP_GET_PROC_HOT, hsmp_msg_resp32_show, 0444);
 HSMP_DEV_ATTR(smu_fw_version, HSMP_GET_SMU_VER, hsmp_msg_fw_ver_show, 0444);
 HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_show, 0444);
-HSMP_DEV_ATTR(cclk_freq_limit_input, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444);
+HSMP_DEV_ATTR(cclk_freq_limit, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444);
 HSMP_DEV_ATTR(ddr_max_bw, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_max_bw_show, 0444);
-HSMP_DEV_ATTR(ddr_utilised_bw_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444);
-HSMP_DEV_ATTR(ddr_utilised_bw_perc_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_perc_show, 0444);
-HSMP_DEV_ATTR(fclk_input, HSMP_GET_FCLK_MCLK, hsmp_fclk_show, 0444);
-HSMP_DEV_ATTR(mclk_input, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444);
+HSMP_DEV_ATTR(ddr_utilised_bw, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444);
+HSMP_DEV_ATTR(ddr_utilised_bw_perc, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_perc_show, 0444);
+HSMP_DEV_ATTR(fclk, HSMP_GET_FCLK_MCLK, hsmp_fclk_show, 0444);
+HSMP_DEV_ATTR(mclk, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444);
 HSMP_DEV_ATTR(clk_fmax, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmax_show, 0444);
 HSMP_DEV_ATTR(clk_fmin, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmin_show, 0444);
 HSMP_DEV_ATTR(pwr_current_active_freq_limit, HSMP_GET_SOCKET_FREQ_LIMIT,
@@ -552,16 +552,16 @@ HSMP_DEV_ATTR_RW(rail_iso_freq_policy, HSMP_CPU_RAIL_ISO_FREQ_POLICY,
 		 hsmp_rail_iso_freq_policy_show, hsmp_rail_iso_freq_policy_store, 0644);
 
 static struct attribute *hsmp_dev_attr_list[] = {
-	&hattr_c0_residency_input.dattr.attr,
+	&hattr_c0_residency.dattr.attr,
 	&hattr_prochot_status.dattr.attr,
 	&hattr_smu_fw_version.dattr.attr,
 	&hattr_protocol_version.dattr.attr,
-	&hattr_cclk_freq_limit_input.dattr.attr,
+	&hattr_cclk_freq_limit.dattr.attr,
 	&hattr_ddr_max_bw.dattr.attr,
-	&hattr_ddr_utilised_bw_input.dattr.attr,
-	&hattr_ddr_utilised_bw_perc_input.dattr.attr,
-	&hattr_fclk_input.dattr.attr,
-	&hattr_mclk_input.dattr.attr,
+	&hattr_ddr_utilised_bw.dattr.attr,
+	&hattr_ddr_utilised_bw_perc.dattr.attr,
+	&hattr_fclk.dattr.attr,
+	&hattr_mclk.dattr.attr,
 	&hattr_clk_fmax.dattr.attr,
 	&hattr_clk_fmin.dattr.attr,
 	&hattr_pwr_current_active_freq_limit.dattr.attr,
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index 2385827b7ae8a..c246a996e2d4c 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -215,14 +215,14 @@ HSMP_DEV_ATTR_W(_name, _msg_id, _store, _mode, 5); \
 HSMP_DEV_ATTR_W(_name, _msg_id, _store, _mode, 6); \
 HSMP_DEV_ATTR_W(_name, _msg_id, _store, _mode, 7)
 
-HSMP_DEV_ATTR(c0_residency_input, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444, 0);
-HSMP_DEV_ATTR(c0_residency_input, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444, 1);
-HSMP_DEV_ATTR(c0_residency_input, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444, 2);
-HSMP_DEV_ATTR(c0_residency_input, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444, 3);
-HSMP_DEV_ATTR(c0_residency_input, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444, 4);
-HSMP_DEV_ATTR(c0_residency_input, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444, 5);
-HSMP_DEV_ATTR(c0_residency_input, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444, 6);
-HSMP_DEV_ATTR(c0_residency_input, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444, 7);
+HSMP_DEV_ATTR(c0_residency, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444, 0);
+HSMP_DEV_ATTR(c0_residency, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444, 1);
+HSMP_DEV_ATTR(c0_residency, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444, 2);
+HSMP_DEV_ATTR(c0_residency, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444, 3);
+HSMP_DEV_ATTR(c0_residency, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444, 4);
+HSMP_DEV_ATTR(c0_residency, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444, 5);
+HSMP_DEV_ATTR(c0_residency, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444, 6);
+HSMP_DEV_ATTR(c0_residency, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444, 7);
 
 HSMP_DEV_ATTR(smu_fw_version, HSMP_GET_SMU_VER, hsmp_msg_fw_ver_show, 0444, 0);
 HSMP_DEV_ATTR(smu_fw_version, HSMP_GET_SMU_VER, hsmp_msg_fw_ver_show, 0444, 1);
@@ -260,58 +260,58 @@ HSMP_DEV_ATTR(ddr_max_bw, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_max_bw_show, 0444, 5)
 HSMP_DEV_ATTR(ddr_max_bw, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_max_bw_show, 0444, 6);
 HSMP_DEV_ATTR(ddr_max_bw, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_max_bw_show, 0444, 7);
 
-HSMP_DEV_ATTR(ddr_utilised_bw_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444, 0);
-HSMP_DEV_ATTR(ddr_utilised_bw_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444, 1);
-HSMP_DEV_ATTR(ddr_utilised_bw_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444, 2);
-HSMP_DEV_ATTR(ddr_utilised_bw_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444, 3);
-HSMP_DEV_ATTR(ddr_utilised_bw_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444, 4);
-HSMP_DEV_ATTR(ddr_utilised_bw_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444, 5);
-HSMP_DEV_ATTR(ddr_utilised_bw_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444, 6);
-HSMP_DEV_ATTR(ddr_utilised_bw_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444, 7);
+HSMP_DEV_ATTR(ddr_utilised_bw, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444, 0);
+HSMP_DEV_ATTR(ddr_utilised_bw, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444, 1);
+HSMP_DEV_ATTR(ddr_utilised_bw, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444, 2);
+HSMP_DEV_ATTR(ddr_utilised_bw, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444, 3);
+HSMP_DEV_ATTR(ddr_utilised_bw, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444, 4);
+HSMP_DEV_ATTR(ddr_utilised_bw, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444, 5);
+HSMP_DEV_ATTR(ddr_utilised_bw, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444, 6);
+HSMP_DEV_ATTR(ddr_utilised_bw, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444, 7);
 
-HSMP_DEV_ATTR(ddr_utilised_bw_perc_input, HSMP_GET_DDR_BANDWIDTH,
+HSMP_DEV_ATTR(ddr_utilised_bw_perc, HSMP_GET_DDR_BANDWIDTH,
 	      hsmp_ddr_util_bw_perc_show, 0444, 0);
-HSMP_DEV_ATTR(ddr_utilised_bw_perc_input, HSMP_GET_DDR_BANDWIDTH,
+HSMP_DEV_ATTR(ddr_utilised_bw_perc, HSMP_GET_DDR_BANDWIDTH,
 	      hsmp_ddr_util_bw_perc_show, 0444, 1);
-HSMP_DEV_ATTR(ddr_utilised_bw_perc_input, HSMP_GET_DDR_BANDWIDTH,
+HSMP_DEV_ATTR(ddr_utilised_bw_perc, HSMP_GET_DDR_BANDWIDTH,
 	      hsmp_ddr_util_bw_perc_show, 0444, 2);
-HSMP_DEV_ATTR(ddr_utilised_bw_perc_input, HSMP_GET_DDR_BANDWIDTH,
+HSMP_DEV_ATTR(ddr_utilised_bw_perc, HSMP_GET_DDR_BANDWIDTH,
 	      hsmp_ddr_util_bw_perc_show, 0444, 3);
-HSMP_DEV_ATTR(ddr_utilised_bw_perc_input, HSMP_GET_DDR_BANDWIDTH,
+HSMP_DEV_ATTR(ddr_utilised_bw_perc, HSMP_GET_DDR_BANDWIDTH,
 	      hsmp_ddr_util_bw_perc_show, 0444, 4);
-HSMP_DEV_ATTR(ddr_utilised_bw_perc_input, HSMP_GET_DDR_BANDWIDTH,
+HSMP_DEV_ATTR(ddr_utilised_bw_perc, HSMP_GET_DDR_BANDWIDTH,
 	      hsmp_ddr_util_bw_perc_show, 0444, 5);
-HSMP_DEV_ATTR(ddr_utilised_bw_perc_input, HSMP_GET_DDR_BANDWIDTH,
+HSMP_DEV_ATTR(ddr_utilised_bw_perc, HSMP_GET_DDR_BANDWIDTH,
 	      hsmp_ddr_util_bw_perc_show, 0444, 6);
-HSMP_DEV_ATTR(ddr_utilised_bw_perc_input, HSMP_GET_DDR_BANDWIDTH,
+HSMP_DEV_ATTR(ddr_utilised_bw_perc, HSMP_GET_DDR_BANDWIDTH,
 	      hsmp_ddr_util_bw_perc_show, 0444, 7);
 
-HSMP_DEV_ATTR(cclk_freq_limit_input, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444, 0);
-HSMP_DEV_ATTR(cclk_freq_limit_input, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444, 1);
-HSMP_DEV_ATTR(cclk_freq_limit_input, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444, 2);
-HSMP_DEV_ATTR(cclk_freq_limit_input, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444, 3);
-HSMP_DEV_ATTR(cclk_freq_limit_input, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444, 4);
-HSMP_DEV_ATTR(cclk_freq_limit_input, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444, 5);
-HSMP_DEV_ATTR(cclk_freq_limit_input, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444, 6);
-HSMP_DEV_ATTR(cclk_freq_limit_input, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444, 7);
-
-HSMP_DEV_ATTR(fclk_input, HSMP_GET_FCLK_MCLK, hsmp_fclk_show, 0444, 0);
-HSMP_DEV_ATTR(fclk_input, HSMP_GET_FCLK_MCLK, hsmp_fclk_show, 0444, 1);
-HSMP_DEV_ATTR(fclk_input, HSMP_GET_FCLK_MCLK, hsmp_fclk_show, 0444, 2);
-HSMP_DEV_ATTR(fclk_input, HSMP_GET_FCLK_MCLK, hsmp_fclk_show, 0444, 3);
-HSMP_DEV_ATTR(fclk_input, HSMP_GET_FCLK_MCLK, hsmp_fclk_show, 0444, 4);
-HSMP_DEV_ATTR(fclk_input, HSMP_GET_FCLK_MCLK, hsmp_fclk_show, 0444, 5);
-HSMP_DEV_ATTR(fclk_input, HSMP_GET_FCLK_MCLK, hsmp_fclk_show, 0444, 6);
-HSMP_DEV_ATTR(fclk_input, HSMP_GET_FCLK_MCLK, hsmp_fclk_show, 0444, 7);
-
-HSMP_DEV_ATTR(mclk_input, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444, 0);
-HSMP_DEV_ATTR(mclk_input, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444, 1);
-HSMP_DEV_ATTR(mclk_input, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444, 2);
-HSMP_DEV_ATTR(mclk_input, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444, 3);
-HSMP_DEV_ATTR(mclk_input, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444, 4);
-HSMP_DEV_ATTR(mclk_input, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444, 5);
-HSMP_DEV_ATTR(mclk_input, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444, 6);
-HSMP_DEV_ATTR(mclk_input, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444, 7);
+HSMP_DEV_ATTR(cclk_freq_limit, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444, 0);
+HSMP_DEV_ATTR(cclk_freq_limit, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444, 1);
+HSMP_DEV_ATTR(cclk_freq_limit, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444, 2);
+HSMP_DEV_ATTR(cclk_freq_limit, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444, 3);
+HSMP_DEV_ATTR(cclk_freq_limit, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444, 4);
+HSMP_DEV_ATTR(cclk_freq_limit, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444, 5);
+HSMP_DEV_ATTR(cclk_freq_limit, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444, 6);
+HSMP_DEV_ATTR(cclk_freq_limit, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444, 7);
+
+HSMP_DEV_ATTR(fclk, HSMP_GET_FCLK_MCLK, hsmp_fclk_show, 0444, 0);
+HSMP_DEV_ATTR(fclk, HSMP_GET_FCLK_MCLK, hsmp_fclk_show, 0444, 1);
+HSMP_DEV_ATTR(fclk, HSMP_GET_FCLK_MCLK, hsmp_fclk_show, 0444, 2);
+HSMP_DEV_ATTR(fclk, HSMP_GET_FCLK_MCLK, hsmp_fclk_show, 0444, 3);
+HSMP_DEV_ATTR(fclk, HSMP_GET_FCLK_MCLK, hsmp_fclk_show, 0444, 4);
+HSMP_DEV_ATTR(fclk, HSMP_GET_FCLK_MCLK, hsmp_fclk_show, 0444, 5);
+HSMP_DEV_ATTR(fclk, HSMP_GET_FCLK_MCLK, hsmp_fclk_show, 0444, 6);
+HSMP_DEV_ATTR(fclk, HSMP_GET_FCLK_MCLK, hsmp_fclk_show, 0444, 7);
+
+HSMP_DEV_ATTR(mclk, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444, 0);
+HSMP_DEV_ATTR(mclk, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444, 1);
+HSMP_DEV_ATTR(mclk, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444, 2);
+HSMP_DEV_ATTR(mclk, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444, 3);
+HSMP_DEV_ATTR(mclk, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444, 4);
+HSMP_DEV_ATTR(mclk, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444, 5);
+HSMP_DEV_ATTR(mclk, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444, 6);
+HSMP_DEV_ATTR(mclk, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444, 7);
 
 HSMP_DEV_ATTR(clk_fmax, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmax_show, 0444, 0);
 HSMP_DEV_ATTR(clk_fmax, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmax_show, 0444, 1);
@@ -391,16 +391,16 @@ HSMP_DEV_ATTR_RW_X8(rail_iso_freq_policy, HSMP_CPU_RAIL_ISO_FREQ_POLICY,
 
 #define HSMP_DEV_ATTR_LIST(_name, _sock_ind)				       \
 static struct attribute _name[] = {					       \
-	&hattr_c0_residency_input##_sock_ind.dattr.attr,		       \
+	&hattr_c0_residency##_sock_ind.dattr.attr,		       \
 	&hattr_prochot_status##_sock_ind.dattr.attr,			       \
 	&hattr_smu_fw_version##_sock_ind.dattr.attr,			       \
 	&hattr_protocol_version##_sock_ind.dattr.attr,			       \
-	&hattr_cclk_freq_limit_input##_sock_ind.dattr.attr,		       \
+	&hattr_cclk_freq_limit##_sock_ind.dattr.attr,		       \
 	&hattr_ddr_max_bw##_sock_ind.dattr.attr,			       \
-	&hattr_ddr_utilised_bw_input##_sock_ind.dattr.attr,		       \
-	&hattr_ddr_utilised_bw_perc_input##_sock_ind.dattr.attr,	       \
-	&hattr_fclk_input##_sock_ind.dattr.attr,			       \
-	&hattr_mclk_input##_sock_ind.dattr.attr,			       \
+	&hattr_ddr_utilised_bw##_sock_ind.dattr.attr,		       \
+	&hattr_ddr_utilised_bw_perc##_sock_ind.dattr.attr,	       \
+	&hattr_fclk##_sock_ind.dattr.attr,			       \
+	&hattr_mclk##_sock_ind.dattr.attr,			       \
 	&hattr_clk_fmax##_sock_ind.dattr.attr,				       \
 	&hattr_clk_fmin##_sock_ind.dattr.attr,				       \
 	&hattr_pwr_current_active_freq_limit##_sock_ind.dattr.attr,	       \
-- 
2.34.1

