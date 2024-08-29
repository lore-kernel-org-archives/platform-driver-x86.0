Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2077.outbound.protection.outlook.com [40.107.94.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907EE16130B
	for <platform-driver-x86@vger.kernel.org>; Thu, 29 Aug 2024 06:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724911646; cv=fail; b=i6LAAfRhsLHgjdEk2BJduYo3lokYPkpBeKJcxVd5Cb23cfDUK/aym/ia85aHO/IK0nU7KhXdDO9jIYYkufaPpvIMrLoCzlc051a/vN5/YU0pCulnmFuow5Gd8962oSfKdVz6VffrjRp25ght6dgtWFPnij3c6v5tcWbpFHpMrbo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724911646; c=relaxed/simple;
	bh=139m0G0ZFfra4HaE8OIk5tK4P/w7o039fAXPThnvYdM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z0fI9tfugxLLG1EHqhbYcU54XmVSjZWVSryYGAVfT+zPH12M0mr/4ktfjgHfq8wvNlM87cvRyfeo9C/G5LYN/STqgoZs92rzQBmoZFfxXE5O5h8odh7Osb8jsy8VS9J+ZcCQVAt62k7dJLW3pTeLdjRPw6KKdm8QK14BxH+ZomA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=WQr6Z7A2; arc=fail smtp.client-ip=40.107.94.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="WQr6Z7A2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X7hJZeF0fAylHbXgIkFkIqfbR5o0S8P4CiaF4m0QBzXToa4dOdn080l2lJ9yJj4IIVVap15v/i++js3XVGdr95dny1RLnadZoiVdkr3bpP2bR24vq4Tvh7Xpu9y33C/fBv5rnKFnjJHsVvEo4lZkbNrfSXRF23d7xaGMahN0pZjxi9qE8KWR0X5iIFSzjajFx3PensML0+uysKxKHZvYJ7HV4pW+99mS0ny3AGO8t1hfNmzjKy9HfQM33k0E30irLC8R51g5fRFQhw1+zAZNTstruoN+sHbQ6I4LeysfogIPNGc+zJeH72XxtRTlbXMPWjKURILGUN2j7dqhlc8LHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jo7liFoM3tSFZnSO+lS2tFsLtu11KrTVz0Uf79YbE1E=;
 b=IG5iIH2cOfEJlAhvdqEA0y99JWq7gaE9jWIDO0hwtI4ftRLeL5qo7aHejpjqY3CIbbGxZZtS6Y03xJ6W7PqsSxMOYUKCe1PBqG2DPRsXXdpzw5O3aOZ1hDjVBT35yEujPJmSpTtltZLD2qYKULBBc2ql/eITjjNyGwR4k76hlbYHZMTwla23F2VgzdIfV1CQ+qbFJPFAQBQhVwlZTCAZZJYx0uvaLGMFpzAvwzi1Arths+oWP9EJBI96N5jeLGWgR5rxsucQUmnLEHa/+MQJFxlZqHIWw3F09YeQ9BWG20wKeLMXcwZk5pY7yKC7T21CVnI5HTwO1SjdG5z4npFtZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jo7liFoM3tSFZnSO+lS2tFsLtu11KrTVz0Uf79YbE1E=;
 b=WQr6Z7A2zd6cTtzssWxplU51eoZdSyIlsDctMzDCRapkYf3uKkXMfAlc2zgbn/6rUJoJpLojEyxaQl8P1X3/kxNLa+iu2SRQZM96+SWfJJKNu3mQl4fVpp56udGlhOB93hyuUH1SPx2VA+JWH0KbjhXnDM2TCxL15L6rhHpewbo=
Received: from SJ0PR05CA0093.namprd05.prod.outlook.com (2603:10b6:a03:334::8)
 by SJ1PR12MB6290.namprd12.prod.outlook.com (2603:10b6:a03:457::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Thu, 29 Aug
 2024 06:07:19 +0000
Received: from SJ5PEPF00000206.namprd05.prod.outlook.com
 (2603:10b6:a03:334:cafe::f9) by SJ0PR05CA0093.outlook.office365.com
 (2603:10b6:a03:334::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.16 via Frontend
 Transport; Thu, 29 Aug 2024 06:07:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF00000206.mail.protection.outlook.com (10.167.244.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Thu, 29 Aug 2024 06:07:19 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 29 Aug
 2024 01:07:16 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v6 09/10] platform/x86/amd/hsmp: Use name space while exporting module symbols
Date: Thu, 29 Aug 2024 06:06:06 +0000
Message-ID: <20240829060617.1548658-9-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240829060617.1548658-1-suma.hegde@amd.com>
References: <20240829060617.1548658-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000206:EE_|SJ1PR12MB6290:EE_
X-MS-Office365-Filtering-Correlation-Id: a6f41a61-a441-4a25-05d8-08dcc7f0d704
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HtGi8FnBIgznSpX5V//0W2kkqe7L6xEqYfTmnzVIQbzzo539crikw6s1B/A5?=
 =?us-ascii?Q?iI7BGs1IxUtn97mF+BFxkkJ1tl6CYfqAJbxNEzh5jwbLlsZ339uo+uAE1Wk9?=
 =?us-ascii?Q?oRaC7DrM6zKWNZG+q2Je86yxYEgtLHE3Vy8pZnMw9MCfjbjniTThN/al/9dv?=
 =?us-ascii?Q?a87cs1vKWMlbqWNuBe9LZYT4TOaCd7CzdCpgEE9EIuCkvXRJIC7MOzg/e6YS?=
 =?us-ascii?Q?dASr8CqvX8w+IW9rrnTcy2I8MwEeDtYxbqkSOVNtfzuG6FJYsXJP2muRbHHK?=
 =?us-ascii?Q?hhfM7GKYSJ5i31u2b5KKlTynJw0ZSKT4PHzPhS8y3q3/09JluVJjFzaVrRwf?=
 =?us-ascii?Q?CkPkxr8FYaFo1jguI5uUxV7TJsxdWLPh2uDuJziVDO/zEZyJBtDh01dpXlDf?=
 =?us-ascii?Q?bR7k5VRPyZZo7WM9V+BkglhbcDEQi9oow5TNCyY62tiVTn+voxC5Yw2gjAJU?=
 =?us-ascii?Q?Nt6Jcb7xmMIcyN0s9HmTMh3tJwPLFowkval6IeOFWLBoREfYfO+PTyC8PJf7?=
 =?us-ascii?Q?LJfQPp991gvJGdkT7gQGrea99vVHcJ4G8+8zGLfnDBd0WcxVzwDCKns9cxZA?=
 =?us-ascii?Q?sXmOwicsvMGzFr/+nqrWbRZu18MbyhZxSXAoexaDm04O7t6Cx1uUtM5jKm24?=
 =?us-ascii?Q?s5EqD8UhIVTUXdDUDskGufAY4oWFsRAUpQWDHVbfxpsF/NUF2nJhl7qdvI8k?=
 =?us-ascii?Q?q523ekWQV12IIhz8bMbE9H4mrO5dnmfdunnlayan91ptiFv7XMVWeSZWV9xj?=
 =?us-ascii?Q?xOITqVhTgGKrw/yQV/Ii1YPtc/OGJwOQoE7vZakSU2OP0gE0Og0JsZyV1zNv?=
 =?us-ascii?Q?RmcoqgUK+oqfcxNJRBDj8kQ7Pb+22LMhCyQr3p2WOw1D3jWp+yt4cU23Xcc3?=
 =?us-ascii?Q?IBgdarAWoqoZ5HdTVoP88UT6gv4OIx/dqUJgjY6ulJj8Qo83aAbYMQi5eoh6?=
 =?us-ascii?Q?XZUTQDWxrDZ0bAszUro6BoyRkcn9n2UZO1g8RI4BNN+4el0yrJ+vxTprm4mf?=
 =?us-ascii?Q?6O2Ez7fvu9pJqfw9s/lYnqKLGIdRciVtVJGIk8nMqHSohZ2u5+bO+rmBACMv?=
 =?us-ascii?Q?RpqIfGWx64+gTH5Qy/2zySeWuJq06fz78ga1fmbw0T+ZdPy4HCmGPnKYa0yC?=
 =?us-ascii?Q?NITe5bDT9sg8kXu9ZNwzQV97Blpe/xOGb9RTvlIM8wXf7wiafDoqaov4K94H?=
 =?us-ascii?Q?oj3wVrxFPm4VOP+8y/gEj4WjXMaVHCbf0zWh1DSW0HtDJUsswq+P1PaL3to0?=
 =?us-ascii?Q?+gFmxEFNDE/OI30ylLt3zQhFSENZP4s7y/Wt4SCOMhtN1x+mFenNDua/Ja0p?=
 =?us-ascii?Q?N6ECuIvo5K7dCxtdSGsusrn2ivwDuZ9blxon+f+JJ02hzqiEwKyoi6hXgwR4?=
 =?us-ascii?Q?nOp6N2q7dvnykz4Rc9zjZEpGMgSBwL7Fe5Nk7dCHhFStlmUN+jEWmFj6V3ez?=
 =?us-ascii?Q?IzVJJCrWrnWrLeJzXGorlRUOSARicwYB?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 06:07:19.0398
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6f41a61-a441-4a25-05d8-08dcc7f0d704
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000206.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6290

hsmp_send_message() is exported with AMD_HSMP name space.
The other modules who would like to use this symbol,
need to import AMD_HSMP namespace using MODULE_IMPORT_NS()
to get away with warning.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
Changes since v5:
None

Changes since v4:
None

Changes since v3:
None

Changes since v2:
None

Changes since v1:
None


 drivers/platform/x86/amd/hsmp/hsmp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 5e0c9c36f435..8c8e361b1feb 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -190,7 +190,7 @@ int hsmp_send_message(struct hsmp_message *msg)
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(hsmp_send_message);
+EXPORT_SYMBOL_NS_GPL(hsmp_send_message, AMD_HSMP);
 
 int hsmp_test(u16 sock_ind, u32 value)
 {
-- 
2.25.1

