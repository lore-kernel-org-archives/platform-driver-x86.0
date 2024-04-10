Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2049.outbound.protection.outlook.com [40.107.92.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36ECF13E3F3
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 14:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712758222; cv=fail; b=ErAB1BLxMbHn/X14KBNcB42c+B73+cYIro35h3SlyoCJMOfmC7tgf9P+9ru0jqjZIaFg4UEf1EOjiLKV9SiNAXGFcBEJ7mwwkyuXT4hu5IMSKj5DreM+bjJTtjo1mDaiOpA6bwQMNFHhSBfv+mV76sv1VQw57rkZ1pakKptQtRg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712758222; c=relaxed/simple;
	bh=IIBiiwIX8s+EuILgthvA0p+BvGBY77/Tzz72zQUehro=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dp4N/AZN7G72uWbOvtpfF/DfcrxGYSHBiAndAJzK3uE6cU7VWc16u8SYUQmzNkC/gJdJY2BQ1wqmSUWsa5yID72Yd8KomVgTmX0g46DqokQWcjYmYy0fJtMNSt3rk/Dfci81+610Ct/dPQDgnAZn/ki2lOgwR+O7CpaGKb0ALM0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=lS4RpwBK; arc=fail smtp.client-ip=40.107.92.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="lS4RpwBK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gwWUYiZNJ3BWpyZV3M8BbazP82bsjXEOC6DChsTCTInMFfI0nM0s0Ran0NygvpKCpCco1ACKcTNkVF1hVjtEq1vhg2RU7r5tddC3a+QFiuB0og+ozmfSBc/yDKtYtHWae1irscJjTgCXOLIHNvHyBj7VnqUuKSnGYgTBTYe5VZ+F/ZD9i7Joth6narvGtgtAAyusffGcBa6j//jbl2J9YQISsDu/cHuERwNyeFRy2hFl9WXCkS/mr7cXjBhfTuR95L6YZqK3MBhtTVDwcwHMT2X0i/0TVp+S4CoqMJ6C12CPm4XAJeEMX9oiHusl2H8WT3w/F2cMp3jRu3hsimZr6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d1rpRrSBjDLlyp8kfrtI2j93ypt3zZg5YREyo3YvmAo=;
 b=UW4oqwC0xcbvBV5stLQgMRqO2Xx5xMcZabHX2q+1XtSMWnmO8aa+eSxHiYlEVUeJu73zjKEsbpNC6Elws2fJz08qkAKZIQ8Naq0A0PNK9fHU5yzR/7QEf0JGOBlPJjauHAQvBztogEfYAY3Qw1nRZHhjjzNSXqad58Plo37JXJC6EEeq0yakHoNULR5VvWdX6uyh8nIP2sggUbiCWYhchNBcTCZzDw91Tc/OoJKbrKe2QQnnw5xmLzfhYIg8esNgTsIzaOXFAF/gFVCE5lT44p9BRNGxnfodCQAJuh6uZVH4lOfL2/1HuRAGHssFlvV3xbRB9lv996mN59H4/ibQIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d1rpRrSBjDLlyp8kfrtI2j93ypt3zZg5YREyo3YvmAo=;
 b=lS4RpwBKFGjOAkJLZVNphZZzV0Ji+CnDOW23ABRkSQHsoQ5tvSJW9LzojSUDmkhE9TiBa5EHjAEN7dLbaej/R9ZuMin0Ghh1MKCQnMpIVCHl++U63rxzFY9lHM5Rb6BZnHVPhqKbDMXiRRf2NhWFHoH4CAsqjwle+NQLDT4/yXQ=
Received: from CH0PR03CA0229.namprd03.prod.outlook.com (2603:10b6:610:e7::24)
 by MN0PR12MB6175.namprd12.prod.outlook.com (2603:10b6:208:3c4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 10 Apr
 2024 14:10:13 +0000
Received: from CH1PEPF0000AD76.namprd04.prod.outlook.com
 (2603:10b6:610:e7:cafe::22) by CH0PR03CA0229.outlook.office365.com
 (2603:10b6:610:e7::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.36 via Frontend
 Transport; Wed, 10 Apr 2024 14:10:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD76.mail.protection.outlook.com (10.167.244.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Wed, 10 Apr 2024 14:10:12 +0000
Received: from AUS-P9-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 10 Apr
 2024 09:10:11 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: Hans de Goede <hdegoede@redhat.com>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?=
	<ilpo.jarvinen@linux.intel.com>
CC: "open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, <al0uette@outlook.com>, "Mario
 Limonciello" <mario.limonciello@amd.com>
Subject: [PATCH 1/3] platform/x86/amd: pmf: Decrease error message to debug
Date: Wed, 10 Apr 2024 09:09:54 -0500
Message-ID: <20240410140956.385-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD76:EE_|MN0PR12MB6175:EE_
X-MS-Office365-Filtering-Correlation-Id: de75c556-3bf6-41a4-c5bf-08dc5967f054
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dH5W1jBxMJ51EZtEtm23fdnv4EuTFQ9y0/tcIxmocZ6lwrwxr4liiuwLeGveuGtvGTPM0cSOw9XnK7yqROqLgb+Bp8+U0zKfok50M/dy9CPH1wtcJHDs/qsfIKs9VJ8T3YrdKM+ke8bikGhi5nDzyaiRSAzleSohKh7sQH22bLCVm5Sxof8sbfqsq/0xAEqh/9gWEfbZlc7+qjkYyM06IOdBmL3RPxPf06F/UsdCUTlfjVkl1Rvqqe+8DDWJxfKJQmf/fOmgxrJD1NXq8YckfJ88st1bUeC4viSrl8rL4J1z7QQvxuaq4ZaN5vGZkRMgO5anUxE58rAQPa+b2A3JjS/MiNE/B37visNwWoXudql6j13hffOlU/gDXeT7uHO+4x418FoQ+i/zpt4N6V3MP6TyekTn93tmk1XWDgeULeWGwPcloglR8egKRplpLYzVyWaBRBdeoeBrEVno44vZVXbEDXb+03qFIri+da063x1Z7+dGYMLAVIbNMDcip7feX69gCYzdEn7A3tgtGbRA5ABbzdxL4nkgkkjRT8sVUgpJmT7Aq7zr0X7JB6EhONn5vcMyWiNN3+Bt5ncdXVCZu3cbMSOUnQelvW528aFgTyxgzHbosdu65DBLYhYy5rlUzm9YskIsUbhO+uc5ljRujY2JxAuRCRDPsgAyp51R7q0p5o+yPoDIxw6vAwHV339pYFpjUFF6PR2NCidOPDFuSTa4uMn40PJa2/wyH7UWd/qYiVeiKReSIHySFgLdfOaZRXmdzWi5psGlhDt6DqRs3R/BSOQv70ZHquUv89R4DZc=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(32650700005)(1800799015)(82310400014)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 14:10:12.7733
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de75c556-3bf6-41a4-c5bf-08dc5967f054
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD76.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6175

ASUS ROG Zephyrus G14 doesn't have _CRS in AMDI0102 device and so
there are no resources to walk.  This is expected behavior because
it doesn't support Smart PC.  Decrease error message to debug.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=218685
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/platform/x86/amd/pmf/acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
index d0cf46e2fc8e..60fc71c9fb0f 100644
--- a/drivers/platform/x86/amd/pmf/acpi.c
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -437,7 +437,7 @@ int apmf_check_smart_pc(struct amd_pmf_dev *pmf_dev)
 
 	status = acpi_walk_resources(ahandle, METHOD_NAME__CRS, apmf_walk_resources, pmf_dev);
 	if (ACPI_FAILURE(status)) {
-		dev_err(pmf_dev->dev, "acpi_walk_resources failed :%d\n", status);
+		dev_dbg(pmf_dev->dev, "acpi_walk_resources failed :%d\n", status);
 		return -EINVAL;
 	}
 
-- 
2.34.1

