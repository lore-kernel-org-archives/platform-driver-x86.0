Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2057.outbound.protection.outlook.com [40.107.237.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D79613329D
	for <platform-driver-x86@vger.kernel.org>; Tue, 27 Feb 2024 12:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709038567; cv=fail; b=fx1USuMbhG9KSHGSJTiv6yqgzdeSTYEFmQpSzRX26VQRTfRc4WOgowiVFbNVzOpEin1QR9uqAa7wjbDMGRmNshi+weXQpEmMvY8QiJSubhYYeGcLEAhu7gqKG1e6XOHTl6Ln+Yd9AgELSQy765NLE/DSOEO0yEtAQcioRlfI9S4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709038567; c=relaxed/simple;
	bh=jolHCB9GEn1lRCx/4gsLgIsWobXKUFDv34yi7YbLwzc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gxiKpSOa7kA/MON/LtZqw/n1xn2jtjfYGtGOwnuqK3xpPeYTlWovF7sFVfuW/aHOK72Kk8HuIcuyI91f08XIAwNL8liRMrkBcGrAi2JXj2jfpxuWAgopPGnNXbAHez2J7UyLD1QUJCQfWFrS1UCQJ5BpiZq0ca/iHHf+3zPw5c4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=p7z2jzwi; arc=fail smtp.client-ip=40.107.237.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="p7z2jzwi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aF6oMDISfbSGdxtq+UbBz13d1Nh2ib8WwmE21NX1ppcA8EtOr8523w+pdgWcRLlq2MJZPms3NkTnx1x/k3NiKo7LrgzmWrvbhLQpmth4SM0aPI6tRueVQ1tjdTlBogvUXOsCs+J+dUK/aKYTq3+fAYmNk9ggAPVZFklJpG7Uf9LsOtjrWaqEY6siyCMULg+1MiLhyFoiOKU3gGM17Wfdlmef9e/CWOrOLpnfVmJfp2TRkt4n+bQVci9QVZAS+kyFh3swhhmw4atD/ONnz20Q3lmI1RY5XiYmec05qGLiOmjnIx13Chc1p0C7DOFRaKIBF64zb5ZaRlY/LV5wEQCH2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UynB4HAJRyDS6QflPsYbh08yqJRxbfTe1ZqnwUxzHYk=;
 b=RMCppJw39xFgInRjk4JmkkEE2ot2mQh7/wVzzBfIlPvwv2dcGyKcvtUnR0B4lgZfBFMUP1fsAmqfuN6BzBA72NWb5mtEx8C2qkgZkIGT9DrfOFt2jkok1PkgTd990/6PwN/3aZWrsA+80fz0Kez4CQmkN2O8fXLtqYZhiWobXztd7gyyTz6+yM4fA/BbluNBlfKSe19me8028S/DMh9rpOCTj6egCzchrSQDsfT7FHNmTnm8I4Qsj5xrgbwXGwJ+ikifcbpJE8IDRLr3ErN43G5NZdsCx9v1pVTTAO5a0CuYEEf9VksRr+74Sk2Ynd+nvXEQyHiq/785lrIT8MDzlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UynB4HAJRyDS6QflPsYbh08yqJRxbfTe1ZqnwUxzHYk=;
 b=p7z2jzwiWH0rTIpMqWuL45j5GlrqsWbo/IAX+Ua7+SyHHqMx3dKBy4Jq5w5rKeUqJH2waRoqF9PHMlCiiu5+IJ9eXT+kuoDbONdlgz8FdI51qbXygmBpkYL2Yr0IHUFCqjkEjrw6jTHfKwcRHE3s/sQ0yU0jYD5wuhW5cj7z3+A=
Received: from DM6PR18CA0004.namprd18.prod.outlook.com (2603:10b6:5:15b::17)
 by MN0PR12MB5812.namprd12.prod.outlook.com (2603:10b6:208:378::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Tue, 27 Feb
 2024 12:56:02 +0000
Received: from CY4PEPF0000EE3E.namprd03.prod.outlook.com
 (2603:10b6:5:15b:cafe::74) by DM6PR18CA0004.outlook.office365.com
 (2603:10b6:5:15b::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.50 via Frontend
 Transport; Tue, 27 Feb 2024 12:56:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3E.mail.protection.outlook.com (10.167.242.18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Tue, 27 Feb 2024 12:56:01 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 27 Feb
 2024 06:55:59 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 3/7] platform/x86/amd/pmf: Add support to get sbios requests in PMF driver
Date: Tue, 27 Feb 2024 18:25:16 +0530
Message-ID: <20240227125520.3153140-4-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240227125520.3153140-1-Shyam-sundar.S-k@amd.com>
References: <20240227125520.3153140-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3E:EE_|MN0PR12MB5812:EE_
X-MS-Office365-Filtering-Correlation-Id: c363ea1f-24fe-4b89-b71f-08dc3793739c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	m3a+iopgsNETPur+MLPCoba2HFPYSoHkwyCOyUq2nQiHGzh0knZgdnC9Y4wBPz/LA/FB/3lnDxjVxM4lqeXx17GO7fNjZE3MAttT9YLEdzrxoOr7lWEfsAz1JQjpJoJuJk9mO75zMFksbByJX0ymnv6ZR2l7wvWRW5Ni+OrpSlTTeDVkjC+ZQqnLEA7jPSxXrLpNcSzqYSk9HcoHjuDuBdErk+hwtrTjbTDgcjJYovzNrV4Uy55fNYCcQDP+cKMMl2ZP/CoWkgwx7Z6z79Pw17S0uGQhuPyNUiRCeWYjx2haTCnoODYsUHuxrP34DP6FJUwAPWZK6I3Ittg2872Iq0l3N4NQ16C3HUGaVy6PZe5J2WbGLtuTRYYdMfk0PkZKXz8oiJ+1xx0msN3WgP+N+Bfmc9ea8ZpaSFNJeMHVSxw7maiRLU2snuRlA9HrjD4jgZSrRTcMF2k0dc84mYihFMmd7Un+62piscSuGEXzZGRhbxstQonOH7zQ6Lfs0GPUPylRf+caD1sW6sgp6jztHZl08RtWbQqXLuPDrs1XB4X7zm3PTyilv2dG2Acs3xb0l2LU3OQkavP1u8qWEEl6LEONfu3uyJaUYwuFk5XFyi6jMTtdXYewYdC0cB0lcZkJ81zfAvVzsDL6oFgUP7w+dvcShezAlackEAmL9tjGXGAVHO/2Jy3ox0pJK+StJ8TJtQV4UmF052qGxl/oci5XJ9AAwpVslA7Wu7pa4aaZlPqw5ViHKFqV1N2Aqx7lgdCy
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2024 12:56:01.8044
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c363ea1f-24fe-4b89-b71f-08dc3793739c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5812

Update the APMF function index 2 for family 1Ah, that gets the
information of  SBIOS requests (like the pending requests from BIOS,
custom notifications, updation of power limits etc).

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/acpi.c |  6 ++++++
 drivers/platform/x86/amd/pmf/pmf.h  | 13 +++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
index 1f287a147c57..1b2a099c0cef 100644
--- a/drivers/platform/x86/amd/pmf/acpi.c
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -166,6 +166,12 @@ int apmf_get_auto_mode_def(struct amd_pmf_dev *pdev, struct apmf_auto_mode *data
 	return apmf_if_call_store_buffer(pdev, APMF_FUNC_AUTO_MODE, data, sizeof(*data));
 }
 
+int apmf_get_sbios_requests_v2(struct amd_pmf_dev *pdev, struct apmf_sbios_req_v2 *req)
+{
+	return apmf_if_call_store_buffer(pdev, APMF_FUNC_SBIOS_REQUESTS,
+									req, sizeof(*req));
+}
+
 int apmf_get_sbios_requests(struct amd_pmf_dev *pdev, struct apmf_sbios_req *req)
 {
 	return apmf_if_call_store_buffer(pdev, APMF_FUNC_SBIOS_REQUESTS,
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 4364af72a7a3..f11d2a348696 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -116,6 +116,18 @@ struct apmf_sbios_req {
 	u8 skin_temp_hs2;
 } __packed;
 
+struct apmf_sbios_req_v2 {
+	u16 size;
+	u32 pending_req;
+	u8 rsvd;
+	u32 update_ppt_pmf;
+	u32 update_ppt_pmf_apu_only;
+	u32 update_stt_min;
+	u8 update_stt_apu;
+	u8 update_stt_hs2;
+	u32 custom_policy[10];
+} __packed;
+
 struct apmf_fan_idx {
 	u16 size;
 	u8 fan_ctl_mode;
@@ -612,6 +624,7 @@ void amd_pmf_init_auto_mode(struct amd_pmf_dev *dev);
 void amd_pmf_deinit_auto_mode(struct amd_pmf_dev *dev);
 void amd_pmf_trans_automode(struct amd_pmf_dev *dev, int socket_power, ktime_t time_elapsed_ms);
 int apmf_get_sbios_requests(struct amd_pmf_dev *pdev, struct apmf_sbios_req *req);
+int apmf_get_sbios_requests_v2(struct amd_pmf_dev *pdev, struct apmf_sbios_req_v2 *req);
 
 void amd_pmf_update_2_cql(struct amd_pmf_dev *dev, bool is_cql_event);
 int amd_pmf_reset_amt(struct amd_pmf_dev *dev);
-- 
2.25.1

