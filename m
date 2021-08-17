Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A261C4338F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 17 Aug 2021 00:15:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EDC3360F46
	for <platform-driver-x86@archiver.kernel.org>; Tue, 17 Aug 2021 00:15:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232924AbhHQAQB (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 16 Aug 2021 20:16:01 -0400
Received: from mail1.bemta23.messagelabs.com ([67.219.246.116]:50573 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232903AbhHQAQB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 16 Aug 2021 20:16:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com;
        s=Selector; t=1629159328; i=@lenovo.com;
        bh=NoAf1mi8p//4IyNxm3rjZpkFGZ923mCKdQeTPoT0VEk=;
        h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
         MIME-Version:Content-Transfer-Encoding:Content-Type;
        b=mKG+syC0kg3vw/Rq88cD/1tbJ1H8xvOCSv/nSFiHnY0jDHt7AQOne4Oy1AxJshTOb
         vUTqKJrSMSuoMrapfGcPnkKGptLAlY3Yyk0zZqMDMvykwHpFfDTYXYRIHnWMGrlsOR
         vujT9SzouoiUK3eENHHbnt10mTcCLdBOzhEOPtgSX0Q3m8o4yaNvb07uWPoAH+Brk6
         wXF6SniT8rwfPGWakSzG63dSf1kVzYRKaXweqOd2JIv1XTOcFZu1MgPQ88t+dfV7Yt
         YAr3AM5C+B0hjalFQBajcFxkkRwiYd7l4TkNvbS0a9urlVlWqRTWZZlVNdKPK+vMjC
         gKnZEki+bKbzg==
Received: from [100.112.6.161] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-5.bemta.az-c.us-east-1.aws.symcld.net id EB/18-20821-0AFFA116; Tue, 17 Aug 2021 00:15:28 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsWS8eIhr+6C/1K
  JBvdnM1u8OT6dyeJzx2QWi9V7XjA7MHvMOxno8X7fVTaPz5vkApijWDPzkvIrElgz1j7ZwlSw
  Qbdi6/mzTA2Mv9W6GLk4hAT+M0rsOXiWBcJ5wygxf/EF9i5GTg42AW2JLVt+sXUxcnCICMhIf
  FjrCRJmFoiWaH57hRXEFhawkug4uY8RxGYRUJU4/bOZFaScV8BG4tM/P5CwhIC8xOkT18BKOI
  FKznQ9ZgGxhQRUJO4/WMIGYvMKCEqcnPmEBWK8vETz1tnMELaExMEXL5hh5iw5tIkFwk6Q6Pn
  3iG0Co8AsJO2zkLTPQtK+gJF5FaNZUlFmekZJbmJmjq6hgYGuoaGRromukaGZXmKVbrJeabFu
  amJxia6hXmJ5sV5xZW5yTopeXmrJJkZgcKcUsNzYwXjv9Qe9Q4ySHExKory3TkklCvEl5adUZ
  iQWZ8QXleakFh9ilOHgUJLgXXUWKCdYlJqeWpGWmQOMNJi0BAePkgiv4j+gNG9xQWJucWY6RO
  oUo6KUOO+yFUAJAZBERmkeXBssui8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEuYNBhnPk5l
  XAjf9FdBiJqDFPgaSIItLEhFSUg1M080bsq/7nr981/rl3KCVvzrXnuXfPaXOVXxOldjzvI3u
  HNdXcGe2Wb5bZbvg+tOcq9ENwled37Om5Wk9DDDKVrr+IIGFO2dy9z7uk6z3phVrytau2RGiv
  qw6X8HtQO7kWPbuUy+7FsXPaj7rmXyjXFn5i1qv3aFDLMErnZsPCNoanyn/+X3FQwN+ud8yZw
  w4booKbQ/9f8/bdpr3pOeaE/P3q7a0px02/7D8gYqE24/zLx6pPqj7F1H6Y39NgOqcOTOv/ON
  f8u+OaLPW72f+9dOeFIdtsvy907ig/Cq77q4nS14uV7He18MxObWV41DkyujMPpmGnz4/hMSf
  CVV4O56+MMX67aYXvQ9cDp0QV2Ipzkg01GIuKk4EAKhlThBpAwAA
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-5.tower-406.messagelabs.com!1629159327!22713!1
X-Originating-IP: [104.232.225.13]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9438 invoked from network); 17 Aug 2021 00:15:28 -0000
Received: from unknown (HELO lenovo.com) (104.232.225.13)
  by server-5.tower-406.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Aug 2021 00:15:28 -0000
Received: from reswpmail01.lenovo.com (unknown [10.62.32.20])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id D379CD2C9E48270EAC7F;
        Mon, 16 Aug 2021 20:15:27 -0400 (EDT)
Received: from localhost.localdomain.com (10.38.59.27) by
 reswpmail01.lenovo.com (10.62.32.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Mon, 16 Aug 2021 20:15:27 -0400
From:   Mark Pearson <markpearson@lenovo.com>
To:     <markpearson@lenovo.com>
CC:     <hdegoede@redhat.com>, <mgross@linux.intel.com>,
        <platform-driver-x86@vger.kernel.org>
Subject: [PATCH v2] platform/x86: think-lmi: add debug_cmd
Date:   Mon, 16 Aug 2021 20:15:01 -0400
Message-ID: <20210817001501.293501-1-markpearson@lenovo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <markpearson@lenovo.com>
References: <markpearson@lenovo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.38.59.27]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Many Lenovo BIOS's support the ability to send a debug command which
is useful for debugging and testing unreleased or early features.

Adding support for this feature as a module parameter.

Signed-off-by: Mark Pearson <markpearson@lenovo.com>
---
Changes in v2: 
 - Updated to use debug_support parameter to enable feature
 - remove changes to pending_reboot as that was integrated separately

 .../testing/sysfs-class-firmware-attributes   | 11 +++
 drivers/platform/x86/think-lmi.c              | 80 +++++++++++++++++++
 drivers/platform/x86/think-lmi.h              |  1 +
 3 files changed, 92 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-class-firmware-attributes b/Documentation/ABI/testing/sysfs-class-firmware-attributes
index 0b43997b76e3..90fdf935aa5e 100644
--- a/Documentation/ABI/testing/sysfs-class-firmware-attributes
+++ b/Documentation/ABI/testing/sysfs-class-firmware-attributes
@@ -272,3 +272,14 @@ Description:
 
 		Note that any changes to this attribute requires a reboot
 		for changes to take effect.
+
+What:		/sys/class/firmware-attributes/*/attributes/debug_cmd
+Date:		July 2021
+KernelVersion:	5.14
+Contact:	Mark Pearson <markpearson@lenovo.com>
+Description:
+		This write only attribute can be used to send debug commands to the BIOS.
+		This should only be used when recommended by the BIOS vendor. Vendors may
+		use it to enable extra debug attributes or BIOS features for testing purposes.
+
+		Note that any changes to this attribute requires a reboot for changes to take effect.
diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
index 6cfed4427fb0..4d246bfe4907 100644
--- a/drivers/platform/x86/think-lmi.c
+++ b/drivers/platform/x86/think-lmi.c
@@ -20,6 +20,10 @@
 #include "firmware_attributes_class.h"
 #include "think-lmi.h"
 
+static bool debug_support;
+module_param(debug_support, bool, 0644);
+MODULE_PARM_DESC(debug_support, "Enable debug command support");
+
 /*
  * Name:
  *  Lenovo_BiosSetting
@@ -116,6 +120,14 @@
  */
 #define LENOVO_GET_BIOS_SELECTIONS_GUID	"7364651A-132F-4FE7-ADAA-40C6C7EE2E3B"
 
+/*
+ * Name:
+ *  Lenovo_DebugCmdGUID
+ * Description
+ *  Debug entry GUID method for entering debug commands to the BIOS
+ */
+#define LENOVO_DEBUG_CMD_GUID "7FF47003-3B6C-4E5E-A227-E979824A85D1"
+
 #define TLMI_POP_PWD (1 << 0)
 #define TLMI_PAP_PWD (1 << 1)
 #define to_tlmi_pwd_setting(kobj)  container_of(kobj, struct tlmi_pwd_setting, kobj)
@@ -660,6 +672,64 @@ static ssize_t pending_reboot_show(struct kobject *kobj, struct kobj_attribute *
 
 static struct kobj_attribute pending_reboot = __ATTR_RO(pending_reboot);
 
+/* ---- Debug interface--------------------------------------------------------- */
+static ssize_t debug_cmd_store(struct kobject *kobj, struct kobj_attribute *attr,
+				const char *buf, size_t count)
+{
+	char *set_str = NULL, *new_setting = NULL;
+	char *auth_str = NULL;
+	char *p;
+	int ret;
+
+	if (!tlmi_priv.can_debug_cmd)
+		return -EOPNOTSUPP;
+
+	new_setting = kstrdup(buf, GFP_KERNEL);
+	if (!new_setting)
+		return -ENOMEM;
+
+	/* Strip out CR if one is present */
+	p = strchrnul(new_setting, '\n');
+	*p = '\0';
+
+	if (tlmi_priv.pwd_admin->valid && tlmi_priv.pwd_admin->password[0]) {
+		auth_str = kasprintf(GFP_KERNEL, "%s,%s,%s;",
+				tlmi_priv.pwd_admin->password,
+				encoding_options[tlmi_priv.pwd_admin->encoding],
+				tlmi_priv.pwd_admin->kbdlang);
+		if (!auth_str) {
+			ret = -ENOMEM;
+			goto out;
+		}
+	}
+
+	if (auth_str)
+		set_str = kasprintf(GFP_KERNEL, "%s,%s", new_setting, auth_str);
+	else
+		set_str = kasprintf(GFP_KERNEL, "%s;", new_setting);
+	if (!set_str) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	ret = tlmi_simple_call(LENOVO_DEBUG_CMD_GUID, set_str);
+	if (ret)
+		goto out;
+
+	if (!ret && !tlmi_priv.pending_changes) {
+		tlmi_priv.pending_changes = true;
+		/* let userland know it may need to check reboot pending again */
+		kobject_uevent(&tlmi_priv.class_dev->kobj, KOBJ_CHANGE);
+	}
+out:
+	kfree(auth_str);
+	kfree(set_str);
+	kfree(new_setting);
+	return ret ?: count;
+}
+
+static struct kobj_attribute debug_cmd = __ATTR_WO(debug_cmd);
+
 /* ---- Initialisation --------------------------------------------------------- */
 static void tlmi_release_attr(void)
 {
@@ -673,6 +743,8 @@ static void tlmi_release_attr(void)
 		}
 	}
 	sysfs_remove_file(&tlmi_priv.attribute_kset->kobj, &pending_reboot.attr);
+	if (tlmi_priv.can_debug_cmd && debug_support)
+		sysfs_remove_file(&tlmi_priv.attribute_kset->kobj, &debug_cmd.attr);
 	kset_unregister(tlmi_priv.attribute_kset);
 
 	/* Authentication structures */
@@ -737,6 +809,11 @@ static int tlmi_sysfs_init(void)
 	if (ret)
 		goto fail_create_attr;
 
+	if (tlmi_priv.can_debug_cmd && debug_support) {
+		ret = sysfs_create_file(&tlmi_priv.attribute_kset->kobj, &debug_cmd.attr);
+		if (ret)
+			goto fail_create_attr;
+	}
 	/* Create authentication entries */
 	tlmi_priv.authentication_kset = kset_create_and_add("authentication", NULL,
 								&tlmi_priv.class_dev->kobj);
@@ -793,6 +870,9 @@ static int tlmi_analyze(void)
 	if (wmi_has_guid(LENOVO_BIOS_PASSWORD_SETTINGS_GUID))
 		tlmi_priv.can_get_password_settings = true;
 
+	if (wmi_has_guid(LENOVO_DEBUG_CMD_GUID))
+		tlmi_priv.can_debug_cmd = true;
+
 	/*
 	 * Try to find the number of valid settings of this machine
 	 * and use it to create sysfs attributes.
diff --git a/drivers/platform/x86/think-lmi.h b/drivers/platform/x86/think-lmi.h
index eb598846628a..f8e26823075f 100644
--- a/drivers/platform/x86/think-lmi.h
+++ b/drivers/platform/x86/think-lmi.h
@@ -61,6 +61,7 @@ struct think_lmi {
 	bool can_set_bios_password;
 	bool can_get_password_settings;
 	bool pending_changes;
+	bool can_debug_cmd;
 
 	struct tlmi_attr_setting *setting[TLMI_SETTINGS_COUNT];
 	struct device *class_dev;
-- 
2.31.1

