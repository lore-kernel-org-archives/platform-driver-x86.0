Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2074.outbound.protection.outlook.com [40.107.236.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DE626C39F
	for <platform-driver-x86@vger.kernel.org>; Fri,  9 May 2025 07:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746775689; cv=fail; b=ekuWuSdFadW6a488ovlthsS6eJDqwYWabbw6Ra28T6TxyUR7KWV3qncCKd+8T+mpf/7o9VZailEqrxayHbdm8FI4FO2U6me37NbBpXdWl6pyiqCiV3+VS4/UveCRfKNIscU9xKENu0/vIUvjdXC16qQgAv51YNdtljSRUX6D0b8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746775689; c=relaxed/simple;
	bh=rOB9D/f6enQJlv+AZayh5NppCuLQnD4EYKW9hW2eCqU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qqeP3mbTh5aeoSTjof6IcxuvJIzRonU0GPUPmQB41quAR8F5x+JTtioTKzEsL+hw/CDIYjZ6fCanM/flB01h9T2kRH3w7pa0L1qn2zSHX+lMk7Hn1svlsyQe5xC3bvlrAqdqSvOsszaWHwOTj1ri+qoOc0VTM7LtiR9rZRC9uog=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=fRsJ9sU7; arc=fail smtp.client-ip=40.107.236.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="fRsJ9sU7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bJACaPKOlNZf6/PJf2SRtsGxh8UMwJ/XdElnZqVJ+cVafpRu/V94vksD86munmWxJjDW5Qy2qlTxNcvtw5GJjSlRJ7TR3JW9Y2TnJqHOT6meppbVjisRADWXMLrhSXQdc2vWzls/a3eqWqNeh6ZSMuirYAkJgcxDrWhei2pVZmEeIuVso/g4AvPTq22gSriwpybzCFMWLW0RwOqNmyQTaes/fybvEuHajFk1m9EDRyJ5xtp8UuTJ0njEENhs2wvPwjBWiyI0smlfxdOSEU+jO0oDmWm7WwouOuCY1ZDP712UCgYriBCPiKs/9MA0g+5YC1mBNPtxeg72NuXIlqPgIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cyWjBSEGoErmhMrwv4T2pwcRZiAELf2NYZXxJQTi25k=;
 b=pU46KhrEEC9u7ZGYgKKLMnO6Hozs90Sm5LHlF+4HadxrSPv/06hrkQkqyjshha/kkDkQZXU8rPJthGFBV96PBnPLpTmUt8tuz1CSxRVEH89a52V5n0fShIMFsfjUC22jm45XRsrVtYVqEQIULfy675JkBSz3l/64J3011OBPQndDkXrxPbQstGuwW6RVmKiN78v1ek2nk9yw0VInR1jH3qPj4VDf4MhgIRgM3ejgI5hsd9D8twZDzdchAy7FMZaUk45dTwVOSkT7lxNlejQGnWDKKiwbnxCvFuLhcDOFSdzSodhTjMH6VrQpJrbNFLfGEpkuQ7KjMQaL7brcHvcpKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cyWjBSEGoErmhMrwv4T2pwcRZiAELf2NYZXxJQTi25k=;
 b=fRsJ9sU7iYNg4oK0tt+7Sd/jNhBJGCCIjPFX4sYfepMU37EcuXeWyS4pTBWG+SyH/Qrqh/hFCmAAMXBcRSPvW52W8Xxd1MvEZe+3yp0OokamgA/ulWayV0gtFVvDKPdbiFLVSujzOj/WaDSTrVq3HFpHCKBo0uDJBIqp6+zHKOA=
Received: from CH0PR04CA0023.namprd04.prod.outlook.com (2603:10b6:610:76::28)
 by DS2PR12MB9568.namprd12.prod.outlook.com (2603:10b6:8:27c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.25; Fri, 9 May
 2025 07:27:59 +0000
Received: from CH1PEPF0000A34B.namprd04.prod.outlook.com
 (2603:10b6:610:76:cafe::7e) by CH0PR04CA0023.outlook.office365.com
 (2603:10b6:610:76::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.29 via Frontend Transport; Fri,
 9 May 2025 07:27:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A34B.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Fri, 9 May 2025 07:27:59 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 9 May
 2025 02:27:56 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, <Yijun.Shen@dell.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH 08/10] platform/x86/amd/pmf: Preserve custom BIOS inputs for evaluating the policies
Date: Fri, 9 May 2025 12:56:52 +0530
Message-ID: <20250509072654.713629-9-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250509072654.713629-1-Shyam-sundar.S-k@amd.com>
References: <20250509072654.713629-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34B:EE_|DS2PR12MB9568:EE_
X-MS-Office365-Filtering-Correlation-Id: d0675b1f-5e72-4520-f2bb-08dd8ecb0662
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ukleJW137JQMH3OMblHMu9U+VxpFppZMFMGidEaw0FpQWqq7VUjEDhTPx9/a?=
 =?us-ascii?Q?cUl57DroNtZAMzk3xKucQwMp2doRDOtC69WKSqigoIplVqpm3qow0UuCSKq0?=
 =?us-ascii?Q?iSIRVK+1FUhovtSLIX1h78CpryK+EnB7I/trM56jeIzzylytsCGzKuWzr1hE?=
 =?us-ascii?Q?+T5hyrUMcdyWjlWWGJO0QI0tC+ADY+va7PsB8bk9U29LJzNOfXbxWUFqhb8x?=
 =?us-ascii?Q?zy7CAPXr65lmRZXc435d0fMIknf9811UPUYNzLieUuLoY2nrTRVmK4ZYvUR4?=
 =?us-ascii?Q?6f/WxrxkBl99DEV8mwXZEsE1b0HaVJ48JY+4YiiNfDqnov+PjFkG1R75OwBE?=
 =?us-ascii?Q?u3n2r8/xVN6xi0RykkkP/rj+CRrRyRvVvZ8bjY7b3uqIS25mou2uQHBjhHr7?=
 =?us-ascii?Q?t2M2uS+8HXAfayfmGs70PAO1Q1cKtg0ftPq+00QKstTzaAprWL2MZ3K5l2uB?=
 =?us-ascii?Q?rT5t7aIeWkx1J8f5AZTt5vlqBJgeb4LsT68vWwtMn4JK86MsQQKoZ8j3D96l?=
 =?us-ascii?Q?nYwyXXXnUzId4PLCgL/K/Rw8GOveGMKfRdZ8q+YdQ2Fe8qry5kkHyktCMq9L?=
 =?us-ascii?Q?B1Mcl/ZqVlqL9vXuAxKibHjI/FNGiB31Nt2RXkvdviKg0Z1u2yluIFQe47MX?=
 =?us-ascii?Q?z63Ak1UxDV/xPXSLMdu0goU0bloyJ1XlSSJ+5kknq7UgSckcxutcJDDsdAwZ?=
 =?us-ascii?Q?L2052BBnmJS3OvmjF9Wy0FypZ+0niVSouw2Ly07hoGRUYJiw8lEj1yyQvjrv?=
 =?us-ascii?Q?6spnOyI1sJ8iyhIYWeQ/NpO3OeiaCwlk4uCv5kTlDiIUiaYKRcznGdsNO3Yc?=
 =?us-ascii?Q?YqhUEFg/AkmgLJqjQ2Ey36hq/1dJzcOtCiy9J5BV2wT0lLHL/go622kfs9qH?=
 =?us-ascii?Q?J1DmReRhTeLywzKI+Ufjsy4EEnBBu6WjiP/GUTVcPrjNRZEo/qQsxFpHyiUf?=
 =?us-ascii?Q?IdJTFxa+09hplKAzBrC0TZ5tKi6F5vrM2uGF4yszjfvejYMkAdOAk1U9YhDn?=
 =?us-ascii?Q?gk7N/Ww/90Gglo96dwlYzXgx0Hqoy2/W+Il07yPYsdCIfyqIe4elwVf5GZo6?=
 =?us-ascii?Q?I84PcdGysRFPrG5UTb+ACVIxnNLj9wAkROTMAa/i4230pNQEzD3AZhnkEb6a?=
 =?us-ascii?Q?NEpNqorolUzlApvZ8RRFjOoNq1dH6OirpP+yy7zsmu/dG0Aas/8KCCNQ24qe?=
 =?us-ascii?Q?XKfGdoAIX64Z6jScMMVg/DmqKk6Fs8Q9NtiwRbck4oftjZy0dvGVT/8LQDEF?=
 =?us-ascii?Q?VbxjzUZXC4dQTTh5SVU7/Wt/Oly2KYtSjjK6H3I0HE44vJ3MZwGEeJulmvQy?=
 =?us-ascii?Q?EDT/HDXwzDGDDPgN4Ydae2r5Zn6CVTLpQ0Z9Fb5w8fiX6rfDsXjt/oaCO3M1?=
 =?us-ascii?Q?5ckwmtaoDBDGBvl9idykG6szpLSgghyBPuPjnSw6hmPgJhq7gUV2BoARAUIN?=
 =?us-ascii?Q?VlusUW0DN32C/+U/gwxaA+kz1i7UrXzZZWbv3ygsuIPasvPcU3cp9+2KCwkb?=
 =?us-ascii?Q?SqeGRKqTkas+YZv0g4YWfF9qXaqsteBqbA+P?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 07:27:59.2564
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0675b1f-5e72-4520-f2bb-08dd8ecb0662
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9568

The current code fails to send multiple BIOS input data to the PMF-TA
for policy condition evaluation. Only the most recent BIOS input data is
properly sent to the PMF-TA, while previous inputs are overwritten with
the zeros.

To address this issue, the BIOS input data should be stored and passed on
to the PMF-TA.

Cc: Yijun Shen <Yijun.Shen@dell.com>
Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/pmf.h | 5 +++++
 drivers/platform/x86/amd/pmf/spc.c | 8 +++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index de095b434d32..d9e6467be852 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -353,6 +353,10 @@ enum power_modes_v2 {
 	POWER_MODE_V2_MAX,
 };
 
+struct pmf_bios_inputs_prev {
+	u32 custom_bios_inputs[CUSTOM_BIOS_INPUT_MAX];
+};
+
 struct amd_pmf_dev {
 	void __iomem *regbase;
 	void __iomem *smu_virt_addr;
@@ -399,6 +403,7 @@ struct amd_pmf_dev {
 	struct mutex cb_mutex;
 	u32 notifications;
 	struct apmf_sbios_req_v1 req1;
+	struct pmf_bios_inputs_prev cb_prev; /* To preserve custom BIOS inputs */
 };
 
 struct apmf_sps_prop_granular_v2 {
diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index 0cd50d342b11..8fd745598ad3 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -113,8 +113,10 @@ static void amd_pmf_update_bios_inputs(struct amd_pmf_dev *pdev, u32 *bios_input
 	int i;
 
 	for (i = 0; i < CUSTOM_BIOS_INPUT_MAX; i++) {
-		if (pending_req & inputs[i].bit_mask)
+		if (pending_req & inputs[i].bit_mask) {
 			*bios_inputs[i] = custom_policy[i];
+			pdev->cb_prev.custom_bios_inputs[i] = custom_policy[i];
+		}
 	}
 }
 
@@ -125,6 +127,10 @@ static void amd_pmf_get_custom_bios_inputs(struct amd_pmf_dev *pdev,
 		&in->ev_info.bios_input3, &in->ev_info.bios_input4, &in->ev_info.bios_input5,
 		&in->ev_info.bios_input6, &in->ev_info.bios_input7, &in->ev_info.bios_input8,
 		&in->ev_info.bios_input9, &in->ev_info.bios_input10};
+	int i;
+
+	for (i = 0; i < CUSTOM_BIOS_INPUT_MAX; i++)
+		*bios_inputs[i] = pdev->cb_prev.custom_bios_inputs[i];
 
 	if (!(pdev->req.pending_req || pdev->req1.pending_req))
 		return;
-- 
2.34.1

