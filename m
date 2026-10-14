Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011063.outbound.protection.outlook.com [52.101.57.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9E64EF130
	for <platform-driver-x86@vger.kernel.org>; Wed, 14 Oct 2026 11:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791976528; cv=fail; b=TvDb6XCyXcNB0GyhTxb8qbBpQJXchXtRDW1V/1bfxyYCmTdbjLY+GEH5ZK/dshL5TzxvlCkZmA2fxe1plVzZrnjUwAlii7k5k03n89PgIlw3+SNnqFMb4TVdpZouik6wUUdJ3qH55ADOOxdaHXPPMLj7/L0UVmI8xZFTReI6NmY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791976528; c=relaxed/simple;
	bh=xXnDC1v2Gt0VtTKxqJMAYmC4648vI0kvw7Z2UjoINYw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=abisHTJAGUcdDGJO/NuRvYYJSiYWtu49kcRu3xi555tkOWv1ia3wmvCB1+/uv4k6GRsIBUiLKx3nt0gXPkzhYsRxhU+NW10Pvz6v+yjibgxGQePXigkuQBv5M/3uD3VbvVD/0YiZRA3tE6aPJijoQMb5y9lmLg7mfdhm9d9LnJs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=r6/dkwED; arc=fail smtp.client-ip=52.101.57.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="r6/dkwED"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ftbxgJZCvOi1E2rvTTHdN444kFkShsXNad+zuord8CqghZCxEwQmOS/3PCGyDdMMU0+wObjin7enAaTOFaj5L4GUwws2Jgwb5HTWgoYlIjEf0rn1wcgFASELa6VesvEQsWNog9EuKizdKSyuF8C58Tjsj+x1e8HwW941KmQOfRumRb3g7TYJ7tx78eOJ7Wxzun0EuPpLo0/DEOL+MWZuO/fDbyyDaIdEziErxAhoJ+pFY79K7dFWUWCxNuvxhILpSEzeVWWgO9KBH+MF1DXGaQXP7RcsIOtJ671JmYQMTn4Tg5Z73ByYdgowsBtu6XtOLBKiDB0N3RKK5pIjp2Zcjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B52GG3x+/OK0vYOXq3AW8irL8vsauTEslUbGCO5Yn3Y=;
 b=NiNmd0j3pv6ktN4UVgNj14mVmF4Hklz+t2imcR4L1OPlTptLkRPVH31Jlf1mr+r6I1LbdV4RA7zujAy8K7M/MFoeu1Xdn0zuf/w5D8B5X27FZCpr/isyI/WME4AYWx4rLEqOLpGvELUQwYm9cZRa3fpLdsdmRIlOMSw/hz7/rlGgkFcdoXfv39ZyN9HGayorxmhbuMAlheSHEQSIRpP+0tkFfFAQ6TB021K/CJMXk5PYoCXuueJXvS7U4CyPKSz//BDR5KNzjK/lIS6lXis5nMimfem7qtq8YNhJ/CImXnezXkBDqSXbQoV2q9rjT67CdJ4C04w7YUnSXaLYzhdKhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B52GG3x+/OK0vYOXq3AW8irL8vsauTEslUbGCO5Yn3Y=;
 b=r6/dkwEDRBLvCH7CwrFXw6/LzSlkY3IpHkvmOj+iemtiG2jZxejNg/8LxgwmN4GjGEiJKKsP+r+m/PLWeBf4Pr3LoYC9hsUlTtIsZgWqbSi5TmrmAgkw4NT15nr1ATYJCQJOl3DfRyo3mOngbjLuoErz88LNqjxr76fGVfpXRJc=
Received: from PH3PEPF000040A8.namprd05.prod.outlook.com (2603:10b6:518:1::4a)
 by DS0PR12MB7728.namprd12.prod.outlook.com (2603:10b6:8:13a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Wed, 14 Oct
 2026 11:15:18 +0000
Received: from CY7PEPF000000F0.namprd05.prod.outlook.com
 (2a01:111:f403:f912::1) by PH3PEPF000040A8.outlook.office365.com
 (2603:1036:903:49::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Wed, 14
 Oct 2026 11:15:17 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY7PEPF000000F0.mail.protection.outlook.com (10.167.247.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Wed, 14 Oct 2026 11:15:17 +0000
Received: from trento15c5.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 14 Oct
 2026 06:15:06 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <muthusamy.ramalingam@amd.com>,
	<NaveenKrishna.Chatradhi@amd.com>, Suma Hegde <Suma.Hegde@amd.com>,
	"Muthusamy Ramalingam" <Muthusamy.Ramalingam@amd.com>
Subject: [PATCH 8/8] platform/x86/amd/hsmp: Add sysfs support for new HSMP messages
Date: Wed, 14 Oct 2026 11:14:30 +0000
Message-ID: <20261014111430.23156-9-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261014111430.23156-1-suma.hegde@amd.com>
References: <20261014111430.23156-1-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY7PEPF000000F0:EE_|DS0PR12MB7728:EE_
X-MS-Office365-Filtering-Correlation-Id: bb07d681-fc7c-47bc-42ec-08df29e46da6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|23010399003|82310400026|1800799024|22082099003|261009223027099003|18002099003|56012099006|6133799003|10067099003|11063799006|260925021311599003|260925022911599003;
X-Microsoft-Antispam-Message-Info:
	CFJek4743vJyAqoOI8wqd4Ypv8Uj/wj3Qr8cnhFvPe9nQBa3GugPq3XhQDQGCXXQDCwEOzB3c4HE1CSW/zOd7Z0nSaHAHcqZzIiOP4PhFrQ1OfDDH4ZoSMjkh92zWhMIp7dcQYJ6/eqlROZVZoy4lYSVFP1RZjgEm+JxEQ0g4bfMAwc95IBxeg26iq+qyi07yB2xQPnsfzC0V05Bz0cU1+qWR13zUai714T8U2ksZ0b+b5DDge7GuOqszbwWbqA4euxbtkJhtM63utCcemwCwxQf9+XfIFdNdr0aspaIiWNKoUjnMSVEHUCYfrhWRuufJs7dU2s96oJ91i5BZOkmL5w8BTzfYMJhL99GTRk6HMhHwSxqZx8yR6td68QNGg5ZdeLqsQbk0S16X61hL7K8qHndbZUt3M7QtgYPNwbnZ9A/O/DdhvRBMXT+mcft6rKxEOldPMPbqrHn0N+tGf1u3HM0xB0AwqXCQg4KEOzDY6i2BaI4XMBY2KU8FK2P4WuakBPr4Pyp+eeaE7ifX5CQ/EuWJ6Kod30lzSswmcLkNWYxdSiVpwA6SSVuWuFFCE7JeQ/qVNSPbuUglPEVcf4276ufJPtmuOUb0VW2RU5fXmFR6dpUzyy3gPoh5RdZ6ZLKJRJAneY4RlHiADavx3R6AMAymZKO5QehfX3nla19LRCUUf2OR68fskrd/UfH1qJtwtiSLkaR2tTEFYEczK9igQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(82310400026)(1800799024)(22082099003)(261009223027099003)(18002099003)(56012099006)(6133799003)(10067099003)(11063799006)(260925021311599003)(260925022911599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jj2zsexByVahaai4u80qJxMKIIn0GUqoNUqOcxP17V0pU8Zfo8l+uDq7CDarqGi1BDZjwjwaROIZ5DsaVWLmMydFYg0QCF+Hd5bSpS/5EGmUX+Psk1v2NBpIHtm9VAWO63PFIdJ9l7kMUiFB7fFLPFrw8dcTh1avpru0QHdsRa2F2pWDpp3MXZbyO1SyeWPvdUB3cOFRVt8PzaEhIVBEJYSaY0jYQWYopnrRxPtDIhe3Yfw/4ZRUH/r+G0S2TvZndm41FVF09vsF6KX3ZovToLXNmWPa6njw1MoWgnJ1pvjLdqYksrRJQDX/jh1HsiTJ8ZgHyWfNhOVtRqNgx7tXwZZYDcSNlt5cfssJzZv5oQu/NC6d/oSKZe0L98NM59f2NOX933AavB+Tm72OPNXqg+SqhON8OQwteYIlfTORFeky7OI3xdta3UyK1J91Dc+c
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 11:15:17.7951
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb07d681-fc7c-47bc-42ec-08df29e46da6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY7PEPF000000F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7728

From: Suma Hegde <Suma.Hegde@amd.com>

Add sysfs attributes and handlers for additional HSMP controls and
telemetry, including DFC/PC6/CC6 enable, rail isolation policy, APB
disable, socket power limit, socket power, and tdelta.

Expose cclk_boost_limit as a write-only file that sets
HSMP_SET_BOOST_LIMIT_SOCKET through HSMP_DEV_ATTR_W.

Document the shared socket path and the new sysfs files.

Co-developed-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
Signed-off-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
Signed-off-by: Suma Hegde <Suma.Hegde@amd.com>
---
 Documentation/arch/x86/amd_hsmp.rst   |  26 +-
 drivers/platform/x86/amd/hsmp/acpi.c  |  29 ++
 drivers/platform/x86/amd/hsmp/plat.c  |  46 +++-
 drivers/platform/x86/amd/hsmp/sysfs.c | 366 ++++++++++++++++++++++++++
 drivers/platform/x86/amd/hsmp/sysfs.h |  30 +++
 5 files changed, 492 insertions(+), 5 deletions(-)

diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
index 836a6dc8e9502..bd29ab9dd2385 100644
--- a/Documentation/arch/x86/amd_hsmp.rst
+++ b/Documentation/arch/x86/amd_hsmp.rst
@@ -72,7 +72,7 @@ most of the system management information from SMU in one go.
 
 The metrics table is made available as hexadecimal sysfs binary file
 under per socket sysfs directory created at
-/sys/devices/platform/amd_hsmp/socket%d/metrics_bin
+/sys/devices/platform/amd_hsmp/socket/socket%d/metrics_bin
 
 Note: lseek() is not supported as entire metrics table is read.
 
@@ -88,9 +88,14 @@ The same is defined in the amd_hsmp.h header.
 
 2. HSMP telemetry sysfs files
 
-Following sysfs files are available at /sys/devices/platform/AMDI0097:0X/ for
-ACPI based driver and /sys/devices/platform/amd_hsmp/socketX/ for platform
-device based driver.
+Both drivers expose the same per-socket files at
+/sys/devices/platform/amd_hsmp/socket/socketN/. The ACPI driver also
+keeps the files on the AMDI0097:0X device; socketN under amd_hsmp/socket/
+is a symlink to that device. The platform driver creates socketN as a
+directory under amd_hsmp/socket/.
+
+A file that is normally readable and writable is created read-only or
+write-only when the platform enables only that direction of the message.
 
 * c0_residency_input: Percentage of cores in C0 state.
 * prochot_status: Reports 1 if the processor is at thermal threshold value,
@@ -109,6 +114,19 @@ device based driver.
   in MHz.
 * pwr_current_active_freq_limit_source: Source of current active frequency
   limit.
+* socket_power: Average package power in mWatts (read only).
+* socket_power_limit: Current socket power limit in mWatts. Write accepts
+  1000-1000000 mWatts.
+* socket_power_limit_max: Maximum socket power limit in mWatts (read only).
+* cclk_boost_limit: Socket boost limit in MHz (write only). Accepted range
+  is 100-10000 MHz.
+* tdelta: Socket thermal behaviour (read only).
+* apb_disable: Read/write. 1 disables APB, 0 enables it.
+* dfc_enable: Read/write DF C-state enable. 1 enables, 0 disables.
+* pc6_enable: Read/write PC6 enable. 1 enables, 0 disables.
+* cc6_enable: Read/write CC6 enable for all cores. 1 enables, 0 disables.
+* rail_iso_freq_policy: Read/write CPU rail isolation frequency policy.
+  1 enables independent control, 0 disables it.
 
 3. Per-CPU sysfs files
 
diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index df0b344e22f80..9da4d9fb88be2 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -531,6 +531,25 @@ HSMP_DEV_ATTR(pwr_current_active_freq_limit, HSMP_GET_SOCKET_FREQ_LIMIT,
 	      hsmp_freq_limit_show, 0444);
 HSMP_DEV_ATTR(pwr_current_active_freq_limit_source, HSMP_GET_SOCKET_FREQ_LIMIT,
 	      hsmp_freq_limit_source_show, 0444);
+HSMP_DEV_ATTR(socket_power, HSMP_GET_SOCKET_POWER, hsmp_msg_resp32_show, 0444);
+HSMP_DEV_ATTR(socket_power_limit_max, HSMP_GET_SOCKET_POWER_LIMIT_MAX, hsmp_msg_resp32_show, 0444);
+HSMP_DEV_ATTR(tdelta, HSMP_READ_TDELTA, hsmp_msg_resp32_show, 0444);
+HSMP_DEV_ATTR_RW(socket_power_limit, HSMP_GET_SOCKET_POWER_LIMIT,
+		 HSMP_SET_SOCKET_POWER_LIMIT,
+		 hsmp_socket_power_limit_show, hsmp_socket_power_limit_store, 0644);
+HSMP_DEV_ATTR_W(cclk_boost_limit, HSMP_SET_BOOST_LIMIT_SOCKET,
+		hsmp_cclk_boost_limit_store, 0200);
+HSMP_DEV_ATTR_RW(apb_disable, HSMP_SET_DF_PSTATE, HSMP_SET_DF_PSTATE,
+		 hsmp_apb_disable_show, hsmp_apb_disable_store, 0644);
+HSMP_DEV_ATTR_RW(dfc_enable, HSMP_DFC_ENABLE_CTRL, HSMP_DFC_ENABLE_CTRL,
+		 hsmp_dfc_enable_show, hsmp_dfc_enable_store, 0644);
+HSMP_DEV_ATTR_RW(pc6_enable, HSMP_PC6_ENABLE, HSMP_PC6_ENABLE,
+		 hsmp_pc6_enable_show, hsmp_pc6_enable_store, 0644);
+HSMP_DEV_ATTR_RW(cc6_enable, HSMP_CC6_ENABLE, HSMP_CC6_ENABLE,
+		 hsmp_cc6_enable_show, hsmp_cc6_enable_store, 0644);
+HSMP_DEV_ATTR_RW(rail_iso_freq_policy, HSMP_CPU_RAIL_ISO_FREQ_POLICY,
+		 HSMP_CPU_RAIL_ISO_FREQ_POLICY,
+		 hsmp_rail_iso_freq_policy_show, hsmp_rail_iso_freq_policy_store, 0644);
 
 static struct attribute *hsmp_dev_attr_list[] = {
 	&hattr_c0_residency_input.dattr.attr,
@@ -547,6 +566,16 @@ static struct attribute *hsmp_dev_attr_list[] = {
 	&hattr_clk_fmin.dattr.attr,
 	&hattr_pwr_current_active_freq_limit.dattr.attr,
 	&hattr_pwr_current_active_freq_limit_source.dattr.attr,
+	&hattr_socket_power_limit_max.dattr.attr,
+	&hattr_socket_power_limit.dattr.attr,
+	&hattr_socket_power.dattr.attr,
+	&hattr_cclk_boost_limit.dattr.attr,
+	&hattr_tdelta.dattr.attr,
+	&hattr_apb_disable.dattr.attr,
+	&hattr_cc6_enable.dattr.attr,
+	&hattr_rail_iso_freq_policy.dattr.attr,
+	&hattr_pc6_enable.dattr.attr,
+	&hattr_dfc_enable.dattr.attr,
 	NULL
 };
 
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index 66269bf1823c2..2385827b7ae8a 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -181,6 +181,16 @@ HSMP_BIN_ATTR(7, *sock7_attr_list);
 	HSMP_SYS_ATTR(_name##_sock_ind, _name, _mode, _show, _store,	\
 		      _sock_ind, _rd_msg_id, _wr_msg_id)
 
+#define HSMP_DEV_ATTR_X8(_name, _msg_id, _show, _mode) \
+HSMP_DEV_ATTR(_name, _msg_id, _show, _mode, 0); \
+HSMP_DEV_ATTR(_name, _msg_id, _show, _mode, 1); \
+HSMP_DEV_ATTR(_name, _msg_id, _show, _mode, 2); \
+HSMP_DEV_ATTR(_name, _msg_id, _show, _mode, 3); \
+HSMP_DEV_ATTR(_name, _msg_id, _show, _mode, 4); \
+HSMP_DEV_ATTR(_name, _msg_id, _show, _mode, 5); \
+HSMP_DEV_ATTR(_name, _msg_id, _show, _mode, 6); \
+HSMP_DEV_ATTR(_name, _msg_id, _show, _mode, 7)
+
 #define HSMP_DEV_ATTR_RW_X8(_name, _rd_msg_id, _wr_msg_id, _show, _store, _mode) \
 HSMP_DEV_ATTR_RW(_name, _rd_msg_id, _wr_msg_id, _show, _store, _mode, 0); \
 HSMP_DEV_ATTR_RW(_name, _rd_msg_id, _wr_msg_id, _show, _store, _mode, 1); \
@@ -355,6 +365,30 @@ HSMP_DEV_ATTR(pwr_current_active_freq_limit_source, HSMP_GET_SOCKET_FREQ_LIMIT,
 HSMP_DEV_ATTR(pwr_current_active_freq_limit_source, HSMP_GET_SOCKET_FREQ_LIMIT,
 	      hsmp_freq_limit_source_show, 0444, 7);
 
+HSMP_DEV_ATTR_X8(socket_power_limit_max, HSMP_GET_SOCKET_POWER_LIMIT_MAX,
+		 hsmp_msg_resp32_show, 0444);
+HSMP_DEV_ATTR_RW_X8(socket_power_limit, HSMP_GET_SOCKET_POWER_LIMIT,
+		    HSMP_SET_SOCKET_POWER_LIMIT,
+		    hsmp_socket_power_limit_show,
+		    hsmp_socket_power_limit_store, 0644);
+HSMP_DEV_ATTR_X8(socket_power, HSMP_GET_SOCKET_POWER, hsmp_msg_resp32_show,
+		 0444);
+HSMP_DEV_ATTR_W_X8(cclk_boost_limit, HSMP_SET_BOOST_LIMIT_SOCKET,
+		   hsmp_cclk_boost_limit_store, 0200);
+HSMP_DEV_ATTR_X8(tdelta, HSMP_READ_TDELTA, hsmp_msg_resp32_show, 0444);
+HSMP_DEV_ATTR_RW_X8(apb_disable, HSMP_SET_DF_PSTATE, HSMP_SET_DF_PSTATE,
+		    hsmp_apb_disable_show, hsmp_apb_disable_store, 0644);
+HSMP_DEV_ATTR_RW_X8(dfc_enable, HSMP_DFC_ENABLE_CTRL, HSMP_DFC_ENABLE_CTRL,
+		    hsmp_dfc_enable_show, hsmp_dfc_enable_store, 0644);
+HSMP_DEV_ATTR_RW_X8(pc6_enable, HSMP_PC6_ENABLE, HSMP_PC6_ENABLE,
+		    hsmp_pc6_enable_show, hsmp_pc6_enable_store, 0644);
+HSMP_DEV_ATTR_RW_X8(cc6_enable, HSMP_CC6_ENABLE, HSMP_CC6_ENABLE,
+		    hsmp_cc6_enable_show, hsmp_cc6_enable_store, 0644);
+HSMP_DEV_ATTR_RW_X8(rail_iso_freq_policy, HSMP_CPU_RAIL_ISO_FREQ_POLICY,
+		    HSMP_CPU_RAIL_ISO_FREQ_POLICY,
+		    hsmp_rail_iso_freq_policy_show,
+		    hsmp_rail_iso_freq_policy_store, 0644);
+
 #define HSMP_DEV_ATTR_LIST(_name, _sock_ind)				       \
 static struct attribute _name[] = {					       \
 	&hattr_c0_residency_input##_sock_ind.dattr.attr,		       \
@@ -370,7 +404,17 @@ static struct attribute _name[] = {					       \
 	&hattr_clk_fmax##_sock_ind.dattr.attr,				       \
 	&hattr_clk_fmin##_sock_ind.dattr.attr,				       \
 	&hattr_pwr_current_active_freq_limit##_sock_ind.dattr.attr,	       \
-	&hattr_pwr_current_active_freq_limit_source##_sock_ind.dattr.attr,   \
+	&hattr_pwr_current_active_freq_limit_source##_sock_ind.dattr.attr,     \
+	&hattr_socket_power_limit_max##_sock_ind.dattr.attr,		       \
+	&hattr_socket_power_limit##_sock_ind.dattr.attr,		       \
+	&hattr_socket_power##_sock_ind.dattr.attr,			       \
+	&hattr_cclk_boost_limit##_sock_ind.dattr.attr,		       \
+	&hattr_tdelta##_sock_ind.dattr.attr,				       \
+	&hattr_apb_disable##_sock_ind.dattr.attr,			       \
+	&hattr_cc6_enable##_sock_ind.dattr.attr,			       \
+	&hattr_rail_iso_freq_policy##_sock_ind.dattr.attr,		       \
+	&hattr_pc6_enable##_sock_ind.dattr.attr,			       \
+	&hattr_dfc_enable##_sock_ind.dattr.attr,			       \
 	NULL								       \
 }
 
diff --git a/drivers/platform/x86/amd/hsmp/sysfs.c b/drivers/platform/x86/amd/hsmp/sysfs.c
index 871ff1638340f..3139aa367f435 100644
--- a/drivers/platform/x86/amd/hsmp/sysfs.c
+++ b/drivers/platform/x86/amd/hsmp/sysfs.c
@@ -9,6 +9,7 @@
 
 #include <linux/array_size.h>
 #include <linux/bitfield.h>
+#include <linux/bits.h>
 #include <linux/device.h>
 #include <linux/kstrtox.h>
 #include <linux/limits.h>
@@ -222,6 +223,371 @@ ssize_t hsmp_freq_limit_source_show(struct device *dev, struct device_attribute
 	return len;
 }
 
+/* DFC enable show function - reads current DF C-state enable status */
+ssize_t hsmp_dfc_enable_show(struct device *dev,
+			     struct device_attribute *attr,
+			     char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	struct hsmp_message msg = { 0 };
+	int ret;
+
+	/* Set bit 31 to indicate GET operation for HSMP_SET_GET type messages */
+	msg.msg_id = HSMP_DFC_ENABLE_CTRL;
+	msg.sock_ind = hsmp_sysfs_sock_ind(dev, hattr);
+	msg.num_args = 1;
+	msg.response_sz = 1;
+	msg.args[0] = BIT(31);  /* GET operation */
+
+	ret = hsmp_send_message(&msg);
+	if (ret)
+		return ret;
+
+	/* Return current DFC enable status (bit 0) */
+	return sysfs_emit(buf, "%u\n", msg.args[0] & 0x1);
+}
+
+/* DFC enable store function - sets DF C-state enable/disable */
+ssize_t hsmp_dfc_enable_store(struct device *dev,
+			      struct device_attribute *attr,
+			      const char *buf, size_t count)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	struct hsmp_message msg = { 0 };
+	unsigned long val;
+	int ret;
+
+	ret = kstrtoul(buf, 10, &val);
+	if (ret)
+		return ret;
+
+	/* Validate input: only 0 or 1 allowed */
+	if (val > 1)
+		return -EINVAL;
+
+	/* Clear bit 31 for SET operation, set bit 0 for enable/disable */
+	msg.msg_id = HSMP_DFC_ENABLE_CTRL;
+	msg.sock_ind = hsmp_sysfs_sock_ind(dev, hattr);
+	msg.num_args = 1;
+	msg.response_sz = 1;
+	msg.args[0] = val & 0x1;  /* SET operation with enable/disable bit */
+
+	ret = hsmp_send_message(&msg);
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+/* PC6 enable show function - reads current PC6 enable status */
+ssize_t hsmp_pc6_enable_show(struct device *dev,
+			     struct device_attribute *attr,
+			     char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	struct hsmp_message msg = { 0 };
+	int ret;
+
+	/* Set bit 31 to indicate GET operation for HSMP_SET_GET type messages */
+	msg.msg_id = HSMP_PC6_ENABLE;
+	msg.sock_ind = hsmp_sysfs_sock_ind(dev, hattr);
+	msg.num_args = 1;
+	msg.response_sz = 1;
+	msg.args[0] = BIT(31);  /* GET operation */
+
+	ret = hsmp_send_message(&msg);
+	if (ret)
+		return ret;
+
+	/* Return current PC6 enable status (bit 0) */
+	return sysfs_emit(buf, "%u\n", msg.args[0] & 0x1);
+}
+
+/* PC6 enable store function - sets PC6 enable/disable */
+ssize_t hsmp_pc6_enable_store(struct device *dev,
+			      struct device_attribute *attr,
+			      const char *buf, size_t count)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	struct hsmp_message msg = { 0 };
+	unsigned long val;
+	int ret;
+
+	ret = kstrtoul(buf, 10, &val);
+	if (ret)
+		return ret;
+
+	/* Validate input: only 0 or 1 allowed */
+	if (val > 1)
+		return -EINVAL;
+
+	/* Clear bit 31 for SET operation, set bit 0 for enable/disable */
+	msg.msg_id = HSMP_PC6_ENABLE;
+	msg.sock_ind = hsmp_sysfs_sock_ind(dev, hattr);
+	msg.num_args = 1;
+	msg.response_sz = 1;
+	msg.args[0] = val & 0x1;  /* SET operation with enable/disable bit */
+
+	ret = hsmp_send_message(&msg);
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+/* CC6 enable show function - reads current CC6 enable status */
+ssize_t hsmp_cc6_enable_show(struct device *dev,
+			     struct device_attribute *attr,
+			     char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	struct hsmp_message msg = { 0 };
+	int ret;
+
+	/* Set bit 31 to indicate GET operation for HSMP_SET_GET type messages */
+	msg.msg_id = HSMP_CC6_ENABLE;
+	msg.sock_ind = hsmp_sysfs_sock_ind(dev, hattr);
+	msg.num_args = 1;
+	msg.response_sz = 1;
+	msg.args[0] = BIT(31);  /* GET operation */
+
+	ret = hsmp_send_message(&msg);
+	if (ret)
+		return ret;
+
+	/* Return current CC6 enable status (bit 0) */
+	return sysfs_emit(buf, "%u\n", msg.args[0] & 0x1);
+}
+
+/* CC6 enable store function - sets CC6 enable/disable */
+ssize_t hsmp_cc6_enable_store(struct device *dev,
+			      struct device_attribute *attr,
+			      const char *buf, size_t count)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	struct hsmp_message msg = { 0 };
+	unsigned long val;
+	int ret;
+
+	ret = kstrtoul(buf, 10, &val);
+	if (ret)
+		return ret;
+
+	/* Validate input: only 0 or 1 allowed */
+	if (val > 1)
+		return -EINVAL;
+
+	/* Clear bit 31 for SET operation, set bit 0 for enable/disable */
+	msg.msg_id = HSMP_CC6_ENABLE;
+	msg.sock_ind = hsmp_sysfs_sock_ind(dev, hattr);
+	msg.num_args = 1;
+	msg.response_sz = 1;
+	msg.args[0] = val & 0x1;  /* SET operation with enable/disable bit */
+
+	ret = hsmp_send_message(&msg);
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+/* Rail ISO frequency policy show function - reads current rail isolation frequency policy */
+ssize_t hsmp_rail_iso_freq_policy_show(struct device *dev,
+				       struct device_attribute *attr,
+				       char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	struct hsmp_message msg = { 0 };
+	int ret;
+
+	/* Set bit 31 to indicate GET operation for HSMP_SET_GET type messages */
+	msg.msg_id = HSMP_CPU_RAIL_ISO_FREQ_POLICY;
+	msg.sock_ind = hsmp_sysfs_sock_ind(dev, hattr);
+	msg.num_args = 1;
+	msg.response_sz = 1;
+	msg.args[0] = BIT(31);  /* GET operation */
+
+	ret = hsmp_send_message(&msg);
+	if (ret)
+		return ret;
+
+	/* Return current rail ISO frequency policy status (bit 0) */
+	return sysfs_emit(buf, "%u\n", msg.args[0] & 0x1);
+}
+
+/* Rail ISO frequency policy store function - sets rail isolation frequency policy */
+ssize_t hsmp_rail_iso_freq_policy_store(struct device *dev,
+					struct device_attribute *attr,
+					const char *buf, size_t count)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	struct hsmp_message msg = { 0 };
+	unsigned long val;
+	int ret;
+
+	ret = kstrtoul(buf, 10, &val);
+	if (ret)
+		return ret;
+
+	/* Validate input: only 0 or 1 allowed */
+	if (val > 1)
+		return -EINVAL;
+
+	/* Clear bit 31 for SET operation, set bit 0 for policy value */
+	msg.msg_id = HSMP_CPU_RAIL_ISO_FREQ_POLICY;
+	msg.sock_ind = hsmp_sysfs_sock_ind(dev, hattr);
+	msg.num_args = 1;
+	msg.response_sz = 1;
+	msg.args[0] = val & 0x1;  /* SET operation with policy bit */
+
+	ret = hsmp_send_message(&msg);
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+ssize_t hsmp_cclk_boost_limit_store(struct device *dev,
+				       struct device_attribute *attr,
+				       const char *buf, size_t count)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	struct hsmp_message msg = { 0 };
+	unsigned long val;
+	int ret;
+
+	ret = kstrtoul(buf, 10, &val);
+	if (ret)
+		return ret;
+
+	/* Validate input: boost limit should be reasonable (100 MHz to 10000 MHz) */
+	if (val < 100 || val > 10000)
+		return -EINVAL;
+
+	/* Set socket boost limit using HSMP_SET_BOOST_LIMIT_SOCKET */
+	msg.msg_id = HSMP_SET_BOOST_LIMIT_SOCKET;
+	msg.sock_ind = hsmp_sysfs_sock_ind(dev, hattr);
+	msg.num_args = 1;
+	msg.response_sz = 0;
+	msg.args[0] = val;  /* boost limit value in MHz */
+
+	ret = hsmp_send_message(&msg);
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+/* APB disable show function - reads current APB enable/disable status */
+ssize_t hsmp_apb_disable_show(struct device *dev,
+			      struct device_attribute *attr,
+			      char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	struct hsmp_message msg = { 0 };
+	int ret;
+
+	/* Set bit 31 to indicate GET operation for HSMP_SET_GET type messages */
+	msg.msg_id = HSMP_SET_DF_PSTATE;
+	msg.sock_ind = hsmp_sysfs_sock_ind(dev, hattr);
+	msg.num_args = 1;
+	msg.response_sz = 1;
+	msg.args[0] = BIT(31);  /* GET operation */
+
+	ret = hsmp_send_message(&msg);
+	if (ret)
+		return ret;
+
+	/* Return current APB disable status (bit 8, inverted for disable semantics) */
+	return sysfs_emit(buf, "%u\n", !(msg.args[0] & BIT(8)) ? 1 : 0);
+}
+
+/* APB disable store function - sets APB enable/disable */
+ssize_t hsmp_apb_disable_store(struct device *dev,
+			       struct device_attribute *attr,
+			       const char *buf, size_t count)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	struct hsmp_message msg = { 0 };
+	unsigned long val;
+	int ret;
+
+	ret = kstrtoul(buf, 10, &val);
+	if (ret)
+		return ret;
+
+	/* Validate input: only 0 or 1 allowed */
+	if (val > 1)
+		return -EINVAL;
+
+	/* Clear bit 31 for SET operation, invert value for disable semantics */
+	msg.msg_id = HSMP_SET_DF_PSTATE;
+	msg.sock_ind = hsmp_sysfs_sock_ind(dev, hattr);
+	msg.num_args = 1;
+	msg.response_sz = 1;
+	/* Set bit 8 for APB enable (1=disabled becomes 0=enabled in bit 8) */
+	msg.args[0] = val ? 0 : BIT(8);  /* SET operation with inverted enable bit */
+
+	ret = hsmp_send_message(&msg);
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+ssize_t hsmp_socket_power_limit_show(struct device *dev,
+				     struct device_attribute *attr,
+				     char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	struct hsmp_message msg = { 0 };
+	int ret;
+
+	/* Use HSMP_GET_SOCKET_POWER_LIMIT to read current power limit */
+	msg.msg_id = HSMP_GET_SOCKET_POWER_LIMIT;
+	msg.sock_ind = hsmp_sysfs_sock_ind(dev, hattr);
+	msg.num_args = 0;
+	msg.response_sz = 1;
+
+	ret = hsmp_send_message(&msg);
+	if (ret)
+		return ret;
+
+	/* Return power limit in mWatts */
+	return sysfs_emit(buf, "%u\n", msg.args[0]);
+}
+
+ssize_t hsmp_socket_power_limit_store(struct device *dev,
+				      struct device_attribute *attr,
+				      const char *buf, size_t count)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	struct hsmp_message msg = { 0 };
+	unsigned long val;
+	int ret;
+
+	ret = kstrtoul(buf, 10, &val);
+	if (ret)
+		return ret;
+
+	/* Validate input: power limit should be reasonable (1W to 1000W in mWatts) */
+	if (val < 1000 || val > 1000000)
+		return -EINVAL;
+
+	/* Set socket power limit using HSMP_SET_SOCKET_POWER_LIMIT */
+	msg.msg_id = HSMP_SET_SOCKET_POWER_LIMIT;
+	msg.sock_ind = hsmp_sysfs_sock_ind(dev, hattr);
+	msg.num_args = 1;
+	msg.response_sz = 0;
+	msg.args[0] = val;  /* power limit value in mWatts */
+
+	ret = hsmp_send_message(&msg);
+	if (ret)
+		return ret;
+
+	return count;
+}
+
 static ssize_t boost_limit_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
 {
 	struct hsmp_cpu_info *cpu_info = NULL;
diff --git a/drivers/platform/x86/amd/hsmp/sysfs.h b/drivers/platform/x86/amd/hsmp/sysfs.h
index ded0a1edf2505..d25225c3160ce 100644
--- a/drivers/platform/x86/amd/hsmp/sysfs.h
+++ b/drivers/platform/x86/amd/hsmp/sysfs.h
@@ -75,6 +75,36 @@ ssize_t hsmp_freq_limit_show(struct device *dev, struct device_attribute *attr,
 ssize_t hsmp_freq_limit_source_show(struct device *dev, struct device_attribute *attr,
 				    char *buf);
 
+ssize_t hsmp_dfc_enable_show(struct device *dev, struct device_attribute *attr,
+			     char *buf);
+ssize_t hsmp_dfc_enable_store(struct device *dev, struct device_attribute *attr,
+			      const char *buf, size_t count);
+ssize_t hsmp_pc6_enable_show(struct device *dev, struct device_attribute *attr,
+			     char *buf);
+ssize_t hsmp_pc6_enable_store(struct device *dev, struct device_attribute *attr,
+			      const char *buf, size_t count);
+ssize_t hsmp_cc6_enable_show(struct device *dev, struct device_attribute *attr,
+			     char *buf);
+ssize_t hsmp_cc6_enable_store(struct device *dev, struct device_attribute *attr,
+			      const char *buf, size_t count);
+ssize_t hsmp_rail_iso_freq_policy_show(struct device *dev,
+				       struct device_attribute *attr, char *buf);
+ssize_t hsmp_rail_iso_freq_policy_store(struct device *dev,
+					struct device_attribute *attr,
+					const char *buf, size_t count);
+ssize_t hsmp_cclk_boost_limit_store(struct device *dev,
+				       struct device_attribute *attr,
+				       const char *buf, size_t count);
+ssize_t hsmp_apb_disable_show(struct device *dev, struct device_attribute *attr,
+			      char *buf);
+ssize_t hsmp_apb_disable_store(struct device *dev, struct device_attribute *attr,
+			       const char *buf, size_t count);
+ssize_t hsmp_socket_power_limit_show(struct device *dev,
+				     struct device_attribute *attr, char *buf);
+ssize_t hsmp_socket_power_limit_store(struct device *dev,
+				      struct device_attribute *attr,
+				      const char *buf, size_t count);
+
 void hsmp_create_per_cpu_kobjects(struct device *dev, struct kobject *cpu_parent,
 				  struct hsmp_socket *sock);
 void hsmp_remove_per_cpu_kobjects(struct hsmp_socket *sock);
-- 
2.34.1

