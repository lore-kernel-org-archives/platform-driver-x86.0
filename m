Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.39
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793604064;
	b=0HvoNkfJqRU3+1cyQwBz2gRMWWHr/NicMF92M760S08IoaJgTK8CLDhfxapSxtZnzbch
	 Iy9Wr0pRO511ORV8kZAW2Hhjj/vgr3I31fo7oF8j6WK0dOsYd1tmo7901zrqERZgcB2uD
	 PXymH2VR5Mo5/N7BXDyX4hIMNjEhCeLMI3TJ09AnZLFjeM+jeSpLFMGQAUszOAOitNeJk
	 y168JvHqDbNwMVYKB6Su802ZCcDpaXc+1eKTJaXt3yyGSNnDLm/qOPOMmsNq0HqZd/LGa
	 K0nf1YrqKMbJ8qQo6RevurAI3gxHF2ioU+C+TrObrRluEtk5+dGgTDT6q1xroxKTkpQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793604064;
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
	bh=nH+iLO6wiBMMMzMX9Y/NxHvc8hZVaJRq3Am/lxWbJL8=;
	b=0aT28m8MdWV5ShiPjz3UgeeW3vcFToXwFFGwX8mlcZX6euSbK7ZM60PhScqU4uZ4Ndet
	 Jz8oQDi3Xx2AvKfUAqmPqv3vkSpgzbGnwkQfCDYm2H2GNtNRVSKHF0p1eKBi2LadPyL+Y
	 Nuf4EEH8SHrIiio+M/pDTFJWE23X9a7CY267W9Zs8K48BMIvhtVgKwgythBnMMkAqFx80
	 shVPpjJlmTkoI0iEDF1NyN075Chmwp9sVQapP7Ic/4wiTKVzdPgSzarcHnqDm6COoqU/k
	 Fkp11BVJF/HoB/XR2YnMfjKaxwOmfwUTrOuK2dXGSGuYrz2i1LxPKpUq+y3B0GHZiqA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=WETFRqcd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.39
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010039.outbound.protection.outlook.com [52.101.201.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09752606A326
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Nov 2026 07:21:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09752606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=WETFRqcd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pPhSZZl4InlrR//YS/wMgLJ5VNLat40/KGauaP1xJXUZVQwxlg2GKtGhQO4pXCUPOofkM2j2CGhZtufkLZBup+ct1GAmmw/i50ZDrHGHzPxEygu6MdOl6+byEMRECml4CK2/zTHfUWImnCUqdmm0YgR/NqXWvg/nMoKcy56+uSt/lHTLkwwuy2fm6IBoRVP1HnltXY2rPVy3c/gISMNr8s9NFjNN4MNxWoUNvsTpYg/+6rvi/J+qoV1jww4fRoXnEVG0koVP7sb/J2MRMfR82P6+6mbvZK0Mt9u3hRDNyIUmDAL7IiCKQMtQN159iSmcIPXrHvYYcyEMtVgaRQ2EPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nH+iLO6wiBMMMzMX9Y/NxHvc8hZVaJRq3Am/lxWbJL8=;
 b=aKuSNi/8GNCeUHmDze5fnzwa0xmuDFs31WNowjL/IlDHYrb2Lmh8QazhT4qZVNcbV5RcvBXfJIUUgHKSUBDpymPu2GYcicO7pnd9GG7W6F+CF2tISfF1P2w1RRpLYK/Sx6McfnpxaD5loDOCXFHKzq0rO7qZxiU76oFWMrRRN43kxsKNmY3g7+eedu49cPbQ2BDgFKW9LWuL8pu/CT8D+iHaGTc0M01FeDq19opQz3wlf1SRIBCu3oeUjfAloe+7k5KumSJNS4yfSvbgAztjWJHFPFvKZLuiOQLD7S3Epk7IFtp4wcQ5AoqYN/0tRaZ1HwKSorTEsmgU38mc8Zb/VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nH+iLO6wiBMMMzMX9Y/NxHvc8hZVaJRq3Am/lxWbJL8=;
 b=WETFRqcdHPOZADcyuai7KsHJiBqfz49xW/Ykv1UQF7TB3twq7KR94igpjcFbSdG9xYxoy3sv7rd8oHVCYTGBSAYhqBYj8fq74OQYRDAF/m5JxhbrTtzROzTi8ZH62KK9XaHlwUbwvF7EqaKfdSQLNL6Gcr1aBThz/r9E8SsN6tA=
Received: from SJ0PR05CA0171.namprd05.prod.outlook.com (2603:10b6:a03:339::26)
 by DM4PR12MB6399.namprd12.prod.outlook.com (2603:10b6:8:b7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 07:21:00 +0000
Received: from SJ1PEPF000037A7.namprd04.prod.outlook.com
 (2603:10b6:a03:339:cafe::8f) by SJ0PR05CA0171.outlook.office365.com
 (2603:10b6:a03:339::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.4 via Frontend Transport; Mon, 2
 Nov 2026 07:21:00 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000037A7.mail.protection.outlook.com (10.167.244.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 07:21:00 +0000
Received: from trento15c5.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 2 Nov
 2026 01:20:58 -0600
From: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <Suma.Hegde@amd.com>,
	<NaveenKrishna.Chatradhi@amd.com>, Muthusamy Ramalingam
	<Muthusamy.Ramalingam@amd.com>
Subject: [PATCH 23/26] platform/x86/amd/hsmp: Add svi_power sysfs file
Date: Mon, 2 Nov 2026 07:19:21 +0000
Message-ID: <7bc9755aef70a44d00695a9ced2d4821462d135c.1793602634.git.Muthusamy.Ramalingam@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A7:EE_|DM4PR12MB6399:EE_
X-MS-Office365-Filtering-Correlation-Id: 860710f4-0df6-4c07-4020-08df38b1d8b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|23010399003|6133799003|22082099003|18002099003|10067099003|56012099006|3023799007|261009223027099003|261022105027099003|261021135927099003|261021123027099003|261021121427099003|11063799006|261028144727099003|261026121527099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	x0nnrw0u/fbiB1vC+VGUdaXT0Tv4AuYamw0Z6Jo9aUuWU4jzsDQ82knhzTwOtd1QG3/BdwgeUuOXnAiaUrVF0rTNYcvbA2EXyXiGYftZWg9gQ0ve3uOou02mI5UXs/ROMhxPrpB2QzRjJNlKBo2xtd67E6L9nlQwCTlq/R68PyTBUl7Z/bN6CGzAVT70gRn9XxupwyHMxNEMKuIvf+MN9zmVCAtTLh1B7+6cuERA4XCaWFXfMTJC7n0b7zW4ZU6+IQOyrxUh24A8Ktnvf4TbVYI8h37lTNO3y77mIq+FjQ+L3JarAgnexRovjbM/IEL7XeB6ualyRQidsuE4fnXADTftalNS558OKV4OA8EnwHzEYUR4yEa9BtktT5OiZVBqk09NqcpMi4DosYTzQ2p99+6tmzB6Z2+POpS6tHEGQfaZ4eingNzoET0l+VnB9gvUQWXCo0eC17L5XKxDGt4tjXL7QbuhL2z5h/31LH0h6PbY4Yf4pM2TtZ8C4EvY7UE2TiJKp4iQHsr4hes0CxG83vxq2BhbWJNtqZlCEzy8ik1wLEEm2XVL4M+mgLa/2XCHPsM6SrywYMXe6GX2FzJhFfLKo7+mDGPNmUndUtv2W5JShJZjrH7DrIfgaZJLei8HqO25cXWCDUMTtaSVoK5ZmhOG3lxykLHd8jdEpKW87MkVDJZNGveWHJqcfYY4mlRDA1H6Ayba9fzBALuNhdX2ew==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(23010399003)(6133799003)(22082099003)(18002099003)(10067099003)(56012099006)(3023799007)(261009223027099003)(261022105027099003)(261021135927099003)(261021123027099003)(261021121427099003)(11063799006)(261028144727099003)(261026121527099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xSwJmwKaU/fwPdg3f6crRqjW4SOXU8/WY+iEERqGxgrMSSl2LqSDif5L985AKugv8E/nQOkKwYeXsPALjzhXIC+KodlSIkzAYyeF0hI0zxf8ANeIUdhpMKQzTBvbl6hclwMR7G/izmcrKbVDI9JekCNz9SWP4TLmXzjAvYfq/p0+4F4k8e4b0KnIHYsWyBxKCEnNzVI/+6MAD3TyHFfvwVY1kV9Di5b2bKcoA5c7c1e9E21XhosoegzmEfphVLtHIfh67qt6dijF2SCy114PswJisE5Li1D9GWPPO/2ikT741PasVzRAnMvVoMUf/r51q8blCxd9PIQfnvz0E7o0uKC3ebSqP+nYxvxt9v9jgFyhtfTQU8os8aUv7lPTG5hAzK7QoNzIrNFV45GILRwbxb/gPgyYZw2lrN8QIWKDjZ7/Y4Ccg9WWZeTcEB+bPXUE
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 07:21:00.4540
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 860710f4-0df6-4c07-4020-08df38b1d8b2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037A7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6399

Expose HSMP_GET_RAILS_SVI as a read-only socket file on both the ACPI
and platform drivers. It reports SVI-based power telemetry for all
rails in milliwatts via hsmp_msg_resp32_show. Supported on HSMP
protocol versions 5 and 7.

Co-developed-by: Suma Hegde <Suma.Hegde@amd.com>
Signed-off-by: Suma Hegde <Suma.Hegde@amd.com>
Signed-off-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
---
 Documentation/arch/x86/amd_hsmp.rst  | 2 ++
 drivers/platform/x86/amd/hsmp/acpi.c | 2 ++
 drivers/platform/x86/amd/hsmp/plat.c | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
index ef83970492b6b..6ff2c154e9958 100644
--- a/Documentation/arch/x86/amd_hsmp.rst
+++ b/Documentation/arch/x86/amd_hsmp.rst
@@ -202,6 +202,8 @@ write-only when the platform enables only that direction of the message.
   Venice, modes 4/5 take "<mode> <ppt_W> <util%>" when the protocol is
   below 7.1, or "<mode> <ppt_W> <low%> <high%>" for protocol 7.1 and
   later.
+* svi_power: SVI-based power telemetry for all rails, in milliwatts (read
+  only). Supported on HSMP protocol versions 5 and 7.
 * tdelta: Socket thermal behaviour (read only).
 * apb_disable: Read/write. 1 disables APB, 0 enables it.
 * dfc_enable: Read/write DF C-state enable. 1 enables, 0 disables.
diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index e030f3c80721b..bb46676b1f6fa 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -546,6 +546,7 @@ HSMP_DEV_ATTR(pwr_current_active_freq_limit_source, HSMP_GET_SOCKET_FREQ_LIMIT,
 	      hsmp_freq_limit_source_show, 0444);
 HSMP_DEV_ATTR(socket_power, HSMP_GET_SOCKET_POWER, hsmp_msg_resp32_show, 0444);
 HSMP_DEV_ATTR(socket_power_limit_max, HSMP_GET_SOCKET_POWER_LIMIT_MAX, hsmp_msg_resp32_show, 0444);
+HSMP_DEV_ATTR(svi_power, HSMP_GET_RAILS_SVI, hsmp_msg_resp32_show, 0444);
 HSMP_DEV_ATTR(tdelta, HSMP_READ_TDELTA, hsmp_msg_resp32_show, 0444);
 HSMP_DEV_ATTR_RW(socket_power_limit, HSMP_GET_SOCKET_POWER_LIMIT,
 		 HSMP_SET_SOCKET_POWER_LIMIT,
@@ -842,6 +843,7 @@ static struct attribute *hsmp_dev_attr_list[] = {
 	&hattr_cclk_boost_limit.dattr.attr,
 	&hattr_cclk_floor_limit.dattr.attr,
 	&hattr_powereff_mode.dattr.attr,
+	&hattr_svi_power.dattr.attr,
 	&hattr_tdelta.dattr.attr,
 	&hattr_apb_disable.dattr.attr,
 	&hattr_cc6_enable.dattr.attr,
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index f1ab7f25a29c1..54806c0f759c1 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -380,6 +380,7 @@ HSMP_DEV_ATTR(pwr_current_active_freq_limit_source, HSMP_GET_SOCKET_FREQ_LIMIT,
 
 HSMP_DEV_ATTR_X8(socket_power_limit_max, HSMP_GET_SOCKET_POWER_LIMIT_MAX,
 		 hsmp_msg_resp32_show, 0444);
+HSMP_DEV_ATTR_X8(svi_power, HSMP_GET_RAILS_SVI, hsmp_msg_resp32_show, 0444);
 HSMP_DEV_ATTR_RW_X8(socket_power_limit, HSMP_GET_SOCKET_POWER_LIMIT,
 		    HSMP_SET_SOCKET_POWER_LIMIT,
 		    hsmp_socket_power_limit_show,
@@ -1917,6 +1918,7 @@ static struct attribute _name[] = {					       \
 	&hattr_cclk_boost_limit##_sock_ind.dattr.attr,		       \
 	&hattr_cclk_floor_limit##_sock_ind.dattr.attr,		       \
 	&hattr_powereff_mode##_sock_ind.dattr.attr,			       \
+	&hattr_svi_power##_sock_ind.dattr.attr,			       \
 	&hattr_tdelta##_sock_ind.dattr.attr,				       \
 	&hattr_apb_disable##_sock_ind.dattr.attr,			       \
 	&hattr_cc6_enable##_sock_ind.dattr.attr,			       \
-- 
2.34.1

