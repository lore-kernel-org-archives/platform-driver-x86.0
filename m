Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2082.outbound.protection.outlook.com [40.107.220.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568C05FDB1
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 Mar 2024 11:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709725481; cv=fail; b=BQc46Kqod7SzXnTJx/RvSV50FwBggvSAKF+E4aqS8cBzjVb4XBe8ufRdv+EyKkFjtYf9JMl6ukKykt0qwSbl1fGorsntVQKsVYgm5VUgEcApairXTwenmThpmYLSMliUKrdqvX/0mV0F0Fo7kKUcrQNA7d16z2cBEk4VMikrOdo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709725481; c=relaxed/simple;
	bh=BdumsJkPcfeNrVZLCYoaeXIkjCYT6IoohrXkN5T0dq4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oBQFOnCXLJbSacEQWGG4udaOw5dWfeTw/gLaZS+JhK1hLKzNdx8LMumBia2Lq781ybugYXfToboWhrOr8OLD7nHaoDyDp9HTT6jvn579iQbzCqlgorB2Jxm61N9e22Zkajm5ox3pbubsoJ9UTsGB5Bk/0K1Uez0/y3GGA1QGPTY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=IBxdjsAy; arc=fail smtp.client-ip=40.107.220.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="IBxdjsAy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j+b0atlUUSnaG2ByrPKAN8Og8scDv9X7agQwuk8dBBSQKh7iEXnk7bGcKwL1x0Lcl532nHGUnaNZIsmjtTAtwZysqGcrc3r1EYoopulsDQhLd2NK2liHfMJ6iiWo/JXUENmyipA/WjB2wXNo2ue2Fqa7pKj0xHmm/Zsq781MxnGC7q31/NQZXr5zZDtbPGYdUYIqfXM+NwlLB7Y3DqXuWiKLSrZ45uhXpHe+VUJQBgzt7dN/bfWHkAU8y9JvV7hCd3QAKlEudOdwXkY4oPxu7MoSxhsIPcLPSN7Jv23ODRJqihCnlvp6I9V/Wg9/Ctdn73knKngN+uTdJdC3MQF7hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yRRvUY1ihCJ+K6whXIV//1ljGbAffxhoBG/uaF+2umg=;
 b=UGRdpKLPnmtqGYuHsfER0oQcFB04Dz7D+SncuDYIT9ez1y2CRq116Xk9grXkTuSL8/Sx+uujMpbpjjdw3oOvmC8m2NerHr2IruWXxQz52kKlEfJuz49Cpcba46bLSdM3C/DLrmLYDNp6pW3ejTQCPi8h+AkOsrIjeSRye/sJi86AhLlCwF5TjoGCB8OOubD9tz92Akz0ar65Ssonii3Syko+MNV+GWhEhvGcuK7t+fWMuBGKXwBDNkARnzg5ERdr0gaTFfuxeKQByIFvC6U2UPaY+mxQrzij8hIRzt83lZcQU4KNSRwf2Cv8KGn5ec9G5pz1yqGetcVglStdr4c4hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yRRvUY1ihCJ+K6whXIV//1ljGbAffxhoBG/uaF+2umg=;
 b=IBxdjsAy50nbSHEF4OeNXDO0YYSwCddk0ACQUNvN79HT4fJH2fIn9R035S/3CqiRDzSh3+CEOrcOsTN1E3R9LdaZKXSYdto1MyPbLcTpHvqqmhR5Fq7iCTeTz8qGmt0euNSDOHXutoAG1A/+eOaCUcreJVL9IQ3qu3BvdV6JLl0=
Received: from BYAPR03CA0024.namprd03.prod.outlook.com (2603:10b6:a02:a8::37)
 by SA3PR12MB9158.namprd12.prod.outlook.com (2603:10b6:806:380::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Wed, 6 Mar
 2024 11:44:37 +0000
Received: from MWH0EPF000989E5.namprd02.prod.outlook.com
 (2603:10b6:a02:a8:cafe::dc) by BYAPR03CA0024.outlook.office365.com
 (2603:10b6:a02:a8::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39 via Frontend
 Transport; Wed, 6 Mar 2024 11:44:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E5.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Wed, 6 Mar 2024 11:44:37 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 6 Mar
 2024 05:44:34 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 0/7] platform/x86/amd/pmf: Updates to amd-pmf driver
Date: Wed, 6 Mar 2024 17:14:08 +0530
Message-ID: <20240306114415.3267603-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E5:EE_|SA3PR12MB9158:EE_
X-MS-Office365-Filtering-Correlation-Id: b87de5c2-5c04-483e-c82e-08dc3dd2cd05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TiQ/XYHOCTWwdK2glC4zi7CDmECqVcvJO9Ogo+lCU99VMwvh/TKj9ycp123xe032FVSmTi0omixGwI4MCzmkbGZ5iO/Uq4hEXc7bpYnKFtEfSomDakKHrKkZ/AvM9+NqbksBNWCCLmqHj5zx7A2688LZt1tD+ucDIjhHVsSFK612Qza2XH8Ij6/8EMD64LU/nA6qQNyvLEWq2QhV3Seg1W1KOgXOevdrpFlGIayGsYKyVuYqG/Z93u2fnX2Q53iGIhn1XMj2782l6oxj0fp1NJ2oB/lDFUTwapDD8YpIpCyn+PVm9zGmBXmK+GQreBAhUk2GlE1tyrxwk8gdSLVIZxEPwfS1XnUEn5pWmy1mMajpVvsq4oAD1QaGG+EzccCTSScVwGW03jF74xEtmp8gXNn5K5z93n7egerXK1aGcE1AA8YJktOFzWl6sFtK4UgRrua23Soo30rXwOHiXnsKcTaqebm6Q0LNfG7B9okahXwTEll5KcY5PC7qFmCES9xSbZBZiVkBFBxCPxH/Kbi0wwGtatsJ/X1h341loxHLmUjLn/GEka9wHY+pro/Iof0uG6iHP9qwbHnwjmmLs4N/JWXNhD85GHzvCmYjGA89S40L8j1+0739Om3ZxVVCsaikZ6+mrhOyO72Bff2GyH+A0BfViANMjxw5q4L+Vz30PB+kdSeTUp47O3TJlxRkN5+oydxgt/aTMNcSNhInq9Y8T6ZNmeFr0YgjrwgpYh+dlRFVabeXsaWKCiDekKUfqlug
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(376005)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 11:44:37.0183
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b87de5c2-5c04-483e-c82e-08dc3dd2cd05
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9158

This patch series includes:
-Add support to get sbios requests and static slider as per new APMF
specification
-Add support for the APTS (AMD Performance & Thermal State) method
-Disable debugfs support for 1AH family series
-Add support for heartbeat notify event to OEM BIOS

v2->v3:
------
- Unify apmf_sbios_req and apmf_sbios_req_v2 struct field names 
- add Reviewed-by: tags

v2 Resend:
---------
- Address build error in v2 when CONFIG_AMD_PMF_DEBUG enabled

v1->v2:
------
- Update commit-msgs
- Use 2x4 array to store power modes information
- Improvise debug prints
- Fix alignments problems
- other cosmetic remarks

Shyam Sundar S K (7):
  platform/x86/amd/pmf: Differentiate PMF ACPI versions
  platform/x86/amd/pmf: Disable debugfs support for querying power
    thermals
  platform/x86/amd/pmf: Add support to get sbios requests in PMF driver
  platform/x86/amd/pmf: Add support to notify sbios heart beat event
  platform/x86/amd/pmf: Add support to get APTS index numbers for static
    slider
  platform/x86/amd/pmf: Add support to get sps default APTS index values
  platform/x86/amd/pmf: Update sps power thermals according to the
    platform-profiles

 drivers/platform/x86/amd/pmf/acpi.c | 136 +++++++++++++++++++++++++-
 drivers/platform/x86/amd/pmf/core.c |  15 ++-
 drivers/platform/x86/amd/pmf/pmf.h  |  85 ++++++++++++++++
 drivers/platform/x86/amd/pmf/sps.c  | 145 +++++++++++++++++++++++++++-
 4 files changed, 374 insertions(+), 7 deletions(-)

-- 
2.25.1

