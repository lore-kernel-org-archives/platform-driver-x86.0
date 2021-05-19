Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E537C433B4
	for <platform-driver-x86@archiver.kernel.org>; Wed, 19 May 2021 17:45:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 03620610A2
	for <platform-driver-x86@archiver.kernel.org>; Wed, 19 May 2021 17:45:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230034AbhESRqX (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 19 May 2021 13:46:23 -0400
Received: from mail-dm6nam10on2048.outbound.protection.outlook.com ([40.107.93.48]:57089
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230023AbhESRqW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 19 May 2021 13:46:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uadc272V6E5P+neu23kC/7dMVUlI9odTMaVoXWkiDOHEcNKku5YwOQYiedymEex17vLjXE+pQGEPDgU+GZjjC6U0D19ak5SFq9xEZ1R+oNg9KmdKtd1UHNspZNk0YAt8XBsvJruRd/17WMQe9GBpSiOB3TxWjJmN3xFvrKW6CPnDPllwhMWUfbOsMdIvppEaRDzAdbH0O5C/wqjXu7gWuu+Os6BMeh+dk4EEWjOiT20qVcIltkwN7ZUprKuk1O2NmOgkHzGo8etX/p2kRDgeMFTPCwNbhjOt7TvLvpoVQw2pZtO2xpKYvjvHnWRVO/y25/SvZJFnaOyy9K3EZ+rzIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d9c1MrTGUFYkibMfmL3ilXw2i2X0l/Sdfmq9zikOlZ8=;
 b=bv21ftMU9vfkDfReNNfN8dnX5SsTWZHjduWyVvSUwVwyfT9iTsQuNuXV+P2eesE7XixjAzISRMGb9QZI0WrC4nosv45oTXoncIbKEH9DX3gnr4pmFD0H86omNZFfgBvD+tQCZnnWJtQeq25SZeXGCSRRVcnQltjhealkCKJuBRsuqJ7Nhfj18WvyG3URbGzZ9K1+zAfvhduWC6hjxkoHMO7DMFmLSYyqeBUR21rqVx60g9/DYOm0At+jpeKlPf1sMTFn2nHxh+65BHlkD6gqyzkjgIFcliDnozTc1gM3ua494oxlgHI3MaIdV8fwkemHrGZNH6UGZz6zwM14faPwjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d9c1MrTGUFYkibMfmL3ilXw2i2X0l/Sdfmq9zikOlZ8=;
 b=ErAOfpp8FWNI9TbuQkdlB48d9QADhSVYCkBLXH5NRO25DCyJcsN2JfxZclgoLA+vJQ+UX0CIgE6cz7R76DdNKGXyUgUbBDj57ir9W2nWKpjClFYLaPg5K1g1DUKYvAJiuFvCfthkGCsTLbFhpKWwyuncigZpJCjjjBm8HYNXtkY=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB2693.namprd12.prod.outlook.com (2603:10b6:a03:6a::33)
 by BY5PR12MB3908.namprd12.prod.outlook.com (2603:10b6:a03:1ae::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Wed, 19 May
 2021 17:45:01 +0000
Received: from BYAPR12MB2693.namprd12.prod.outlook.com
 ([fe80::c0c3:7247:a767:f5b6]) by BYAPR12MB2693.namprd12.prod.outlook.com
 ([fe80::c0c3:7247:a767:f5b6%3]) with mapi id 15.20.4129.033; Wed, 19 May 2021
 17:45:00 +0000
From:   Mario Limonciello <mario.limonciello@amd.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org (open list:X86 PLATFORM DRIVERS)
Cc:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH] platform/x86: Rename hp-wireless to wireless-hotkey
Date:   Wed, 19 May 2021 12:44:05 -0500
Message-Id: <20210519174405.30155-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [165.204.78.25]
X-ClientProxiedBy: SA9PR13CA0119.namprd13.prod.outlook.com
 (2603:10b6:806:24::34) To BYAPR12MB2693.namprd12.prod.outlook.com
 (2603:10b6:a03:6a::33)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from AUS-LX-MLIMONCI.amd.com (165.204.78.25) by SA9PR13CA0119.namprd13.prod.outlook.com (2603:10b6:806:24::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.12 via Frontend Transport; Wed, 19 May 2021 17:44:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eee9de97-9891-4302-fc49-08d91aedd339
X-MS-TrafficTypeDiagnostic: BY5PR12MB3908:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR12MB390877115B7D85AA8106A1E8E22B9@BY5PR12MB3908.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OuwnK/MDNhCpUBnW5lcpSW/j9r8i/oh3bGUk0SEaawdXyT7gFJR8fJ8lEhp4/4wFrVyxkQ0JQxxf3QWXNoq0L69yq861aZozgtufjpmJoMYbHruuED0dE3m5oiLruRu1V+RdceUJJpFzOCNU8BId9JjNGZ2bVDHH2wH7ktA6uZIq0lckOupPzpBRXX3DWAoyVZfE+X3hnxGcpgZMHCPVBdn4qBfdKg330UuU649gK+Xj3rMAO8Rl065a/q6RmD9GEK2NmrTKLBgsQUCMIVraWFHbPoMiN8xygWxCcPKm1yhlVo/ZiofNtqdazl5JiJfpcE5wq/Dt/18THDleix+giDGO+yfbc7etMQ7Us3JJUK7R/st6P9lhQddG0JPqTDUxiDEoYfrYcOasbzb/f/v8SJc+//VPNMGXBE8IV8krOTHVZuV9yHRkKzL24MoqNm4AJnzJxLhbuaXlHeVpZSEsY18i7mEGQaC8+kY/jVtamKOIrlj8guNB87gtUe8d9WMKqr3PfJvhWgT3ApnlA+Yoy0Kh3X8knGm31gWJxqMyK2ZBRf+Cj0vJi2zQHg/7X0OdeSOnCKAJchSMvKzqBDTswByQNTLn9SzhJmVrkWtdpdRNI/xtmnopYpCZ5l7FW949HF1lFUWzHMQnW7GVW+RJS4K55zdN/AJC/oIGSvwuJyw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2693.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(366004)(39860400002)(346002)(136003)(1076003)(26005)(8936002)(4326008)(316002)(52116002)(956004)(7696005)(8676002)(110136005)(2616005)(54906003)(6486002)(66946007)(38100700002)(38350700002)(66556008)(66476007)(6666004)(2906002)(36756003)(44832011)(478600001)(83380400001)(186003)(16526019)(5660300002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?wkYye7pX/0sWbEUkyJw476SR+6zIjL7s9XuCEw4tRMlJ0ioWfL63Fo2tv1od?=
 =?us-ascii?Q?Yln56fa3uMcFhtlwdonkFx2GYzUNOCkro+lssljwWH86P0tYTdjEuvj3R5mq?=
 =?us-ascii?Q?ENSKfyK7qM7RNHQQv23lgCmYCbmd0wY1XotkmQWtWfRcMhmeNn7uI49zwgv5?=
 =?us-ascii?Q?6DR9Ogiv+c82fHr2gObDmpWpMAq6Jl+dRstkdjILVUR4n7UGNNL/pxgsELrh?=
 =?us-ascii?Q?OHSElBuzNQE79ZMflac9ILOjU+6vJx7GmV3oZuDbVHme5EEkHupn3dQ65T82?=
 =?us-ascii?Q?Bb+qhjdWRngRa2FHhf1XltKfQXBtOpZRQ+r7Gq07u5TPPKuv50WWFv52EHUV?=
 =?us-ascii?Q?KyyRL4bwgIzm7YJ7MiAey3TPPg0uHNi0mnduIGO5yXGoFRVaK5XmUUjC8shx?=
 =?us-ascii?Q?IguzqzhwaLp1etEFyBoZBlBqA/Q0bYROnkPZ8TRZmWEjmPRVNVDZvRIvuQZc?=
 =?us-ascii?Q?6DCUunj/s7hFtJO9sbXqjXoJY1NkwEU43DDXPZqOpolkHyux5+flD/JRv18u?=
 =?us-ascii?Q?62XO/Tc/5A8b7g3RY/Pjur4Zr8Ix2OBDRRfVB3CW0gkL5l+E8G3on7oH0g8x?=
 =?us-ascii?Q?3aI4lk74Q2sZvFTG5ncfzBHXSToPBGTedydglExi077whN3aXKEwnUfgfkX9?=
 =?us-ascii?Q?Jx/NMJneomvJ3FSDOa0bootwjk/G/vGI+EQvxTcBkMSy3SaJGMcr9tsHR7Hi?=
 =?us-ascii?Q?tqEOpBFxrBcoXpkU1+6yP1uT/vT0ghkD84bG8QGglSKyZmr2LnYqiMexrGZP?=
 =?us-ascii?Q?PL0lN9sdZdSTKuOQlaY5ErkkzGj1N3cHALJuRPC0azZrTzxbVySHmUnRpg64?=
 =?us-ascii?Q?gRMiGS2fJKY95bLB2HxRrKPTeviFDat34AP02SJ535Jwr2+uqcFbkJ3oJIlV?=
 =?us-ascii?Q?RFMBzPXFt5kEKBpflEiWjUAEeYuHh1jo5QAMx8uSn0684murBBQQDzCANxiu?=
 =?us-ascii?Q?w+nXpY7pvsmZf2Vw3D5pqt9Z6nuUOLrRgj3Oc0zszjxQLUF0o29IEWaDyVxa?=
 =?us-ascii?Q?0VkzL/LCyhqYdqg/ulJ9x4JGGLVzelJmT8ppAjFxljM7goHc6hOb26n4QK5D?=
 =?us-ascii?Q?lYLaV7RHZevM5r0kPHpNXJvwuziHEbVWg6ZgsmMzidnk5mMQGI95+4U40I8Q?=
 =?us-ascii?Q?KK683sBE03PYag5L+Vnz1DxA5b7caKS3mnNk7afwOHdgD6+wHdHNqFE/XkJm?=
 =?us-ascii?Q?2hkj+t2UBQ1dN1PFycXCu442+DfZPXGbPJt9X1HwD6Rto5zFl2R1fTuN/k+5?=
 =?us-ascii?Q?/ID4eIGJmEtQhTSjBkJcdtx9+oxfcqaC/t3H3UTZmBw+pm/UHfjfNTH2cXBX?=
 =?us-ascii?Q?DCnCwllWSRrB7A45eaqMkb72?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eee9de97-9891-4302-fc49-08d91aedd339
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2693.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 17:45:00.5638
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OYr0nuBtpBFOPRn+xlpy0t4NUUOxM/nbK4Ti3GkxmyYmgYI2MN82DnSkwtfNvORjGRMc6UrpqOsoeoy8NK3B1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3908
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This driver was originally intended to support some HP laptops, but
later support was added for Xioami and AMD laptops.

Rename it to make it clear that it supports a larger variety of
systems.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/platform/x86/Kconfig           |   9 ++-
 drivers/platform/x86/Makefile          |   3 +-
 drivers/platform/x86/hp-wireless.c     | 102 ------------------------
 drivers/platform/x86/wireless-hotkey.c | 103 +++++++++++++++++++++++++
 4 files changed, 109 insertions(+), 108 deletions(-)
 delete mode 100644 drivers/platform/x86/hp-wireless.c
 create mode 100644 drivers/platform/x86/wireless-hotkey.c

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 60592fb88e7a..9a668dae2738 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -415,16 +415,17 @@ config HP_ACCEL
 	  To compile this driver as a module, choose M here: the module will
 	  be called hp_accel.
 
-config HP_WIRELESS
-	tristate "HP wireless button"
+config WIRELESS_HOTKEY
+	tristate "Wireless hotkey button"
 	depends on ACPI
 	depends on INPUT
 	help
-	 This driver provides supports for new HP wireless button for Windows 8.
+	 This driver provides supports for the wireless buttons found on some AMD,
+	 HP, & Xioami laptops.
 	 On such systems the driver should load automatically (via ACPI alias).
 
 	 To compile this driver as a module, choose M here: the module will
-	 be called hp-wireless.
+	 be called wireless-hotkey.
 
 config HP_WMI
 	tristate "HP WMI extras"
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index dcc8cdb95b4d..f4e7630186b0 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -52,7 +52,6 @@ obj-$(CONFIG_GPD_POCKET_FAN)	+= gpd-pocket-fan.o
 
 # Hewlett Packard
 obj-$(CONFIG_HP_ACCEL)		+= hp_accel.o
-obj-$(CONFIG_HP_WIRELESS)	+= hp-wireless.o
 obj-$(CONFIG_HP_WMI)		+= hp-wmi.o
 obj-$(CONFIG_TC1100_WMI)	+= tc1100-wmi.o
 
@@ -115,7 +114,7 @@ obj-$(CONFIG_TOPSTAR_LAPTOP)	+= topstar-laptop.o
 obj-$(CONFIG_I2C_MULTI_INSTANTIATE)	+= i2c-multi-instantiate.o
 obj-$(CONFIG_MLX_PLATFORM)		+= mlx-platform.o
 obj-$(CONFIG_TOUCHSCREEN_DMI)		+= touchscreen_dmi.o
-
+obj-$(CONFIG_WIRELESS_HOTKEY)		+= wireless-hotkey.o
 # Intel uncore drivers
 obj-$(CONFIG_INTEL_IPS)				+= intel_ips.o
 obj-$(CONFIG_INTEL_RST)				+= intel-rst.o
diff --git a/drivers/platform/x86/hp-wireless.c b/drivers/platform/x86/hp-wireless.c
deleted file mode 100644
index 0753ef18e721..000000000000
--- a/drivers/platform/x86/hp-wireless.c
+++ /dev/null
@@ -1,102 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- *  Airplane mode button for HP & Xiaomi laptops
- *
- *  Copyright (C) 2014-2017 Alex Hung <alex.hung@canonical.com>
- */
-
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/init.h>
-#include <linux/input.h>
-#include <linux/platform_device.h>
-#include <linux/acpi.h>
-#include <acpi/acpi_bus.h>
-
-MODULE_LICENSE("GPL");
-MODULE_AUTHOR("Alex Hung");
-MODULE_ALIAS("acpi*:HPQ6001:*");
-MODULE_ALIAS("acpi*:WSTADEF:*");
-MODULE_ALIAS("acpi*:AMDI0051:*");
-
-static struct input_dev *hpwl_input_dev;
-
-static const struct acpi_device_id hpwl_ids[] = {
-	{"HPQ6001", 0},
-	{"WSTADEF", 0},
-	{"AMDI0051", 0},
-	{"", 0},
-};
-
-static int hp_wireless_input_setup(void)
-{
-	int err;
-
-	hpwl_input_dev = input_allocate_device();
-	if (!hpwl_input_dev)
-		return -ENOMEM;
-
-	hpwl_input_dev->name = "HP Wireless hotkeys";
-	hpwl_input_dev->phys = "hpq6001/input0";
-	hpwl_input_dev->id.bustype = BUS_HOST;
-	hpwl_input_dev->evbit[0] = BIT(EV_KEY);
-	set_bit(KEY_RFKILL, hpwl_input_dev->keybit);
-
-	err = input_register_device(hpwl_input_dev);
-	if (err)
-		goto err_free_dev;
-
-	return 0;
-
-err_free_dev:
-	input_free_device(hpwl_input_dev);
-	return err;
-}
-
-static void hp_wireless_input_destroy(void)
-{
-	input_unregister_device(hpwl_input_dev);
-}
-
-static void hpwl_notify(struct acpi_device *acpi_dev, u32 event)
-{
-	if (event != 0x80) {
-		pr_info("Received unknown event (0x%x)\n", event);
-		return;
-	}
-
-	input_report_key(hpwl_input_dev, KEY_RFKILL, 1);
-	input_sync(hpwl_input_dev);
-	input_report_key(hpwl_input_dev, KEY_RFKILL, 0);
-	input_sync(hpwl_input_dev);
-}
-
-static int hpwl_add(struct acpi_device *device)
-{
-	int err;
-
-	err = hp_wireless_input_setup();
-	if (err)
-		pr_err("Failed to setup hp wireless hotkeys\n");
-
-	return err;
-}
-
-static int hpwl_remove(struct acpi_device *device)
-{
-	hp_wireless_input_destroy();
-	return 0;
-}
-
-static struct acpi_driver hpwl_driver = {
-	.name	= "hp-wireless",
-	.owner	= THIS_MODULE,
-	.ids	= hpwl_ids,
-	.ops	= {
-		.add	= hpwl_add,
-		.remove	= hpwl_remove,
-		.notify	= hpwl_notify,
-	},
-};
-
-module_acpi_driver(hpwl_driver);
diff --git a/drivers/platform/x86/wireless-hotkey.c b/drivers/platform/x86/wireless-hotkey.c
new file mode 100644
index 000000000000..b010e4ca3383
--- /dev/null
+++ b/drivers/platform/x86/wireless-hotkey.c
@@ -0,0 +1,103 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *  Airplane mode button for AMD, HP & Xiaomi laptops
+ *
+ *  Copyright (C) 2014-2017 Alex Hung <alex.hung@canonical.com>
+ *  Copyright (C) 2021 Advanced Micro Devices
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/input.h>
+#include <linux/platform_device.h>
+#include <linux/acpi.h>
+#include <acpi/acpi_bus.h>
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Alex Hung");
+MODULE_ALIAS("acpi*:HPQ6001:*");
+MODULE_ALIAS("acpi*:WSTADEF:*");
+MODULE_ALIAS("acpi*:AMDI0051:*");
+
+static struct input_dev *wl_input_dev;
+
+static const struct acpi_device_id wl_ids[] = {
+	{"HPQ6001", 0},
+	{"WSTADEF", 0},
+	{"AMDI0051", 0},
+	{"", 0},
+};
+
+static int wireless_input_setup(void)
+{
+	int err;
+
+	wl_input_dev = input_allocate_device();
+	if (!wl_input_dev)
+		return -ENOMEM;
+
+	wl_input_dev->name = "Wireless hotkeys";
+	wl_input_dev->phys = "hpq6001/input0";
+	wl_input_dev->id.bustype = BUS_HOST;
+	wl_input_dev->evbit[0] = BIT(EV_KEY);
+	set_bit(KEY_RFKILL, wl_input_dev->keybit);
+
+	err = input_register_device(wl_input_dev);
+	if (err)
+		goto err_free_dev;
+
+	return 0;
+
+err_free_dev:
+	input_free_device(wl_input_dev);
+	return err;
+}
+
+static void wireless_input_destroy(void)
+{
+	input_unregister_device(wl_input_dev);
+}
+
+static void wl_notify(struct acpi_device *acpi_dev, u32 event)
+{
+	if (event != 0x80) {
+		pr_info("Received unknown event (0x%x)\n", event);
+		return;
+	}
+
+	input_report_key(wl_input_dev, KEY_RFKILL, 1);
+	input_sync(wl_input_dev);
+	input_report_key(wl_input_dev, KEY_RFKILL, 0);
+	input_sync(wl_input_dev);
+}
+
+static int wl_add(struct acpi_device *device)
+{
+	int err;
+
+	err = wireless_input_setup();
+	if (err)
+		pr_err("Failed to setup hp wireless hotkeys\n");
+
+	return err;
+}
+
+static int wl_remove(struct acpi_device *device)
+{
+	wireless_input_destroy();
+	return 0;
+}
+
+static struct acpi_driver wl_driver = {
+	.name	= "wireless-hotkey",
+	.owner	= THIS_MODULE,
+	.ids	= wl_ids,
+	.ops	= {
+		.add	= wl_add,
+		.remove	= wl_remove,
+		.notify	= wl_notify,
+	},
+};
+
+module_acpi_driver(wl_driver);
-- 
2.25.1

