Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011067.outbound.protection.outlook.com [52.101.62.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BF5421223
	for <platform-driver-x86@vger.kernel.org>; Thu,  8 Oct 2026 09:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791451849; cv=fail; b=CPgsMgh6L6hSfUZhWuImgu4Ozj3QwipF0y8jH4bh9bveAKsU/inNr8bVon6ztitPTMkzVahHeU3iDcEpeKTnKdt1/c4+x6jD+HwWCxf44aZjjU0LCjsTPgi2kTQdFAIHbgqUrMHyN1r5yIqauw1gMXb9LRV161C5Rc2ziwQmbkw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791451849; c=relaxed/simple;
	bh=WIpxER0X0gk6R3wc24rHVsSOMACw7jS0HsOeTEDP4oc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sutijy953H7X/Z3osAd9O4sQSgrmbRr04rmHswWPrEI/pYhY0+qrEoSZH0MprhDwHJE22Ving5aB9K/o9IiyyQ6A/9HaKbiekUFjhgOGewJm0Sy1UCvdlwdm/TS+esFQKWpqVBnYYVXozlsdIjA9FZrhmcm+E+1GhKTi6Wk8F7A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=hL//vuWi; arc=fail smtp.client-ip=52.101.62.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="hL//vuWi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d9txbx9YHXzW25sUQ1i7VPdr3CooX9FWfeBmyV0mmwi0OmqtGL+Limq4378f6J1t5wen9xHWgbGZZfT2Nb7pVmLd2Aj4X3XeqFNGLRBcf+ux7lT7sY5Rpc27xw3JjTULwgoGW9y2JV6UxXXQJZFMUtpFGihYmHqKxHf5pxISajxWxvkgFv5L9X5FbLAusgvCxT7PfhCXJEKu5a8zVok7qEocgaecDrA6Obf7t6BFu+8JuMheFWGOQufoYU2bxR4TULOFJLtUI9Gdd3JVyzIVl1UsBTs5VFwZ0+nWWULbJyyNN9VjgXvOxdKqZLv8lDZGEBe30lEedEsIkbcvRpkCQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=35BnDW0fIUqEnSy2UG1Aw8oGrx6pKp32jVI5cJ/6ofQ=;
 b=hrkSnVYbvjirKx6ErnyMbrYu3f7k4crLgZ5KgL8Qui7jQqZUzuv3AHA7zATxjyH0IUD01weUfKb+pbzRnCxdDUiF2S5PkI4CSWYeH+6UnWtumSV2LybgjjiYSmY13uHHPa2VbiKr+0wLwQC5ZriD5n8RrzxezOKnEag4NOlFDoju1b8LtvEwklWeOtzrYsR13kbuGNkvO4F1yqFbB+VWHAVcGbJh0cLzu+izTPPWzhbDf0EwS+xWDkCOgpfqQ8GjalSAJLwP0urcjhguW1xh8D1NVG/53H080lF7yHjrspG+J/WybQ53UE1yFSM1uG5oH4Ei/yxVd5R8ha185Qt+MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=35BnDW0fIUqEnSy2UG1Aw8oGrx6pKp32jVI5cJ/6ofQ=;
 b=hL//vuWi5EShIYk8v1tJY5OFS3bAei28trCxH87FdKb7S+K8vnwlMe8OWkFZL5x5zjejmHorGVI8KGpwtDg8iMoNIjdClGcid3OXqxpeZJbbfCOz88aMm06M9povp5H6MJbOYN+N0gA2INBkIjAJLDxFpC61/Pm6JNiHQLzNDYg=
Received: from BN9P221CA0019.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::34)
 by SA3PR12MB9198.namprd12.prod.outlook.com (2603:10b6:806:39f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Thu, 8 Oct
 2026 09:30:31 +0000
Received: from BN1PEPF0001806F.namprd04.prod.outlook.com
 (2603:10b6:408:10a:cafe::68) by BN9P221CA0019.outlook.office365.com
 (2603:10b6:408:10a::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Thu, 8
 Oct 2026 09:30:30 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF0001806F.mail.protection.outlook.com (10.167.245.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Thu, 8 Oct 2026 09:30:30 +0000
Received: from trento15c5.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 8 Oct
 2026 04:30:23 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>,
	<muthusamy.ramalingam@amd.com>, <NaveenKrishna.Chatradhi@amd.com>, Suma Hegde
	<Suma.Hegde@amd.com>, Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
Subject: [PATCH 11/11] platform/x86/amd/hsmp: Update sysfs and hwmon file modes based on platform capabilities
Date: Thu, 8 Oct 2026 09:29:39 +0000
Message-ID: <f1a382edfc00e62042626895562bf00bdef49b52.1791446401.git.Suma.Hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF0001806F:EE_|SA3PR12MB9198:EE_
X-MS-Office365-Filtering-Correlation-Id: aa8174f6-01eb-4c23-d53c-08df251ecb71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|36860700016|82310400026|1800799024|3023799007|11063799006|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Rg9Ai1KD/Qls/m49Xyg2MnvIvasxWLIPAoy+/HKTuhtEpBhNUVibdzwd5anWBQOHxG8FPWD3Q8ZBZsGkr/0UDnpazwg9kqTKtIpbB8KqTuiGXMLmv6DR3LgMgnJakUHv5bqZLRe8fgdecy48AgENYmcR0Hip2MEI0ct0stkLdi0chfEgo08NTODtglYeeX4LGpwMADgoMqMxmu5xSFFu3gPzV4gYJKfcKi1sb6lbGyRiKcMWTZ3Eo3AunDwMIbODT58QzULQ1bBwkOYRENNdIuSYZf5VP45Q4SPU4BjuXOhBHQ0t9MuvAcThQTS7/zpWuzlpCsLMgGEWlEKhbNHA7dY3m971LcJ3SbwS4moUJTJBQaJu+DwMBFsx+DNqeZnuEPycvhHhzwUXMFLITHafZZdWspO5f0NFAgl1THSFYgBMGUeCpjqPTXNsv6A4Ow8N3j4jScE3KU3ORHWAB2J/PxY7zTcbiMfDiJU3LxRuCz2GWkGA7VJoW8h5ExRBVA4jwTHyH0qMAEYjZaIob32wV/Vf/VU6+rgebtrEHpg/3/m81Ek5iosbGMCSitqd5EJlRp1NGz20gAvhsFIxGlUYE3AWJ5IOZQDJe+lpgQSW/X3+09acDH6EXGCOuCNeuj64y3ecOMY0Dviah3FKR84qiYfbwUDKcmuC/WXeqk0GtIEeZQYNWUI6UXYXF422XTtgRNC7fC4lvu/ZGuHJRttMfw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(82310400026)(1800799024)(3023799007)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	atP4XjADF/YGEn8JJleh8deynep3fYDow5c05Vpp8CwixeqbTnUsOoOHRXhuYDrI6Gl16gz4/RebGYgkYYAGtDimA3E/MBtuq+Ee1mPKsDmVXc9Zd8wJOaV0Hwn8anRGSGJx8GiGvl2KEV2QjpNNYgp/LwP4lv6SDTf/04r3wNPtJ+CwJgbt69+AAJebkfFjDAPZdtGvssl3fXKtQtBBo15zNtidfrqNMN/P0POAv8YyiEUw1zxLmXwqZYVDgqGsiiOT1cYNoshem6tfjx8fbcA5oHn5CF/9bPDh3zgQM5XUeyP4S4Sk111UKGz3NRSwb5To6kcD9IzZO5ODG7d2QeKNUbk5LXfhcTo8++bo10J7ovOpioeyzZqPsSJiooc4TShSylOQgO1cxOFtlba62rY5LEszWXaj7tPmP5f92TqypeRTXD/o7j+YBv/HB+fx
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 09:30:30.2006
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa8174f6-01eb-4c23-d53c-08df251ecb71
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0001806F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9198

From: Suma Hegde <Suma.Hegde@amd.com>

HSMP messages can be read-only, write-only, or read-write. The set of
supported operations varies across AMD platforms. Older platforms may
only support write, while newer ones support both read and write.

Currently, sysfs and hwmon files are created with a fixed mode based on
what the latest platform supports, regardless of what the running
platform actually provides.

Update the sysfs visibility callback hsmp_is_sock_dev_attr_visible()
to check the per-socket read/write enabled message bitmaps and return
only the permission bits corresponding to operations supported on the
running platform. For files that are both readable and writable, each
direction is checked independently so the mode reflects actual support.

Apply the same logic to the hwmon visibility callback
hsmp_hwmon_is_visble(). Check the enabled bitmaps and
return the updated mode for each power attribute.

On client platforms, keep fixed modes for the shared smu_fw_version and
protocol_version attributes and hide the rest; client platforms have no
enabled-message bitmaps yet.

Co-developed-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
Signed-off-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
Signed-off-by: Suma Hegde <Suma.Hegde@amd.com>
---
 drivers/platform/x86/amd/hsmp/acpi.c  | 53 +++++++++++++++++++++++++--
 drivers/platform/x86/amd/hsmp/hwmon.c | 24 ++++++++++--
 2 files changed, 70 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 3ea35d8936f8d..1cb19e7ac843e 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -16,6 +16,7 @@
 #include <linux/bits.h>
 #include <linux/bitfield.h>
 #include <linux/cleanup.h>
+#include <linux/container_of.h>
 #include <linux/device.h>
 #include <linux/dev_printk.h>
 #include <linux/ioport.h>
@@ -324,16 +325,60 @@ static struct hsmp_sys_attr hattr_protocol_version;
 static umode_t hsmp_is_sock_dev_attr_visible(struct kobject *kobj,
 					     struct attribute *attr, int id)
 {
+	struct device_attribute *dattr = container_of(attr, struct device_attribute, attr);
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(dattr);
+	struct device *dev = kobj_to_dev(kobj);
+	umode_t mode = attr->mode;
+	umode_t mode_updated = 0;
+	struct hsmp_socket *sock;
+	bool readable, writable;
+
 	/*
 	 * smu_fw_version and protocol_version map to the same data in both
 	 * message tables. Every other attribute here uses server-only
-	 * message IDs that resolve to unrelated client commands.
+	 * message IDs that resolve to unrelated client commands. Client
+	 * platforms have no enabled-message bitmaps yet, so keep the fixed
+	 * modes for the shared attributes and hide the rest.
 	 */
-	if (is_client_platform() && attr != &hattr_smu_fw_version.dattr.attr &&
-	    attr != &hattr_protocol_version.dattr.attr)
+	if (is_client_platform()) {
+		if (attr == &hattr_smu_fw_version.dattr.attr ||
+		    attr == &hattr_protocol_version.dattr.attr)
+			return mode;
 		return 0;
+	}
 
-	return attr->mode;
+	sock = dev_get_drvdata(dev);
+	if (!sock)
+		return 0;
+
+	readable = !!(mode & 0444);
+	writable = !!(mode & 0200);
+
+	/*
+	 * File is both readable and writeable. Some platforms support only set/write operation.
+	 * Some platforms support only get/read operation. Update the file mode accordingly.
+	 */
+	if (readable && writable) {
+		if (is_read_msg_enabled(sock, hattr->msg_id))
+			mode_updated |= mode & 0444;
+		if (is_write_msg_enabled(sock, hattr->msg_id))
+			mode_updated |= 0200;
+		return mode_updated;
+	}
+
+	/* Read-only attribute */
+	if (readable) {
+		if (is_read_msg_enabled(sock, hattr->msg_id))
+			return mode;
+	}
+
+	/* Write-only attribute */
+	if (writable) {
+		if (is_write_msg_enabled(sock, hattr->msg_id))
+			return mode;
+	}
+
+	return 0;
 }
 
 static ssize_t hsmp_msg_resp32_show(struct device *dev, struct device_attribute *attr,
diff --git a/drivers/platform/x86/amd/hsmp/hwmon.c b/drivers/platform/x86/amd/hsmp/hwmon.c
index c8314eee06f4f..b0da511f03774 100644
--- a/drivers/platform/x86/amd/hsmp/hwmon.c
+++ b/drivers/platform/x86/amd/hsmp/hwmon.c
@@ -80,16 +80,34 @@ static umode_t hsmp_hwmon_is_visble(const void *data,
 				    enum hwmon_sensor_types type,
 				    u32 attr, int channel)
 {
+	struct hsmp_plat_device *pdev = get_hsmp_pdev();
+	u16 sock_ind = (uintptr_t)data;
+	struct hsmp_socket *sock;
+	umode_t mode_updated = 0;
+
+	if (!pdev || !pdev->sock || sock_ind >= pdev->num_sockets)
+		return 0;
+
+	sock = &pdev->sock[sock_ind];
+
 	if (type != hwmon_power)
 		return 0;
 
 	switch (attr) {
 	case hwmon_power_input:
-		return 0444;
+		if (is_read_msg_enabled(sock, HSMP_GET_SOCKET_POWER))
+			mode_updated |= 0444;
+		return mode_updated;
 	case hwmon_power_cap:
-		return 0644;
+		if (is_read_msg_enabled(sock, HSMP_GET_SOCKET_POWER_LIMIT))
+			mode_updated |= 0444;
+		if (is_write_msg_enabled(sock, HSMP_SET_SOCKET_POWER_LIMIT))
+			mode_updated |= 0200;
+		return mode_updated;
 	case hwmon_power_cap_max:
-		return 0444;
+		if (is_read_msg_enabled(sock, HSMP_GET_SOCKET_POWER_LIMIT_MAX))
+			mode_updated |= 0444;
+		return mode_updated;
 	default:
 		return 0;
 	}
-- 
2.34.1

