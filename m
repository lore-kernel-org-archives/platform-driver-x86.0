Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2089.outbound.protection.outlook.com [40.107.212.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA79913D606
	for <platform-driver-x86@vger.kernel.org>; Fri, 23 Aug 2024 07:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724399786; cv=fail; b=dN6EDnSLBGQhHg8UqzcpTLSdAVPRuRMxil/+Vp4s3enHSVV32iiHsu3qsB2rFPv6MPAlH9/UQ08m5EH/a1oZOUmy1CcQAz4adTrF1nGrPHe/UNwpnYdEOMIN6WjYWLrnnBgn2on7HJmSKYryHhRGkzBi2NvAhQKP1pBOoiche4s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724399786; c=relaxed/simple;
	bh=sgnmehs5XSxSUGy73WNxXoNWZnuk64iwITrFeLCE4zI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AYAGj1l/MTmZJX7LERL2GXhQU//W04rbSrzuagEy5pZYlT0ZW6eMCVS16/+IpOAkX5URgfibpyQPxV4gk03CS4yk3Q0avrBn19NCfMoAA1IzQ+8dYDnrOmHIfWF9oSPbkOyvlEcQPWVQU2pXqogoNWejis0Pd30uDJZeIBPZXKs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=f7PraHfF; arc=fail smtp.client-ip=40.107.212.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="f7PraHfF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v4qOduRvFKtl72imBqQUBDtgMSHwMMAXMi3t0D9srriDhhBNtPDfBU6PMG85smrTEvKmGbcRgtZYUOjZdA1lBZlKGpJvGmD+ChXGuXmxLsJeCb2kRwhozWY2zqTcf1M0GCwSwigU+8j8RgnIgE+1nc158EDhA1GUv1ARYLVrjJ2uqfJfgpJvr34LPv32keM8a3Ly3kCqhqzjQ6WkdS+XcbI507nv1IDrvMh2uqLkb6i6TmkkAaak8tgOpj4iy6XN1gXnLWlGmkTd9cCgScf9plIWQWy35Vo2Adjs0PuaSSLnh974XZeDalZrW/PiDgt5G3hYHr59MEvS6wRtJ7VzrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z6gi+7YyuxZtNgz19A2WhP6E9c8cSl81xo95PJku5sE=;
 b=dAQOGUuUZnkUrC6xDd9sbs8H+q0qsEMZIoWF9yAJZ/4KkQTJzXt2iL3tqK1N/oEd7mDiaQkemUdNLUpAHacYQDGojOaZhcbIz2ZSFsCHOHKXOr8TNmMVo2o7t2/AHJoGP0zHlVYVnHe8N62FL6rudBq5+6zU8Hy+4NNeYbD466nOkdT9JMtbYZyUg43V6vNRCy+QOAQ74mP9h0vXO1cjY0R6IEnIRWk1j7L74xsvjjUKAKaoYmnuFhgfer+vlUS5nW9DzQ9cmfj1mYHqyoQjAGouf+6o92k3tGmbCgeQxIe3BNKmEUcDXV1KtykuFwqxXrs5BH6D+SPi8fL8Mlw+XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z6gi+7YyuxZtNgz19A2WhP6E9c8cSl81xo95PJku5sE=;
 b=f7PraHfFB+dH3ldh04zf2JjNBGfASmp39c3oU4VnM8TSVHyqZCcBqOM2ZdWJmkK0Rnm6R6R5oOQ5IkmpL+NdJiHZ+Bkc0a7Ed4VUo7okHQBHNXtEiGC95XddkTyg+F0JZ4rFxcL47jMoWqP95fjb76Mrt1U7xvQvcxSiM4UPK8o=
Received: from SN7P222CA0019.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:124::13)
 by MW4PR12MB6899.namprd12.prod.outlook.com (2603:10b6:303:208::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.16; Fri, 23 Aug
 2024 07:56:22 +0000
Received: from SN1PEPF000397AF.namprd05.prod.outlook.com
 (2603:10b6:806:124:cafe::56) by SN7P222CA0019.outlook.office365.com
 (2603:10b6:806:124::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19 via Frontend
 Transport; Fri, 23 Aug 2024 07:56:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000397AF.mail.protection.outlook.com (10.167.248.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Fri, 23 Aug 2024 07:56:21 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 23 Aug
 2024 02:56:18 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v5 09/11] platform/x86/amd/hsmp: Use name space while exporting module symbols
Date: Fri, 23 Aug 2024 07:55:41 +0000
Message-ID: <20240823075543.884265-9-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240823075543.884265-1-suma.hegde@amd.com>
References: <20240823075543.884265-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AF:EE_|MW4PR12MB6899:EE_
X-MS-Office365-Filtering-Correlation-Id: 364dc322-8c09-431c-363b-08dcc3491414
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9FaEdzNfPeP9g2cAFTqSoUL09Y20lKY+AnvJt0VR6Da3xFRbBOEi+OIQwg5e?=
 =?us-ascii?Q?E9h9W3W378gaETstShYGSTqqAbYvt7FFNroRqEDZ041u5/kd5n4Eu5WvtUKb?=
 =?us-ascii?Q?b1VCXpeFAkYMQmLgiwrze7GjigVS4EPF5bPH11TQVVPfxHh7PfPzshvHqNt0?=
 =?us-ascii?Q?A06fsjktmQ3YjE9uRM4qFakTcfELfL5gbgt0AOv7TXk2FoP0ppTAsAgosltJ?=
 =?us-ascii?Q?ceLCmfFTYK8eNgrQXBwqOACPYxvYiuBmES7ruiGFEDpjdAeeSvSl3L6CJvOf?=
 =?us-ascii?Q?6hTsPHXSMp+HMto7bawZFWWeqHpqZ4Z9/gqtxNSW/8v833ZUq7j4s/G2YuXe?=
 =?us-ascii?Q?LIn85B2gJa8pupfEtOqNT9R8NG3jwtnPIpAMOyCkJZ0vlYoJHr27eLFCcns3?=
 =?us-ascii?Q?fM4AumaeRPKbE55eMYSyWD/ZDv3fY2/D3SAn0LsF7NDeuBp5IwOsP1qE6chK?=
 =?us-ascii?Q?HiNlEvZ2tp01qfVckrdr5K2s40hYS5ix1V7xoG3t4rr8Tktz19dCYhh4wNqD?=
 =?us-ascii?Q?IB3NMAiDAPmCI+aaX+3IKmqCO2A7b5P4zanuJAMl6KY0zZJkfDcUJVgolGo2?=
 =?us-ascii?Q?XPOgOYK7rUA9bZhs2j4kLJtw4U7WvRyYbm5tZB2n4SbFpDSjgHZ2Jo/7NvT6?=
 =?us-ascii?Q?h5RzlN8OsaRRZABz3eQDyQB/2ekAAGN3oJEyym3nQcI7sffZPZa29IB1cpoK?=
 =?us-ascii?Q?H5z/+VP47RLQ0zr5HWBbZx0kOeHX3bb7bRTOfnT80C7uK43DGqO/tDQF38h5?=
 =?us-ascii?Q?heJVopwZGrxGpO7KTEtTQN2gAzuwAxKAlko0ZpqhP083+aBkQj2VX6XUUPip?=
 =?us-ascii?Q?lb54lx+tdt/3IUhaBcKJxLZXiRKdSI5L8qZJ4eYZ2H0sLt7BfpmORUpjG0Pq?=
 =?us-ascii?Q?NqmaN0rtZNQSI62I5Zqef9tcM8wFWTXKoDLGazse+GbCZSKYwioe2obCNtuP?=
 =?us-ascii?Q?OMdiWyDa5Kr0SUGLwsci2+KdlhnXvxsJ8e/6q3Zd1lyTkFJP0t756u2kvdrA?=
 =?us-ascii?Q?YOLZqNJ+OR5UMyixwab3zYPlDevMH7BVVZUdf/AazQfFMVNL+Vo6y7eGHwGy?=
 =?us-ascii?Q?pcAlC45pJgR643373h1LUQ8C4fZA0PD6Uia0uYaBPMOwSXkJ1V8lkPsYuEev?=
 =?us-ascii?Q?sbKNrEm4AtWWtmfjMrK9S+Xi2hfwgV/Omh4zAXHn+oCd0821/Ukwoz8JVjZ/?=
 =?us-ascii?Q?ddDMmNBDTJ7uN6+Et8nC8TRtC3RSVxDIWw4ElZxWOq5IuN9c7yAhFqnOrAUF?=
 =?us-ascii?Q?m0xwqz6k/J79usOBSZoZ6TsQqwqssBDbMeRK2qLzEJg7vSPY2SQg3Hsyyd6h?=
 =?us-ascii?Q?z53bmYDfWQEagzHSqntyuRXhAIWEej3mcT7MzVvwA8vw1EeC3YcP7wyz4OBj?=
 =?us-ascii?Q?CROpPBEmzrGvJnVG3BE/ZyMtKLac7d4WsgvWJY1cKX27v3uIL775rNvr6wPw?=
 =?us-ascii?Q?zicBimOr64s5/eo4PTB/It6coQT4tQvV?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 07:56:21.5728
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 364dc322-8c09-431c-363b-08dcc3491414
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397AF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6899

hsmp_send_message() is exported with AMD_HSMP name space.
The other modules who would like to use this symbol,
need to import AMD_HSMP namespace using MODULE_IMPORT_NS()
to get away with warning.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
Changes since v4:
None

Changes since v3:
None

Changes since v2:
None

Changes since v1:
None

 drivers/platform/x86/amd/hsmp/hsmp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 5e0c9c36f435..8c8e361b1feb 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -190,7 +190,7 @@ int hsmp_send_message(struct hsmp_message *msg)
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(hsmp_send_message);
+EXPORT_SYMBOL_NS_GPL(hsmp_send_message, AMD_HSMP);
 
 int hsmp_test(u16 sock_ind, u32 value)
 {
-- 
2.25.1

