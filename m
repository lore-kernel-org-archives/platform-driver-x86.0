Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2040.outbound.protection.outlook.com [40.107.244.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA7522A801
	for <platform-driver-x86@vger.kernel.org>; Tue, 18 Feb 2025 12:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739882374; cv=fail; b=nOaJOojy6miSgzLgWqku2ndQPYkQq6TQSbG9gmuA9pgMF/eYN/wHlv2C9AOvsTOOpvas8oTTo1JSPANIwlbqr+89TJFBsH3lG25J0XtBialbVCyX2dw0UB4JY9f0tl+NweeSY7hAr0e0az2L76ubF2ghB5v58swh+B6GCPQwJTg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739882374; c=relaxed/simple;
	bh=V7P63T00fKMf32C5o5OLadgkUsAM8TmKfrFf57c7ul8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YuProhdgHs4pCo0DTeSkwmEuUPFIwvOr7SXo8wWxWmM/iGoHCFEyccbSUb2oLhgP8eXh3niLmhAqKWtPSUbg4YagtSO019GgWq2tXzEAs7+sD3XzgsZet2+OTAiuTtEf/vYxSBQYSzocAlpqAfXC/8Q3Lgz7ZtdoZ9NYYgpxM8E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=EQDEZ3Z/; arc=fail smtp.client-ip=40.107.244.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="EQDEZ3Z/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ks6/MzsOOutesKmULNut9oNI0bfqks3H60F63hO582AtfLwLauRzuA3A4Unc+XpG1CVpkhHPkkhqyxt/x0b4iEhRuX2ogOuxhfzOSAGveUnJhXVvkDiWOu2keCSW+ULYNQYcOPxogVyg5Wczoe7QmWdQgdR2cz7lsLYFJJ+2i943WaoCTZB+a/3RoDtVsivNzKjuKecFJ77tj/qKe3wUOgPEX5ctewDjhQjExjOI53v5PzqAbjRYIjhKUN526D6sgwp49IcNANJdtecNBjYvNXa3vcT1jH8Ddev+B+xuxcA5wr2VB1cniBRDt7TTGfNmFL2NY3XGjDh35YPQK1p8BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WYGvucgzE+ZkjQWnVLMvGZIPJNtujTvw46AQjoSBkuQ=;
 b=J8D2uHRSo+FoSLaYrPHcz62Hl/rWpx08gEEBp36iycx1V245qSP1b6m+Ee/ryD8lFdoVKXIId51vhNcs4MNe/Qt5GT+MHeWHVkdSQ63SgyBDhCvIOq7RQcQgWJbNoNVOwbDHQGd6PJ3XMnYynMz6XDqCHtwzx7qfWrY409/kbY0B3q41p39tCaEks9C5JFW4wn0Ay74c1ip9gEWe5ASOcEmwQFCPWXC5B9hYMXxAD8NJZbor1z/cImYQoMvhiYrXSDDRBWOxO4MNpHJxxFwRlW/97Jf7CPMSKwynnYP7fFfjE+VSqOi6mFCDABnNC+37SsXENHXGPsWoosEJScjVxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WYGvucgzE+ZkjQWnVLMvGZIPJNtujTvw46AQjoSBkuQ=;
 b=EQDEZ3Z/FE4Md87pi2q26KY3fl6fmgrWA4n9XpF+ETwigjzTRIEQs9c6XOJ1KN91dHuB/pgzJWtUB9qjcGZsKl7dAFk8DVe3dV2OmJc+0aShQ/3e6STohnkbeZlboXrX56AIjYroGpIx/wwRWnpLGO/JWQ2B1fTpk31gtyd6nvM=
Received: from DM6PR17CA0031.namprd17.prod.outlook.com (2603:10b6:5:1b3::44)
 by DS7PR12MB6239.namprd12.prod.outlook.com (2603:10b6:8:95::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Tue, 18 Feb
 2025 12:39:27 +0000
Received: from CY4PEPF0000E9D9.namprd05.prod.outlook.com
 (2603:10b6:5:1b3:cafe::f8) by DM6PR17CA0031.outlook.office365.com
 (2603:10b6:5:1b3::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.19 via Frontend Transport; Tue,
 18 Feb 2025 12:39:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D9.mail.protection.outlook.com (10.167.241.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8466.11 via Frontend Transport; Tue, 18 Feb 2025 12:39:26 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 18 Feb
 2025 06:39:24 -0600
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>
Subject: [PATCH 0/3] Add hwmon and sysfs reporting in HSMP
Date: Tue, 18 Feb 2025 12:39:02 +0000
Message-ID: <20250218123905.51984-1-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D9:EE_|DS7PR12MB6239:EE_
X-MS-Office365-Filtering-Correlation-Id: 109de8c0-30e6-46a8-f1c9-08dd501947de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fsNI10xo/a3WbCTTFyBWGrrKf57Dh0zFLHkNhG5qBTTlriHLyCPgcrgoXuvU?=
 =?us-ascii?Q?O6Xf5nyxNqB/MViue1/NksTftZTbtbq+/FVxqkVFPp2cFRpfoY3QS1WMOh2U?=
 =?us-ascii?Q?bZ7gAS3SH2Ha5m4Ev2Bk3f2MHfVbzFSJdh5Al47dXu1VK62HxxIrczR2SSAD?=
 =?us-ascii?Q?XMIPhy4hNDC12n0yFi829ZCpMNpSd0T4NmQM4hF6LUL6/Fkru4jL9ChlAqnt?=
 =?us-ascii?Q?aic15K5g+OUjY0egU9cvQHLOK4p88F6vuVo0bFF6e8AVyZePrbl8aFgrK9GN?=
 =?us-ascii?Q?BFZAAvIlL+YK8sylZsZ6DgC+G9YLToMrvj/3jSZJvP+Wm2DwDn61ZM79V1qN?=
 =?us-ascii?Q?7ud04qibx5fHJvk3lFszR8s5uyTNubJxuqkKjwdkdsrNIupALITtYGCFak/k?=
 =?us-ascii?Q?evdXwM+/GmnWfhlPmBy3pMcyfeorzK8lGuUBszNBaWXXHZ6nybfZvtrZMtuU?=
 =?us-ascii?Q?LYen2hylPpG0AfdqbnGGEiJB689bSBizwAErsxG8VKwYwrWUKK5anbIvHqJk?=
 =?us-ascii?Q?mhT3XXdPDXlwwLGLyEbqBtM0ZioC4k6Frq8XMkZApbI09W6DH9OFrBfA6wGz?=
 =?us-ascii?Q?bB6OoRwO+FKJ62A3g8OoUnItNei1gjXPlcu7C5cfZ84eSowbkB3cRWH+OUrA?=
 =?us-ascii?Q?UerxDXDVPDJPqt3uglIPRtTZh2Q5vOetc74FSbv2jT0flLpYCKF/bxSjlPlY?=
 =?us-ascii?Q?trKUHn4t6DZlEOhIACcj+iERZqEJu9KRq1fGBcLMNxHjRi7k96K29avXDBDy?=
 =?us-ascii?Q?yzCdGsrZ5WdAmD8dgzVUYKUnU9BsrzZBBg+v5PSrmeamuiapwpBgLgnBTS2b?=
 =?us-ascii?Q?YUs3xbbiOVpcO31eOUx8D8tj1EtCCM87kCUq80ItSLT5fFNraIXIBvB/sokY?=
 =?us-ascii?Q?ua9B9dH7cV8Q3Jt4cKuJD2wN/xlPIVLbezev/heTC7Q0M/62x1vt2m0aFfrx?=
 =?us-ascii?Q?p19QNb7hXRimfTBNt2mSPLsDOQBb5Y/brwjaW0goVlYZOWyJZg0GUpR98ihy?=
 =?us-ascii?Q?fYJm2b7QcNFPdGleTr50Oa55z8tIQoZW6uTHdgi0NxgcNGAcokPBh59hC7au?=
 =?us-ascii?Q?Fm5lqR5DAbzdizGYV87qWbF4UdYIH9xw4u/1yczlPn3QpjwXzbol9eVKbwUL?=
 =?us-ascii?Q?LoOOEqCGh95y/HKNt06C8qrT/DIot2K0Dbur/JyvHmG2KmCi9+0Ags+GuiDe?=
 =?us-ascii?Q?+H1YeKGuRkXXsfmVoc7QCojd89nmnQ4lLrn30TBYhe4B/7j2O7kLtj7PBn1B?=
 =?us-ascii?Q?f43JEFX09954jF+UELq8k/nWpO5HuiOmo68L9uVGVUO7k4lRTwf8Tnl7ITiR?=
 =?us-ascii?Q?Exruy6R0y+K6RtZXG4cGc0l3XAt0wRdgw8wY0+Ul/P/upqvW4yjKP7euAXdR?=
 =?us-ascii?Q?p8MCVeqljPfZjhgTz1gKU+bgqqIto7emxyzc55RZ9Asuy7N/zP+D8Uyr06rt?=
 =?us-ascii?Q?Qm0hPQVOtpAY3z6VbNhNl2VfsZwMxXGsJis4pZvFrSDpHamz6SaHWbdDCrHG?=
 =?us-ascii?Q?tf99tTyRYn3whwY=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 12:39:26.4957
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 109de8c0-30e6-46a8-f1c9-08dd501947de
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6239

This patch series adds 
1. power sensors for hwmon interface
2. sysfs interface for telemetry (only in acpi module)

Patch 1: Use one HSMP driver version for common, acpi and plat files.
Patch 2: Add sysfs files to acpi driver.
Patch 3: Add hwmon power sensor support to both acpi and plat driver.

Suma Hegde (3):
  platform/x86/amd/hsmp: Use one DRIVER_VERSION
  platform/x86/amd/hsmp: Report power using hwmon sensors
  platform/x86/amd/hsmp: acpi: Add sysfs files to show HSMP telemetry

 Documentation/arch/x86/amd_hsmp.rst    |  29 +++
 drivers/platform/x86/amd/hsmp/Makefile |   2 +-
 drivers/platform/x86/amd/hsmp/acpi.c   | 273 ++++++++++++++++++++++++-
 drivers/platform/x86/amd/hsmp/hsmp.c   |  23 ++-
 drivers/platform/x86/amd/hsmp/hsmp.h   |  13 ++
 drivers/platform/x86/amd/hsmp/hwmon.c  | 191 +++++++++++++++++
 drivers/platform/x86/amd/hsmp/plat.c   |   4 +-
 7 files changed, 530 insertions(+), 5 deletions(-)
 create mode 100644 drivers/platform/x86/amd/hsmp/hwmon.c

-- 
2.25.1

