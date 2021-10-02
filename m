Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0A8EC433F5
	for <platform-driver-x86@archiver.kernel.org>; Sat,  2 Oct 2021 09:33:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A9BC961353
	for <platform-driver-x86@archiver.kernel.org>; Sat,  2 Oct 2021 09:33:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232738AbhJBJet (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 2 Oct 2021 05:34:49 -0400
Received: from mail-dm6nam08on2074.outbound.protection.outlook.com ([40.107.102.74]:28193
        "EHLO NAM04-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232691AbhJBJes (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 2 Oct 2021 05:34:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RnGavgBugaBqzepb0JWTONCGvOsqCtHEQ/Xm1oYpSPCz+UG0HMRBvjI66ixmsI376r8jYmkHGqFYTyRChDBID5YNDVh8Sf6cHWTcnMPLkAiNJtmkrJ452dH1UF/c4ElOYwzdaCUo4F2OoCo/v63Lu7nmtyKVpS8d3Fm1SFjoMapZw8gLmUQgwP5Neozg4baYgcO+EEU0ZxB3wLT0yLpR3qUftmaVVxcXSf7y29Jd3+NxnnM8FXmS95FF29z6Q196RR8E+YCxlL5qztqPAOvb5SRVgbqaJbzcglEPbVoy/lR35y28i+nwX61AfdEZ8uxigA6rw1QDuyQeudJhBZOCVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wg7NcWojwxVMfJrzj2S2U0vsLLsmv5ABHa9x0Dq3w/8=;
 b=RVY/bxdJxeREgBkXfM6j76Jaa+1Aw6w7EVxrst5S2UwP/1S22sLNu/UdrcUn27pWZH64qAplymzNDbvC82lzlUbgvZqfZl61NENslpuCS1GPB3neFJ1hSCwS11Gk6PxG8YtJk73K6lnchKshC7TqPTzrW4cUNhrcsSnX1j0wY7yRc2jVSaBEdiKz0SizbwGk1xG7Bos9cESi3+ZuXfuH+TitsNvUuHPd+JoofPKFGr3Vr6Mqr7lg2BuEJ0kW68KoP06v/bLYlpBqVSebSLnL7BR8WFj5VPLvfaOushMpo170iEzUDhSnGCyr9vEPCJXG8dsJybWUAzU6FO6mkZkMXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wg7NcWojwxVMfJrzj2S2U0vsLLsmv5ABHa9x0Dq3w/8=;
 b=Nc/jYthlK2g5o8TcSfklbn2a3zd3XIchXQu8i1MOcFPJOmsa9qd5cAGMpZbL/pLrQBZo9XaQrf/ROwfJm65OXaY8arxO8jEgQKgwroSfQORijKxQSR6JBZaWypfB2sjzrQIwP3phiknNbZRzCmZ+QUPvDfeY6bDqhYZ/kEJK5qBvMpGLn3YIFRZt9kcxXXROEFIHgGnVZWHKucVqEHxG0+KTnmTsG7fGwTg131wQ13P4Jb2r6N1B4jwa3HZjFizRZr1BpEgvC/C1y7Irquxwpxy21rodTZpuGWRkay/BnrjRPUAmD1IRDDbj68PLdn7o+X5/i7QHTYustD+OzMaQzw==
Received: from MW4PR03CA0291.namprd03.prod.outlook.com (2603:10b6:303:b5::26)
 by CH2PR12MB4937.namprd12.prod.outlook.com (2603:10b6:610:64::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.17; Sat, 2 Oct
 2021 09:33:01 +0000
Received: from CO1NAM11FT024.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b5:cafe::c5) by MW4PR03CA0291.outlook.office365.com
 (2603:10b6:303:b5::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15 via Frontend
 Transport; Sat, 2 Oct 2021 09:33:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT024.mail.protection.outlook.com (10.13.174.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4566.14 via Frontend Transport; Sat, 2 Oct 2021 09:33:00 +0000
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.187.6) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1497.18; Sat, 2 Oct 2021 09:32:58 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>, <michaelsh@nvidia.com>,
        "Vadim Pasternak" <vadimp@nvidia.com>
Subject: [PATCH platform-next 01/10] platform_data/mlxreg: Add new type to support modular systems
Date:   Sat, 2 Oct 2021 12:32:30 +0300
Message-ID: <20211002093238.3771419-2-vadimp@nvidia.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211002093238.3771419-1-vadimp@nvidia.com>
References: <20211002093238.3771419-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3bcaeadf-2f10-4072-55d8-08d98587a051
X-MS-TrafficTypeDiagnostic: CH2PR12MB4937:
X-Microsoft-Antispam-PRVS: <CH2PR12MB49379BD374AF34DCB4200839AFAC9@CH2PR12MB4937.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZeV2zbmgijiR3msrvEuS1oeQU3AuJ9l2hdc2BNDGq+w067Gi2jm1pTHoCTPkVerkwzYzUxukdJuiwVFKvDIlv8r1guCt96WOAoaPtlAGu3vgdQOny65tFKlSWdjz7Dtoshbr4n/PnDV1fbbPJyEOi2LesqDnlhHjebDuDtANDscFbt64yMfQety/Y8ZNyGjJ7HZDRXi+CwDT7XpZx6TlG31I0PYX/ABQJAOGusedgbsD02dRzOAdqxpH9++KFY1IlWFqSJzf2GT5X9V2uR9I85HrCVa68WmymMxBtsGzsWGlvxH1hAgk9QWJ4jEtWSyWGFdRf2juFkdKJCX/qdSmWzPzOJK++UJf+a0HoQlQJFYRLXHi0Yr++mNWi9vG7W0eUFXDbsc3PVoOGp6CxsgPLXUBa4HwqJpKHiLnjNt8Igq9MmLoK+k9hznwq8EpHn/5ir9zskcLKVSUDCCaSmztcaCSaiagDk7F4mVrFkrv19sH0AjilD7ItSmXGYGBp9KuHtlXtpoAzCEXnmWi1uhWlRqGTX7WKPPqorm6uTBotA7h2YMncsGOx0bykiFku4nCWdwEph+iKQKE81wrwV77PPByGPPfM/9i3bxr0gMuVqoJ0ul1ImKpOpcPGd+brOKlxMZD/jVLtxhRSdyopItzUJPyS/WBVBsizwfOmfDFh0Ejxd8ZS6DotnWZvx0FwavwGBXXWpSsfjs+80JHEjwp1A==
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(356005)(316002)(82310400003)(36860700001)(83380400001)(86362001)(2616005)(186003)(5660300002)(107886003)(8936002)(1076003)(8676002)(47076005)(4326008)(54906003)(70206006)(70586007)(16526019)(26005)(7636003)(6916009)(6666004)(508600001)(336012)(36756003)(2906002)(426003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2021 09:33:00.5330
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bcaeadf-2f10-4072-55d8-08d98587a051
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT024.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4937
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add new types for the Nvidia modular systems MSN4800 which could
be equipped with the different types of replaceable line cards.

Add new type to specify the kind of hotplug events for the line cards.
The line card events are generated by the programmable device located
on the main board. This device implements interrupt controller logic.
Line card interrupts are associated with different line cards states
during its initialization: insertion, security signature validation,
power good state, security validation, hardware-firmware
synchronization state, line card PHYs readiness state, firmware
availability for line card ports. Also under some circumstances
hardware can generate thermal shutdown for particular line card.

Add new type specifying the action, which should be performed when
particular hotplug event is received. This action defines in which way
hotplug event should be handled by hotplug driver. There are the next
actions types:
- Connect I2C device with empty 'platform_data' field according to the
  platform topology, if device is configured (for example, power unit
  micro-controller driver, when power unit is connected to power source
  (this is what is currently supported).
- Connect device with 'platform_data' field set according to the
  platform topology. The purpose is to pass 'platform_data' through
  hotplug driver to underlying device (for example line card driver).
- No device is associated with hotplug event - just send "udev" event
 (this is what is currently supported).

Extend structure 'mlxreg_hotplug_device' with hotplug action field.

Extend structure 'mlxreg_core_data' with:
- Registers for line card power and enabling control.
- Slot number field, to indicate at which physical slot replaceable
  line card device is located.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
---
 include/linux/platform_data/mlxreg.h | 57 ++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/include/linux/platform_data/mlxreg.h b/include/linux/platform_data/mlxreg.h
index 101333fe2b8d..49f0e15a10dd 100644
--- a/include/linux/platform_data/mlxreg.h
+++ b/include/linux/platform_data/mlxreg.h
@@ -24,6 +24,51 @@ enum mlxreg_wdt_type {
 	MLX_WDT_TYPE3,
 };
 
+/**
+ * enum mlxreg_hotplug_kind - kind of hotplug entry
+ *
+ * @MLXREG_HOTPLUG_DEVICE_NA: do not care;
+ * @MLXREG_HOTPLUG_LC_PRESENT: entry for line card presence in/out events;
+ * @MLXREG_HOTPLUG_LC_VERIFIED: entry for line card verification status events
+ *				coming after line card security signature validation;
+ * @MLXREG_HOTPLUG_LC_POWERED: entry for line card power on/off events;
+ * @MLXREG_HOTPLUG_LC_SYNCED: entry for line card synchronization events, coming
+ *			      after hardware-firmware synchronization handshake;
+ * @MLXREG_HOTPLUG_LC_READY: entry for line card ready events, indicating line card
+			     PHYs ready / unready state;
+ * @MLXREG_HOTPLUG_LC_ACTIVE: entry for line card active events, indicating firmware
+ *			      availability / unavailability for the ports on line card;
+ * @MLXREG_HOTPLUG_LC_THERMAL: entry for line card thermal shutdown events, positive
+ *			       event indicates that system should power off the line
+ *			       card for which this event has been received;
+ */
+enum mlxreg_hotplug_kind {
+	MLXREG_HOTPLUG_DEVICE_NA = 0,
+	MLXREG_HOTPLUG_LC_PRESENT = 1,
+	MLXREG_HOTPLUG_LC_VERIFIED = 2,
+	MLXREG_HOTPLUG_LC_POWERED = 3,
+	MLXREG_HOTPLUG_LC_SYNCED = 4,
+	MLXREG_HOTPLUG_LC_READY = 5,
+	MLXREG_HOTPLUG_LC_ACTIVE = 6,
+	MLXREG_HOTPLUG_LC_THERMAL = 7,
+};
+
+/**
+ * enum mlxreg_hotplug_device_action - hotplug device action required for
+ *				       driver's connectivity
+ *
+ * @MLXREG_HOTPLUG_DEVICE_DEFAULT_ACTION: probe device for 'on' event, remove
+ *					  for 'off' event;
+ * @MLXREG_HOTPLUG_DEVICE_PLATFORM_ACTION: probe platform device for 'on'
+ *					   event, remove for 'off' event;
+ * @MLXREG_HOTPLUG_DEVICE_NO_ACTION: no connectivity action is required;
+ */
+enum mlxreg_hotplug_device_action {
+	MLXREG_HOTPLUG_DEVICE_DEFAULT_ACTION = 0,
+	MLXREG_HOTPLUG_DEVICE_PLATFORM_ACTION = 1,
+	MLXREG_HOTPLUG_DEVICE_NO_ACTION = 2,
+};
+
 /**
  * struct mlxreg_hotplug_device - I2C device data:
  *
@@ -31,6 +76,7 @@ enum mlxreg_wdt_type {
  * @client: I2C device client;
  * @brdinfo: device board information;
  * @nr: I2C device adapter number, to which device is to be attached;
+ * @action: action to be performed upon event receiving;
  *
  * Structure represents I2C hotplug device static data (board topology) and
  * dynamic data (related kernel objects handles).
@@ -40,6 +86,7 @@ struct mlxreg_hotplug_device {
 	struct i2c_client *client;
 	struct i2c_board_info *brdinfo;
 	int nr;
+	enum mlxreg_hotplug_device_action action;
 };
 
 /**
@@ -51,12 +98,16 @@ struct mlxreg_hotplug_device {
  * @bit: attribute effective bit;
  * @capability: attribute capability register;
  * @reg_prsnt: attribute presence register;
+ * @reg_sync: attribute synch register;
+ * @reg_pwr: attribute power register;
+ * @reg_ena: attribute enable register;
  * @mode: access mode;
  * @np - pointer to node platform associated with attribute;
  * @hpdev - hotplug device data;
  * @health_cntr: dynamic device health indication counter;
  * @attached: true if device has been attached after good health indication;
  * @regnum: number of registers occupied by multi-register attribute;
+ * @slot: slot number, at which device is located;
  */
 struct mlxreg_core_data {
 	char label[MLXREG_CORE_LABEL_MAX_SIZE];
@@ -65,18 +116,23 @@ struct mlxreg_core_data {
 	u32 bit;
 	u32 capability;
 	u32 reg_prsnt;
+	u32 reg_sync;
+	u32 reg_pwr;
+	u32 reg_ena;
 	umode_t	mode;
 	struct device_node *np;
 	struct mlxreg_hotplug_device hpdev;
 	u32 health_cntr;
 	bool attached;
 	u8 regnum;
+	u8 slot;
 };
 
 /**
  * struct mlxreg_core_item - same type components controlled by the driver:
  *
  * @data: component data;
+ * @kind: kind of hotplug attribute;
  * @aggr_mask: group aggregation mask;
  * @reg: group interrupt status register;
  * @mask: group interrupt mask;
@@ -89,6 +145,7 @@ struct mlxreg_core_data {
  */
 struct mlxreg_core_item {
 	struct mlxreg_core_data *data;
+	enum mlxreg_hotplug_kind kind;
 	u32 aggr_mask;
 	u32 reg;
 	u32 mask;
-- 
2.20.1

