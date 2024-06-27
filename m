Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2088.outbound.protection.outlook.com [40.107.102.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDB01CD3B
	for <platform-driver-x86@vger.kernel.org>; Thu, 27 Jun 2024 05:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719466838; cv=fail; b=bX65mZ5NoQNViN67SFOiI2I08QOixcsIQE0OWjzllyDUY1jDlzUGR1TwvQeq1ZCp4wj+1HNSfwGosIsY+c8I2U9hFDVh+nF6S4NHz3SLCqo4xqsZqVA3VCTEBINZKBOZ72AjxCbvHBrMs0PoPA0ecto4qd8lIyxSBSoilLpdjms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719466838; c=relaxed/simple;
	bh=oAepzXOrW3Y5dN0SK73aDLeheYLFhkOHy4eL2VzGXI4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UJpadLpXUUY+hGnMpfNOF0/2cGTdePZh49QQC4rk+8BWIKUTzqQCRyiPMtM6HOrTNs6z+xnzfDB1HSQwhknad4soSgn6ykRQiiSttBTl+vNYq8ToMSU8crAhg2lvao1wPGoiof7y+glWsW65Qy5IgXeZAoLnL5Xmw595/vN/P6w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Bx7pUEnZ; arc=fail smtp.client-ip=40.107.102.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Bx7pUEnZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b2Jp3ZeRo9zyWCxnKX1tRaekZEuGmut6Zckb7ODGKWho8mNQAqToLF7Yhvb6ZPM80miAMggih7/sIEaTn6RLinD3GgZLdszm0YP7rZVi7pjEJXSI3W6wlDXUCy+XrjV2O4zhZjOuP3gbvg9F3ZdfwAj9zpNMdlvEAdirtAF43f4PFcgDASWn9qAhBWKiJC1jAtO7AaK/3MZ22nmpRFJff/VMr+FTS7Umsn9iX4D4SwlhraOxWJsJfh/luuIGQh6lf4tb76XEoU4oypq/6HDPJGwITIPktMTS9MM4DTbrSzRj0raeYNW6LxNFrBrKOskIBM7/al2RNZ07fDaQ/E74pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ugTRcxsI8tDKQdnjUVYuYMEdWlR6u1ddpN9ohznvvxg=;
 b=hZvSLK2P0LNObno+IdfD1E5QoFvV2ip1dg9R4Ed3M80HzTNGjL665SToOoVeDnqL/b3XgOr+0TieNNZM+yiYcgCDTmGrXubtNrN5PsNWRv8Ypb5G8GABItIue6KWRbIgnhFdr4FZk+u8y20f4ElTH+PJB79KEj0QQPA0j0NxRsI0ZWZrqHwyhznafCA0n9wmD1xtLo8HGAMspCUNoTdilAECHu+hfZZ91zcp3caYvjAI28WSo55+zANGzBTaRUJawhKz4xM/573hI/TXAscwX7nv0qprxUCNjTYHPyF6UKgam5zuvO2VjwzxfhECjFlKiwxJ7fhFtZXB9OZhZlnkFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ugTRcxsI8tDKQdnjUVYuYMEdWlR6u1ddpN9ohznvvxg=;
 b=Bx7pUEnZxArSMWitWF0K1H+E5X7nzBZz+Lj0AZy2snFj8+LYjN6Dh8Zw4YjjdZoamPLAjT+Xi+j4fvYQaho7veBX2NW5uybmTGkzWIEnAor/BFwC3j2x9JInRLPADc4iHxmHGu5UunLieqM9y7AN3y0iiWX0h9b/oKPZKTFNl1c=
Received: from SN7P222CA0013.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:124::11)
 by IA0PR12MB8906.namprd12.prod.outlook.com (2603:10b6:208:481::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Thu, 27 Jun
 2024 05:40:34 +0000
Received: from SN1PEPF000397B2.namprd05.prod.outlook.com
 (2603:10b6:806:124:cafe::1c) by SN7P222CA0013.outlook.office365.com
 (2603:10b6:806:124::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.24 via Frontend
 Transport; Thu, 27 Jun 2024 05:40:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000397B2.mail.protection.outlook.com (10.167.248.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Thu, 27 Jun 2024 05:40:33 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Jun
 2024 00:40:31 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [PATCH 07/10] platform/x86/amd/hsmp: Use name space while exporting module symbols
Date: Thu, 27 Jun 2024 05:39:55 +0000
Message-ID: <20240627053958.2533860-8-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240627053958.2533860-1-suma.hegde@amd.com>
References: <20240627053958.2533860-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B2:EE_|IA0PR12MB8906:EE_
X-MS-Office365-Filtering-Correlation-Id: 31bc66f2-2453-415d-be8d-08dc966baa02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OxIRofKrM2TyWGq74ZEBgJ4clnkIWQ0IE56vqfljham0Nq+xFXMMzxTs1BJh?=
 =?us-ascii?Q?/VstiCl/QAfIx/7SXAS3QaMbh/nQT/IgjAin9sGSGtOtY5A09I8tWH/en7Un?=
 =?us-ascii?Q?xGu/nj9Ck16oEsV7ITq5MVcjNDiBKo/qHn0Dwp+R6CEwPF777xjBGr3OeioM?=
 =?us-ascii?Q?fcX5P77lQ5z+Ri+yAnn578RZQKhYIDZIfpItY13uz+4QItRiGnjrv3+Y51Sh?=
 =?us-ascii?Q?tpxsX1yZ+52GFbHhzjTdvnhwBCSy8E4qrPqZlkxWLPsgqlrUfaq+Qol0jzj7?=
 =?us-ascii?Q?t0/QEMc0wnAQLHKsZyjcjZQ3mxwCTYsNI6Bp5FQn2qGoaLYNLedzYjuxDdB3?=
 =?us-ascii?Q?Tu/hfSTYcHN6aRzCVG6HEp2OouC0XGcH2g4oMxWmNuQ8efw4py7Q2D72ZsTf?=
 =?us-ascii?Q?4scszPkuGx0mo3wT/FZBhL8H5annlIHemGp8+9tjNTSO06lvfdYEDgtzymDz?=
 =?us-ascii?Q?k+CcqXxe45tOGrR0MuC56CbtYIwE/Yg10l1GcbiAAZY/qM0H5u1WSJHwPzvD?=
 =?us-ascii?Q?cEihaPe/zjYT6pk5R+sKhqDLfq2mrJpBncSvGihPI5cAO47daME1Bvr0JexV?=
 =?us-ascii?Q?4e9db2s95xgeZflwosRF7bakI0W4wm9DAhCBoy07k8EB+gLErFWYVbeKQwqb?=
 =?us-ascii?Q?zBEb5hwwD/WjrAkbpzVyIk0MM7cdbPX9C4UkXzbS8EqOX4VBL8wBYG7W8X14?=
 =?us-ascii?Q?LllNl1wRRrU1JN5LmmWp92NZ3M9HsddyYO4WcS+SN+yVSrSNlDS8Ji1dFuSz?=
 =?us-ascii?Q?5y9s7rBBzuvhRA4juRbzJRPvPgVJIGHLnqYaeaxkV3hjmTDK40HxIAfT2pqh?=
 =?us-ascii?Q?f573FxdWPL1zTmwTGl11QmrI6mJw4sjp1BXkoV2RyteXwgIxjtwaLYnBmurB?=
 =?us-ascii?Q?+hdr4ZFXF89wVclvupcfP4LBNco6YQmeFiEg/k0OIomvE3XnEBTuPrBtF9PF?=
 =?us-ascii?Q?ZmByFYCMGGEWoDCvOwh/QbWsHM83rTGoIRZ+Y9yNltaGp3NUEKpb/B4cHlv+?=
 =?us-ascii?Q?+oQe9HEyLWupY7ud4FltDSkRALMGMIMJ9YdV6EJ84UpZyY7Gn9hRVrNauNNr?=
 =?us-ascii?Q?X+Snl9k4XvO09qeSR379xpx41s1slH/S84DzFwK+GIbq+43t4ipOQKHG5W8C?=
 =?us-ascii?Q?4l/u8RTXWxkCy0/cGFlEGGv2VaCu3ZhsBZv8jOkPreRk08EbSUWmPFlEbxH8?=
 =?us-ascii?Q?+m3K1TD178dPeMi0c7h5SuJLTSD5pzTrwzdu0ovgWmFX3++xQfwnbs4nhEHX?=
 =?us-ascii?Q?n5bU3yGIbyafW+0/OlH7IfjefFDmOpqx0XWeuRZGHJoxBYM2ZCKuc45p8Aia?=
 =?us-ascii?Q?Ro56McLsIX/CrxaiD9lMHRn6slrcxfZ5v3yLvRpWpAGsw1G5TCHs/tJCjiR7?=
 =?us-ascii?Q?GXnmHaDAYWSa829uXK+MikrMDYciW2q3kw3bHrcDzuu8aUJJIFdab88budJo?=
 =?us-ascii?Q?KhqkFEZvTu92vKCDwoZau6meaxkuZK6U?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 05:40:33.6960
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31bc66f2-2453-415d-be8d-08dc966baa02
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8906

hsmp_send_message() is exported with AMD_HSMP name space.
The other modules who would like to use this symbol,
need to import AMD_HSMP namespace using MODULE_IMPORT_NS()
to get away with warning.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
 drivers/platform/x86/amd/hsmp/hsmp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 8cad5e813947..4bf598021f4a 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -185,7 +185,7 @@ int hsmp_send_message(struct hsmp_message *msg)
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(hsmp_send_message);
+EXPORT_SYMBOL_NS_GPL(hsmp_send_message, AMD_HSMP);
 
 int hsmp_test(u16 sock_ind, u32 value)
 {
-- 
2.25.1

