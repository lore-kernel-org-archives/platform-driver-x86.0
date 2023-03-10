Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 474AEC6FA99
	for <platform-driver-x86@archiver.kernel.org>; Fri, 10 Mar 2023 04:22:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229928AbjCJEWV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 9 Mar 2023 23:22:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230458AbjCJEV2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 9 Mar 2023 23:21:28 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 778FA49C7
        for <platform-driver-x86@vger.kernel.org>; Thu,  9 Mar 2023 20:17:42 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id i5so4344103pla.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 09 Mar 2023 20:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678421862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zWwHAJvXIA6FrwtdzJgFWLE3BeAFx0q8iSi2aXx6gGI=;
        b=DhAbJRHiThcPzVhffhRy6woepQYZ079JdguMhR18v1lWMS4BzMtP8mZmOkZDfXd1uR
         bcUf2KyYrBrir5BqnZJJRRocu5FtUAbSkSSsV5afQh7RNARGuCBvcDSgpw7HRuljcK+k
         MNd2dJt/sIQHfQDi8/Xovh0yQYBtYjZ4P3xqFLhLhPdTI8uVrPVN6QQKlUXQPRr+yw0M
         CgOYHY3mqD5y6KglmJq2TID99wvJmxDNXtuMgfduE0J2ttd78jJPnreI5PWgHabyiRm8
         Oq34N0iLXvpqSYrdnf4QxkpbX8qRQ51nKIFIKSiC+92xtAcPt/N9MFjG5nzbU9O8vGpv
         SNrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678421862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zWwHAJvXIA6FrwtdzJgFWLE3BeAFx0q8iSi2aXx6gGI=;
        b=kIyhToXtB9b/u/ju78k++yV29vm5pwjunao/zgFKyMwvGBFkoIg2OHLVaMcDkQVv4S
         Oe+7g5S/2/uL5EJrJIGKE7FziNbFBm3hdOhWo3W0svIePWEp2k+8JJlQcR92oMBIibz+
         WrdPQsEVQV0jeUzWe02hqK1rwmaEhEkWUuQSFfbyUWh70LYu/wUq+PFpL8Vhpys2VKDe
         7gTzslChBb6O9h83TKHNIvKbvxU3l/Tz8DuN9AZQtdgMMCaQzAHfTvM8Z6kGTAEG8Dot
         4KiPr8E5l220HVcAwzQgiF5zgnaXcBPw+ec3s2Vr444JAc8WCSEN2mW24xpmNRS2EUd1
         7Drw==
X-Gm-Message-State: AO0yUKWYSNIJtSJBGKkl35HwJi1ss2bb7RHpZV0jyeRXE2vJQmdJXCi6
        Jw/SUcFE04H9PcNvtN2v44lE3AAY5XsQUA==
X-Google-Smtp-Source: AK7set+kAXM0deuXwljTQfqsObWKWtt9LcRfz9XQ3sgB1krktbImTQ0cpE5Co90u8dHvXirxk3XUFQ==
X-Received: by 2002:a17:902:db02:b0:19c:edcd:26cf with SMTP id m2-20020a170902db0200b0019cedcd26cfmr25895082plx.61.1678421861652;
        Thu, 09 Mar 2023 20:17:41 -0800 (PST)
Received: from localhost.localdomain ([47.147.242.129])
        by smtp.gmail.com with ESMTPSA id u8-20020a170902e5c800b0019a928a8982sm388406plf.118.2023.03.09.20.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 20:17:41 -0800 (PST)
From:   Andrew Kallmeyer <kallmeyeras@gmail.com>
To:     platform-driver-x86@vger.kernel.org, hdegoede@redhat.com,
        soyer@irl.hu
Cc:     Andrew Kallmeyer <kallmeyeras@gmail.com>
Subject: [PATCH 1/2] platform/x86: Move ideapad ACPI helpers to a new header
Date:   Thu,  9 Mar 2023 20:17:25 -0800
Message-Id: <20230310041726.217447-2-kallmeyeras@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310041726.217447-1-kallmeyeras@gmail.com>
References: <20221004214332.35934-1-soyer@irl.hu>
 <20230310041726.217447-1-kallmeyeras@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

These functions will be used by a driver written by Gergo Koteles to
detect the tablet mode switch in Lenovo Yoga laptops. These changes were
discussed in review of that patch.

This is the minimal set of functions needed in that driver, there are
several more small functions left in the ACPI Helpers section in
ideapad-laptop.c. The only change is the functions are now marked inline
as requested in the review comments.

Link: https://lore.kernel.org/r/20221004214332.35934-1-soyer@irl.hu/
Signed-off-by: Andrew Kallmeyer <kallmeyeras@gmail.com>
---
 drivers/platform/x86/ideapad-laptop.c | 135 +----------------------
 drivers/platform/x86/ideapad-laptop.h | 151 ++++++++++++++++++++++++++
 2 files changed, 152 insertions(+), 134 deletions(-)
 create mode 100644 drivers/platform/x86/ideapad-laptop.h

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index 0eb5bfdd8..55f56697e 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -20,7 +20,6 @@
 #include <linux/init.h>
 #include <linux/input.h>
 #include <linux/input/sparse-keymap.h>
-#include <linux/jiffies.h>
 #include <linux/kernel.h>
 #include <linux/leds.h>
 #include <linux/module.h>
@@ -31,6 +30,7 @@
 #include <linux/sysfs.h>
 #include <linux/types.h>
 #include <linux/wmi.h>
+#include "ideapad-laptop.h"
 
 #include <acpi/video.h>
 
@@ -85,33 +85,6 @@ enum {
 	SALS_FNLOCK_OFF       = 0xf,
 };
 
-enum {
-	VPCCMD_R_VPC1 = 0x10,
-	VPCCMD_R_BL_MAX,
-	VPCCMD_R_BL,
-	VPCCMD_W_BL,
-	VPCCMD_R_WIFI,
-	VPCCMD_W_WIFI,
-	VPCCMD_R_BT,
-	VPCCMD_W_BT,
-	VPCCMD_R_BL_POWER,
-	VPCCMD_R_NOVO,
-	VPCCMD_R_VPC2,
-	VPCCMD_R_TOUCHPAD,
-	VPCCMD_W_TOUCHPAD,
-	VPCCMD_R_CAMERA,
-	VPCCMD_W_CAMERA,
-	VPCCMD_R_3G,
-	VPCCMD_W_3G,
-	VPCCMD_R_ODD, /* 0x21 */
-	VPCCMD_W_FAN,
-	VPCCMD_R_RF,
-	VPCCMD_W_RF,
-	VPCCMD_R_FAN = 0x2B,
-	VPCCMD_R_SPECIAL_BUTTONS = 0x31,
-	VPCCMD_W_BL_POWER = 0x33,
-};
-
 struct ideapad_dytc_priv {
 	enum platform_profile_option current_profile;
 	struct platform_profile_handler pprof;
@@ -227,7 +200,6 @@ static void ideapad_shared_exit(struct ideapad_private *priv)
 /*
  * ACPI Helpers
  */
-#define IDEAPAD_EC_TIMEOUT 200 /* in ms */
 
 static int eval_int(acpi_handle handle, const char *name, unsigned long *res)
 {
@@ -270,116 +242,11 @@ static int exec_sals(acpi_handle handle, unsigned long arg)
 	return exec_simple_method(handle, "SALS", arg);
 }
 
-static int eval_int_with_arg(acpi_handle handle, const char *name, unsigned long arg, unsigned long *res)
-{
-	struct acpi_object_list params;
-	unsigned long long result;
-	union acpi_object in_obj;
-	acpi_status status;
-
-	params.count = 1;
-	params.pointer = &in_obj;
-	in_obj.type = ACPI_TYPE_INTEGER;
-	in_obj.integer.value = arg;
-
-	status = acpi_evaluate_integer(handle, (char *)name, &params, &result);
-	if (ACPI_FAILURE(status))
-		return -EIO;
-
-	if (res)
-		*res = result;
-
-	return 0;
-}
-
 static int eval_dytc(acpi_handle handle, unsigned long cmd, unsigned long *res)
 {
 	return eval_int_with_arg(handle, "DYTC", cmd, res);
 }
 
-static int eval_vpcr(acpi_handle handle, unsigned long cmd, unsigned long *res)
-{
-	return eval_int_with_arg(handle, "VPCR", cmd, res);
-}
-
-static int eval_vpcw(acpi_handle handle, unsigned long cmd, unsigned long data)
-{
-	struct acpi_object_list params;
-	union acpi_object in_obj[2];
-	acpi_status status;
-
-	params.count = 2;
-	params.pointer = in_obj;
-	in_obj[0].type = ACPI_TYPE_INTEGER;
-	in_obj[0].integer.value = cmd;
-	in_obj[1].type = ACPI_TYPE_INTEGER;
-	in_obj[1].integer.value = data;
-
-	status = acpi_evaluate_object(handle, "VPCW", &params, NULL);
-	if (ACPI_FAILURE(status))
-		return -EIO;
-
-	return 0;
-}
-
-static int read_ec_data(acpi_handle handle, unsigned long cmd, unsigned long *data)
-{
-	unsigned long end_jiffies, val;
-	int err;
-
-	err = eval_vpcw(handle, 1, cmd);
-	if (err)
-		return err;
-
-	end_jiffies = jiffies + msecs_to_jiffies(IDEAPAD_EC_TIMEOUT) + 1;
-
-	while (time_before(jiffies, end_jiffies)) {
-		schedule();
-
-		err = eval_vpcr(handle, 1, &val);
-		if (err)
-			return err;
-
-		if (val == 0)
-			return eval_vpcr(handle, 0, data);
-	}
-
-	acpi_handle_err(handle, "timeout in %s\n", __func__);
-
-	return -ETIMEDOUT;
-}
-
-static int write_ec_cmd(acpi_handle handle, unsigned long cmd, unsigned long data)
-{
-	unsigned long end_jiffies, val;
-	int err;
-
-	err = eval_vpcw(handle, 0, data);
-	if (err)
-		return err;
-
-	err = eval_vpcw(handle, 1, cmd);
-	if (err)
-		return err;
-
-	end_jiffies = jiffies + msecs_to_jiffies(IDEAPAD_EC_TIMEOUT) + 1;
-
-	while (time_before(jiffies, end_jiffies)) {
-		schedule();
-
-		err = eval_vpcr(handle, 1, &val);
-		if (err)
-			return err;
-
-		if (val == 0)
-			return 0;
-	}
-
-	acpi_handle_err(handle, "timeout in %s\n", __func__);
-
-	return -ETIMEDOUT;
-}
-
 /*
  * debugfs
  */
diff --git a/drivers/platform/x86/ideapad-laptop.h b/drivers/platform/x86/ideapad-laptop.h
new file mode 100644
index 000000000..7dd8ce027
--- /dev/null
+++ b/drivers/platform/x86/ideapad-laptop.h
@@ -0,0 +1,151 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *  ideapad-laptop.h - Lenovo IdeaPad ACPI Extras
+ *
+ *  Copyright © 2010 Intel Corporation
+ *  Copyright © 2010 David Woodhouse <dwmw2@infradead.org>
+ */
+
+#ifndef _IDEAPAD_LAPTOP_H_
+#define _IDEAPAD_LAPTOP_H_
+
+#include <linux/acpi.h>
+#include <linux/jiffies.h>
+#include <linux/errno.h>
+
+enum {
+	VPCCMD_R_VPC1 = 0x10,
+	VPCCMD_R_BL_MAX,
+	VPCCMD_R_BL,
+	VPCCMD_W_BL,
+	VPCCMD_R_WIFI,
+	VPCCMD_W_WIFI,
+	VPCCMD_R_BT,
+	VPCCMD_W_BT,
+	VPCCMD_R_BL_POWER,
+	VPCCMD_R_NOVO,
+	VPCCMD_R_VPC2,
+	VPCCMD_R_TOUCHPAD,
+	VPCCMD_W_TOUCHPAD,
+	VPCCMD_R_CAMERA,
+	VPCCMD_W_CAMERA,
+	VPCCMD_R_3G,
+	VPCCMD_W_3G,
+	VPCCMD_R_ODD, /* 0x21 */
+	VPCCMD_W_FAN,
+	VPCCMD_R_RF,
+	VPCCMD_W_RF,
+	VPCCMD_R_FAN = 0x2B,
+	VPCCMD_R_SPECIAL_BUTTONS = 0x31,
+	VPCCMD_W_BL_POWER = 0x33,
+};
+
+static inline int eval_int_with_arg(acpi_handle handle, const char *name, unsigned long arg, unsigned long *res)
+{
+	struct acpi_object_list params;
+	unsigned long long result;
+	union acpi_object in_obj;
+	acpi_status status;
+
+	params.count = 1;
+	params.pointer = &in_obj;
+	in_obj.type = ACPI_TYPE_INTEGER;
+	in_obj.integer.value = arg;
+
+	status = acpi_evaluate_integer(handle, (char *)name, &params, &result);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	if (res)
+		*res = result;
+
+	return 0;
+}
+
+static inline int eval_vpcr(acpi_handle handle, unsigned long cmd, unsigned long *res)
+{
+	return eval_int_with_arg(handle, "VPCR", cmd, res);
+}
+
+static inline int eval_vpcw(acpi_handle handle, unsigned long cmd, unsigned long data)
+{
+	struct acpi_object_list params;
+	union acpi_object in_obj[2];
+	acpi_status status;
+
+	params.count = 2;
+	params.pointer = in_obj;
+	in_obj[0].type = ACPI_TYPE_INTEGER;
+	in_obj[0].integer.value = cmd;
+	in_obj[1].type = ACPI_TYPE_INTEGER;
+	in_obj[1].integer.value = data;
+
+	status = acpi_evaluate_object(handle, "VPCW", &params, NULL);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	return 0;
+}
+
+#define IDEAPAD_EC_TIMEOUT 200 /* in ms */
+
+static inline int read_ec_data(acpi_handle handle, unsigned long cmd, unsigned long *data)
+{
+	unsigned long end_jiffies, val;
+	int err;
+
+	err = eval_vpcw(handle, 1, cmd);
+	if (err)
+		return err;
+
+	end_jiffies = jiffies + msecs_to_jiffies(IDEAPAD_EC_TIMEOUT) + 1;
+
+	while (time_before(jiffies, end_jiffies)) {
+		schedule();
+
+		err = eval_vpcr(handle, 1, &val);
+		if (err)
+			return err;
+
+		if (val == 0)
+			return eval_vpcr(handle, 0, data);
+	}
+
+	acpi_handle_err(handle, "timeout in %s\n", __func__);
+
+	return -ETIMEDOUT;
+}
+
+static inline int write_ec_cmd(acpi_handle handle, unsigned long cmd, unsigned long data)
+{
+	unsigned long end_jiffies, val;
+	int err;
+
+	err = eval_vpcw(handle, 0, data);
+	if (err)
+		return err;
+
+	err = eval_vpcw(handle, 1, cmd);
+	if (err)
+		return err;
+
+	end_jiffies = jiffies + msecs_to_jiffies(IDEAPAD_EC_TIMEOUT) + 1;
+
+	while (time_before(jiffies, end_jiffies)) {
+		schedule();
+
+		err = eval_vpcr(handle, 1, &val);
+		if (err)
+			return err;
+
+		if (val == 0)
+			return 0;
+	}
+
+	acpi_handle_err(handle, "timeout in %s\n", __func__);
+
+	return -ETIMEDOUT;
+}
+
+#undef IDEAPAD_EC_TIMEOUT
+#endif /* !_IDEAPAD_LAPTOP_H_ */
-- 
2.39.2

