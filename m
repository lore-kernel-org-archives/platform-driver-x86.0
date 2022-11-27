Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 747B8C4321E
	for <platform-driver-x86@archiver.kernel.org>; Sun, 27 Nov 2022 00:49:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbiK0AtK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 26 Nov 2022 19:49:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229513AbiK0AtJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 26 Nov 2022 19:49:09 -0500
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2053.outbound.protection.outlook.com [40.107.223.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D026BFD14
        for <platform-driver-x86@vger.kernel.org>; Sat, 26 Nov 2022 16:49:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Grf2D0MBHwccy9E+i5igO9kauempLZ/bOIdkXPnZo2bGx75zpzi25Uvxxur4q0xfEsKTKxIHWZpiXP2/f8GzHes4PFJnGkx/YvVEbL8WyDsQF2dhyTIue7UeW6u2RNGLu687zPZy2uzrQ+IE/8mvAAolMll8bo4yTNrQTgKdxNuaXd95bdrd4VpjD6fCzgC5OjYjh7lLf4/59sTHoTWiZeWGm6DDfbR1wEpmIUW2ZH/ZwdzQxL/ywUeAj2wTNM2M9ZKOrZA3D/uHshs5uOaeH00Ha3mW6wKd1UjpW4mfCfXLEXrSE8RYEY7GUONFzWN1Nvcj6MXA9XLXbaTpGHntgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8B7tMBP/HPkqkBNV93J/d6Xk7a7hFGo7fryiYrFLW1w=;
 b=AL3TQfAhi9FDcAxWkvptDScZrx7Se9dQvWrlTRrAB+84h2m/oTdHdVLuSdZZXruqHD1I8TeIIy3NMhVoaqUYQs9Jcmd2bKR8mBjGuk98XlUj20yLzBKULNX9+zplxdQRaJmCX8rXgc7oLzKpvfV6vdbQPhvwzFejW3dndFGblVOu0zJvZJ4oA9BBrS2vRSHdS4Z3JlN54Beqw8OncSnRR4L+3XERYO3O6RCsm3oGvNFx+5o/XNS++JYqNPQsjgGG3kCCs/UOHAvlQjS35y0T3dC6u4OjCs+z9wiphXVnn5sUlHC9aN9wUtG/+RWsHChxlLIowVo8k4k+0sw50uy3qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8B7tMBP/HPkqkBNV93J/d6Xk7a7hFGo7fryiYrFLW1w=;
 b=KF+R3YAtfzpkVodi2NSbn/MM1GaPFTPZ3+h3/5c510LDi96oBfN27sU14B37ZtZopt3iEXKjhsjgQv0gdCKio6zdvyPBvMLgX8U0S7ILHO1rUGvMR1ExH67VAYhdBmNCsDlgjPjl75A5VYoe1lr738Slf5z8tUyaHEIyYVWb3Q8=
Received: from BN9PR03CA0890.namprd03.prod.outlook.com (2603:10b6:408:13c::25)
 by MW5PR12MB5649.namprd12.prod.outlook.com (2603:10b6:303:19d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Sun, 27 Nov
 2022 00:49:05 +0000
Received: from BN8NAM11FT093.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13c:cafe::f5) by BN9PR03CA0890.outlook.office365.com
 (2603:10b6:408:13c::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.21 via Frontend
 Transport; Sun, 27 Nov 2022 00:49:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT093.mail.protection.outlook.com (10.13.177.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5857.17 via Frontend Transport; Sun, 27 Nov 2022 00:49:05 +0000
Received: from dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sat, 26 Nov
 2022 18:49:04 -0600
From:   Alex Hung <alex.hung@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>,
        <platform-driver-x86@vger.kernel.org>
CC:     Alex Hung <alexhung@gmail.com>
Subject: [PATCH] platform/x86: wireless-hotkey: use ACPI HID as phys
Date:   Sat, 26 Nov 2022 17:46:17 -0700
Message-ID: <20221127004617.722553-1-alex.hung@amd.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT093:EE_|MW5PR12MB5649:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ff433ab-7914-4dee-4cea-08dad0112f52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RG/J2B4pt6ddLg58w2mwHsc+/w2eYsFK4oaScba3yhlFXKJArBUkHN7rlM4VCgpyxd+pYwzvS2fAWhxjQ6dAqYEz5ziByYpwoviYcBCXsR4RlAllQHbzwdVo/LFqPFGemz+ku9ojFaHqU+JtnPc5v7CfGIBxpJb5SJDAz2oxC+HwBuqdoWl9P9+ZPG6QztIGxTblPvw+VzYwl98muHfvaYZGSpqwN2hLev8KVwRiBcqzOzcmRj2T4OanBLxDslJYlthBILg1XjPU2Wgtc49WGxHACikgVG5lcB69g5pJJ3K5kgGyAzjFxj+naADhEY+wzlWAlCiSGyPpS1VDkWXjOxZfTDvrJSAdaKfTeUlB7W4W9oNbyAs/ZDrL25bnfHYlXmDfdwfODDnDu6yAxOO0BfOq2vSEz9bq+2Gb2Uc/3SGW/6655HpOaOq9jL+FsVpya4FgO7jZvJgS+nbIrji0ADFJOxCkP85sWcXh9DZC63r/S/38VRRVMoO851ALf1IacGZpyi60ZVxlwLjUYOBmf2rSfo+tTTb60cGVN2sNTa7Ez4aofuwjYTMXZMxK+Yh+rsJuPMmusBme18AOyFjI29xkbDafqc3R4O1PQhkJMPhTtgmCcCuXD7u6KTHnQxyLk1EXiz0MpwMfGVLOqCcvwmy1eIepxhGkJY5zADIHDimGPtCf/iMD1K7LYa+dVRck9ZpYXlZTdMJ8CYkWfwqiCph/HeRIFcoq/L+KbgFnTOU=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(346002)(376002)(136003)(451199015)(40470700004)(36840700001)(46966006)(6666004)(478600001)(8676002)(70206006)(316002)(1076003)(40460700003)(41300700001)(36756003)(26005)(8936002)(7696005)(186003)(336012)(2616005)(16526019)(5660300002)(110136005)(44832011)(83380400001)(40480700001)(70586007)(426003)(47076005)(4326008)(82740400003)(86362001)(36860700001)(356005)(81166007)(82310400005)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2022 00:49:05.2822
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ff433ab-7914-4dee-4cea-08dad0112f52
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT093.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5649
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Alex Hung <alexhung@gmail.com>

Removed the hardcoded "hpq6001" as phys but uses ACPI HID instead.

Signed-off-by: Alex Hung <alexhung@gmail.com>
---
 drivers/platform/x86/wireless-hotkey.c | 60 +++++++++++++++++---------
 1 file changed, 40 insertions(+), 20 deletions(-)

diff --git a/drivers/platform/x86/wireless-hotkey.c b/drivers/platform/x86/wireless-hotkey.c
index 11c60a273446..eb48ca060bad 100644
--- a/drivers/platform/x86/wireless-hotkey.c
+++ b/drivers/platform/x86/wireless-hotkey.c
@@ -20,7 +20,10 @@ MODULE_ALIAS("acpi*:HPQ6001:*");
 MODULE_ALIAS("acpi*:WSTADEF:*");
 MODULE_ALIAS("acpi*:AMDI0051:*");
 
-static struct input_dev *wl_input_dev;
+struct wl_button {
+	struct input_dev *input_dev;
+	char phys[32];
+};
 
 static const struct acpi_device_id wl_ids[] = {
 	{"HPQ6001", 0},
@@ -29,63 +32,80 @@ static const struct acpi_device_id wl_ids[] = {
 	{"", 0},
 };
 
-static int wireless_input_setup(void)
+static int wireless_input_setup(struct acpi_device *device)
 {
+	struct wl_button *button = acpi_driver_data(device);
 	int err;
 
-	wl_input_dev = input_allocate_device();
-	if (!wl_input_dev)
+	button->input_dev = input_allocate_device();
+	if (!button->input_dev)
 		return -ENOMEM;
 
-	wl_input_dev->name = "Wireless hotkeys";
-	wl_input_dev->phys = "hpq6001/input0";
-	wl_input_dev->id.bustype = BUS_HOST;
-	wl_input_dev->evbit[0] = BIT(EV_KEY);
-	set_bit(KEY_RFKILL, wl_input_dev->keybit);
+	snprintf(button->phys, sizeof(button->phys), "%s/input0", acpi_device_hid(device));
+
+	button->input_dev->name = "Wireless hotkeys";
+	button->input_dev->phys = button->phys;
+	button->input_dev->id.bustype = BUS_HOST;
+	button->input_dev->evbit[0] = BIT(EV_KEY);
+	set_bit(KEY_RFKILL, button->input_dev->keybit);
 
-	err = input_register_device(wl_input_dev);
+	err = input_register_device(button->input_dev);
 	if (err)
 		goto err_free_dev;
 
 	return 0;
 
 err_free_dev:
-	input_free_device(wl_input_dev);
+	input_free_device(button->input_dev);
 	return err;
 }
 
-static void wireless_input_destroy(void)
+static void wireless_input_destroy(struct acpi_device *device)
 {
-	input_unregister_device(wl_input_dev);
+	struct wl_button *button = acpi_driver_data(device);
+
+	input_unregister_device(button->input_dev);
+	kfree(button);
 }
 
 static void wl_notify(struct acpi_device *acpi_dev, u32 event)
 {
+	struct wl_button *button = acpi_driver_data(acpi_dev);
+
 	if (event != 0x80) {
 		pr_info("Received unknown event (0x%x)\n", event);
 		return;
 	}
 
-	input_report_key(wl_input_dev, KEY_RFKILL, 1);
-	input_sync(wl_input_dev);
-	input_report_key(wl_input_dev, KEY_RFKILL, 0);
-	input_sync(wl_input_dev);
+	input_report_key(button->input_dev, KEY_RFKILL, 1);
+	input_sync(button->input_dev);
+	input_report_key(button->input_dev, KEY_RFKILL, 0);
+	input_sync(button->input_dev);
 }
 
 static int wl_add(struct acpi_device *device)
 {
+	struct wl_button *button;
 	int err;
 
-	err = wireless_input_setup();
-	if (err)
+	button = kzalloc(sizeof(struct wl_button), GFP_KERNEL);
+	if (!button)
+		return -ENOMEM;
+
+	device->driver_data = button;
+
+	err = wireless_input_setup(device);
+	if (err) {
 		pr_err("Failed to setup wireless hotkeys\n");
+		kfree(button);
+	}
 
 	return err;
 }
 
 static int wl_remove(struct acpi_device *device)
 {
-	wireless_input_destroy();
+	wireless_input_destroy(device);
 	return 0;
 }
 
-- 
2.38.1

