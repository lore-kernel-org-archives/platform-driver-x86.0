Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.4
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793604025;
	b=TTFIOeI65eeotTYg0pZ7BoWgTVs+Et3IgO19ZtyBuFFMwPRh/7rDUN6q56mZEnLUSDBF
	 OZnyFsnh5kQOxFETJg1sNKfXQeaFxzbVuxfj657QBpc4ChFVs6PGDdauXr5ncI1Ma5B+M
	 kyayhqVdYJuInP58biMS8tKBGOmcv0TGR3JYxzYl8ZfBaBLUeop9E5opq0JpZUO9dzW12
	 FeY7u0lWtgvurlCD+aIx75nuLnEFNPeMMHzI6Er5IiVuqv/Heyd4Ip78XmhjmeloESken
	 pIsG8XUgB4kHrOAXPsebtFTJVBmkmoP59maTveKhQOw0DgkhuOcMpz2fmyNVfUcY2kg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793604025;
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
	bh=THW6jJ/yLDRd1c6evD0Aufx+GU4oULqECYSRgshm9mc=;
	b=wPVfmRB9hfOU4f3rxYIml050Tr+OSpZEKM/IUirVTzw1/rfgaf8wwErQpFM09PJZMmDv
	 oxAbZKyZTdaEw3wzxd40ARG84yfcbt64upJWlRRoG3lSr+KFsTc+Ejxep6wdq4VpVClb1
	 dYVzneLY43M3bBUMsOA5BPHQP8bHNPRCe8U1M21eH1r6AknjBCWi/trLFTeySBacmtPlp
	 /yY3kC2SH+ZqJ3mhUUQOfcQ8d/HZHWEpo0yxfszrMv5BvH8QVAxxSdAQInbMHLpEUmPt9
	 UBGOXrvRCTOhAjGF7T84DRvvWIqxVw1qNORgGyFYB5/d3fTCXUIN9XKGiW5NOL3hTjg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=k+8WWhIe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.4
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011004.outbound.protection.outlook.com [52.101.57.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7374F606A329
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Nov 2026 07:20:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7374F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=k+8WWhIe
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w84IC6apKYhUJFNUgjU+CSOmvgiUA04/QidGVCFgeeTJTVsgWTSbW3mLJZrD8Rp+Rria1xSdyOeQvMgfSMdvqPbGdRvYSLOzgLW42QxWE7wKvX47+5Sy5R9Rg4CzbhFZxtd87vtXPg8f3tf4xpnt3J7nPAef5RDmzWlCmFiYOPhcqRVCEL03wCHJZe3nUa1zOzrEFR7PqDxdtjmVPEE1Oly+LNpUhzogrGDIFei0Qq6+Bm4PfZZI66tBrQV/bge+IkVmFWhBou88pMW/5n5Ix3emQ5hVRx6yWIftTDpAVsAvwI1n4NPuZXPa5M4zG20VYC0JLdWwUyH6/xlmCypcWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=THW6jJ/yLDRd1c6evD0Aufx+GU4oULqECYSRgshm9mc=;
 b=tor4XXI5jVzAspetzmJpgwJWBCC+whcU7S2C+G99wKeNEYGezNdRbgMZKkIdjbbU5xsn8bYFptwE4vDdYaKko1KqitX6NSB84dLcysuADvZPAxXo5rxOiu6r7DigeOqO72IWkWDFbVsId3seNwGhndO8JMp//IUe/hsXxmMqW/N7B1TIgb4r8Pw6qjruwMKbJd/1MDUJKY0BfKqBj3rtFApylrnSBYuhw5EnALi1NzNKS+hxc2yvgfGLKdJI0GoAcisZrpiGWqBFjAfmXWdEjbKQzG0Db4X4u1EHfw6dqXW88V3394aLa+X5awlprGub8RPgGRh5yiSHczcx96BeyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=THW6jJ/yLDRd1c6evD0Aufx+GU4oULqECYSRgshm9mc=;
 b=k+8WWhIeo3csn4Pp/q6ArNZtL5+4Hzcjfk1IpK5wpWTJ21szYCSJrmnqC4qbrAtyCBY8GsWTgYfxh6RZUx7eJ3t7EcDJXIna4fJFc+hNyyBGFJAi6KEu14RmzVLPiKecP8wR3CaysZxjbGqYb/N6h8fls+5pcSVrFKZet3cp16k=
Received: from MW3PR06CA0003.namprd06.prod.outlook.com (2603:10b6:303:2a::8)
 by DS0PR12MB6533.namprd12.prod.outlook.com (2603:10b6:8:c2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 07:20:17 +0000
Received: from SJ1PEPF000037A5.namprd04.prod.outlook.com
 (2603:10b6:303:2a:cafe::95) by MW3PR06CA0003.outlook.office365.com
 (2603:10b6:303:2a::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Mon, 2
 Nov 2026 07:20:17 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000037A5.mail.protection.outlook.com (10.167.244.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 07:20:16 +0000
Received: from trento15c5.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 2 Nov
 2026 01:20:14 -0600
From: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <Suma.Hegde@amd.com>,
	<NaveenKrishna.Chatradhi@amd.com>, Muthusamy Ramalingam
	<Muthusamy.Ramalingam@amd.com>
Subject: [PATCH 02/26] platform/x86/amd/hsmp: Rename clk_fmax and clk_fmin sysfs files
Date: Mon, 2 Nov 2026 07:19:00 +0000
Message-ID: <cca9c3cc5e1eee123b7ea1056b1ac0225bbbf494.1793602633.git.Muthusamy.Ramalingam@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A5:EE_|DS0PR12MB6533:EE_
X-MS-Office365-Filtering-Correlation-Id: eb4f9691-4cb6-4ecb-dece-08df38b1beb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|376014|36860700016|261021123027099003|261021121427099003|261009223027099003|261026121527099003|11063799006|10067099003|56012099006|260925021911599003|260925022911599003|260925021311599003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	tGWv81E0kVU+avKSN8eEJGckq+XXCZUQoJDbC8/DK/wsZLY5kXQOvehvK0Uw3/X160dnKrUPaIq8r9th0gXeTP0mTOfRYO9oA4tTpfSc+ibAJYIYlFBAvlXI9il/8q1Gz9EdcIUdOaSVJKCSmIaNLLUf93MHldIlO9DjVEHvU+hAdKyz/zNB0iD1qOHP5PDeNvxnTL3s7pJDu5QeahbObtnFjf4QI9EbyBPDv/3Z3Rx/pvT1PXMD8LKT52zKyN7R/uShN/WiKep9MrRb7PfzFU+mPmTf9UtsFroF8TuqOubq5pUe0pIJkM/2GjJ+BatsDO+3x+jvC0L6ys3aTYkXKFllBGn85xVFTFax/Po6ISu0vOcHradRJS24pmkE9NNKG7FPaLM+90jgWy7TFJMxFWS5uCTbrmgHWSGjpPtuYMG0nIKmkEWjzOcpeQzsbZ+8LUI8dUc4si1mZ5pW+sXDQGPgWKCivUzqEw6XitaNnfn5He+wpNyv7XAC7YbVdc90+AVkeM1WD+krErUBiaxguoqhLe195cMjwUIIILPOOpNe0mBoACni3pw4aLxSx7XB32CQmRYTLtXNbgiCbYBefKkajGLFMgtE3fzy7oUCNaXNsi7Pg2BrIBe8nRfoGFq1vEx1+zdlw2dJP3RcPYaruPVbcjp3MWCUkO4EU5hM12bL9F021o+IWHMMzOI419BC3t53UVju66KfJmNkk6ufgQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(376014)(36860700016)(261021123027099003)(261021121427099003)(261009223027099003)(261026121527099003)(11063799006)(10067099003)(56012099006)(260925021911599003)(260925022911599003)(260925021311599003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	EVmCmh5vJcZcJjqT8rVtKZcQCt7AQ70/wws3u/FOpWKWvC10wVtvEI38X0I3WIBlSAIvO50PrbxHV3v6d4vgJVlRvaDpnH3o1bozhw8l1P2Cz2B0rpUp49QI7R9e8HCL87XS254cCITzdrhloiV8AsNSXTHCC1TWRP4HgxHgCcKuKSa6Ed0dfNQBOTaMPXFfNs7nLSjvVS5F7pGrAGYUX7P+e4utJjSefNwr/AlRp0o3IQYlDNWKjMkf2VP2wNF6gpVv7ADK6VMEAr+ir6pACwcRiTnuLFcE1G13XJtYNyi4MBRA5DdsJAgIKu8PXc0LBP0VmilAhpWw3h0MZBiS3zyuA5yDth5nzZxfK+X2tM6EngUDq2oDTzwsZy2IpPeH2ReO+k0jUB2LwnjCC/a7+vV/ZPxrY+plWg0E+u2TdvAHl0mohHO6Vffx4KK0weI9
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 07:20:16.8575
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb4f9691-4cb6-4ecb-dece-08df38b1beb5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037A5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6533

These report the socket core-clock limits, so name them cclk_fmax and
cclk_fmin.

Co-developed-by: Suma Hegde <Suma.Hegde@amd.com>
Signed-off-by: Suma Hegde <Suma.Hegde@amd.com>
Signed-off-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
---
 Documentation/arch/x86/amd_hsmp.rst   |  4 +--
 drivers/platform/x86/amd/hsmp/acpi.c  |  8 +++---
 drivers/platform/x86/amd/hsmp/plat.c  | 38 +++++++++++++--------------
 drivers/platform/x86/amd/hsmp/sysfs.c |  8 +++---
 drivers/platform/x86/amd/hsmp/sysfs.h |  8 +++---
 5 files changed, 33 insertions(+), 33 deletions(-)

diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
index 6384935e7fe16..a1964c5f12023 100644
--- a/Documentation/arch/x86/amd_hsmp.rst
+++ b/Documentation/arch/x86/amd_hsmp.rst
@@ -107,8 +107,8 @@ write-only when the platform enables only that direction of the message.
 * ddr_utilised_bw_perc: Percentage of current utilized DDR bandwidth.
 * mclk: Memory clock in MHz.
 * fclk: Fabric clock in MHz.
-* clk_fmax: Maximum frequency of socket in MHz.
-* clk_fmin: Minimum frequency of socket in MHz.
+* cclk_fmax: Maximum frequency of socket in MHz.
+* cclk_fmin: Minimum frequency of socket in MHz.
 * cclk_freq_limit: Core clock frequency limit per socket in MHz.
 * pwr_current_active_freq_limit: Current active frequency limit of socket
   in MHz.
diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index d7a7c40e40ccf..a74fb274ee652 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -525,8 +525,8 @@ HSMP_DEV_ATTR(ddr_utilised_bw, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 04
 HSMP_DEV_ATTR(ddr_utilised_bw_perc, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_perc_show, 0444);
 HSMP_DEV_ATTR(fclk, HSMP_GET_FCLK_MCLK, hsmp_fclk_show, 0444);
 HSMP_DEV_ATTR(mclk, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444);
-HSMP_DEV_ATTR(clk_fmax, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmax_show, 0444);
-HSMP_DEV_ATTR(clk_fmin, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmin_show, 0444);
+HSMP_DEV_ATTR(cclk_fmax, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_cclk_fmax_show, 0444);
+HSMP_DEV_ATTR(cclk_fmin, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_cclk_fmin_show, 0444);
 HSMP_DEV_ATTR(pwr_current_active_freq_limit, HSMP_GET_SOCKET_FREQ_LIMIT,
 	      hsmp_freq_limit_show, 0444);
 HSMP_DEV_ATTR(pwr_current_active_freq_limit_source, HSMP_GET_SOCKET_FREQ_LIMIT,
@@ -562,8 +562,8 @@ static struct attribute *hsmp_dev_attr_list[] = {
 	&hattr_ddr_utilised_bw_perc.dattr.attr,
 	&hattr_fclk.dattr.attr,
 	&hattr_mclk.dattr.attr,
-	&hattr_clk_fmax.dattr.attr,
-	&hattr_clk_fmin.dattr.attr,
+	&hattr_cclk_fmax.dattr.attr,
+	&hattr_cclk_fmin.dattr.attr,
 	&hattr_pwr_current_active_freq_limit.dattr.attr,
 	&hattr_pwr_current_active_freq_limit_source.dattr.attr,
 	&hattr_socket_power_limit_max.dattr.attr,
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index c246a996e2d4c..49a0c01f6dd1b 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -313,23 +313,23 @@ HSMP_DEV_ATTR(mclk, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444, 5);
 HSMP_DEV_ATTR(mclk, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444, 6);
 HSMP_DEV_ATTR(mclk, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444, 7);
 
-HSMP_DEV_ATTR(clk_fmax, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmax_show, 0444, 0);
-HSMP_DEV_ATTR(clk_fmax, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmax_show, 0444, 1);
-HSMP_DEV_ATTR(clk_fmax, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmax_show, 0444, 2);
-HSMP_DEV_ATTR(clk_fmax, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmax_show, 0444, 3);
-HSMP_DEV_ATTR(clk_fmax, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmax_show, 0444, 4);
-HSMP_DEV_ATTR(clk_fmax, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmax_show, 0444, 5);
-HSMP_DEV_ATTR(clk_fmax, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmax_show, 0444, 6);
-HSMP_DEV_ATTR(clk_fmax, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmax_show, 0444, 7);
-
-HSMP_DEV_ATTR(clk_fmin, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmin_show, 0444, 0);
-HSMP_DEV_ATTR(clk_fmin, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmin_show, 0444, 1);
-HSMP_DEV_ATTR(clk_fmin, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmin_show, 0444, 2);
-HSMP_DEV_ATTR(clk_fmin, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmin_show, 0444, 3);
-HSMP_DEV_ATTR(clk_fmin, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmin_show, 0444, 4);
-HSMP_DEV_ATTR(clk_fmin, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmin_show, 0444, 5);
-HSMP_DEV_ATTR(clk_fmin, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmin_show, 0444, 6);
-HSMP_DEV_ATTR(clk_fmin, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmin_show, 0444, 7);
+HSMP_DEV_ATTR(cclk_fmax, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_cclk_fmax_show, 0444, 0);
+HSMP_DEV_ATTR(cclk_fmax, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_cclk_fmax_show, 0444, 1);
+HSMP_DEV_ATTR(cclk_fmax, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_cclk_fmax_show, 0444, 2);
+HSMP_DEV_ATTR(cclk_fmax, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_cclk_fmax_show, 0444, 3);
+HSMP_DEV_ATTR(cclk_fmax, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_cclk_fmax_show, 0444, 4);
+HSMP_DEV_ATTR(cclk_fmax, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_cclk_fmax_show, 0444, 5);
+HSMP_DEV_ATTR(cclk_fmax, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_cclk_fmax_show, 0444, 6);
+HSMP_DEV_ATTR(cclk_fmax, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_cclk_fmax_show, 0444, 7);
+
+HSMP_DEV_ATTR(cclk_fmin, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_cclk_fmin_show, 0444, 0);
+HSMP_DEV_ATTR(cclk_fmin, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_cclk_fmin_show, 0444, 1);
+HSMP_DEV_ATTR(cclk_fmin, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_cclk_fmin_show, 0444, 2);
+HSMP_DEV_ATTR(cclk_fmin, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_cclk_fmin_show, 0444, 3);
+HSMP_DEV_ATTR(cclk_fmin, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_cclk_fmin_show, 0444, 4);
+HSMP_DEV_ATTR(cclk_fmin, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_cclk_fmin_show, 0444, 5);
+HSMP_DEV_ATTR(cclk_fmin, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_cclk_fmin_show, 0444, 6);
+HSMP_DEV_ATTR(cclk_fmin, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_cclk_fmin_show, 0444, 7);
 
 HSMP_DEV_ATTR(pwr_current_active_freq_limit, HSMP_GET_SOCKET_FREQ_LIMIT,
 	      hsmp_freq_limit_show, 0444, 0);
@@ -401,8 +401,8 @@ static struct attribute _name[] = {					       \
 	&hattr_ddr_utilised_bw_perc##_sock_ind.dattr.attr,	       \
 	&hattr_fclk##_sock_ind.dattr.attr,			       \
 	&hattr_mclk##_sock_ind.dattr.attr,			       \
-	&hattr_clk_fmax##_sock_ind.dattr.attr,				       \
-	&hattr_clk_fmin##_sock_ind.dattr.attr,				       \
+	&hattr_cclk_fmax##_sock_ind.dattr.attr,				       \
+	&hattr_cclk_fmin##_sock_ind.dattr.attr,				       \
 	&hattr_pwr_current_active_freq_limit##_sock_ind.dattr.attr,	       \
 	&hattr_pwr_current_active_freq_limit_source##_sock_ind.dattr.attr,     \
 	&hattr_socket_power_limit_max##_sock_ind.dattr.attr,		       \
diff --git a/drivers/platform/x86/amd/hsmp/sysfs.c b/drivers/platform/x86/amd/hsmp/sysfs.c
index ac2ae9f2774a8..1f6448380214a 100644
--- a/drivers/platform/x86/amd/hsmp/sysfs.c
+++ b/drivers/platform/x86/amd/hsmp/sysfs.c
@@ -155,8 +155,8 @@ ssize_t hsmp_mclk_show(struct device *dev, struct device_attribute *attr,
 	return sysfs_emit(buf, "%u\n", data[1]);
 }
 
-ssize_t hsmp_clk_fmax_show(struct device *dev, struct device_attribute *attr,
-			   char *buf)
+ssize_t hsmp_cclk_fmax_show(struct device *dev, struct device_attribute *attr,
+			    char *buf)
 {
 	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
 	u32 data;
@@ -169,8 +169,8 @@ ssize_t hsmp_clk_fmax_show(struct device *dev, struct device_attribute *attr,
 	return sysfs_emit(buf, "%lu\n", FIELD_GET(FMAX_MASK, data));
 }
 
-ssize_t hsmp_clk_fmin_show(struct device *dev, struct device_attribute *attr,
-			   char *buf)
+ssize_t hsmp_cclk_fmin_show(struct device *dev, struct device_attribute *attr,
+			    char *buf)
 {
 	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
 	u32 data;
diff --git a/drivers/platform/x86/amd/hsmp/sysfs.h b/drivers/platform/x86/amd/hsmp/sysfs.h
index d25225c3160ce..9381498420f5a 100644
--- a/drivers/platform/x86/amd/hsmp/sysfs.h
+++ b/drivers/platform/x86/amd/hsmp/sysfs.h
@@ -66,10 +66,10 @@ ssize_t hsmp_fclk_show(struct device *dev, struct device_attribute *attr,
 		       char *buf);
 ssize_t hsmp_mclk_show(struct device *dev, struct device_attribute *attr,
 		       char *buf);
-ssize_t hsmp_clk_fmax_show(struct device *dev, struct device_attribute *attr,
-			   char *buf);
-ssize_t hsmp_clk_fmin_show(struct device *dev, struct device_attribute *attr,
-			   char *buf);
+ssize_t hsmp_cclk_fmax_show(struct device *dev, struct device_attribute *attr,
+			    char *buf);
+ssize_t hsmp_cclk_fmin_show(struct device *dev, struct device_attribute *attr,
+			    char *buf);
 ssize_t hsmp_freq_limit_show(struct device *dev, struct device_attribute *attr,
 			     char *buf);
 ssize_t hsmp_freq_limit_source_show(struct device *dev, struct device_attribute *attr,
-- 
2.34.1

