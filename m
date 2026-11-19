Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795078310;
	b=bFUJRmOzl3zrj0QLCuF/Yfer3MTrGZlxLqJ3ms1cvgnEFFmWnBpg4UUs7EHFX9Y98cms
	 IsS3X+uPVbPhbN/OtY5shI204Yf3TrQEF2/6jgKsxCCTPNN5D196EJlg/H3DgicwvUVE2
	 I43GNr4cNjW5roHUpF7uy5gbTo2AvuUUNPIi9+OFCD4NHCqboMLwoYd3izrDI/m85Ol4h
	 XwnOns0AnhGpU9V/pPfPwgfYYP/aSw1OwDDOfaGH1103bWumwsl4qvnE0fxQZwlmB8L8b
	 t0WX3GfE/fE3Ji7iYoJ3SiE+1so5K/dEHQpivgNF/tRHU6isKw3UQkYvXfRDu+BOLcw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795078310;
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
	bh=rS/be0OJz4ogfqsUWfJLTZfPvDizg73t78vO3MHHFPw=;
	b=d6v7bmLriOLgZYqIRw/RG0fZchBr97ay3w3OudkSm7dHj0FA9WZVSYUU3VGc0KDWbx1y
	 7ePTR8H0enY4L8F8OdGqVQH044u5PqGURiRGJ9my5AYsVkzc6a0+6erwl85p/Kno5c1mw
	 /GaoBULyVGKkTH6zawVexZ82p9KGrT6tiVhM1oGl9i2GEzbUnRXE2XUyUG/dg0LbBp444
	 AeCWTljFeAE/dJFYYweRVDvPXJOSabFYRd2uM4uFrl1dmoxxTIvt/EEblZEKtY0ueLYTX
	 LtI0x8x8jPM9rNp4lx1EvETxlgBrdw7AEIZ7Ih3IuhJTcwBggcXC+j2a1dk1qfV4f3Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Sc+vUvAP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.10
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012010.outbound.protection.outlook.com [40.107.209.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C4A606A325
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Nov 2026 08:51:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04C4A606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Sc+vUvAP
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A0LpKUpvQ4VoVGCXuf1htHY1APdY3eQ+l2ZeHf/Sm1NMrsiUxtKQsdHKV5Rmx0egw/jLozr90SquCrA0YJYJNxWxi4s5A83iogUeoGfcDFmthRgmJHLoHsLuuf2gVvkJB7c3PCAOpbZRnvYvg2URAzqB/7bakTlX0fdFteNugmMb+xiyuRTAJNMCWoT1hx8G6uAQ7n/mWGPwPsw+BxCqVxw5rDkm9bne93MblTmmwGK8/yHmdXFhKmoo4XZglBH8PdI/HDV0e/3cbrz9IAwPtT50ZIzavsbK94V6WcRRJswgVRgZAEDvM6o2T/5BfU/fpsZMp5A61WiI+7C1rtn0yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rS/be0OJz4ogfqsUWfJLTZfPvDizg73t78vO3MHHFPw=;
 b=nd/R0QAcNWZGTafB50JN1dR7Nt3wNMpkJ+VD9Mywgz2b0odC9Lwz294IWKcgvi9wkKwg4eahs1y4lXDdhvvkOf9WXTxzQkfaX5dE5HQFr3IqpQpJl+HXUaUDiJ56oQm3X1XzoHDSUeOgj6lR1mUJvY055rlzRW5099UiNO7p/iyTjAAasdeZpzUnXxnoy/H32G1uIs3U5m6QCD1UbfXN7jKvJXQBIgMWkOELDmmw7mWTqvCZxcx9P282TPsgyI3z62izkacVuT61vljhAkgaaJyqozPZtmZH8eO/OdP/zy4NDHu7qsI+s58XToaHn0xC91eIPUKZL4VUyFWqvHvCzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rS/be0OJz4ogfqsUWfJLTZfPvDizg73t78vO3MHHFPw=;
 b=Sc+vUvAP1EYw7+4AK0BeFMZhOWPVq/Z5MUrDoatYGKZNnQfOja462XcoakG3tiQmwTY/1jqCCz3sofsM76hBkBMlp3hUuU90PsD80kvrcTjVB6FEhFBzNihbO0S3bJ1Fj8b1syscMBPVW8FP/ZCAnxBu7h/2+6mF0YDmG4oENtY=
Received: from BN9P223CA0022.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::27)
 by DS5PPF5E0E7945E.namprd12.prod.outlook.com (2603:10b6:f:fc00::650) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 08:51:46 +0000
Received: from MN1PEPF000793FC.namprd05.prod.outlook.com
 (2603:10b6:408:10b:cafe::56) by BN9P223CA0022.outlook.office365.com
 (2603:10b6:408:10b::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Thu, 19
 Nov 2026 08:51:46 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF000793FC.mail.protection.outlook.com (10.167.249.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 08:51:46 +0000
Received: from trento15c5.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 02:51:43 -0600
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <Muthusamy.Ramalingam@amd.com>,
	<NaveenKrishna.Chatradhi@amd.com>, <Anand.Umarji@amd.com>, Suma Hegde
	<Suma.Hegde@amd.com>
Subject: [PATCH v2 11/11] platform/x86/amd/hsmp: Update sysfs and hwmon file modes based on platform capabilities
Date: Thu, 19 Nov 2026 08:50:45 +0000
Message-ID: <0dc4b0ece4111115f2ffde34c316c94c015a7b9e.1795061419.git.Suma.Hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1795061419.git.Suma.Hegde@amd.com>
References: <cover.1795061419.git.Suma.Hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF000793FC:EE_|DS5PPF5E0E7945E:EE_
X-MS-Office365-Filtering-Correlation-Id: 40221235-103c-42ff-5bf8-08df461a577c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|23010399003|10067099003|56012099006|261028144727099003|11063799006|261021123027099003|261022105027099003|261021121427099003|261102123227099003|261026140227099003|261009223027099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	NxgQiQOEhsHQGIBhneJn6qgTzvVirhUhnvqkcUr1A6/RIWHMzKxO4vg7mM7J4vKnaXJ53dfjSRIsMwpkbCS7HC2Hcb6/N3SMg1Dq7PqgrgbnOB+c1UJNtNLFohPbY7IGJjt9TcUfN/cuILGt2BxEfJXjhNldGbsc7taS2FpduFwczUIJzR3StJQ5fCcPOwSBCUoX8nOgq+sEyaeUhRFd4XxU7jMgRLcVWi1a/lUlcGeh7iCwE8OrSzP9xVKTHcb+/lwQusF9E4iTo+GnTBFluoMTrNVzbnCDpPOP/cOWRLpOMISO6qdAZc8wLW1NvRNNqUJJBq33HN+AFVO+Q2wZu4PE505BDpNYMdatboGDrFR2PM0MiBeZrMZt1heSW60paloFNP6SYyLuBcOWUS/K+xsosCP0BpA8ecjK7hGynSnJyt2ogpT3nSieuIRIqd0Rboi/sj2kdrZrnn9R18DCaGwSmPdz3X0p0JgSTiztwcoo1/BD6KUUSU5RTsaC/13rdyW76UgLn+1Zyx3jTC6eOI2t1/F0iJfxUxzAhuuwBmlv1AlLSjwEuv8NXgY/NABgfOBH/3RfsNbiC5ZtRp9vx9ad26tIV1xLjYjW9Qz21AFKuuojBeFabOYVPKyRNB/5MyB4ItH/nHrvvbaCKFwPl17i3v/Yeh6/T6IxJS6OKKKYHWhzLTy0ctdZOzes2cNJEkrPI7fJX036uzVMLp58aw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(23010399003)(10067099003)(56012099006)(261028144727099003)(11063799006)(261021123027099003)(261022105027099003)(261021121427099003)(261102123227099003)(261026140227099003)(261009223027099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	e2iFUFoTqxRmw6t1QSsuZApLYjRZnlYhAOBPPjE26TkB174C+UJHxNL4RyRTn564irhhjtg0lcPYWV/21TcB6Z1LGnsBhEhuSASdxcH6nX8T69nrzc6vdpxMZ5unxmO6dTyJCLqYD0tg9o4Bb9Ju0gTcEXa5M2HXuBIslu24hQpmOwJKvUO+2knX2TYvWNZ6BZSiB7VExJ4bu29Q0gplLEexWrx8+oXCnCLvV7X7laIStCkWD7vyZIbPoZ8L7otPVQUtmZZjX4G+ht/AKbhoLwpONS+A3PPPXVy107w7g+keZpqai4YDXHt9+7gHaMzG7Xb0fk7TNkv8bIwqVMcaKT2cLZ3+Xd7agiTswGrjzmWQGoK9jKUSxG6PqszxEbjd5CZ2yb5KNRIA2K7bp/q8qimUUYBxGbvlIIGmjqieTJu8WRoX19e7OcmKSZqQtBt0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 08:51:46.0300
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40221235-103c-42ff-5bf8-08df461a577c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF000793FC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF5E0E7945E

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

Changes since v1:
- Keep the existing short client-attribute visibility comment instead
  of replacing it with the longer message-table comment.

 drivers/platform/x86/amd/hsmp/acpi.c  | 49 +++++++++++++++++++++++++--
 drivers/platform/x86/amd/hsmp/hwmon.c | 24 +++++++++++--
 2 files changed, 67 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index a9d6da5572a39..52e77c8bda58b 100644
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
@@ -329,12 +330,54 @@ static struct hsmp_sys_attr hattr_protocol_version;
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
 	/* Hide every attribute except smu_fw_version and protocol_version on client platforms */
-	if (is_client_platform() && attr != &hattr_smu_fw_version.dattr.attr &&
-	    attr != &hattr_protocol_version.dattr.attr)
+	if (is_client_platform()) {
+		if (attr == &hattr_smu_fw_version.dattr.attr ||
+		    attr == &hattr_protocol_version.dattr.attr)
+			return mode;
 		return 0;
+	}
+
+	sock = dev_get_drvdata(dev);
+	if (!sock)
+		return 0;
+
+	readable = !!(mode & 0444);
+	writable = !!(mode & 0200);
 
-	return attr->mode;
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

