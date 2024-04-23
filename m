Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2048.outbound.protection.outlook.com [40.107.93.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1E421345
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Apr 2024 09:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713863705; cv=fail; b=uIw5sgy2U6zj3hdfdwXPEppQO+vEr9px0bhEYrDP+rValVUngy71qR91+NN5rmpU9GAGzJWWmCcUxG40usW8F+eHFB+3i+M5qo4aWFbcwRYYOUDuKkztAGWFvh5kpWi5KFvRf+fjca1RrDKP1djhQqvtwP5YAWDnIUOd0EKP0ms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713863705; c=relaxed/simple;
	bh=qoDJErEd671eliTIZKMKeGN13/Ya3dUn5hOxJChHZyk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MA6dHxKOtAA8gpLccYg1ZPc+q1q/JnEhobaxs4Wz7YlRydnb8hFXbrCxQ/fjAcc6jo3LL2TpCyrCNvL8L3iX0t2ZbxXuQjLJ6DkP3G+flJMA+R5hkzt2CvPQBHzKAWui1cUKTin/Kmi6aI4kcdg5SpfJ982Jzd4h5nlzLbBo5iw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=NCXtHsv/; arc=fail smtp.client-ip=40.107.93.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="NCXtHsv/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fpq4op/45ZPeJC/f+YGBla7FedyNsj1AUDsOzTGghsU3sPHywA+f3ws1rnBQCKdmIJRKeNKwHZZL8ylWYrROjHxt4N+szcQQnWH5vILm+JV/2K2bm4k1w+/Yc2mW6fGLxOenDN+HcgGAVm28pv0qvv8ZUXIUh+eNH2skgR7+7SdOBxo/heZVk/hF/R6YFnZWa3VaeYyUDQYlJrw3fW36aZzNU5MDo60ZrJKPSRAhgQnNIqNmfoDKlljK7WBaMDp8zv2N6ZheLC9njqR2+K+PJsXeIYlQriVHTlSo9Yt6MoFLQ8H+dkTR/XlnWlJG7TyiLrqhtV2vuN8ZJlc6ivqjYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JPY6wYs9aorxAZ5EOXL7p2YZ/kV9sd8pu5IfsaC4rQU=;
 b=badO+1+jvc/FdGIx7dtewi8juJT1Cv+C91t0DSKJxzCzPndAeThyYtPpCmumAYe+sQCrNgFyhqKKlZZ9n2kQ6KFIiL41FiBmnm5aV7lWNaSqdVdXWk1Zp2g8TswHanrSC3AH5DMJLwbo3h9vtNDVbr+Kb6a4uy4J5ANd5jCrKrAV3vfCbcs1T2gcA84Si3DN/jpEWzL0uOsq9bsaziYh7qUh+H4Ah8qG8mThmYbytHBirNca8w+uY0WdAGjUl3EGC/Jqjq5r2BNeBLYQ0L2HkUK4f8Vs1sVy+rUmtmWtIvVHhgf/LfCcyUzHfioo6bknPRbNGBLdAURL4NZRNXbGyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JPY6wYs9aorxAZ5EOXL7p2YZ/kV9sd8pu5IfsaC4rQU=;
 b=NCXtHsv/JoGLkt/b/c1kE68nCfiTFYxQQt8VLIPfF3p9Bvg04qaQZZrfFx7yFqJCpk7TME6IVVPxS68Crz4lfCvCFvBYRf9wktISxTc6IqHKZNy5msfQXPmpC2+2xgwiLzYcCIi4++usv+cHmGmHCqp+QWahlMVWgPhO6CPNcTU=
Received: from SA1P222CA0040.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2d0::8)
 by SA3PR12MB9228.namprd12.prod.outlook.com (2603:10b6:806:39c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Tue, 23 Apr
 2024 09:15:01 +0000
Received: from SA2PEPF00001507.namprd04.prod.outlook.com
 (2603:10b6:806:2d0:cafe::c8) by SA1P222CA0040.outlook.office365.com
 (2603:10b6:806:2d0::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.35 via Frontend
 Transport; Tue, 23 Apr 2024 09:15:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00001507.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.19 via Frontend Transport; Tue, 23 Apr 2024 09:15:01 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 23 Apr
 2024 04:14:59 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [PATCH 1/3] platform/x86/amd/hsmp: Check HSMP support on AMD family of processors
Date: Tue, 23 Apr 2024 09:14:32 +0000
Message-ID: <20240423091434.2063246-2-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240423091434.2063246-1-suma.hegde@amd.com>
References: <20240423091434.2063246-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00001507:EE_|SA3PR12MB9228:EE_
X-MS-Office365-Filtering-Correlation-Id: da1c404d-fa8b-4056-81e4-08dc6375daed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bfbH38YiJdzdM/xOSEvGWCxu+ngeet72/aW5JKr3j2QQBDP25TiBxn43Y2s/?=
 =?us-ascii?Q?A/EcUzdFB+7xbH4lMtRPm/s+Py8PjvpN7uU76C+aiDaHhGUERU1ZAMylw/Bo?=
 =?us-ascii?Q?bDHcHcxyl0pI1fe2DV4nEcL3d8FAhLy7/DYO9W8hX0pL0Yy9WgkmdyXEHMQG?=
 =?us-ascii?Q?7umSaR4kLR4NBv1hOBZBpZjxVONqiq8nPylhYjFw9aGF0M0imJJFy5jEki8W?=
 =?us-ascii?Q?d+8Su0FHS+LVQhi/uRhADr9998NpEbZUW+pmB+S0yTVbvjNyWWQ+xdguTF9T?=
 =?us-ascii?Q?oe2eem7JrYZjbe55qKb2F6z7pJQ0HGtZKKdH9AGG0UkoUo9b3HiWqyw0heSk?=
 =?us-ascii?Q?5Om1YzAHG9RKc65dUTd8kvRXJk4cWj1Q2dUEYohnxsWXoiYILePT3D9M5SJl?=
 =?us-ascii?Q?dpa7LRXoBVvHT1314p+rGzI+iMq8y+FC6blk9NmvdzfrHStVLr4RNB7SdL56?=
 =?us-ascii?Q?oXb14r0MsgQYnHZ3kz/DWyF5u3PkcO+N4KgSbrxy/T56CUzP68e8vsruCcm4?=
 =?us-ascii?Q?RjF5tPtSzkKe6OzCuS5AZgDUzEbqIM43ol30UgvfZjRPZ55ztGIKamV9KNqc?=
 =?us-ascii?Q?UDPhS1fK3UomnOdWzmMEBeij9aaoyTjc77tnCLfNB5mZDI52gi1FF0AzQ9cO?=
 =?us-ascii?Q?R0sbW8D+S0Y83rmz4hwBm5V88y5Bh6lvcIGGhmhqWh3GaTQtVky3hFLvViwh?=
 =?us-ascii?Q?oljRypcbxBe9l+YZ9oHdTAb9E/VG3iq+bp5+u0d06xmY0Xne078YHBhc784l?=
 =?us-ascii?Q?lAVdXTbzJTFYQQyuRrC6SJA1Nekk0Y66RcSGVvvXxRZmfZgLJI+cGumuYcIk?=
 =?us-ascii?Q?+wxDC9ml6zzgV2OHY+h6MRVIxM+lFkqymAxcUGa1zZ8buVeTSQCkVB4zsJiz?=
 =?us-ascii?Q?lzYZFsSfNW621H2EnfAkSX2D1UmHB8otKHYa3myjRD0Yke3hn1zEdd7bgV0u?=
 =?us-ascii?Q?r6Q8iyeTSFVyqY/lFehohL3Oqqrkto8VCov7YXJtdZL7ymJBGWIhWOQv/BZD?=
 =?us-ascii?Q?WdARoLBfUalEYTkv0FYT+jhqhrpGqrti/eshpYC/SNT03JRwlLGQjbzPCsm6?=
 =?us-ascii?Q?ULNNa+Z2WDDccMW0QGKOrYnl+Q1uo2Smxr73iQWf1OvOF3kbaHkbQeE0XY3L?=
 =?us-ascii?Q?IhduOj59BwQ0qmzdSwbTWdJc16OPFvr4vrsu/nCUGOvTKMRtrPpn2oTLGGTf?=
 =?us-ascii?Q?qA8VtMJgOUYz0g/xNhIeULBy5uDY2LtEWDdXFaPVIfjP0Wt7z7woABrnyomn?=
 =?us-ascii?Q?o7BX/VrvEgthsi+okrS1F3s2AAuSdYpYgsPYcYdCAO1Lhnhn0xst0yeNt2A0?=
 =?us-ascii?Q?XX2GsukqLLjezQf2aQ2Pv/qg92xsNbVD8fZ3V06dEYMh0p4OrDCFF40sTKlU?=
 =?us-ascii?Q?esSwotgQhgjuMEIMPbkxv93p43pE?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(376005)(82310400014)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 09:15:01.4308
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da1c404d-fa8b-4056-81e4-08dc6375daed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001507.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9228

HSMP interface is supported only on few x86 processors from AMD.
Accessing HSMP registers on rest of the platforms might cause
unexpected behaviour. So add a check.

Also unavailability of this interface on rest of the processors
is not an error. Hence, use pr_info() instead of the pr_err() to
log the message.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
 drivers/platform/x86/amd/hsmp.c | 54 ++++++++++++++++++++++++++++-----
 1 file changed, 47 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
index 1927be901108..807a5066dacc 100644
--- a/drivers/platform/x86/amd/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp.c
@@ -907,16 +907,48 @@ static int hsmp_plat_dev_register(void)
 	return ret;
 }
 
+/*
+ * This check is only needed for backward compatibility of previous platforms.
+ * All new platforms are expected to support ACPI based probing.
+ */
+static bool is_hsmp_supported(void)
+{
+	bool ret = true;
+
+	if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD)
+		return false;
+
+	switch (boot_cpu_data.x86) {
+	case 0x19:
+		switch (boot_cpu_data.x86_model) {
+		case 0x00 ... 0x1F:
+		case 0x30 ... 0x3F:
+		case 0x90 ... 0x9F:
+		case 0xA0 ... 0xAF:
+			break;
+		default:
+			ret = false;
+		}
+		break;
+	case 0x1A:
+		switch (boot_cpu_data.x86_model) {
+		case 0x00 ... 0x1F:
+			break;
+		default:
+			ret = false;
+		}
+		break;
+	default:
+		ret = false;
+	}
+
+	return ret;
+}
+
 static int __init hsmp_plt_init(void)
 {
 	int ret = -ENODEV;
 
-	if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD || boot_cpu_data.x86 < 0x19) {
-		pr_err("HSMP is not supported on Family:%x model:%x\n",
-		       boot_cpu_data.x86, boot_cpu_data.x86_model);
-		return ret;
-	}
-
 	/*
 	 * amd_nb_num() returns number of SMN/DF interfaces present in the system
 	 * if we have N SMN/DF interfaces that ideally means N sockets
@@ -930,7 +962,15 @@ static int __init hsmp_plt_init(void)
 		return ret;
 
 	if (!plat_dev.is_acpi_device) {
-		ret = hsmp_plat_dev_register();
+		if (is_hsmp_supported()) {
+			/* Not ACPI device, but supports HSMP, register a plat_dev */
+			ret = hsmp_plat_dev_register();
+		} else {
+			/* Not ACPI, Does not support HSMP */
+			pr_info("HSMP is not supported on Family:%x model:%x\n",
+				boot_cpu_data.x86, boot_cpu_data.x86_model);
+			ret = -ENODEV;
+		}
 		if (ret)
 			platform_driver_unregister(&amd_hsmp_driver);
 	}
-- 
2.25.1

