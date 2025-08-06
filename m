Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2051.outbound.protection.outlook.com [40.107.244.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36C71FF1D1
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 Aug 2025 06:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754462319; cv=fail; b=C6LmxKLxCwDWM5V3SW02OYtYP/M90sC5CQbjB1myLyYvjCgRLTGtnwRgxsMjnAo60Mzi8qvP5DqO7wNwQLSS5WSbIP7hH7OW0sCuC3qEELIgd7XZqjCuUzrTU40544rYLNwgTKorYEBOT9LLkWziNSZ32lEob9eZeH1iiiTlaUU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754462319; c=relaxed/simple;
	bh=tHYnXVygg3l9sFiNqu3Z/v4qHwgV5UFXupYnKRoWGes=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l0KPTYSo7sHwFwUWDptP29BRmQFENDyyCHIbleijMDEBCxvL7W3xDv2f4KP/yK1aojiI+wYIr2UlHQwtRtFcubcaF6OQ016kclp12lEvUMCvtNsgjBYqsZ237VjYTXYZQMgfzkO+E+BA8qmem99UgyHXM/gWz0TOkRL5O5wwc9U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Ha1OVccp; arc=fail smtp.client-ip=40.107.244.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Ha1OVccp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CJWIMvi17m0asFErzdFb9XSl8MIISAc+btpJCgp3/DllJZG1IVCAXug/euevZT8t1775VntGCiOhMKeVz2rKPFDHFtkEq0SnQ9U+p43HsEab10M2ybkepc178fcypFt3RZ7MIH9CwL2eEwivi9knt9KrPBY36ZJ51WmGl4QfmUfascmdLbjC/gJR+ciV9M6f/QTIWz+rUgyW8D/QcicY31OSmYeGdy2mrHdqMkgevZv98wcUMvXyfr6hR0q+XxTl9N+iQIcKmbsULdKEKRVdhWL3Dtt+7tPKeZTIBa0xC+/tNA7kx4yGYw0sH8zH9scYat6D13/mnIGrGS3rwtilVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q8Wd+zSdUSzEPPVTDhxftk00uotfre4/j988O5fzuO4=;
 b=aqNIZlbbz4oFx6+FwGs7Ec0sg3wApdBRvxYkyMfK5/vKI8W3T7LVNBUqM642R1EQEH/H3yK2T6hgDsoNRw/VIZ+le0tKHRpHjD5K4V/POygmEqWBjhya0u6XJvuQV8t/2DDNV6TGF6ZwnL7hgXiMq2z4oNMXybimLPNAD6c2eu0WYbGLFFAUwFdAAqhNXujT11AlbmP3x1VdZHr7tp/Zp8FPf4hvtaRAD8UhXp1XzWbWYLN9vRS6ZBIzn0jPqDkYTkIcnFe9t3hCX0YLDCFMuUtbW9dx51OS/NuARYGTWVh1AD58wtcHYFBIn+j5eGbzgzXUNnSpSUEEXPbrR2zjBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q8Wd+zSdUSzEPPVTDhxftk00uotfre4/j988O5fzuO4=;
 b=Ha1OVccpmFP4dr7E2WzkhwVgqL4hbXSswKK4/TuNl+/23K8C6ZF9K/eXxM9kCdS76XGzO686ZFs9XoUmzf+jmUY5TRqP62V14T4svlQME0AV4Fo7l+EVkOUAP0ZrpmpCFBH4//nAKqmQ8Ljm40vFJlTXYakNhoq5iB4Xn7vIXzU=
Received: from BN0PR04CA0171.namprd04.prod.outlook.com (2603:10b6:408:eb::26)
 by BN7PPFD91879A44.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6e5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.19; Wed, 6 Aug
 2025 06:38:35 +0000
Received: from BN2PEPF0000449E.namprd02.prod.outlook.com
 (2603:10b6:408:eb:cafe::96) by BN0PR04CA0171.outlook.office365.com
 (2603:10b6:408:eb::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.18 via Frontend Transport; Wed,
 6 Aug 2025 06:38:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF0000449E.mail.protection.outlook.com (10.167.243.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Wed, 6 Aug 2025 06:38:35 +0000
Received: from trento15c5.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 6 Aug
 2025 01:38:33 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [PATCH 1/2] platform/x86/amd/hsmp: Rename the HSMP_BIN_ATTR_GRP macro
Date: Wed, 6 Aug 2025 06:38:03 +0000
Message-ID: <20250806063804.693481-2-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250806063804.693481-1-suma.hegde@amd.com>
References: <20250806063804.693481-1-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449E:EE_|BN7PPFD91879A44:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f877485-3940-4c64-e3e0-08ddd4b3de83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?X/0V0gvb8gXivHfq1QL2BT7KtOhV3UpO/ctybu0inpzAwnWBXMCBKqP1AlMp?=
 =?us-ascii?Q?Jn+8nFnwCI7b6gGShwuU8P2ejfFiyT01ERe+lgsAPnGzysuGA+bUQ2S0H0Qk?=
 =?us-ascii?Q?eRcM06SryIGV6YVFEHFpUgtJBVKDJqW7QpukvvE/UXI7y4q5Gw9Fptz8YONB?=
 =?us-ascii?Q?17wRPcnWcigFwYmYl3w17WdEk6a3u1C/vgED+1liyA3ix/YpDUjEaR3XAR9m?=
 =?us-ascii?Q?VTGYHuKKOBRXHGve1n8YiefPpIRS7V5gsMLdWxgck+DiFC4oTlOwqfl0z3Qg?=
 =?us-ascii?Q?EZlQziF5wpxXZVZ5PjG68rwbn1ghDEgV+xV0wuaPTylq/anNB02HRS1l682A?=
 =?us-ascii?Q?xjYf1RYETq1Mn7/fsb1C07NKD+Vi/qc55BZo3XObnbP9JZsFU7gFqHCQ6FeT?=
 =?us-ascii?Q?LI0Le/UPGv/NyZ6hy0AOPq5G6zQxlFVi7M2qVQD93F5YhvbuS4tix7Q8Lpup?=
 =?us-ascii?Q?d6cfP54AmzCRIwl4W2cmLlDUVSnDwUXGzQTN/gGmzbi/Zz+zzNZcFwSVF/Vr?=
 =?us-ascii?Q?2kAzFNMThTw1DfZ6aRtTW5q9oKK2U0MV3uk8+MzbPnx89yKMXnLqN/3+ipf+?=
 =?us-ascii?Q?KKzkDd6EE4dDxTz8FH2PO3FszB9xVOhCJ2ongeL3yuziDKQf1OpDAJOZfaB4?=
 =?us-ascii?Q?N8iN+fUBtm7Vh+t0dUwia9b+1jI73DmncKsayBU8QatHuYeMNSfeEU3iT4ZK?=
 =?us-ascii?Q?lhp3z/opBW1MkX0fECcQtDoDc2jk01PmfpGdOsXteYo1vlnmYo7Pqj6IR1E8?=
 =?us-ascii?Q?SMBEb7P+xlHNZ9B7Pd/GK/Jg7damOTWt0s+on7YwJyHW4BVpPUKhyoQsl09F?=
 =?us-ascii?Q?JuAXgwk1zo/blA9vaTJfUjn/5yp4LSCUkRU0072Oai3K5R9fmGOzdbbe58CB?=
 =?us-ascii?Q?xfVbTkxjh5tkzb/R7COJUHwZfNGn3oPncns8FSuiYG57H77R/HgHMpp/7Rpw?=
 =?us-ascii?Q?JCngJ4hVa0FnyIFLSuHZLewuZ922csm3vIq6pIe1EYLdkyRPDy108bZkduVp?=
 =?us-ascii?Q?dM+lKPCyn01JsAMUiSWjrbc/m5fDNeIaVRuJSTw/sDWJauaxnXUbHfMHOus+?=
 =?us-ascii?Q?xmn7VzmCffUWtq2Bp6YiU676wbCh7YwU5A8IE1zvSbRQT0qko+1SFdp2B6pl?=
 =?us-ascii?Q?SUeDhYVhFn12sB7hhU8+lpsRF/EGC6wM9D+ousZ0FQnPsFw6mg0mytEwVWMw?=
 =?us-ascii?Q?Ace7arXqE7T4OeBZqkfwOG2WQoz+5MQe424mkb8mQLtujBCQgObaMK4yK55t?=
 =?us-ascii?Q?1EoN0xbYvb/27onB+ovZxRMjLngUkgTvzodeoWG2m/BR0j4nrhKwMbvdvAAc?=
 =?us-ascii?Q?/DRfi855Ip2FZzTgvuFFmWdNtbcxms0UjJ1fIOa7TX2SRSzNs/nP3WXOSuyb?=
 =?us-ascii?Q?vJu2F2xklWcOEAakxTQAReYv3n/fHyUxtljlFlW7iWPr598fe7JZwGzWysdC?=
 =?us-ascii?Q?YyYQNHo2qi4e/4g4mz1Hq6LGQ3fPVls8fmC0AqlGczQNKW/dMBWEaa9iIwlE?=
 =?us-ascii?Q?T3HFx6nIAUSPmv7h7h5+QJ/U1Qsvil/NOCy3?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 06:38:35.3486
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f877485-3940-4c64-e3e0-08ddd4b3de83
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000449E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFD91879A44

Rename HSMP_BIN_ATTR_GRP to HSMP_ATTR_GRP as its not limited to binary
attributes.

An upcoming patch will also add dev attribute list along with binary
attributes.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
 drivers/platform/x86/amd/hsmp/plat.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index f8aa844d33e4..10e8f98ea12c 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -110,21 +110,21 @@ HSMP_BIN_ATTR(5, *sock5_attr_list);
 HSMP_BIN_ATTR(6, *sock6_attr_list);
 HSMP_BIN_ATTR(7, *sock7_attr_list);
 
-#define HSMP_BIN_ATTR_GRP(index, _list, _name)			\
+#define HSMP_ATTR_GRP(index, _list, _name)			\
 static const struct attribute_group sock##index##_attr_grp = {	\
 	.bin_attrs_new = _list,					\
 	.is_bin_visible = hsmp_is_sock_attr_visible,		\
 	.name = #_name,						\
 }
 
-HSMP_BIN_ATTR_GRP(0, sock0_attr_list, socket0);
-HSMP_BIN_ATTR_GRP(1, sock1_attr_list, socket1);
-HSMP_BIN_ATTR_GRP(2, sock2_attr_list, socket2);
-HSMP_BIN_ATTR_GRP(3, sock3_attr_list, socket3);
-HSMP_BIN_ATTR_GRP(4, sock4_attr_list, socket4);
-HSMP_BIN_ATTR_GRP(5, sock5_attr_list, socket5);
-HSMP_BIN_ATTR_GRP(6, sock6_attr_list, socket6);
-HSMP_BIN_ATTR_GRP(7, sock7_attr_list, socket7);
+HSMP_ATTR_GRP(0, sock0_attr_list, socket0);
+HSMP_ATTR_GRP(1, sock1_attr_list, socket1);
+HSMP_ATTR_GRP(2, sock2_attr_list, socket2);
+HSMP_ATTR_GRP(3, sock3_attr_list, socket3);
+HSMP_ATTR_GRP(4, sock4_attr_list, socket4);
+HSMP_ATTR_GRP(5, sock5_attr_list, socket5);
+HSMP_ATTR_GRP(6, sock6_attr_list, socket6);
+HSMP_ATTR_GRP(7, sock7_attr_list, socket7);
 
 static const struct attribute_group *hsmp_groups[] = {
 	&sock0_attr_grp,
-- 
2.25.1

