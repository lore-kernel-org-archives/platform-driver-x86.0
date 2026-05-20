Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012014.outbound.protection.outlook.com [52.101.48.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283543E277C
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 May 2026 18:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779303359; cv=fail; b=W1kgx3iYgWL2VhZSzIypNt1HKC40QO2DA07RP+/zHdaY7nIdy/Nsu+LOClqzjkIufxha0XaguQ8Y34FcZ+5GzlhczCAz1XIdOefUIeswWLL0xlIPR7ukYPBZ8dnUgIXEjONht2r8DkFvq7io4LvID/mSe+5r6JyvCPwbXjri1y8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779303359; c=relaxed/simple;
	bh=EYkn1KsawAVlyjqc3Q1Cu0O5NP47YBkPXLsCzb0/kps=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mDRWuDuoP6sGBDVOcwxR2nIEZxM96HcfTeIekDJRDrVEWb0AIun41jjDQQ2nXPWPOuLmNYOI/dzvB56y+ficC1sBLFsdwcwM2Iq5hDGC4IQIU16OSTqAO/aC7nEbpMC+01C41vfG+iIvfAJhylboCic+qb5TAvnN7+hI2pTSOUE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Fq8yEWw5; arc=fail smtp.client-ip=52.101.48.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Fq8yEWw5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JHDm077FWDXMB+cVu4rKWIZlvsI/LLNCdNextbh7iQ7OjMS0RC91nXXN7cHa98BMz/CAsJMq64WcWg0DEzFmS8GUOXmKqcJ+oPYUfEfsDzOsnp8egcAZiChLnXZCyYfg7RWtF4rV6TYvikX4N/vocnqLiUis0iu5dbqD/R4tWl9N+q5s/QcXykzHq4kZfutUOT1l/HcIx86Tr3qfX44WztMkuXQ54kSwlTehX1SmqAmdj5GFtrfrzeDLDjy94Lfc0JsnCdpTGhczwZkiSdtInVF+c2acLiOV6gmvuEh2aqDBYbs0Twx9LwgNN5WGU4H7OGs4z8I9bB5I2g4+IpYtAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+3/HxdZfyUvR/OLmt3gZb9oclNenld92LFVMKBErLm0=;
 b=OSAq8gdwBlG9od0UZ+zbgPH/IP6wnZaKLb22INUNz+j4BAIU+MxHOFRVh81tIAKHA8mwjaKhA+DzVwJp+UZROcuSk7tN1VgQb8YrofGR3fnL8QM4mUZkedk2Tjq2kx/gZOsDXzpUtkqk9U/hlaFLVo1DEmUEZkC7o9z52jLBnXzTghCCInagAYx+Xt+WWJeW1ipIdT1RcT5XkUVS8NclQ6PPZAavKUP5Gq1RJtFcziMgPXd/kBjyQfAxqzVX9/QNYShUw32enysOa4qvybhbIuPfPmNeYlz38/MyzgcwbzewY3/hcxtPvMscGk50d/MAQvGbn181y8+QXQ4Bsm4x9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+3/HxdZfyUvR/OLmt3gZb9oclNenld92LFVMKBErLm0=;
 b=Fq8yEWw5VtO3gompbTIqkoqwIci/+D7ztbzGmHmWqd+ZlAqR3f/m2jwjBO1dqTr2EcFeYV2PEtCGlhnprua+SiXw33dyfLyAzt/H2ehiZuctRPW80xB85LERBLs3Qlves7qkBR7iWSpBrwgc1PMSQBbb3DVlscTWH0v9v4rIUy8=
Received: from PH7P223CA0017.NAMP223.PROD.OUTLOOK.COM (2603:10b6:510:338::10)
 by PH7PR12MB9073.namprd12.prod.outlook.com (2603:10b6:510:2eb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 18:55:53 +0000
Received: from CY4PEPF0000EDD6.namprd03.prod.outlook.com
 (2603:10b6:510:338:cafe::1) by PH7P223CA0017.outlook.office365.com
 (2603:10b6:510:338::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.16 via Frontend Transport; Wed, 20
 May 2026 18:55:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EDD6.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Wed, 20 May 2026 18:55:52 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 20 May
 2026 13:55:49 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>,
	<Sanket.Goswami@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v5 3/8] platform/x86/amd/pmf: Add feature discovery support to util interface
Date: Thu, 21 May 2026 00:24:19 +0530
Message-ID: <20260520185424.770772-4-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260520185424.770772-1-Shyam-sundar.S-k@amd.com>
References: <20260520185424.770772-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD6:EE_|PH7PR12MB9073:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d01a346-d365-4437-87e1-08deb6a16a33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|22082099003|56012099003|6133799003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	N9Im7Hz4Ln61acvsnQYJfQ8Fz2O1pJCuZs3QO+Dnl8WqdQLxPhAJeQEOv8mWTdvnmwwLjsY7o3gZqJCT/w1uPwtCTj+RvV0XQlm+Kn6J1TlEptf6SE04GGQVGIJRENCEcaW9WJAXIVP1jj3EHnFoG8ekylWvYLo7Y5T7hIlRpAkKeHj7qOX2s41XthbpFMEiMGyUZ8E8iJLJ/a5cGgRew1lsJBzhzt0CkuVIFkBcQ2iCzmKBvfJ2q1mXHVOopQHLY+U1+swqQFS3j0ja72LggYwa/8K1umsaf6796IXUhI3n9eYjVnJEAi13oKCBVgpi2zSTCWuJNNmZXQMp55tjl8GdmOl8/U5VG6IHz9hojjd9Bvfm3Z6riRXujMFIO6sy2qluisN57ogz7IChTPHpdi2keMSUQwsU9sbq7eaq6P37shQ8Xya4OdklvOHDfcbX4zM4YdJYEgdxaDqcfe/p6CheWjuO3ha14tFgpcWyhvNA3vpre1hsJcPajkTC30YOy8bjUeipFRQu2aF4POFOuODruymn31n8KIklkUy3Od9ageOpINXktQOC9mkJiEK7Z2HIP7EUCvRTJOI1tJvb+58a2yezA5Vjc7MLkmOk3zUiWxemnQ0lXBF20h1Pug6lm2bocz1pi0P3UC1cYohJ0BM4KYsPQoMKOAVZDinrGsMWS13TTA+ga43cy7jtIW5oBucpN7a8dtiyaTsXYcSAshqHTS+PYkqYNTeVH0PWDvE=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(22082099003)(56012099003)(6133799003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rxgDnWrXLYjy2VxrdU14R7qxDLJH+C93K5K4ZOyCmgEN2RlReB4Q7r2aY7sge0EMHLUPMfxITdNBQpEnkPTXkyahzSqLaaBiNgyXsw9hdvvi+iMBCQlnUFuRRKCvcgX8vSHY1rK39PI9TajE3kvhvk8+4CUKhAxJM99KxEPEOTOODFG/kTpt9Utv0cpoAdtPCIYAGpJZd9dcOXsUQpoT1u/sIIoGXdU+XQa8BdYrj1XiuLFCNnnjvn76H5qijqzlt3Lwmv2omhRDq1lUbHDGLByc58NMe7DA4HFU4cD5FghqcK5SgkoBdt8PMnTVYvqRfghj+sqZegoxOrkgfdtOTXDDUFTzmSfQbxrPXcaBzunu1w0W/8NvWT7LFU0L62IyThHuJ/QyZm94gu93Fy+kREDlLJ9nPtrtbQaQkYnTbQPj2iWdGQkL8fouNyEUe5QO
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 18:55:52.0061
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d01a346-d365-4437-87e1-08deb6a16a33
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9073

Add feature discovery capability to the util layer interface, allowing
userspace tools to query which PMF features are supported and enabled
on the current platform.

The following features can now be queried through the
/dev/amdpmf_interface ioctl:
*  Auto Mode: Automatic power profile switching based on system activity
*  Static Power Slider: User-selectable power profiles
*  Policy Builder (Smart PC): Action based policy management
*  Dynamic Power Slider AC: Adaptive power profiles when on AC power
*  Dynamic Power Slider DC: Adaptive power profiles when on battery

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 include/uapi/linux/amd-pmf.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/uapi/linux/amd-pmf.h b/include/uapi/linux/amd-pmf.h
index d29a4abe1145..38ab5362fe62 100644
--- a/include/uapi/linux/amd-pmf.h
+++ b/include/uapi/linux/amd-pmf.h
@@ -34,9 +34,19 @@
 
 #define AMD_PMF_BIOS_PARAMS_MAX		10
 
+/* AMD PMF feature flags - bitmask indicating supported features */
+#define AMD_PMF_FEAT_AUTO_MODE			BIT(0)
+#define AMD_PMF_FEAT_STATIC_POWER_SLIDER	BIT(1)
+#define AMD_PMF_FEAT_POLICY_BUILDER		BIT(2)
+#define AMD_PMF_FEAT_DYNAMIC_POWER_SLIDER_AC	BIT(3)
+#define AMD_PMF_FEAT_DYNAMIC_POWER_SLIDER_DC	BIT(4)
+
 struct amd_pmf_info {
 	__u64 size;
 
+	/* Feature info */
+	__u32 features_supported;
+
 	/* Power and state info */
 	__u32 platform_type;
 	__u32 power_source;
-- 
2.34.1

