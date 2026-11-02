Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.63
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793604036;
	b=MjHE+aqYfu0A5xrn+DMdHbDMXPHwfos52pswKuIwA2HjQJd3wxYxRFbaXlXL6jRqx9sf
	 cBZQVGk1zZUPZzX9yJDYtoQh6a9PqvtHdBi9DT+216PpVlxSgZ0xK9CLZDmEuciRXDZSn
	 qtei8aGS6LVi129UN+ghV9Vdw6LiDc0GJZ88MrTI+KWHj7P1LYnylwGJIvx4G0LzFkw4n
	 YKvqpyeMkTSGSy39Wclwko6OwO5N2nFXobjbPr7OPvLxmIHcbqQtbhjTq8xDucfHsf2PH
	 HlAFek0uQmMP4o2Hc0ii+Ki8x29d4njXgW6YcDQnR1G+vCOhjl6g2bFF17jxABd55eA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793604036;
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
	bh=PRvEm8ToPYlQ1YVvF68bMEjLxvEqPyyH1o2o8kBehFM=;
	b=LTJ9NCP+KMOCAdS22qiZ6wlZtRf1xDHRJ5dIxNJ5xghN+yw85d3jpc2I8O8fMBwUrF+v
	 4MoJLDjEi32NtOVx/e2frtEbtTb0iIMR6JJ0fJvNcpBo8Yy+3qTUJkBeGPFjil5K4nkZu
	 JHb7tHWrN8uANmuw7/HrR7uxkYBGN4BiA0mRgdjwWf8NdpRmcYpzrwyq+aILLUuCb0UMK
	 ATUqtabTXOudywmIE23EbKwZFnVb56e0Hv0g45JB26wGhh7fRoHlT+E87BliSt+D5lH4z
	 vQM9aivcG4wYeqDw+/01pQ3e3Rh498b3NlXYNREDZU1y/00ggfJhP3FebPPvQl2LGSQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Y7eRfLk1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.63
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010063.outbound.protection.outlook.com [52.101.46.63])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27441606A327
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Nov 2026 07:20:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27441606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Y7eRfLk1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dPEAhPaAWvN85+yLDG/1gjdhX5jk1jz4+mtmSESdtYh/q5s7p7c8HHv/azapWSBFBtHDGk6pONQfDvij6UTqHU8329TtJ37sxWvtOIW7TaeZj+uUUdASf+e61xiuoQJy7gPI93Y/ewYln16jxoJYkGay0DAg69KdD6FMdjuk/X8th1vFcScu3NbmryBdu9VPY2rlDi+6MZ2XjjVEVkrRqeEBdb5ELaTSAlffSTeOSIL2DOmpV4ahmwR3wQX34/jbtfDJvOopabx8XLpntiWQ2c0ky1CrGnUrijyd84IJ82BMfdrDXlT6bmZTvpiY/mV25XDNULLxPAy+c0yKFnmqww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PRvEm8ToPYlQ1YVvF68bMEjLxvEqPyyH1o2o8kBehFM=;
 b=RLEffwnqMBQ5sHC9oUojx1oTDnXeJnPSSAxYIRQdha9wnP+fj2k2ILJjP0tEskbP3lualCFQo/eozpCqVGz9j1ejB60jYOsXkftucLgnMRZAyS8WHKg8En/jDc+yTWd1J5fKUTug9RCwqNYPfTKIH8l+8mjEZlOM8/lMaNKQ3COhYmfnBIzrEoq/TG8uwDUg4YdP85wXUDZ218v8iEycCnJbTAt0YuT9Ab6Rqkb5Y67NzYs8/IXjKZy487v+fDLChLuHkb8JRgFXLY2o8RCsIJGboHCFcOrhlxBm3nVbI4UcOTpAB3rKWipICyGmEmuc91HnynM5lYI6DQxi4JNaKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PRvEm8ToPYlQ1YVvF68bMEjLxvEqPyyH1o2o8kBehFM=;
 b=Y7eRfLk11QKIVX1ZPfr0mbWjQERTqAfs/hM2rU95w+P6qAicoAcwYpB2+8SbFTbGv6ZlgwHWocsFTIw2wbOnHD+Lvmf9gKL3xYhoCnm8qjyXXu54C1dXN1N4RVhs5f6HeeZEY6kcKTsntbF89JeP09FNa63quY2r2wHlIa/FdQw=
Received: from SJ0PR05CA0180.namprd05.prod.outlook.com (2603:10b6:a03:339::35)
 by SJ2PR12MB9137.namprd12.prod.outlook.com (2603:10b6:a03:562::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 07:20:31 +0000
Received: from SJ1PEPF000037A7.namprd04.prod.outlook.com
 (2603:10b6:a03:339:cafe::7) by SJ0PR05CA0180.outlook.office365.com
 (2603:10b6:a03:339::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.4 via Frontend Transport; Mon, 2
 Nov 2026 07:20:31 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000037A7.mail.protection.outlook.com (10.167.244.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 07:20:30 +0000
Received: from trento15c5.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 2 Nov
 2026 01:20:28 -0600
From: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <Suma.Hegde@amd.com>,
	<NaveenKrishna.Chatradhi@amd.com>, Muthusamy Ramalingam
	<Muthusamy.Ramalingam@amd.com>
Subject: [PATCH 09/26] platform/x86/amd/hsmp: Add gmi3_link_width sysfs file
Date: Mon, 2 Nov 2026 07:19:07 +0000
Message-ID: <d7f919c9ac77f4e282467223f414c0f444279e72.1793602633.git.Muthusamy.Ramalingam@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A7:EE_|SJ2PR12MB9137:EE_
X-MS-Office365-Filtering-Correlation-Id: 159a59e3-5acf-4361-4758-08df38b1c717
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|261021123027099003|261021121427099003|261009223027099003|261026121527099003|11063799006|10067099003|56012099006|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	lhT6KkPZna+uYEX7ipQxJDn13aiQDNBI1AFebIjE2kH1HLipwhq8pgB9aWWlFiHSJR5DBECrewurOx0LFsVNq02kX5fguDr3ogXwwmFFOSNVq8rDEEmP5Tw9IWS+oKD3j3XOLRAof/+QKf7Mu8fOnMbznwJkTtLfEM0w6Ihh6XT96YghmZ7uG+96Jc6zsBEmBHfR8zOAZMMgjv9UT86gaiOmC9adBTq7mIdq9KOM2yhi6+aRFCntVjB9Ez/UFzlLKflOQjf5wOp4IOJZ483wD4S9lDaK8Q3IwvfhdAGVLGy8VG0zzNwvT+21vdUvlzEkII4ujCYzZfgkU47XMiFyytnuLFOBYI938/9rFFNOcZl7N7FnpRZ8Ht2D8JuICt3TIQGQLXfs4iyVrn9Kd9vmBcn+eSA9RkhohwzqE+W7kqxFv+ocASsCmEyqA0ohZdsSl0T0vpheZf1YoMfu6uMTWPNk16SOqnATBpfeVzNtdLPylUfbcOfZ0IJSv2IXqCMCcSQZ8PbrvVCREdPq1toMSlBAPdUSlukv55onSSmo5zliuK2NPqRMmAl8n0Ovcb4fm8M0wKUwilX0mFQHknRf6AeFfJkUHr+XmUZmZhTiPgf3+G4pn+wbB6weMBuPu+Jcgwv3P+eWfrV5Mc1RrNeD3N04HP83jxOmSe4rRVaTFAGpkCC4ktWdHm7S2zZ9zvYcmK65/dZJ/P2KS/9lN50cwQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(261021123027099003)(261021121427099003)(261009223027099003)(261026121527099003)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	816ky8UeDyuJd44Ty3nqd601p6Wxr1tYVekt80s2z1OfDOR7yNM5s0cvDCZSUHnZlLdTbQ1/KdNWxSAAcpfde6hcjUCHz9oBOJuYlh8A3WVX8PiprM5PqlAJAjzk0MmTvR/USMfmZ0FVZ42STzdz59bAXk+XDnsU0lK+qXxulhPhOLMew9c7fvZOPM7FRey+LBY0VewwjOBn4htVc/KfCJKxQ+zSIg5Ee+CWg/asgwsSfM+LdgAa9bz9OOBZEezrkuHav5dSbcmUrC3n3W8qkBpkVlPeiq/o9aNlUkYe+ctbFiOYI5ax4D3GNMDzDRVytAUWL7plaUCOYjrV6+/gSDVH/geT0ISJTR8dP7OYLc5E+1yL/TcKrYqRBcQcPZ4jNunvTJWeAiaH6NYRlxtya4Iakv3+57iDe7LNnOZHvjby+azGrh9qUbznkOueMblz
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 07:20:30.9425
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 159a59e3-5acf-4361-4758-08df38b1c717
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037A7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9137

Expose HSMP_SET_GMI3_WIDTH as a write-only socket file on both the ACPI
and platform drivers. A write accepts "min max", where each value is
an 8-bit field. Extra arguments are rejected. Firmware rejects unsupported
widths.

Co-developed-by: Suma Hegde <Suma.Hegde@amd.com>
Signed-off-by: Suma Hegde <Suma.Hegde@amd.com>
Signed-off-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
---
 Documentation/arch/x86/amd_hsmp.rst   |  3 ++
 drivers/platform/x86/amd/hsmp/acpi.c  |  3 ++
 drivers/platform/x86/amd/hsmp/plat.c  |  3 ++
 drivers/platform/x86/amd/hsmp/sysfs.c | 60 +++++++++++++++++++++++++++
 drivers/platform/x86/amd/hsmp/sysfs.h |  3 ++
 5 files changed, 72 insertions(+)

diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
index 134c94e71b006..d7c4653f4f2f2 100644
--- a/Documentation/arch/x86/amd_hsmp.rst
+++ b/Documentation/arch/x86/amd_hsmp.rst
@@ -125,6 +125,9 @@ write-only when the platform enables only that direction of the message.
 * xgmi_width: Read/write xGMI link width range as "min max".
   0 is x4, 1 is x8, and 2 is x16. Each value is an 8-bit field.
   Extra arguments are rejected. Firmware rejects unsupported widths.
+* gmi3_link_width: Write-only. Sets the GMI3 link width range as
+  "min max". Each value is an 8-bit field. Extra arguments are rejected.
+  Firmware rejects unsupported widths.
 * socket_power_limit_max: Maximum socket power limit in mWatts (read only).
 * cclk_boost_limit: Socket boost limit in MHz (write only). Accepted range
   is 100-10000 MHz.
diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 4f4170d191850..2f9228622fba4 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -543,6 +543,8 @@ HSMP_DEV_ATTR_RW(df_pstate_range, HSMP_SET_PSTATE_MAX_MIN, HSMP_SET_PSTATE_MAX_M
 		 hsmp_df_pstate_range_show, hsmp_df_pstate_range_store, 0644);
 HSMP_DEV_ATTR_RW(xgmi_width, HSMP_SET_XGMI_LINK_WIDTH, HSMP_SET_XGMI_LINK_WIDTH,
 		 hsmp_xgmi_width_show, hsmp_xgmi_width_store, 0644);
+HSMP_DEV_ATTR_W(gmi3_link_width, HSMP_SET_GMI3_WIDTH,
+		hsmp_gmi3_link_width_store, 0200);
 HSMP_DEV_ATTR_W(cclk_boost_limit, HSMP_SET_BOOST_LIMIT_SOCKET,
 		hsmp_cclk_boost_limit_store, 0200);
 HSMP_DEV_ATTR_RW(apb_disable, HSMP_SET_DF_PSTATE, HSMP_SET_DF_PSTATE,
@@ -577,6 +579,7 @@ static struct attribute *hsmp_dev_attr_list[] = {
 	&hattr_sdps_limit.dattr.attr,
 	&hattr_df_pstate_range.dattr.attr,
 	&hattr_xgmi_width.dattr.attr,
+	&hattr_gmi3_link_width.dattr.attr,
 	&hattr_socket_power.dattr.attr,
 	&hattr_cclk_boost_limit.dattr.attr,
 	&hattr_tdelta.dattr.attr,
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index 2c09a48b70471..ca4aa13bfc4bc 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -380,6 +380,8 @@ HSMP_DEV_ATTR_RW_X8(df_pstate_range, HSMP_SET_PSTATE_MAX_MIN,
 HSMP_DEV_ATTR_RW_X8(xgmi_width, HSMP_SET_XGMI_LINK_WIDTH,
 		    HSMP_SET_XGMI_LINK_WIDTH,
 		    hsmp_xgmi_width_show, hsmp_xgmi_width_store, 0644);
+HSMP_DEV_ATTR_W_X8(gmi3_link_width, HSMP_SET_GMI3_WIDTH,
+		   hsmp_gmi3_link_width_store, 0200);
 HSMP_DEV_ATTR_X8(socket_power, HSMP_GET_SOCKET_POWER, hsmp_msg_resp32_show,
 		 0444);
 HSMP_DEV_ATTR_W_X8(cclk_boost_limit, HSMP_SET_BOOST_LIMIT_SOCKET,
@@ -419,6 +421,7 @@ static struct attribute _name[] = {					       \
 	&hattr_sdps_limit##_sock_ind.dattr.attr,			       \
 	&hattr_df_pstate_range##_sock_ind.dattr.attr,			       \
 	&hattr_xgmi_width##_sock_ind.dattr.attr,			       \
+	&hattr_gmi3_link_width##_sock_ind.dattr.attr,			       \
 	&hattr_socket_power##_sock_ind.dattr.attr,			       \
 	&hattr_cclk_boost_limit##_sock_ind.dattr.attr,		       \
 	&hattr_tdelta##_sock_ind.dattr.attr,				       \
diff --git a/drivers/platform/x86/amd/hsmp/sysfs.c b/drivers/platform/x86/amd/hsmp/sysfs.c
index 4726b3dcdda3d..4c193fbcab013 100644
--- a/drivers/platform/x86/amd/hsmp/sysfs.c
+++ b/drivers/platform/x86/amd/hsmp/sysfs.c
@@ -45,6 +45,9 @@ static struct hsmp_cpu_info cpu_kobj_info[NR_CPUS];
 #define HSMP_ERR_ORDER	"order"
 #define HSMP_ERR_HW	"hw"
 
+/* GMI3 link width encodes 3 levels (0-2); upper bound for range diagnostics */
+#define HSMP_GMI3_LINK_WIDTH_MAX		2
+
 static const char * const freqlimit_srcnames[] = {
 	"cHTC-Active",
 	"PROCHOT",
@@ -891,6 +894,63 @@ ssize_t hsmp_xgmi_width_store(struct device *dev,
 	return count;
 }
 
+/* GMI3 link width store function - sets min and max link width */
+ssize_t hsmp_gmi3_link_width_store(struct device *dev,
+				   struct device_attribute *attr,
+				   const char *buf, size_t count)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	struct hsmp_message msg = {};
+	u32 min_width, max_width;
+	u32 vals[2];
+	int ret;
+	int got;
+
+	/* Parse input in format: "min max" */
+	ret = hsmp_parse_u32_args(buf, vals, 2, 10, &got);
+	if (ret) {
+		hsmp_err(dev, "gmi3_link_width", HSMP_ERR_ARGC,
+			 "want=2 got=%d fmt=\"min max\"", got);
+		return -EINVAL;
+	}
+	min_width = vals[0];
+	max_width = vals[1];
+
+	/* Min and max are 8-bit fields. Firmware rejects unsupported widths. */
+	if (min_width > 0xFF || max_width > 0xFF) {
+		hsmp_err(dev, "gmi3_link_width", HSMP_ERR_RANGE,
+			 "min=%u max=%u valid=0-255", min_width, max_width);
+		return -EINVAL;
+	}
+
+	/* Pack min link width[15:8] and max link width[7:0] */
+	msg.msg_id = HSMP_SET_GMI3_WIDTH;
+	msg.sock_ind = hsmp_sysfs_sock_ind(dev, hattr);
+	msg.num_args = 1;
+	msg.response_sz = 0;
+	msg.args[0] = (min_width << 8) | max_width;
+
+	ret = hsmp_send_message(&msg);
+	if (ret) {
+		if (max_width < min_width)
+			hsmp_err(dev, "gmi3_link_width", HSMP_ERR_ORDER,
+				 "min=%u max=%u rule=max>=min rc=%d",
+				  min_width, max_width, ret);
+		else if (min_width > HSMP_GMI3_LINK_WIDTH_MAX ||
+			 max_width > HSMP_GMI3_LINK_WIDTH_MAX)
+			hsmp_err(dev, "gmi3_link_width", HSMP_ERR_RANGE,
+				 "min=%u max=%u valid=0-%u rc=%d",
+				  min_width, max_width, HSMP_GMI3_LINK_WIDTH_MAX,
+				  ret);
+		else
+			hsmp_err(dev, "gmi3_link_width", HSMP_ERR_HW,
+				 "min=%u max=%u rc=%d", min_width, max_width, ret);
+		return ret;
+	}
+
+	return count;
+}
+
 static ssize_t boost_limit_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
 {
 	struct hsmp_cpu_info *cpu_info = NULL;
diff --git a/drivers/platform/x86/amd/hsmp/sysfs.h b/drivers/platform/x86/amd/hsmp/sysfs.h
index 58340e0544af6..1831d817a6834 100644
--- a/drivers/platform/x86/amd/hsmp/sysfs.h
+++ b/drivers/platform/x86/amd/hsmp/sysfs.h
@@ -119,6 +119,9 @@ ssize_t hsmp_xgmi_width_show(struct device *dev, struct device_attribute *attr,
 			     char *buf);
 ssize_t hsmp_xgmi_width_store(struct device *dev, struct device_attribute *attr,
 			      const char *buf, size_t count);
+ssize_t hsmp_gmi3_link_width_store(struct device *dev,
+				   struct device_attribute *attr,
+				   const char *buf, size_t count);
 
 void hsmp_create_per_cpu_kobjects(struct device *dev, struct kobject *cpu_parent,
 				  struct hsmp_socket *sock);
-- 
2.34.1

