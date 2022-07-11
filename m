Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D47FDC433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Jul 2022 08:48:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230113AbiGKIsk (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Jul 2022 04:48:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230432AbiGKIsZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Jul 2022 04:48:25 -0400
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2053.outbound.protection.outlook.com [40.107.95.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 659F121E22
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Jul 2022 01:48:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j7b8vo7MZMk9HvswSRvaFJsolJxLo5NjaWr+vjteyuKgL3kR5E+F2xP+2JZkh/0IokGxzk1w9ZQvzM6gneGRT1JAgF3ibilzc3GtiHN1eKfYw8hKSZMy2apzPBDmdwMMqz0stg1Zzk8VkQhFHml/SWYq3/44cbntH1H5+dNLKXZWHduLAXwCR2Pkqd41zbEMnDfzDwmaMMwhdCFFRpDINDuih2M6IOdosJz1GUHxZnSgYSqiipvjjVu05ylF1PYy4GEGShOdXBQeZK7KaYMZTpB+YCtrCGvSKy/LnJRvISxnGjgzj7i9D5AALXCY5yu/ZAfYfxhU9e1ZqmV8TQwarw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PzPk970I4C8IiY7u+DwyjZSyYOg73o8aVe7lopinGG8=;
 b=mfrES/I0PjdHOPHZtyy2tWRb8oc3WqAfb+gt2KB2lX7X0K5hRDsMZ0d5NbjbbZwsscrIkJdiTZ0rOft9yO3SesgN7vjZCtLH/6ZbLs0xrOYCb6lDfRWSgcIvryyIwLdkMcuxY3ObRllzpy07Zb9ZOWRF2/ubQ/w3NJq6sMZtnx/yU1vtOICM4ZTd7C2c3gJQ0PEjWYF87ny7oAaD3n7OIFVuPH0mEJDbNw9mod3DZmL7kaAIeYZKMlwx5c838MXIOPVQVjFxePv3sVKEd1XQR43L/lWttltC+ga4qyR2FU6tZL9LED/zyE3lIEHcMRmdoIetId/QEWNw9AMp7I7GXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PzPk970I4C8IiY7u+DwyjZSyYOg73o8aVe7lopinGG8=;
 b=XA1pbhqEE2K+wE8RqIYFrCrdfr153XlnmoAR63+OhnMBTRyfeD1Jtypbtw7qXUz2A4QbuPWzWFRv9VnVqmuFhdgGFaybzVqJ9mi8onTxCmEDZv+LPVT0Zo3fO1om5KgWRf0mHj7pTYEmD53i6kJRHqGRrO6CFPFv/DdusCgLxHKfA00zOdMKrZXXPzZAvz8co7cyg0z1SWYYpHMxhn0+QORrDPyr1GKpQMSRvdzKHwhMm4lHYA6CXrrr8YWRHWeRzkvy498y9bFAE7zi5wDxEDd7NCsFxLdToOIy+OigHoJAonfEqdNtQwt7FIzkAl1C05znOr1STCx9w2lZtPPYjQ==
Received: from BN7PR06CA0050.namprd06.prod.outlook.com (2603:10b6:408:34::27)
 by MWHPR1201MB0109.namprd12.prod.outlook.com (2603:10b6:301:52::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.25; Mon, 11 Jul
 2022 08:48:05 +0000
Received: from BN8NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:34:cafe::11) by BN7PR06CA0050.outlook.office365.com
 (2603:10b6:408:34::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.19 via Frontend
 Transport; Mon, 11 Jul 2022 08:48:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.234) by
 BN8NAM11FT050.mail.protection.outlook.com (10.13.177.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5417.15 via Frontend Transport; Mon, 11 Jul 2022 08:48:04 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL101.nvidia.com
 (10.27.9.10) with Microsoft SMTP Server (TLS) id 15.0.1497.32; Mon, 11 Jul
 2022 08:48:04 +0000
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.26; Mon, 11 Jul 2022 01:48:02 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next 9/9] Documentation/ABI: Add new attributes for mlxreg-io sysfs interfaces
Date:   Mon, 11 Jul 2022 11:45:59 +0300
Message-ID: <20220711084559.62447-10-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220711084559.62447-1-vadimp@nvidia.com>
References: <20220711084559.62447-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26f736e5-bb28-4fef-0cee-08da631a1219
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0109:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p/G5iMqsVrAnoy+uykh6KmfLY3RePjmhqEytcxKFiWGDOLAv2lXvC4UovRRIzw3F3kGEnxC8Fgk6I3c8lkVbmOe0AKH+7lzKQzgqZGyWLTn9wVJfL5Vv2wJi4KhzJpX375F8XWH8KzGP+NKJG00L6DkCJjrwvh9rvRixLc4qMCDnBhi/o0HJT0PHPWUrqdMDrmHyjXmUXWh9qYpEVr9NaXC+tAJlDQT+9m/V8Z6K0zb0lZm4fHacfObK/pArktm9ajpjLvwa3uYu6zHY/JKuA0aYKXiBjKQytMnRKC2LKEiE3vN0WqX8DUA0MaKcybGMe8oqJ322K1Km7Pu+Uyaeg1vDbxNG9dNsgO/9cB8WOYeHhfepZP5xsodKQiT3KDddBMsRSItUVBiGAwC8ehcpP9cfyCHboemDhMoWti7hKGurR7QGnsoNRia+XwlxsOu7wzlRpUWI0j/wxPBMjdb687mj+S+PORg7iTfEqXEzSNq8rd16x3kcYmu6t0QNLOMEKp3j9RwgARZC4cYCrwwDowQRaO8Wpi1366US6TNqbUg6nqLSN9r05CFDf/DQD0x4Jeb7s9JSMMyOQU3eZVEtDlKEYInhCc0KiaZCdV3vfXQRV2bVCoUIsgrEtMmqNmvlENCxLdH3V1udaDgXi8AgpSFCX+kXBGyx/7efqxz/YHYtmcR6lwWrV2F+7oHGlWP6019yXeOPaoz4s6ZVGN9Cqo+xhncXLcgWk6m2rMYbJ+kaha3QG2AKjyax3Ir1QbNiOYiyvzvmOmficSoZFwfcG5uSM4OlPU2PlwwfWuUJp2VcxltVDk509eiWBsSo3kfe3GKHOV2qSr6qrvOSo2qsGhtwQh0HbMHCtXaUtUr201k=
X-Forefront-Antispam-Report: CIP:12.22.5.234;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(39860400002)(396003)(346002)(40470700004)(46966006)(36840700001)(107886003)(186003)(336012)(1076003)(47076005)(426003)(2616005)(16526019)(6666004)(41300700001)(478600001)(26005)(36860700001)(81166007)(356005)(82740400003)(8936002)(2906002)(36756003)(5660300002)(54906003)(86362001)(40480700001)(6916009)(316002)(40460700003)(70206006)(8676002)(70586007)(4326008)(82310400005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2022 08:48:04.8402
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26f736e5-bb28-4fef-0cee-08da631a1219
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.234];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT050.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0109
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add documentation for the new attributes:
- "asic2_health" - health of 2-nd ASIC for system equipped with two ASICs.
- "asic_reset" and "asic2_reset" - ASICs reset control.
- "comm_chnl_ready" - communication channel indication to remote end (BMC).
- "config3" - indication of system minor BOM changes.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 .../ABI/stable/sysfs-driver-mlxreg-io         | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/ABI/stable/sysfs-driver-mlxreg-io b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
index 3539b1839829..8d9d1fa0fdf0 100644
--- a/Documentation/ABI/stable/sysfs-driver-mlxreg-io
+++ b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
@@ -503,3 +503,42 @@ Description:	This file shows QSFP ports power status. The value is set to 0
 		0 - Power good, 1 - Not power good.
 
 		The files are read only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/asic2_health
+Date:		July 2022
+KernelVersion:	5.20
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	This file shows 2-nd ASIC health status. The possible values are:
+		0 - health failed, 2 - health OK, 3 - ASIC in booting state.
+
+		The file is read only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/asic_reset
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/asic2_reset
+Date:		July 2022
+KernelVersion:	5.20
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	These files allow to each of AISCs by writing 1.
+
+		The files are write only.
+
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/comm_chnl_ready
+Date:		July 2022
+KernelVersion:	5.20
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	This file is used to indicate remote end (for example BMC) that system
+	        host CPU is ready for sending telemetry data to remote end.
+		For indication the file should be written 1.
+
+		The file is write only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/config3
+Date:		January 2020
+KernelVersion:	5.6
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	The file indicates COME module hardware configuration.
+		The value is pushed by hardware through GPIO pins.
+		The purpose is to expose some minor BOM changes for the same system SKU.
+
+		The file is read only.
-- 
2.20.1

