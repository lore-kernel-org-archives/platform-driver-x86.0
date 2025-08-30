Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2047.outbound.protection.outlook.com [40.107.244.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D981EF38E
	for <platform-driver-x86@vger.kernel.org>; Sat, 30 Aug 2025 05:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756530051; cv=fail; b=J/9+wrfqAzKJM2ONPMSZ8BrjSbJHG//toZ3OBCI1XxIm0Xjb5/AVShrNolwzdfrG9mevbwyVRxCrYzXCofzN8kInrfqY55bAZGpcHfOm+EuV6SGcyeyp5kuoiqimP3fUvfUMWly3tMZXPL1Kqs7NHEZIaZQo40tWT92fJhORDso=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756530051; c=relaxed/simple;
	bh=KLPCOlO330i7NmUKOLJ/LYsYApnqicFxJbYoopdNvZ4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V2IHUgMYhnmjbuXhqSrQIA/0rM7+viwqGa0v8HTqlZ2GL8hDl1YPx5X61NoFq4Y+fnO9qO9uq1yOk7F+wq9UHTPvBcKlnRTMBrVBu9B33owv2T8vdejQH4tbBHD2y5frxNrAolyOGCHVIwiK8oPzgmvdRwTZk4xAbah8Ur7fZ4I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=pF8ge6iT; arc=fail smtp.client-ip=40.107.244.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="pF8ge6iT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CR4DEryfkGywcle5nXxw8p9R+BWwegn7TJXHUTNzNkzyD0MzBlSgLjiAJaKmz+7OIzYCpBnHxsOlas55iir6FbRaJpTec8IbcUTaN0R7l38MvrriOs7MMR1Fw/h2CbvmM03a7gWBcj/enFllgp2ASp1Q7qHRJIFTh0RKpALVqq4KAHah75tLBC0rph+T9pO2NMmeSCXv3A7JUG3zxdF6dKEzKYB5JX4xZeTLiZIkFBc9md/88Gejj7VF2HVZnXMqacVzeQKSVVBJd9ih8q/3DTKP/70+xQ4hhGwuDFKiQlogKLm1n8RGkJXfGqpFGJ7k98DHhBKTLR0SLhlHVe4PHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jGx+CkAnOqhXnuvQ/R9Iwrau7HE34mVV7UAhoT+9qgA=;
 b=Beua0zs0XVs7PoWKf49vpKQsIW3CT2jaRAATt1x+kMYD5v3GcbwYdbrR+DXK6oQzKg37MEQhgwiDOdr/5KbCz0hI1s5TMO9pkCNOFL8a+vbXAdLOtnHJ4JS2fcRKsgfpKsNfWF+odFoa1gf2NTE9NPo7C1uISBNVbYr3OwxuT9YIfFYr0USV7rj0YRtiIG9O6NE+G4oZJq095jJWd01BQrsQiS/1/u6Y9D3yEtcdQ2ixxeJh4QbjGJQFkPTaeVZJlxmKFORnsu7C6ypzC0QoZPR2fkIsnqZeaTBNvV7WFjDCHTyeHtRkTsOClYZbSCe6A6NhToyF0106v27RZc7Jgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jGx+CkAnOqhXnuvQ/R9Iwrau7HE34mVV7UAhoT+9qgA=;
 b=pF8ge6iT2bTEZ9PNA+I+emYqSVDO2T0PP+3W3AEeXolLnHUPO8jdOocoR9urpQULwLyl5WU8RjJ5OacWn/2du8bDyd9WmkiEkks5JZ5HPBtj+YU3Yxsu3sBGDWErAZEEqcUfzGAq3CgX5GI3mrb0sXAqTCJJ47ZjK591ITYMFI0=
Received: from SJ0PR13CA0233.namprd13.prod.outlook.com (2603:10b6:a03:2c1::28)
 by BL3PR12MB6522.namprd12.prod.outlook.com (2603:10b6:208:3be::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.21; Sat, 30 Aug
 2025 05:00:42 +0000
Received: from SJ1PEPF000026C8.namprd04.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::4f) by SJ0PR13CA0233.outlook.office365.com
 (2603:10b6:a03:2c1::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.10 via Frontend Transport; Sat,
 30 Aug 2025 05:00:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000026C8.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Sat, 30 Aug 2025 05:00:41 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 30 Aug
 2025 00:00:40 -0500
Received: from airavat.amd.com (10.180.168.240) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Fri, 29 Aug
 2025 22:00:38 -0700
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, <Yijun.Shen@dell.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>, Yijun Shen <Yijun.Shen@Dell.com>
Subject: [PATCH v5 4/9] platform/x86/amd/pmf: Update ta_pmf_action structure member
Date: Sat, 30 Aug 2025 10:30:04 +0530
Message-ID: <20250830050009.454739-5-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C8:EE_|BL3PR12MB6522:EE_
X-MS-Office365-Filtering-Correlation-Id: 69a3bf85-1de6-482a-9629-08dde7822b88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?h81zIKhvl0f0SXwlMvSTMoGZL08SvTuZoO+Ep+DrOWQUHH2JzW0xi5kYJD8z?=
 =?us-ascii?Q?WwIkjulj1YakOwfsLlX6fiQI5bdgS/okxfBKEAOsDEnz7Y/4ysdpQIJtEmnn?=
 =?us-ascii?Q?qMj7RDGlzK9kp4eufHQrT3+acxtj6ZTIpF55KezE/IvJfoBsn7f51fMiHrWs?=
 =?us-ascii?Q?JUTwp0+Tr6pDAX9gw3lNVDBbT+3vTbuMMpbR+1oSYshzorC8ubLgO5iPQQVu?=
 =?us-ascii?Q?9UkozzpJd2FCvGgutKOiAhL5g2EUMa+7UI60T5By2DnB5QV7W0UsEsNIKsBI?=
 =?us-ascii?Q?6YZO38yh7wb+PL5/iHeW9M6gBBt8vUwhYquq/oDl6SHGUNckwYqo+JFgp9Mu?=
 =?us-ascii?Q?kitSWSVwsn43lH/TUoYNUVVFhVuveiijRpBGn0bpYmWf8oLYC26kLYR6H8an?=
 =?us-ascii?Q?8eU1UdrCq20IsOQGi0d/baECCYtTPptT5VJES3L7SyuOVGpKI7/UC/k1iIJg?=
 =?us-ascii?Q?ekbJsTAZEUROi0IfSnCx5Ak4wJEWRzqo2GYOlGV4nRH03NIcIrBIoIB/JuUH?=
 =?us-ascii?Q?BHtyznXyNc3BALAqOjV9lGtrA5t4fO74Iv6JvOhVLn6Bio+vZz96VvsFvgR1?=
 =?us-ascii?Q?4RaOuarAHc3VRxHqTPbcIn6n57E7UA9tQUws4CXEU63dPu+nFxJWhE99LVY/?=
 =?us-ascii?Q?uz2/AOkmkxfz5p9ms0V/G+tdav0kYB1tjK+RN1jE0SX5xBIY9JXGh2EKP/gw?=
 =?us-ascii?Q?vsS0wN0zpwH8N1DqooZd7+MklWaoupkd9kdZ+PwpgpS69E85XeToHC2NOsC0?=
 =?us-ascii?Q?FwrFjnKCYWls6nOlMBYGIF3/Su4CZnE3p8U2kQf85G6wm0CO5DHx/Yja3gfl?=
 =?us-ascii?Q?cDkvCIyUKn1az1cYHvw35lglnr72W0z6Ve9hne7aPXmP4XCY+Z9asv2+09ej?=
 =?us-ascii?Q?wSQ687fwyXHENuhBhAFvAYK9PEeb2xVqHY9kOL0/gtW/K8tJOvmkDRCklD50?=
 =?us-ascii?Q?4rd7O/hK4dtBfMFPaojo6swVc+G1gzFPRv/xDfOxOh6FuzujhI1lDIDqihf4?=
 =?us-ascii?Q?TdMhdfQnjTfPzzLordrXKPUiBxloBn0pnhjurkIV8L3Tj58TLY1I2xmbfvEJ?=
 =?us-ascii?Q?/lrsm5IeRtDmNt5+baDrJP/ZrQ2w11s4yLEJnZf8G1PCVbgkRcvwOoARkPVW?=
 =?us-ascii?Q?wLqgbSJQCPjIfGSGqOxrv/dQzF+c11R9wNVwDazUwvA4A6aUhw8aK5TLsi84?=
 =?us-ascii?Q?P1otB6Gum8sRC8DaEN0P2wVrSA1UuIFHIWcQaMPWraI0osQESzRKDHqu0aiS?=
 =?us-ascii?Q?1iO3WqHeCSYDrZweib5+8NeMld/TbTOPOt8IztwlfETSc+eVSWHVa4XLRf0s?=
 =?us-ascii?Q?hsWMH2V847rPoe1SmQDOoLsMUVmmkTNW94/wjzSA36tX2v080LCltOobV/5j?=
 =?us-ascii?Q?T31yvAx/F8FEZL/bfv9rfZNgf5wF1vGyTQLkYYIyCwl5IiA9TleM8Fciymfi?=
 =?us-ascii?Q?CO52nTNIzyajnwRerHFzj3jZT6aMKgJ9qd/gREHUprzmTxGq99adeJSS366S?=
 =?us-ascii?Q?jxZoCplonZ5S7KNqqZBAU325VXNNZGgJLohc?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2025 05:00:41.7272
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69a3bf85-1de6-482a-9629-08dde7822b88
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6522

The latest PMF TA has been updated with the additional structure members
for internal evaluation. Since this same structure is utilized in the
driver, it also needs to be updated on the driver side. Otherwise, there
will be a mismatch in the byte sizes when copying data from shared memory.

Suggested-by: Yijun Shen <Yijun.Shen@dell.com>
Tested-by: Yijun Shen <Yijun.Shen@Dell.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/pmf.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 2fcdc2493552..f5e874b10f0f 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -750,6 +750,7 @@ struct ta_pmf_enact_table {
 struct ta_pmf_action {
 	u32 action_index;
 	u32 value;
+	u32 spl_arg;
 };
 
 /* Output actions from TA */
-- 
2.34.1

