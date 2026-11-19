Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.24
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795078287;
	b=gAE7brXwiD64cEUkFheqsJ5cPgJOh0qzk6/QGgL9YRrg6hKLzHeFFkAojbfbQaV9G+sR
	 bxks6gy9PewDpazqhhFNpDnAkFiSIMVr6RCuB+vNx9a/P6Y2fX4DQ3fva55sjT/OjwMEH
	 QE8/PKVwJYrYfRv8CFY3xMcabwVnVlxe2cFWe193TaK1QhDelk3eOeDGx2eO3goyxDpZX
	 kKnMQHZcDJzkoNQvBJuLrakA7sYEXCeQKkSguUjXJL7kDZlOEj++mNZM3v5OTkoLL0oR3
	 JVwEKcxfd1p5+LV0d5uWFm6jGQHXgCHuMMfafwECzXAsfdsSNnKlzkBZ3dJYNFeCK1Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795078287;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
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
	bh=BCvsDu37O0LgTlB6Aj/6iQ2pG8gYuHtW//xEABLG8XY=;
	b=onae0wSMUpQfuv6ubZgu2C9WWrM9gOPMzMZd1WRvNo71px0ITmzenYc7MBX/j052uIvp
	 Y5Z3pODFBgYQEf+mbLf075JPhmFkTfMzhPwEInHnWwsyNhr/80pSenymhPLwWdJXWmQ6i
	 UsqsSFgaO8vtFsqHgpE/UkPpsRB6wkPgfFgKQAS01Es4PDMOQOpQ44bmzNWKr/KPl0OLO
	 EA3T92MCuGUw2bOBt7uzG7Myp+Loxe1d8gWtsDEnFGdJhKKwZA47LQXhXcDelgeizQN6X
	 GEK3wJmqdKX6htLMK/CuXSEN6Zow756W04ymX0iDMflOi9cxjqnBz24OY/+jfzIz4Jw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=EOWkF8Q9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.24
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010024.outbound.protection.outlook.com [52.101.85.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D44606A32A
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Nov 2026 08:51:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02D44606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=EOWkF8Q9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r/0kx4N/XN9oRI9ERJhsT0MpOCUkFZkP79GI/7HfEkpnKeD+6qmP02ylYZDJMGfCHuqOhd9So2OfT1wb/7Tg2YAxnMOy1Liz+hMnCP9BUFGjAZwh+XRNo7vkwfT2nhfbCCfTyA55DQp2q7vLo+9IibX56D1Oa0xa1qBx4CFugj7+hrdhInPPt2UPOYuyPsdfvxtRPom1xIA5XMz1azOpjf8jBLjUT4lG+AqFr3ZNx3c4ixr41nSZGq/50K5rtp1Fembko1zaE9bqob8T8pLh4OkQO/exDmZzp/HDiOu1c373SCmEJ9kDouaSc0EV68FSK7EELppoLlylQC/0Wx6UCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BCvsDu37O0LgTlB6Aj/6iQ2pG8gYuHtW//xEABLG8XY=;
 b=OKdovZ1Nx59hZBokPbfrCcGol9+GpHlP/G05aHsgfeBoQeDGaNo1XFeOMesDtFPpKV3X2KYtACCRFMWasv5tKTV3kNzbViqm4UPIjez96gji9OD3aKQQjNcMDXD96rQSlnbxXLgmxa2BvUk4iKQDxEMRFYzK2HS1Cw9Og/sc8CJItW6uT37GHXiPLXhPXcJv6agXuFSmRW3iVh60jici42vIg3hbwx2ZRNktMF1TzsLVUoVCUDVSZvRiaPFekFCZ8jQkjYBpPvGYnKgd3ycXVTLDb5PRyQ6IqkgBFS1Avs+8Kto0QsPUpdbibHbeTY7oMqRhGI0pwurKGK8OAIUQRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BCvsDu37O0LgTlB6Aj/6iQ2pG8gYuHtW//xEABLG8XY=;
 b=EOWkF8Q9CxxatVY9dkSki/MS7Om4l/2sDUopfWTDzXZjRJooXkimOxOc5aFYq/EQLWll71lRRzKmvMZAqdwLQdfeRFud3deO8SycEWPH21tbGlwq0kYhOGlfsqr1hVNe320bKzKct3zJcDnshN2NcVMvpNeibViLW0/ySjTEd4w=
Received: from CH0PR03CA0430.namprd03.prod.outlook.com (2603:10b6:610:10e::15)
 by MN0PR12MB6128.namprd12.prod.outlook.com (2603:10b6:208:3c4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 08:51:21 +0000
Received: from MN1PEPF000793FE.namprd05.prod.outlook.com
 (2603:10b6:610:10e:cafe::97) by CH0PR03CA0430.outlook.office365.com
 (2603:10b6:610:10e::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Thu,
 19 Nov 2026 08:51:21 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF000793FE.mail.protection.outlook.com (10.167.249.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 08:51:21 +0000
Received: from trento15c5.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 02:51:17 -0600
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <Muthusamy.Ramalingam@amd.com>,
	<NaveenKrishna.Chatradhi@amd.com>, <Anand.Umarji@amd.com>, Suma Hegde
	<Suma.Hegde@amd.com>
Subject: [PATCH v2 00/11] platform/x86/amd/hsmp: Per-platform enabled-message bitmaps
Date: Thu, 19 Nov 2026 08:50:34 +0000
Message-ID: <cover.1795061419.git.Suma.Hegde@amd.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: MN1PEPF000793FE:EE_|MN0PR12MB6128:EE_
X-MS-Office365-Filtering-Correlation-Id: aaac2e66-3266-48d0-f42a-08df461a48c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|261102123227099003|261026140227099003|261028144727099003|11063799006|261022075727099003|261021123027099003|261021121427099003|261022105027099003|56012099006|10067099003|18002099003|261009223027099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	hbgLUai5IGvL9h8lkVrBAQxLKPNUvq/dUWqSR438i64LwGr0sieonq8T2YTRZcMesHaBloz+ZANpz6ikqk17qo98sKDfvTOJRZIDd544HxaxOCenV8Fd/lRIUaANx5OtaI9tnmFxnT5Lzold5icNJJJiv8U2wcnCrGoSNPocwv2ylcaEo3KoNyRSniU4XkYmt0ojhhc8n92+sZ6ee+QRqonOOJoZyJCIPP/uMuI+5lLvuJWXlxENgrS/1RXtZq2k5oK3I2gSQrLad95fAodAAg5wGMfnb7qferEcKMkMfBkeZ5NbbI1tHStLaI6HYogrCf5yIgeF+YsD1pV5O4W1a1wpZm1KwwKQynjXazfSUI59se1UbORJvJPWFFezI5ZNECCQb6uZLFZikHjHgUALrA31OjWo/oOK19OoC7kUDN838PiImEEF9ro+QBceM6IKfcYma/zOGhC8pvyZ/5lW/x+42szfR1jFDM0s10/3sSZHCE5uhDtc2NFfYvYEIC7SgWFmfk3rHRAwhaQzu9IGmGNCzdkU+IMSWoXQbrYrBTqE0aoP8QqVZmk/dJiibUbCo+Pmz22tzw/jbszheJuMSmdmRwZZeEquMECfz9D0C1LAE6xnuaNe1ljXzmxAyC3W/xdqDGEq4Pg4faVfBtq2A0QxFLiZm9Mi9AHgWLfe/2T7Cx3yM6RSTOINKOFjswx1xINrBn8Eg97KTSEo5GTjnQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(261102123227099003)(261026140227099003)(261028144727099003)(11063799006)(261022075727099003)(261021123027099003)(261021121427099003)(261022105027099003)(56012099006)(10067099003)(18002099003)(261009223027099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zyXKaF2fK79si//3Eb89XejYuu5jymOF2VL8qRHpuQvQbSFb7GdxQWfDipYd/PTkBM8swl4FRNJc7o25mpc3PJwDF7EnAhSfcdI9NDca3MnivulKfw2rgqchun++njddTeh2FuAg+OH/GeOJpi+c2glDIRv2zK24IhAI89aJ7I71rOzTfRq7+hGnxu9Ssg6110Xlk1JkRq8tnoz/5G6mc46bUDcxwQrCaZKj/CxgTV43hzfbEaj/4xVjuSOnB/Bmx+MDnxH/9O20GVQe4cw+oVz4L2a0MXDF+r/liHDuZ7IfeBrlRhfqtv73tD13bDOK69aOOeEDTUgs8yO9rWPIcGAh8mzjE8N1HPYoGKW8e6DFA2wUPCVMlJU/upcSAtjqO+6vZ+exw8ql+/YONmAvWBuaFNW7XnBpb+596Cn9XldE8f4cu75cVy6D4F/jaZuI
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 08:51:21.3137
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aaac2e66-3266-48d0-f42a-08df461a48c0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF000793FE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6128

From: Suma Hegde <Suma.Hegde@amd.com>

This series introduces per-socket read/write enabled-message bitmaps so
the HSMP driver rejects unsupported messages before they reach the SMU.
Prep patches fix sock_ind bounds checking, move proto_ver onto
hsmp_socket, and reorder helpers for the validation path. Later patches
populate the bitmaps statically and via HSMP_GET_ENABLED_HSMP_CMDS
(6th Gen AMD EPYC Server and future platforms), and update sysfs/hwmon
file modes from the bitmaps.

Client platforms skip bitmap init, populate, and validation until
dedicated client tables exist; shared smu_fw_version and
protocol_version sysfs attributes remain visible there.

Changes since v1:
- Named HSMP_MSG_BIT() static bitmaps; zen6 PQOS bits added and
  HSMP_SET_XGMI_PSTATE_RANGE dropped from the zen6 write bitmap.
- validate_message() runs only after sock->dev is ready.
- Safer dynamic bitmap fetch helpers and default-bitmap fallback.
- Skip hwmon registration on client platforms in the plat probe path.
- Keep the short client-attribute visibility comment in the modes patch.
- Commit message / tagging cleanups (Co-developed-by, defensive
  null-check wording, typos).
- See per-patch "Changes since v1" for details.

Patch summary:
  01/11  Fix sock_ind bounds check in hsmp_is_sock_attr_visible()
  02/11  Move proto_ver to hsmp_socket structure
  03/11  Null-check drvdata in hsmp_is_sock_attr_visible()
  04/11  Move is_get_msg() before validate_message()
  05/11  Use local sock pointer in init_acpi()
  06/11  Move the sock_ind bounds check before validate_message()
  07/11  Add per-platform bitmap to validate HSMP messages
  08/11  Populate the bitmaps dynamically on 6th Gen AMD EPYC Server
  09/11  Populate the bitmaps dynamically for future platforms
  10/11  Relocate to_hsmp_sys_attr() macro
  11/11  Update sysfs and hwmon file modes based on platform capabilities

Suma Hegde (11):
  platform/x86/amd/hsmp: Fix sock_ind bounds check in
    hsmp_is_sock_attr_visible()
  platform/x86/amd/hsmp: Move proto_ver to hsmp_socket structure
  platform/x86/amd/hsmp: Null-check drvdata in
    hsmp_is_sock_attr_visible()
  platform/x86/amd/hsmp: Move is_get_msg() before validate_message()
  platform/x86/amd/hsmp: Use local sock pointer in init_acpi()
  platform/x86/amd/hsmp: Move the sock_ind bounds check before
    validate_message()
  platform/x86/amd/hsmp: Add per-platform bitmap to validate HSMP
    messages
  platform/x86/amd/hsmp: Populate the bitmaps dynamically on 6th Gen AMD
    EPYC Server
  platform/x86/amd/hsmp: Populate the bitmaps dynamically for future
    platforms
  platform/x86/amd/hsmp: Relocate to_hsmp_sys_attr() macro
  platform/x86/amd/hsmp: Update sysfs and hwmon file modes based on
    platform capabilities

 drivers/platform/x86/amd/hsmp/acpi.c  |  94 +++++-
 drivers/platform/x86/amd/hsmp/hsmp.c  | 433 +++++++++++++++++++++++++-
 drivers/platform/x86/amd/hsmp/hsmp.h  |  29 +-
 drivers/platform/x86/amd/hsmp/hwmon.c |  24 +-
 drivers/platform/x86/amd/hsmp/plat.c  |  36 ++-
 5 files changed, 578 insertions(+), 38 deletions(-)


base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
(rebased on platform-drivers-x86 master branch)
-- 
2.34.1

