Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012071.outbound.protection.outlook.com [40.93.195.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242823290C9
	for <platform-driver-x86@vger.kernel.org>; Sun,  1 Mar 2026 13:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772370731; cv=fail; b=rIjuxdOw6Z+pSdcdoezT8OTzeIfsw2OIny3Kt820IVv+2+X1I6Wa2yEddSoqykCK+H4yb8Y0tt6R3p2aLTJzwqMkcNbrA/HBvoLXJF4XbcPuAmLamKyRDMKy4dprpWnRH81ZY1LI/TLjEHJ5u0jH3dr33I8dEP6P7hSgoreUjaQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772370731; c=relaxed/simple;
	bh=Oqe7G/zzOokumAVgsZGLMYKSF/RUtPwLGqMW/kBASwc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kRux9mUE9RKKxzPD5TyqUAoAKVVmY1AJ9TzFWDOE5AGo4UsQ/20WoXFZ8/Y0Yr+cP9kq6+eRKh87GEURaJXD8MLo7ajY8o47oRb9ZKSpOWG3c+n+UGDPGTvvn+CWcfKCGP+ubtjjJEUDHuLiWSovyzorOxBT+amdziGRBBPMbus=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=3V2eGBmf; arc=fail smtp.client-ip=40.93.195.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="3V2eGBmf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wrGNwQRoTfevjDM0z+G6WTt6EIsg7fRR2Eq2Vsa9RXSMN82PD5lmldifmJRNuvUf8wOxgP9RJ17jzEVIYcwEw4iRH3D4MuWAmFEoP7R6Xgo63X2FipzGuYJHjZW9ZuEcGbU21ZecJr3ib+XriDROupj/PXkrbBAnszPBHgZArjdAQ0FxsDGZMGC5A3zecTgiamLL1Hrk4rH065VTOdz4Narq5SW7hOiT9YZSJakarY69qqW5x+JtDuDYsnvkTXZItdxsMfBc2s46qzzT8WbqIR5YueK19UEEa21SZQ4bvhyiZvwTK2LjoG+0YvV+CYwp9gEPvkfCXdAvZJ9OTXVjKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ky2C8Eu4fsFYiw9UbCzN1wkTVrfZfuX9sZII8iGgtc=;
 b=wzJUyjvRPk4gwT3Sw7dLCWgmwFr31kzMumieJuP2T/fC3rV+PVDQI0zQWO/eET7qH5lNg++L5jHN8RSSAMwUU4md37S2HKEx5Nt2ewqljnS7no3IpDdmspd/LnplRbhN3cSBMQXTTZpQfYyEQDVtyOvSim8if64/zxbw/YmpcIik3bWkNo0O3gE41Zu9PkjgxTQ8PXTqY2zIyeNsVzMSGG9m2NRUKvbpD8pyp1lkQXFTV354u1ZJUb38RKaIBTjDH0TaZxE0NmCyPkXuGOix4iRNwEKLpf4LRU1+MMZgNuTjEerTONu50mYp/6O5oHEk+tDaVwDmYMQFwjgb2hSDCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ky2C8Eu4fsFYiw9UbCzN1wkTVrfZfuX9sZII8iGgtc=;
 b=3V2eGBmfNOJzd80T1kyQhG7dJZS86W50U1ozyV5PVsLZr6tAvs4rs7OULKkFbGflE/C8L/DsUUDkcDlF23+rN410/v1KQS26TcbB2uj1PC0QPDrPX3YexXdcUymQKPZA4aqPLikRuJo6WmXEi23+lqjDNA0i/3tU6IWlc6Hw8YY=
Received: from BN9PR03CA0097.namprd03.prod.outlook.com (2603:10b6:408:fd::12)
 by DS0PR12MB6632.namprd12.prod.outlook.com (2603:10b6:8:d0::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.19; Sun, 1 Mar 2026 13:12:06 +0000
Received: from BN2PEPF00004FBD.namprd04.prod.outlook.com
 (2603:10b6:408:fd:cafe::6f) by BN9PR03CA0097.outlook.office365.com
 (2603:10b6:408:fd::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.18 via Frontend Transport; Sun,
 1 Mar 2026 13:12:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF00004FBD.mail.protection.outlook.com (10.167.243.183) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Sun, 1 Mar 2026 13:12:06 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sun, 1 Mar
 2026 07:12:03 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>,
	<Yijun.Shen@Dell.com>, <Sanket.Goswami@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 7/7] Documentation/ABI: add testing entry for AMD PMF misc device interface
Date: Sun, 1 Mar 2026 18:41:24 +0530
Message-ID: <20260301131124.1370565-8-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260301131124.1370565-1-Shyam-sundar.S-k@amd.com>
References: <20260301131124.1370565-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBD:EE_|DS0PR12MB6632:EE_
X-MS-Office365-Filtering-Correlation-Id: f269ed37-b197-4d97-f197-08de77942320
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	bLNaAXMqvVViYXNZmWdZBKt5S3D7O2pKcmz6QbRtI8xWR8D95wr2rcYvaDYtfUtsI+QrdOpkIo7mLgFoBe3t8DagHt+4Iq+lQiTo9OJOFz2qGr4tp0uZFMUYvs1Hpzc9q9sR1qntZ+jUAPYCNm7VNn2ICJOIIcuMeeI7dSWU04on2QyLy6xLcnRTPDcVTA60xVYCQa/3O2/uxmCHNcq1+I0SF4geXdWmFm7s3FvmNjhPpk6SrhCsPpPyNl9I5g2aaNr8w3HcaseF27msn8GEuFTAEZdaQPZw3BrZRIL34TYdeJUEe95moSy4Nbl85cCm+lcCQEBp/bVg4Qw5xohXhzy2XCUBDbDaFCSRJgcxqe7/f9/Egbl1qf3nGeOSewjiKMsJyZiqJjwoQka3jqadkevoezFLMa6zZDGyJH2eF1w1g6luMvTKKzAWgyNy8UUE8Yzl4sVvNeVbvvLHfxQRrFQrQF5+oTkRBNd7lDpyMJCXuJqeNkY370nzuGGekkux2KKGXjWER3wFJtmoFjNwxPh0jXxqvF58yW+17hvUzf344botkTA844XOhjNk5PTa3L8uDBqgXOSsqyWwYZk3VBOPofuGbMrT7Vt727FbHaJS9Wr+AbkCXFwf4NOdoPwQW7F2UODzB00BYp0ZHAtK1ZVjpO9IMoziiGFFzWIOFQZwoj+rEdbE623/1w2VKLOV3ZF40P8FJBKPH8kj7p+DQhUXKtS1bhQXqZR13E+xMvM+sqnKKWPbOQAHPSVyngpgTB6dRp9rSdZ1YSsiPzy5VUFlC01rEIoKQQ3Wsg4lL060w4+EN/gaSCIv2Tt/XbYN4FtkiIQKqUnbzsuw4SCiqA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	aHISPtXLN5YE94BEn9eblhFALMW4dp0MEVPo4t2XYcuhZcn1IfzrU61TtR2JOpU5eKaPkoNElgLSrhzDIrVMQ3Ku0pnTKsvEFjoceTaLzQ4OfmLG1JrHWqJjiqknYYdyf/PlJH/TlFxnlor6dBAHLDm11lyAcoLmRkpUGSlK4kp1D6XGuA3bl3LOBU6HIUBB8ynsRbHe2vfh+Mmf7VFwqgxkvHnSepWof2s5nHsjrVbYjQpb4sN7IK68Bg3Hdrrf+/od+GvPKVTEamy2/6nYWezSogZ1E2M3CIRt8QrLo0wgDbIsKXQan50L3XuCpZ59TkIZPjPDG8g2TkdvBPIaCC2HdkekeSxae35sY9pxEGubaie2wiLeJ/1ypTa5ZgWGhR7OPqG0+jAjFpjEVWWZP3ldDIysczCyFT9za2IocaFUSqF+L1doRiesM4v2rhg6
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2026 13:12:06.0994
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f269ed37-b197-4d97-f197-08de77942320
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6632

Add a Documentation/ABI/testing entry describing the AMD PMF util layer
misc device (/dev/amdpmf_interface) and the initial ioctls used to query
feature support and metrics data information. This interface is available
when CONFIG_AMD_PMF_UTIL_SUPPORT=y.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 .../ABI/testing/misc-amdpmf_interface         | 70 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 71 insertions(+)
 create mode 100644 Documentation/ABI/testing/misc-amdpmf_interface

diff --git a/Documentation/ABI/testing/misc-amdpmf_interface b/Documentation/ABI/testing/misc-amdpmf_interface
new file mode 100644
index 000000000000..62b0175e1345
--- /dev/null
+++ b/Documentation/ABI/testing/misc-amdpmf_interface
@@ -0,0 +1,70 @@
+What:		/dev/amdpmf_interface
+Date:		February 2026
+KernelVersion:	7.1
+Contact:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+Description:
+		The AMD Platform Management Framework (PMF) util layer exposes a
+		minimal user-space interface via a misc character device for
+		feature discovery and metrics monitoring.
+
+		When CONFIG_AMD_PMF_UTIL_SUPPORT is enabled, the driver creates
+		a character device:
+
+		======================
+		/dev/amdpmf_interface
+		======================
+
+		The interface currently supports following ioctls:
+
+		======================== =========================================
+		IOCTL			 Usage
+		IOCTL_PMF_POPULATE_DATA	 User passes a struct amd_pmf_ioctl_info
+					 with control_code set to the desired
+					 metric or feature ID. The driver returns
+					 the requested data in val, or feature
+					 support status in feature_supported.
+		======================== =========================================
+
+		Following are the control codes supported (enum pmf_ioctl_id):
+
+		============== ================================================================
+		Control Code	Description
+		0		IOCTL_POWER_SOURCE: AC/DC power source
+		1		IOCTL_POWER_SLIDER_POSITION: Current power slider
+		2		IOCTL_PLATFORM_TYPE: Platform form factor
+		3		IOCTL_LAPTOP_PLACEMENT: Device placement (on table/lap/bag)
+		4		IOCTL_LID_STATE: Lid open/closed status
+		6		IOCTL_SKIN_TEMP: Skin temperature (degrees Celsius)
+		7		IOCTL_USER_PRESENCE: User presence detection
+		10-19		IOCTL_BIOS_INPUT_1 to IOCTL_BIOS_INPUT_10: Custom BIOS inputs
+		20		IOCTL_GFX_WORKLOAD: Graphics workload percentage
+		29		IOCTL_AMBIENT_LIGHT: Ambient light sensor reading
+		36		IOCTL_AVG_C0_RES: Average C0 state residency
+		37		IOCTL_MAX_C0_RES: Maximum C0 state residency
+		50		IOCTL_SOCKET_POWER: Socket power consumption
+		52-61		IOCTL_BIOS_OUTPUT_1 to IOCTL_BIOS_OUTPUT_10: BIOS output values
+		============== ================================================================
+
+		Feature Discovery:
+
+		============== =============================================================
+		Control Code	Description
+		62		IOCTL_FEATURE_AUTO_MODE: Auto Mode feature support
+		63		IOCTL_FEATURE_STATIC_POWER_SLIDER: Static Power Slider
+		64		IOCTL_FEATURE_POLICY_BUILDER: Policy Builder (Smart PC)
+		65		IOCTL_FEATURE_DYNAMIC_POWER_SLIDER_AC: Dynamic slider on AC
+		66		IOCTL_FEATURE_DYNAMIC_POWER_SLIDER_DC: Dynamic slider on DC
+		============== =============================================================
+
+		Following are the return codes:
+
+		============= ============================================================
+		Return code	Description
+		0		success
+		EINVAL		control_code is not recognized or handle is not available
+		EFAULT		copy_to_user/copy_from_user failures
+		ENODEV		PMF device not available
+		============= ============================================================
+
+		User-space tools integrating with AMD PMF to discover capabilities and
+		monitor real-time metrics for thermal and power management validation.
diff --git a/MAINTAINERS b/MAINTAINERS
index 55af015174a5..78773373172c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1224,6 +1224,7 @@ AMD PMF DRIVER
 M:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
 L:	platform-driver-x86@vger.kernel.org
 S:	Supported
+F:	Documentation/ABI/testing/misc-amdpmf_interface
 F:	Documentation/ABI/testing/sysfs-amd-pmf
 F:	drivers/platform/x86/amd/pmf/
 
-- 
2.34.1

