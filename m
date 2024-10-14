Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2088.outbound.protection.outlook.com [40.107.220.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0AEF1369BB
	for <platform-driver-x86@vger.kernel.org>; Mon, 14 Oct 2024 04:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728881920; cv=fail; b=SOUmYDoC8P4e5vhVBgkgdDXyitRExIxZNDEkRNiNzmakSyF2qfyW5OqdkgMT2zO6Mv3WPLwg04SlCQStGPDBVILGGDjdyw5muKY078QZZCB6H4h8WmJMn+usxNOtWC3NeuhGBx1yLSfn+dduFmTX1It29Z8BUNSvPE0/TJnhmNI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728881920; c=relaxed/simple;
	bh=9XZgT7lrX7GYQbnx+RUpjcJslSwCzl+nfM8cxlbVwEw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iGH3MF23RnzdVnHP/N3q4+jzkJ6i0FseX2f7bbt7WimBHMj1/GWkfL8V1mRr2mgjCWwKnnIrcJnWo2wPutckx4pW6rmJOPV2SBNaofq44S6mujuJxCHDjh6epic9JOEglBS4KoufBWwVlFmf2gph1lOpzyMucr1hagEn7i+P8ag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=FjmeXbTn; arc=fail smtp.client-ip=40.107.220.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="FjmeXbTn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ov1hOr5CzvJeB1NoYxgWrXpwg4zsXswGlw6pFGZ2zdLTK6RodJKA/bm6cv3C4nytiVL6iyiXRUYyjQqfcBfomoGvMu3gqc19a45ipp+J9ppJ8337MhEJ4ChbnqKlf0R5CVGmN4Rj8dyKbW9uPPog2tb5hxD5e1htmc4p1ROAuuV570Fs3NKEggHwHykxUCsQWQah+KJ8bsql2k6f6Qem2L2Mrvi2owEx+jOa0QCB+Z56Bk3wuV0SUfeYldaZHKtDjulplTE7yQngnjFrUrABA6PWUJzhOSjIU9m3ty3qeOSSem6e4mcXvH7txWDXiHUj8aS3Ub8Zow0P5Au1ggitUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RFJLqUyXPIYlgDEsXzlB+w1N1ycMU2xIqLsVNosRwVA=;
 b=ewX2/7e6/tI+w+gOrvvDh6BIMhMMp6m4/e2OkyMM8u1HefPe3uJfnQKUzvGVN4gCGer0qH/XV0Fb9FCCy2rjEbRA5t+nJupOqVrauojyicfxeJwwc6enNwZgrmdaeUaY5JvvER1ag9KWQ1mlb4KROVo5xpcnBTF+o2EvDZf2NInfOLAIMeg79pajRI++Db+OQXEOfufRi5O4DlW14tqCT1+tDRxMppqWa+S9yqcp2oYCoUqwjOwDVBpdYhpnuIIOgov6AQtPgpB8qbNtCpoS63jyB26PVkVG1XZZ3ZZJupvgJA54NsA8jG7tqZRX5bjRh5D1JfUWDO7qaDfOPW40zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RFJLqUyXPIYlgDEsXzlB+w1N1ycMU2xIqLsVNosRwVA=;
 b=FjmeXbTnkvo4VNYrJ23KOP41ZQ7OK7Yexdgcqt12VXuYItB06dO2qme5WXE0n0hFB1yRJQLCcEbHZcOn68wXOiT74O9sjn6vf0/+kcWFbE7cah9oxK0F92sIPSnz8EZxhFCJbgIjYUoQh9wSSGC4K4q9EmiKurTm72RO6zojWok=
Received: from CH0PR04CA0080.namprd04.prod.outlook.com (2603:10b6:610:74::25)
 by PH7PR12MB5782.namprd12.prod.outlook.com (2603:10b6:510:1d1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.24; Mon, 14 Oct
 2024 04:58:35 +0000
Received: from CH2PEPF00000099.namprd02.prod.outlook.com
 (2603:10b6:610:74:cafe::70) by CH0PR04CA0080.outlook.office365.com
 (2603:10b6:610:74::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26 via Frontend
 Transport; Mon, 14 Oct 2024 04:58:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000099.mail.protection.outlook.com (10.167.244.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Mon, 14 Oct 2024 04:58:34 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 13 Oct
 2024 23:58:32 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 3/5] MAINTAINERS: Change AMD PMF driver status to "Supported"
Date: Mon, 14 Oct 2024 10:27:57 +0530
Message-ID: <20241014045759.1517226-4-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241014045759.1517226-1-Shyam-sundar.S-k@amd.com>
References: <20241014045759.1517226-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000099:EE_|PH7PR12MB5782:EE_
X-MS-Office365-Filtering-Correlation-Id: 5782d017-1a56-4e83-000a-08dcec0cdbbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TicuIj28gFWginjHs+FzHu7s1NOmHvsOmIlVh5SEpjnMaTsFg9RTmywjFn6N?=
 =?us-ascii?Q?t/a6joWI0pR289Eejbr5gla56vstg4pvI3kgLXWUJo8rue58W4XgE1BE1v3i?=
 =?us-ascii?Q?87z85zIHyKYxYXa99FWrhqXGTAYkNMmR/eKLd+a73b6lEBOoYlcY9Euu++Wp?=
 =?us-ascii?Q?m4pEofg8VIJTk5Y34KgIGhRL4LxOvCvVx58l0mb/ifgRPkxbiV5tnnryCXDv?=
 =?us-ascii?Q?kUQmgS2OUdmr3W0U5mDvnpiGzdwEinugnsvOj0Rc+PwLRt0zGJHTamcenT31?=
 =?us-ascii?Q?tmfz5kcDML68j7Ix37lWf+qp/7GG4+aHvqk4rmvjef9mm6ZNYlES9FHpko6L?=
 =?us-ascii?Q?y3gc7XTRTU1EU2wPoDIsPIde8cs9OQI5UK/EYB8KVY7oblRX4/9nCuVsJ7vF?=
 =?us-ascii?Q?gu0WxOT8pEeAzsyWn8cQMLXexvRqQxLQLVs8Ybqp4K1jhE2UBwHL1VEMsJ/r?=
 =?us-ascii?Q?6ipa7cisgQbI/SOd5vTbN4mGiGzmwC2Hi125cvXaWSRTE3cUnncD+3g/xWzV?=
 =?us-ascii?Q?acsobBh6FfV4h5junipah15HDnVtTC6+l0t9xloYkzDeUl0nVAzXitJmYQGm?=
 =?us-ascii?Q?3oM/niNdGdCsvhQYvRjXNCNqR6Dn1L4CJbOFFd8tG77I2jPA+vRw1UkNicYq?=
 =?us-ascii?Q?97jGy0w9/ORDSMZHuZqOyVs/bOFctUnz/0YbIHmf6X/yr4HN96PwHxEDOE9v?=
 =?us-ascii?Q?Ewjn3gDe3csCPd4lQs8dyMXumVLwv5fp8TRkrDuEDLGs3iMUELjY5KaHaZ4Z?=
 =?us-ascii?Q?DNRCenwTsUXVdy6918yUxJtnIOA4B/R0f05RHDZjnMcf8/aGu/q4O1XLce7/?=
 =?us-ascii?Q?rpLL4PWs3juZH7RAhf5QAKKsAII5+Q3czdJGIk1E/S2aJ3hdT7mFBWWXD/Pa?=
 =?us-ascii?Q?nJgOX18IaWAbPwUQh3EY41YE+GnCLiSZKdbcT8V2n/iYLx58/PzZsfNnEWqI?=
 =?us-ascii?Q?y82/w9U7as/3K1yUUdntZui80JejJSI3FOttiKyxD8cV+sYCrFEnGBM7KLsL?=
 =?us-ascii?Q?+YpM2VIMJm9mTVYLgL2S/oH0JkP68m9+C6p+xE0Oy3OTLfJn3UzZuIR6hjVQ?=
 =?us-ascii?Q?Hf6CJKgYxCpVcAUELgVf06OgBX1x+KsbYJwhj5XRQg+jVZ8kDJ07M3Q5Oocj?=
 =?us-ascii?Q?vGD6rFLQPE8/O2ipb9QXNj/vGdVU9/RHrHkUFATA8Aa6mVMg3vjr6AaTLwbP?=
 =?us-ascii?Q?Nnz1K8wwCS67OcsBWwUrd4OfcS1mHjIgi/gXTE7wSrULsQKTZC+eCZznhkh1?=
 =?us-ascii?Q?tyTWvobe1ZZDJPTfs00bBawPrr1nXBRfsk4fdmWwECU1GUPKbIBHuu55myCd?=
 =?us-ascii?Q?RBSfFS9PzL3361yXRzTr0tJx3O/jp1rAi4sOjsUICehG75k/cPE2zTGHfeba?=
 =?us-ascii?Q?qebQ1TRsVSk5JO1yFhc4z0/puSIR?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 04:58:34.9476
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5782d017-1a56-4e83-000a-08dcec0cdbbf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000099.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5782

The AMD PMF driver is actively being developed, so the MAINTAINERS record
should reflect "Supported" instead of "Maintained." Update the MAINTAINERS
database to reflect this change.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7ad507f49324..c2aecaab779f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1131,7 +1131,7 @@ F:	drivers/platform/x86/amd/pmc/
 AMD PMF DRIVER
 M:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
 L:	platform-driver-x86@vger.kernel.org
-S:	Maintained
+S:	Supported
 F:	Documentation/ABI/testing/sysfs-amd-pmf
 F:	drivers/platform/x86/amd/pmf/
 
-- 
2.34.1

