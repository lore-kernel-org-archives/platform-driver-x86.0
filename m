Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2081.outbound.protection.outlook.com [40.107.223.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3450376F1
	for <platform-driver-x86@vger.kernel.org>; Sat, 30 Aug 2025 05:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756530055; cv=fail; b=acF9yvdX1wufxdZHv3baJWSTGMpDGeru9zrKOb0myvozTpTxqIMyby4RZRY89cXAD8iEMV0tokq1gbUOAnkWwS8QJE41N5amHVmlocDFDcahkXrZ8vFjGenqU5sNNwSff/qpbS+mjUEdYYBaaxA9W/y0vLXvVKSMD972UjFBMmQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756530055; c=relaxed/simple;
	bh=+wjKfHVG6aUYgjJsX6OwmVSagDe9Lu4gnLoh3iHwRXo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aR/akX7U7nNTMNwix4cS9Ssq7Suzj0m3bUBi0B7uJFD/MzugFcfNGT4Lq7dsM9kYTxAFk4EFxeVfz6vkqOBy1JoGgXlH4kx0z84PPOSOQNs2TxD2oTx4xqp76R6bq93uRIyGvMJq4d+l2BROFh86Evc7C1nM7B3Z+38pjhZfTno=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=j917V9Nr; arc=fail smtp.client-ip=40.107.223.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="j917V9Nr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hz5ywdScbe2sQCXBHJs5IY+AJpOnvdH6vH4att6FLxEAfBjDHlLux33DL6jzke8WFJ6rSCH6uMn7EY71khynDOi3MSDAPjzmwL7y+SUZVkGXf49kUs2fPNHwyuwwfnMp2ECL9R3eeDxQSHE+KM8VESacl6j8wdZHgj5YezmmRMVODkmIkQCNlhJC3GVyIeBqx4vhWKhxkSWsUnGJAnuXypxSoi6/iVMjvUSWmdXWvJ76GgrE2WdEbk60gPs5PUfy9xNTIfnTKj8GD4DRXE6NrbBgHsUP36JyCxbcHIK6pdFOdtag4eTzKdxBEpIAXAx/tO2hx5fFbmpqa4CiBLIWPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C7VOuKk7oq4ixWs6hEvv7sFcjlOvYdRP8A7UingKiVA=;
 b=gpG/kjEijXq7SrSoMzbRPm0rRdYzfxlemS5qyLY2um6BW6Mhgrl7n3WlQ3FbqC5h7CT+fDenTE06y0WgCcyDNKW+VWZ9v5hDeIlJW5xI5duXDEl1fTopB1TgGdeabeAeG1fd/M/2yzz3AOs9LBaV9Odj0LnEwhCcK1Z4QrQXYq7Il5Xfd8+DpVuaesitdGCylGhu6CcPIdfH/h1pI8zKN1Gx2kfVJ845gNXKitwokZ70MIwE9P4jx1fW6MKOUSH9V/KJwC0X+wfSHd4TtpZVvLL/mkcAr4wL6vNm6IJXdZX2ohQdUjqaxEIL6ktmm1e/pjnuPUNPTpb8D70szRi9gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C7VOuKk7oq4ixWs6hEvv7sFcjlOvYdRP8A7UingKiVA=;
 b=j917V9NrkuFd7i/JkVVe+iVz8S4DAiuAiY0WBfFoSag43bCdgK6tRRoXVeQ19cVyz6KTdDgGMz8HKrYawZ+Rw+UoS1cnZMykICKdRus2zUZxm/oqUpKHpIHW1TJxrZf7n6SkprafFoaU7Ql4e3r3kiN3hPRnxXJbsxmks7EIgXw=
Received: from BL0PR1501CA0019.namprd15.prod.outlook.com
 (2603:10b6:207:17::32) by DS4PR12MB9633.namprd12.prod.outlook.com
 (2603:10b6:8:27f::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.21; Sat, 30 Aug
 2025 05:00:44 +0000
Received: from BL6PEPF0001AB55.namprd02.prod.outlook.com
 (2603:10b6:207:17:cafe::6b) by BL0PR1501CA0019.outlook.office365.com
 (2603:10b6:207:17::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.20 via Frontend Transport; Sat,
 30 Aug 2025 05:00:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB55.mail.protection.outlook.com (10.167.241.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Sat, 30 Aug 2025 05:00:44 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 30 Aug
 2025 00:00:43 -0500
Received: from airavat.amd.com (10.180.168.240) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Fri, 29 Aug
 2025 22:00:41 -0700
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, <Yijun.Shen@dell.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>, Yijun Shen <Yijun.Shen@Dell.com>
Subject: [PATCH v5 5/9] platform/x86/amd/pmf: Add helper to verify BIOS input notifications are enable/disable
Date: Sat, 30 Aug 2025 10:30:05 +0530
Message-ID: <20250830050009.454739-6-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250830050009.454739-1-Shyam-sundar.S-k@amd.com>
References: <20250830050009.454739-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB55:EE_|DS4PR12MB9633:EE_
X-MS-Office365-Filtering-Correlation-Id: 4aae7837-e0e1-4ac4-ed05-08dde7822d18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fkeaCK8MoC0CbGz5XU4e3LCNsLuGuUYYi7U+YFPdovynAxWlS1xBxYQRC5KA?=
 =?us-ascii?Q?7puGb9YdjdtSPTVq3mnE7Mk7Ulf38MGLiQ7THkORC8QV95IjPnoBF5tzMyr3?=
 =?us-ascii?Q?CJxGwvxlxzJAx/pKbUao34wglN2P5uKthj5huA23YKj9dCaRNO3jEWcx2ZSs?=
 =?us-ascii?Q?bRmVpnsvFu11nzYUtheg+NXgBQgi7oWoZZb2YU8XfIIVVWGYOmzVyc4vxro4?=
 =?us-ascii?Q?4IwN6u2KcBz731C0JGPcoCsttL1NOwXfrrtvwjf8T1+7VxnsiX/8ApElFdJO?=
 =?us-ascii?Q?Z/9NeGYkrs12B32BiR4AxMSdyYdwseoXBrPLPUDtSqAxYF6c6I9yDE5m6LCL?=
 =?us-ascii?Q?kGqwVC3vPaIbmCTWlWNB26Pm8i9BF45s332T1X4i0SNdXQoZ2IbHlOgUmThC?=
 =?us-ascii?Q?iSU97Q5Fhw6UAk7MDSggDMw4hQFWc9Othb7J3g6mR/lEhfawDoN7X19L/SEO?=
 =?us-ascii?Q?2JBlaQXoxqQt4WTQlsKUTwFuGREgFuecKweVTa4859w6CmMsP4bciyyIjbMD?=
 =?us-ascii?Q?36sigROmsbx6xNP4R8hlPrcVvGLGHqxOKdfy69j6wkWkGRoPgzKWzuB2YzE0?=
 =?us-ascii?Q?QZCBAF9qtmrWqDZsglEBkRKObhkK4mEJIo+NpqBvdTM1l/b1Dti9S5tIXtfV?=
 =?us-ascii?Q?/aStjceAF4Cd88ztaAVt4ObHq80t/5bwtc8ADpTIbNwhaGiX9jyHQQ9551cG?=
 =?us-ascii?Q?yST+aK45IsvR0ASEd8NhJr/UC/+u+6oSA3yB5iG9B47h2I2QUe69HgEcjAtI?=
 =?us-ascii?Q?zX9YhkQneeTwxj/UCFDQaDehQQA3XBsNgU8dPoROk980Mi1cZv4BTTC3jpdF?=
 =?us-ascii?Q?yauktQtE0Uqc15XtPj5PjuqToyoC229NSuD/PrhyN/qi2hMfjFd/JtS0EKpC?=
 =?us-ascii?Q?5e2OM0/IOtmxCEzudTjYOVM9lKmeyF8L0YAfFYfPXTKhX1LuiBfiY9iX+MSS?=
 =?us-ascii?Q?oYEwm616TF2RBFB/4nN+gBxx/bbQGipamKo4nOio4K6ciA8hDxNNsg/0r2pW?=
 =?us-ascii?Q?JJh0flrSAaHpWKm58nrycycSdhsPHH50m7I4HI3JnBYv9yT3XS8iObEjWS5N?=
 =?us-ascii?Q?YuupHt1A+gJa9oFRtaaUVp51CyTkKl6v5hP8xbjMDd5eg0Ttvad1L3mvJ8ag?=
 =?us-ascii?Q?EHSBIsRZhav1jmOy/HmC0Szb4WmgM5QIFaxOX1U0VvnClcKVlOrQjSXidOcE?=
 =?us-ascii?Q?iD+B6Ss/xYs3foRMYr+NWw6HOFV2n23hMqmMQSsGnTYsoFgcG2AqUpc0Emmu?=
 =?us-ascii?Q?c0yQuMpdCtbHxJgSCK3Io2AUiQWizPnqjp2h8vq7iIlEIABruRZ+qKfA6oJ/?=
 =?us-ascii?Q?cc2EzyUzB2a99Ux8xuT2+Fn2qouaTpCt8WaK6ofYU4l3D7UcDF8Kw+iy9cEt?=
 =?us-ascii?Q?GrOd1fg+PXF3HLS5HoYvXy35WqT2dHu75DeiIawq7Bc6PMz0HCGbOKgnygWw?=
 =?us-ascii?Q?2BDmtsLiGZ9zz+7Mvr+jXlT3RcZikHB7Z82RqL8T5IWvL2LxAE/U8/wcL1Eu?=
 =?us-ascii?Q?vRPMKCbSnk7dXhkXZke2/su1FvglMCRmDX9B?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2025 05:00:44.3953
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aae7837-e0e1-4ac4-ed05-08dde7822d18
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB55.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9633

Implement a helper function to check if BIOS input notifications are
enabled or disabled.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Tested-by: Yijun Shen <Yijun.Shen@Dell.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/acpi.c |  6 ++++++
 drivers/platform/x86/amd/pmf/pmf.h  | 16 ++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
index f75f7ecd8cd9..4982311ac045 100644
--- a/drivers/platform/x86/amd/pmf/acpi.c
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -161,6 +161,11 @@ int is_apmf_func_supported(struct amd_pmf_dev *pdev, unsigned long index)
 	return !!(pdev->supported_func & BIT(index - 1));
 }
 
+int is_apmf_bios_input_notifications_supported(struct amd_pmf_dev *pdev)
+{
+	return !!(pdev->notifications & CUSTOM_BIOS_INPUT_BITS);
+}
+
 int apts_get_static_slider_granular_v2(struct amd_pmf_dev *pdev,
 				       struct amd_pmf_apts_granular_output *data, u32 apts_idx)
 {
@@ -385,6 +390,7 @@ static int apmf_if_verify_interface(struct amd_pmf_dev *pdev)
 
 	pdev->pmf_if_version = output.version;
 
+	pdev->notifications =  output.notification_mask;
 	return 0;
 }
 
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index f5e874b10f0f..6ddd1a6e9115 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -118,6 +118,7 @@ struct cookie_header {
 #define PMF_IF_V2		2
 
 #define APTS_MAX_STATES		16
+#define CUSTOM_BIOS_INPUT_BITS	GENMASK(16, 7)
 
 /* APTS PMF BIOS Interface */
 struct amd_pmf_apts_output {
@@ -377,6 +378,7 @@ struct amd_pmf_dev {
 	struct resource *res;
 	struct apmf_sbios_req_v2 req; /* To get custom bios pending request */
 	struct mutex cb_mutex;
+	u32 notifications;
 };
 
 struct apmf_sps_prop_granular_v2 {
@@ -641,6 +643,19 @@ static const struct amd_pmf_pb_bitmap custom_bios_inputs[] __used = {
 	{"NOTIFY_CUSTOM_BIOS_INPUT10",    BIT(14)},
 };
 
+static const struct amd_pmf_pb_bitmap custom_bios_inputs_v1[] __used = {
+	{"NOTIFY_CUSTOM_BIOS_INPUT1",     BIT(7)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT2",     BIT(8)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT3",     BIT(9)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT4",     BIT(10)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT5",     BIT(11)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT6",     BIT(12)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT7",     BIT(13)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT8",     BIT(14)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT9",     BIT(15)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT10",    BIT(16)},
+};
+
 enum platform_type {
 	PTYPE_UNKNOWN = 0,
 	LID_CLOSE,
@@ -792,6 +807,7 @@ int apmf_os_power_slider_update(struct amd_pmf_dev *dev, u8 flag);
 int amd_pmf_set_dram_addr(struct amd_pmf_dev *dev, bool alloc_buffer);
 int amd_pmf_notify_sbios_heartbeat_event_v2(struct amd_pmf_dev *dev, u8 flag);
 u32 fixp_q88_fromint(u32 val);
+int is_apmf_bios_input_notifications_supported(struct amd_pmf_dev *pdev);
 
 /* SPS Layer */
 int amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf);
-- 
2.34.1

