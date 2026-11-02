Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.38
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793604058;
	b=TzVHpJZSWTMKjVt/LKh8ABIvj7pgEMba243zNfu4XSRCMedbM44ZyzKZDJLp0mu/ziPo
	 nSxlIr7PdzLQBJriD2jOV8vHdyNxPTS1Qkq/RWubIFgP3DzBa8CKoXj6aX40feD0pC71H
	 9mADY4VOK+u7O04eQUdehphneuOYwztzY5sUU/Fnu8by5mUGOs1GBxeclVugtZvht7fZk
	 HSVMGk/KAb0WgDvbEqMcsCe7G47vhSN7JckPp5UlKKEXAJt2LDFLAm/TD09sextSot1ya
	 c4o7ORkRa6TvVyMZuvvzP5yRCbUZ3jOKQvcmADYXI3/e9tGi2UEAdZ1z58n2DNfPwHw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793604058;
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
	bh=hR711wHstMG3nK8pvRrYxBJTDjvnIoBf8QcF6J8QwHs=;
	b=uAUgvNDIvsyxNWlEdpQQpxv9InmuErSlTjB4FihGw2bJOqxj0gNiU/abOVUcMotj+Qtg
	 owCtFyur89JZ6e7ATQp1QCLbKFpfOK1gOHVbhQJkFnoLyy8MtLVlrwn+KHHvzQ6adRvrG
	 t/9et333+gqcjtQvqso+zISV+lfdJHrJsUC+Y226AigulNdrofBY4YT/p8HD2EMtgGcaV
	 ezkJMJJ58OXpDmdTMCKNRp8b7I0JOuKlT2eAL0ZJl/5+duPSi757hQd8uScpOZxU+zWIg
	 XLtwyL0T1wySh75Ecml5o0+h6ITCCfZqMPpt16jeAQGXlE9Tlssh4vJZA/5ccaUydBw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=dsqYRNpV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.38
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010038.outbound.protection.outlook.com [52.101.56.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5E5606A324
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Nov 2026 07:20:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE5E5606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=dsqYRNpV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FWuV7nCWDT59MJYvRxy/cgFKQMmfHO1MlvBW/AfOVkyNlBbTbedSGUmUotkrLySl01uXaFyEBDB4FsEYRilh+uy1tQOOuPNWrdFMp6KUFkToazaL6pogmuogdgY/JIC1ZKG4oupKV4gObdoB00W8RoY8pmShFgSmEA/yV1aGerIN+Kk1hwHhjeuimGC+Im/yubGQzG/nltCrn6Y167HO6Kr2hbyQqKFg1ou8UVS/PuYwicrdChYqWnq53Ol8di0FQr/eyUxAOY1jmqNxnPYDXtmQ6kVAU4yrst60Uh9wz7pn+U7sSalKMp9khauwMzD/rasHzC4TaMzyg3bJP5amjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hR711wHstMG3nK8pvRrYxBJTDjvnIoBf8QcF6J8QwHs=;
 b=Wf1sKRS4ipl/wRCaN1gE/FfdHhR0V9kcc6UJlgiLmCyuuaSJukuALrJ2vAHqYgdzM7NJKpvMApYPj/cIqAvdP2EhSRFODDtJHUnHOw3RNKpC5BLaRNZgUSMTZFNsZBBD6zew/5ryNSHK928+FV9m2JrSNOpM58IZH6iU/MxecFHdMltyf2hgJpzpNyE/Lwe9MX7LkdNa1M31x3boeZzf0C0l2Q0E3SqpCk0hq2j5f5Hr9qyFiR7/SqNAFQf+UGVweN8Lbo4Ah5k9wWKeLdaI+yPyAuGWQ4CyGEXouHTleiwgdu9a0htTEw3t32BfN4Spe7lurRA03X7tY7z733WdgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hR711wHstMG3nK8pvRrYxBJTDjvnIoBf8QcF6J8QwHs=;
 b=dsqYRNpV1QcvpYNftFtaU0BweCWj0vpAeCd+JJbaXn8LOS6/INfsJZNTBrxb26qCJQ5WED4C1wZc9hEUv5KcsJ3KFSArrgLsnkXrF9qr7idnOhxHjd5t2RCl69Hsy/wMjajrINFfdtRhAjz2C0EG8HKsuOKijQqMTuaWFf7HPUw=
Received: from SJ0PR05CA0151.namprd05.prod.outlook.com (2603:10b6:a03:339::6)
 by DS2PR12MB9615.namprd12.prod.outlook.com (2603:10b6:8:275::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 07:20:53 +0000
Received: from SJ1PEPF000037A7.namprd04.prod.outlook.com
 (2603:10b6:a03:339:cafe::17) by SJ0PR05CA0151.outlook.office365.com
 (2603:10b6:a03:339::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5 via Frontend Transport; Mon, 2
 Nov 2026 07:20:53 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000037A7.mail.protection.outlook.com (10.167.244.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 07:20:53 +0000
Received: from trento15c5.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 2 Nov
 2026 01:20:50 -0600
From: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <Suma.Hegde@amd.com>,
	<NaveenKrishna.Chatradhi@amd.com>, Muthusamy Ramalingam
	<Muthusamy.Ramalingam@amd.com>
Subject: [PATCH 19/26] platform/x86/amd/hsmp: Add cclk_floor_limit sysfs file
Date: Mon, 2 Nov 2026 07:19:17 +0000
Message-ID: <48c77463a94a754dc700365f617f79ccbdf5f5fb.1793602633.git.Muthusamy.Ramalingam@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A7:EE_|DS2PR12MB9615:EE_
X-MS-Office365-Filtering-Correlation-Id: ae988334-c04d-429d-5706-08df38b1d43e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|23010399003|6133799003|10067099003|18002099003|22082099003|56012099006|11063799006|261021123027099003|261021121427099003|261022105027099003|261026121527099003|261026140227099003|261009223027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	B9kYLDlUjtdRL3+IjZcdK7K1nnBd1KVNaBQMl0W42sxUikdfCsoSCYxnWM5qaeGB4KIdi9lBIzS1lj9jsgk9r+lLekVa3Ty0XhwmaobtNymvJjrnkKFSdsmwQXdZzIw2CxIjU2c04xRjDCOmQaCykNTmR1HIv8pd7XZ3WkJNKASG4SIP8Xq4goIMEhfFXbbij8/B6zdZmis6Juc3ZP6rZhjPiwDG8t/m/66RdkTdg1hGT1pyZzKJUm5jZEk1wMv00B/0iY2lZ5L9H7Jy3VMCzCn6kRCv0mQUo3/SyNhpFkbIDD2xcK8OjCjjc7aNBFoy2mtkjAG8bFOem5zGpY8L5XwinhEC+K03aF0sU8gyH8XjYuvwJCxUrI1KkVG/AntcWFswgfBIeYc8GMuqU0Wlxf9GraaC7hoXmnXLe7qMz2HuuPD96tubskMvs2S1L0v57gwHCFww5ArnZ+kJrOuWQQbvhNuqsjJwVr/v1A0jqQY2pXIUfngN8FNTzawKRsEnAd0BlBR/wYT7iKQT7fAlaQa81e4g7Dc5xNd2hP8Or5pZuS/V/X+uHjldg783ApDoXSTv9rfHaY8bF6YFALAJLmebKuMJYcgG0kKJD12oiTl8Oub/JK8P9OUqoqfnK13yI+I6N/iP15VWDzjVAJNQluGej1Eu1hzJN+qLftUb2YABbGfIA/Fkyu6ItifAacv0UTD9Slb0M14Dz5ILXMspHw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(23010399003)(6133799003)(10067099003)(18002099003)(22082099003)(56012099006)(11063799006)(261021123027099003)(261021121427099003)(261022105027099003)(261026121527099003)(261026140227099003)(261009223027099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TJlO08fXp/kXyjicgBwKdXVZTJYK+G5Xyhy/7w8B9WlgQ5Vs6daAqJwnJQhe6jsfWHJspVPHev22s/hu9IMxyDbnoIiL1J7DIeg3eXiOZLFroADCS+OjAsCrF12qt8fTanGl9GbQaC/9zzNIXJXNTuhuELa1z3qKndKkpg4h4SLozW/UAJ5W6mbeDjTBgWsV3Se/qghxJFZiI9nKaIqrHLt7zJ2CP14YqXSSjetBODUO8+CmTxaQ59SeZtwNHLx7UW1S+FyFTf1o/7RaBW9OhpGRrmZUJNhMJCbtT/dJZgb9jWpUedAkJUo7DG0ryLvBtkIBQ2nFJz/FTQfh/6E43MYscDVuUM1e2zGRtkgOI2bCeIayE0aW186nLleNDgYb7IV3mBl1Z2W9fBlkJhY6FRX5qKODFCNN1/ju4xMuLbkqTuz0vIpLmMDQFLumbXBq
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 07:20:53.0090
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae988334-c04d-429d-5706-08df38b1d43e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037A7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9615

Expose HSMP_SET_GET_FLOOR_LIMIT as a write-only socket file on both the
ACPI and platform drivers. A write uses operation 01 and sets the floor
for every core on the socket. The frequency is a 16-bit MHz field.

Co-developed-by: Suma Hegde <Suma.Hegde@amd.com>
Signed-off-by: Suma Hegde <Suma.Hegde@amd.com>
Signed-off-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
---
 Documentation/arch/x86/amd_hsmp.rst   |  2 ++
 drivers/platform/x86/amd/hsmp/acpi.c  |  3 ++
 drivers/platform/x86/amd/hsmp/plat.c  |  3 ++
 drivers/platform/x86/amd/hsmp/sysfs.c | 47 +++++++++++++++++++++++++--
 drivers/platform/x86/amd/hsmp/sysfs.h |  3 ++
 5 files changed, 56 insertions(+), 2 deletions(-)

diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
index 093468aa52eb2..30401c168c503 100644
--- a/Documentation/arch/x86/amd_hsmp.rst
+++ b/Documentation/arch/x86/amd_hsmp.rst
@@ -189,6 +189,8 @@ write-only when the platform enables only that direction of the message.
 * socket_power_limit_max: Maximum socket power limit in mWatts (read only).
 * cclk_boost_limit: Socket boost limit in MHz (write only). Accepted range
   is 100-10000 MHz.
+* cclk_floor_limit: Socket floor limit in MHz (write only). A write sets
+  the floor for every core on the socket. It is a 16-bit value.
 * tdelta: Socket thermal behaviour (read only).
 * apb_disable: Read/write. 1 disables APB, 0 enables it.
 * dfc_enable: Read/write DF C-state enable. 1 enables, 0 disables.
diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 935cca42b642b..35c2085b67e42 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -666,6 +666,8 @@ HSMP_SYS_ATTR(svi3_max_temperature, svi3_max_temperature, 0444,
 	      HSMP_GET_SVI3_VR_CTRL_TEMP, HSMP_GET_SVI3_VR_CTRL_TEMP);
 HSMP_DEV_ATTR_W(cclk_boost_limit, HSMP_SET_BOOST_LIMIT_SOCKET,
 		hsmp_cclk_boost_limit_store, 0200);
+HSMP_DEV_ATTR_W(cclk_floor_limit, HSMP_SET_GET_FLOOR_LIMIT,
+		hsmp_cclk_floor_limit_store, 0200);
 HSMP_DEV_ATTR_RW(apb_disable, HSMP_SET_DF_PSTATE, HSMP_SET_DF_PSTATE,
 		 hsmp_apb_disable_show, hsmp_apb_disable_store, 0644);
 HSMP_DEV_ATTR_RW(dfc_enable, HSMP_DFC_ENABLE_CTRL, HSMP_DFC_ENABLE_CTRL,
@@ -832,6 +834,7 @@ static struct attribute *hsmp_dev_attr_list[] = {
 	&hattr_dimm_sb_set.dattr.attr,
 	&hattr_socket_power.dattr.attr,
 	&hattr_cclk_boost_limit.dattr.attr,
+	&hattr_cclk_floor_limit.dattr.attr,
 	&hattr_tdelta.dattr.attr,
 	&hattr_apb_disable.dattr.attr,
 	&hattr_cc6_enable.dattr.attr,
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index 2c6d460c56d3a..aedc71027b28c 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -1862,6 +1862,8 @@ HSMP_DEV_ATTR_X8(socket_power, HSMP_GET_SOCKET_POWER, hsmp_msg_resp32_show,
 		 0444);
 HSMP_DEV_ATTR_W_X8(cclk_boost_limit, HSMP_SET_BOOST_LIMIT_SOCKET,
 		   hsmp_cclk_boost_limit_store, 0200);
+HSMP_DEV_ATTR_W_X8(cclk_floor_limit, HSMP_SET_GET_FLOOR_LIMIT,
+		   hsmp_cclk_floor_limit_store, 0200);
 HSMP_DEV_ATTR_X8(tdelta, HSMP_READ_TDELTA, hsmp_msg_resp32_show, 0444);
 HSMP_DEV_ATTR_RW_X8(apb_disable, HSMP_SET_DF_PSTATE, HSMP_SET_DF_PSTATE,
 		    hsmp_apb_disable_show, hsmp_apb_disable_store, 0644);
@@ -1906,6 +1908,7 @@ static struct attribute _name[] = {					       \
 	&hattr_dimm_sb_set##_sock_ind.dattr.attr,			       \
 	&hattr_socket_power##_sock_ind.dattr.attr,			       \
 	&hattr_cclk_boost_limit##_sock_ind.dattr.attr,		       \
+	&hattr_cclk_floor_limit##_sock_ind.dattr.attr,		       \
 	&hattr_tdelta##_sock_ind.dattr.attr,				       \
 	&hattr_apb_disable##_sock_ind.dattr.attr,			       \
 	&hattr_cc6_enable##_sock_ind.dattr.attr,			       \
diff --git a/drivers/platform/x86/amd/hsmp/sysfs.c b/drivers/platform/x86/amd/hsmp/sysfs.c
index 8fe67421ef6fc..8872f63e218df 100644
--- a/drivers/platform/x86/amd/hsmp/sysfs.c
+++ b/drivers/platform/x86/amd/hsmp/sysfs.c
@@ -560,6 +560,48 @@ ssize_t hsmp_cclk_boost_limit_store(struct device *dev,
 	return count;
 }
 
+ssize_t hsmp_cclk_floor_limit_store(struct device *dev,
+				    struct device_attribute *attr,
+				    const char *buf, size_t count)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	struct hsmp_message msg = {};
+	unsigned long val;
+	int ret;
+
+	ret = kstrtoul(buf, 10, &val);
+	if (ret) {
+		hsmp_err(dev, "cclk_floor_limit", HSMP_ERR_PARSE, "unit=MHz");
+		return ret;
+	}
+
+	/*
+	 * Op 01 sets the floor for every core on the socket. The frequency
+	 * is a 16-bit MHz field. Firmware clamps it to the platform minimum
+	 * and maximum, so reject only a field overflow.
+	 */
+	if (val > U16_MAX) {
+		hsmp_err(dev, "cclk_floor_limit", HSMP_ERR_RANGE,
+			 "got=%lu valid=0-%u unit=MHz", val, U16_MAX);
+		return -EINVAL;
+	}
+
+	msg.msg_id = HSMP_SET_GET_FLOOR_LIMIT;
+	msg.sock_ind = hsmp_sysfs_sock_ind(dev, hattr);
+	msg.num_args = 1;
+	msg.response_sz = 0;
+	msg.args[0] = BIT(30) | val;
+
+	ret = hsmp_send_message(&msg);
+	if (ret) {
+		hsmp_err(dev, "cclk_floor_limit", HSMP_ERR_HW,
+			 "val=%lu unit=MHz rc=%d", val, ret);
+		return ret;
+	}
+
+	return count;
+}
+
 /* APB disable show function - reads current APB enable/disable status */
 ssize_t hsmp_apb_disable_show(struct device *dev,
 			      struct device_attribute *attr,
@@ -1909,8 +1951,9 @@ static struct hsmp_cpu_info *hsmp_cpu_from_kobj(struct kobject *kobj)
 /*
  * HSMP_SET_GET_FLOOR_LIMIT args[0]:
  * op[31:30] + apic id[27:16] + floor frequency MHz[15:0].
- * op 0 sets the per-core floor, op 2 reads it, op 3 reads the
- * effective floor. The frequency field is reserved on a get.
+ * op 0 sets the per-core floor, op 1 sets every core on the socket,
+ * op 2 reads the per-core floor, and op 3 reads the effective floor.
+ * The frequency field is reserved on a get.
  */
 static u32 hsmp_floor_arg(u32 op, u32 apic_id, u32 mhz)
 {
diff --git a/drivers/platform/x86/amd/hsmp/sysfs.h b/drivers/platform/x86/amd/hsmp/sysfs.h
index 716d9e4493a1b..8d3a9021ef18e 100644
--- a/drivers/platform/x86/amd/hsmp/sysfs.h
+++ b/drivers/platform/x86/amd/hsmp/sysfs.h
@@ -112,6 +112,9 @@ ssize_t hsmp_rail_iso_freq_policy_store(struct device *dev,
 ssize_t hsmp_cclk_boost_limit_store(struct device *dev,
 				       struct device_attribute *attr,
 				       const char *buf, size_t count);
+ssize_t hsmp_cclk_floor_limit_store(struct device *dev,
+				    struct device_attribute *attr,
+				    const char *buf, size_t count);
 ssize_t hsmp_apb_disable_show(struct device *dev, struct device_attribute *attr,
 			      char *buf);
 ssize_t hsmp_apb_disable_store(struct device *dev, struct device_attribute *attr,
-- 
2.34.1

