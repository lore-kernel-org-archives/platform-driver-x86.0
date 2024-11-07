Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2049.outbound.protection.outlook.com [40.107.220.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5FA7196D9D
	for <platform-driver-x86@vger.kernel.org>; Thu,  7 Nov 2024 07:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730964475; cv=fail; b=Zdx2T7LcshOWSqtTh+qRWcUyFUilyK4T12/8d+GFSGyhxTTTr44oX+kUK/CMcpDd4R6iH4c4YTj8308Cd0vpODG59DZwJq0pTA3SZUp6/0hJ6KK4SDFYNr8ObcO+qZj/LM/cKJtMClCmi0bID1dkNSYt88IyWysdUaC/PVhgiRM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730964475; c=relaxed/simple;
	bh=cFsiaEhIwb2M3eVu20QYprPIRN1wWm6CAGVK1goUbv0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jv550PFh4rPSvK6tj41bsJNe6RldwFfPerFj84Jzih2iqCPVXY4s278TlP7ZexE4IkfP2hnPpDCnpvPfpZEO9ZWleVyuLGs/extq+nxXoGmI6nZoGVExXXo0gzYo8+bplO+CPT9KHqZww2gOHocedmvkC+M7dF48qOzuPbkS5Vk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=gdsV1mrq; arc=fail smtp.client-ip=40.107.220.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gdsV1mrq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=au3H8AHRjfLXbstjIzOtK/rdGEFBLt2hIWRo0k6kLyXQrEhqW0Fq2/z4aJ05oROkXTiasb17gNYVO1aYhx3Vfti4Y9u+m+1Vyjy2aUojU02XctuElFnPWaushgciHMJC4pN4hGyMUbdqQuxFZQHA+l2k6GNdutl5c4SttnOKkDMXRBvMPnL1UbuI/vvCAQOVw6zGvWYi7EWTNfYGc12wXya5alXjoK699Le/2mHtJL+1SkLgShS4c74vnVld0coouzAo3GdWo0V1hHT3MkvWPCatj583Qe2X9kE+3CLHi/gu1eKdFaiNfSfws38pX6oVVqjRogUgtIqIUFJ7S4Lf2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DL4+wdjqOWvxvHnEjOfOLG3FPfrdAcLiqWxn4BdRdWc=;
 b=FBDnEObuBy4dV7NfSeoOLaM43k2j/PMObaYVggc3mK+h2IQvrvU4m+HYgu97plBNeRUIKWXumD+uyFBwdvyFbFPQXAMf8w0Pt2ppbBRgBJcoB+OlE+tL03qIp11SI15IwGyLT8SPpuEQuELWXFtPf62KvAFRoJEyLB52Y2El6hoZ1g/ccDMYM9ITXUvu9jNhoh3oSRKj83LcsvAAzJ+DwOkH4428X7OK26wgEiLThn7AbNEoH3OtVrp5eatIF+niB5SpZbBw0j3/PmglHjWfz0VPFN3z5zPWAk64CCxJNlKyp+sjH47K6oudXDJ1wR0Q/gxOIVz/RFkNCLl65KcEkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DL4+wdjqOWvxvHnEjOfOLG3FPfrdAcLiqWxn4BdRdWc=;
 b=gdsV1mrqLrd13GLbdAWw1+4ZojEzfAQbiLG9jzSxFmVhGrm7GcIfmzfoo3sVX5jz86jWHGm2Dhl6H8QWFZaGmPFZvPlnxQAtBOkz+eDvKmxuHgXIDABvyyB636TZZw2KJXeNJZRdeQF4GfTosy0u9QUAGUnC6ViBqYmo9cQeJ18=
Received: from PH0PR07CA0028.namprd07.prod.outlook.com (2603:10b6:510:5::33)
 by DM4PR12MB7576.namprd12.prod.outlook.com (2603:10b6:8:10c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Thu, 7 Nov
 2024 07:27:50 +0000
Received: from SN1PEPF00036F41.namprd05.prod.outlook.com
 (2603:10b6:510:5:cafe::39) by PH0PR07CA0028.outlook.office365.com
 (2603:10b6:510:5::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19 via Frontend
 Transport; Thu, 7 Nov 2024 07:27:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F41.mail.protection.outlook.com (10.167.248.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Thu, 7 Nov 2024 07:27:50 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 7 Nov
 2024 01:27:47 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>, Mario Limonciello
	<mario.limonciello@amd.com>
Subject: [PATCH v4 09/11] platform/x86/amd/pmc: Update S2D message id for 1Ah Family 70h model
Date: Thu, 7 Nov 2024 12:57:12 +0530
Message-ID: <20241107072714.943423-10-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241107072714.943423-1-Shyam-sundar.S-k@amd.com>
References: <20241107072714.943423-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F41:EE_|DM4PR12MB7576:EE_
X-MS-Office365-Filtering-Correlation-Id: 6131d8ea-9ebd-4fb5-e111-08dcfefdaf79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bypzgEesv2MvroTfKOGqHsnykPUUM+61FSOCTNIZrTX3rI0yxBS+Uhwyi0dH?=
 =?us-ascii?Q?OzNMJpltrfjt9CVi3duP36YVuCVMnGBu/J9yzPSt/4ulQJ0utY0F5MCxmngG?=
 =?us-ascii?Q?+nSkqxRJk1Ru2tZ9Jh4ti2a1Ll1xfwW5KaoaMYodETLYEnJ9Y8oip4B0nyqv?=
 =?us-ascii?Q?CTeotG6ODnuvm37mEJNUfHdOxeGuTDfLfg884XhF8rYNgpmHiViIRy8aizzb?=
 =?us-ascii?Q?Rz1E4FLpPUstFguo+aVm3l3Uy2HqzTbwqp0CMex413bYtTCetK+0sk/GjEXG?=
 =?us-ascii?Q?8vmw+kj9Av1m7AVJCXPmtgvzESug2RtRSi4FXbkd+JB+Osbqcgr1+XXSsf32?=
 =?us-ascii?Q?Tsza1F2i/J53siTOJSmSZUNy/is3hrpl2GeoJqbUk6psIOSqbXADNgNVnDRq?=
 =?us-ascii?Q?hubM+iUptGLrBuEPYi+PMVdcWtSoVwWg0W6122f862iMjpNAgUTWQoCuzRTk?=
 =?us-ascii?Q?r4wzl7uNrvoz/PSBoaHLrLVg7XYfs2hbOSWCDks6/p7XclBsER6ghnV0D8Wq?=
 =?us-ascii?Q?a2gGMQlL1p8wpgHePE10avzgjcT44DbZLm8o4oMla2rxDQ+2GqPo36EJCr1+?=
 =?us-ascii?Q?CoC0QtIhdjCy/K+toXePbMuIzHrFNRpv/xu7ASoLQDFgkrvFQcoWcA3tSREA?=
 =?us-ascii?Q?wVeOtaZ1fxlBk//nyDoVmLo1wJe42dq5R00J243xkevZmnEpCDuN9CMVhcIU?=
 =?us-ascii?Q?8ZE7ogd4LNkzVDPCeNTq2Esp9VcXL147LG3NT8vXAF5N0KE4MW3ueMSSsFOO?=
 =?us-ascii?Q?3ffVZfMrgXXJEozGLBDPCgqM+RS2BgTKWcZ2lE5xhxBNEe+Gy+ndPQ8tFJay?=
 =?us-ascii?Q?F88/6I2uKVPduWX+1t1VAM707zEDm5D2+ghuJtYyermTv3gpuXp3qrweBwjr?=
 =?us-ascii?Q?TXPAZzEpDjzX1zd7YsXMOMZWVGRQs1gVoUXK9GdUvm8ofwGbqKXyI13lXHrE?=
 =?us-ascii?Q?zAmfWjQ+R6R+h1VW3DWTyzFeQmrYXQckmN5iIZ2QEeWxaxMCSwBwbuH41lTe?=
 =?us-ascii?Q?KCkogSUVs9N/qgYKMfv06PfVPN45lVGh6NRK077v42fSa6fS+lDDdzx7UFuC?=
 =?us-ascii?Q?v2fOR1PXOvrg3rbRo7PIoxFbvvXdA4AQdgKUwdHxWedRUCb3kJwyc3D/RmiW?=
 =?us-ascii?Q?U1or5rSmNE5vtsfC0lTKfC4SOtZzfpiajn9svdBiXe1gcki4E/a3kh3feOYH?=
 =?us-ascii?Q?Shwt+bfXS/2Brh265Kkrj5EVOFSPTSpVXjFYdNVm0ZkFLb7eVLDIRKrGm318?=
 =?us-ascii?Q?YCV1JXK8LhgfEc8orP/af3jNCn54nYp9DeYKm3wyBUfWW6hiujb1iRJxNmKq?=
 =?us-ascii?Q?crqmy0XlEs0KMN7i/XsGkO5TLWxwxgMk/OtYLkJsQoaxQt3bwR9HTs60EAJZ?=
 =?us-ascii?Q?oaQsLmiA9wcuS0j5v8KOY1aMbvd0fzM9Oqvof/HeYpbD3irjkw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 07:27:50.3167
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6131d8ea-9ebd-4fb5-e111-08dcfefdaf79
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F41.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7576

AMD's 1Ah family 70h model uses a different S2D (Spill to DRAM) message
ID. Update the driver with this information.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc/mp1_stb.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/pmc/mp1_stb.c b/drivers/platform/x86/amd/pmc/mp1_stb.c
index 6a54dd3e7f4c..d19a13a82e1e 100644
--- a/drivers/platform/x86/amd/pmc/mp1_stb.c
+++ b/drivers/platform/x86/amd/pmc/mp1_stb.c
@@ -245,7 +245,10 @@ static bool amd_is_stb_supported(struct amd_pmc_dev *dev)
 		break;
 	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
 	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
-		dev->stb_arg.s2d_msg_id = 0xDE;
+		if (boot_cpu_data.x86_model == 0x70)
+			dev->stb_arg.s2d_msg_id = 0xF1;
+		else
+			dev->stb_arg.s2d_msg_id = 0xDE;
 		break;
 	default:
 		return false;
-- 
2.34.1

