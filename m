Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011044.outbound.protection.outlook.com [52.101.62.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B2F3ECBFB
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Jun 2026 08:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780992722; cv=fail; b=f0IIswPhFf6+/5A6WVIQG4rf7QsC/CiYf5ZLeaCCyoLQ2rolHttWJL1GnFNtExzkTGp8fZk5Vi2ZvjK4Rq4kOAwTQsXt2GMGP7BAF+MAamGSBYVpfe0HKkiDUfzrrCCX740eLFIDIq/oum37nO2EkEXbcwsDDuA0h0CxOCNrfVs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780992722; c=relaxed/simple;
	bh=42HXbn5j3kxhSInD10ebBHrkXWBJLKqjjp/cRvLQ5Ok=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZgbUWD0z4gy5HCqPUkUW2MzvvxjllCKYUb28BGAGOGouNwwG+Wuf1GH2vO32UGAqXGeoLCgj+da/A/EVqshXQIRl2kL7V8fOiY01PgcAT3GbyTKEdcNgjayj2p0rzVGIQWU0TLFwUtJbhSVSHHWHx+LurODt64CaWBWIq0QdUPo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=CG+zvlC4; arc=fail smtp.client-ip=52.101.62.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="CG+zvlC4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xB/fdqBz4dgiVxwpMxCp7ZHrhCl9tjYdmYkr2QU+XS8nHtVy2tIgfphyAmBZnfZnBUl0yYPLB2eAu+4pK/ZFqZhO1bxFliaE/HYONVt1qUf7ekj6grwrEsHVUjA9yca2YZRH+zxixf4N5goPAWijdqZaxnzWLf6sVWsF6YKTsMojDK/a0efKceTl6MTIbA/4VHYkMezY2Rk0RVADsU/IF7tF8AWkeZTWEiStnvwOoao+i0iVKXaPuUk3+0COuLByDE6xqwmVzwQ0zq0YQ23DIekrH2wC8Lv4pXTZjtMR16qU2Y94DQWthWQsDpIzVbyp/vHTSrMBDoSS9Z8Rx/w5pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+iIYkFWVxOCMcuzCqHTFhoNL8aOm0kQKKJ46oVWXsXs=;
 b=vRYC3Ezhu7yyXbDKoiVU5HR/PqmKKnyjmsEpRth7JrdfJ/AgSGOj+0iQ0kPe3vNVM7KMUNw6FgikZ6F2wZov0IAct+rZ4vQJuU8/iJjrzda8hCM0twQ/Mdg9zhnT8axxVBDIoVcBCi1mW6U6I2kaVvl6ZEop+OP2D0dJEv6IV+bI3DU2eQq9ZBjPQdvlMGYGrkxR4T3B+Ltt4YwjvEP7xz36jv5zalGJ3TShOfGadsswADfTOkxFQJldUkGynZ+noB7qBkQD48dDTWgMBXytC6Jd7EwTjOQdL1tp0ql2AjdiHoSQI6jk5wDn5Fc8fp+s/eL6tnVKzhPwnz7WRbuqdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+iIYkFWVxOCMcuzCqHTFhoNL8aOm0kQKKJ46oVWXsXs=;
 b=CG+zvlC4G7L0bu3nu+6TYOo+8h986b+CnVF8fg9wMWVaPdNjew7ufoDYQgK6slDw1qvZwpyDyZTyz1854pn/spvQ1k6FYbPUuMrTZUgOaJlkulfE94cLmdSnLT5sO41t9TIukKBSdbiQMohdAhtVEvZwsw2NaTAshqLWpteN3cQ=
Received: from BLAPR05CA0023.namprd05.prod.outlook.com (2603:10b6:208:36e::25)
 by CY1PR12MB9560.namprd12.prod.outlook.com (2603:10b6:930:fd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Tue, 9 Jun 2026
 08:11:57 +0000
Received: from BN2PEPF000055DE.namprd21.prod.outlook.com
 (2603:10b6:208:36e:cafe::25) by BLAPR05CA0023.outlook.office365.com
 (2603:10b6:208:36e::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.10 via Frontend Transport; Tue, 9
 Jun 2026 08:11:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055DE.mail.protection.outlook.com (10.167.245.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.1 via Frontend Transport; Tue, 9 Jun 2026 08:11:57 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 9 Jun
 2026 03:11:54 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>,
	<Sanket.Goswami@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v7 7/7] Documentation/ABI: add testing entry for AMD PMF character device interface
Date: Tue, 9 Jun 2026 13:40:44 +0530
Message-ID: <20260609081044.2416731-8-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260609081044.2416731-1-Shyam-sundar.S-k@amd.com>
References: <20260609081044.2416731-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DE:EE_|CY1PR12MB9560:EE_
X-MS-Office365-Filtering-Correlation-Id: 019e6bfc-4e6a-4f10-22c5-08dec5fec646
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|3023799007|18002099003|22082099003|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	UhK0+qprc2A+gjffzo6+k4Py07D4Bw5BYCRB9kFXE9Uu786GpWPyviuw7/1eeN9dwBVVNY7UOBbXNyNk0kABpOtdkkiVFiIOBN8oFb1pfhl7qsip/CFf0u4HCXk/1dm/5o+aVfMa+AEnJHiidseiz2868/xQsAtTk15+ymKujkc4vV/9++JyVGaI83C8+m/6RCREDEJBkxoseuc8B4ErMdegT49K6yWaFiyyvuVm3X48hEZKWZJEyOZ6UFZI0JoSoVMolKI0Z5z20Dc+3Aw0w4NOhRPh3V/HHmZWSUgsP1azUloOafrqgbYIJ1Vo4ppSlS6Kl8y34hyod+swHx1NF5z7VAyo64NDjFmIp3JMZNb47g4L7eyLSKgmyxmrw2mlhSO3V4SUWQJ6VGACSW7Rwbin/dxj6w1GKsvOcxmoRgW3Q5L64XXpTd/IWdYFIL6JecWCNMus8Jsavvp6IbPX3PgDmuty34mb40j811shCRW8HWvIiFkVursQE9FuvWBJgqQRB8kBrFWnXlp2OwUVoWwYKngb0vqrzyB1jNYYSAho9h0q2L76F+wkRzmVyFrpVtC7eVxB6WJnfNJPInxLGBytbLpbH8IS+Gn7INrFNL38RlDB8h3/RqJGX58bFFY7HycJT0ryod22GXKSG4GieSREDk4hacdUtgLO3HG5r77M9OWROpPNHwwnGAdBEQAaSrCGicCOGhp5Z/0+yfa2KmN7sKu1a3Cm3+J1001khz0=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(3023799007)(18002099003)(22082099003)(6133799003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Xb0jE/Hdfk8fy8JinJCmggcjfIckIIMGGrfDmwbxsOM1tIfpdxLYDyM4+kBSkm+6lpkHUiH9NtT9npFYn6cxqbMQGIxNGMQRzDP/N1wijPV0wlQyMf6Q3uya/MvpKNTV9izXWp5aWIfqoYDoyrLVhjBDgFC0oHaNpOYgRTstKTzXWsyMn4MbgsnMmq1vh8h3iuMzXCLBnl1HvPdAxkXiBeH6XlHdB4KksdVwhcv8rpcccbPlaTOvZh5m2K5KWxq5QNFJDccry118RxY6YLoiJFsj9W+XydjYFTwgfXtbS5LKP2529xzAO29XyKmY63bhHDZHTD/jDV1M59OeBf7yFMSitN7hVOLvlbHCAKj8AONiAHFBFI8dDNdIT/xVJj/CF5HvDp2tYsUNaHrY3B6AtSztWz8EsggaXJ1ag13hmhgZSegRCRlXuX8oYh/txhDl
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 08:11:57.1608
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 019e6bfc-4e6a-4f10-22c5-08dec5fec646
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DE.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9560

Add a Documentation/ABI/testing entry describing the AMD PMF util layer
character device (/dev/amdpmf_interface) and the initial ioctl used to
query feature support and metrics data information. This interface is
available when CONFIG_AMD_PMF_UTIL_SUPPORT=y.

Also update the MAINTAINERS record with the new UAPI header.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 Documentation/ABI/testing/amdpmf-interface | 73 ++++++++++++++++++++++
 MAINTAINERS                                |  1 +
 2 files changed, 74 insertions(+)
 create mode 100644 Documentation/ABI/testing/amdpmf-interface

diff --git a/Documentation/ABI/testing/amdpmf-interface b/Documentation/ABI/testing/amdpmf-interface
new file mode 100644
index 000000000000..625f90a013d0
--- /dev/null
+++ b/Documentation/ABI/testing/amdpmf-interface
@@ -0,0 +1,73 @@
+What:		/dev/amdpmf_interface
+Date:		June 2026
+KernelVersion:	7.2
+Contact:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+Description:
+		The AMD Platform Management Framework (PMF) util layer exposes a
+		minimal user-space interface via a character device for feature
+		discovery and metrics monitoring.
+
+		When CONFIG_AMD_PMF_UTIL_SUPPORT is enabled, the driver creates
+		a character device:
+
+		======================
+		/dev/amdpmf_interface
+		======================
+
+		The interface supports a single ioctl:
+
+		============================ =======================================
+		IOCTL			     Usage
+		IOCTL_AMD_PMF_POPULATE_DATA  User passes a struct amd_pmf_info with
+					     the size field set to sizeof(struct
+					     amd_pmf_info). The driver returns all
+					     available metrics and feature status
+					     in the structure.
+		============================ =======================================
+
+		struct amd_pmf_info layout:
+
+		======================= ========== ================================
+		Field			Type	   Description
+		size			__u64	   Structure size for versioning
+		features_supported	__u32	   Bitmask of supported features
+		platform_type		__u32	   Platform form factor orientation
+		power_source		__u32	   AC/DC power source
+		laptop_placement	__u32	   Device placement state
+		lid_state		__u32	   Lid open/closed status
+		user_presence		__u32	   User presence detection
+		slider_position		__u32	   Current power slider position
+		skin_temp		__s32	   Skin temperature (centidegrees)
+		gfx_busy		__u32	   Graphics workload percentage
+		ambient_light		__s32	   Ambient light sensor reading
+		avg_c0_residency	__u32	   Average C0 state residency
+		max_c0_residency	__u32	   Maximum C0 state residency
+		socket_power		__u32	   Socket power consumption
+		bios_input[10]		__u32	   Custom BIOS input parameters
+		bios_output[10]		__u32	   Custom BIOS output parameters
+		======================= ========== ================================
+
+		Feature Support Flags (features_supported bitmask):
+
+		=====================================    ====  =============================
+		Flag				         Bit   Description
+		AMD_PMF_FEAT_AUTO_MODE		         0     Auto Mode feature support
+		AMD_PMF_FEAT_STATIC_POWER_SLIDER         1     Static Power Slider support
+		AMD_PMF_FEAT_POLICY_BUILDER	         2     Policy Builder (Smart PC)
+		AMD_PMF_FEAT_DYNAMIC_POWER_SLIDER_AC     3     Dynamic slider on AC
+		AMD_PMF_FEAT_DYNAMIC_POWER_SLIDER_DC     4     Dynamic slider on DC
+		=====================================    ====  =============================
+
+		Return codes:
+
+		============= ============================================================
+		Return code   Description
+		0	      Success
+		EINVAL	      Invalid size or parameter
+		EFAULT	      copy_to_user/copy_from_user failures
+		ENODEV	      PMF device not available
+		ENOTTY	      Unknown ioctl command
+		============= ============================================================
+
+		User-space tools integrating with AMD PMF to discover capabilities and
+		monitor real-time metrics for thermal and power management validation.
diff --git a/MAINTAINERS b/MAINTAINERS
index 839e39825455..ec061cd127b2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1216,6 +1216,7 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Supported
 F:	Documentation/ABI/testing/sysfs-amd-pmf
 F:	drivers/platform/x86/amd/pmf/
+F:	include/uapi/linux/amd-pmf.h
 
 AMD POWERPLAY AND SWSMU
 M:	Kenneth Feng <kenneth.feng@amd.com>
-- 
2.34.1

