Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2076.outbound.protection.outlook.com [40.107.237.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76382146A8D
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Jul 2024 17:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721497603; cv=fail; b=D0xShTb/Avd1xoIatx7I24nzc4hzJ1LlCxxZCTBmChm5Rhxqac4Ero/OeXPyMfM9AtFjEANnodm6UiqRoyTJHiRbOaDiggJiFf+Ea9H6Sg7WCm8fU2AY+/8mXsWOWHP3fDqsQxrghPAld8mtKQ91IOnAyAcbssYj63PrcKCJYxg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721497603; c=relaxed/simple;
	bh=HSBCvPnXh2EoHVDb1dWdcKKsosO9PHpvViJ/R0z4rJA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OO5do7ORcwOl1LZZFa33wXMTXN/0U1aYFdhVTsWrIV5ZjWzAX8XEtAEBVGxXYmdNxMb92MTqnAyCCc6Mpfgq1qJbaaNu25UBW0QYKsLzPj4aV381eisO526VClVf7jQNgR+lqvK9e3VjvNDecixmIbG73qUy1eOMJDlPL1+XvYQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=JppfK3ta; arc=fail smtp.client-ip=40.107.237.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="JppfK3ta"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b2LSZW0rigXadFqJGWTExLWvnAdb9RHyzCPA5EBLeJsjkvXz0O1lep4YObX5d6pie4wSfpBMCKNe8xGAHkp31mcZ/zbSYlZN6gM0f8vi4iqv+2CGDo70B3KxAozdLfHTJ9t7C3h02TXFXVrgd7yUuMHz3s6AGIeF7CpEmzoEhSgJC8Tz/VyVd2PfaWGiEP3Gl7tBFh7az+mRT+1pYpmW1CDBGV3caIb5CP7I3MllOJ59T1cYFkrPtyQhoSC5dXXV+TrDyxGoGWYUQgPW81tQRV1iozWx6Z9UISrafPsr8u2wcMiqefEIGQQIAjDlQX585FSBn4csqbGuVIg9HRwWBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SN+2dmDZqdPSac36SNSg35RhKDtYUt3CdztZ+HIeUDc=;
 b=BjDr8/1V9Q7TMxE19tx6GXXufQUaaoD//1veFrZMrbQznSlM1vD1lJ768IuRuX/Qe/LGur7bbvIgFBiFxpD3vHfPdqYb1VmSh8gbQkMG119jWjIx/aqeq2ejnCGKhorxScQGHdqG+xPI5kV9EXjTpSM6kgJQ7Xy5wHART40wHT+kmE6mwB9quRJ6QvV4IdKhDGveeuYWPMn+nXYD3LOORmG8apPiAUs5QFd8M1ZT9CAtF6tFOoRaO1MHAu7AiStaVCVND7F7ZZqK+Ft5x2XXhwBSimZ7ll4pL7Um7qHuaZQ9Y5/xE3nPq6c/NgzmFo1iLY/EO6SM4zJC+MqqhIO2Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SN+2dmDZqdPSac36SNSg35RhKDtYUt3CdztZ+HIeUDc=;
 b=JppfK3tamnK/wY7dANSwwKQvfR9w/KW0s3HszbcOD9flTZf5y2/M3ZsFbLAK3E04MXR1jxC3mGAMhvMGceh530ZeJaAk72uoU3xI1XgcvYXi1EV1sFQH6dJSt/dwmB1wO8fbv6M2x0tbgJ31/Xc2yOehScKy6xrC7f3ItcLT9+c=
Received: from DS7PR03CA0326.namprd03.prod.outlook.com (2603:10b6:8:2b::28) by
 CY5PR12MB6250.namprd12.prod.outlook.com (2603:10b6:930:22::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.17; Sat, 20 Jul 2024 17:46:38 +0000
Received: from DS1PEPF0001708E.namprd03.prod.outlook.com
 (2603:10b6:8:2b:cafe::bd) by DS7PR03CA0326.outlook.office365.com
 (2603:10b6:8:2b::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.19 via Frontend
 Transport; Sat, 20 Jul 2024 17:46:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001708E.mail.protection.outlook.com (10.167.17.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Sat, 20 Jul 2024 17:46:38 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 20 Jul
 2024 12:46:36 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v3 08/11] platform/x86/amd/hsmp: Use name space while exporting module symbols
Date: Sat, 20 Jul 2024 17:45:49 +0000
Message-ID: <20240720174552.946255-8-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240720174552.946255-1-suma.hegde@amd.com>
References: <20240720174552.946255-1-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708E:EE_|CY5PR12MB6250:EE_
X-MS-Office365-Filtering-Correlation-Id: 457dda5f-3280-4af2-4c06-08dca8e3e83f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fjkaj8zVd0UyoWy+4dYYdFI+kQ3L8sAI8zBt+7UWZnInNH+l/mEVptAG0mxq?=
 =?us-ascii?Q?YLjf5yKuQbkmhFMY2xmBIAUXc3PjBtLCTmOibDNCJIw85cWH7Co+lR/KofFr?=
 =?us-ascii?Q?q8/IR1mV0oTnVaO2Ur8sfZkUQMV3ug6vzNtGRSDUca/eX/exUKXL0w6Nk0EA?=
 =?us-ascii?Q?AWtLCgU/4oJ8VzrVH/E4uEq0NkNEMMeVTS2C5g2h2SJSGdmkiQtcfuaQUg9K?=
 =?us-ascii?Q?T4fBdtFvpqbicG3RHzh5Du2bziOYYlxbn/EMxKvC0NsEAv0dgr1LJqO7oWkD?=
 =?us-ascii?Q?JOqDupfquZgCJLVq/kOy4+zSeovgV4qA+T7Wb/6zarwXFoNd9o28Xi3fY55q?=
 =?us-ascii?Q?SWj6h4z55vaZyDTkPwkQknkeHlmspjN6avlvsSqF6OL5CILeKxrzUFpAXP6I?=
 =?us-ascii?Q?/osFqxTuZjZd43bDG1vobgUbjyYwHPIIEDvNFNGCiUZNPxpDdA7sDtExwFYP?=
 =?us-ascii?Q?EZ/+ilS6QOncLGJt+R4iXPW1cfzriGRGaTio70AbK2RwnDBb2etL/NZPk/kl?=
 =?us-ascii?Q?domLm3smjDWnUiySdafFwzRtJZwcvXeDT9qPnP2usTThHy2Hso80LihkN6m2?=
 =?us-ascii?Q?j3pn0tMDziUsDfeV/N+mqXfggyEvQ+N4ciyLhIzGhkPWyGSeDppBBQ4z9Ech?=
 =?us-ascii?Q?JN6LusrIXfBU1/jNNlqtMYw1bR0+qLS8bth4HhIuT78MORJKjoKKdvPP1C7s?=
 =?us-ascii?Q?SG2e8OdfaJDbRvhXS+iZmw9HBCi/Rrp5UkTKtN+GIjjfCr3RIBXqwRStX4uw?=
 =?us-ascii?Q?3h+ufwnGUKkhLBZevCrn2ujkOukyWcfdYR6KSeg/Vh/3tqRducP0C5eGAlx0?=
 =?us-ascii?Q?HVLlBsABuWwvPkfyalY43jdTN/lMZ24PO440G9wOZnbBzR7Hi6GBvugo/EtK?=
 =?us-ascii?Q?NcH/vudWC+mxJuc998aMUEb7AkwBsToGYRJ9YOuYRVhOTpMz31v9tT9QY3UU?=
 =?us-ascii?Q?1r8n4gomNuslLKtNmaY6OS1pVrBx5Ls5BtgULhPhvFY5AtLl9QLDwWTB33/G?=
 =?us-ascii?Q?fmgM0PNbNI4fYUqjEKwYo/KHtHkbLmJiJ/rD6XUwHzkjSHO2Fl5YYdKx3WJH?=
 =?us-ascii?Q?eRMLTuzmFErhwHj/FJ4SXJM/pEe1rc/3Rq5AkLeUFWrt5XiCQwY7gT8wEyNK?=
 =?us-ascii?Q?sLgpQRnrJ4w7l2vOy+4efJcVZYXHZSaciULyH/Yhf5g1RSX9zo9suyX18VUV?=
 =?us-ascii?Q?ol/52mbsNjU/JGbRtZIU6q9IQ1AStOqmUlh1CT13gGGCTbLxxvHVY67hE9oG?=
 =?us-ascii?Q?Mt/E2jx6PDJtl68DGsCP8+euwD3RQ95Xr1bIDCWU6L77HZ/EKHMs1vmwQNi8?=
 =?us-ascii?Q?t/XD2w9k2YulXizx+OvMtnjdGDTtGRPB4iSN2RkN3tyIlXu1x50rM3GV/24Q?=
 =?us-ascii?Q?3f7rGaUvRuaZ7GwFjXvsfKzi5G3/ADdSoP38+PEwzGAqtPqluCiCW49tsPy1?=
 =?us-ascii?Q?l7WTpwws2+1sXWQR2Kw8ijXx722xmIAR?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2024 17:46:38.6022
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 457dda5f-3280-4af2-4c06-08dca8e3e83f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001708E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6250

hsmp_send_message() is exported with AMD_HSMP name space.
The other modules who would like to use this symbol,
need to import AMD_HSMP namespace using MODULE_IMPORT_NS()
to get away with warning.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
Changes since v2:
None
Changes since v1:
None

 drivers/platform/x86/amd/hsmp/hsmp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 759ec1d4d60d..119a1f8895ca 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -186,7 +186,7 @@ int hsmp_send_message(struct hsmp_message *msg)
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(hsmp_send_message);
+EXPORT_SYMBOL_NS_GPL(hsmp_send_message, AMD_HSMP);
 
 int hsmp_test(u16 sock_ind, u32 value)
 {
-- 
2.25.1

