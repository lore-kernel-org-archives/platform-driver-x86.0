Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2087.outbound.protection.outlook.com [40.107.237.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E6D1F131A
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Jun 2025 05:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748930320; cv=fail; b=khfDtmwc02s5lrRQYQtMp6Gpj5K9I04Epv8L2dl4qpE6vSOAnvOVcGpwHPwkm+0jUqc1x08TK1cj6MhJlC0kRDfad2lxwxXkjdMJIp/z1W6gU+mzXSxfeWjOwlyCecl8CkZEkw920o4l+JUeAiSalFwLmzGPNcIiFEO/rg0ZrOM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748930320; c=relaxed/simple;
	bh=lvnjBrszxBSPlk0AkP+4PMNZDtmdiyeOScJslt1QL0A=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GMZ1P6Q5WeJGdBdzQLJhDkzrggpwKaib1ywcGymLamOD1rJCl4ZhvMDCpTh3knu0m1MphunifQztzBEgIa7KkSE0gKeFbzCXHL3JMnWWLbkIJbHZhKP2pwDdxBZkkQEuddLWp8gzlxykK/OUMqHgoklr61SFOvLYD9T1L9wis2Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ylbTw9gr; arc=fail smtp.client-ip=40.107.237.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ylbTw9gr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jhLBhQaZWPrnpAPL0ko5yVFHnksCeL7n48h8FRfOpD7jqay0lrhC3AJ/h3qRuX7McDtr2CcWLmNVEk7hxTOYZHKfJjUKVQFH80wMUaPrz9x5Wybc9IhQYoCzovcNhOTclBC/MJzb+Jph81HM7IM6a0Cncv41dcKsFQ0vZYVj282+Y5YjwhiBwmEwe2eSwXo7u763N8nw8wwZsB3YR2Eaa1UNO2b10v890OWd3JoBzwrYiEHc+L+6bnHTevKj7F4GGCa1saty1lOtH83NUivFadjbDweUkeWXdqu1Xduw+i/cOL+Vls4kwqUrmk4zqHNJtaXJhtR8nkaGIESNvn74Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ckkPVvhSeaHeqBa+9ZxLLCSDymW50SHPxJkwS++EMm0=;
 b=QoYQI2eKOlYM2Yqw4RFFRKStDBZB0f9CyaMbXpP+7MGp+AzzQeoeavzfMpboybj1tz9vzcNrRkvaolHsZ8+hhAON9uaZAjS9gEuVD81pULabWM9YtRYcoZ/0HCM/s76k+YjqviHDpVRYc33mDBQLL+vFuraVGgRr5BsVBcvKjGQLhaBdx/GGa2tz3XsCJyipSfCSxGVfqMq1CFCRw/QggeNdF9CWAskamfKurtGFJA9Qyrx2baLuo4A+qBSu+QYaiK3WZv7hLvNuN435awwe6repFFsxO4yTj3dAIB466lOfFtP8igAdtCvPkjYxMsHFu398I3ocqa0FWXrK/HzMZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ckkPVvhSeaHeqBa+9ZxLLCSDymW50SHPxJkwS++EMm0=;
 b=ylbTw9grz81rof1KNhBPzIY7gHq6oOMB9vO4I/GKKcJe56K62r+fF3KdmKttDwKyRMGKD5b7S8piXU9XGwI2/bxmzLuC66N1TvdRsNaLZbw+rCPkgx9Xd3KAxPx1cGvtkkBdsI8xL9oGmstRz7UccEqkwDwUigywReLA80jhZr0=
Received: from PH1PEPF000132EA.NAMP220.PROD.OUTLOOK.COM (2603:10b6:518:1::2e)
 by SN7PR12MB6689.namprd12.prod.outlook.com (2603:10b6:806:273::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 3 Jun
 2025 05:58:33 +0000
Received: from SA2PEPF000015CA.namprd03.prod.outlook.com
 (2a01:111:f403:c801::5) by PH1PEPF000132EA.outlook.office365.com
 (2603:1036:903:47::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Tue,
 3 Jun 2025 05:58:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015CA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Tue, 3 Jun 2025 05:58:32 +0000
Received: from trento15c5.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Jun
 2025 00:58:30 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>
Subject: [PATCH] platform/x86/amd/hsmp: Use IS_ENABLED() instead of IS_REACHABLE()
Date: Tue, 3 Jun 2025 05:58:07 +0000
Message-ID: <20250603055807.2503028-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CA:EE_|SN7PR12MB6689:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ca9c71f-6663-43d9-dd52-08dda263ac22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?O/mCcakfXaywF4XRRn/h0GxfE9kkfcgjRzlSu8Y4ou2r1yx5HnaLU7/eEm0q?=
 =?us-ascii?Q?+V85cqp5LMy51DDmXyRsFsuasUZKQmvBeccaywz+kRoypu5dvMruKGrV7JGP?=
 =?us-ascii?Q?Tj9jk/IYLJ160CPj0sol0lKBAp7WYl0xSKnLJ9+m8mlGFRwbnKGssUvBYWh7?=
 =?us-ascii?Q?n1FKzU6Qg3w+5wgGh07OaSbhCYT5+Ofmkkbi74jbEKC7Uedd5l8YJskQcnA4?=
 =?us-ascii?Q?ZP41+3K3P7XPI4h2XO/b7Siu+6grPyKWtxg7n58YUYXsiLmRTVMebR3xe+xf?=
 =?us-ascii?Q?dbKjpEwSjMXwPf/tnZroEoIwhobXMDKibzEUXdiUAgYwTqruXz3EK5Y2Y+7i?=
 =?us-ascii?Q?uNveakVwmnMlC19gSwjoA57SGGUt8Q27K+TD7R+gFUSwb8F8AHM4nVYiIXQi?=
 =?us-ascii?Q?IeSBncrXTlP2N5sVklIf8gxNDiy691NHjg7+Oay8PrpJVo3p9uorDcOuGQJV?=
 =?us-ascii?Q?hzYCqCjFqjPzHUeglHHFC+3fsqM5f8pfJNKXCdoASAcqGmjG97wTyfoSZ49S?=
 =?us-ascii?Q?YwWNIfko3p3UH18VM6E6Fv4VHw8OzMIUWQ9f7q9iX70YN8m1jgGVLzuCaHxY?=
 =?us-ascii?Q?qGqlmY9yxoFPmCXs4CL8ehJNuYH1rvDp4r6vs4AmL5g7HjZ/IMV2q/fvGQJ5?=
 =?us-ascii?Q?7fXY3Zbe3wGXc9UYHueTS7syes4SqJmmfM3vEKVL0zRRA1AJXlshhdZyc9Ft?=
 =?us-ascii?Q?EYixcV9dZONJ+y+IXoNbSEIN57xbqhoZVC2XxA1apws37JhyveLhACBb9HFA?=
 =?us-ascii?Q?ZZjw2od+1VJodih3eXG+5B0A045H47z9aq3khs3Hf/hs3G60E+NjvlT9bvz3?=
 =?us-ascii?Q?nvogK8LC3lJultxoSU/ucOG8VocMcp41LOwxD1R8MCY0DwShNSbGhiWDi/ov?=
 =?us-ascii?Q?PB2vyV5CWLntWe4oZ2bC+wH5WMm5UtxNbIXedQA1LED73BslGQPGovyXhVzO?=
 =?us-ascii?Q?iwYuxXcrdw6Bl1U34txYEFs0MLgz8WIw71ucqzkfq7TAYOUyuJ0nixtcOMmC?=
 =?us-ascii?Q?uyaTZPYmbLDZBBDD2kNRcdyKiYSXwmf3uqL+DXEn5/LulDajfWmldLPZZ+hb?=
 =?us-ascii?Q?2JC3TQmkz9Ff1LocfUdVpsTNet4vK4wASLz6chdETvVLutcqvrECR04Mg6Ed?=
 =?us-ascii?Q?JYVIc7jpIdV7+biCx0EJIUpT1Q/T3LVkUsoTEcGr8hMNo0BAUic8z39K8dke?=
 =?us-ascii?Q?IRVBzPoMICg9io+rVr06VzZsL2mse1W/4nq1we7RzzhTGXv975JhnktIvVxT?=
 =?us-ascii?Q?0NIVxEoL+tM/6cpOp0G2z2bNoOBwfcWciobd7MktdqTGHzVXY4ZgA7p7dLcw?=
 =?us-ascii?Q?xbnh5XGj85dERuNoyDsTAfuKXccnwPEWD/8CkgreNQ2HKCDxR6GX5i/S/TGz?=
 =?us-ascii?Q?/RMy5EyjApC+Fwjm+UwPeVLV9FACJLl1OAnkuoKTiHV6z6rePi5nrS8iYszP?=
 =?us-ascii?Q?a1g2wPXhI7+Q3dOMAmIqjp4Wcm+mp2vLgCpYM/om33iAD7GKUzAtKThnJ0CI?=
 =?us-ascii?Q?VrXmY1ssIop+hyLAhH18c2caynB5nu7TSwY+?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 05:58:32.9178
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ca9c71f-6663-43d9-dd52-08dda263ac22
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6689

IS_REACHABLE() was required when CONFIG_HWMON was set to m and HSMP to y.
However, commit 69157b00b526 ("platform/x86/amd/hsmp: fix building with
CONFIG_HWMON=m") added a HWMON dependency for HSMP in Kconfig. With
this change, using IS_ENABLED() is sufficient.

Add the missing header file as well.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
---
 drivers/platform/x86/amd/hsmp/hsmp.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
index 36b5ceea9ac0..0509a442eaae 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.h
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -13,6 +13,7 @@
 #include <linux/compiler_types.h>
 #include <linux/device.h>
 #include <linux/hwmon.h>
+#include <linux/kconfig.h>
 #include <linux/miscdevice.h>
 #include <linux/pci.h>
 #include <linux/semaphore.h>
@@ -64,7 +65,7 @@ int hsmp_misc_register(struct device *dev);
 int hsmp_get_tbl_dram_base(u16 sock_ind);
 ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size);
 struct hsmp_plat_device *get_hsmp_pdev(void);
-#if IS_REACHABLE(CONFIG_HWMON)
+#if IS_ENABLED(CONFIG_HWMON)
 int hsmp_create_sensor(struct device *dev, u16 sock_ind);
 #else
 static inline int hsmp_create_sensor(struct device *dev, u16 sock_ind) { return 0; }
-- 
2.25.1

