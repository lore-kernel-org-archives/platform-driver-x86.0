Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011028.outbound.protection.outlook.com [52.101.52.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08D5489877
	for <platform-driver-x86@vger.kernel.org>; Thu,  8 Oct 2026 09:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791451822; cv=fail; b=tV6yPd44kfwXsMCdqyO4q7Q/w7loGshosFZvQbtEGbqjlrYnyvd/35YUb+nHYpixLk90NbLqn4I8VMXdlzIVaiKMbUS8NIBkJfFWJL2NvebdyhXLljlkpo7rWLFEYiW7VUtELZcowUcLWbGqMnL32mn6qWEsBYQBH5rRTA3yGr0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791451822; c=relaxed/simple;
	bh=7/DeBUqVxPDBhcr1IsO5j/G7ycPtEzUUEd9CNDg0Hd0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g/HL3zUB69FK233x4gLd1Txct4ZOSG2WyxlzKL/cD3IAJbnLqdhbcvstplfe0D3O6QuusaUw+yGhwNghzAYkwGoY1N1sR6PwUEzUm7LnoZSrbOgqwMUTG4kaYu3PQOz4GWFqygIKDYU7dMDDzj0MTMLqUHi1P6U9wsvYSJn7sTY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=LAdP0chZ; arc=fail smtp.client-ip=52.101.52.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="LAdP0chZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XB5Qf26t/4rnB6J8xrGUglWtw51/JwwRMv4ta5ZWzuPftxZ2brNBcO1GLOsMJ/5N8hDvvrpxxQtZ2Qco/oTBnVuzCuryCBPxZ/87eapZ2TfBUPqpAiGTF82rOE/PvO4ug1xbgb63Wltx4uK1rOSuOsxy9hbTgfUxRfHCspOUo5hapxV9A3Gq1xVTuobbiuWuJx6TDHHtG3pj/oXwdtzFbGScrZNrcOPvEXxodbQMQOuxIS+HXLssW47w3LNluwBJAjEVjWlfmGUEecgLyDsHVm4MMs+77NTumfwWqhpw77TvDjSTHh2SgHLsmKkRPBWT4CXOtNyaSRCStHZMNjEhKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zfZrjOHzYjFo6xUq+xelL/s4gXPKDAOYz7ZiMAWQrvg=;
 b=gx/51/Eg/Q+nvL+T/gEXIuK3UqFsJzITGeHKAIhrIHHz8R2lZGpjwlqlK3ovCw5k3Vq5bRnUXkUjTsGlQpuZJGJv0z0pSiCgH4vA+8TjxbAVJl9y7Mn0D664imL2wmBxwgfHg6xzFQqP/a0Xbc4sJmiXomXFc8LmFrSYNia2zdRpuZTvBU3USuz1beTFpfkDF920k6WRf4sMFKPTpxLyFTKbKK/4tCAyeVqe+sJirJROomFWGSHqKpvxNKoyQUQvnCD/Dz5hWXiLGXkiLR2UrJL1SGez248FfrvpfFqzgZ3Cbpra0nPvyd5fSM4VVupcYrW0Cu6skgDUj2VkbaeB6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zfZrjOHzYjFo6xUq+xelL/s4gXPKDAOYz7ZiMAWQrvg=;
 b=LAdP0chZ7rStLH+CHM9lY7JW4X6poDP/GC/bnoQUYyMnJkrXPybThSxetbfXQuU+J6AVWxibRpoUXB11suD9xuaCR2787Fe6Ghgq3cghyXt/zH/4TzyVysZkuC/Y1nFcxj5KXaXc/hN2EBUQcVLyzr8kWExARoBiU+ZkAWsd52Y=
Received: from BN9PR03CA0706.namprd03.prod.outlook.com (2603:10b6:408:ef::21)
 by IA0PPFB67404FBA.namprd12.prod.outlook.com (2603:10b6:20f:fc04::be2) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 09:30:10 +0000
Received: from BN1PEPF0001806E.namprd04.prod.outlook.com
 (2603:10b6:408:ef:cafe::38) by BN9PR03CA0706.outlook.office365.com
 (2603:10b6:408:ef::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Thu, 8
 Oct 2026 09:30:10 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF0001806E.mail.protection.outlook.com (10.167.245.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Thu, 8 Oct 2026 09:30:10 +0000
Received: from trento15c5.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 8 Oct
 2026 04:30:00 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>,
	<muthusamy.ramalingam@amd.com>, <NaveenKrishna.Chatradhi@amd.com>, Suma Hegde
	<Suma.Hegde@amd.com>, Dhruv Gupta <dhruv.gupta@amd.com>, Muthusamy Ramalingam
	<Muthusamy.Ramalingam@amd.com>
Subject: [PATCH 02/11] platform/x86/amd/hsmp: Move proto_ver to hsmp_socket structure
Date: Thu, 8 Oct 2026 09:29:30 +0000
Message-ID: <e9179fbd89022e80764da50d56322a4ca8662087.1791446401.git.Suma.Hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF0001806E:EE_|IA0PPFB67404FBA:EE_
X-MS-Office365-Filtering-Correlation-Id: b86329bb-edbf-4b03-2e11-08df251ebfeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|23010399003|56012099006|11063799006|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	YOueGQZ5yvFz6vBvZ3NtwNmBoJvsBK1GQdAPW+EgPFhla7nFAA/zYjgaZVVFCwqr2Vqqc2ERZkPkbsHVitc0csO0shp2usN/M5hlaxcRU2r9rjWQ2CfWRiBD7nRbP6tFmMytIk04zspg3SAYfu3kod5bFLAsQy9GzSj6Zk6eKfXc8NaGK3e2PX4kcjiGNrPyckrt/yFo6qvI3s3xnm6BSsNFX9lOw/pd0v14b0VySUNGyzunW1/gUsd836l1c7xesw/ONoO0oxSyJ0zm4ZShjG+BK98ZTOeexmfeqXPb2BspzU8ZyknJjFaXEAOzPPJ/yoQuX+KPVOGdG0teEHrPWG/C7P36GtxjWxtIpYs5KmVitlj4hf+OpTR42y+ecHug/TZxQYNF5cTZfPYITdMkuThBZMi6094su9OJimXxBbEruBk9INN+3VD001AwrOq4LOjmVEw82rDODjVDsEPD9G6VKy72JEANVj9hz7u3+FiLAGmr25gwhP0ywD9TevQgWAjQtpPGtnx1mrbqNfoqfJFkX3dDFXiLz+jwewGnMxPa1C7o94JQhWzoQYrZaK9/RpQtZNvn7C7PCmi42LUKo64S8hj7o3L558RbLZ1noSPzcLhbDBKbOOCuzFR+ZOXS+455/5/jfw3JtxGcxz5Mz6fnTd8uI9YCzsqagYOcJWMsmLO8nfdupkAjR5yxeHiM7XpTUUaZxSbum/kNU6HwiA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(23010399003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BDMB0cSiiqK6gkcRjVawGOd78+hKnHjM52vwsNiyiA6gBOjV5k2ZT9j5UX33Mo187DCgPSmk8Yc0hv5hIkX7FsLZ9F86CAa/LVJzbRNr9uYqwCymdoi9STcpFMVDTzvGTKPkjDGdcHZS+EBNLgc4bm4IptXvJ4a1qh6jHmd1xW99F3aa0MSIUh/2w+ev++KAnprOJy5KaJWnRZwQnfJzhJfKSlYX6r+u0nhqUz8y8yKjviRzWSD7CktouWcW+6/3kj2S416w8JBnaUhbBIO6CDZSiP8mKuph5taHMc2Cz5aS25kgo7tznQ0LhLmUvXDKTT9T44ZBN/gGWSqpnH3ITjO3aJmA/a3EFLObciTaQyGHcrY8jKrDZ/o0I7EVvnf1ieo9LcVuPJyAWPJ8+FkHgzNSCjvWHDXHxwUB8nRveRAygGpr88/1O5gg0on1XslJ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 09:30:10.8572
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b86329bb-edbf-4b03-2e11-08df251ebfeb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0001806E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFB67404FBA

From: Suma Hegde <Suma.Hegde@amd.com>

Move proto_ver from hsmp_plat_device to hsmp_socket, as the protocol
version is fetched per socket. Update all users to read the per-socket
proto_ver.

Signed-off-by: Dhruv Gupta <dhruv.gupta@amd.com>
Co-developed-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
Signed-off-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
Signed-off-by: Suma Hegde <Suma.Hegde@amd.com>
---
 drivers/platform/x86/amd/hsmp/acpi.c | 14 +++++++++-----
 drivers/platform/x86/amd/hsmp/hsmp.c |  2 +-
 drivers/platform/x86/amd/hsmp/hsmp.h |  2 +-
 drivers/platform/x86/amd/hsmp/plat.c |  4 ++--
 4 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index d775ea8ba6035..088c44ea1782e 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -286,7 +286,7 @@ static ssize_t hsmp_metric_tbl_acpi_read(struct file *filp, struct kobject *kobj
 	 * Surface the unsupported case here as -EOPNOTSUPP rather than
 	 * silently truncating the snapshot.
 	 */
-	if (hsmp_pdev->proto_ver != HSMP_PROTO_VER6)
+	if (sock->proto_ver != HSMP_PROTO_VER6)
 		return -EOPNOTSUPP;
 
 	return hsmp_metric_tbl_read(sock, buf, count);
@@ -303,7 +303,10 @@ static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
 	 * The client set has its own telemetry table, read only through
 	 * HSMP_IOCTL_GET_TELEMETRY_DATA; never show this file there.
 	 */
-	if (!is_client_platform() && hsmp_pdev->proto_ver >= HSMP_PROTO_VER6)
+	struct device *dev = kobj_to_dev(kobj);
+	struct hsmp_socket *sock = dev_get_drvdata(dev);
+
+	if (!is_client_platform() && sock->proto_ver >= HSMP_PROTO_VER6)
 		return battr->attr.mode;
 
 	return 0;
@@ -572,8 +575,10 @@ static int init_acpi(struct device *dev)
 		return ret;
 	}
 
-	if ((is_client_platform() && hsmp_pdev->proto_ver >= RYZEN_MASTER_PROTO_VER1) ||
-	    (!is_client_platform() && hsmp_pdev->proto_ver >= HSMP_PROTO_VER6)) {
+	if ((is_client_platform() &&
+	     hsmp_pdev->sock[sock_ind].proto_ver >= RYZEN_MASTER_PROTO_VER1) ||
+	    (!is_client_platform() &&
+	     hsmp_pdev->sock[sock_ind].proto_ver >= HSMP_PROTO_VER6)) {
 		ret = hsmp_get_tbl_dram_base(sock_ind);
 		if (ret)
 			dev_info(dev, "Failed to init metric table\n");
@@ -685,7 +690,6 @@ static void hsmp_acpi_sock_release(struct kref *kref)
 	kfree(hsmp_pdev->sock);
 	hsmp_pdev->sock = NULL;
 	hsmp_pdev->num_sockets = 0;
-	hsmp_pdev->proto_ver = 0;
 }
 
 /**
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index ecfd2f92a531c..607e77350410e 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -815,7 +815,7 @@ int hsmp_cache_proto_ver(u16 sock_ind)
 
 	ret = hsmp_send_message_locked(&msg);
 	if (!ret)
-		hsmp_pdev.proto_ver = msg.args[0];
+		hsmp_pdev.sock[sock_ind].proto_ver = msg.args[0];
 
 	return ret;
 }
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
index 62ba795dc8c56..6c850c91a51b1 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.h
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -76,13 +76,13 @@ struct hsmp_socket {
 	char name[HSMP_ATTR_GRP_NAME_SIZE];
 	struct device *dev;
 	u16 sock_ind;
+	u32 proto_ver;
 	int (*amd_hsmp_rdwr)(struct hsmp_socket *sock, u32 off, u32 *val, bool rw);
 };
 
 struct hsmp_plat_device {
 	struct miscdevice mdev;
 	struct hsmp_socket *sock;
-	u32 proto_ver;
 	u16 num_sockets;
 };
 
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index af8aee1fb22ba..40c98d9c66d4f 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -79,7 +79,7 @@ static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
 	if (sock_ind >= hsmp_pdev->num_sockets)
 		return id == 0 ? SYSFS_GROUP_INVISIBLE : 0;
 
-	if (hsmp_pdev->proto_ver == HSMP_PROTO_VER6)
+	if (hsmp_pdev->sock[sock_ind].proto_ver == HSMP_PROTO_VER6)
 		return battr->attr.mode;
 
 	return 0;
@@ -193,7 +193,7 @@ static int init_platform_device(struct device *dev)
 			return ret;
 		}
 
-		if (hsmp_pdev->proto_ver == HSMP_PROTO_VER6) {
+		if (sock->proto_ver == HSMP_PROTO_VER6) {
 			ret = hsmp_get_tbl_dram_base(i);
 			if (ret)
 				dev_info(dev, "Failed to init metric table\n");
-- 
2.34.1

