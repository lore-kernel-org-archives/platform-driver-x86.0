Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011049.outbound.protection.outlook.com [52.101.62.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45D33FCB0C
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 May 2026 18:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779303369; cv=fail; b=IVdqwWBHOrGV+JYG/ZQVouLrQV1gBZAiqid5pSjEjn+AVHCw16DU/4AzA1/uT5G0Jc6pGTLL5DdIs/wEzuSBXKmKjD1qdTRNQVnm4LeDkItzGShEcRqynIyNVlqoaBA06oif7YNMdIx83Wpjzwo37i2iI7g1UJjObQ9CfwIG/3o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779303369; c=relaxed/simple;
	bh=CqdHzySaoLl5dRneQRXMZL2cTUpKTHJUhvIdtKntR4U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s17BOOUvoDu4qBpEcIt57KGiqBiNMiVCGOBy61Z8/EgjnoFkvyMvXjlYvCPqVykj8Gd51zggtcthbwoAMjJ4Ca+zr7rDNwMZ1dlpxHRhh/XTguktQBpWzSVDlM4Lvyf7G4y2HgNbBMTgIKuFpWg++nfxZBhnKGcMHRkyfV7CUAE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ypIN7UUP; arc=fail smtp.client-ip=52.101.62.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ypIN7UUP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NOrDH2+n8Tdj1vFX/inv7aWfemBg0F2PfBJxzIZ+1pnK2Fh5gF1RqI/mEq+iLy4WJLy5dfkm7jZCG1Y2pfYCnulog7wy7RBeeWtuJw6kgBcIhpSnnKxdhEebRlKOnKj+7yyV/0XyqOpb5h1iww+U4JPpsH0inDENhcOPgpkxkqirGT8V2Dip3mGlhUvRFTg4SWg0lDqWYGiO6LEHLR0UKMBj1Kv9Cl/AoZT0cxM2vIO341bweGrZDERLGBPwlbPZE8tt1toF1rGr3uq1U1GA3nJzLBO1+FEjdlyLcvt2w0nUZzDKUKcJ72ghY8mc+exRh/wBxk5wbWKrNrn8ut+uWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4FSiMmMke7RexqOOoHPdVOePqqma2/qFEF/Qq+yEV10=;
 b=Hk2D+IgH8bY2jm/ng5Jh2elJOxlvh2evRDiZ8yH7JIBOv0SMFYTw9ErBcWMkn8SFt3bUkqQWpUk9Ix602S6ELBxLQ7umHPWwEtB/fRRRiugIpUSRx2R6elZptXVOm1McqMpH3vtirUBuKbPZNJDuFgMs6rHSCpcBeIprb46PZLNIXbeZ19tgPBh9cE6lwdzWnNcdARfC51X6CCD/vKeC1C8/U9LnCsODCx9YYU2r7PoXRw1eR99JZWnssTjka/gBneTyMPf7ce9q3gsMJTvymujebUUqTPBahAbEMuY/5WXg4AzVlTByasq6MOH7RF9/Kh5Q2Yx1TZPl0cgQT5E3Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4FSiMmMke7RexqOOoHPdVOePqqma2/qFEF/Qq+yEV10=;
 b=ypIN7UUPu5sP8zlepMzNcxKFt5BwoXPScLlZ6AUZTXzaTwXvZVAglpLf+j/YUE5XpdK0uvkvyb2YQW5L1ACsLrINw7q1k8HwQrSgWMNsV/Zwoyrf0RV2JUGXDqHgq/u/2dzDEsm3fCypgKNIkY3dCva5SZXx15VXXCTfCfYCMM0=
Received: from DS7PR03CA0257.namprd03.prod.outlook.com (2603:10b6:5:3b3::22)
 by PH8PR12MB7181.namprd12.prod.outlook.com (2603:10b6:510:22a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.20; Wed, 20 May
 2026 18:56:03 +0000
Received: from CY4PEPF0000EDD4.namprd03.prod.outlook.com
 (2603:10b6:5:3b3:cafe::f4) by DS7PR03CA0257.outlook.office365.com
 (2603:10b6:5:3b3::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.14 via Frontend Transport; Wed, 20
 May 2026 18:56:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EDD4.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Wed, 20 May 2026 18:56:03 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 20 May
 2026 13:56:00 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>,
	<Sanket.Goswami@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v5 8/8] Documentation/ABI: add testing entry for AMD PMF character device interface
Date: Thu, 21 May 2026 00:24:24 +0530
Message-ID: <20260520185424.770772-9-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260520185424.770772-1-Shyam-sundar.S-k@amd.com>
References: <20260520185424.770772-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD4:EE_|PH8PR12MB7181:EE_
X-MS-Office365-Filtering-Correlation-Id: a46ea112-6717-4a5c-cd3a-08deb6a170d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|18002099003|56012099003|22082099003|6133799003|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info:
	HV+T93QwXT3j0DRWRd/g8ysxCPqZkyJd9+q8I/Z2pmPlENuAfrVBrCqp8vu9UWAwgn/A4yy9AXYvfoX+/IzfUtGn7btMRCWVad4Ve/vpom51QtI3kWS/fyirGoHT3id3OgV/5kD8Hc2UqmqWgjHP/8FEoRpbMfwZP53O+OSV35axxDyKI2WKwoSmPj7++uYlfyuFCzWCszmWQ+JzDZ6jhLz+FdneucGIxR4akajEGXzo4EfEoYLgA+A8c746WwrgKSinWBs82dWzsFJTaTkmMidcOlLtymhcYwi62kE9E3u0UHXx4PZ7kNmckb7JKVAyoZr2blRPTQHy4kTeDc8ePAaOk+DcPT3T7YMdtbV9VHzIAeVOcPafRk0sRQataXFOi4KSBM4iwMn/mQgyd4kB5Jv3y2XJfq41rmsefeOD/TgUwnz8hHXof266sLN+xK23Wt5o6SCidF2ffF3rKD5hT+cg3jHd8h4TUgZHODsBPZF4ga1MLd9Uvz9JrjJvdCyzD/H8iaLyMCB+WSByrplPskXMvJETVjwgwVOO9n1vCj1Cz+edwg7CuQM9CzWikmWVh5eyIWnXP9HoXxH4yrSZ7IM8D4dndwV9GEI/sw6MNYJXLUK2S+OIzMLqzYAa1GJnuHgzC5NjShrKq1F8pG8P1rm0K4aUG5xqhC6Q8vDrd0Yn4ofLbEHTm23G4dJ9D+PRVSz9SSqiXBjhrJUDNz3r8FWqk8YsHDdbW5mkzRVmvBY=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(18002099003)(56012099003)(22082099003)(6133799003)(11063799006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kF33jsxrPblNg0WytCv8TdgYWizt7Xn0xvHERfJilk7/uTqwaDw/xtpz0KC6MSESUWpy+mf71zsb7fijHyXbSXLS6UBY5R7QpTByVZLQa/273cxCDbjfraU5fx8DzBbDEidB/T2xjByb0QeuP5l4CE20GVT0s0fP3dXDsRZ1ZqEW9CS+zbwzSkD9RABYh51qOeQkqfAqkDen2tt1PQKs+tG3nVSx9MaMcXnZSS9jr5zxtU4/hVeb4I4EAU/JNVbkoTu0MRmQY1fzqeV4K6Pn/Va0iR717bgpdZ0U9u32Zjtmu2kvKTaOGFUpZUiCZBcB40h0EJWeR/LHOK7x0jqD6rRR5Fa6JjiZUPf6ULH5xONHHzsA45ZpjonGThjD6bTkiHiHE4dn5DNLREvp5eV3CtzcsFXyeASLfvC/oWHWqvRo6ce5wUthNz4kF0UGhUTc
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 18:56:03.1634
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a46ea112-6717-4a5c-cd3a-08deb6a170d9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7181

Add a Documentation/ABI/testing entry describing the AMD PMF util layer
character device (/dev/amdpmf_interface) and the initial ioctls used to
query feature support and metrics data information. This interface is
available when CONFIG_AMD_PMF_UTIL_SUPPORT=y.

Also update the MAINTAINERS record with the new UAPI header.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 Documentation/ABI/testing/amdpmf-interface | 74 ++++++++++++++++++++++
 MAINTAINERS                                |  1 +
 2 files changed, 75 insertions(+)
 create mode 100644 Documentation/ABI/testing/amdpmf-interface

diff --git a/Documentation/ABI/testing/amdpmf-interface b/Documentation/ABI/testing/amdpmf-interface
new file mode 100644
index 000000000000..45606907f7e6
--- /dev/null
+++ b/Documentation/ABI/testing/amdpmf-interface
@@ -0,0 +1,74 @@
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

