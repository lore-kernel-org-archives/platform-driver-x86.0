Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011018.outbound.protection.outlook.com [40.93.194.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673C32BE051
	for <platform-driver-x86@vger.kernel.org>; Thu,  7 May 2026 14:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778165149; cv=fail; b=SwmQmrkLaW/arMXLrAFk4mTUcE7VmJRS4P4ttsynMHYUq90z4fxlQDebQwXJQ4BbMYKYjzaPfMfdaU98eXKobjFxeCzJ6kIZ/JtMG0tJ80F78H9TZhZZ0yOFasHilUSqE9ze9QGjgC4xRepjcPUsc0FS+xeRl4Gw8ORNpH/Z+ZI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778165149; c=relaxed/simple;
	bh=NcvzJmQBUl97WfF0EP1YofxCv0WfK6XnK9wtSbNxQIQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=h/Qj3/1DhvZ5ccVvTIi3FQM+ER5SeImwpgrq11IzfEhBlBYwDf9obxS6j7vOAlbgXkst/xujDa/AdtuV3PtdIl9MSb7GP3ETdLd6Dl9jBhdKOQZER0msD+28GfSdAg9SZAGa4OTUTPsOKzBOiyDLE+IPh/BwiJwXW3xrnGEq3gw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=phulS0EK; arc=fail smtp.client-ip=40.93.194.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="phulS0EK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xpNiEDXLLHc5+XLF4Qm5YspatR+uKPOXNTApRZ20o8p1QmEeTytve/Qr2HkZUSic4mBLO2s1OOyX11Zwd9au6s1He2wBBe09F+ItMQIEIW4k7DtwVVLlj9Z+AvZbyJLzn3/Fg+5EVzBCxkxthvmjUw2aKcFmLgitmC8+AiqPhG+gTP+DoKNliTUPG2Bg4dEb7cRVfke+LpJ8OcQOt49hBPFQl/+nEaNIovf1EfqHpfLeIJqYfe48mq5Y76VqJ/o2SLstjs2zHFdQ98shM6Z0kUgsUDkawdd0sFsUFxkaqlJaEy7CcI1X2omhrTHJslAFn482hBi3u0DOiyVLwSsdCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e2vIv3NqRNScCncM3r7aHNaAAs3RDVm9AD9plYnfhK0=;
 b=KIjCU+6VO6N6Z3KYKPd/gjE4mRyMt9F8d9/k+9US5+NtRgU3GabkJHbIZfTOv4sBdaoXG8ELvhpNj8qMgbcze3KCrhezKmPJE2sncOTFQ8hP3zmTzfVGMuAjTtY8YUEMWedzKXPFchdtWQpq9Ok3jhZdCFUFU1hYZUmns6lg91WZqkOZgUUIcuGaMsG3KCsAp5qsFCTNC5RqSojhk0UsXHiKJq5aDTdiejxZIX4ugUyZ3pdgyNwGnpCoNjSrpEx0CbVqSptpGEraiRtoCASGAR6qSKLBzLpfERB7TtviC5dlixWhUdyQWUYHoebHo4/TS2LHn7t0v0s7hUvCAy66jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e2vIv3NqRNScCncM3r7aHNaAAs3RDVm9AD9plYnfhK0=;
 b=phulS0EKoyWvj/IaCyCEKAbYfpUt+2g+a3wCMENZ9GLxx8+lmrmsb5FpF/p8fLofX/wkpXuny0/oWtnhUSBRZlaAqbXjrV+LhQ0rqNWeTE7jYrBm7jrMrc1EYlHfdkCCi+qX3tyEVmrUizN2B9Y1FFMK00vcKvy95nnwOsgSPhw=
Received: from BN9PR03CA0585.namprd03.prod.outlook.com (2603:10b6:408:10d::20)
 by DM4PR12MB6253.namprd12.prod.outlook.com (2603:10b6:8:a6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 14:45:44 +0000
Received: from BL02EPF0002992B.namprd02.prod.outlook.com
 (2603:10b6:408:10d:cafe::58) by BN9PR03CA0585.outlook.office365.com
 (2603:10b6:408:10d::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.17 via Frontend Transport; Thu,
 7 May 2026 14:45:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0002992B.mail.protection.outlook.com (10.167.249.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Thu, 7 May 2026 14:45:44 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 7 May
 2026 09:45:39 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>,
	<Sanket.Goswami@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v4 0/7] platform/x86/amd/pmf: Introduce PMF util layer with userspace interface
Date: Thu, 7 May 2026 20:15:17 +0530
Message-ID: <20260507144524.664001-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: BL02EPF0002992B:EE_|DM4PR12MB6253:EE_
X-MS-Office365-Filtering-Correlation-Id: 00fdd87e-eb35-462c-c338-08deac475167
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|18002099003|56012099003|3023799003;
X-Microsoft-Antispam-Message-Info:
	lkYQoc5kalOsVxesvULPlws8Rceyr75/OkEPNtpDE7z0w3Y97XdkHZdpXGqr4pymrD0Uw4LAC6lxXV2Lf9XUPJaCJseqM5jMAtgsSW26xck72qGNJAwudS6rQGjq26Lz72Z6qv3V415wEZ2qoOSWrAasGyyycS5tjUkSuPqvfS10Bk+d/6rfYKlcfgjOUOlq3btGp+nZXkRQGzQ4oL3oe/dRN9WVV9Y14KLN2Qhf+oYnl3ZN1/2fVUjluUqMgmXEbEom+J9Jl0vQif2ya3X/kDKvwmknTePQp8Zg23d9oRZEtwN7BAkHlbzM4F+mJweuL7obvmJaoLFNFRsWvqNy5lz5khphIAYE4M4cd0WhRrbwG7dT2U2VwwInrN5h3MbMwYn+PNwpegFkMMAD3i1Fa7gIqv5ErH1Jk1QzEah7556jFkC7zEwbLYcs3EsteIfMRvzfJ60T/0kDQEvVgSs4PmVsWzwrw5leWgEvRtKW4nT3lPrbA/T4Iw8Np8RI80Tqqf4hgWN8pjobvbqTCuaMD8VDPjo2tZmOEbhJZw/UNbDsMAefWHrfSVSQP1wbzCBI8an2Xa2yjlEqmttdWlm77FFWbFS95/AvxdcNGoxnksqT4YeARfHJAZgNpvcWXRSEyLpswQgFg1eupnSf6zJxXb9/EZJ1TLxp+eu11GqtT1Apqf9rey16dE71RV5Rs6GN5m+L57mhu5u0LnZ8YiQpNzEn1dr/0GU1re8f+s0ikGk=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(18002099003)(56012099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DBNwBplZgQE70f8BIaTBcjozL5gq5tjJbCTtVWFKFnpcwdKxoEeNqGq29Zf+8gfC4xCENb8aDOwvCrMnIv/47jwb+12sSYUwWnsIgwb7iJ2/5iWCs2A1u+QSOqq3qjCA1ts/PaZNhgdqyZWGX95C/0Hnks8ELVhzQChDzKf0UhEPWLnG2bNyPENk6iUbzzhaDOTst0tdLb5V4JHECCZZ5POVpyU6F/XnkzxARfIC9C1Rz3bCb0lMXXMANuHzk8t6ZjwVjeDwMRVagmkWI0k73bfYBCi57heP5W1yIPgx5GOA61mqa+75rl1oUxIOaT/uuupFJ3JdSnh+2LbO5mrUR5sSK5dtmO+tT15KZToxaR4bpTShoEV3tTw+chuOV8bi5pWQl0pN+ZTbKMSVB11Zvi55PvguFqeHvOHO3SAnwUYm1aK3LvRPUMhDw9I31P3q
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 14:45:44.1234
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00fdd87e-eb35-462c-c338-08deac475167
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6253

This patch series introduces a new util layer for the AMD Platform
Management Framework (PMF) driver that exposes a minimal userspace
interface for metrics monitoring and feature discovery.

AMD PMF currently manages power and thermal policies internally through
Smart PC features, Auto Mode, Policy Builder, Static/Dynamic Power
Sliders. However, system designers and OEMs need visibility into PMF
metrics and feature status for validation, debugging, and integration
with monitoring tools.

This series addresses that need by adding a character device interface
that allows controlled access to PMF metrics data while maintaining
the driver's existing automated policy management.

The primary use case is integration with userspace tools like AMD
SystemDeck, which are widely used by system designers to:
- Monitor real-time power and thermal behavior
- Validate PMF feature operation during platform bring-up
- Debug thermal issues by tracking skin temperature, C-state residency,
  and socket power metrics
- Verify BIOS input/output policy values during Smart PC operation

The util layer reads from the existing Trusted Application (TA) shared
memory buffer and cached BIOS output values, adding no new communication
overhead with the TA.

v4:
 - Implement single amd_pmf_info structure which can cover all members.
 - Add amd_pmf prefix for enums/functions within the UAPI header.
 - Keep test-pmf tool outside of selftests directory.
 - Include necessary header files.
 - Address review comments received from Ilpo on v3.

v3:
 - Stop exporting battery information via util layer.
 - Optimize the core logic for fetching BIOS outputs.
 - Update the documentation patch to reflect the current util layer design.
 - Consolidate amd-pmf-io.h changes into common UAPI header.
 - Define a single unified uAPI structure and IOCTL.
 - Address other v2 review remarks [1]

v2:
 - address remarks from v1
 - add a new tool that exercises the IOCTLs from PMF interface

[1] https://lore.kernel.org/platform-driver-x86/20251111071010.4179492-1-Shyam-sundar.S-k@amd.com/

Shyam Sundar S K (7):
  platform/x86/amd/pmf: Add util layer and userspace character device
    interface
  platform/x86/amd/pmf: store BIOS output values for user-space metrics
    via util IOCTL
  platform/x86/amd/pmf: Add feature discovery support to util interface
  platform/x86/amd/pmf: Store commonly used enums in the header file
  platform/x86/amd/pmf: Move debug helper functions to UAPI header
  platform/x86/amd/pmf: Introduce AMD PMF testing tool for driver
    metrics and features
  Documentation/ABI: add testing entry for AMD PMF character device
    interface

 Documentation/ABI/testing/amdpmf-interface    |  75 +++++++
 MAINTAINERS                                   |   1 +
 .../amd-sfh-hid/sfh1_1/amd_sfh_interface.c    |  13 +-
 drivers/platform/x86/amd/pmf/Kconfig          |  10 +
 drivers/platform/x86/amd/pmf/Makefile         |   2 +
 drivers/platform/x86/amd/pmf/core.c           |   5 +
 drivers/platform/x86/amd/pmf/pmf.h            |  33 +--
 drivers/platform/x86/amd/pmf/spc.c            |  62 +-----
 drivers/platform/x86/amd/pmf/tee-if.c         |  11 +-
 drivers/platform/x86/amd/pmf/util.c           | 155 +++++++++++++
 include/linux/amd-pmf-io.h                    |   9 -
 include/uapi/linux/amd-pmf.h                  | 205 ++++++++++++++++++
 tools/platform/x86/amd/Makefile               |  60 +++++
 tools/platform/x86/amd/test-pmf.c             | 142 ++++++++++++
 14 files changed, 687 insertions(+), 96 deletions(-)
 create mode 100644 Documentation/ABI/testing/amdpmf-interface
 create mode 100644 drivers/platform/x86/amd/pmf/util.c
 create mode 100644 include/uapi/linux/amd-pmf.h
 create mode 100644 tools/platform/x86/amd/Makefile
 create mode 100644 tools/platform/x86/amd/test-pmf.c

-- 
2.34.1

