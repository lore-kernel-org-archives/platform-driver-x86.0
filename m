Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2053.outbound.protection.outlook.com [40.107.95.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3123E7F7FC
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 Mar 2024 11:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709725490; cv=fail; b=gMnBLPIX/+ssM4ENhLEWFavKZu7f1BpH8jDgDGEKItvdH3sxtrSVfw/30mAL7Ax+GzWdpttItB0Zg9qDw6FXanFaz0MoTv8xEW47vn8NuToRNIbtdVjIhy5rP91+E502qa76sJ9WCE3d9GAtCa9vPVbSZRpiWXUAVr4Rp0w+ugI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709725490; c=relaxed/simple;
	bh=y4c2+AxEtfx09B3hhbtgox9ddKz8sgXmRUyxgXdZpKE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gQRdva/p+m52m9GleL4w9zRGo54bhLXRleMAqtFCRwzGj7ikSB3i3MNLlOv2DURs/Cl1aTB5cX+WqQ0uK5NmTmL49MWbuUIRgjUZ4pA/lBQWz9xghtkNyFb/Oy3TJYs54Kim4onDNI0JeDUYLweNKLi/EUt29G4CDDPblZu554Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=yCgqaOtl; arc=fail smtp.client-ip=40.107.95.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="yCgqaOtl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VQPLKEglbdd45FO2pxnzGGLdRebJIyknM+7mZxTvrY7H2Fk1iRN+NFfAhJzTLPflLQU1XeJX1rnJbrN19ksvt/wWS6xhS4pwtMnn4WgOQwAnDNW4iV+Ubfqh0wsqHd5SupTl0UBziVdmMgMC2MDi9wTRHt66bREYnpmekb2pBo/5nC+ZT5tNgB9tRcoNbilU2Ul2EVksQhWIfYUhrTMDsw0s6HgtQT7tvjzrE6FoYwhP394JldrjAg7Tn4h6uKQHeyZOFYiUByE6+jSIuuTjro+Tc8L7L32nAW0fNIZZwhV3QavDxtWYW2zLbYiQ9jP8SVaoa0wuSHYKlCPlo3QsVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tMGkxrGt6h27oo1gCH0hflHilJsFK4RHFhjdEu69EHk=;
 b=FWJG5rBdZQfxH42q3i56olP0XRMtYTpLpv6iTJNBqozsnFAdpEmJuBaytVO6fw8BNLMFM9tC9s8O5aGr7yoePCUN4iQbug11U5/AimposSJO29A1kAxgvfVL9DkclWeVs4BUN55Z9f7XmkvtS3hzUD4v2ZIxq8gHSY+U+8nX9G16+s5cWPb4paGaCqn6dz4imiCmQu7EQfLbpcwhJ+lzBnqbEj+QecAppapQz7kTPO86RpDSZhQ2A09YYLdkKv7Wo/zxL2BRTKYWCYQG6qUFn3m4/MsgiOPfT+4JJUtdqyP6C5qZt0GZvU4hdypDbfFI18uu/sLEdFB7r1hZXmXmrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tMGkxrGt6h27oo1gCH0hflHilJsFK4RHFhjdEu69EHk=;
 b=yCgqaOtl79u4W6zxWIdvVjIASMmN7jYoXwyyD8RaUqR/DsbX5sB4yJOW491F7NN/1gT+MWO9MZ1kR2Lx/6HAuV/LsEsMRMZ444O/4aLpkuZOIP9pJshesqdrCL+0fJ/OC7hWoRDJkEF8YD8XjQ16D3S3lmxD26GG/x5g9PYlNO8=
Received: from SN1PR12CA0066.namprd12.prod.outlook.com (2603:10b6:802:20::37)
 by SJ2PR12MB7846.namprd12.prod.outlook.com (2603:10b6:a03:4c9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Wed, 6 Mar
 2024 11:44:45 +0000
Received: from MWH0EPF000989E8.namprd02.prod.outlook.com
 (2603:10b6:802:20:cafe::73) by SN1PR12CA0066.outlook.office365.com
 (2603:10b6:802:20::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39 via Frontend
 Transport; Wed, 6 Mar 2024 11:44:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E8.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Wed, 6 Mar 2024 11:44:44 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 6 Mar
 2024 05:44:41 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 3/7] platform/x86/amd/pmf: Add support to get sbios requests in PMF driver
Date: Wed, 6 Mar 2024 17:14:11 +0530
Message-ID: <20240306114415.3267603-4-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240306114415.3267603-1-Shyam-sundar.S-k@amd.com>
References: <20240306114415.3267603-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E8:EE_|SJ2PR12MB7846:EE_
X-MS-Office365-Filtering-Correlation-Id: e8e0b7ad-12b1-467a-fe3d-08dc3dd2d1a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0sOXSSIL4qOuyYoQUUu6Vl4plNA+FIUyYImJfvuZ13JhyhJ1/XMoD29EDH1/eHtK3WA2A6G3XR0ghMUa1A8YTIaCIV4e7YOX265a9WKbTGTgGgQkq2AQaJeDfx3DLyL7qYFkAJkVWA8jeG6Rh9zYkk9HRnM9SW37FPL80931EkH72Dp/iuw9DqX4+B+xyp9cxgOAkLb3/QHdZOspyE21mMYlmcBw7VZY4kl6YcAKPApcAzRxwX3onlcNNcSGF/rKa7md0YDwgi4UMQAwKOnr4En2VmXCTct7nTM8zTjObH6Hie+3oyI553/VW8CwDDG/R5y3liDpSCNjBw4h4cKJbEubswpFC66siWuHr1O9Aiz2ZSlhC0bL/UMDs7wQeeHme6xCtvZ1JH1RMqi+0PD9t+GMsDbjZGIbvqum9ORGhJb9UlQ2HTVmfsL7kN2RJEyrfbAa2gLrOwG8qldMPJdwN7gMdqO5zGgSPrf4EjUfFyyHV3Z/KYxsE/0HgJSh9OsKTmst+Vr1cL4mAr+UlBpMWwFCpcLBO2Qyt19qGfdTOg3ZVc76S5c3+HtLCYs0mc4NbiDbm5/n2IFaexeIT76qHV9g4wzUWTk3AZvqfSygp+Me6ZljIuf7kKYghSODtqMfziWW9r4OnfWaFhKQpRHMBNP7jg5DrxutpNbSibbxdTTl9dNNHD8I14nQCpUdqSwyb9Qp0byosXPc+14nMhTPhUJ7HQphqkgD5DmoWjRBkWOpPIk56OXO3cNNzRwJM+8S
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(376005)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 11:44:44.7882
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8e0b7ad-12b1-467a-fe3d-08dc3dd2d1a4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7846

Update the APMF function index 2 for family 1Ah, that gets the
information of SBIOS requests (like the pending requests from BIOS,
custom notifications, updation of power limits etc).

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/acpi.c |  5 +++++
 drivers/platform/x86/amd/pmf/pmf.h  | 13 +++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
index 1f287a147c57..13af83b187ac 100644
--- a/drivers/platform/x86/amd/pmf/acpi.c
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -166,6 +166,11 @@ int apmf_get_auto_mode_def(struct amd_pmf_dev *pdev, struct apmf_auto_mode *data
 	return apmf_if_call_store_buffer(pdev, APMF_FUNC_AUTO_MODE, data, sizeof(*data));
 }
 
+int apmf_get_sbios_requests_v2(struct amd_pmf_dev *pdev, struct apmf_sbios_req_v2 *req)
+{
+	return apmf_if_call_store_buffer(pdev, APMF_FUNC_SBIOS_REQUESTS, req, sizeof(*req));
+}
+
 int apmf_get_sbios_requests(struct amd_pmf_dev *pdev, struct apmf_sbios_req *req)
 {
 	return apmf_if_call_store_buffer(pdev, APMF_FUNC_SBIOS_REQUESTS,
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 51e31d008ef9..aeaaff290bff 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -120,6 +120,18 @@ struct apmf_sbios_req {
 	u8 skin_temp_hs2;
 } __packed;
 
+struct apmf_sbios_req_v2 {
+	u16 size;
+	u32 pending_req;
+	u8 rsd;
+	u32 ppt_pmf;
+	u32 ppt_pmf_apu_only;
+	u32 stt_min_limit;
+	u8 skin_temp_apu;
+	u8 skin_temp_hs2;
+	u32 custom_policy[10];
+} __packed;
+
 struct apmf_fan_idx {
 	u16 size;
 	u8 fan_ctl_mode;
@@ -621,6 +633,7 @@ void amd_pmf_init_auto_mode(struct amd_pmf_dev *dev);
 void amd_pmf_deinit_auto_mode(struct amd_pmf_dev *dev);
 void amd_pmf_trans_automode(struct amd_pmf_dev *dev, int socket_power, ktime_t time_elapsed_ms);
 int apmf_get_sbios_requests(struct amd_pmf_dev *pdev, struct apmf_sbios_req *req);
+int apmf_get_sbios_requests_v2(struct amd_pmf_dev *pdev, struct apmf_sbios_req_v2 *req);
 
 void amd_pmf_update_2_cql(struct amd_pmf_dev *dev, bool is_cql_event);
 int amd_pmf_reset_amt(struct amd_pmf_dev *dev);
-- 
2.25.1

