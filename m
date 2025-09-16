Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012059.outbound.protection.outlook.com [40.107.209.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54C9284881
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Sep 2025 11:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758023539; cv=fail; b=H9G+K3dhBXEr87ytWipyrr8276RdLyeiVRhQ38qgr+691B97AiFDFYWysDTQ+IIigCfet87pWCParPD3lgL+cHtrZicKZliuACrJAT9GemB1poR43G4SLi8lpLOq1cnEiIRKrkHd1t0Osf9iUVKCX4NgksOc3D6BXmqtlr2SitQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758023539; c=relaxed/simple;
	bh=SFoXsOVlQ1sLbMyfRJF38mmRnDJo2nwQZZ99FtmnTPA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pCVlKetvJuBMLLI7ronBCS4pRNDwSfM0srzBXdbI17v4sWIXWVbjRL2zjQrYFiAEFFVaFO+HGL48GDz14YP51/TsrBnMO395IULK35qRpIvHtaRqy43rkvQu6eGsgNbksMbvvGxuTrQuAbXnDfBqzZOclSxKDqtq+bGo9+j8n2M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=THm4nKag; arc=fail smtp.client-ip=40.107.209.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="THm4nKag"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jEVkh31wA3Unnp4mhVkHaGsnnozNJZo5HN57yKs0W/1VdghfrACmk4c3V1TBc7s2F2b+FOKgLP0aMCKjpCm1BVgAuzbkZygbiqoaHFQy52Le069GnMq/WlL0gxxskBgw2seakviD2ndB2dU+ixzlujq4KwRteWgCUwMBEzUUIt3hZkX5I1MvDvjhQo2c+tJx9n6l5bpPAtYmT2mOaVg9H0uQ769i6Zz10T+XS3e1gUXQ3T7baEJoRvAi+FNbg9vARsNVf1yBB0PFvrGPJ4woNyTWoAWVGMsq7+iJZum9f8Fij7wftDFhQ/w1SoRdN/rYTXzg2i73Um5If2Shii/XNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9lNGcExw2CT3DMCLt5p0SmFhg7sFMuy/IDHKIdBt2Ww=;
 b=KVSQEEVhXEaFTH3C6Pi4jhsp3gHRsvvIVlN1DxjXYT6toxx580aLrDlJyCPQn+DoORm55L9/S16Q0bpKXDl8SWMTzxVlJy2+OntrzivVIfMi4ovA7ErjPqQ1BtPsvfbsEric5TdKsA2ENwwf0ltlAnVmPnLUGZMRJDnOgFqf5D8rJ4uw0QasRVfIuODv/d0nxPOje/nXLpTOSZkUhgFOtoX/XMeXLSocQW0ocQwBELjhaSaDPr+RiNzuYVBVOG3e8TRwLdse6hfUNwO5Ejw0yGVOMIG/KXKsNBcRUk4ChfQvcFYsAwLgSF9go016QCwbU82wjzqAP9SpPbM1uyPXTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lyndeno.ca smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9lNGcExw2CT3DMCLt5p0SmFhg7sFMuy/IDHKIdBt2Ww=;
 b=THm4nKagpHrAmSpAXiWviMy0HLzalO+orv7AfGHpjSPn64K9HR11HmJA2gIG7z8ALIhgh9Prin19a42nVUZbIuXjkB2cp3VA+ywHUTYMIh1H7LO2eAXjrrc5a10MQ0y/ZbQvMnnolYuloiOdT67j3rW0umkqc0vQwnxtu+uZXog=
Received: from MN2PR14CA0011.namprd14.prod.outlook.com (2603:10b6:208:23e::16)
 by MN2PR12MB4391.namprd12.prod.outlook.com (2603:10b6:208:269::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.23; Tue, 16 Sep
 2025 11:52:14 +0000
Received: from BL02EPF00029927.namprd02.prod.outlook.com
 (2603:10b6:208:23e:cafe::2b) by MN2PR14CA0011.outlook.office365.com
 (2603:10b6:208:23e::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.20 via Frontend Transport; Tue,
 16 Sep 2025 11:51:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF00029927.mail.protection.outlook.com (10.167.249.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Tue, 16 Sep 2025 11:52:14 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 16 Sep
 2025 04:52:06 -0700
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <lsanche@lyndeno.ca>, <hdegoede@redhat.com>,
	<ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Yijun Shen <Yijun.Shen@Dell.com>
Subject: [PATCH v2] platform/x86/dell: Set USTT mode according to BIOS after reboot
Date: Tue, 16 Sep 2025 17:21:42 +0530
Message-ID: <20250916115142.188535-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029927:EE_|MN2PR12MB4391:EE_
X-MS-Office365-Filtering-Correlation-Id: 8aa3926d-cf4f-4537-2728-08ddf5177a5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AdXzgkXx+CCzrwavxPs0l9CQqCPfWE+tN9SRFbtfKZlO9c3fONp5IvhJv4KJ?=
 =?us-ascii?Q?dzqabjm2930/6nNGKufpSP4qF/2wIH9VhPpjzII5NYGVD1jvmCRkqksrtXvV?=
 =?us-ascii?Q?afBwsrAFcDul4BUSWoZ0eYzKKpJ6xSkizhqjYLJOHPs3+gtEecQmeFnCG//i?=
 =?us-ascii?Q?1Qzd82Tz8m9dX3aY02CumqpS1Mf8R5ISQgNnAdWwCRVnqw2u1gPFWz276Fmo?=
 =?us-ascii?Q?+nuMNAbAzg0i5nJ896qf3ZiRSuZc76SmsSgQoAjrUg+YjUjBoKrTrqwgF98g?=
 =?us-ascii?Q?PEzR1usXkJTnCvWC2CspAAJe1wq3ZdnNJBLigrPZSDkcpn6ngPcpi6apBNUc?=
 =?us-ascii?Q?FRLLeDvEhlQQYMuQMrLSkAePtpMT6kEFRvRqLpFa0G0UoFxK98oARnDqqx2I?=
 =?us-ascii?Q?rdUWzug9zVN3ThwO51g5ie6T9b85sLNFa35k6jkm+E93vVlos84RPUkmkyag?=
 =?us-ascii?Q?WTJ11VO8brE/lu5HqejHeQxB1ltVwxgHkLJenHsfYy+aGSRqIW62Xy/W4hf4?=
 =?us-ascii?Q?aUpOZJNtrsX+lJYODlsmahKOhZYljPOze8vtXYt8MjbP/WTnASTFvGYa3bQy?=
 =?us-ascii?Q?6zPhSW4VNXKEsnjjGZ0jyPrvEPIWgFrHumfqsDTPYcg71gq9sf2E1uzDP3ln?=
 =?us-ascii?Q?nl9DalrvG/B8+V17Z0j2pRDGnpaUQAa+9zfUSaMWCDcdT/DDVxh3Ee8XZvs3?=
 =?us-ascii?Q?TOvCGNKYCbBFLkk2a3nYl9l2yjd+VKqxjqjx15W0kCvhAV5DEcVF34rKmuaG?=
 =?us-ascii?Q?0YXMgQHa8SMqo304pF4UJTi4PsoUStdASFhCtdY5mERTnssoHoztILfsULsY?=
 =?us-ascii?Q?zZu3RB25Hp+PUm4PBCAvpbuJX+0OsNOPqSnqDWHO/sK16JtsK9jIRATncYPT?=
 =?us-ascii?Q?owfuDGU8kU+BU0NCuDkSvJaKxlw13V8ej5pW30UUGSIaf9ok/QZhWzCuEJ8h?=
 =?us-ascii?Q?UEMKMSPjcccKq/okQRGQ0JtmAJ+6t3wDVvAXfVD/BRdKkpRQeVbhycYqCalw?=
 =?us-ascii?Q?NZJIuFqowgBYUkxO2QMpAFTFFhB1qs+U5NLYJhB3DrYHe0T785x7CEhUogi3?=
 =?us-ascii?Q?ydNxSlmNSeet/PZlHnzjHeaNaH9qSP/+pz51Zs1fA1HlZeJxzC/dGcjYUH7O?=
 =?us-ascii?Q?IX3yrG0nY1O4CsWRj0NNZTXol4PjoKSMZvAMJoNqW+WJZ5ausw3/wes9ivvQ?=
 =?us-ascii?Q?nkGVXWiv9L09a+UXaCXqGGkXPBhmL/rPaFLewqMGT3HVnKnIkUcitKcxF1Jh?=
 =?us-ascii?Q?sj7H5LJxrzaW+KAuEiLyOoLfK77nYPj4jXkXOC/5crET/gwBoertS96m4BQu?=
 =?us-ascii?Q?//Mp/1HOyQ8dAmQgEJIRxQDjQBFwvnCGeHf3uo/xQAokPhj3rg3o+h2Curb1?=
 =?us-ascii?Q?Wsv4kKA379MsWNBofNEKlTvys0f8uBkF8/jHYAt+GWZ7wrIcpOCSxuPWD7i/?=
 =?us-ascii?Q?GFinq5pw35+eUbBlODiUGKoWXLsdXDj5MxOEG8gO+ePC+GLQjL+VSYX2QzdK?=
 =?us-ascii?Q?9oq9tt/HJs08hWfieo8kN86yFC9m4WifvM6T?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 11:52:14.1835
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aa3926d-cf4f-4537-2728-08ddf5177a5a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00029927.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4391

After a reboot, if the user changes the thermal setting in the BIOS, the
BIOS applies this change. However, the current `dell-pc` driver does not
recognize the updated USTT value, resulting in inconsistent thermal
profiles between Windows and Linux.

To ensure alignment with Windows behavior, read the current USTT settings
during driver initialization and update the dell-pc USTT profile
accordingly whenever a change is detected.

Cc: Yijun Shen <Yijun.Shen@Dell.com>
Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/dell/dell-pc.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/dell/dell-pc.c b/drivers/platform/x86/dell/dell-pc.c
index 48cc7511905a..becdd9aaef29 100644
--- a/drivers/platform/x86/dell/dell-pc.c
+++ b/drivers/platform/x86/dell/dell-pc.c
@@ -228,6 +228,8 @@ static int thermal_platform_profile_get(struct device *dev,
 
 static int thermal_platform_profile_probe(void *drvdata, unsigned long *choices)
 {
+	int current_mode;
+
 	if (supported_modes & DELL_QUIET)
 		__set_bit(PLATFORM_PROFILE_QUIET, choices);
 	if (supported_modes & DELL_COOL_BOTTOM)
@@ -237,6 +239,13 @@ static int thermal_platform_profile_probe(void *drvdata, unsigned long *choices)
 	if (supported_modes & DELL_PERFORMANCE)
 		__set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
 
+	/* Make sure that ACPI is in sync with the profile set by USTT */
+	current_mode = thermal_get_mode();
+	if (current_mode < 0)
+		return current_mode;
+
+	thermal_set_mode(current_mode);
+
 	return 0;
 }
 
-- 
2.34.1

