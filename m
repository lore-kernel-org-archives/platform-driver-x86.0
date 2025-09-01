Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2065.outbound.protection.outlook.com [40.107.96.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222642F8BE7
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Sep 2025 11:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756724543; cv=fail; b=tUThq8tLVewh87W7Zm9QKp4eReJF/TsYIQ4y8z1Rtrpwg2h+u7TKW3tcuYIOIcGJ0LkTHClgRv5gDPJrjjw/NzA7JCkAR8H03a8LJOIS+j30BCenb/LVyh6TfqMBTQoF72ExEVjuDQh+OuMTJTxbzxQIPg6tq5wQKQHVpjVaiUk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756724543; c=relaxed/simple;
	bh=hyDKeysFKrAhukI7u5MRmTbhawXbKecwN/1P2IrYVjM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YqUVSOm8QfDvZVZ9DdfdPxYBrF8oouak/UiJDpxAVIgB4+7q9w726n2QTplJA82cITs1gFqAeCRxkJhZ32VTq4GocQ+gm1rxGfVkYDyxN0XY/j8LJ2LqXjjUvwNDKoY4VE5+k/Ed7K0GykZVl1+NZNtHV1L7xZRDOOObieV2+Ks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=u57MLrDY; arc=fail smtp.client-ip=40.107.96.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="u57MLrDY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k2IPEx10FjkxqaadfKjsRsOPCQ82AIpdadH4Zaf/AgwwzFmvcW+GmJTAQLGhIiLd4YrQ6gZIKjBMwMeLV41+2uwK6XMaoLGEkZqiF/YzJJJv7ruUPEx+6oGQ8BdsXpRo3EJ2e8ZTaVmCJrT62gBck06yjmhcG6BSctB5ojYSYo/7rbe1KMA7Jg9k+RszlnfDXurjhC1AJzAgDa/mCoJR5TTRGODh2itumSfQvH2dz+j6+fq4vsBWRm8K6vjXa04JShoeM662k9X70JBG//XguHbwN63xYg3OgIGi1NP89sZ9N9EPQ+vUtZLiN/w1MwhefblumXhrUqCxP1ZsrXCNaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CQAzj2lOVY+6cewbQZW6KZMzIWw2250XnfipFb7JdjU=;
 b=u+S2ne+VRq1z7hOvu2ZIx39HiZ+csIryT0/EKZVMvfh0InCpKgor3NYW2G31eT2RADeUqkTUYTwVCieSKlno9gagVxrDYEI5B+Y9X5RVfXalvaQraJPIxKzjTJ54TvYse69M5lJtYNCbC/7HkEM1sVzco8bde6Nmek4ktlOynoY9eDRlVhqKon9LyvVSgPoq4hJhhQe/Z0Z6gENyvO0qlmTFYvGc8svvtv1b1BiQmV3EZnIkTPZQo0AbaRBu8zHeMPsp52V576UMuGKP5pERcmrzqzGQUli1YcrY9fp+FnBnfLWq5mXi4ElIzalbPuRZJbIS3Ia30m84Igkrhn8Zow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CQAzj2lOVY+6cewbQZW6KZMzIWw2250XnfipFb7JdjU=;
 b=u57MLrDYnilnERJQGBaHcGacBn8ngMDQDoBW7YsU9JH5+NgT9Oh7hK6IdGsD4cnYEBJYi2RMlpHETw1C3uKw1xvEDpVdqE/IVl+SivWQjkDvPfuy45CZwLdZYgbsekW2IVjJQcSFbDrN05gLPhcDhPsc+pUOBcMg2cIazizVvVI=
Received: from MN2PR05CA0061.namprd05.prod.outlook.com (2603:10b6:208:236::30)
 by MN2PR12MB4141.namprd12.prod.outlook.com (2603:10b6:208:1d5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Mon, 1 Sep
 2025 11:02:19 +0000
Received: from BL02EPF00021F6C.namprd02.prod.outlook.com
 (2603:10b6:208:236:cafe::7f) by MN2PR05CA0061.outlook.office365.com
 (2603:10b6:208:236::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.15 via Frontend Transport; Mon,
 1 Sep 2025 11:02:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF00021F6C.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Mon, 1 Sep 2025 11:02:19 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 1 Sep
 2025 06:02:19 -0500
Received: from airavat.amd.com (10.180.168.240) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Mon, 1 Sep
 2025 04:02:16 -0700
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, <Yijun.Shen@dell.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>, Yijun Shen <Yijun.Shen@Dell.com>
Subject: [PATCH v5 RESEND 6/9] platform/x86/amd/pmf: Add custom BIOS input support for AMD_CPU_ID_PS
Date: Mon, 1 Sep 2025 16:31:37 +0530
Message-ID: <20250901110140.2519072-7-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250901110140.2519072-1-Shyam-sundar.S-k@amd.com>
References: <20250901110140.2519072-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6C:EE_|MN2PR12MB4141:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d06dd77-c1c7-4792-d7e9-08dde947055c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ub1eNuNlom3AZtwp9eS1M/qxceQ/5ZykeN/V4/AbcjDlOrfISZF9AoiG1iNl?=
 =?us-ascii?Q?Hy9v7/bCVNCOIOP00xk49lTmgbxXapixKugF+U7Gb0pDPdHFTIv/OkIgwwrx?=
 =?us-ascii?Q?eznNk20VdxYj33QbkTKPULphI+cse+UPZcNGjdr53eDOHtpIDBcOMnj6Gpn8?=
 =?us-ascii?Q?hLtxNjnK/9YRuivw3IQ64pYdJGNbqtXV0C3sT13BNyYEQYv4KlpDIVkFyMAd?=
 =?us-ascii?Q?s5yNqBqwzt4awtrsnWzEUl/cnA635aIUzXuVeJ4YIDpU7LIcerHVQVuI31ot?=
 =?us-ascii?Q?dLACkDVDfb6rLjqQD8wHPns5G6F2wHRTw+sd9xOoTN7eBhm6b3MZMPVtb80g?=
 =?us-ascii?Q?Gge+b5Npohh7s1ZvVvGgO6m8ettJPOo/oSqbgX4SKFOVXfODe0hjKHe131n4?=
 =?us-ascii?Q?OT5bywDYW3BcApnXh4GhhjsYwGWfUUiQFMnskj5+yadfuVEimjHqi8h5k5I5?=
 =?us-ascii?Q?ioFSgYx+qWWI6OKjuhEGYFeMmQrt5pxA5wHRG+5DSXX4QPJ2qRh6q5+H3zHF?=
 =?us-ascii?Q?9OWR2zKuGwHEj3q2oTP0vgplkDuBv/weodWQvMdz6/3JFfzqjs1H9gOyRHUf?=
 =?us-ascii?Q?jWnskPjTX2hJk4BwmgukDv0vnO3nVC06YUe67Eney4Lxabj1UHrI+HTqowjM?=
 =?us-ascii?Q?adphsjXnw3D6uLjs/9+/6dzMGH/dIO5wLUUybyZ91z/xT65U07DIl6wqPX1E?=
 =?us-ascii?Q?bDvsq6FlzSi38YAlQxlT/XUuhVTUSHMxYaGWACd0BhFz6P5b1EvyaoID/r5R?=
 =?us-ascii?Q?tLwBvetUnpCt/JMeH+GNlb6mbHWrEOMtGhUo6awxIj9dT5Y12zvOPBn0R7Mk?=
 =?us-ascii?Q?slOwvGNOOYP3devYzwaMc0qmB01/Gdxw4kHsOcRtw70uWB4nGd5smYLB2h5h?=
 =?us-ascii?Q?+B7tIP30b0suLbXw7O7P1wEwSu4q2nMCKSa+GjZKU9O4la91k+qqBaJju4Za?=
 =?us-ascii?Q?tXbrE9Roi2BCGbxcztpxjmlFH0IF9BUq4G/ydkoeNMPiF6QxypVMrLRGtJIv?=
 =?us-ascii?Q?61q9/FT6i3ugLYCxuNJfzXN6z5vT+S/+w7hYk4Z7vqZPovcE71ps6Lh9p1Qn?=
 =?us-ascii?Q?3QRlwj0FZF7fn2s9515QoA29f6FqSCzh5ePUL+kyqs5WsCG3U2StoSLAZrkX?=
 =?us-ascii?Q?cZqXt6ycVGZpzkbZcRD0XZKHkXHWkt8JJzGNDVvEvKCF7Y1c+CHRDZEkBN02?=
 =?us-ascii?Q?kemdQhfsW6aD0mf1JZGJLM8ZDwQ5+1EscKrB8apSZnWeahaKIw+pLi37kuae?=
 =?us-ascii?Q?r7WMd8XevQPm0quOeJ2QCcccqF563u5051QufPjXwIeWtgZdhyuUuD5Nd//U?=
 =?us-ascii?Q?ppboOdM7ARgx0Bg69kZBFFcYU//VmHGr+mNY9RAyFEGjMxzpXxFn3akbHPOj?=
 =?us-ascii?Q?d9oPFge9CFzSSHdh9rUgNor0VzxN1hXTMF2UfrTpGlvDjC1FaARnVAH7Ztm1?=
 =?us-ascii?Q?QoZJdvWgdxYPO3fnejU0pSq/P4nAVr3eBjqGDOjIe0KShmfaVbu2Mca3WcU/?=
 =?us-ascii?Q?hDkDb5w1koj53Dtf1Yy0WZFuXLMjyC0AVIrc?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 11:02:19.7965
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d06dd77-c1c7-4792-d7e9-08dde947055c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4141

The PMF ACPI Specification (APMF) has been revised to version 1.3 to allow
for additional custom BIOS inputs, enabling OEMs to have more precise
thermal management of the system. This update includes adding support to
the driver using the new data structure received from the BIOS through the
existing APMF interfaces.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Tested-by: Yijun Shen <Yijun.Shen@Dell.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/acpi.c | 58 ++++++++++++++++++++++++++---
 drivers/platform/x86/amd/pmf/pmf.h  | 22 +++++++++++
 drivers/platform/x86/amd/pmf/spc.c  | 36 +++++++++++++++---
 3 files changed, 105 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
index 4982311ac045..41c34c26ceec 100644
--- a/drivers/platform/x86/amd/pmf/acpi.c
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -320,6 +320,11 @@ int apmf_get_sbios_requests_v2(struct amd_pmf_dev *pdev, struct apmf_sbios_req_v
 	return apmf_if_call_store_buffer(pdev, APMF_FUNC_SBIOS_REQUESTS, req, sizeof(*req));
 }
 
+int apmf_get_sbios_requests_v1(struct amd_pmf_dev *pdev, struct apmf_sbios_req_v1 *req)
+{
+	return apmf_if_call_store_buffer(pdev, APMF_FUNC_SBIOS_REQUESTS, req, sizeof(*req));
+}
+
 int apmf_get_sbios_requests(struct amd_pmf_dev *pdev, struct apmf_sbios_req *req)
 {
 	return apmf_if_call_store_buffer(pdev, APMF_FUNC_SBIOS_REQUESTS,
@@ -338,6 +343,18 @@ static void apmf_event_handler_v2(acpi_handle handle, u32 event, void *data)
 		dev_err(pmf_dev->dev, "Failed to get v2 SBIOS requests: %d\n", ret);
 }
 
+static void apmf_event_handler_v1(acpi_handle handle, u32 event, void *data)
+{
+	struct amd_pmf_dev *pmf_dev = data;
+	int ret;
+
+	guard(mutex)(&pmf_dev->cb_mutex);
+
+	ret = apmf_get_sbios_requests_v1(pmf_dev, &pmf_dev->req1);
+	if (ret)
+		dev_err(pmf_dev->dev, "Failed to get v1 SBIOS requests: %d\n", ret);
+}
+
 static void apmf_event_handler(acpi_handle handle, u32 event, void *data)
 {
 	struct amd_pmf_dev *pmf_dev = data;
@@ -427,6 +444,11 @@ int apmf_get_dyn_slider_def_dc(struct amd_pmf_dev *pdev, struct apmf_dyn_slider_
 	return apmf_if_call_store_buffer(pdev, APMF_FUNC_DYN_SLIDER_DC, data, sizeof(*data));
 }
 
+static apmf_event_handler_t apmf_event_handlers[] = {
+	[PMF_IF_V1] = apmf_event_handler_v1,
+	[PMF_IF_V2] = apmf_event_handler_v2,
+};
+
 int apmf_install_handler(struct amd_pmf_dev *pmf_dev)
 {
 	acpi_handle ahandle = ACPI_HANDLE(pmf_dev->dev);
@@ -446,13 +468,26 @@ int apmf_install_handler(struct amd_pmf_dev *pmf_dev)
 		apmf_event_handler(ahandle, 0, pmf_dev);
 	}
 
-	if (pmf_dev->smart_pc_enabled && pmf_dev->pmf_if_version == PMF_IF_V2) {
+	if (!pmf_dev->smart_pc_enabled)
+		return -EINVAL;
+
+	switch (pmf_dev->pmf_if_version) {
+	case PMF_IF_V1:
+		if (!is_apmf_bios_input_notifications_supported(pmf_dev))
+			break;
+		fallthrough;
+	case PMF_IF_V2:
 		status = acpi_install_notify_handler(ahandle, ACPI_ALL_NOTIFY,
-						     apmf_event_handler_v2, pmf_dev);
+				apmf_event_handlers[pmf_dev->pmf_if_version], pmf_dev);
 		if (ACPI_FAILURE(status)) {
-			dev_err(pmf_dev->dev, "failed to install notify handler for custom BIOS inputs\n");
+			dev_err(pmf_dev->dev,
+				"failed to install notify handler v%d for custom BIOS inputs\n",
+				pmf_dev->pmf_if_version);
 			return -ENODEV;
 		}
+		break;
+	default:
+		break;
 	}
 
 	return 0;
@@ -506,8 +541,21 @@ void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev)
 	    is_apmf_func_supported(pmf_dev, APMF_FUNC_SBIOS_REQUESTS))
 		acpi_remove_notify_handler(ahandle, ACPI_ALL_NOTIFY, apmf_event_handler);
 
-	if (pmf_dev->smart_pc_enabled && pmf_dev->pmf_if_version == PMF_IF_V2)
-		acpi_remove_notify_handler(ahandle, ACPI_ALL_NOTIFY, apmf_event_handler_v2);
+	if (!pmf_dev->smart_pc_enabled)
+		return;
+
+	switch (pmf_dev->pmf_if_version) {
+	case PMF_IF_V1:
+		if (!is_apmf_bios_input_notifications_supported(pmf_dev))
+			break;
+		fallthrough;
+	case PMF_IF_V2:
+		acpi_remove_notify_handler(ahandle, ACPI_ALL_NOTIFY,
+					   apmf_event_handlers[pmf_dev->pmf_if_version]);
+		break;
+	default:
+		break;
+	}
 }
 
 int apmf_acpi_init(struct amd_pmf_dev *pmf_dev)
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 6ddd1a6e9115..647993e94674 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -120,6 +120,8 @@ struct cookie_header {
 #define APTS_MAX_STATES		16
 #define CUSTOM_BIOS_INPUT_BITS	GENMASK(16, 7)
 
+typedef void (*apmf_event_handler_t)(acpi_handle handle, u32 event, void *data);
+
 /* APTS PMF BIOS Interface */
 struct amd_pmf_apts_output {
 	u16 table_version;
@@ -187,6 +189,24 @@ struct apmf_sbios_req {
 	u8 skin_temp_hs2;
 } __packed;
 
+/* As per APMF spec 1.3 */
+struct apmf_sbios_req_v1 {
+	u16 size;
+	u32 pending_req;
+	u8 rsvd;
+	u8 cql_event;
+	u8 amt_event;
+	u32 fppt;
+	u32 sppt;
+	u32 sppt_apu_only;
+	u32 spl;
+	u32 stt_min_limit;
+	u8 skin_temp_apu;
+	u8 skin_temp_hs2;
+	u8 enable_cnqf;
+	u32 custom_policy[10];
+} __packed;
+
 struct apmf_sbios_req_v2 {
 	u16 size;
 	u32 pending_req;
@@ -379,6 +399,7 @@ struct amd_pmf_dev {
 	struct apmf_sbios_req_v2 req; /* To get custom bios pending request */
 	struct mutex cb_mutex;
 	u32 notifications;
+	struct apmf_sbios_req_v1 req1;
 };
 
 struct apmf_sps_prop_granular_v2 {
@@ -835,6 +856,7 @@ void amd_pmf_init_auto_mode(struct amd_pmf_dev *dev);
 void amd_pmf_deinit_auto_mode(struct amd_pmf_dev *dev);
 void amd_pmf_trans_automode(struct amd_pmf_dev *dev, int socket_power, ktime_t time_elapsed_ms);
 int apmf_get_sbios_requests(struct amd_pmf_dev *pdev, struct apmf_sbios_req *req);
+int apmf_get_sbios_requests_v1(struct amd_pmf_dev *pdev, struct apmf_sbios_req_v1 *req);
 int apmf_get_sbios_requests_v2(struct amd_pmf_dev *pdev, struct apmf_sbios_req_v2 *req);
 
 void amd_pmf_update_2_cql(struct amd_pmf_dev *dev, bool is_cql_event);
diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index 06b7760b2a8b..1b612e79a3d8 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -132,22 +132,46 @@ static void amd_pmf_set_ta_custom_bios_input(struct ta_pmf_enact_table *in, int
 	}
 }
 
+static void amd_pmf_update_bios_inputs(struct amd_pmf_dev *pdev, u32 pending_req,
+				       const struct amd_pmf_pb_bitmap *inputs,
+				       const u32 *custom_policy, struct ta_pmf_enact_table *in)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++) {
+		if (!(pending_req & inputs[i].bit_mask))
+			continue;
+		amd_pmf_set_ta_custom_bios_input(in, i, custom_policy[i]);
+	}
+}
+
 static void amd_pmf_get_custom_bios_inputs(struct amd_pmf_dev *pdev,
 					   struct ta_pmf_enact_table *in)
 {
-	unsigned int i;
+	if (!(pdev->req.pending_req || pdev->req1.pending_req))
+		return;
 
-	if (!pdev->req.pending_req)
+	if (!pdev->smart_pc_enabled)
 		return;
 
-	for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++) {
-		if (!(pdev->req.pending_req & custom_bios_inputs[i].bit_mask))
-			continue;
-		amd_pmf_set_ta_custom_bios_input(in, i, pdev->req.custom_policy[i]);
+	switch (pdev->pmf_if_version) {
+	case PMF_IF_V1:
+		if (!is_apmf_bios_input_notifications_supported(pdev))
+			return;
+		amd_pmf_update_bios_inputs(pdev, pdev->req1.pending_req, custom_bios_inputs_v1,
+					   pdev->req1.custom_policy, in);
+		break;
+	case PMF_IF_V2:
+		amd_pmf_update_bios_inputs(pdev, pdev->req.pending_req, custom_bios_inputs,
+					   pdev->req.custom_policy, in);
+		break;
+	default:
+		break;
 	}
 
 	/* Clear pending requests after handling */
 	memset(&pdev->req, 0, sizeof(pdev->req));
+	memset(&pdev->req1, 0, sizeof(pdev->req1));
 }
 
 static void amd_pmf_get_c0_residency(u16 *core_res, size_t size, struct ta_pmf_enact_table *in)
-- 
2.34.1

