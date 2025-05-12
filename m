Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2054.outbound.protection.outlook.com [40.107.212.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2282AF07
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 May 2025 06:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747031854; cv=fail; b=OKdEummfvQlzUxIrpYcr/9t+CpuzcUC0sX+z5G+njFgDwKyPlZM9Dl1EhY0OqTE30jyx7c7oPX5C2VS8cm6N6Uv/5MYbANSPfe4oZJro0F3kOwh/ZI6jpTfVyZYO5j/Q1A3DApapLImip0BqsBhkZMlEIO3O3FwSIVk7i9Ctp/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747031854; c=relaxed/simple;
	bh=a2+lznJoYsgHoeCHczPzdVwNjBKPek2zRk6O/99sDhw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Vb9E3LYXoHPP5/3TQV9y9YUwE+EUUBJ+Mt/YwW7lWLQz7NJZsqFTL/vW14W4wDk1jv4h0xSqKjg+UtOEF35QapuNDb2pNb0lBhdFMranghH4fDe2V61IQshAsDjgv6ywy7B8v/nti0lqVBQ2sa74SRU27tUZ4I0ZD+S3xLzqNxg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=3G284gX6; arc=fail smtp.client-ip=40.107.212.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="3G284gX6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u2k8E83r5hd/nj+uBZxVQf+CgUm3MKGoSIs3aabPj/UuStX98+uPNR8bpwjw7Qbrz0WnLRGTzYH7+/5Svkql89Z7rxbWuO1xRtdYfU0pKg7Q9vjp20Jdyp7xkRZMJl2hZVsaOpK6+lTQVMadA/4lDcQArnqtDAKWv5qF2qsk/scHKw/D4Yk0w70DYU6PFrTKSMeAKdl6tFpGt3bj+ozs/U/TjjLw8GFS8w0R2VpJpksf9cBkIQKznn89QUpfxnf5NMqSPY0IKCdOZPUG8+HVOyzdktP27jwjwoEIWk0NiZN6Fi2FqiH9LZE+xQEZ7e3sDv077bEXAwUymAt0Z7YNlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ecct7uF+TMaEzpGy1MMGEV96/wNhVAshTRJAynJbPRk=;
 b=PCrGVAsI5qtdJkb9IYdJEIaEUgESXDWqi/yBrjzcsKefBPrbEgh+saQXCttYzPFtm+UqOSXZAY2LS2c/+fQwNTzfqDVa5MkBFfSe2j9imqagnSBQPVlr+5xlb+iWXg/PnaSu0i3CNkUN4fxXWMRSff6feKt6nTAsjeYuQTmi1qkG/Ut8OayrS1l+sXVQ/ipgmOrjVmVCpOiUsx92eV7CSybJfXEZzJsRJxgJpY0t5L026IBFIRbl8ST7Uti6ssIhsWAdLJ+gLR/An2nX7AGPUu+o3XmSHwpXRniQ4Z2KGjuZRacWVmVtQ5atPAMOWRZrnOMFfYeoCpe4qspRWxT8JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ecct7uF+TMaEzpGy1MMGEV96/wNhVAshTRJAynJbPRk=;
 b=3G284gX6KO460WRG12SWXW8ItVpFS7exLkit7mtNx/ZA/5FiDmJzwDnxWFms8c2cnUZU8lc1f1kDC4SGuSiozZpylUYXQt3+m5xaa6MaZFLmQ3ZlKg7wjP0/MKOSz5wvoAK2oEoAEeVUt0s+FOo+ic9gZmzxwcM+HjphfKibjkg=
Received: from PH7P223CA0006.NAMP223.PROD.OUTLOOK.COM (2603:10b6:510:338::27)
 by BN7PPFED9549B84.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6e7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 12 May
 2025 06:37:28 +0000
Received: from CY4PEPF0000FCBF.namprd03.prod.outlook.com
 (2603:10b6:510:338:cafe::89) by PH7P223CA0006.outlook.office365.com
 (2603:10b6:510:338::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.30 via Frontend Transport; Mon,
 12 May 2025 06:37:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCBF.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Mon, 12 May 2025 06:37:26 +0000
Received: from trento15c5.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 12 May
 2025 01:37:24 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [PATCH] platform/x86/amd/hsmp: Declare hsmp_create_sensor() as static within #if clause
Date: Mon, 12 May 2025 06:37:10 +0000
Message-ID: <20250512063710.1364391-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBF:EE_|BN7PPFED9549B84:EE_
X-MS-Office365-Filtering-Correlation-Id: 61e307e5-fad4-4173-9939-08dd911f7648
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xhpb2aQ5yJ3E1z/D79/6cg26vtu7amE9TZpn1ZLSO3eEFuClDa0G9rRU4uy2?=
 =?us-ascii?Q?rGz6xoc8V0VsVfzJQrzq8t4sLPSl8nvbM/qyrpKtKKqRD0muQ/KrKKZdiCX4?=
 =?us-ascii?Q?Jt3V4zYUYgYjnMwhphzigRKUOTZ4NGlBiIfikrEDkNmHImIUT+6cdlj8QtUB?=
 =?us-ascii?Q?0fuLbdDfU68CxQUD9+UTv8RpwX1F3Jq8BQ8SjX/YS1Uh5HukHs9peIHppn21?=
 =?us-ascii?Q?JNIoYw/CTYK9lAIWAtXW93OvmEXwnCJxoFYi0fqxQ004gP2oK9hsghsv9Xm4?=
 =?us-ascii?Q?AeR/4z+13xZJTwSgkFFoNivPIYJKLX4Zs/kjvLSH9HncKStoyS2Xb3Ts31Cy?=
 =?us-ascii?Q?TPOtW5ODIJh6S3MLZhcWwRzWfNzpyoedERgoECr3Lbl4DXT+UoNrY1Of6N42?=
 =?us-ascii?Q?QrE5wJkzlK6CsvxEwktKqB0ftDnYaghVQ+3TqeIIphn/r+G37RWKTlHvgXli?=
 =?us-ascii?Q?IRkPD0F42YjH2RGq1/EZAM4g8Ahs8ejuiEOb1U7A68QajVqeCaqRRyMusfTu?=
 =?us-ascii?Q?44I40Xg7ymO4qzblDCUOTHUzmQm0hvVxcRrH620JjKjv1lu6bMOGKJR3a2xe?=
 =?us-ascii?Q?EAPx7QR7V+9GUdT0QujzgW0wFUNSuY8lXbE3zBFL7STJf2b+6Y/JKcXl+xsP?=
 =?us-ascii?Q?Bi8xjnrEFnM1y0cJuFZIrZxQs5cjGhCWGmkwIsuE167+JlZvt2+iy5Q+7VPs?=
 =?us-ascii?Q?suG81uZy2aGQLloTGp9M1kD83TUnxXkicu3JyaPnpVqr3ttA+4nF46m0ltwA?=
 =?us-ascii?Q?lZSs1cV5TKeyULIznJN0tsNCAeh7/SHLk5LbfcXtjdTJVwkeu1ByXL1N97xU?=
 =?us-ascii?Q?f1x4fmvjZDWP96/OQJOpXNNXf39sHsjmOoBiQ7llx93sd/pbh6A+Kjz5SXDo?=
 =?us-ascii?Q?NoWyfBfonwjW11yLBDxg1tHHgiUhnWqK3fYBs7ZHzxxMX2Lp9bN53RPN7cSq?=
 =?us-ascii?Q?gDPxrV14uZi2x6Q8Dv+VHFfubaB1mqWBSOLGy7hTPfjuvPhGV64cUBD3HhD6?=
 =?us-ascii?Q?EvinQNJ/DjIkjKk96i+IuHH7+rk2fGy7bk8An/uFjGuOKzbbb+rNipzbwQOF?=
 =?us-ascii?Q?xQ0ulFmARvK8qgAIEvJWAgyS3uNp5p0aOpK2OPzPzc1RMEIFcFsYMrVXqXl2?=
 =?us-ascii?Q?HFQ14YIulk9XfnBS0Vzf+u7fC3mYLPR7CTGdDRGX8m0N1BFqSKumDi5CX8Xs?=
 =?us-ascii?Q?P742vjHdnr3Le1/IXqF1NVVmSX1mQNgvZPN+6bwhe/wtUKyTLQzDD6691SKZ?=
 =?us-ascii?Q?wYoQ53WsCCYp3y57JkdQRd0T3PNj6V2E/PVA+LEmxVUm5GeIkKylU2/NXvFF?=
 =?us-ascii?Q?+BNfXE8dmUrL9+q5/UeGeoW4iwsZak82Dl/CU8fhYveXd2Je/yMBsgV8Ddxh?=
 =?us-ascii?Q?GRFgPCSHe8xt+Bzzi7Cc2+ARmv0j05xwKcL7VG9bW32SKQIxQnNkFy4pA95O?=
 =?us-ascii?Q?0cbf7PJzlH+atrVcXNYCB2ot+1wD4O+I7pbgXsu0WBy58JrUSBN6yXaVkoBR?=
 =?us-ascii?Q?Jz6/TWQo1mZ5eGnlS0R/KepNrmXjvvi/jo4yoTeTK1pIHbD+62iNoph4XQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 06:37:26.9958
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61e307e5-fad4-4173-9939-08dd911f7648
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCBF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFED9549B84

To address the kernel test robot warning, declare hsmp_create_sensor() as a
static function when CONFIG_HWMON is either not defined or configured as a
module (M).

| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505120930.5xrE7jfc-lkp@intel.com/
| Closes: https://lore.kernel.org/oe-kbuild-all/202505121359.IvDzAbhN-lkp@intel.com/

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
This is rebased on review-ilpo-next branch

 drivers/platform/x86/amd/hsmp/hsmp.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
index 027db8e1de12..36b5ceea9ac0 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.h
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -67,7 +67,7 @@ struct hsmp_plat_device *get_hsmp_pdev(void);
 #if IS_REACHABLE(CONFIG_HWMON)
 int hsmp_create_sensor(struct device *dev, u16 sock_ind);
 #else
-int hsmp_create_sensor(struct device *dev, u16 sock_ind) { return 0; }
+static inline int hsmp_create_sensor(struct device *dev, u16 sock_ind) { return 0; }
 #endif
 int hsmp_msg_get_nargs(u16 sock_ind, u32 msg_id, u32 *data, u8 num_args);
 #endif /* HSMP_H */
-- 
2.25.1

