Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012061.outbound.protection.outlook.com [52.101.43.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E1A42E8D6;
	Fri,  9 Oct 2026 06:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791526460; cv=fail; b=TJQ5yoqEuysm1G+l1c5shG0i0FXfqzihieeEDI7Rbe5jC1RaH4eh83h7gdGl6z/m4XWwLqMQq+jY2UsF9v8wKXGdvD1qZBEp5yHRRuX0aPRETuW7Y+KYCjSXp+jNXe6tj5LKsib7np1z4UZb4WAtic+UvFO0AmY4qx7aAmKAxSc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791526460; c=relaxed/simple;
	bh=VzBvjeU8F//CHO6OqOmLFdLO6LxzblGZDY+JSYKPG4s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tpuQ74uOkZ8Z0uqowLZeT4DCmFAmb+6oYmpizvmEMmKnuFUXnLArG4D/C1qEbEN2XEDvqTGfn3gsW4IW1LmVA6BRKm2SCua4OcqgaUYI4u33hkhn3C9TNev30wioroiWPhg0xYbiAVooXY3JOzih8IIEaTvQh9Dhk1h4Y0kz/Yo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=NYEwjHeG; arc=fail smtp.client-ip=52.101.43.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="NYEwjHeG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TCcZCpfdt9lo2nXijJayxXoe8KQ6WFzxZvetOgAOH5TKmTKKqME44Aa5YLKg4CTS+aXF0lHiqB0DnE/+CwRYGGkJ4nnb5iDmfPm/CTvnYu8MsjTFkSrZ23VXNYcsrRnBqbBCIiTW3o7QiljH2fWCBz7zO/uN2FC45/87b9kGWJLXxzYUrSUNOPowJwMumIEm4m4cQHg8rMokSjy6xPPA/quuTnitFAMCLoOVIuPqhgbmShQPRMCpNBoKXc5vCA/LbaC/9RFuN6Lc+hOb9AWeE4BVLaOhgJrH/DjBAiI+bOkORKPImReTrOxM0usV5Hg9RVVV0l/jGPpEBOvGGBSgkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aidNgNbqguqAZFfioFs7caTkyIZ0QnpYYOv6gSayg28=;
 b=JVfJmzIoLlhH7G48vnA5+9MWnehEhWTpcXyAAn3axB6dvZrunkRzFc/lzyReyIBxUShuFqwI0smc3fL4gC0wFkXJrzJK6Hjb+m/23A2kKDbs6Noud9r5E3XOEcxcertcXNI5wIy1ahTu/Usr1eRHPQBejkRFfSDs88meEXlws49cJeBPzs3AkWz4ILAsOu9ceZvwULQ+yjUHHlKr7f7w+B1LIaTJIEfQDjGzURz4ourhEKnkwKH4p+KcAC5I1fX2LMJ0whvmSrVWPHgirqsMuWLqerrUdIpThPD/YtLOhTaeWRI1SF7hJTxwwj5I6D+srXIN/WEXpiHlgIDNxoCm+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aidNgNbqguqAZFfioFs7caTkyIZ0QnpYYOv6gSayg28=;
 b=NYEwjHeGd0JaEfJa3+R+ttLbMz7MH/WMO0NV5bWPUgqqRUxCxND8W976khbr03CQ28DPIbF4KFdE/9OEYoLpKTjP6owb6FbIBAyYcL59KyGoAFSExv5i0n8rdQFWMu8Pm7e7z0Sjg0LLcTx2vUWk7NnXqQrSrk7NoKXJdp4yRAM=
Received: from BY3PR04CA0026.namprd04.prod.outlook.com (2603:10b6:a03:217::31)
 by SA1PR12MB7102.namprd12.prod.outlook.com (2603:10b6:806:29f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 9 Oct
 2026 06:14:14 +0000
Received: from SJ1PEPF00002317.namprd03.prod.outlook.com
 (2603:10b6:a03:217:cafe::9d) by BY3PR04CA0026.outlook.office365.com
 (2603:10b6:a03:217::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Fri, 9
 Oct 2026 06:14:14 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00002317.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Fri, 9 Oct 2026 06:14:14 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 9 Oct
 2026 01:14:07 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v8 1/4] platform/x86/amd/hsmp: Recognize Family 1Ah client platforms and hide server-only paths
Date: Fri, 9 Oct 2026 11:43:53 +0530
Message-ID: <20261009061356.3234513-2-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261009061356.3234513-1-muralidhara.mk@amd.com>
References: <20261009061356.3234513-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002317:EE_|SA1PR12MB7102:EE_
X-MS-Office365-Filtering-Correlation-Id: d458e5dd-7563-4869-b194-08df25cc8b20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|23010399003|18002099003|10067099003|11063799006|56012099006|3023799007|22082099003;
X-Microsoft-Antispam-Message-Info:
	6zfvwDYFoYeOmzxNHmiBeCMwo6Dz0FxqA7Rjs7bFxye8GjcoQDKOB5TLaGChV3eSMvymPgYM8g7PIuIW4zPq190BwXaYtUfXz18N5qnhEtMLWROKSGpKHD9B6DcKqtEuzwd8tGBtkfWf6UllVgmBbFgIAxRyAtZV0gDmjXS8UBIAFHMANOUxV80TTZODFQDO0kHIm5BUbr8O1O4hdJNQ01H287NNFQIcTIy/mZzAKVM2ldGplQXjkcsayNeBYfRvXczeKzNzQnX4gbTMG36uX9/mvbRlsG8ZeDeGg1wjnuKMiHerZHcyHj2cNWbMvK3cbKogvvdhFaGox1Yh70f/JT4QjGZJauqYkUwXR8y3pDoyEHU0dHET7fbenKlsyolG2GaJMNpNFcutdxIqQ/RQUfkdjTsVC6JjMxGG2wpzW9j1EZlXcK8IP0iKSo110B7ASXLvqY9jeEichFF7GY4rwjJj9An1x0emfvwI9UYY5RzkoRRhuZcGJXce6JZ9ABeOZj8eVYItqVU874j4eJJ7ccOA7hF6bNGYPE9Nf5f43c6NQFNMueAyjy42wKDv4lX12KtEsGCLzr8uPSayqK0h5IZ0cCKXg6ifWZZMvuoAMyrTawb4VPpVbg8J/CY+zvfmlw9AwyB46t4uW1dkQ7j8hICkhQoLquhMNta6UuEsaDw7x7iNUU9IJkFBNLU1hWMAKHLkXn+MdPmgU+Zw5omBJQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(23010399003)(18002099003)(10067099003)(11063799006)(56012099006)(3023799007)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HfwIiW/0bcg553mfN8c1bLOwosp1g0QJVp6/44OzCNQfseGu6Ot7r+Ub+HjefiUV1nabRB0yj/FOAwJW8jkVfDa3CmTtvOeCbHfHIFuqrebkOBm6zUQbLpx/FizuT3n9EPyPkFTbwzyuvBd6eBiYFx5OBiyYf3Nb9gcCdfqVn6SlMs87CoL2K6cfjiVDaTO7l0Tpk2O+OnHvk1eZLmMzIqMF/4UjJMNV+DVJrN5iInOOYvMPW2HPsUfFSbJgqmRnZcqbxi2IPgLyq0evYuZiIqhAEQYtqf4hbRqP/jmPlwWruorTWS3NrlnghM5XH8B71PtlSkAf0mQ3quYqVtkPcxM7qrOnLGPXxk9uSxN/b7B94YJWUPVa3TIni0u77uwoH9vfAdoDspSbHrS1i4QikHzhFa3LKuNhwiyCqTphUzxatnMUYawSqO2MZe8N7DOw
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 06:14:14.6345
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d458e5dd-7563-4869-b194-08df25cc8b20
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002317.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7102

Add is_client_platform(), based on the ACPI-reported PM profile and
an AMD vendor check, to detect Family 1Ah client platforms, Models
80h-8Fh and E0h-E3h.

Use is_client_platform() to:

- Hide every ACPI sysfs device attribute except smu_fw_version and
  protocol_version on client platforms.
- Hide the metrics_bin sysfs binary attribute on client platforms.
- Skip hsmp_create_sensor() in init_acpi() on client platforms.
- Exclude client platforms from the HSMP_GET_METRIC_TABLE_DRAM_ADDR
  lookup in init_acpi().
- Register /dev/hsmp at 0600 on client platforms, 0644 on server.

Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
 drivers/platform/x86/amd/hsmp/acpi.c | 24 +++++++++++++++++++-----
 drivers/platform/x86/amd/hsmp/hsmp.c |  8 +++++++-
 drivers/platform/x86/amd/hsmp/hsmp.h | 23 +++++++++++++++++++++++
 3 files changed, 49 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index ddd7a04ee753..1e5028aea54b 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -300,16 +300,26 @@ static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
 	 * so that userspace which expects the file to exist gets a clear
 	 * -EOPNOTSUPP from the read handler instead of -ENOENT, and is
 	 * pointed at HSMP_IOCTL_GET_TELEMETRY_DATA as the supported path.
+	 * Hide metrics_bin on client platforms.
 	 */
-	if (hsmp_pdev->proto_ver >= HSMP_PROTO_VER6)
+	if (!is_client_platform() && hsmp_pdev->proto_ver >= HSMP_PROTO_VER6)
 		return battr->attr.mode;
 
 	return 0;
 }
 
+/* Defined below by HSMP_DEV_ATTR() */
+static struct hsmp_sys_attr hattr_smu_fw_version;
+static struct hsmp_sys_attr hattr_protocol_version;
+
 static umode_t hsmp_is_sock_dev_attr_visible(struct kobject *kobj,
 					     struct attribute *attr, int id)
 {
+	/* Hide every attribute except smu_fw_version and protocol_version on client platforms */
+	if (is_client_platform() && attr != &hattr_smu_fw_version.dattr.attr &&
+	    attr != &hattr_protocol_version.dattr.attr)
+		return 0;
+
 	return attr->mode;
 }
 
@@ -557,15 +567,19 @@ static int init_acpi(struct device *dev)
 		return ret;
 	}
 
-	if (hsmp_pdev->proto_ver >= HSMP_PROTO_VER6) {
+	/* Exclude client platforms from the metric table DRAM base lookup */
+	if (!is_client_platform() && hsmp_pdev->proto_ver >= HSMP_PROTO_VER6) {
 		ret = hsmp_get_tbl_dram_base(sock_ind);
 		if (ret)
 			dev_info(dev, "Failed to init metric table\n");
 	}
 
-	ret = hsmp_create_sensor(dev, sock_ind);
-	if (ret)
-		dev_info(dev, "Failed to register HSMP sensors with hwmon\n");
+	/* Skip hwmon registration on client platforms */
+	if (!is_client_platform()) {
+		ret = hsmp_create_sensor(dev, sock_ind);
+		if (ret)
+			dev_info(dev, "Failed to register HSMP sensors with hwmon\n");
+	}
 
 	dev_set_drvdata(dev, &hsmp_pdev->sock[sock_ind]);
 
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 5e123a4ecea9..d32d5a907aae 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -720,7 +720,13 @@ int hsmp_misc_register(struct device *dev)
 	 */
 	hsmp_pdev.mdev.parent	= dev;
 	hsmp_pdev.mdev.nodename	= HSMP_DEVNODE_NAME;
-	hsmp_pdev.mdev.mode	= 0644;
+	/*
+	 * hsmp_msg_desc_table[] only describes server messages. On client
+	 * platforms, msg_id mappings differ, making access checks unreliable.
+	 * Restrict /dev/hsmp to root until client-specific validation is
+	 * added.
+	 */
+	hsmp_pdev.mdev.mode	= is_client_platform() ? 0600 : 0644;
 
 	return misc_register(&hsmp_pdev.mdev);
 }
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
index 8dbff16a87b1..62ba795dc8c5 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.h
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -10,6 +10,9 @@
 #ifndef HSMP_H
 #define HSMP_H
 
+#include <asm/amd/hsmp.h>
+
+#include <linux/acpi.h>
 #include <linux/compiler_types.h>
 #include <linux/device.h>
 #include <linux/hwmon.h>
@@ -17,6 +20,7 @@
 #include <linux/miscdevice.h>
 #include <linux/mutex.h>
 #include <linux/pci.h>
+#include <linux/processor.h>
 #include <linux/rwsem.h>
 #include <linux/semaphore.h>
 #include <linux/sysfs.h>
@@ -32,6 +36,25 @@
 
 #define DRIVER_VERSION		"2.6"
 
+/* True when the ACPI-reported PM profile indicates a client platform */
+static inline bool is_client_platform(void)
+{
+	if (!IS_ENABLED(CONFIG_ACPI))
+		return false;
+
+	if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD)
+		return false;
+
+	switch (acpi_gbl_FADT.preferred_profile) {
+	case PM_DESKTOP:
+	case PM_MOBILE:
+	case PM_TABLET:
+		return true;
+	default:
+		return false;
+	}
+}
+
 struct hsmp_mbaddr_info {
 	u32 base_addr;
 	u32 msg_id_off;
-- 
2.34.1

