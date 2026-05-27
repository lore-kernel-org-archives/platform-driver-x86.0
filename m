Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012039.outbound.protection.outlook.com [40.93.195.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9503530C15E
	for <platform-driver-x86@vger.kernel.org>; Wed, 27 May 2026 14:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779890571; cv=fail; b=A78FrawELuAS86vG27IpcQD2KnNr8Hds2xBvbGzSBMNBC1oCFX0RDPPQx8m/jUxB1glJ3AmqzFQM9uXXdq0QxzUqqAemKnNWVjvHGs4PxHU6TadgtlcZ8pxoarXcYkvT3PmBMcXyi44mDSUO03bs1kRXU4TULYEcyzZtIZKiSOs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779890571; c=relaxed/simple;
	bh=42HXbn5j3kxhSInD10ebBHrkXWBJLKqjjp/cRvLQ5Ok=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SogGYOwtYO+NsnqXRNWvhOLBqMvVi92rlwVwL6u3FPaWfrcKQ6my3+QdYQiTENQYV34mBaNyAPC3vFDiF4VoK4zUPxDAO28DdYZTeshlakEZDcQoxUpeVKY1r2AgfpZ+WbyQP3jbycM2wRtCNbLhmWGXgeCy3PfJ031z6Rw+tmE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=im0nLZpk; arc=fail smtp.client-ip=40.93.195.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="im0nLZpk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VXNLxZlSKjj/JYH7LqbXv6Of4w61du0iJvsqpIz4JiBOCLx/ZsUD+HzqSLtcCRs0QfRtoAcLAMAarea/OxSAsUPWbljGTTFIxGGIyHdivqk1b75wfz8i3pEBAyLgX6llrjuoyYhB19zH2s7eIau9LucuoaXNT4Je/dLPGYJfgioBzYWsL8qI2Aid6DRCbdBA+8sgyeuwVEJ+R2gKJbrRYpL9OpDCrDr809lmtxnYgx997uR2DV/KllT95LKV9sRDcO7XXEWLMhG9LY4Zws5ucot4ZLDGJICaxCX9b4jC06e/vtNFljwmCeJaBnrWrAPZmtGPCk/qA5P/DuuviMalig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+iIYkFWVxOCMcuzCqHTFhoNL8aOm0kQKKJ46oVWXsXs=;
 b=sKKsWOeXPQswz6WvtaEf97eBYp3EQHLMRylf4PBNHrlIIIkmmFqdVMI08N6SzMod6aO/aBJnZVcvyw6iQpKavvkfJImVJdmJ7jEQZq2WtU+PhfYlz6gPNF2cJ8K9cq5JDc2+tGbutpHmttqGmxsLsG19zKVOB1olz8W1hQkdK7vGhEwS5Kry6uFlH6gfj53lnU3bvLFPsM88/etITT5EezHhZN2e4TSSYzXm/CYHUhNUjEl4udjrivFpqsTQfbQfmyNav54IOeMfc0isWe0tzIaCQ/1NEks5iv8XcG2NQw1RYxC/KRRBP/YVYThX8L/nwbXq+6zpx/VkgJEkRehNZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+iIYkFWVxOCMcuzCqHTFhoNL8aOm0kQKKJ46oVWXsXs=;
 b=im0nLZpkIJunyGKO+wDbtA1Xh5t4+EDL/Ee6D1ryjwUdEjrcwMRsT+ViVfTfeTnbxl5qw1bYvi+xsP8I47QF9w03LduMDPDdZlYFJcm9DmYltACK0c+sVVsF2PBuF3rnZrkb1eOiWqevNcMi75M14pEmgnuzwee7owQ+5pFQX2M=
Received: from MN0PR05CA0022.namprd05.prod.outlook.com (2603:10b6:208:52c::22)
 by PH7PR12MB9174.namprd12.prod.outlook.com (2603:10b6:510:2ed::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Wed, 27 May
 2026 14:02:43 +0000
Received: from BL02EPF0001A108.namprd05.prod.outlook.com
 (2603:10b6:208:52c:cafe::7d) by MN0PR05CA0022.outlook.office365.com
 (2603:10b6:208:52c::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.4 via Frontend Transport; Wed, 27
 May 2026 14:02:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL02EPF0001A108.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Wed, 27 May 2026 14:02:42 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 27 May
 2026 09:02:41 -0500
Received: from airavat.amd.com (10.180.168.240) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 27 May
 2026 07:02:39 -0700
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>,
	<Sanket.Goswami@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v6 8/8] Documentation/ABI: add testing entry for AMD PMF character device interface
Date: Wed, 27 May 2026 19:32:05 +0530
Message-ID: <20260527140205.4073335-9-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260527140205.4073335-1-Shyam-sundar.S-k@amd.com>
References: <20260527140205.4073335-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A108:EE_|PH7PR12MB9174:EE_
X-MS-Office365-Filtering-Correlation-Id: 959ccf6a-df87-4064-578a-08debbf89ea6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|22082099003|18002099003|11063799006|6133799003|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info:
	DbPdKcBgwKLgtHgdKqy4dHOI1u8Fk9b+lUIy9kslndVROBFL7BpMennGPDIfMATZ5jUHY3GIrv6QL7ue6LvneQC4n30urL96S1EECwKjEL1EFYlgn3QAnk5gcEh1+6KtpaiAUfWpkmXiMneT8/x+ASnQEN8pgTfwqokR5BU7pMK44aTHYab/iwvVAbeclDDqHn9foJnqgHAZUJ04Lv/z2wcwsbhGkMI8CD6hf9AqVQ517EmQC/dcCJaKVrQNEE3F0T7oSBR3vwqWAy4mSM/GQra/b9Bf0exnGy+ZNChBErwHiSPqWNMhLKyJAMsIPiHsLhg2gzI0Sgp1Z6blQNkJSWoJ6J6yCunXJyajz7sTtPrji+niNV3ZsIM8vFh8ZCdyH2HlTVMvxGiuAdyJFOkchR3m4WheAXryKgshroXByaApR1EgeKfoqi2ovAcpcueklYrK1SFQcQNKwCl5le09l1l7QiDoywBov8ovafH1FHwmxDO6KF5nPnf69sMzt5+LgPAPIu77RfXaSQFklweHzYlQ9dPeKYgFM4GNO0/CgaXcn97ugz+Il7kUoazopPahlo46F9qgyxw9y2lgwC6fyb9cpEkGPivIq5O3GbToECq4CmVJcnI7RyBbkiama2LjlPDNBEccvpftOKHYaZv6bl1IRNVMk60yZPF4eJlgCmm+DtP8uVVpt9XYEH36wISLmZVzKchS4dhopArSEGNd8lSyHCdp7+OECEHutmakM68=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(22082099003)(18002099003)(11063799006)(6133799003)(3023799007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZfNq1Cfsr8C/RHWnkI+0YUuMUtcrT5t1NV7Fy4hPYpw1MY82MUtCF3c6uwr+3q1QtKLxJJ/UlDWQbMK9OdvRK7wqijQfjDsCA96gXScnekd02Vnp3OH6oQBciwXlCK3THXa9wMKLyFNz6x6uOWTZEBrG2V8m0golxIdKtoZobg6NzXyS+yxz+eTLj+rqhs7wjQwtgRnxBQF0xYLi7i27KskAp1bZ0d7v1aVt0BkG5q5izJDVP19Lrj00yiweGdpYaSk1PUUCRI/d5ZrhjCpcTKWPWJTnp+MB8rXN9AwJt2Ex6qMSQaIWtArbpWD6s/+LyJvBwyXxzDyLfhlsYgBTxOMlzXk2uyJKSXl6hCQ4WGB57Jvx5oWDft+E4Bg/D+dXCrvV+Yh+w8BSE1BWux8w+UGu8cfaFG1F8fWctlI6w+Z7V+lLfL9uhv0ZtiqgPxvl
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 14:02:42.0685
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 959ccf6a-df87-4064-578a-08debbf89ea6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A108.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9174

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

