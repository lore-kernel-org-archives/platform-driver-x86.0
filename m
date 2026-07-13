Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011038.outbound.protection.outlook.com [52.101.62.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DAAE379EC6;
	Mon, 13 Jul 2026 04:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783917638; cv=fail; b=CFXtYrdv2LclUCvtD6aT0ChD6GqcyNe1lpWKrmdNIxSGgGJ7n0C6cTbxp4lTir3CZwipzhuHcm8T7LFwXrO3vj7cNjPLprFV/m4hU/9CqPqsMEd4xgwkPVYu5/i1iuLnUcPYUgMd3D92lWaKKD2zXxSvnvKFG31WsV7ad9pJusM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783917638; c=relaxed/simple;
	bh=9KWKZzZGuWBWH/h+cSYBAWf9dJ/sAcuRy03LTHEJMqk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cVHSHIqhahM8dXC1JRyzPPisvdxGu8Xv4P6z1oa6JNHc8ZsYkvwO5zhb+Umg6KwwqTbNLtJEsh36VxZ8kixrKA0NdbmZ43l6rLj2tEk8xpBfvCfoxGaG11F1/THcGoQ6gmKfuj4TKG3l/JqLhsoN+LMRaDPgUHibmO7iyE+M4Q0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Cm8ydyBq; arc=fail smtp.client-ip=52.101.62.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Cm8ydyBq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kzj8lEiHQLkJcvhPY5EJ9RC1LvL4YVHvZJCi07ZmOl8WxOwWQQYSF3cuUI1bYhgf1a1VHu2PF2V8PvMqUYW9iLiqGBG+LgEQ81NQEIFu522siSC5NpvB16ybIkkiRqIhLXTkBMsa1gwQRkHVx1pA2KZlnVbXHBFbunKOuW8wGIGeY7LxCjkJv807ggd2aIBqVuEbb5AcK5i0+8pdxoj3MIF1+VV8QmHlo/Mlx6FjO7vlruLVmEnP7kLZYH5GAHkau3qEdGZWJFoE6SJxGBDJcJNTv/5Xot39nMovEUrXDSaZJz+E7K77LHkaZG0338LU0E6awwxwCAxYpz4Qzc4YcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FyWGPWrrB9mFsyaDZ9ijrgy5YkVtj1mSwJzz5noEpz4=;
 b=Ys4PNFodADsMGeOq3OgW85d40Y/kmaX09aJktKReZSMgu9ILfwGNgQlEDhro+yho0XEMdfaC2eu1LHXdNzrKUhiJtqI1Kpu1OXcUTLPKGfp2VShIUT3nsPVsb+h4825MFK03oYe/062x3o0Li0YUUIjBzUa6HkHlMEMrfSBnTgeb8kIiN4qnnP2K9C7YS6u6zsvtkM9REl7NLMpg6dRjFJk6CNEFlfF2tGBhs8IgM2HOnjcj72/9+7FMq3Z+vfxJO0T98u6YefTUk3jiwpKxRz3X2oUCnaLhFRj9MqD11ao96ZoQLWfqCIf4/GdD9GsIPLyb1AaWpjJs982i933l2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FyWGPWrrB9mFsyaDZ9ijrgy5YkVtj1mSwJzz5noEpz4=;
 b=Cm8ydyBqlOHdyxYkvp0R1FG0Vu4Hx+YfGygSSeXUM2I/x08I9zkDhi26d/U5SbgOmSNRWanWh8/GF+GDR5LSg2FGwVAbPVHR7BDyWvq40oPov8FHiarOsWwkRmofsQCiy2JcSWoXIWNqCU6ZawnktH6Sbpj24gCLJBf+YN35kfU=
Received: from MW4P222CA0001.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::6)
 by IA1PR12MB7637.namprd12.prod.outlook.com (2603:10b6:208:427::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Mon, 13 Jul
 2026 04:40:31 +0000
Received: from CO1PEPF00012E83.namprd03.prod.outlook.com
 (2603:10b6:303:114:cafe::c) by MW4P222CA0001.outlook.office365.com
 (2603:10b6:303:114::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.19 via Frontend Transport; Mon,
 13 Jul 2026 04:40:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF00012E83.mail.protection.outlook.com (10.167.249.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Mon, 13 Jul 2026 04:40:31 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Sun, 12 Jul
 2026 23:40:29 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<muthusamy.ramalingam@amd.com>, Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v6 4/6] platform/x86/amd/hsmp: Clear mdev.this_device on deregister
Date: Mon, 13 Jul 2026 10:10:03 +0530
Message-ID: <20260713044005.1194115-5-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260713044005.1194115-1-muralidhara.mk@amd.com>
References: <20260713044005.1194115-1-muralidhara.mk@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E83:EE_|IA1PR12MB7637:EE_
X-MS-Office365-Filtering-Correlation-Id: b932ce3f-262c-4ca0-e648-08dee098dee1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	KOc4qTIGZWW4TL/9JR+pMjkEK3qaSl/clDE5WtLG91NOcDlVXVoC7FF3/gzEIpggBY9KKL1wEk8cWYQSRZdqGsiOQHB6xIcZIoKEgIxi6hMYFe8sVSP54Ra6u3NEWTvD0BlrjrzteWyXLGmL+TAmMETb2oqbtSTGZR6keQ/cAevXjLxvGjMYtqAwnyxQuYb/TPhkJxmRXeyRDW3KwKqFdVprG2PDXymUcKzVGrJPsgliGUrSn4KpBEqRaFsQoL1va16VqXSUWl6itUpyE1w3x9B6uEH52R8LZL7qYonkQAhjWeEIgRWjt6tizqt07YhyVt/rsK1xfTv+f6HqR9cgi8UMZi7/KI/M473kVKkY0zDNR81SRQIBNEhHYLSVqyS7bSRkoh+XA4nKwUVhuEDfWIfbZKK+vKLZvn3cRDO/rE7zT8xkY8+2a6KfrFf5YZ0Rr61iK8NUJV2oviQGIATcLb8KJMvbhUZGg/HlvixXmNTIOb4rGNWkKe/jYRxqwihGbjRTvSYGr2rwpVXB4zQ9kEk6b/p4FAUG3Ar0Ic8IWw0o5JWRe4Trd7MWsG23+w2UhIb2cUvQfXOXXyzHWmrkFVdXgkIWo/OBOyteLD8HvXvf5IlnLFwF0baK4PxB4t1i0MbakLN19V1zofMn2oqsE6GBnpD7gcUfgQHYjvxmCiEB7+1GPlowuumafgVoO+MCUN+/2RdLl1tGapSmUgcNEg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UYmYKKnLU+JZGhKMDW3UXCKUDVDdFo336fcQFu/Oeq08WPwnuY11E5jaNdPIkcc1apHcrstWVJ2KHdTqE/wqsRkdns4MD97aZQEQYBqJRzq1/b2x5GAL9vi1I2SdpEtlCZro+vLOxb0nt2HoW7RJeEeYx4CoG55mr8ii9m+9Oiylwz/pXW0tzTLBqRm7t2NCxiLk20FSx0y2K9nLCnSmgfDXVSY5CKrx2LK739PbHDOeJdCwG9hFnIgzun5Jjozv3ykP+p6hZZvqF/n5VW7ht2Bf1BcLVjKTgZB70tvkNgGe6jhNS+xOFjAgZfxXIYdnJNpcmkqU5wGSxn3GsnpzWQhgwIrYrNM7jmV01o0S7g1Ut0M+rOPtgrLhxq6ED9LlB3zocZ3E3dW1JS5Vc+6H40xjk/wSCDwq2GgW4SqRyD4KSlV28VPISllGFprasypq
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 04:40:31.1088
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b932ce3f-262c-4ca0-e648-08dee098dee1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E83.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7637

misc_deregister() destroys the device but leaves miscdevice.this_device
pointing at the freed struct device. Clear it so any later check of
this_device, and a subsequent re-register, does not observe a stale
pointer. An upcoming change uses this_device to track whether /dev/hsmp is
registered across the shared ACPI sockets and relies on it being NULL after
deregister.

Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
 drivers/platform/x86/amd/hsmp/hsmp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index fd36c8f142c0..584fd9b1d31f 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -539,6 +539,7 @@ EXPORT_SYMBOL_NS_GPL(hsmp_misc_register, "AMD_HSMP");
 void hsmp_misc_deregister(void)
 {
 	misc_deregister(&hsmp_pdev.mdev);
+	hsmp_pdev.mdev.this_device = NULL;
 }
 EXPORT_SYMBOL_NS_GPL(hsmp_misc_deregister, "AMD_HSMP");
 
-- 
2.34.1

