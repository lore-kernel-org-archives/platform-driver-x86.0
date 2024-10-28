Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2047.outbound.protection.outlook.com [40.107.92.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36905190057
	for <platform-driver-x86@vger.kernel.org>; Mon, 28 Oct 2024 07:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730099123; cv=fail; b=erwc/novHl69dH/2fSa+plqi+9GhXvGVlwXFWe8Z7ykDUeI3E0sLCHUEHjT41hWR80WVF7CJIbESnWy+xQ7nj/YfvOjvhJ7on0MnysikFZRw2OBVH2vb6A9GQ8VjB3JnaS0PcvHRJKfFP8tpP+ao8c+AAaS9M6rXP5gHygQ5oY0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730099123; c=relaxed/simple;
	bh=fLnIMAbcUd1Hw1EjuUHh8aKVveKCBUbXO0xe72S1Sso=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fiGSTs/ss8ZrBz4LK6Q+epHcO2Ftkt8m5Xd/ljNFcpmZrCpMrkWUb8WetUsHctHWaUUB+AMLtcj7QRAinKBAIjisgkJ/1z3KMuIBjg8uFwSrI/XNkUcledz7BNvHxOgWRMEzH2Zcln+Xd11GVlbfPkkVzTYNtD81a222isWDebA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=CtXYsdRu; arc=fail smtp.client-ip=40.107.92.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="CtXYsdRu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ax2K0rr7p9259bMfm6O+spZ5hRAd6JvwnkshuOqZB6yI5FOci2zkUJcOHCDaZzF81rF24JpgXuWEby+VPq+mcjmaqs0sr69kMob00qJijyJVHPBUqOZParPanKcCKsBp3xYwVMvdhxjEHO/mK+coASqKhk1rELEXk8S+Yz2z3iEK1J5Qef2ZzktvN/g7hJxkssv5sH+kFhFHr/Dvbh6abvLbGH8WJQbDJjgDkxS8IxHj5Od2JVmvQifQ+groUgGyCxYa7Ov7/dwh+cDVMUQ2KjvA1XwAHW0ZUPRf9SXHYBkXDGtbAd2um2Zp29Gi5hBT4i6+ZqtsUUa6ezLvzlAgCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WcHHFz65/QoGJq5c4vlWHMrSc+XpxWUoTdYf+CLfDb4=;
 b=ucd8p1cHqodnAWysG3mLjrXGBJU5pBsdDq08FiMwFF5mLs6Rc/hS2DEW7IJ0AP8bywlp/UMAndCM5Xmib4B77WtgbbtvINYQYybworPrdaC8SCEa0kSvLLhCYKP+ziF0vKOXKsfYdnFKNR1m5vceKfHvS50QojhOgjyBc94qph01j9QCPANNG3Nguen6PaT09vBn6ZzJVJGsFmnrrV+ri/C78zb43RxxUWxSvEByu0Y3N2gRXNShuTFQsyoq3WTN5cUAYLPGWIWQYmfPlHrd6mKo0ugvccyka0rjFEBkVQ/Gbm4OXXJkwrzV/ApyLlLHkJhhvFVWJwWmCs/VaJZOnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WcHHFz65/QoGJq5c4vlWHMrSc+XpxWUoTdYf+CLfDb4=;
 b=CtXYsdRuxlOmhoPaDvm+7hXIHq8r8drly+RAz6g2QudRWrgyFW5l3j2AlWJiKT6VYxTeSRX7cPEQtalaOjt3LMOfHkRPEBrmjhKTPpv3Vh1DV2wpCy+bTiAejGuIsYzWBmgQvKgHrzAjN/oZG4y4Q+DOIHuintlgrFhj3IRYZ5E=
Received: from SJ0PR03CA0139.namprd03.prod.outlook.com (2603:10b6:a03:33c::24)
 by CYYPR12MB8924.namprd12.prod.outlook.com (2603:10b6:930:bd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.21; Mon, 28 Oct
 2024 07:05:17 +0000
Received: from CO1PEPF000075EF.namprd03.prod.outlook.com
 (2603:10b6:a03:33c:cafe::1f) by SJ0PR03CA0139.outlook.office365.com
 (2603:10b6:a03:33c::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.19 via Frontend
 Transport; Mon, 28 Oct 2024 07:05:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000075EF.mail.protection.outlook.com (10.167.249.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Mon, 28 Oct 2024 07:05:17 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Oct
 2024 02:05:14 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 7/8] platform/x86/amd/pmc: Add STB support for AMD Desktop variants
Date: Mon, 28 Oct 2024 12:34:37 +0530
Message-ID: <20241028070438.1548737-8-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241028070438.1548737-1-Shyam-sundar.S-k@amd.com>
References: <20241028070438.1548737-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000075EF:EE_|CYYPR12MB8924:EE_
X-MS-Office365-Filtering-Correlation-Id: 91606e18-0f3f-41ed-17c4-08dcf71ee0e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YtpBYJtpvX1fhzKiLHhOKgnHvG6DMdgo1fTwxr99Hdw7xfaUBLJPJqhZdd+J?=
 =?us-ascii?Q?MVXwvsWKkiCigvboEQ16CDxVBEXN6B8b91JBWobHVfgi3Vihvmi1HSww6lBD?=
 =?us-ascii?Q?5NcE89zB44y/heUlBGPF3UxM4ZM2LLaesjHBWJq4G9wcOcqMFlaqzFitblRW?=
 =?us-ascii?Q?pvpDZ2bOC5e1zymLRsJA/BEUvK3k+8R+PJzLe2gmYuEDMvRBpMo7JpouaH3A?=
 =?us-ascii?Q?7SnWfBx8OnFD743D7ywuHJesHAeedXDOIQ/VjScT3RgpbHL2EdGeFWSY1hZL?=
 =?us-ascii?Q?pG30MoWkJHv+ty15gJEkynSALMf9Pg0rfxEks96oFfRyyCFgBsqcl3gcHt7F?=
 =?us-ascii?Q?4sk/EI3suookOieJX7+xXW6tdkjz/fiMUBXEofO0aR4mVoIVzGyPL49I/85v?=
 =?us-ascii?Q?n1A95vkcTcejd02PesBF7dD2wN4EHCfDMxUEn4XKEd7cTFqdveSCRj5HwrgC?=
 =?us-ascii?Q?UViaq0Zre9iYFeR8tDLA/sU8TBmNNMt5z6AZla2P3JYcZytyoahKoqoYd45v?=
 =?us-ascii?Q?+it7dB4vM6v7IINhs5nvF17Dz0UTePbFootlV27o1ic2Es3pLRM4bcte2Gw1?=
 =?us-ascii?Q?3Ez/vK3i1h8KfwDKMorHTQ4AOyZv1dlOUC/mkiwQR2rQ3g7LDtHKysxhmwSr?=
 =?us-ascii?Q?tdvB7whrPid81xLHT1Ybi9i80GnRAbpWuF83G9RpK08TynabwhruR3NrqIbr?=
 =?us-ascii?Q?eTzPY9PrL0CC2G9LbQ1hUUulJ3NIXTh8p0ygs7+xZI+uqADwJz90NR1aLz08?=
 =?us-ascii?Q?1xgDfaHE3vu7q13COa01Q+zxlwtfix1wuDRpRSixF/qFWImeJ/WgLdtaTzRd?=
 =?us-ascii?Q?tS9NWzsfOiGZHbE2HxOg5SWmUgmgeCXY++SYtvMf3+98vyex3B06KTvc6rVj?=
 =?us-ascii?Q?IoffW8Xwitro6h9MATxgSSxXwr/NCd8YbTVUsdN7nJdEWKgJqRxhts+Ld4NU?=
 =?us-ascii?Q?Ec3J+plNWKzWgfwCMc1XgXEnZ0Z+B+veDcpWXKK6apD9LFxK7Dsrs4y/Z+O3?=
 =?us-ascii?Q?wH+G3pyJpK7vAuOR7MJgs+pBXos83Db1TDlEpf1HJWlecj1a8SabGFgkjeu2?=
 =?us-ascii?Q?llSKLKopj36AlTQQVwoZsjiR0LUi66WoM6UDB5mnZclN6zhIrVvRtBMk0SGd?=
 =?us-ascii?Q?N2TIMj8RJ6nsUDL++5Aik2JY8iqgNjwoSsWrOQfdF7JA7pHl1/MlpPSDOInN?=
 =?us-ascii?Q?SMZqOfaacNZB/tGDLDPgZjprZoJjuL+gP9P5HhSRoYJkhcwNLfOrdduHSXq0?=
 =?us-ascii?Q?jwSSXbfql0OUJLXU5am6JzmMy5kB2zOcN9k2YP/tOelA7IEy2JXmqZXEZegY?=
 =?us-ascii?Q?4/pkSN4isrHeY8D0u5spKh6MxjE0OtoAwu2eZf18N4oPxaTE/zwwvMxpZ7Lz?=
 =?us-ascii?Q?uro8/nKYZ+sNbymroOfAU5uK1TlqHxQaujVCd5q2bH2srOI1BQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 07:05:17.2500
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91606e18-0f3f-41ed-17c4-08dcf71ee0e9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075EF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8924

Previously, AMD's Ryzen Desktop SoCs did not include support for STB.
However, to accommodate this recent change, PMFW has implemented a new
message port pair mechanism for handling messages, arguments, and
responses, specifically designed for distinguishing from Mobile SoCs.
Therefore, it is necessary to update the driver to properly handle this
incoming change.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc/mp1_stb.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/platform/x86/amd/pmc/mp1_stb.c b/drivers/platform/x86/amd/pmc/mp1_stb.c
index 917c111b31c9..bafc07556283 100644
--- a/drivers/platform/x86/amd/pmc/mp1_stb.c
+++ b/drivers/platform/x86/amd/pmc/mp1_stb.c
@@ -36,6 +36,11 @@
 #define AMD_S2D_REGISTER_RESPONSE	0xA80
 #define AMD_S2D_REGISTER_ARGUMENT	0xA88
 
+/* STB S2D(Spill to DRAM) message port offset for 44h model */
+#define AMD_GNR_REGISTER_MESSAGE	0x524
+#define AMD_GNR_REGISTER_RESPONSE	0x570
+#define AMD_GNR_REGISTER_ARGUMENT	0xA40
+
 static bool enable_stb;
 module_param(enable_stb, bool, 0644);
 MODULE_PARM_DESC(enable_stb, "Enable the STB debug mechanism");
@@ -244,6 +249,13 @@ static bool amd_is_stb_supported(struct amd_pmc_dev *dev)
 	switch (dev->cpu_id) {
 	case AMD_CPU_ID_YC:
 	case AMD_CPU_ID_CB:
+		if (boot_cpu_data.x86_model == 0x44) {
+			dev->stb_arg.s2d_msg_id = 0x9B;
+			dev->stb_arg.msg = AMD_GNR_REGISTER_MESSAGE;
+			dev->stb_arg.arg = AMD_GNR_REGISTER_ARGUMENT;
+			dev->stb_arg.resp = AMD_GNR_REGISTER_RESPONSE;
+			return true;
+		}
 		dev->stb_arg.s2d_msg_id = 0xBE;
 		break;
 	case AMD_CPU_ID_PS:
-- 
2.34.1

