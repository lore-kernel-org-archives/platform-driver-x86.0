Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.22
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793604048;
	b=p4b/6tNbToSHrRvi6PMhTj7cL8u7BRrXRQCgPN0+mZRtqOeGbUsICHAdOX3RnVrvdu8/
	 NXBl5JsPyDkKzIjxGHAA22EVoCbvtHZDDZX7CVIgUx9CS89/Ck0pCZuT1ojLkVTaeEOUf
	 r2CakvD39s96rUqpO6U72AipcOWkzcNt8/S/wsW2pApALBgVdvnQA8wFh1euJg1Vdvgu2
	 og6CTTH5VplAzFrNEpSVjBkYa9BQ+z8vHT/81lEfm5/dAVN1lcf9d6ntfY4lTdhDXuf8Q
	 xjbekGCVKqLCfYFIdYMGbVHArJblqtnLXh4qCkjqaSGA5yinWQsFIW7u8Qn36+4v6PQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793604048;
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
	bh=ENx+bV4SZ1fp5c3b2Ms/sGv5XFziEtFCf2yKPhsO3EQ=;
	b=RAakb0GvoPvE8VZBSvR6ETF2jSx8cbSOsPeRQSTu8gG8GOvoMWwqIWUZf9lLuzcvklUl
	 SUEu+W9O2ezPAOx+bPnp01SuPGiokxLQEmBTEYZM5e7bRMDef6XD5WRqc+pvSTrAJpWAS
	 jEPhX37LJ80R763XqEVakqprQk8tE8jPJmXonoNnPG/TmAlW6yXN47YzJC0IxTd0hQTQX
	 56CETT1I5JLioFTGenDbMD6tPR0SrC3cHkXhvqfU9zGtRLSMEoVAFw54XRC3sMdlzPMIf
	 menb1zTH7xM26gSmCT+AymQwVmvsUMb18sZFtaQmQfN4Av2SRAkPgN+4PkUqhO8W+OQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=pun51fmg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.22
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013022.outbound.protection.outlook.com [40.93.201.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E2A606A326
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Nov 2026 07:20:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9E2A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=pun51fmg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tKRFme/0U+JX/LbLfjZS/wD4v3BPGl/o0/RdS7leSaIMyMvxe3WqOtWXM/xkP6gLr+gKrImCaW1RcRijmvX3gBXG+vVk9mnxLUxs2fdTDDzqrIRKarUQCfCrYXOIt9I6KYdNMiPCveNCkIIs5IRaH59+Zbx3XFB+HVZB2/RmMgJcOVSf8RkXWbEp/d2ufdOo0qziw6l05CK32T4iS7aKca/GPSx7u5uhTf8CK1HeRt3sieId3qcPS+EFtUGbS7rDvJcCGWM6WEl0WrMBWXy/pCo3U43EwoVLisazrakKPb++8SMOlk3HQ4THA9lnRGAW+pJqYQnI5N3GaT6yaXMuKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ENx+bV4SZ1fp5c3b2Ms/sGv5XFziEtFCf2yKPhsO3EQ=;
 b=XnPe7/gznVg94o/YgCf4DHWKePYVhxrZHGHla0XNbx2DYOYtHTSd8lM0dknYT7cIXQS5AQo7avHi1A3VWOdbgXHY/dwG9TCAsYiXUtZ/GN/kQHF43YaH3NlIeZY3LCJReIyA+6kOFNSyEDUlR3CZUL4Euupxvc2egRZfC+qBPFmViBQNI5Iyi457w33STMm5IQDdmXeSy4rxkWsyjkaxA7Sy7oH2nLGkpiE0SFHQC2sdM33mmYSmenVtwrsxCUJVgZTwEhsAo1PX6QALdJJEXHVcUrBm0JyghF8a6DG1QC4UeOn0fLYJZfq6CdH33O//ZMDQ8KVQPTgVO0xKcd65NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ENx+bV4SZ1fp5c3b2Ms/sGv5XFziEtFCf2yKPhsO3EQ=;
 b=pun51fmgkvINbg+F+IXFSh+Ju7IZKKPGDNKNV1hyHJdhE1OMM1oFUX+F2nISAvWQQtIlEWrlfbffNPONxqBaqu4pCuAoOssgZgRd3ql/xtO2iBzO9Bk5EaE/79rmTAwi44LMA9+RkEFOfGagSXAe56E8R6hx/js4zuuOPbHU1pE=
Received: from MW3PR06CA0022.namprd06.prod.outlook.com (2603:10b6:303:2a::27)
 by SN7PR12MB7155.namprd12.prod.outlook.com (2603:10b6:806:2a6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 2 Nov
 2026 07:20:44 +0000
Received: from SJ1PEPF000037A5.namprd04.prod.outlook.com
 (2603:10b6:303:2a:cafe::68) by MW3PR06CA0022.outlook.office365.com
 (2603:10b6:303:2a::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Mon, 2
 Nov 2026 07:20:44 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000037A5.mail.protection.outlook.com (10.167.244.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 07:20:44 +0000
Received: from trento15c5.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 2 Nov
 2026 01:20:41 -0600
From: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <Suma.Hegde@amd.com>,
	<NaveenKrishna.Chatradhi@amd.com>, Muthusamy Ramalingam
	<Muthusamy.Ramalingam@amd.com>
Subject: [PATCH 15/26] platform/x86/amd/hsmp: Add metric_version sysfs file
Date: Mon, 2 Nov 2026 07:19:13 +0000
Message-ID: <a35ebfa3c36c5fcc7b6dea657e594021e52ec2c3.1793602633.git.Muthusamy.Ramalingam@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A5:EE_|SN7PR12MB7155:EE_
X-MS-Office365-Filtering-Correlation-Id: 765a14f5-df34-4ff7-6b6f-08df38b1cf1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|23010399003|376014|11063799006|56012099006|261026121527099003|261009223027099003|261021121427099003|10067099003|3023799007|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	IJoNYxMDnKI16NrEVXWcR/G0aMQId4H7JZnUlfdTkaypgijZ2W0Kt5L+wn0xvirCffa0Erd2Lqs/Rgaje8xdejQnKpjflsXokf4eyjYxU0i5RVwJakcDge56nvvFBVJruZ5kMDDcuAhJygsgCMyWcK9zrpptUEmOg+k/PqadZqW6uoJqgwUmgBwE9O42t7WOSPPNt8jSt2InzlkYj0dTokAJH+GYCOvIxxbsZ39e9O0nRde56m5bebEDjb/3AF2d/ZH3sN50z6nl/c9CxP2q3XDaKA0ce1lRUtPjx57RBWlaY62wucQUgrJ/kTzCaK5N+eEQhAwpI6wPse+f3/Xf9WnWea0Q2RhjRAPju4EPl1rO2thtBkOl4sCV8arb/lKBj2mSWyfhKBG1mUdJp6n3NMnxEHh2y5+lT8R/lTmkNnBWQrK91klrTkR3kZNTeUtKqkMar6/vPcowc2dzg7xKWbVCo9krbushU1OgejKP2V8y3iA8s+QWnHKtaJ445ipuIQ/Ws04RLGl+hdya7fU5UTDzz9qBKObiCz3B/kDgKB6SzliScXFRwsumF/QHU7ea//3pKN/UnZaD+WwXwTO7Bz8/LUS5lklUrub1m/WO52sY63rkYAHmAG2h5okSdite1NYTMRhZHeb07ztj4DCe/AN4hxEgK/4KvuauKS+XBiZStaMGk9x4L7jpnXgzpJOC8bkBLSse9AdnA1DzEmpNlg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(23010399003)(376014)(11063799006)(56012099006)(261026121527099003)(261009223027099003)(261021121427099003)(10067099003)(3023799007)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	isiiJCWHLEa44jFRQHs8tjO+NjKDDL+b8QDKkNuVewXF5ml5Xk2C2JLkiU4O472v3vXLuiNOimhFnCH1iHOgIgs0xRH9wcYtqepBct9dDbVE9AW81WxrOJkGjCJPXUNDuPxncrWk//ekOC/kwHSZ73rx+bsUHe9YSni3OXjnoPOqgwS3p+gJNSk+p4S2ZIvr7kiICXqNmTDdTqcULX+hwDNPn8/doZP6l6OWLwY6XqBUvHMfw5zYUhLgvpG5ZeIQYCcANwgS1WcAIuMRhsVE8TUU1TQ08+UA5+o3vVTPjotxXm6vief2qO/b2aWaHOxPSY8sjnCHM95LBWwZD3XSbmWM8F6Lf+bmPV2X8tEOge1b6HAwLgCnoGwIkqw7Scfvvqj1ph99WX4u4t09Qj3cA4Z3e4Tn9vPf0OjNe3u0mHrvAsspFMoyp1Ek+fDixIRm
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 07:20:44.3794
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 765a14f5-df34-4ff7-6b6f-08df38b1cf1d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037A5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7155

Expose a read-only metric_version file on both drivers. It reports the
metrics table version from HSMP_GET_METRIC_TABLE_VER as eight hexadecimal
digits.

Co-developed-by: Suma Hegde <Suma.Hegde@amd.com>
Signed-off-by: Suma Hegde <Suma.Hegde@amd.com>
Signed-off-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
---
 Documentation/arch/x86/amd_hsmp.rst  | 1 +
 drivers/platform/x86/amd/hsmp/acpi.c | 2 ++
 drivers/platform/x86/amd/hsmp/plat.c | 4 ++++
 3 files changed, 7 insertions(+)

diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
index 3cbc4bee058ec..b298906a32970 100644
--- a/Documentation/arch/x86/amd_hsmp.rst
+++ b/Documentation/arch/x86/amd_hsmp.rst
@@ -102,6 +102,7 @@ write-only when the platform enables only that direction of the message.
   0 otherwise.
 * smu_fw_version: SMU firmware version.
 * protocol_version: HSMP interface version, as eight hexadecimal digits.
+* metric_version: Metrics table version, as eight hexadecimal digits.
 * ddr_max_bw: Theoretical maximum DDR bandwidth in GB/s.
 * ddr_utilised_bw: Current utilized DDR bandwidth in GB/s.
 * ddr_utilised_bw_perc: Percentage of current utilized DDR bandwidth.
diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index f2bd4d5369df5..6ce8b138277a0 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -526,6 +526,7 @@ HSMP_DEV_ATTR(c0_residency, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444);
 HSMP_DEV_ATTR(prochot_status, HSMP_GET_PROC_HOT, hsmp_msg_resp32_show, 0444);
 HSMP_DEV_ATTR(smu_fw_version, HSMP_GET_SMU_VER, hsmp_msg_fw_ver_show, 0444);
 HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_hex_show, 0444);
+HSMP_DEV_ATTR(metric_version, HSMP_GET_METRIC_TABLE_VER, hsmp_msg_resp32_hex_show, 0444);
 HSMP_DEV_ATTR(cclk_freq_limit, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444);
 HSMP_DEV_ATTR(ddr_max_bw, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_max_bw_show, 0444);
 HSMP_DEV_ATTR(ddr_utilised_bw, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444);
@@ -663,6 +664,7 @@ static struct attribute *hsmp_dev_attr_list[] = {
 	&hattr_prochot_status.dattr.attr,
 	&hattr_smu_fw_version.dattr.attr,
 	&hattr_protocol_version.dattr.attr,
+	&hattr_metric_version.dattr.attr,
 	&hattr_cclk_freq_limit.dattr.attr,
 	&hattr_ddr_max_bw.dattr.attr,
 	&hattr_ddr_utilised_bw.dattr.attr,
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index 46676d9f90633..bb3c0791362ef 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -247,6 +247,9 @@ HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_hex_show, 04
 HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_hex_show, 0444, 6);
 HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_hex_show, 0444, 7);
 
+HSMP_DEV_ATTR_X8(metric_version, HSMP_GET_METRIC_TABLE_VER,
+		 hsmp_msg_resp32_hex_show, 0444);
+
 HSMP_DEV_ATTR(prochot_status, HSMP_GET_PROC_HOT, hsmp_msg_resp32_show, 0444, 0);
 HSMP_DEV_ATTR(prochot_status, HSMP_GET_PROC_HOT, hsmp_msg_resp32_show, 0444, 1);
 HSMP_DEV_ATTR(prochot_status, HSMP_GET_PROC_HOT, hsmp_msg_resp32_show, 0444, 2);
@@ -894,6 +897,7 @@ static struct attribute _name[] = {					       \
 	&hattr_prochot_status##_sock_ind.dattr.attr,			       \
 	&hattr_smu_fw_version##_sock_ind.dattr.attr,			       \
 	&hattr_protocol_version##_sock_ind.dattr.attr,			       \
+	&hattr_metric_version##_sock_ind.dattr.attr,			       \
 	&hattr_cclk_freq_limit##_sock_ind.dattr.attr,		       \
 	&hattr_ddr_max_bw##_sock_ind.dattr.attr,			       \
 	&hattr_ddr_utilised_bw##_sock_ind.dattr.attr,		       \
-- 
2.34.1

