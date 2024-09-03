Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2085.outbound.protection.outlook.com [40.107.244.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CA61D61A8
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Sep 2024 12:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725367151; cv=fail; b=og6zdzjrKn87O/INPgBXk4muH1x2eYi6TvGDhZLPsEIJ5ALGVZesz6Cqx8jacRWmWlMrUcWy7pSsldpUdojExAd8n9BdlWPK/UXbRKfJimAoUr1iezO+fJLn/ZHU4moI48JDnJ7QQWwk50wqq0KTdnK8B+NG3DwH93nqrVdddUg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725367151; c=relaxed/simple;
	bh=02gxiEnTghQn2MqVLTL9mPoirX9ox/CRt3sT0ErmD+w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZanyWH3IqJkIEaBm5JxHz3Q7O9x2ThRgaAOz0Ocx1QDDHTemay/6gLz9aRQhGokZpg2EnfdUozF7NKXyZMaMDkThP05H6EcCtYocG2GbwWhFylsb5DvbrXae956zcZV8y+hFqx3O1K9XvZmavIX2iahgAYkkgbhiOBn/KNOxLEI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Ho5un63V; arc=fail smtp.client-ip=40.107.244.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Ho5un63V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VMt9YiiGtn3uFjakhHWbj0qwCgJkqoETSAGbGrACYtZ77r8flK/mf6hX4Nb4cN7B/4ASq92pyppHBD28lMgc7XJwi9L7dwyv4KRVbkegMthGfFusyDTKdqapy6NXA8aA9Oq7KzD8xysroTg2Gnl4u4Ptdt7mdMMY+kO3ZudDXy4Yvj5C/buByKIGfcmDYtfLjRBkMA4VByNcxsWqnzH8KnBesw7nXwJdwCEfHD67vxi6zMtD5OhOupiy6CDmYAcLH+B/ydg1ZaFV73wUj+6H7VzHpXlxJOplsNi5JqI5TrmEX2Cl/vKnYECw4qFrSitWCAJpkMZ6mdpq/T2Ak42OWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nOY++L07b+vooMmv7+uuHkUo2kfkWwJMbYh1TI+Gykw=;
 b=OWxtWIb/iNbI7nxD0/yeAzYFuzNIxS2R6DPTLDwTNIgl5SNxRfEWXaWs9x7/Q2P9sCtw7rx/zuS0U7i5glU7iZ849rhmBN5B2PHud92tM2SCYs3AHIV5Woepf/yU3FOm2ZfTcR+LmAW1VxZhktwNQGYQO5d5TxX3CeuzJo2feE96BTfZrbJuWw5xZoy9m3KW2xZle5SuyZypWc+ujPe3ekVysaSMiWcbXE4Hl2R2pnNmK9M2E48sqktjlHBBTm1spAzIVQbu+NJY+K9pkTzxTzM6myboyMXL+tbn+38R2URkBzJ09F3/wKqAhDgjIPiwmKwOKaFH73Zv8bl+9e7J4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nOY++L07b+vooMmv7+uuHkUo2kfkWwJMbYh1TI+Gykw=;
 b=Ho5un63VK+7z4RB2xYJjeiXoyj9SMDPl/pa16hiDOZQWsALT8qyaUS6xUd/K9Fgljm1OSWyXOiBGLBxp8aqHq3b805k6wFOgtHso4PSDNl4p0ihWXTmAXDwl5t4q6CFOjDAjAunOXuEbEjXHJ+TN3gYsXad28/bF8V0jm4twGdU=
Received: from BN9PR03CA0332.namprd03.prod.outlook.com (2603:10b6:408:f6::7)
 by LV3PR12MB9188.namprd12.prod.outlook.com (2603:10b6:408:19b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Tue, 3 Sep
 2024 12:39:07 +0000
Received: from BL02EPF0002992B.namprd02.prod.outlook.com
 (2603:10b6:408:f6:cafe::39) by BN9PR03CA0332.outlook.office365.com
 (2603:10b6:408:f6::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27 via Frontend
 Transport; Tue, 3 Sep 2024 12:39:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0002992B.mail.protection.outlook.com (10.167.249.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Tue, 3 Sep 2024 12:39:07 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Sep
 2024 07:39:04 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v7 09/10] platform/x86/amd/hsmp: Use name space while exporting module symbols
Date: Tue, 3 Sep 2024 12:38:29 +0000
Message-ID: <20240903123830.2717196-9-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240903123830.2717196-1-suma.hegde@amd.com>
References: <20240903123830.2717196-1-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992B:EE_|LV3PR12MB9188:EE_
X-MS-Office365-Filtering-Correlation-Id: eef39271-277a-4d16-e711-08dccc1566da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TR18qbPT3xbj+B0UOoWhDwXOV0sRFHX0VbE/GecY1kqiJDivZi3jNL0SW+zb?=
 =?us-ascii?Q?LDwuXjIxry/9TsBnqJEon4NcwzPClgRnyhxSiHnO3bLt6Yz3zTevsJARFyA0?=
 =?us-ascii?Q?RzHMV+VBVUC4QAHSxo5OTywgDoaXxsh94IVAbi9gxbBLrD13O1h037kCPfV7?=
 =?us-ascii?Q?adC08CCh6SwslY9gUDyqerJDPBHtM5UqmhBVdE28KUmNTxfGVyfuY34snSVV?=
 =?us-ascii?Q?RAgsb3u7mkj+OksGDP1X5MYDHl6/aTB9ksCIE80gk3jd6YisHXhmiAcgq6NR?=
 =?us-ascii?Q?k3JQl8epGx4/IAJ1sbt72MdUxHgEqvG3PLbxi02nWytNJELwPwjEMkAliQQG?=
 =?us-ascii?Q?RT7zxL/HXxyEjBNb9WdRJg1ItsrT0xP/gq7JAvXfuIPavTlLXj3pV0wd/TN/?=
 =?us-ascii?Q?AXl8kgLM16Xwqsk/iFk5UO49HGYHwYuKhjos5KMMqJsayhbkyYFm/NFZ3EUV?=
 =?us-ascii?Q?DN1ZA5nkWvMojS3cwOiOlnRelRPQzTtd12l3hJ+0wyutKne8AXwOK42YN23n?=
 =?us-ascii?Q?bIHDdmK57CI2m/IclvNUuRyivf0mzTRFzSp5109Zwyo7sFckA6ioNTHDZ9yc?=
 =?us-ascii?Q?G/YvHbCNQxEyFKPsozTPfYOnJ+KknN2OS+rNkm3dzXz4dGdvvhjzEC+VmdvF?=
 =?us-ascii?Q?1jYGvBkM+b9y5PKCdGmCdljVcJOvj3dD0Ecnyh5/vNRLK6jtoKjKlwFyK6/H?=
 =?us-ascii?Q?jjekmhjrqDwFI9Ox6aLTAxipsjCK21HrTQv6jV8GHrBQDcVVxKLDKsCOMRJ2?=
 =?us-ascii?Q?vYbM258O9uCIztwkKgN/8J0a0tkMe7Wz1nLrh7VRAxVDp9LnOA4NuYOkaFlQ?=
 =?us-ascii?Q?BnWLjSnQn8mEQz695wIL8ixNgn5IfAyi8TUpRoJdFMi+FH2XFh0MgRpCeN7/?=
 =?us-ascii?Q?9xuIk+9yTLlC0wRKhf5M9xbY8bceAKBCUqfZ99p9DBsEAxorth4z0sddF67p?=
 =?us-ascii?Q?PIcItpvZo3uHShyO/BjR9KA6tDkq9v0iMU2ct+l7mWFMCVLnsw5evozZY740?=
 =?us-ascii?Q?IanALiJpzk/KxA7y1pr7Kh06ZnLiP8syPDtEp3sZyzYNBOkOwQclcRi52VYo?=
 =?us-ascii?Q?4Hj920kVbGoa0vzz6GglNN7thVh6zsSgqpN7DkdfA2ld7dbYiTeowkavrKLV?=
 =?us-ascii?Q?nyzRYcWMwIijc85HjWJB87N3a3dtr824U+e8z8jlnTWK1MoCbZXBdimVzITN?=
 =?us-ascii?Q?XOnmGLaT2N7KbvW8tERbaGKCfL7eSn1RlVKUWZ6btzYgN24jq8N2j4mf3mDp?=
 =?us-ascii?Q?L2UhCnSTI+AdKgHA0GYlKbgcyW8j97ec6bmrL8J46EIwzdpAaORDWibmdmfl?=
 =?us-ascii?Q?s6xalzTcOUQEeDDqrkyrJpPrOkYE8GTfe4UVdNt4WR1g4ENNsTfeG0yHXzyi?=
 =?us-ascii?Q?cdwOTgTXuivHceLSDYXREa0kn+bipVefHnEng6/kdqLG8+gv4gXnoFyCMH0C?=
 =?us-ascii?Q?ultAgrocqBhApc05r4lo+bzdwZJwJPA0?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 12:39:07.0988
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eef39271-277a-4d16-e711-08dccc1566da
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9188

hsmp_send_message() is exported with AMD_HSMP name space.
The other modules who would like to use this symbol,
need to import AMD_HSMP namespace using MODULE_IMPORT_NS()
to get away with warning.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
Changes since v6:
None

Changes since v5:
None

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

