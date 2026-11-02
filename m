Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.64
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793604064;
	b=yWZqRx8v8KkYEwMB8O9/YPZ/oujRouzNa0KjuPUDr0w22s+WbQIKOJef8/CTiRhiz8vS
	 zAydfmUaNNiFkxFds0xVjw9lrn61dQij+WCRsM46jpoRh+8hCjbzGE+r1vZE1h8jIIgnI
	 dolsQRCWAPpVefWdhmR0TEzgsLaivaunnvF4CdUhMWbYyyEb2UFhYQgjgZsrX7blfMvoU
	 PfLw521o/J0H6lnWJBvkLFfgN4pxq7fsrWXe6b4AHBEigJnl3LvymO9g/FW6cBMCiCJYJ
	 6tdjg/5LHi1wFFd49uMZPjhO47zdiP9mUGtMmMFlrGntAwt3uPi7MFzmzf+FoUsrDyw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793604064;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=dq+hFeQY/jmOW1fT4FsENvS6kaFjbmEkb/Tfh4Av3S4=;
	b=V6bud9uFsIrsZ4HFqGEKdVe/sWf9SOKOQ0jNt6L8UsCH9bGLJX8xXo8u9ViWDQwZGQza
	 sdMdv85lSVx3R649OunP0fZQTDe0Kw+sPypMKZymg2oeBszys3Td515HISjJLq64yQCX/
	 SdeSY3LIDGhBAiR78kIX0nJfhT6qVw56ua3+gj6okmGyfbOTDiiM4O1+Y/A2GrZ1vr3Wf
	 HnOxflv2wOjlHmRQE7egvOkH20M9Q4BmnER4goxtjri19zL2MrIgMYs0t+LmyhhrlQhz0
	 202bV8M/hh6X3XWz63Zb/+15EMpih8i9IJoHM0MB+lRf46PWF7ImK4xF+dbpsobDIag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="c/9dxf2h";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.64
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013064.outbound.protection.outlook.com [40.93.196.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B2F606A32E
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Nov 2026 07:21:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16B2F606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=c/9dxf2h
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xRhhf+5W735IhnBwOUBlaA4f0PaAAKwnwEuYUzMu4OnVjib42c5T7/MVwFdMU9oOtAbu8Y+2I8YsPRN1zdMcDKK3aIynuN7nahLURicF0Bsl3lW6cj5oMZmXGzaKqZUbuOr3KJh2o1C9Ml+Wi0hbb8OVJ6MwaoU+KwrThLLxPIYPhxPmRlWD5SkdBXHOfKABY2L7xWgy+SKZL7xP2u/7TKogOCM0IcGaE4+j41HwBkFiIrdH7Hc7PBz/ghkRpshUovIIctjAL/8nZKplj3o3s86LZxKka81q4l80c6gL2ACSFxuvPdiJyqBc36zFMtsxr7s/1pR9F3VPBYyYrDpSrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dq+hFeQY/jmOW1fT4FsENvS6kaFjbmEkb/Tfh4Av3S4=;
 b=N/cggaxUir9xTaSnhXOW7tcg7IC3ytJy9FqnR4Wb7vJuHAvXx8LXMHbO4NUqxuwwgptMskDtysKc1SL+MUvahShZI+dkTHZCGJge5Eahu6BxujHlRUfj91FUNJ8K4hZyeX/Gg8HZwoGqTpPsUUuG5ABetocFYwyF9drjtIewHLWyAW6Nt5+NGmt0iwLSuwImo8+7rCe9wu1CdWANwps5qiONVs4LUhWcsczq1IWU9OZa2VS9kZOMjVhO5Wtv6vo+7kjNp5Bkj8P0XXbzmei4cDFAvaqQsao9viPUHYZjxgaK8bYfF8QpuT+qEitOsdP9iIaeuy6gFVJ071wFrYk7NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dq+hFeQY/jmOW1fT4FsENvS6kaFjbmEkb/Tfh4Av3S4=;
 b=c/9dxf2hcTS8z/pMNptzQ/HGdhhXJQae0+BPDXSJsNW7W7U8UTdkvUP1wVn0lvGn62VqfSMGcyOdnpmxNJhqAEbZ7ESMM2/vCVnUuIC0NFQvW/JEbbZ35XZSnJcgdJTFTHydGaz9/0p+3eS4LPRgS/CpXoIj4XbwAUSylo9V768=
Received: from SJ0PR05CA0177.namprd05.prod.outlook.com (2603:10b6:a03:339::32)
 by SJ0PR12MB7067.namprd12.prod.outlook.com (2603:10b6:a03:4ae::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 07:20:59 +0000
Received: from SJ1PEPF000037A7.namprd04.prod.outlook.com
 (2603:10b6:a03:339:cafe::4c) by SJ0PR05CA0177.outlook.office365.com
 (2603:10b6:a03:339::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.4 via Frontend Transport; Mon, 2
 Nov 2026 07:20:59 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000037A7.mail.protection.outlook.com (10.167.244.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 07:20:59 +0000
Received: from trento15c5.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 2 Nov
 2026 01:20:56 -0600
From: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <Suma.Hegde@amd.com>,
	<NaveenKrishna.Chatradhi@amd.com>, Muthusamy Ramalingam
	<Muthusamy.Ramalingam@amd.com>
Subject: [PATCH 22/26] platform/x86/amd/hsmp: Add powereff_mode sysfs file
Date: Mon, 2 Nov 2026 07:19:20 +0000
Message-ID: <373a474ee0d8805943d55ff4612f3857f445cfdd.1793602634.git.Muthusamy.Ramalingam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1793602633.git.Muthusamy.Ramalingam@amd.com>
References: <cover.1793602633.git.Muthusamy.Ramalingam@amd.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A7:EE_|SJ0PR12MB7067:EE_
X-MS-Office365-Filtering-Correlation-Id: ce55c9ae-dba3-425c-2370-08df38b1d808
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|23010399003|6133799003|22082099003|18002099003|10067099003|56012099006|3023799007|261009223027099003|261021135927099003|261021123027099003|261021121427099003|11063799006|261026121527099003;
X-Microsoft-Antispam-Message-Info:
	zGYNGnP9sfylWmKJbNIIx3y4YGRp5nZnipXbiI6/RDR1WmJV/Yo0+eEdjmHyLXls6gXlQhQS7v9k/bzjQyc9eAoANXKw6BvKhvEXOjGbCO3xpntgJAfdGDOz99ADVesYwizCXBOwpPUVvsPhhV2ODx8nP8iQdgsdnWh3dgoyTvqTHNjidmEz8R9B3v2VQkwaGTA+tm9NZP9bQUmujveNWrfbVrBj9gC7j0hi3gsw0gv/Yyw3d4s6n/TEr2dnBZMeGb5uOg08MOpplYMnBnVK4G359R663JaWXFeL93m7oIfmoVDMYu/l3SryEQrrKf7ykEWQi62lHzW/pPAQZvuawpH4AGq/NF1qc3+MvX3VXt1TKEeV22G98P3AljQ4nPbixzb5w0YDdkFwpTWaAo2hKnGe5+A5o5xR+iJ0uW1jeOyCJe70CI7lzG9OCeaffCLmLyMC3qFCfX09WBQooQvFExT1u5MwUnj8g+JB1RJyKhf3rQlk8mUyqh4fkEx2Cgh7cLFJDZ0OgwMNDv9i+zFTprGzvjNrDEaj5NngHsitTYUyYrisUbBfCz3XtI2LqfRSd4bNoW3/rc0PRlrNcnb4Li83SJ6YImPl5LhBYdqkT0o2/VrrRlz//zsdn0c9os35Il6n1O8DSlC2TO7R+c4zJsUHYeEkE2EmzlZQMFgVtRUVWYZek6xqfDIZJ789wvBoIyyk0QH3UdpuanMyP8t8oQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(23010399003)(6133799003)(22082099003)(18002099003)(10067099003)(56012099006)(3023799007)(261009223027099003)(261021135927099003)(261021123027099003)(261021121427099003)(11063799006)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	I7X3uf3naxW8Ug6Bix3xDSgfiS+/ZiIdoZ3UJmn9IeN/rtsdk526J2+eIwOVw+mxod+2LRuStyvsGLS81OcATkKcsVfzZB+oj5Gbf5HSgsMhMC93C5R5WFiiWawgvQe4hZbYjDQhssr/DMQqW15eROaPl77wOGVCKcNga//j/Oe6uHntWowZldVt9Rf6F57P9ucv+oakzJ+1km5YZXucdhl+v6ZPXVWNF9izRDgNCGOX5tsOWojK/Txwi0gFKcpewwMCMpV+A76b3bPzxeKwarO6pn8dRwBzFs3e4mKL60gXpKEUkUM2mXob+bPQkK29oXaFb67mN1446SW4VoTFY9uzUoVfVv2ZWwonAS5JwblLoqwUjJGzapz+YZIBKpintUjAublKdS9YXgAsFTJ/Hj9iapqoQ/k62jovJDQZTLKckaFB2cALHhsWgC4Vwz7g
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 07:20:59.3386
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce55c9ae-dba3-425c-2370-08df38b1d808
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037A7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7067

Expose HSMP_SET_POWER_MODE as a read/write socket file on both the
ACPI and platform drivers. A read returns the current mode name and,
on Venice for modes 4/5, the packed PPT and utilization parameters.
A write takes the mode alone for modes 0-3, or mode plus PPT/util
fields for Venice modes 4/5 (v1 or v2 packing by protocol version).

Co-developed-by: Suma Hegde <Suma.Hegde@amd.com>
Signed-off-by: Suma Hegde <Suma.Hegde@amd.com>
Signed-off-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
---
 Documentation/arch/x86/amd_hsmp.rst   |   8 +
 drivers/platform/x86/amd/hsmp/acpi.c  |   3 +
 drivers/platform/x86/amd/hsmp/plat.c  |   3 +
 drivers/platform/x86/amd/hsmp/sysfs.c | 219 ++++++++++++++++++++++++++
 drivers/platform/x86/amd/hsmp/sysfs.h |   5 +
 5 files changed, 238 insertions(+)

diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
index e1159bbea5991..ef83970492b6b 100644
--- a/Documentation/arch/x86/amd_hsmp.rst
+++ b/Documentation/arch/x86/amd_hsmp.rst
@@ -194,6 +194,14 @@ write-only when the platform enables only that direction of the message.
   is 100-10000 MHz.
 * cclk_floor_limit: Socket floor limit in MHz (write only). A write sets
   the floor for every core on the socket. It is a 16-bit value.
+* powereff_mode: Read/write power-efficiency mode. Modes are
+  0=HighPerformance, 1=PowerEfficiency, 2=IOPerformance,
+  3=BalancedMemory, 4=BalancedCore, 5=BalancedCoreMemory. A read returns
+  "<mode> <name>" and, on Venice for modes 4/5, the packed parameters.
+  Writes accept "<mode>" for modes 0-3 (and for 4/5 on non-Venice). On
+  Venice, modes 4/5 take "<mode> <ppt_W> <util%>" when the protocol is
+  below 7.1, or "<mode> <ppt_W> <low%> <high%>" for protocol 7.1 and
+  later.
 * tdelta: Socket thermal behaviour (read only).
 * apb_disable: Read/write. 1 disables APB, 0 enables it.
 * dfc_enable: Read/write DF C-state enable. 1 enables, 0 disables.
diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 284dc21dfdc37..e030f3c80721b 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -671,6 +671,8 @@ HSMP_DEV_ATTR_W(cclk_boost_limit, HSMP_SET_BOOST_LIMIT_SOCKET,
 		hsmp_cclk_boost_limit_store, 0200);
 HSMP_DEV_ATTR_W(cclk_floor_limit, HSMP_SET_GET_FLOOR_LIMIT,
 		hsmp_cclk_floor_limit_store, 0200);
+HSMP_DEV_ATTR_RW(powereff_mode, HSMP_SET_POWER_MODE, HSMP_SET_POWER_MODE,
+		 hsmp_powereff_mode_show, hsmp_powereff_mode_store, 0644);
 HSMP_DEV_ATTR_RW(apb_disable, HSMP_SET_DF_PSTATE, HSMP_SET_DF_PSTATE,
 		 hsmp_apb_disable_show, hsmp_apb_disable_store, 0644);
 HSMP_DEV_ATTR_RW(dfc_enable, HSMP_DFC_ENABLE_CTRL, HSMP_DFC_ENABLE_CTRL,
@@ -839,6 +841,7 @@ static struct attribute *hsmp_dev_attr_list[] = {
 	&hattr_socket_power.dattr.attr,
 	&hattr_cclk_boost_limit.dattr.attr,
 	&hattr_cclk_floor_limit.dattr.attr,
+	&hattr_powereff_mode.dattr.attr,
 	&hattr_tdelta.dattr.attr,
 	&hattr_apb_disable.dattr.attr,
 	&hattr_cc6_enable.dattr.attr,
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index 8207900b8a170..f1ab7f25a29c1 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -1868,6 +1868,8 @@ HSMP_DEV_ATTR_W_X8(cclk_boost_limit, HSMP_SET_BOOST_LIMIT_SOCKET,
 		   hsmp_cclk_boost_limit_store, 0200);
 HSMP_DEV_ATTR_W_X8(cclk_floor_limit, HSMP_SET_GET_FLOOR_LIMIT,
 		   hsmp_cclk_floor_limit_store, 0200);
+HSMP_DEV_ATTR_RW_X8(powereff_mode, HSMP_SET_POWER_MODE, HSMP_SET_POWER_MODE,
+		    hsmp_powereff_mode_show, hsmp_powereff_mode_store, 0644);
 HSMP_DEV_ATTR_X8(tdelta, HSMP_READ_TDELTA, hsmp_msg_resp32_show, 0444);
 HSMP_DEV_ATTR_RW_X8(apb_disable, HSMP_SET_DF_PSTATE, HSMP_SET_DF_PSTATE,
 		    hsmp_apb_disable_show, hsmp_apb_disable_store, 0644);
@@ -1914,6 +1916,7 @@ static struct attribute _name[] = {					       \
 	&hattr_socket_power##_sock_ind.dattr.attr,			       \
 	&hattr_cclk_boost_limit##_sock_ind.dattr.attr,		       \
 	&hattr_cclk_floor_limit##_sock_ind.dattr.attr,		       \
+	&hattr_powereff_mode##_sock_ind.dattr.attr,			       \
 	&hattr_tdelta##_sock_ind.dattr.attr,				       \
 	&hattr_apb_disable##_sock_ind.dattr.attr,			       \
 	&hattr_cc6_enable##_sock_ind.dattr.attr,			       \
diff --git a/drivers/platform/x86/amd/hsmp/sysfs.c b/drivers/platform/x86/amd/hsmp/sysfs.c
index e941574711687..254ba586da861 100644
--- a/drivers/platform/x86/amd/hsmp/sysfs.c
+++ b/drivers/platform/x86/amd/hsmp/sysfs.c
@@ -602,6 +602,225 @@ ssize_t hsmp_cclk_floor_limit_store(struct device *dev,
 	return count;
 }
 
+/* powereff_mode utilization field (7-bit), used by both v1 and v2 layouts */
+#define POWEREFF_UTIL_MASK	0x7F
+/* powereff_mode v2 ppt_W field max (12-bit) */
+#define POWEREFF_PPT_W_MAX	0xFFF
+/* powereff_mode utilization percentage bound */
+#define POWEREFF_UTIL_PCT_MAX	100
+/* powereff_mode v1 ppt_mW field (21-bit) */
+#define POWEREFF_PPT_MW_MASK	0x1FFFFF
+#define POWEREFF_MODE_MAX	5
+/* Modes 4/5 take util/ppt (v1) or low/high util + ppt (v2) on Venice. */
+#define POWEREFF_MODE_EXTRA_MIN	4
+#define HSMP_PROTO_VER_7_1	0x00070001U
+
+static const char * const powereff_mode_names[] = {
+	"HighPerformance",
+	"PowerEfficiency",
+	"IOPerformance",
+	"BalancedMemory",
+	"BalancedCore",
+	"BalancedCoreMemory",
+};
+
+/*
+ * Only Venice (family 0x1A, specific models) accepts power-efficiency mode
+ * parameters for modes 4/5; other families take just the mode.
+ */
+#define HSMP_IS_VENICE_MODEL(m) \
+	(((m) >= 0x50 && (m) <= 0x5F) || \
+	 ((m) >= 0x90 && (m) <= 0x9B) || \
+	 ((m) >= 0xA0 && (m) <= 0xAB) || \
+	 ((m) >= 0xC0 && (m) <= 0xCF))
+#define HSMP_IS_VENICE() \
+	(boot_cpu_data.x86 == 0x1A && HSMP_IS_VENICE_MODEL(boot_cpu_data.x86_model))
+
+static int hsmp_parse_u32_args(const char *buf, u32 *vals, int n,
+			       unsigned int base, int *got);
+
+static u32 hsmp_powereff_proto_ver(struct device *dev,
+				   const struct hsmp_sys_attr *hattr)
+{
+	struct hsmp_plat_device *pdev = get_hsmp_pdev();
+	u16 sock_ind = hsmp_sysfs_sock_ind(dev, hattr);
+
+	if (!pdev || sock_ind >= pdev->num_sockets)
+		return 0;
+
+	return pdev->sock[sock_ind].proto_ver;
+}
+
+ssize_t hsmp_powereff_mode_show(struct device *dev,
+				struct device_attribute *attr,
+				char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	bool is_v2 = hsmp_powereff_proto_ver(dev, hattr) >= HSMP_PROTO_VER_7_1;
+	struct hsmp_message msg = {};
+	u32 resp;
+	u8 mode;
+	int ret;
+
+	/* Query firmware for the current mode (bit[31] = get); mode in [2:0]. */
+	msg.msg_id = HSMP_SET_POWER_MODE;
+	msg.sock_ind = hsmp_sysfs_sock_ind(dev, hattr);
+	msg.num_args = 1;
+	msg.response_sz = 1;
+	msg.args[0] = BIT(31);
+
+	ret = hsmp_send_message(&msg);
+	if (ret)
+		return ret;
+
+	resp = msg.args[0];
+	mode = resp & 0x7;
+	if (mode > POWEREFF_MODE_MAX)
+		return -ERANGE;
+
+	/*
+	 * Only Venice modes 4/5 carry extra params; decode per proto layout
+	 * (same field packing as the store path).
+	 */
+	if (HSMP_IS_VENICE() && mode >= POWEREFF_MODE_EXTRA_MIN) {
+		if (is_v2) {
+			u32 ppt_w = (resp >> 5) & POWEREFF_PPT_W_MAX;
+			u32 low_util = (resp >> 17) & POWEREFF_UTIL_MASK;
+			u32 high_util = (resp >> 24) & POWEREFF_UTIL_MASK;
+
+			return sysfs_emit(buf, "%u %s %u %u %u\n",
+					  mode, powereff_mode_names[mode],
+					  ppt_w, low_util, high_util);
+		}
+		u32 util = (resp >> 3) & POWEREFF_UTIL_MASK;
+		u32 ppt_mw = (resp >> 10) & POWEREFF_PPT_MW_MASK;
+
+		return sysfs_emit(buf, "%u %s %u %u\n",
+				  mode, powereff_mode_names[mode],
+				  ppt_mw / 1000, util);
+	}
+
+	return sysfs_emit(buf, "%u %s\n", mode, powereff_mode_names[mode]);
+}
+
+ssize_t hsmp_powereff_mode_store(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, size_t count)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	bool is_v2 = hsmp_powereff_proto_ver(dev, hattr) >= HSMP_PROTO_VER_7_1;
+	u32 mode, util = 0, low_util = 0, high_util = 0, ppt_limit = 0;
+	struct hsmp_message msg = {};
+	bool has_params;
+	u32 vals[4];
+	u32 reg_val;
+	int tok_total;
+	int ret;
+	int got;
+
+	/*
+	 * Accept mode-only, Venice v1 (mode ppt_W util), or Venice v2
+	 * (mode ppt_W low_util high_util). Try each exact arity.
+	 */
+	if (!hsmp_parse_u32_args(buf, vals, 1, 10, &got)) {
+		tok_total = 1;
+	} else if (!hsmp_parse_u32_args(buf, vals, 3, 10, &got)) {
+		tok_total = 3;
+	} else if (!hsmp_parse_u32_args(buf, vals, 4, 10, &got)) {
+		tok_total = 4;
+	} else {
+		hsmp_err(dev, "powereff_mode", HSMP_ERR_ARGC,
+			 "field=mode want=1 got=%d valid=0-%u", got,
+			 POWEREFF_MODE_MAX);
+		return -EINVAL;
+	}
+
+	mode = vals[0];
+	if (mode > POWEREFF_MODE_MAX) {
+		hsmp_err(dev, "powereff_mode", HSMP_ERR_RANGE,
+			 "field=mode got=%u valid=0-%u", mode, POWEREFF_MODE_MAX);
+		return -EINVAL;
+	}
+
+	/* Extra params apply only to Venice modes 4/5. */
+	has_params = (mode >= POWEREFF_MODE_EXTRA_MIN) && HSMP_IS_VENICE();
+	reg_val = mode & 0x7; /* bit 31 = 0 for SET */
+
+	if (has_params) {
+		if (is_v2) {
+			if (tok_total != 4) {
+				hsmp_err(dev, "powereff_mode", HSMP_ERR_ARGC,
+					 "mode=%u want=4 got=%d fmt=\"mode ppt_W low_util high_util\"",
+					 mode, tok_total);
+				return -EINVAL;
+			}
+			ppt_limit = vals[1];
+			low_util = vals[2];
+			high_util = vals[3];
+			if (ppt_limit > POWEREFF_PPT_W_MAX) {
+				hsmp_err(dev, "powereff_mode", HSMP_ERR_RANGE,
+					 "field=ppt_W got=%u valid=0-%u",
+					 ppt_limit, POWEREFF_PPT_W_MAX);
+				return -EINVAL;
+			}
+			if (low_util > POWEREFF_UTIL_PCT_MAX ||
+			    high_util > POWEREFF_UTIL_PCT_MAX) {
+				hsmp_err(dev, "powereff_mode", HSMP_ERR_RANGE,
+					 "field=util low=%u high=%u valid=0-%u",
+					 low_util, high_util,
+					 POWEREFF_UTIL_PCT_MAX);
+				return -EINVAL;
+			}
+			reg_val |= (ppt_limit & POWEREFF_PPT_W_MAX) << 5;
+			reg_val |= (low_util & POWEREFF_UTIL_MASK) << 17;
+			reg_val |= (high_util & POWEREFF_UTIL_MASK) << 24;
+		} else {
+			if (tok_total != 3) {
+				hsmp_err(dev, "powereff_mode", HSMP_ERR_ARGC,
+					 "mode=%u want=3 got=%d fmt=\"mode ppt_W util\"",
+					 mode, tok_total);
+				return -EINVAL;
+			}
+			ppt_limit = vals[1];
+			util = vals[2];
+			if (ppt_limit > POWEREFF_PPT_MW_MASK / 1000) {
+				hsmp_err(dev, "powereff_mode", HSMP_ERR_RANGE,
+					 "field=ppt_W got=%u valid=0-%u",
+					 ppt_limit, POWEREFF_PPT_MW_MASK / 1000);
+				return -EINVAL;
+			}
+			if (util > POWEREFF_UTIL_PCT_MAX) {
+				hsmp_err(dev, "powereff_mode", HSMP_ERR_RANGE,
+					 "field=util got=%u valid=0-%u",
+					 util, POWEREFF_UTIL_PCT_MAX);
+				return -EINVAL;
+			}
+			reg_val |= (util & POWEREFF_UTIL_MASK) << 3;
+			reg_val |= ((ppt_limit * 1000) & POWEREFF_PPT_MW_MASK) << 10;
+		}
+	} else if (tok_total > 1) {
+		hsmp_err(dev, "powereff_mode", HSMP_ERR_ARGC,
+			 "field=mode want=1 got=%d valid=0-%u", tok_total,
+			 POWEREFF_MODE_MAX);
+		return -EINVAL;
+	}
+
+	msg.msg_id = HSMP_SET_POWER_MODE;
+	msg.sock_ind = hsmp_sysfs_sock_ind(dev, hattr);
+	msg.num_args = 1;
+	msg.response_sz = 1;
+	msg.args[0] = reg_val;
+
+	ret = hsmp_send_message(&msg);
+	if (ret) {
+		hsmp_err(dev, "powereff_mode", HSMP_ERR_HW,
+			 "op=set_power_mode mode=%u rc=%d", mode, ret);
+		return ret;
+	}
+
+	return count;
+}
+
 /* APB disable show function - reads current APB enable/disable status */
 ssize_t hsmp_apb_disable_show(struct device *dev,
 			      struct device_attribute *attr,
diff --git a/drivers/platform/x86/amd/hsmp/sysfs.h b/drivers/platform/x86/amd/hsmp/sysfs.h
index 36368f13d72f0..f4cec7459aac2 100644
--- a/drivers/platform/x86/amd/hsmp/sysfs.h
+++ b/drivers/platform/x86/amd/hsmp/sysfs.h
@@ -115,6 +115,11 @@ ssize_t hsmp_cclk_boost_limit_store(struct device *dev,
 ssize_t hsmp_cclk_floor_limit_store(struct device *dev,
 				    struct device_attribute *attr,
 				    const char *buf, size_t count);
+ssize_t hsmp_powereff_mode_show(struct device *dev,
+				struct device_attribute *attr, char *buf);
+ssize_t hsmp_powereff_mode_store(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, size_t count);
 ssize_t hsmp_apb_disable_show(struct device *dev, struct device_attribute *attr,
 			      char *buf);
 ssize_t hsmp_apb_disable_store(struct device *dev, struct device_attribute *attr,
-- 
2.34.1

