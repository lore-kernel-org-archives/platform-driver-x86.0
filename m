Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2057.outbound.protection.outlook.com [40.107.236.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237A7175D2D
	for <platform-driver-x86@vger.kernel.org>; Mon, 11 Nov 2024 10:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731322035; cv=fail; b=Ow0BfF71npEhfrbddvDgYmAu2L/Tlr/orFe6C3oPNjvGU7a8I4Wj355ZABU53NQOWaxjv6rQwrzD+KkPm9XBVtK3VYgSrmKC244PjoI1DRqA/SOimpjf5eRIOxTSYLsuFpZHBloUBTHaDImU8imcqYfTEKFsLCl3P/nQHlkoByw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731322035; c=relaxed/simple;
	bh=qNgFneAtHpTBMlcfkoYytOpGSwYRL8dBKpwGkV2BGEs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o8AxCaCmPotqHvdpIg0JX/kFw36Vutxs90BG39mEfe4hmZb1Sej79NMrw16Ng3vMoKi3Es3iWK/sp0eJt2x1uhQT+Z3Xh5D8vkRrnbPX1jkr0XCc+CwtLsHeRbZYwh6n5DFAHioNDxpCn5WUxXEoBuXtpKKGOAZVz+Xc26YpM/c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=WoZQQH3K; arc=fail smtp.client-ip=40.107.236.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="WoZQQH3K"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ntrVhFAeSiSDfm4kZ5CZiIFcVSrAl3etNyqXUAB/Mj0L7zBqZQVS1PDFxvgfi6+1MHVsnCwn/OVfLDMHHNv5cjuAqn3fjjG/bXyot7gvlRfNckNwMAkDf4uKcimUOKFw55x6XcDkJPITXETxDJNUdhLxCfDmMHxJVaRg2EsX53Ju5krrb9wINluSg1pvM+sS55LGibFC+JLLs4Hq1ZUaMV7dn/P7bedLM/5Ub3emcgeK5OrXvg/q41ZBlTDTKXLAEvD+/9ULLZyvNw4RNe9I4CRAD+e9sb7EcDBOpKpuyW5DSMcWYBNokOviPSxDwNjW2bcveJT1MMLgIJBSeiuWtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KRsOoqSmZqvOWxiMKA9Eeog4VeEPLe+6i+RJ4TTS88k=;
 b=qgceys6LmR9e9Cr8sKKAkOOICYyq8JPu5C83xu45srj+Q9xTm1SE9NfmRdbIzKtOmgO/dc+t3gcqWh7iy6PW5Vk0Vmvny8/oU36d2GThQaPd2UHnpe9W4rXPwZioc0uWcKmurVBA5WfRzLAyXe5qpsEkk/q2u6B34Trxg8S1HaDooLYunpydYgDqYZM56v538utb43cclrVlAonMzabEksp22m88+sGS69AgSTFXw5MD6RcoIjOkZ2l41NBs5Rk9zclS0ycoTa9DU9nGTbkUvh2DNXFfMMqTy/oo0HKSUWcysTFRdbcM9ROPvzA74xcb/KlApw+JhGC6pXEtqmRx8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KRsOoqSmZqvOWxiMKA9Eeog4VeEPLe+6i+RJ4TTS88k=;
 b=WoZQQH3K+BAo2KfLmXqD1DJ08KPhmCDpB1xoyGeCQZVLaHdCfMUl43KOXAgShCRRFhWOy+aLYCnOzyG432CejxRaCFdC+olpzZe+vzWYnT7qJADcU0BmmqvyV6vWOmdNrtvkeTX7j8Ba2n6t87mHLacg3x307ZMWcvjr33lIWNs=
Received: from CH2PR12CA0024.namprd12.prod.outlook.com (2603:10b6:610:57::34)
 by CH2PR12MB4262.namprd12.prod.outlook.com (2603:10b6:610:af::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Mon, 11 Nov
 2024 10:47:10 +0000
Received: from DS2PEPF0000343D.namprd02.prod.outlook.com
 (2603:10b6:610:57:cafe::95) by CH2PR12CA0024.outlook.office365.com
 (2603:10b6:610:57::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28 via Frontend
 Transport; Mon, 11 Nov 2024 10:47:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343D.mail.protection.outlook.com (10.167.18.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Mon, 11 Nov 2024 10:47:08 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 11 Nov
 2024 04:46:57 -0600
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
	<platform-driver-x86@vger.kernel.org>
CC: <perry.yuan@amd.com>, <mario.limonciello@amd.com>,
	<Shyam-sundar.S-k@amd.com>, <W_Armin@gmx.de>, Basavaraj Natikar
	<Basavaraj.Natikar@amd.com>
Subject: [PATCH v5 2/2] platform/x86/amd: amd_3d_vcache: Add sysfs ABI documentation
Date: Mon, 11 Nov 2024 16:16:32 +0530
Message-ID: <20241111104632.2213773-3-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241111104632.2213773-1-Basavaraj.Natikar@amd.com>
References: <20241111104632.2213773-1-Basavaraj.Natikar@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343D:EE_|CH2PR12MB4262:EE_
X-MS-Office365-Filtering-Correlation-Id: a505719e-5fb1-41b7-1f5f-08dd023e31e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WmlFRm9vZkMxNXhOV1lYcmpLVW9MNWs1VWFld2lhSjVoR1lkTjl6cGsyZGZ0?=
 =?utf-8?B?UWoxZnlockJFQkxySHdwV2JCQm1yM2YybXlNWlZwQktCZENIZVI4NXJRUm91?=
 =?utf-8?B?MGV4WitFYzlnUHNwMEZ0dHBkOU9PVEVwT3N3R0xTZS80aC9UM0k3OG1FaGFV?=
 =?utf-8?B?ek94Z0Z4UW54dk90VVhJbWxhalFJNTdIcW1zQllzYjVWblB3eVBqeDV6cUQz?=
 =?utf-8?B?eFhtQWs3SU9HenNFQjRGWHovQ1pWTDgrWHJIVWFuVFRraDlSclVpVkllSUNx?=
 =?utf-8?B?Z1RncE42cjRmM3lPd05pc1crTUVSeEc0TDdScWhNaDA0NndkMWRtcjRJV0xm?=
 =?utf-8?B?RUlObDlWdTN4Qnk2ZDliMStsdkljOUdpU0ZUSnJRa3hVQUR3TkNCUU1INHdL?=
 =?utf-8?B?QUl4UXNpRnN3clhMdml2UDIxY1BTeDFmbmpraSt2Sk8wNUtPU3dyTzJqQkVB?=
 =?utf-8?B?NUJIVEdGYU44YWF4bEFpNTRpOFhHeEZacDE5ayt4WERPUXNLRVM1a1RXS1lx?=
 =?utf-8?B?UWN2UGRWL20zeG9ab2VvazdqbWQyNjVBUHpNbkVENndDRmtUdzI0aFloQ3dz?=
 =?utf-8?B?UVJIM2RaUWh1L1hjcW14QnNtVkRaMUdhUXk3YUN6TlJ5TjI4OHg4VFNkQ2hJ?=
 =?utf-8?B?NEdaUFo3MFJkZFNHQWt0QkUraFpwSjdPS1M2RDRyTWdmcms2SzE4YjlBRkxJ?=
 =?utf-8?B?SGp4OEZuMG5VTzl5SXp3Q2ZmQVhkd0h1K3hVUnAyNGJ4UnJVdmszSkpmY3Jp?=
 =?utf-8?B?eUJCTUtCUTlIR2NWU1MrSmE0NTh1TTBSZmgvdXduVXYzQllGaElCMFVqVWdC?=
 =?utf-8?B?czhNYk5GTXlYM0c5U3V4T2JpU3Y3OTF4MTFyNFIxVjBpNzlRMG1FRGNhNVd0?=
 =?utf-8?B?ZUx2KzNMWm9KMytnd3JyOE5lcklnK1RaU0NwMDU5Tk1WdXNYQXNwY1pjc2pw?=
 =?utf-8?B?M0x0MmU1WGk5NzJoaERIVGJhbXVtanNGK3p0ZTRZZDYycDIxeU0rSlhvYThR?=
 =?utf-8?B?ci9ibWNqRVVOY0wydG9HMEdacWpZSTFVczN2bXFGUC9xV2xMREVBRnpHQXJY?=
 =?utf-8?B?NFJWcTg4NXpvd25sdkd0Z1pzSFBlV3MvRVVFRE1vbVgxMGJhbUQ4ZzBwY2p5?=
 =?utf-8?B?cnh6SGhjQmVWK0JITVhPalpyTnAxUHNpUkZqSW9LOWI1U29sdHRDeENqM0E2?=
 =?utf-8?B?bE1tVWVZczc5TVJZL2RpUmwwMS80bVhybDFmWGVRRHI5Tm1Dbkxlc24xczV5?=
 =?utf-8?B?Vkk2ajZjMXpZUGIzN3Fha2p6NGMwaEQ4RHNkM29tbk43d3lTVitrY3ZjY3RQ?=
 =?utf-8?B?NVMyZzFRL3VQcVpFUU5XUjlPbm1ncHFINmtCeWkzZ1NhQVpPc3hkU2Myb3BZ?=
 =?utf-8?B?Rk5oWERUKzQwZVh1K3R3anJpdllaOUtuVWpFcUk3bmI4RlZPUlJ4WkNQdkVH?=
 =?utf-8?B?UWhDRkF5Y29yZjVES1NjdE13aERLaUlWMlJSOVdzKytMTmhvN0w2R2lUWjlR?=
 =?utf-8?B?TTV5aGdodm1ROUc5dlJWd1NzNjd6THdZUTFLem1jdVJsekV5NytIa2FSVUxS?=
 =?utf-8?B?OUhwYlh4dUpXNXZaTWc4dUE1VWlMYmJDQXdDQlByL3U0cUVJbjV4ZUM3Uzdq?=
 =?utf-8?B?clFmRzV0eWpRSWJaZ2h1OVRJdUVKeVBUbnZMNzI2YllFWDZTME1RdjR4WlBr?=
 =?utf-8?B?ay9vdk1OQlJqMG40Uk9ZUWRzRkYxMlg0ODlXOUtRdmVXOVRweXQxVnRzcENK?=
 =?utf-8?B?Qk1BS3V3dDZ5VWcvL2tNN1Yyb2hhZ3BJdG1GbStTY0w0Y0gvbCtrWUQwRzNa?=
 =?utf-8?B?amQ5WnNJZWFXSHM5cHVwYk5ybi9vVWRsb1JLMVRWRUl1MWJ5TDAzb1hDTGlu?=
 =?utf-8?B?a2R4SmdZR2VmMFIvc1YwL1BHdjN4VEVyM2l5OFl2UGZjaVE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 10:47:08.2018
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a505719e-5fb1-41b7-1f5f-08dd023e31e3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4262

Add documentation for the amd_3d_vcache sysfs bus platform driver
interface so that userspace applications can use it to change mode
preferences, either frequency or cache.

Co-developed-by: Perry Yuan <perry.yuan@amd.com>
Signed-off-by: Perry Yuan <perry.yuan@amd.com>
Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Reviewed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 .../sysfs-bus-platform-drivers-amd_x3d_vcache        | 12 ++++++++++++
 MAINTAINERS                                          |  1 +
 2 files changed, 13 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-platform-drivers-amd_x3d_vcache

diff --git a/Documentation/ABI/testing/sysfs-bus-platform-drivers-amd_x3d_vcache b/Documentation/ABI/testing/sysfs-bus-platform-drivers-amd_x3d_vcache
new file mode 100644
index 000000000000..ac3431736f5c
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-platform-drivers-amd_x3d_vcache
@@ -0,0 +1,12 @@
+What:		/sys/bus/platform/drivers/amd_x3d_vcache/AMDI0101:00/amd_x3d_mode
+Date:		November 2024
+KernelVersion:	6.13
+Contact:	Basavaraj Natikar <Basavaraj.Natikar@amd.com>
+Description:	(RW) AMD 3D V-Cache optimizer allows users to switch CPU core
+		rankings dynamically.
+
+		This file switches between these two modes:
+		- "frequency" cores within the faster CCD are prioritized before
+		those in the slower CCD.
+		- "cache" cores within the larger L3 CCD are prioritized before
+		those in the smaller L3 CCD.
diff --git a/MAINTAINERS b/MAINTAINERS
index 429ac6496f42..5dc7d5839fe9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -970,6 +970,7 @@ M:	Basavaraj Natikar <Basavaraj.Natikar@amd.com>
 R:	Mario Limonciello <mario.limonciello@amd.com>
 L:	platform-driver-x86@vger.kernel.org
 S:	Supported
+F:	Documentation/ABI/testing/sysfs-bus-platform-drivers-amd_x3d_vcache
 F:	drivers/platform/x86/amd/x3d_vcache.c
 
 AMD ADDRESS TRANSLATION LIBRARY (ATL)
-- 
2.25.1

