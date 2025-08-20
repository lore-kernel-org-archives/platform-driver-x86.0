Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2047.outbound.protection.outlook.com [40.107.243.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F3B2E7179
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 Aug 2025 11:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755690689; cv=fail; b=d0TjvFnYUrEiTaq1IQE7jnWuuynAWv8+Ta2QO2KfYtgkxeeR0LN1TQ0cZWhNFMK38s7K7jDIHLo99h7saDWT+m/cuEgltywniV1//pRgQvWTmNle5blrJRRWMK84elJ9nMkPh0IDsEx3VVJT6LAaDZ+vtjiQG9qpKqEqAAgsVWc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755690689; c=relaxed/simple;
	bh=KLPCOlO330i7NmUKOLJ/LYsYApnqicFxJbYoopdNvZ4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z3rraiExyO23qszomnYVCxiXkDnNr2ptlUZSWZrRZoIir1iGx2FrwfPZ0mGlyVnADGREhQUhE/UnrtQBeFGOXP8fsQPobWCfL8vUKki11negYfqtvJV0Lt23Cmf/JIUlS7GtCGKB0XkYEhFXLvvMV913EZu01o2DulhxiCXWUO8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=r3I8lDVi; arc=fail smtp.client-ip=40.107.243.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="r3I8lDVi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YWlnjhEwG4ID2s1/Vx1CPpmtYm0hNmE6r1x/5Uz1HdJWA0z6N0t8M681j9z+Tb67t4ofTz1Zvl1OwB3scbY6ebwXzldDpPKqhs+k5IYdOyQYFFfRyfpbhxdz/Cj9U44osQhdDGqIL03N0pwNBocPkm5g13Oz+akSWqYCqYFTXvrwymziVnzW9fTxStwVO2kn63kaxFXFG9g3674pnTdIjsPoLx4dn6asQLwSSHCHS+LZ47Cvk3YlRh2OL9WiXHn8rtjNQQOrSzXw7/PQtqYs49hmUO0pITVm+rbI6mUPXKkTvslv28X8a5QjnvRduDKvb+Ww3Xl9eTrtG9vn8l+Ayg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jGx+CkAnOqhXnuvQ/R9Iwrau7HE34mVV7UAhoT+9qgA=;
 b=e1c+zk4MjLLUHY1XKT3+OnydtJdQVafRnzGJr/z72lFclhDjRnt8jfnRMsNU2cb5iiYrfyVbE4swwDBed5PC76SaTMIWIwhTMC+V6/p6F0Wk3tz8w6uCmsvs12nKhCnu4dbIwtEnxT37MYK9swwbEmDc/83+kv/869V+h6SthG+QPq3CrG/kvcBd9eLniBo2cOZbsYZfZipR6vcmbqYa1W+LpyeUgHb0DpGILdA95mt5Vi127cUbiuRbX1xQMWpRSUYFb4LbZFNog7SNlNmytVsi7YrT8vhmZpnm1/vB3me3veWo9ttVpc89TOlo8V0yWs1jcn+gMErVM4iNqyDfMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jGx+CkAnOqhXnuvQ/R9Iwrau7HE34mVV7UAhoT+9qgA=;
 b=r3I8lDVixtkwhbvUE+geyejBm1jUzR6b0Tn3hDCKojNAQC0vOTOcT1lh1cZtT4NG6a+J/r1Kkuyz0tiQLbTepraknGKZsxr8/O2IZqyVz8++mJbnypYctF+5PYicW2vE8KApCDAVSyyZAKWJyiit89MzH0v0B1n5w1b0WtxrT74=
Received: from BL1PR13CA0384.namprd13.prod.outlook.com (2603:10b6:208:2c0::29)
 by PH0PR12MB5680.namprd12.prod.outlook.com (2603:10b6:510:146::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Wed, 20 Aug
 2025 11:51:24 +0000
Received: from BL6PEPF00022572.namprd02.prod.outlook.com
 (2603:10b6:208:2c0:cafe::e4) by BL1PR13CA0384.outlook.office365.com
 (2603:10b6:208:2c0::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.12 via Frontend Transport; Wed,
 20 Aug 2025 11:51:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00022572.mail.protection.outlook.com (10.167.249.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Wed, 20 Aug 2025 11:51:24 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 20 Aug
 2025 06:51:21 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, <Yijun.Shen@dell.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>, Yijun Shen <Yijun.Shen@Dell.com>
Subject: [PATCH v4 4/9] platform/x86/amd/pmf: Update ta_pmf_action structure member
Date: Wed, 20 Aug 2025 17:20:06 +0530
Message-ID: <20250820115011.1448026-5-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250820115011.1448026-1-Shyam-sundar.S-k@amd.com>
References: <20250820115011.1448026-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00022572:EE_|PH0PR12MB5680:EE_
X-MS-Office365-Filtering-Correlation-Id: be7bdde0-f849-4274-c1a1-08dddfdfe376
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xIk6k+V29KM+3iffBLASo/RpZZLbuLJ1XWuXejmuMb4ZftkqcCEuiI3OMFTN?=
 =?us-ascii?Q?eQf+McnECKDI029W7TpnklAfUVTem1ikiMXJFv44KCnC2QwuH5gy155Bh6hM?=
 =?us-ascii?Q?yTddJbSPoXgYirzzDVGNW11KFZBbmhNr8roToRtvIVt6y8h2X33pwp3DeD4f?=
 =?us-ascii?Q?u4hJH0ZhsNviB6V9HOdjz+OOojRBt4OE6TZg+SX5IC9PCb59QQspcu4vP9Mn?=
 =?us-ascii?Q?JH2zenpKlZ/1RdkWoivm5g5f2tDnVX+mC9eJWvionxxJbkYx6tfptA+Nn5rE?=
 =?us-ascii?Q?e2sMZAGvucLKmnYljO4BB2JUNYcF5hU3Nzo1FkqrP19d822Cg7lRb1WNJuDR?=
 =?us-ascii?Q?cinjzZvmrHR9rPVZT3yzO+ATYYACgyIhteJerzYp9Y4IC5WlEy3KsQencS8+?=
 =?us-ascii?Q?HGxsJmzjjvbiYCrvSPt6mqr5xKSaDtEGGXTrC1UW2HWmZ2DQucC9hTwAcW2H?=
 =?us-ascii?Q?gTkPlalljtxSoMgWL3A2BWqsp3AR6qQ60xzms7TcaXG4aDHY8BPggln1dVug?=
 =?us-ascii?Q?wL3LKeqTI+TvMI4M/rwYmOUArXL6zZC91dueLt5VkedMpXfpsCstghHrTtcc?=
 =?us-ascii?Q?i1epSF9WZ/LULr1J/VRJwkTuVn38f9+vSB3nHokvL+HBhbK5RkHiZq5BD99h?=
 =?us-ascii?Q?R2JhjYH/vd1exqMVXRQ9cnkPtqU0VbHIpMN86RIvDUXaP3Yczyo/N8RB7VXv?=
 =?us-ascii?Q?LPWzeYxtE9JMvZ/bFobR7FcsnfsY3gURK0h5NvsilowXPcTNGkRz3siC7BA+?=
 =?us-ascii?Q?q01kiN7AWlnRY7B/L0WiCXywzTpZ7HeGnLy9Q1jmLZo+dfUouyc5xbD+QhzH?=
 =?us-ascii?Q?Gt4cuXMHqLY/J2WHMKuLs7zUygQljtihtDUOPleSVromJZ53kfOfOfcDpfNV?=
 =?us-ascii?Q?DybUXo6iAmgXjoaUCfCsHNcYElT7D1Ro6NW2sAcT7S27xII0baGJMri7xV7f?=
 =?us-ascii?Q?SR90wTZREMsocDoZ8d2c0gWCzvKrst1uBKFH05AcYEU1AgeHrhfF3uNEshSF?=
 =?us-ascii?Q?ObSyz2u6WR0QB5XpkMSoWwvT9Ip+pZ7+kqhrycwYrz7zVcDkv/TEuKd7g6Bh?=
 =?us-ascii?Q?0SbqzF3fx1Re3fjo4ZgwgjA8DYNGVo1u15r9KoBJo6g0BCiPdbrZC6rXiwuz?=
 =?us-ascii?Q?dsosetbyfY5AxR8DU2YQmeKWsc6v9Us6pI7z43hzw8d29IQ8o8gykHPR9Kqn?=
 =?us-ascii?Q?4xjDw9MAT5lJufccG448cf38BcdmCCA0YI9/ICo1FXUNsaXLwAiDTZmoqFJv?=
 =?us-ascii?Q?TE4i2DbmDY5RiwZfSE2oPXO/IZfcfpYEjhMrl8iPmg5jixnr0FNmuYOtcOte?=
 =?us-ascii?Q?oTydbPhuFbZJclGFz6MR04ICIS5oy5Qwf9+zJExdMdxP646PVSKjeTh0hS+6?=
 =?us-ascii?Q?diE5hBShdoNrdpn/OJd26G36W8FVqvkZENb7EGZrf8PGtkMqY6JUAe5nzdIN?=
 =?us-ascii?Q?fnYqYIILy2iNxAbv6TThJQhiHToyTuNfLQS5Ta6xfJG2VFFjDg0LSOaasaFC?=
 =?us-ascii?Q?9ejtQhc/3MeE1xL4g19JSBRZ9vRUhHugJmLa?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 11:51:24.2951
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be7bdde0-f849-4274-c1a1-08dddfdfe376
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022572.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5680

The latest PMF TA has been updated with the additional structure members
for internal evaluation. Since this same structure is utilized in the
driver, it also needs to be updated on the driver side. Otherwise, there
will be a mismatch in the byte sizes when copying data from shared memory.

Suggested-by: Yijun Shen <Yijun.Shen@dell.com>
Tested-by: Yijun Shen <Yijun.Shen@Dell.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/pmf.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 2fcdc2493552..f5e874b10f0f 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -750,6 +750,7 @@ struct ta_pmf_enact_table {
 struct ta_pmf_action {
 	u32 action_index;
 	u32 value;
+	u32 spl_arg;
 };
 
 /* Output actions from TA */
-- 
2.34.1

