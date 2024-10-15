Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2074.outbound.protection.outlook.com [40.107.237.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC628146D6B
	for <platform-driver-x86@vger.kernel.org>; Tue, 15 Oct 2024 10:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728988265; cv=fail; b=sE2TEGojuL5yZF/WmbUR6qQQhSncbZeStTJhxLc68Z7T/SSyaCBaXzJwmKzg3be0mWVTYGfdePJo+DC0PVQR9xHXM72bt28Eiz/sRiD8D7D6exUNke+sGYSjHcXOqMciezcUHMrHztnQPG6aeZwUznI9NNdWMNq0hLD7Q9HgX7E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728988265; c=relaxed/simple;
	bh=9XZgT7lrX7GYQbnx+RUpjcJslSwCzl+nfM8cxlbVwEw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pCJgIUgOYBocQbwVC9eP9TLiyooYaMDei+RcRRyw7zdBirJKGqetARAl84gBkfAnntHtUHtFZpc4P5BjY/4LidWz/zRqirSYns+r3DCmHbpexbr1dWVs0hon4rR+uT7ws1hzn/qnVZ1tU5gfOGO0mKltxQR1mZj1FoksWqs0i1E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=bGUvEXiT; arc=fail smtp.client-ip=40.107.237.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="bGUvEXiT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qsxdsiY4MsWNN3fKVdk/tsNL7vBeuakulcdaMGVkQkAJM0Q6AIF8PIOKxNdc/N4mi6g4U+ba8t7Z/w0MH7i8CiBoEkggcrgqmSfnd7Y7TBSpM4xoKzmjFoLj72W84w6+6pqNnGnmeW4oWE5BKd8tufNnh0g9om9yD1c5ntM1h+aA6FS+Et0E+XnGLORKbqlEjXD57HWnGhFxz4QpGtDGk+yphXtZ+OLrv2Xy+BoWOFqguRms2qVh3+RGxa/R6cfLVJ4iva0yE9pIQ75CED0xyJdn5lOlOb3x+4xndYP3wPZ4W0RCGpK9MpERgUHC757UIxRaz8lWWuSMDmvKe1PuFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RFJLqUyXPIYlgDEsXzlB+w1N1ycMU2xIqLsVNosRwVA=;
 b=zH5iToBloVwDLKvzuVAgR0nNL547Xh4dvX+DmoC88SerV+uOl6Fp+eDXefjDphb4I7Oz5I6ELgic2aGO5+hd6cdeWQ8AxFBqcG6naVUT5bo/yKbi32D4AFRV/oFOTZbHuH6SNEtrg4mA3pzJe0UEb5zkren0e/lawKLLpbgM3IPCRX24w9f1/7fMBfTFig3BDx8OhcASDRrkCG46VS0EGBt3TxKXbevjNDqKCZElOAb3XYbaoqaFmWU7f2lewPqhynxT54d9azFm1/GHgJVHihkEcDR0OXX5s4H/85J6BQlW0cy36mGz+2+SOEnMJSxZllF9cTgdvsrqZpYH7LA3gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RFJLqUyXPIYlgDEsXzlB+w1N1ycMU2xIqLsVNosRwVA=;
 b=bGUvEXiTIvmA7brjIXpAsSNBkYVRtSdejgn++n5N0qVI22iUmBhmqeMJWjWfOS2c0mCOWHhKIqtWvx9pMV6vS2USxNJ52/xXONDugRrJiJp629uRW0eMnK/jV7FoK4YGn8x/JobQ7nyKtKZ+dH7Io3wK1HyH7A1unzGGShT9KVg=
Received: from SA0PR11CA0182.namprd11.prod.outlook.com (2603:10b6:806:1bc::7)
 by IA1PR12MB8333.namprd12.prod.outlook.com (2603:10b6:208:3fe::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Tue, 15 Oct
 2024 10:30:57 +0000
Received: from SN1PEPF0002636A.namprd02.prod.outlook.com
 (2603:10b6:806:1bc:cafe::37) by SA0PR11CA0182.outlook.office365.com
 (2603:10b6:806:1bc::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27 via Frontend
 Transport; Tue, 15 Oct 2024 10:30:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002636A.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8069.17 via Frontend Transport; Tue, 15 Oct 2024 10:30:57 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Oct
 2024 05:30:54 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 3/5] MAINTAINERS: Change AMD PMF driver status to "Supported"
Date: Tue, 15 Oct 2024 16:00:19 +0530
Message-ID: <20241015103021.1843019-4-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241015103021.1843019-1-Shyam-sundar.S-k@amd.com>
References: <20241015103021.1843019-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636A:EE_|IA1PR12MB8333:EE_
X-MS-Office365-Filtering-Correlation-Id: 65337d34-1ad6-4aca-61be-08dced0474ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zmAKY7tmVlHAzbpVIfifg8bpTFpEl0e9VKEiOcGAQz5v7Zm8W6lWKxs2PEbc?=
 =?us-ascii?Q?VuqfV+5Pr42J2bLQ7la563x0auFI/v4p5q2FEl/vdmDcJddEFhU0bIv/U3BO?=
 =?us-ascii?Q?glxiNeKuvpNA6FEiV20tniereccRW17NghGhOkP6MmAJzswo7VGsWQPGuEBa?=
 =?us-ascii?Q?qq7xYHoxn7a8Ka6IUXa9p/Sd58Z1xA34mZPwbnqPZPMVMyy/JE9ddejj04E+?=
 =?us-ascii?Q?Hm5ixV515YBl2udSWeYXw2Q6UNpsQ01c1ibBNzh16PacHK31Elj6hSqDEf9q?=
 =?us-ascii?Q?OUdOYUV+KuVwuOG8MkLzTmzTfs8Bemcaq82CZ+uC+jxpCPMF4jXY2dvEByUx?=
 =?us-ascii?Q?FnMouTRPgUJ9/dbywSefxcFeKkklTTC17JgflOLJPV/IED8NjXNr1rFW6b4I?=
 =?us-ascii?Q?45n+wiUHK/j5uZ/BvSmbYW8e/THal+nisN+rBD8S3XAStW8I11DRVY/EWcPU?=
 =?us-ascii?Q?ACuQPlxnRNMccSmT33xr7KRiqxNBvmd9Chfi3S4rWB+ZwNSm6bs2B3wgpPwk?=
 =?us-ascii?Q?US17Voikwq0rTuE3M7boHIStQivvhq7Fxno4zAeAKjW5zSQeEsFhbekNhQ8z?=
 =?us-ascii?Q?nEiK0K9642AjqxH16z1PnbDIgyTw52awPqiOBuu3r9G1jxPfmMy6ubnHztQq?=
 =?us-ascii?Q?ULqll3++wpF53RfocuMLM4hpsJO+kQvM2I9vgrKDE+Giy0+zi1GqFG08eu+p?=
 =?us-ascii?Q?pOXr5mBne0j1hW2iin2R/5ypTyPn7QWn7Cy6I7Ef6Zf6UMeCeaDs+HGbDg5B?=
 =?us-ascii?Q?thUT4IQEKsondXD35vNGtJQW7046Ga1anbSeFn2x6JYQ4W7EX5ivDEqAJEo3?=
 =?us-ascii?Q?AUNWAD9rVNmudNoMq+0Gk/d4TDR3VNoQrBaiAE+TcUuPWRntfyzn8jrcPjBU?=
 =?us-ascii?Q?pLM4St4atl4YjP5Tcf4tYpxQsaA1Wi00HCvivc5+bqpv61Ow94HSevDYg3GI?=
 =?us-ascii?Q?Hbce8U5BEDHClc71AKr6Moj3VNRNSfDNt3GE3mPHkYckhyeMF45Z1fTS2Jfa?=
 =?us-ascii?Q?QRrrM9F08AABjR4m2l7QV/ZzSc9GLvSlqpd1/t9SgR0ahJE9LV+yjvz7QeWv?=
 =?us-ascii?Q?L0mZ4f7ncmZraMxYsH7fiFcErqpsYEHTfmUEcjfhRVbrizO0PLY7+IFcjfZn?=
 =?us-ascii?Q?U3QoIlAX8stHX48G2Jb2STJrPZasXlPWpdRowLExgK0Ox6EyebIvsJajIt0w?=
 =?us-ascii?Q?/1/uEui4m9T6hz7T6yuc0BezvahDX+L3v0dLlVz/p3BxFjp8RbajiJpLCh/H?=
 =?us-ascii?Q?XvS7AxISvUDhoIJDBVvfHRno2QlVMvSX/seQiUcP2LTNdJRz5phro7EL06qu?=
 =?us-ascii?Q?1Q0z68pSeeGLcjCgcwdQOVfgYwgBTYhk2D6jNdKUQ3nODymY/BxlFxjCntQ2?=
 =?us-ascii?Q?9OaB+LvRxMAfe+KcbkjMwWqOznlR?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 10:30:57.4164
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65337d34-1ad6-4aca-61be-08dced0474ce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8333

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

