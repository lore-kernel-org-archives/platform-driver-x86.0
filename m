Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010034.outbound.protection.outlook.com [52.101.56.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E774A4825;
	Thu, 24 Sep 2026 15:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790265023; cv=fail; b=iUZ8oyQyYUNy/3oNtnTYvcFM2rTFeeoS0BZqkz03nfDndDqw16mb9YF7UuOAcLRdXXjPZW2lHT3+9vkJrk8ML+AFffQtKkgbEefhtTmue+RnW7+PD/itxbHy9gOh82EmDNUC9PfFZsRZW5nGTxCU4DKAIOXHXGLDyFwjtOu0BX4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790265023; c=relaxed/simple;
	bh=vi1OoDX5uOkxo7shbT6L5xjmKqXFh5Mekpw73qwUgwI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Spb3oM5SCpViNL5AG/Jw5oQatAdDHPUPXXla4eH+GbcfvEHvUfTsLpQvaJatfiBWnvytHPUNArN8MT2VSXC/2SHOFDBdPTATQ6i3KbkFr5ap0OXbbBCJX9XYk01RogNiUqO+o/A0icBtUOsY5680b2Avf4Cd6KEZMKmF9iiOfyY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=KAQNxrQp; arc=fail smtp.client-ip=52.101.56.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="KAQNxrQp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PNgDgL2OzZi3rdjmmuMSRUhC0oNhK2jm4Y1wc/FeeoTlCeYcp9/4G/vIgXFLbGJsOPs5/Ljxv98l3ZQdxJVEhij6Pp9gaQUdRdxc1mv5Ciwdw/MvZjfyZhL1ES7LVarUlwoYsGhZKlp0GoWhvVs8kJY1nDsj3RM+eF4g0RII9ktTyh04VPGYP3ec3mtjXnvJt61owBxVACp8kFCJ8PGohmZ18u+xD5nph97v3VgxxN7UQxKDhANNr56sdi/krmfNubOQdAeFODJMa0cm7nIAvJnnFsHBeoj4YOsafbCxON6MMOSok87sKczWTvPBISWycyjgRJzPpFBQaaRKJFwlOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QDpEy05pVB65XL3Nwh/8oFPCA+7yQSkeVdRc1qCG6Es=;
 b=gp/TDaDhu6uZDwm2Qx1agZqKEFjsmz+IpHV+HRnIM4ENMjwl7I0WZoH9E1XzEjBJHVp0cPK5wp17WgvxIUro3ss198VV/TC2h/MQiql2vxNrIFci1a0saUOzjw1wPbiIOshq6Zt4RezkpyVZ/T0IqgJ4qmIYpKCcyY8whA/j5KOVsiQ/gda9uKKOqGOFC4fGCJLm+B3ruVq0F+cuUeM3vsmHVl6B5x0ijfSMGaDUMeFiHUVZTHwWR4NpciTJ8bnmuyA4NCKBqF/hNYEQYW98HuKFx4cYTXBdYZrRx5HWKfDtmTV1dehoDvKFXcO/gHVZIcM5xwM7tFCyI/qlH60uSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QDpEy05pVB65XL3Nwh/8oFPCA+7yQSkeVdRc1qCG6Es=;
 b=KAQNxrQp8Obs+RaawtNiRpbg9GD6HP9i20jGGc0NoNk+KZdKTRe7ibVt/p9njcPjHANVHtZ077RHfEacl7zH2I5d9fWsqZh5mCCcZKgO45iW/AVp7N/kWasiDhXLhKQn+9eCVu7SlXn3BTOnUY5YVfuq2vOOsYlfDxVtCm9x55o=
Received: from BY3PR05CA0045.namprd05.prod.outlook.com (2603:10b6:a03:39b::20)
 by DS7PR12MB5816.namprd12.prod.outlook.com (2603:10b6:8:78::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 15:50:17 +0000
Received: from SJ1PEPF000037A3.namprd04.prod.outlook.com
 (2603:10b6:a03:39b:cafe::5a) by BY3PR05CA0045.outlook.office365.com
 (2603:10b6:a03:39b::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Thu,
 24 Sep 2026 15:50:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000037A3.mail.protection.outlook.com (10.167.244.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Thu, 24 Sep 2026 15:50:15 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 24 Sep
 2026 10:50:07 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v7 3/4] platform/x86/amd/hsmp: Hide server-only attributes on client platforms
Date: Thu, 24 Sep 2026 21:19:46 +0530
Message-ID: <20260924154947.1706669-4-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260924154947.1706669-1-muralidhara.mk@amd.com>
References: <20260924154947.1706669-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A3:EE_|DS7PR12MB5816:EE_
X-MS-Office365-Filtering-Correlation-Id: d7191069-8570-4a10-c43c-08df1a5386a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|376014|1800799024|11063799006|56012099006|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	rPtJR9VgadHdIUQOuLHgaS9Kgurvvd98uOfEPwov9itetlF50wl5YGDotId+adM699NxVWfpuHm8axpuyTV/9ETkNwCkWL8eOz9wH4p+/nIgkvu2v/WbKlmV80d8CGfFQdpkUwX6A4uwfauySKIaWUAT93JmfhHchwtazZtYz7DnuB5EkPk7aJgMjIKfnY5F9s90ZIsz0Y8ZaZKXnK9ZCC32yPCtyIBxUOL3s6GnOYynZBqGjNQf+fVXVg2gBbCwdOAGKJLb+yttj6kceReU7KmtJK6F5eeFQN6zp8an0MxwCZRvioMsXHLr4gZMcZMeA/0uOqPw+Zt77fajk2iJvtEu5bglC5OlROra0tAobF9+xjNVSC7hsLAEfmSznrF0EetNbaNL3vaavWO4I3Jkn+Sd/OvNT7X4rKDqEuaybCFuH040ncaOW5t+hhvhxbj7G6edxHGu6CRo7pwaF+ScKofpK/0IgQDPn/hs+ofiqvLFWVozvLwlYqqJ2s/PR0zchGMz2MQ4SCkPG8j309+/W0kl9L+qPivRMp/9p34yiLnh5EyrZrOhveopsGdfk0BClH7bFo00AaxKOgQcCO4OP0bVRqGrqcNhYsOtodfmc2beFbGZ2mM5ycg0E66/EGj95Kv8mv2+pTj0WtV5mUqqeVHYHfvACNPrDqnUexiXsRezQCib8VfQd/kLlE3sru1rkmzUvjOtWPkjt/2T6y1ipw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(376014)(1800799024)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PsMuY/3SD2cRPDSXa3jwKe0hFMLt2KA7ygqy+L9YHgkv/Z1yAKdGux7D8Dt3ErFtbtIOk0M1marf+EVpI+ZYwUiorEzA16lcDXoGRPsDlWVX45adC8Knw7Mw/mx6HKYaJi+CN8rIqGhFI5Gqyb4zAfE5recLZk0uZXcpq6f9SGqpOZNBPpXnlLbLouLk+tCJc9lsxw3R5+Fe8tQPDNOe/vxl7GPvlxMH1Ap+gMt7FbgXJg4s5yqEliBsi1oMLGp1tvdtVMYWgYfUwQ8f2UoBmHFCe48u9RKeF7uyW1mfjJxeRBa71OQM7vYdsfO9pt81GY4ATlVwab1RovBzZFz/WJCqvtqME895tKL2MNC54sV40gidlE4i3eYG9h2+iAVtEjslxpdijX7S6+wcDm3qR8XUX27ip4ZNlohH8I6kBqtOGwTPN0k5fHtwZUR10PFc
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 15:50:15.1980
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7191069-8570-4a10-c43c-08df1a5386a1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037A3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5816

Most ACPI sysfs device attributes are wired to hardcoded server
message IDs (HSMP_GET_SOCKET_POWER and friends); hwmon power
attributes registered from init_acpi() have the same problem. On a
Family 1Ah client platform these numeric IDs resolve against enum
hsmp_client_message_ids instead, and mostly collide with unrelated
client commands, e.g. HSMP_GET_SOCKET_POWER (4) is
HSMP_CLIENT_GET_METRICS_TABLE_VER on the client side.

Hide the affected ACPI sysfs attributes on client platforms except
smu_fw_version and protocol_version, which report the same data in
both tables. Forward-declare hattr_smu_fw_version and
hattr_protocol_version ahead of their HSMP_DEV_ATTR() definitions.
Skip hsmp_create_sensor() in init_acpi() on client platforms for the
same reason.

The metrics_bin sysfs binary attribute has the same visibility problem:
hsmp_is_sock_attr_visible() gates it on hsmp_pdev->proto_ver against
HSMP_PROTO_VER6 with no is_client_platform() check. Exclude client
platforms outright there too, matching the ACPI sysfs attributes
above: the client set has its own telemetry table, read only through
HSMP_IOCTL_GET_TELEMETRY_DATA.

Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
 drivers/platform/x86/amd/hsmp/acpi.c | 29 ++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 8b4bf57c3485..d775ea8ba603 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -300,16 +300,31 @@ static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
 	 * so that userspace which expects the file to exist gets a clear
 	 * -EOPNOTSUPP from the read handler instead of -ENOENT, and is
 	 * pointed at HSMP_IOCTL_GET_TELEMETRY_DATA as the supported path.
+	 * The client set has its own telemetry table, read only through
+	 * HSMP_IOCTL_GET_TELEMETRY_DATA; never show this file there.
 	 */
-	if (hsmp_pdev->proto_ver >= HSMP_PROTO_VER6)
+	if (!is_client_platform() && hsmp_pdev->proto_ver >= HSMP_PROTO_VER6)
 		return battr->attr.mode;
 
 	return 0;
 }
 
+/* Defined below by HSMP_DEV_ATTR(); same message ID in both message tables */
+static struct hsmp_sys_attr hattr_smu_fw_version;
+static struct hsmp_sys_attr hattr_protocol_version;
+
 static umode_t hsmp_is_sock_dev_attr_visible(struct kobject *kobj,
 					     struct attribute *attr, int id)
 {
+	/*
+	 * smu_fw_version and protocol_version map to the same data in both
+	 * message tables. Every other attribute here uses server-only
+	 * message IDs that resolve to unrelated client commands.
+	 */
+	if (is_client_platform() && attr != &hattr_smu_fw_version.dattr.attr &&
+	    attr != &hattr_protocol_version.dattr.attr)
+		return 0;
+
 	return attr->mode;
 }
 
@@ -564,9 +579,15 @@ static int init_acpi(struct device *dev)
 			dev_info(dev, "Failed to init metric table\n");
 	}
 
-	ret = hsmp_create_sensor(dev, sock_ind);
-	if (ret)
-		dev_info(dev, "Failed to register HSMP sensors with hwmon\n");
+	/*
+	 * hwmon attributes use server-only message IDs, which resolve to
+	 * unrelated client commands on client platforms.
+	 */
+	if (!is_client_platform()) {
+		ret = hsmp_create_sensor(dev, sock_ind);
+		if (ret)
+			dev_info(dev, "Failed to register HSMP sensors with hwmon\n");
+	}
 
 	dev_set_drvdata(dev, &hsmp_pdev->sock[sock_ind]);
 
-- 
2.34.1

