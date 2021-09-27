Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9999C433FE
	for <platform-driver-x86@archiver.kernel.org>; Mon, 27 Sep 2021 20:24:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C516B6101A
	for <platform-driver-x86@archiver.kernel.org>; Mon, 27 Sep 2021 20:24:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236965AbhI0U0U (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 27 Sep 2021 16:26:20 -0400
Received: from mail-dm6nam10on2059.outbound.protection.outlook.com ([40.107.93.59]:25530
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236921AbhI0U0T (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Sep 2021 16:26:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QLu6DOCtx/7AGEaKfISPYjC4ZujAo/vK6CIXxSsMKRIWw2lN+NY8pnUgNIOrOcfb15UMtHhPsEUMNuGC1PUNtRojEkJK/QKmTEjupTtqbLMKQICpIk1Hgh2zItWIlP9rj8DHxeM7Bjz0RPnfPAX0XY/k3uBWVi3d2mofMu3cD8kMNU3EhGMmZN9XizU12v0mB2HBtMXtRBzMXkbrMlyuoWdTyIv4ZlQqree9nLmbUEpN2xk5iMdEQUQlbJ6PcIKJ1OD3hjLsMMrEWaS5yQQ/JJAJpARMtfy0AFa9WlGzcsi/egmkmvLdmN0Ox7KLFKLK30cpp/tsSRWfcejBVC8l6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=mcDJWXN3rujwSkW4UKuJsKyCX2H/OIEK5jqxwJBiGgI=;
 b=hTdSc4FQACGr5DgaPNTcTKlizXmovBAGMCLSpMJ6hfu9DDbocEatFtKLMaiL9xqvzbR85WiThpNxS71dCJeTL3fATLRJkE4RRLANN5uv8UtvTEvx6RNhQwrlGtar24EbAGAF8eenW8SvPrTSkfM3E1f4uzrc+vR62PXZK0ZffNWrDHjEAavXfDs9pg42CZy8PcTv4zlzmEaVo1gEnLQn5Cn+HPg7T5Wl6Je3M+mGD7ssxp7ASxeeCY5T6972foK8lnrQT6BaFi1u1yPYVfZDADd4omgbWBtsrfsWZiI2+dfrD6LHjplRM9C27V1kPOaEDuJ95DQqo7TSh7wj5hb0nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.36) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mcDJWXN3rujwSkW4UKuJsKyCX2H/OIEK5jqxwJBiGgI=;
 b=A2ILKAgO1Z5RvtJ2D4077bbeKerkep2aXiaav81389D2DNfnqMn4xNp/bAr9Oi6GEIFRpXBuuxD0eHrNOqrl+CdlyxUIds8cRG/QXpUSUe/YNUnMtGWeXTOZ0UuZuckcWjV/vnkObPVSTxSWKmKbpwPbZ8vJdeMmvYFv5hTPmLswaD6y++Jkp2TGRI9ItZEz4+U1Ox1lvIWaMKYamkZzTrfkmwpIgDGA56HjRzibpwdECrY7Nh9vBXa7vy8rlVRIv3nkuiPakIkkfdTaWyN90jBDnsOeTdpRYG0k1SrRIy+zxRpPLu+vP8A42pbDGCPrNmEXBNzZvlkRZ8VInhlRCA==
Received: from BN0PR07CA0020.namprd07.prod.outlook.com (2603:10b6:408:141::18)
 by MWHPR12MB1213.namprd12.prod.outlook.com (2603:10b6:300:f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Mon, 27 Sep
 2021 20:24:39 +0000
Received: from BN8NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:141:cafe::2b) by BN0PR07CA0020.outlook.office365.com
 (2603:10b6:408:141::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15 via Frontend
 Transport; Mon, 27 Sep 2021 20:24:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.36)
 smtp.mailfrom=nvidia.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.36 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.36; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.36) by
 BN8NAM11FT039.mail.protection.outlook.com (10.13.177.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4544.13 via Frontend Transport; Mon, 27 Sep 2021 20:24:39 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 27 Sep
 2021 20:24:38 +0000
Received: from dude.nvidia.com (172.20.187.6) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 27 Sep
 2021 20:24:37 +0000
From:   Daniel Dadap <ddadap@nvidia.com>
To:     <platform-driver-x86@vger.kernel.org>
CC:     <hdegoede@redhat.com>, <pali@kernel.org>,
        Daniel Dadap <ddadap@nvidia.com>
Subject: [PATCH 2/2] platform/x86: Rename wmaa-backlight-wmi to nvidia-wmi-ec-backlight
Date:   Mon, 27 Sep 2021 15:23:59 -0500
Message-ID: <20210927202359.13684-2-ddadap@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210927202359.13684-1-ddadap@nvidia.com>
References: <9cbb4e7a-4af9-32f8-0293-6c2ef7d44ceb@redhat.com>
 <20210927202359.13684-1-ddadap@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 260cbe48-746c-4464-712d-08d981f4d4cf
X-MS-TrafficTypeDiagnostic: MWHPR12MB1213:
X-Microsoft-Antispam-PRVS: <MWHPR12MB12139C2E9657F32786CA9AD2BCA79@MWHPR12MB1213.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: phGOj4EdUs/lHYAfnjPt6eki7o2nVODShMA/su85pkg4zBcyNx1VgGlBbsejMG9A8q6UPqDaivTqQfedmm7ry/Ifzji/1pYdGKJ61hRsUfJ3jbwkYo4X+0TH4USh+bSCGUnAZTPf7jhIdRloNh0mtg/qyUAQqJuBOA0nwpMdllE6QTd9GDRorHMk8kzGjKAuvfNwAHWt2Tm4oB3Z558YBO0w7lpmYpfDj3vi0PvltoPSUdFwb6tt7tbu0gz/BwfLGdE+P8fLomdj6oj3pRQlNO/ZpHcgdfXKnXo+ZvZkhppX6o3/27cobO3RNDyKr7hVQzZ67rvWqVXQ4sF89jcrVuTNlYEuHtBu+bZbz5ukWPuU2JNx+y+TvFjitPjMlEbcksQuojJUi8o+qLDQIKqgg/v4ycHLKboTJC15zbc3R2bhLf5lzI+zL+hebwpextkyq3vTnoUGAgoRmaftT6GseDcxaZ/guXFenN6E6flGTIOKdzpSCBQSH7pHpD6yP3rK8FR4T5A3Skm18Zrl2Q2Cdk+3tIarf9hIx0NoVPCU0MBrHQ+Lj622S7XyihmEV0j9OsBtDb/r4EAy7Bh8v+0kuaruydbznk/F7UhVOK3bqfEkEGjxPhjZHOWUtuDrgnSM24+lXKGI0FISrMR+jrydWaYbO/L3pUes5vKC4y2ZEnaFhoXtNZPbuj0rKxoalOc7yv+dmphgUCOQpLr+4yuGIg==
X-Forefront-Antispam-Report: CIP:216.228.112.36;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid05.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(16526019)(82310400003)(6666004)(8936002)(6916009)(508600001)(426003)(336012)(47076005)(83380400001)(107886003)(4326008)(70586007)(70206006)(2616005)(186003)(7696005)(36860700001)(2906002)(36756003)(54906003)(8676002)(1076003)(26005)(356005)(5660300002)(86362001)(36906005)(316002)(7636003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 20:24:39.0464
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 260cbe48-746c-4464-712d-08d981f4d4cf
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.36];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1213
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Rename the wmaa-backlight-wmi driver and associated KConfig option to
remove the remaining references to the "WMAA" ACPI handle which was
used in the previous name. The driver has already been updated to
remove internal references to "WMAA". As part of the renaming, the
components in the name have been rearranged to reflect the standard
vendor_wmi_feature pattern.

Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
---
 MAINTAINERS                                       | 12 ++++++------
 drivers/platform/x86/Kconfig                      | 15 +++++++--------
 drivers/platform/x86/Makefile                     |  2 +-
 ...-backlight-wmi.c => nvidia-wmi-ec-backlight.c} |  0
 4 files changed, 14 insertions(+), 15 deletions(-)
 rename drivers/platform/x86/{wmaa-backlight-wmi.c => nvidia-wmi-ec-backlight.c} (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2b990794ec35..eb2d54b36ab3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13423,6 +13423,12 @@ S:	Maintained
 F:	drivers/video/fbdev/nvidia/
 F:	drivers/video/fbdev/riva/
 
+NVIDIA WMI EC BACKLIGHT DRIVER
+M:	Daniel Dadap <ddadap@nvidia.com>
+L:	platform-driver-x86@vger.kernel.org
+S:	Supported
+F:	drivers/platform/x86/nvidia-wmi-ec-backlight.c
+
 NVM EXPRESS DRIVER
 M:	Keith Busch <kbusch@kernel.org>
 M:	Jens Axboe <axboe@fb.com>
@@ -20302,12 +20308,6 @@ L:	linux-wireless@vger.kernel.org
 S:	Odd fixes
 F:	drivers/net/wireless/wl3501*
 
-WMAA BACKLIGHT DRIVER
-M:	Daniel Dadap <ddadap@nvidia.com>
-L:	platform-driver-x86@vger.kernel.org
-S:	Supported
-F:	drivers/platform/x86/wmaa-backlight-wmi.c
-
 WOLFSON MICROELECTRONICS DRIVERS
 L:	patches@opensource.cirrus.com
 S:	Supported
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index f3dbb0273884..520da0a6acd1 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -91,21 +91,20 @@ config PEAQ_WMI
 	help
 	 Say Y here if you want to support WMI-based hotkeys on PEAQ 2-in-1s.
 
-config WMAA_BACKLIGHT_WMI
-	tristate "ACPI WMAA Backlight Driver"
+config NVIDIA_WMI_EC_BACKLIGHT
+	tristate "EC Backlight Driver for Hybrid Graphics Notebook Systems"
 	depends on ACPI_WMI
 	depends on BACKLIGHT_CLASS_DEVICE
 	help
-	  This driver provides a sysfs backlight interface for notebook
-	  systems which expose the WMAA ACPI method and an associated WMI
-	  wrapper to drive LCD backlight levels through the Embedded Controller
-	  (EC).
+	  This driver provides a sysfs backlight interface for notebook systems
+	  which are equipped with NVIDIA hybrid graphics and drive LCD backlight
+	  levels through the Embedded Controller (EC).
 
 	  Say Y or M here if you want to control the backlight on a notebook
-	  system with an EC-driven backlight using the ACPI WMAA method.
+	  system with an EC-driven backlight.
 
 	  If you choose to compile this driver as a module the module will be
-	  called wmaa-backlight-wmi.
+	  called nvidia-wmi-ec-backlight.
 
 config XIAOMI_WMI
 	tristate "Xiaomi WMI key driver"
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index edde481c14ad..0d046ed70da1 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -11,8 +11,8 @@ obj-$(CONFIG_WMI_BMOF)		+= wmi-bmof.o
 # WMI drivers
 obj-$(CONFIG_HUAWEI_WMI)		+= huawei-wmi.o
 obj-$(CONFIG_MXM_WMI)			+= mxm-wmi.o
+obj-$(CONFIG_NVIDIA_WMI_EC_BACKLIGHT)	+= nvidia-wmi-ec-backlight.o
 obj-$(CONFIG_PEAQ_WMI)			+= peaq-wmi.o
-obj-$(CONFIG_WMAA_BACKLIGHT_WMI)	+= wmaa-backlight-wmi.o
 obj-$(CONFIG_XIAOMI_WMI)		+= xiaomi-wmi.o
 obj-$(CONFIG_GIGABYTE_WMI)		+= gigabyte-wmi.o
 
diff --git a/drivers/platform/x86/wmaa-backlight-wmi.c b/drivers/platform/x86/nvidia-wmi-ec-backlight.c
similarity index 100%
rename from drivers/platform/x86/wmaa-backlight-wmi.c
rename to drivers/platform/x86/nvidia-wmi-ec-backlight.c
-- 
2.20.1

