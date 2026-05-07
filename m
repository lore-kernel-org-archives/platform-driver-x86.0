Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011059.outbound.protection.outlook.com [52.101.52.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E139402BBE
	for <platform-driver-x86@vger.kernel.org>; Thu,  7 May 2026 14:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778165167; cv=fail; b=Ygp4y3VtI0VuCE6MA1rMG01sb/cQ4KPbAod+Xz3yKhfaRDLPzbXyXQyzjoyc5xaukn68jv9FPmjOLj9uN9y/Irpe05o2CLzUlL8pVKfkAKXz/AAYaDO/JEXhIxpj9pheXAiqTwclDAbGWVK++5Dr8xXbBfU/pyhgEbPy46+ji/w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778165167; c=relaxed/simple;
	bh=O3rnvQefCNof+qM1nkBsPe3A4ZUeKhHqZntZwa6wa5Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=So5h8lJmdDbIacs3TsDVQzweaZ6TQEnzdGzpMOeB5LK5uWrJ3SSB41J4ypGjiw8PCnIdXAn7xHQBd/w3b6fnrbznSFCQHpBY1bZ/cU3pvcvQn/Abp4gkHpSa+HHw9TElFkr6XSyV4xWxGQLklss/SFmAiPtixOthFueqwLte7Co=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=wj3wnSoz; arc=fail smtp.client-ip=52.101.52.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="wj3wnSoz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dU9KzSY9Z6/vuX4Ncdnl7ac4w1RRQDaShvCPhRbXQi/bjZ03IpfdR8BgWoyHSZ/qDVRDDHlOnmHYqH2KAVo9dXkyl0eLrECV9WOzhPbtxwOnRPSWN47XNyuRXpd9WQYtgSHie4EezI/SANCr8tpb0M7Z9K18rM67p/rCimkD9Mw8hjKQAXWCKLlwZN38yXEoRRFPQfwp3KssXKKCHxSk95dPpfEfvQ0V3PzlAcMjrnXc7AFAmx5J6BbosEMA+nOPU+naXUluGXQIUCrQ/zuYhW4BIy5SmxTKCQdNA8Juyhk0YYgsMMjX3Iwnqm6tH0rZkEoIviOb7lxZ/Nc+/Su5mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OTNz9n0gL4fWRZxE/sfGKQodVbFZ5SWaPRhch9RqlL8=;
 b=RREdLv3v9l2EfakY5F1yhReyRWu4pWurYZ7Ve4+kdhd6Z3wr9uiKXIzGv7wFM9mrwtGqll+j8eJu3iR+nLOBHJwmtFje7R//icffICoXAwGHF60IAK0UctVXYFUXd9aLEEqLL9cgCwYJkOMULbLItrDVkYys+gMRZwkdod0y1n1VTsyNpfhd4zp3l152iTQCfyVf5ifdB66eVYgpt3h8+MBAh+l4zJf2lDbDkDLz5JJwmLtA/tO46ExjXBO0YFIcsaXs4Hj+OQt4ecUPnrwKGj2oAwH2ZmUgV/CRCxCE7ik//UtnXPJTAR9YsLd5Fb4x4uA8xjlCkfqfF5xhnyqNjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OTNz9n0gL4fWRZxE/sfGKQodVbFZ5SWaPRhch9RqlL8=;
 b=wj3wnSozHwvnjmMo43kc4fILLy9b+E2P+dCHlgOkCXck9kIKktoqgWmoa1tNZXrgy5wtlfKjit4VA6SUi3pueTGFyA13fYiYBUrIWmfWdhGN66wYZoGlPW9chuL3slPwvdcgEkOehBkT5RLTv8EmwdcBba6aEFheR/OwNycPfCY=
Received: from BN9PR03CA0574.namprd03.prod.outlook.com (2603:10b6:408:10d::9)
 by DM6PR12MB4331.namprd12.prod.outlook.com (2603:10b6:5:21a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Thu, 7 May
 2026 14:45:59 +0000
Received: from BL02EPF0002992B.namprd02.prod.outlook.com
 (2603:10b6:408:10d:cafe::8b) by BN9PR03CA0574.outlook.office365.com
 (2603:10b6:408:10d::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.16 via Frontend Transport; Thu,
 7 May 2026 14:45:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0002992B.mail.protection.outlook.com (10.167.249.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Thu, 7 May 2026 14:45:59 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 7 May
 2026 09:45:54 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>,
	<Sanket.Goswami@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v4 7/7] Documentation/ABI: add testing entry for AMD PMF character device interface
Date: Thu, 7 May 2026 20:15:24 +0530
Message-ID: <20260507144524.664001-8-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260507144524.664001-1-Shyam-sundar.S-k@amd.com>
References: <20260507144524.664001-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0002992B:EE_|DM6PR12MB4331:EE_
X-MS-Office365-Filtering-Correlation-Id: 85f60645-ef22-4b1b-6961-08deac475a5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|22082099003|56012099003|3023799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ccrqI2cmM0Evdopy+cKyHEvCL3eSLWd1y6jk3TaFIT4gjNLMCvf6+20PueqIrC56xfV52jvYiJBf7iSeD6KGTTSL7HuSGkTeBF7lVvdpmuxrcMpUsVxW/XuOIBO6mKUUOWNRd3HNigfg0vSI6zvZx0aVVAs7xsT3u3uX3L9Gh+ryJkvzgWts8GB63EKpKKIe8P/9At+qd0DL5ov7AJgUydkU1xJaItYln+3VDiPS2UPl64WoZNCIQsxBqLZACQDfRT46hJ5lR8yZMo8q146Ppu7Nk9Puri6znO4fC9nnchi01e45isL6vwGeum7REm9GYIFNxfuZ8PAD716vlyS30On+lNWYz+4AxglYg5HrBG83YiePsWpJhxAa7BPbVgHRK8tj2SkkOoR47kDahIGnj/6tsvpEU4UeZJkfKkBqTGGXjMiwEYTGcbDg0Gy8/yAi7+Wd5KQviDnSiSyfvrHSfA+MK8uqxQE1UvDbUdFq91d7wSRyJv7PME/3ZJepXU97LAV9GqJzsmEzKztshYBuL+ivy3Le39/o/X9JHso1BX981NymCQUA5CsKOLqkqVkMmQMp1hdJtftEDKqjVMcipyNEhZBebGQZ9vRfZpedzvh9HdfTyl/Z3D/XhVuXvcYM9an+XTzRv8k6/vI7vQicQqYhapeTCMQu/BiEtNj+Z209fcmeoubJkYa3NzYN8FLChC8L0l9pObj48ls7Mvpdy2Q6HVZ7j4Kc3mFawgud6Iw=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(22082099003)(56012099003)(3023799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YQSnl36vVmGK4WLc243wXBLLepm3MojEGKVGut6gENqi/TzbF1Yw2sUmJOCjnVhM2DsTCnBgZAvPyr2VISD4ps8zcAOX3EES/8RVclOXgaid/osN6SnojPMyRoHkqkt6WHhY+nG3DuThXS2okIs5RtimYYxjPS2uqBiDwb+bRgiIbu8xR7WHIR4ayUhCs9DuDOWIySk9QVqflj2UIUWbEIVeJUis+8Y1vyDWIi5HGCkimHOphLob8yr3XGty3ZBUkuOzlaBToYsgAkGeK9oPswch0K2NWwkiEuKfW71fKdmZYmq1d2cr4Jv9WMn7fU0XjXpn1nQk7w6xoP2H5ZSONrPdZv9Xl6ltvw46aup5mX5mFiYBa9mPOsmyTUiz4JC3gQDsuFDhCqFKllKBpRBHQcQFc9y9cTqatzpe75CAVFOF9RC8vMOubESacKb/6QQX
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 14:45:59.1276
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85f60645-ef22-4b1b-6961-08deac475a5a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4331

Add a Documentation/ABI/testing entry describing the AMD PMF util layer
character device (/dev/amdpmf_interface) and the initial ioctls used to
query feature support and metrics data information. This interface is
available when CONFIG_AMD_PMF_UTIL_SUPPORT=y.

Also update the MAINTAINERS record with the new UAPI header.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 Documentation/ABI/testing/amdpmf-interface | 75 ++++++++++++++++++++++
 MAINTAINERS                                |  1 +
 2 files changed, 76 insertions(+)
 create mode 100644 Documentation/ABI/testing/amdpmf-interface

diff --git a/Documentation/ABI/testing/amdpmf-interface b/Documentation/ABI/testing/amdpmf-interface
new file mode 100644
index 000000000000..348819bbd6f5
--- /dev/null
+++ b/Documentation/ABI/testing/amdpmf-interface
@@ -0,0 +1,75 @@
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
+		features_version	__u32	   IOCTL interface version
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
+		rsvd[8]			__u32	   Reserved for future expansion
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
index 2fb1c75afd16..a7ddbff7f635 100644
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

