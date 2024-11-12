Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2082.outbound.protection.outlook.com [40.107.243.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294F52309A8
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 Nov 2024 12:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731413143; cv=fail; b=UEXYTshyGciLEKhrOV27oJpYTUpog2WOboRVWBCZcP7lo3zfK44GqCNzrd7xafO1HXg4zqoxevJM7Tv3LzIOQUnQGskDnWvkQfieAoPzvWcJ6bVPxqfzCi9Uv0kABhWF3z84qcIute4dKsNeZN6fmDwq93tuOJym3h/z3y/Ci+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731413143; c=relaxed/simple;
	bh=xXbGtObNc+o0qUYXTYOKgkiMKunS0FGjly1E6A8WMDU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E1h7IMOBRJ1CkOLEIeR5A1+yF0RRAgReW8ZPploM740pRGE0n7eeAtdaC10UggbVBtCzdd0uTmT8sTi9sh3usr9/7aQJG8k5/ekcYxJdJsVV2gUfatHwxJkETD8l4wpgtk9z5vvxonciUDajIqZJFx/sSLHbKHmhanflKFzWe+k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=xNzxB/yA; arc=fail smtp.client-ip=40.107.243.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="xNzxB/yA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yj3H240IhqAM5ZJtv4MTM0BwZvVSd2Ud4IDu1VyMzmHjS3em8LvQBMIbGSj3Wio1JoHBRD0o/9rTn7vXnVlAY+x7N+6mkYbGUPpcKIecOhb/r1yslqi+CyU6T7pMiyX9XMtgpmTPJ090R4evAIpkc8eyFg2YTLsHX60AFxGH14nhJrzn1Z73bvxoX3pgGUbS4436dbN8UQd4fTXGlm8Gml/GndOQ8bSbniw6TLz/KEfLFijAlqTtSzP0PHklh+iP5JPZjohlLQO0q8IDmcFKGiBHV1AYB6IYShS2gqzPBWlvbSTqcT6PP5h/49efDW3v2sSFD6MTh0h0LMbDnMbHCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dHaMh6KllCW61gKrju6d7FNke66/hSSsvBxVOthg1cE=;
 b=mYU5ltbw2Cht6myMIIfIXc1mNDsDAI/L8ji0a/k6/bXbW7bsaDYBuhmBdZI0ICUEYb0KOrZ5EtBSAXMGDfPiIp4pv7vcezlYejfDC0syQbpV8iSeJpauc7NUAmQ8UPI/0tR85HBxgF4fw51QaY7LqjamRiTb0XLT73eokyUO7Net8l3SkDEyP1+517rEnLtevHEcazUWOBYmk0PcPoFsb5pAcjMUv3kxLwYbLOPZea2/x7j7kxCwHA4pL5UgKxKpEztWNxJomQmIjFJ4asgmc6delnruure1ku51/eK3qXy6cIpqG0J0PAzeMAYhjqTGnwOMZSjupCma0x+RfAW9Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=temperror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dHaMh6KllCW61gKrju6d7FNke66/hSSsvBxVOthg1cE=;
 b=xNzxB/yAw8kbYsaZkyfUrRIF89cAOaByya3Nxh/QoaWEd2QwCWHoajaC4FlD9u04j02VUeslKBD1yzHULjRnrpITL3vrIhqbDaclYckLP2CRnk7IpFFlWaLIZXBcEbY7s0AHkoQMxnGohBaNDqNWJOdgbMXCMnzzseJ01BNUGZk=
Received: from PH7P221CA0050.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:33c::13)
 by MW3PR12MB4395.namprd12.prod.outlook.com (2603:10b6:303:5c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Tue, 12 Nov
 2024 12:05:20 +0000
Received: from CY4PEPF0000E9DA.namprd05.prod.outlook.com
 (2603:10b6:510:33c:cafe::8c) by PH7P221CA0050.outlook.office365.com
 (2603:10b6:510:33c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29 via Frontend
 Transport; Tue, 12 Nov 2024 12:05:20 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=amd.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of amd.com: DNS Timeout)
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9DA.mail.protection.outlook.com (10.167.241.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Tue, 12 Nov 2024 12:05:18 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 12 Nov
 2024 06:05:16 -0600
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v2 2/2] platform/x86/amd/hsmp: Change the error type
Date: Tue, 12 Nov 2024 12:04:50 +0000
Message-ID: <20241112120450.2407125-2-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241112120450.2407125-1-suma.hegde@amd.com>
References: <20241112120450.2407125-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DA:EE_|MW3PR12MB4395:EE_
X-MS-Office365-Filtering-Correlation-Id: 643600a7-f278-4581-272d-08dd031246eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?w0up2Y6GituNvdZRrFfjMLqez81GLWOBB9DX7MJVWziYjIJXgmlIv+CmXs3/?=
 =?us-ascii?Q?1oLsIvCba9Lmr/zc5MndXtN4NRUIfW4/8/nxld7yhxG852sMYJrtIYTxNAyl?=
 =?us-ascii?Q?o+wKoaO46l74cF+fM1vCnp5jmBPAXymHpUT+gyMCcMyrXdqVctBfz/LcClSr?=
 =?us-ascii?Q?s+5KZ1RdCLgyTqWzLRpeV/ZGS0ANY9IcI8rp6SXU/MssH0x1XM90ZOHNwqrr?=
 =?us-ascii?Q?K6P3eqnVR3sjfwGJo99D4NonLf4t5Oo7FMf9oIV7K/CMirB1+3aVh0lclSET?=
 =?us-ascii?Q?XdLt4JFG948a54uQtTvPivyjLpjWGyY//d9jCM97Y0uPG3qJgaF+musX/mUh?=
 =?us-ascii?Q?jqu2AD0krb4G5Ap8Ca5Qy9f8OC5uEpxgstBnFMm7q+Zx96NzCCy9BE9UCzmP?=
 =?us-ascii?Q?xN20HgtFWmQDO6Wco5WM1NbeimOvRcuM2oMyo7FCCArdznekVIQFiyr1WlgS?=
 =?us-ascii?Q?sI4izN5ZwIQosfM0fbaWe4l02tmYn+UtiGWdu6sgT8nt/WOE23WdvOd1KUCg?=
 =?us-ascii?Q?z2Vq83pEY7L3ciKaIQLVTA2dvWtVzDry0wNy585KkjoVjwdlbWO0N7x1fZRl?=
 =?us-ascii?Q?lqm+oOyNb+vJ/5yGeNOYQEmpsFG6RprpjOEXRh40HbbqCpDHY/UpXOCcd44y?=
 =?us-ascii?Q?neSyzEAn7Y057AmVQU+6d12h0OFBNqf09JmWr+uau9yk6hPIyH+MjEHiY0CD?=
 =?us-ascii?Q?78JhtahCsXnDew9nP65KziLdqr1Xa8X6ON9H/NnflUoYdnIr/5lR3FyFjkY4?=
 =?us-ascii?Q?zy2QWWmwfoF9QAtDydfkMPLq/0XOf53SvkjDeCVJ4enoS8g71Olx5gTpnW/h?=
 =?us-ascii?Q?w7tHoKXnSvqhGqDld+fN+gn3ARuD0H6YYG0O8PTk4BONoJWVEHTF8eqK+ENq?=
 =?us-ascii?Q?hwItTmj883+rD8Y1jgxkIreUHhhtI0bwF0lDT1noTDR5KtJC4/knb4UxCmCy?=
 =?us-ascii?Q?i455BFbXe427rNtc8MGiu28cJF/Y2aXsGn9wddLChM/r2o5CRSnPlWXk6lnJ?=
 =?us-ascii?Q?7d4d8ulNAYwOiCHRu9ZEW9xFCvCUCxje2A8HDWA7jPvVHsYSySQZHIeZad0t?=
 =?us-ascii?Q?2YaiPis45jtrfyHbSQe20jvrDPz9efZT70c0RWRvWQabgkK9RhWJgkDB4PPl?=
 =?us-ascii?Q?Ink3jzqXEGrKR6mw8GtJ8P8cVl2LSRJ1EzN8Nt0gYqZb09JoNzJv1FTbQDU+?=
 =?us-ascii?Q?x4MVHEZL0q4Qmm0A+M+pn2WzqyhczEp7tmZOoniJYvd3RyITY0QAKpT08EXc?=
 =?us-ascii?Q?8xNV3AR86BLLLqNELeb4cLMtGe0EkkpV5CawM77T1Q896DLoaXONriq5jemT?=
 =?us-ascii?Q?c93lXGVVWQFxf8qjvd8fl1KsUAMuaVbDd0A9/52JKveV+75rsyctrqqr6RFC?=
 =?us-ascii?Q?Q0ERez//twxXg9XeDr8a2r75W1TjmqW3vrU5QPMsy2pjK/5CBg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 12:05:18.8870
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 643600a7-f278-4581-272d-08dd031246eb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9DA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4395

When file is opened in WRITE only mode, then GET messages are not allowed
and when file is opened in READ only mode, SET messages are not allowed.
In these scenerios, return error EPERM to userspace instead of EINVALID.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
Changes from v1:
None, new patch(after splitting the 1st patch).

 drivers/platform/x86/amd/hsmp/hsmp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index ce91b2cefca2..f29dd93fbf0b 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -262,7 +262,7 @@ long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
 		 * Execute only set/configure commands
 		 */
 		if (hsmp_msg_desc_table[msg.msg_id].type != HSMP_SET)
-			return -EINVAL;
+			return -EPERM;
 		break;
 	case FMODE_READ:
 		/*
@@ -270,7 +270,7 @@ long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
 		 * Execute only get/monitor commands
 		 */
 		if (hsmp_msg_desc_table[msg.msg_id].type != HSMP_GET)
-			return -EINVAL;
+			return -EPERM;
 		break;
 	case FMODE_READ | FMODE_WRITE:
 		/*
@@ -279,7 +279,7 @@ long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
 		 */
 		break;
 	default:
-		return -EINVAL;
+		return -EPERM;
 	}
 
 	ret = hsmp_send_message(&msg);
-- 
2.25.1

