Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2041.outbound.protection.outlook.com [40.107.220.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C459424677C
	for <platform-driver-x86@vger.kernel.org>; Tue,  5 Aug 2025 09:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754385582; cv=fail; b=a43Fu3KlVpX5JLicqtLNGdQuvjdj6Wu9057AGM5gfJo2fRQFNPqCcIddLHkqADJ6pzqM/zquQny0qk+jkOh0AZHL0lLV35O3GUPHSUzh1H8BysJl62Gq9nO7/Vx4+JD2o2rOHBmIOXC9PvxlAknAp+0u7fHVqvOA4pTIojzno38=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754385582; c=relaxed/simple;
	bh=Dh1pGKA3v+Sht99/3V8l1qREJhYPWPBWFeKEQfLGVv8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GfaimDFbB5G60itYBrAEOdYpg1ECOkeEk9FB6JIPOVn0IXUSSrZOLW62Z16BISMBkflkP9CsYZGVYPJfI6LVLc/avhRdqCL58U0iQ9hKB8OIJVnvMtrU4DgDPYH/6t+DUvT7zJoZN6iBtcUMJn7KahvlajItw2Qt6xkJdqfvDI8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=scP3KaWw; arc=fail smtp.client-ip=40.107.220.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="scP3KaWw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nsIUyuRtHfV/1J+rLEf7TE5ftSA7h3Hc+fZV8kN+RNL0QTmLQweEiCD6S7/JIwqZ3w9u8xBOIJ68X4giOYYAmisVZBXmPItcpFOCInT4oWvM8LNDSu6qkpMCE5LIXvEIP/D1knuWHMMe5Hxf5nyofj6tGuLun5QlaeNHDiB6QqZEoB1HNDdxHHpf7mUlbFP4Y7MVXU2EUWsIOwCiAskhQ0ouNvilESwiBCnqkiqc8sruMaYYJwNj80nb+GpGGGjZpGf0ovW2bytLABRfm7QmtYqpsnfhnme0LkjUtxSKabzIVwKbOHWzyyywg7XiOaG2iwdfN5+Vr0ThaoDcx6mGGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YGMqJaO+F9o4phkPCIkVxRgSDrAalFnsanMwMeXKVtg=;
 b=cdnhHTZyvS3rA2kDbrt1qGzygFGA5gL25bUlg3ismpDyx4KbSXsQzD6Ufi5e42UrjFpdejDUyB8FTIjLriUolJ9PAmrGrr0MQVfrHVgX20rAZujRqb5OkFLJ0kTpxTfM94m3zxW77lSX/uWC21wolxM+L9l9tCc+DMSxcmeDBPv8G0NwA7kO6FFEfXBu1jZTEx1AQY+v5djgaFLVcFTF9902nB4Qt4hK05nL1LWkPWs46kL5W9t0oOCyzNurb5SOqgKs0KKpRK74Bt8T11jdUDUFNERRzHD96moWZ85YmSINA+PW0VTv3b8dM3TJUX2pA/LsIszGH0iV8hOnXLIhfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YGMqJaO+F9o4phkPCIkVxRgSDrAalFnsanMwMeXKVtg=;
 b=scP3KaWwc++wcw9/4bdbnTgT/l5xvfs3YfLsaRwSAnbu9JL+V5z1v/clW4ijtUJ9dHcPP5x3QBsMlD50TjFM3pVKtVqe0P+b+aTwA6t5/dF6/xwaMCt0Yc04vbmHM82OLthaiba/VWSbeDjE61zw9DglENwsnsijqxl+AcXKBDU=
Received: from BYAPR06CA0053.namprd06.prod.outlook.com (2603:10b6:a03:14b::30)
 by SA0PR12MB4432.namprd12.prod.outlook.com (2603:10b6:806:98::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.18; Tue, 5 Aug
 2025 09:19:26 +0000
Received: from MWH0EPF000989E8.namprd02.prod.outlook.com
 (2603:10b6:a03:14b:cafe::7) by BYAPR06CA0053.outlook.office365.com
 (2603:10b6:a03:14b::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.21 via Frontend Transport; Tue,
 5 Aug 2025 09:19:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E8.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Tue, 5 Aug 2025 09:19:25 +0000
Received: from trento15c5.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 5 Aug
 2025 04:19:24 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>
Subject: [PATCH] platform/x86/amd/hsmp: Ensure sock->metric_tbl_addr is non-NULL
Date: Tue, 5 Aug 2025 09:19:11 +0000
Message-ID: <20250805091911.483825-1-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E8:EE_|SA0PR12MB4432:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e4476ee-b2b1-428b-ae45-08ddd4012c61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?a9aYnFGrcCpg9UVCzGyKkQ5TxpIG+bouRmIhTwgF3Q8i1XrEFzv0+G6td4Qf?=
 =?us-ascii?Q?Gpt2wQLKwcysarJUwcpCfLf5DQXVWFkA/iVyA0lsv5vrEgzX74Imu9nfawSg?=
 =?us-ascii?Q?SpmEY4uhnHrTI/9ChAhO40aZyWFaM+lMmBtG1DFOef/I308YbsYf7Y7UKa7y?=
 =?us-ascii?Q?53TAG9HjGY2nNlPAaT6xT2zUsD5rMO4UZBExkfZOePacd+ARHrC/+Z8QZhV3?=
 =?us-ascii?Q?sfWkexFx1RfbYhg8xKA2iBRwzwuR3V/kcgND6TYgaEUE0QBsGtBySx0IOfB3?=
 =?us-ascii?Q?A+IbjVljztZMvD7iAiX1qG1wsdGaXebZV5WdPBoIkwnEgyk7lGysAE8whFiD?=
 =?us-ascii?Q?SamcS4rmrg28yu3FAErSHCd0boDa4ghdddDGuvl6KPHlb8fLCwbDVrpvjlLp?=
 =?us-ascii?Q?pZAkkhkfpgwYNQl3KBOXwWIFXaGF3FS+3WbDGZUpkBQbRWzF3s09vm2dLAyc?=
 =?us-ascii?Q?vIBYrREchoj2Am43eg/PMzLVUqh/6BWax39d9tdJtST8SJLu0sGMTsb4v9IK?=
 =?us-ascii?Q?JQuQZuTAbGocLnONG96yoIrXlcct6ts8AlHxYw/FdQmiydO7LJNWA7xGdqYg?=
 =?us-ascii?Q?mRX7Y7HvjrHuWM1jWaSaLH2i4dAIUUu/xx8Rw6+dnaltLyuYZJ2THsol4wGR?=
 =?us-ascii?Q?+C+yesOMOWoa99BfcWHeUa22aBlJIIv2Pm5Qx4zqXi8BIB4H/yzCHv5s32or?=
 =?us-ascii?Q?GU46bOvXwR0dSM9rxO6JoBbJg9lPOTkUM0smEAXGS1oyWg+blArfsZJ6+CJv?=
 =?us-ascii?Q?jMhKou02WX+0E1dBM5RUidN538rQrcciDjmRUai18lgyPqnLww4hT+namALW?=
 =?us-ascii?Q?BBjC43foMcXk95Xp1hSah/qRVPPZqJW7my0p1vbl0MrtvPw1qs+IcaluWZ+e?=
 =?us-ascii?Q?jSz5yNi1u6LTlntpjMNuVrQV1yzF/d+QNMjEC9vfVBrEqRIdt1GXjWEEdI6A?=
 =?us-ascii?Q?je3n5CH4D/I8xft+P11THVnWV6lYykSIhvkcuDk3elmD/JV0y07Z+pGlz6lD?=
 =?us-ascii?Q?Qqc/IvMvwfdwVssYDRiLNP0VvHQmOpuitxUG6gbdoUuen57j70FsVXHaGLXn?=
 =?us-ascii?Q?dLd5JC/G5giH9oLSGjMnIdcCaaPndF7qK6SMrEmmEB9YU8cyzgU8bGUnOurh?=
 =?us-ascii?Q?ZVSHVpxITS0WrmPknMabE6Uc9XtSNEQe5GfZ4wbTJxqXZGwDKb7YnYarXWoC?=
 =?us-ascii?Q?mua2vlwTC8AEL6skM935NTdfvDoyCZVOXaCPwaaWDVSwEhSBr94CUABy2n3S?=
 =?us-ascii?Q?HaObjfz7N5bekCoTOVUji+7izoNoaxazNywhgOUNqY4OkDnASP9Tje2OA04S?=
 =?us-ascii?Q?eqzRC8PJw9kH7XB1X/kgDr8zQqfT25pDfAMWNCJgQgFmTcMyDP0LNAIwMXAg?=
 =?us-ascii?Q?WYnGaoz/zavSt9/aEx5Lt8EnDEXL2hEMWhdMs+Z+Kww61Jfyoz4/bqKNyNzf?=
 =?us-ascii?Q?gC/dwJ/KzKn0YG9zrW7jwls+CdXnukZyPezHqo3Rutj0yL15EVXfYDA2qByV?=
 =?us-ascii?Q?gr5u4zg1HClpTJ08ejnEs1lzN5I956n4ROfx?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 09:19:25.9784
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e4476ee-b2b1-428b-ae45-08ddd4012c61
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4432

If metric table address is not allocated, accessing metrics_bin will
result in a null pointer dereference, so add a check.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
---
Rebased on review-ilpo-next

 drivers/platform/x86/amd/hsmp/hsmp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 885e2f8136fd..19f82c1d3090 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -356,6 +356,11 @@ ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size)
 	if (!sock || !buf)
 		return -EINVAL;
 
+	if (!sock->metric_tbl_addr) {
+		dev_err(sock->dev, "Metrics table address not available\n");
+		return -ENOMEM;
+	}
+
 	/* Do not support lseek(), also don't allow more than the size of metric table */
 	if (size != sizeof(struct hsmp_metric_table)) {
 		dev_err(sock->dev, "Wrong buffer size\n");
-- 
2.25.1

