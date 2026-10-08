Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012050.outbound.protection.outlook.com [40.93.195.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80CA9481AAD
	for <platform-driver-x86@vger.kernel.org>; Thu,  8 Oct 2026 09:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791451837; cv=fail; b=mtI436iA4P4vNpVNyWfn8VHxSbMkesvmV6obbyd8ro1HIAGh4KtER52ncO1FhdIY/WJ8YgGFziLFiF6F3A2ti05VXkEEoXUV3lW0BkSUOGfWd+cEJOLONKM9ns1YtrpLd73+MKqwDUR3bZw9quYcWU78hLZ43ZNY5sXx8IMtKow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791451837; c=relaxed/simple;
	bh=vDC+Nj0VVpaSKmKxwe6XT2oiLs0kf14sxvToCrDaofY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zi39oYmuUmQ+6md4F0lsVoTj9kVWzTyNAasHjoRZxtgeY1E42QOgRrFWsAJErrEc6ya9Q78qHmoxT7X/8Pqu6wgo7eF/XEGWjusA2sdoUI0Zmy+8noAd2wEfzWcSTVJ+qzp2mTDWvvfD3nSn1mhz7yWd1AKdbau6aSvWnUeChNE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=OBMoQfQF; arc=fail smtp.client-ip=40.93.195.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="OBMoQfQF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DsD8fm6XQdhES2Jug+tm03B2KHe094JxU6sxafT+dDgnK97aE8DIwd5jkYoKGdNMDnDWk9k09gUts3sHZH4eobK/p12Gs4L/sS5L8vFVUe479VAMIhNcqtVpISMQlexPiUZFI8dEQ2yKiHtDXl2aj0hPfX0C25NIiiESC1zmd8KmUDOtHcWbJAKsTox233C4IHS42A7H/JYrOubGKabRjIeN56w9LVTKTo9dQoTiC+Jw9hyTL7Rsd370uz04mwJZVN9SdlgiF5vqxXn+K5KUhBemVyougAZ/Ip2ASuZhxtTb1qGTfWkkQzR72APSd7MVl+J1ighVMCUpJ438xhXGBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EYxSjQtd17Zea0WJ4ovnBc8OkCecT6CmajmDWAo3QVk=;
 b=cRU1ZFfAZFPLMZ/sEtKnXHGHE3rpw9SDAeN0SkPHQoucg24XylXffUxmVEa00cWX5zX+nLsgURHZJxn1LrIZoYOScY9MQUWWVWp+UdsAo7g27oH9Rqbs9TUMqakMpxrgu+9wqmeLfNc5pzWpWW0IX2Uf+LjnDQqcuF6qBtjHVTDFoBtbTuaFohuKB1RfGO9bknZomddoa/TH8MXYgkSUorQ0lwqGbaiwZcPSOigCXQe/AlvB0adrUJUs2C/JJ7S0SP9fEFJm+Fn1LhMduCZD3GigKVfLl2W+uR5G7c9LUllR5Nxm6IvmytSSEaolp7jXRSVlGBH6XBK9z3CpOKBp+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EYxSjQtd17Zea0WJ4ovnBc8OkCecT6CmajmDWAo3QVk=;
 b=OBMoQfQFBhQODdoOdrZtMRsqSDrDnyto85dKS2HtPCno/OApx0GPHb+g0RE2C/P+DfLFsa1K5SX+AJ3fOx1mrxIKBtUdTzoS2vxmear4Gpx8LRYGzDKbE1glHBi8HtbSF9nCcaXER4NFsDcJFxaIBQX9Stwlxjg9H7jMDANsp/Y=
Received: from BN9PR03CA0720.namprd03.prod.outlook.com (2603:10b6:408:ef::35)
 by IA0PPFDC28CEE69.namprd12.prod.outlook.com (2603:10b6:20f:fc04::be8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Thu, 8 Oct
 2026 09:30:28 +0000
Received: from BN1PEPF0001806E.namprd04.prod.outlook.com
 (2603:10b6:408:ef:cafe::4) by BN9PR03CA0720.outlook.office365.com
 (2603:10b6:408:ef::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Thu, 8
 Oct 2026 09:30:27 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF0001806E.mail.protection.outlook.com (10.167.245.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Thu, 8 Oct 2026 09:30:27 +0000
Received: from trento15c5.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 8 Oct
 2026 04:30:21 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>,
	<muthusamy.ramalingam@amd.com>, <NaveenKrishna.Chatradhi@amd.com>, Suma Hegde
	<Suma.Hegde@amd.com>, Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
Subject: [PATCH 10/11] platform/x86/amd/hsmp: Relocate to_hsmp_sys_attr() macro
Date: Thu, 8 Oct 2026 09:29:38 +0000
Message-ID: <f772128da0d283432d124e0c30e3b06914f5239e.1791446401.git.Suma.Hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1791446401.git.Suma.Hegde@amd.com>
References: <cover.1791446401.git.Suma.Hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF0001806E:EE_|IA0PPFDC28CEE69:EE_
X-MS-Office365-Filtering-Correlation-Id: 4715dd31-ff52-4388-c914-08df251eca13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|23010399003|82310400026|56012099006|11063799006|18002099003|10067099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	5BZbTr3al5aVH/+tv4LuJu2sDJTreTLuTitj/CbgwnXNFwbjxz+Fkzkuh9nr3XQ5lLCgS6kEpghYqAPuDVfUIFGHq1W6xKO2CIqF9KNTlBiSnS4RwARi4Ju749XcxaEHhRDVPg2+DATtB+W7CE8edQ5yaBnPQRc+LsXIjKiIX1PQg09xbRJLLUh7EXZiZe5q8+ix8yBn5L4DUHfoxtuMlivV0uPW6kc0nTvhnIPwhivlknTZZn1yZ43I8zjEFZXXeNUgr5HiiwjXHa6P/mWpsbyXcc78pS8WlpuYljf1Tfuj0gB0Qa9JsFATBHh2ZmORzFw08q8ESGGwfhW7qsTINShmJqyyNOWOgP4uEv+OYlSUtvwriqXqNKWe6ZXiNigajC+E/vVr4ZSjonHm1ze493nqhoN0k/HoXr8JZJYb/WpCo+9ya7TNgf08YBxIUAOl7Uc3AZUloxnjwgBno3sjNEZStfEL/B1mURpMEHFFibHSsWKXwFoMrvy1SvyYEbmGnizTNXjyqklaz5Qvc9SAJxzDjzl9DT9iOEIaLKrFCKT41fKunsYHFdb5QPon5+fydEQklZBH3h5+MN1w7JN7uGoHTp4ORiSTpnTM6ydxpvNY0txfiddQ5AjmghfHLpGdAffp2I+S6q+AY8aXfj8KOqWDDaN2jm8dJGUorvirTt8ods197xdg/zlNuvojUeeXOaTo40xIRPCBPbb6H8haYQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(23010399003)(82310400026)(56012099006)(11063799006)(18002099003)(10067099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	y7lvfUP/9IKB3ZQ48LQhGLyVZidpvAjTy2WxIXA5KIYawJjGMp1FVcrgKcDeOk9nPpZnGSJe+zEsFybhRIkEs9BYJunPjpCrcdNWjjMAS3uSTp+YtH5mH5IfrkXM9nDeKtnebeGfIPtuiscOJX/uqCZtCgS6n/FKMNRbedAzLRXbm1shHRw8RiY7IHPHosl8ZVtOZt46FN4IELoPa/V+jPjPmwomDL/XsRNdxU5PUdI3+BjGa21cVUFSzc/kFA/ZH/urNIMaAnNnjutc+vffWN+yX1MKr6WbnyR68lFn4/xVuBcUXIwkA4kAqARam5B6Wp0htBA7O8kp+CFGa5l5Mf5jFY3Q4LJ66uFLn5ZxPaoPECi4MqhwyspPaGZsyx+QrWoPDYxL1VJUzznzauam7SS3nBKsaqt/Q0Z7I8MWlxA/7MOy8esfCLPlv9QkBs7o
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 09:30:27.9016
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4715dd31-ff52-4388-c914-08df251eca13
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0001806E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFDC28CEE69

From: Suma Hegde <Suma.Hegde@amd.com>

Move the to_hsmp_sys_attr() macro definition above
hsmp_is_sock_attr_visible() so it is available before its first use
in a subsequent patch that adds bitmap based visibility checks.

Co-developed-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
Signed-off-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
Signed-off-by: Suma Hegde <Suma.Hegde@amd.com>
---
 drivers/platform/x86/amd/hsmp/acpi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 0d3b324fe2244..3ea35d8936f8d 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -292,6 +292,8 @@ static ssize_t hsmp_metric_tbl_acpi_read(struct file *filp, struct kobject *kobj
 	return hsmp_metric_tbl_read(sock, buf, count);
 }
 
+#define to_hsmp_sys_attr(_attr) container_of(_attr, struct hsmp_sys_attr, dattr)
+
 static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
 					 const struct bin_attribute *battr, int id)
 {
@@ -334,8 +336,6 @@ static umode_t hsmp_is_sock_dev_attr_visible(struct kobject *kobj,
 	return attr->mode;
 }
 
-#define to_hsmp_sys_attr(_attr) container_of(_attr, struct hsmp_sys_attr, dattr)
-
 static ssize_t hsmp_msg_resp32_show(struct device *dev, struct device_attribute *attr,
 				    char *buf)
 {
-- 
2.34.1

