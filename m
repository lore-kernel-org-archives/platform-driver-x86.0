Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2054.outbound.protection.outlook.com [40.107.237.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873C515C144
	for <platform-driver-x86@vger.kernel.org>; Tue,  5 Nov 2024 17:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730828296; cv=fail; b=e6E24ZU11qiLM11FXeFoeIUo6cSbZhGV+7dlS5Kzqo6reZHUWFEvEQ4OsA6QL5ybuJV6j+JKSqZtYS+uyjCOPpHi4c/9ZOGhRtU6oNDi4ERytdVY+VQHLUuaOLvR5Eu4lYVGnwHG0bCx+97GvZup7xT9ze0N4CJWd8lhiKPUwBM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730828296; c=relaxed/simple;
	bh=6nB8OpxtwswmgeLJr8x7V25awST8sgsYZzJwhXLJDNk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qlYswP13PNbsfDVRYp9rUim8KIIJ70+gyHlSPpSBjzOoEoRTqxIB/7yS6+Fwk+wmXbGwuQQWYdUBVqmpi/Hks5Rg0eBOEHuni01bVTS127npOWKL1JQLxd8CfhpSYxtw9wqxVEJOFb1QroVx8/SBFNCbfmtDprHZ3WmLe6DJtCs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=0iJ/ZyA6; arc=fail smtp.client-ip=40.107.237.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="0iJ/ZyA6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m7vZSviOSBMmb0Zf3yi2c0rDxkgiRjWYWiMQkD4TmaL/qP4/yuIMXva7hPN8zRBbWLJl7NK50y7/iDVQRLrCMF86aCx6qWGtB7QdLPDIGONNHebOOxtPQ4OD/7JE8ci8g3QwEO4YalSTScbZGrOSa94oQj9RU1sWDuVS9JVtDkPySk/VzJ7bGAc9MGIjnBlemuODFMbs285j04jsvIMP6yn988/ERoBIefWSCtTyX+bhKzqrgq3PXd+Ov3sLA3oYEDLSsXJY8HHEPXsh61LLXxS2IFPEiCWm0FkxhWXVRrPn7tAz2Oagn25C1m0Bbrob0ggpolG01GZ7WUu99z9NYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xkk70Q1IQNV74wQTovoCrz8FQm7x+g/AhC4HOP2Vmlg=;
 b=OEjt8Bf2xv8ySA0h97xIcTFkg1arwUtJ5BvbCY+hYL0F+uvzGwnfwaurpjddGzNMEWsSEjXm48SHlotDrOtDIN7ge0YvaLfxoMywQXB1quSqjHNcznbNK4kk+lFhuRydo+lvhLTruRKIPzzJNKv7E5KmFzwxo2tDLP3KaP8+jjim5lYpZM/TzhmnGtq+3PbHfXAMZ1jNKoRyjmEQCQm9538wCXsypUeEPJMMI5r4qUAE6azsXp/hrfS6hfR790Oi9apB35KcpH5PuYrFwfw/MW9yiKqADaX3Xni7dDwkdASHmfZHVEAiJdF+uLKSFfTnWEzOAKwx5pnPUkdORu7RxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xkk70Q1IQNV74wQTovoCrz8FQm7x+g/AhC4HOP2Vmlg=;
 b=0iJ/ZyA6UUXbrTOWzQIlWr/J6bCmAVonMGoZNuWORmHQW+Tg7+c49eyvX5eXwccvLbXCMo2G+pg4xfRTw5/PIO92lT3dSqftaN6FaghuCrkuQdrav7u/fUXYzDI2fN+cA4Yne3PqCrMUJbGmx4sXXUFbcnwFzINg/xDC1z4OXkI=
Received: from SJ0PR03CA0341.namprd03.prod.outlook.com (2603:10b6:a03:39c::16)
 by BL1PR12MB5827.namprd12.prod.outlook.com (2603:10b6:208:396::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 17:38:11 +0000
Received: from SJ1PEPF00002311.namprd03.prod.outlook.com
 (2603:10b6:a03:39c:cafe::f2) by SJ0PR03CA0341.outlook.office365.com
 (2603:10b6:a03:39c::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.18 via Frontend
 Transport; Tue, 5 Nov 2024 17:38:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002311.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Tue, 5 Nov 2024 17:38:10 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 5 Nov
 2024 11:38:08 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>, Mario Limonciello
	<mario.limonciello@amd.com>
Subject: [PATCH v3 13/13] MAINTAINERS: Change AMD PMC driver status to "Supported"
Date: Tue, 5 Nov 2024 23:06:37 +0530
Message-ID: <20241105173637.733589-14-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241105173637.733589-1-Shyam-sundar.S-k@amd.com>
References: <20241105173637.733589-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002311:EE_|BL1PR12MB5827:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fbf16c2-6da3-4815-fae5-08dcfdc09e3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tJvI2SwHMfaKqgnGeC1/cAdMHN/bA/+dFffMLU+au9dqGF/xm6PRDDMl8wA3?=
 =?us-ascii?Q?pE0iBX6rMERI+4Z2gZA0i9R/5UQAfExKFTh5gzwhT8uuJSeVGFcBILS3SmDd?=
 =?us-ascii?Q?9U4zdMmSZT82f4h5/6K6JiaiWm5LKGCQABEdvwnZZoOaIEWPRCafAFXDEsVF?=
 =?us-ascii?Q?Afkeucj+u2qC74JrNANCCwJTi0TWhI+8Mpr4IaVexEVNL5ItUESNXUg2xpAg?=
 =?us-ascii?Q?tgp3hV0sBzdsYWvbbCAg08E7uaRjytoHDURyYxvcgJxyteSRTCWwcnuj2pGC?=
 =?us-ascii?Q?JNlFjd1ku1k89bh3riNw6zVM4qd7+WpnSm5MpiLqHOaAHgh8/cg1fmXL0GWW?=
 =?us-ascii?Q?EN3wSyfgAOcL6jr+tENFp7SflzB+m+64RyJw4EQVDig+ZfaiWcqIkwLdN2zN?=
 =?us-ascii?Q?tUHMAa60zazheBLb0+vXBiYCrrfVOh10MdhkdIsjmVUNoKOo7G5G8ddwUaxg?=
 =?us-ascii?Q?j0HDn9Z5guJaJC64E0WqU89TS+d5MwRZQz2411PorK7vXakkT0LKsxo+Q5ix?=
 =?us-ascii?Q?uxOTYm4mXh10sMWRYOo77/+FE4S0SGAcBpfzDb3fZC29icHOlGMn/fbaX4ZY?=
 =?us-ascii?Q?skTRw+p87AyJyy49j16pso2U5w8QL38MkaWq/WVYlilLzf2pCJiOOek23YeZ?=
 =?us-ascii?Q?yNmsBgMtKlpbgNXaV3A9bVDCod15R74xjfAObaiyOHSSFPdHtnw9vXXzEYry?=
 =?us-ascii?Q?ihDWKmOzkOtQqsnDWX05uanW+V5Y3UY6VnTv5sDj1+LhpITMUCSst2TIKyAN?=
 =?us-ascii?Q?XHC0dteaCRTQnbispROAN5gvIRiL3cTc1Ix+xRERo3QjnQrb6IwywAGBTlia?=
 =?us-ascii?Q?68EwP3yWujJvY+V4WLfCsIGIwAlFuReTZXs8Ba72kpaM7tl31Mje0Jhl8br8?=
 =?us-ascii?Q?oWW7b5hUqM8ZbFk+ACheDMhUfxONbuP+wwNlTN8Q84uYctHqFzjEJ6DEt6TH?=
 =?us-ascii?Q?7cceTWygxC4B0Hfh35BzxHQl7w9Oa9G/5finlgLwIe3gbyLG8ba38I8dC+t8?=
 =?us-ascii?Q?NP7KZgv68AY7DedV8/xCTDjYr/VzcwqmxegZMeXecMypKi4jeGbaDViigD8I?=
 =?us-ascii?Q?uwaUkMUJ+PYOzy4nW7qm0s3otBQWZOiSPnBt2eQ5oOooMlpqvNNiY0mWopWn?=
 =?us-ascii?Q?qEaxNeFsuFjbodtpS9aTAlEjlpiw3yOOtBnnsjfF0DK6nylNanQDzU9De4++?=
 =?us-ascii?Q?4xEKqJF1fFmuBu9NgKnc6cTvbYq86Koann6YeO2m3VmUJVN08BArN4x/J2Hr?=
 =?us-ascii?Q?W1x5/oxdLVDmKQXylAqx2Pd3HAIhoeJH6r+yeliYcBsfR8YaSrGSZJBEkVfK?=
 =?us-ascii?Q?qKMgWPD41q6FNxakyi2+Xatv6UWAuNOFlpkcvN42ZBtbp87iChjQ5XMWnIal?=
 =?us-ascii?Q?cEbFFBB9GYn2utWKxDpoUeKxPSP5UJP5quDWX18vHj3ZNPOVVA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 17:38:10.8681
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fbf16c2-6da3-4815-fae5-08dcfdc09e3e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002311.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5827

The AMD PMC driver is actively being developed, so the MAINTAINERS record
should reflect "Supported" instead of "Maintained." Update the MAINTAINERS
database to reflect this change.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 91d0609db61b..a92fa062ce5b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1118,7 +1118,7 @@ F:	include/linux/pds/
 AMD PMC DRIVER
 M:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
 L:	platform-driver-x86@vger.kernel.org
-S:	Maintained
+S:	Supported
 F:	drivers/platform/x86/amd/pmc/
 
 AMD PMF DRIVER
-- 
2.34.1

