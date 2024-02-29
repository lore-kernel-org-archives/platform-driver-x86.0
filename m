Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2052.outbound.protection.outlook.com [40.107.94.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2819844C9C
	for <platform-driver-x86@vger.kernel.org>; Thu, 29 Feb 2024 07:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709191961; cv=fail; b=gWV2e5WRitZBC3ckXWMF5fYG1d+3HP/O3E9OUf6SwGS/ZPRI5CJf94j6mqBpEb7kTcA/Ix8zJT+7Riamg1ffS+xhXGSqHCy+tqHso2jY+vK3R/NZo1P0nEsOnhqvVX9E0NZIPFv5W6q+TwJoxm7fC+jZItms/sDnEvmtk4zmOXI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709191961; c=relaxed/simple;
	bh=CcjLFYAGsnjTF24Z8aLae+s6YnTYSBKEncipSigZJds=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fyFnwo54odUAxIrWNwRc9wFaOmc/KOjEwMB8uZFSFvdmvabzuPmremKS1LJlOAJrjkj33av2DbqEyVYy+6PAeU3Wfo9texwAy7Q8Wi92MDXpuM0M2J/mlzVpc6j9D2Na+lKjtX7axFBXQCHQivrBvCCXeRNxw0Ege8av1bPGiss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=gsFazs/7; arc=fail smtp.client-ip=40.107.94.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gsFazs/7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PchyYakZImJygylu2sW/yWF4S7PmB08jjBt+b5GzloyMBS97/B9Q6HPv+rjr0WyUVjhFPWaCYcxSYUaFQYONoiFAFpvJiRbn0TGHBLIUdL6FOhkS/+0ctWy2LSFfk1AMtC1YdE874+aUo0wYb/bQpR4s6xi7XiUrge4k31VSkuho1c2dJSPj/WYs+UmO9eoC0II32Vo+9lx/mNUx3WXzQ2wvO0zTEH6sUF+7hOMOwQnugSaiORNu1icXq+Db/0iA9a9u/15zkBLsn3EsmPuT+NrsqvjSM6g7z+hmoRtliGiU2nHx+S4cCrhObGV/jJOiTly7i8IEfRsCfkKOU6phcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MsHqzKrdKy5c1HTQUUE677ojkD29pktUNtetjI3LEC0=;
 b=CqjYDrsY+KMEQ/KCanxx6p6Xihm6kjKHDdER6fvAX7EzuqME5CxRx4WhiOszzmoTl0hJQHR+5/YyaUZO0jdAVwe9BdCt1EaNjCerGgCqffyjyELzPgz/UDjGGuzDJEWbO3Hxuh2IwZrsEl0audTjUG41kEz0B3L1wK2uETl5XMVZ+3kSQBNrhb8U4r6c/rpWwHZl8FfrRdTdYh23dgxJg3lLHfbR4XRV8EFEjUydqjHh5kMZwkNAPdJcppwG8IUZWdJB8Amuj2gl7EAarwbwUDhzcROWDyrv+lp73M/EZ+kpKoIcSR0Puhu6IKWF2PJn5QuhMylTyBaxA3DUWziU4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MsHqzKrdKy5c1HTQUUE677ojkD29pktUNtetjI3LEC0=;
 b=gsFazs/7opcsxH4dn9vTPc1EqtA7vSjZ6duX3V7wFnYcm3ecOWVBLavy0KA9Vd30n4N1CKurZeROrny7pXa4Y9xlAsaeZg/4Dzv2y3qOayDbzNlJpORND3Y8YPV/resTW/8kJnucx0hXQx2u7ScOqac91GCFiyLUSXLTz6ae3IU=
Received: from MN2PR14CA0025.namprd14.prod.outlook.com (2603:10b6:208:23e::30)
 by MN0PR12MB6319.namprd12.prod.outlook.com (2603:10b6:208:3c0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.36; Thu, 29 Feb
 2024 07:32:36 +0000
Received: from BL6PEPF0001AB4B.namprd04.prod.outlook.com
 (2603:10b6:208:23e:cafe::cc) by MN2PR14CA0025.outlook.office365.com
 (2603:10b6:208:23e::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.32 via Frontend
 Transport; Thu, 29 Feb 2024 07:32:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB4B.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Thu, 29 Feb 2024 07:32:36 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 29 Feb
 2024 01:32:34 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 3/7] platform/x86/amd/pmf: Add support to get sbios requests in PMF driver
Date: Thu, 29 Feb 2024 13:02:03 +0530
Message-ID: <20240229073207.4092698-4-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240229073207.4092698-1-Shyam-sundar.S-k@amd.com>
References: <20240229073207.4092698-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4B:EE_|MN0PR12MB6319:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e04de02-fcea-459b-fb44-08dc38f89a15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YDUJ+XuTrYVi/qtFXt+fcP3R6le2tyFm875WsVt3ujrStPtGQdnsyb9RTHiHyb65iS985xZL4SKapuFfr+1hsLUpYByNEcxT/abh9Z9TAhNjCvBg7/MHJVI/Rp7DcnQw6mj5LM3YM3isPhcLSddF+sHvPDvLmQ6DdQKp9jytZeI0nu3K6Puij5phHMKtcoMqNNsaCNvZ0W4+ZrhE7XZqHTuqeT2lILLx6YrUxXH3BkhsWkScYPCxhQSqrJn3Cqt6b90T6mKb8lSAUudQEU4nqD3ma8VNW0G33XOTXQtc0bqJaLLIoNg9lSXRKmyu8YA4VZ5DkdB79/y2vFkHk/hiMUx9QVfRkqmxlqL3OHePf49mBrz61o9xx0TRvp5F2GSYyof0K7B8Sbway1OyV02Qj3bdOOhR4Pe6znNpbEz661+3LepfgAf4qfnobHfYjaQoWSlCtMFcTHVadZrT4ge1QL0MYb1jBiSCTXJ0c3Aq5Fx5kXAzxfg2wvBpefQRoUjJ1jcnCEJ/4mn2RAII00D54CLQfW6RmoXGwkTurWniUzdGmrb9O2waGsYw4OPdy57azaAaZEWOqsLi0/5zWQuQKmMjH3x2Hxs1cDtd/kc1BF1Td5ATdabDpyA9BVdHLKjBD29/vYeO9BEf4Ywj2sHpXW4hUh78B2m4KUkC0UwnehLGgwvy4lHzCmnOB2AY2BVJokvjXye3P0RwNgUN5LADUT2yNZS0YvwE9/9aJOMySqevN8bHvWofr8pHJNrFRG2G
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 07:32:36.6382
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e04de02-fcea-459b-fb44-08dc38f89a15
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6319

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

