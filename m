Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013044.outbound.protection.outlook.com [40.93.196.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31ED523B638;
	Wed,  8 Jul 2026 04:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783484683; cv=fail; b=g9m2RJNCHaDeXiGQr3RUPYRQG2SXH8zyVhL8syvovu6WwpLLpsWukIWh7jfr2EgTAkUfI+G63rqNxZ3IS+UD/mMYuzw3zx3agT0HxHlEOLYDzDw/Dlw+BkoXgfyfve6L7P1HaXMcbY5hXh0A0gzKK70ZT0zZOC3ejo6gLmkDmNo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783484683; c=relaxed/simple;
	bh=wjhucq43YTwy0re2jK6RQwwRbhVnvXYPpUd/8Xm1opo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pZWchtt9I5S6iwMMp9EPdlBabPpCdHaSLn5lyxQH+zLhZl61muWKzDjFkyrskXtx9dd1YILyvI+5P9Y4u+nw5tDInfIlakkdLnKND1rAFkC1GGJwdI7a7kqD3palhTAZYzTYPgrz5Nn0iPr7ybZFhxobEEpEALnHrnW2EbHa9J4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ITuU8ttd; arc=fail smtp.client-ip=40.93.196.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ITuU8ttd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pjq+PqzTyjQmYYydAfpLEsCeSbmcH4iyvKXp1XYUlXqbp0LBiZkXb8wmtqoGF6/tV+eYdDzxWnyZEsrxboA+UUZOzxXs28+sK0U6Fnm/dm3eScsNRDrU/TqIp9HZ6MfB5B/3zBYZH1R6RVNoJJPZakIQyLI7wMrkiRUVWKS7zJto2bA4dtw5xeHMnOliLZ/+eospjQhv+eAdEx92zGEneSIl8Ztn4F7kqROLqNlYVu1I6EAa0rTtS50oc2+OMuGkoW7pq3QAy6My5lyKR5gHl3aE4j1vBbt5BtMsHYcTEVBeDm1sw+HFTfz4O0UDZEZxBzaNGKwXK4aeTrJdryYSzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/giMr07YvF67o6IHKqoQc53ge2Ds1DH1I/NtHus1ry0=;
 b=XWVklb1YZxW8HLwZJ5vJdcsRwdcOAcXS6CxDlvbvBb3Dic6qZohDRbxWYZ/3pjl12uGwcNhkCr/LIndbq9W7uxqVVObf+2gdHNfGm6Y/zoy1Q7jgIPL9aMZaYeyUe3hqVxkU2rlitCujTqL+kHYQCuG3iCBoHi1BxI3amiF7mKLssMvKD87n9Lf8x9/Pvkwl2C3E9JlM+Wjm5/dnfqrug8flk5Z9f+SU4CDAT+Psprp17p4qmp7C9CxiahzX42/zKKr1xMDIr/ONBiZG5NRYgZXdlGPHrEVNHpIW1OrgQhYQUD8SuBIY6coliE2U0lPIVTxcmoEnXoIW+5nwjqk6oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/giMr07YvF67o6IHKqoQc53ge2Ds1DH1I/NtHus1ry0=;
 b=ITuU8ttdn4Zy/F5QvgN5WmVynCFu4c0OBl+ymtHhmsD+UiozC6EsRbt9jW7JeWcy5zNA3wfgyG78doOlF0jt9wVdcaLUugBSYKxJtgGD/KIHDAP6yATRoSXTnILbVcEGd1MvusYLmIxp33GXzlqiYtgl5q0P8591EFziQPSDLfw=
Received: from CH3P221CA0013.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1e7::21)
 by CH3PR12MB7764.namprd12.prod.outlook.com (2603:10b6:610:14e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Wed, 8 Jul
 2026 04:24:31 +0000
Received: from DM2PEPF00003FC6.namprd04.prod.outlook.com
 (2603:10b6:610:1e7:cafe::ae) by CH3P221CA0013.outlook.office365.com
 (2603:10b6:610:1e7::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Wed, 8
 Jul 2026 04:24:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DM2PEPF00003FC6.mail.protection.outlook.com (10.167.23.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 8 Jul 2026 04:24:31 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 7 Jul
 2026 23:24:29 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v4 1/6] platform/x86/amd/hsmp: Serialize ACPI HSMP is_probed with a probe mutex
Date: Wed, 8 Jul 2026 09:54:00 +0530
Message-ID: <20260708042405.3758294-2-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260708042405.3758294-1-muralidhara.mk@amd.com>
References: <20260708042405.3758294-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC6:EE_|CH3PR12MB7764:EE_
X-MS-Office365-Filtering-Correlation-Id: 3be9cf6f-8ce2-4e25-5182-08dedca8cec1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|23010399003|11063799006|18002099003|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info:
	Oc1llmLKn10KYp6busMnKvXvvXCz3jlW4wkYaLbtQy+2t45Ki3kdXGYg9OeGdrCNpum+qkh1ioSftg2EFXDf/E6uNfBk+DJhAzIVZKHOb4QqigCb6D3ica0KYUj+CyfxzrqNwyjyrwIRyJ4fjcqIGa6S0dw5RyOwHYMnT1jbjUR5pk5sOhcaztd8nRPF2N5PdC5u5rGUa7ueEANYjdIb9177/srm4SrRgjep1TZa0G/oG9Ffsrmvjb2n5B8JcQFUV75+d5BchKMdayKTFlTAD2zs2w1VZS4DnCoqdz4HMBXlrfuB+4BEYARi5vA8MptRL4K8Lwpd1DDk94MPD7Y139Nr9UU0bcHrydYH6pR1lfCX78gNIZcLVcM3g3zP0+S1xbYj2TUq+RklEszaHzjnufp3YWJhY36ptvhy7LWVx8Tr3kv4vJlHYtJfXR9q9SusCqo2eIU3xrXsedLsWSya0jpHkp2FPf+ALcBOvu1lw/kxZuO4m59hngzmVUTqe5D58NFPs6LZbUDqLPOxze9/Aa7+lLnkmRo0lZ8qrPPzIoxha4AYCU34g79yImOcRYCfLbu95PrpEBvFeCRq16Rw3qo06jLaNgMWJ5PmHFjSsv/XWr6ADRn4f7H6cWwfllplq63jhxuVIOsRAe+bJNUeg3Y505hE7D0K2nzvrKPwW1FGnthmMrAhLzX646cUUW1mRdXYEWsCgBCt5YhKnfM8IA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(23010399003)(11063799006)(18002099003)(56012099006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ACoGjmpCXdPp03I3d0KJAueEC9P+GgwnahwZ8RovVgUH3gVxYNHO51Yetv+UhSwC6hIyxsMa4igiwm350otbzDcaU6nSiEauRDyd4tkRnDR1/m7Seu3GPlJAz8Jwrc2YI7sIYTJqWUvT4s4KZEiLBpX92dOziwfKwInfBYe+g7kN12BQR0I/PCvqGPq+FTxpjb/J9VjjwSMEZfGPsrmyjkEbxn6M5EhvaqEp0EFBCd6u8mgLhRSsIMBWuJSpPvkCWQJkdsQyesS25Iwg53BWpKax0vcPI6ELaxApkyakiJ9VK+i8yC3WOpBLvGrimYqXpWCENUYSx3dN1JnP3tins0AVQXhdA5inidZFMXl27YQJ8xChpdIiESiXnYqVFbM7Oat9nRx9kVVYypNqvCFgYI1MR/h5CkgBm7lNxKmfZ435C42K9M6HBAhpIS3aBpc+
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 04:24:31.4157
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3be9cf6f-8ce2-4e25-5182-08dedca8cec1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM2PEPF00003FC6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7764

Add hsmp_acpi_probe_mutex and hold it across ACPI probe, remove and
init_acpi() so concurrent platform probes cannot race the is_probed
handshake or the one-time socket allocation. Use lockdep_assert_held() in
init_acpi() to catch incorrect locking under lockdep.

Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
 drivers/platform/x86/amd/hsmp/acpi.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 72f68cef1297..eef799ce1fb8 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -18,8 +18,11 @@
 #include <linux/device.h>
 #include <linux/dev_printk.h>
 #include <linux/ioport.h>
+#include <linux/cleanup.h>
+#include <linux/lockdep.h>
 #include <linux/kstrtox.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/platform_device.h>
 #include <linux/string.h>
 #include <linux/sysfs.h>
@@ -39,6 +42,12 @@
 
 static struct hsmp_plat_device *hsmp_pdev;
 
+/*
+ * Serializes ACPI probe, remove and init_acpi() so concurrent socket probes
+ * cannot race the is_probed handshake or the one-time socket-array allocation.
+ */
+static DEFINE_MUTEX(hsmp_acpi_probe_mutex);
+
 struct hsmp_sys_attr {
 	struct device_attribute dattr;
 	u32 msg_id;
@@ -482,11 +491,17 @@ static ssize_t hsmp_freq_limit_source_show(struct device *dev, struct device_att
 	return len;
 }
 
+/**
+ * init_acpi() - Parse ACPI mailbox resources for one socket and validate HSMP.
+ * @dev: ACPI companion device for this socket.
+ */
 static int init_acpi(struct device *dev)
 {
 	u16 sock_ind;
 	int ret;
 
+	lockdep_assert_held(&hsmp_acpi_probe_mutex);
+
 	ret = hsmp_get_uid(dev, &sock_ind);
 	if (ret)
 		return ret;
@@ -607,6 +622,8 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
 	if (!hsmp_pdev)
 		return -ENOMEM;
 
+	guard(mutex)(&hsmp_acpi_probe_mutex);
+
 	if (!hsmp_pdev->is_probed) {
 		hsmp_pdev->num_sockets = topology_max_packages();
 		if (!hsmp_pdev->num_sockets) {
@@ -642,6 +659,8 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
 
 static void hsmp_acpi_remove(struct platform_device *pdev)
 {
+	guard(mutex)(&hsmp_acpi_probe_mutex);
+
 	/*
 	 * We register only one misc_device even on multi-socket system.
 	 * So, deregister should happen only once.
-- 
2.34.1

