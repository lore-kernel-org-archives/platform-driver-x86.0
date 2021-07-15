Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6F70C636C9
	for <platform-driver-x86@archiver.kernel.org>; Thu, 15 Jul 2021 23:09:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 89C46613DF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 15 Jul 2021 23:09:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231274AbhGOXMA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 15 Jul 2021 19:12:00 -0400
Received: from mail1.bemta24.messagelabs.com ([67.219.250.116]:10980 "EHLO
        mail1.bemta24.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231246AbhGOXMA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 15 Jul 2021 19:12:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com;
        s=Selector; t=1626390546; i=@lenovo.com;
        bh=BJ8cKkkz1RhLQfBA/D+VHdOxxM2T+KEr31KAwUlcAQE=;
        h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
         MIME-Version:Content-Transfer-Encoding:Content-Type;
        b=jGn3K1fjTYjboTQHuI3coSN4Wo+tFkYkC+8V+GR748ydDLmRXXiule0Trtu+29pj7
         5amA6BqfGJa8LcBFA0ZKoiZpPlTS7pyDqA+TMvYHTvgK3Q75Gi6PyqNjGhbj//Nv1V
         5oPAkf9e9V7kJEfJItnYNzO0fvIy4r9fx0qR90wbxp4+as8mrbuBpTQDoR+GExu6GP
         CxPRiWf2vj5b5CdnyqPoYqVP2hFY959PD2Bz292HiAfynhJ9BfHZNIiKB+4nR+4I2s
         w9znJ77oHICh+zhUjCyW8J1UEGymx0DpsNR1yapj/j/NVnD4aP+Qj7BCDmS6Fiy/V6
         E6wCRbFhQbrPw==
Received: from [100.112.134.162] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-5.bemta.az-b.us-west-2.aws.symcld.net id 8D/FE-26959-110C0F06; Thu, 15 Jul 2021 23:09:05 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsWS8eIhj67ggQ8
  JBhe/CFm8OT6dyeJzx2QWi9V7XjA7MHvMOxno8X7fVTaPz5vkApijWDPzkvIrElgzpnz+zl6w
  Rqdi585LzA2M09W6GLk4hAT+M0o8a+hkhXDeMErMXHqTsYuRk4NNQFtiy5ZfbF2MHBwiAjISH
  9Z6goSZBaIlmt9eYQWxhQXMJc6ePM8IUsIioCqx+7QQSJhXwEbi4ZpzTCC2hIC8xOkT18Amcg
  KVnOl6zAJiCwmoSNx/sIQNol5Q4uTMJywQ4+UlmrfOZoawJSQOvnjBDDFHQeLW8xYWCDtBouf
  fI7YJjAKzkLTPQtI+C0n7AkbmVYzmSUWZ6RkluYmZObqGBga6hoZGuobGRrpmxnqJVbpJeqXF
  uuWpxSW6RnqJ5cV6xZW5yTkpenmpJZsYgeGdUtBiv4NxxpsPeocYJTmYlER5t9R/SBDiS8pPq
  cxILM6ILyrNSS0+xCjDwaEkwdu9DygnWJSanlqRlpkDjDWYtAQHj5IIb9x2oDRvcUFibnFmOk
  TqFKOilDhvPEifAEgiozQPrg0W35cYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfNGgUzhycw
  rgZv+CmgxE9Bi7TVvQRaXJCKkpBqYlvt8qpmt8/9O5xLtuzeNT0VdDqxVLEq7oaFuO6PrvWec
  eNxF3c+q+yPjr6zWt+O0ki0p5S+R8t//s0hfxoWjZ0ekDPtTrdXMs3PvPpavEU9v3J/1p03PW
  rrJ4V3lF6ucqNeFt25cnR7ueXKZa/vydEZjzXSr2hVJSyb08jw9JN+q73z08utb9RPSLT63tW
  fOY+MqyVxjWrQlTTA3hHPJf+dtwdmZqQIe119ca23MLPtlXWwRsGu2EOvC+Lb9tn6L7u+sOLg
  q/oF78Imb1mmz1j2b+79ca4mvRkbXl+p86zVXUr9MmvJKIpKv1v5z1rrtM17/nXB/6u3Ge3dU
  P3Fd4j9jcn2Ou7D+19ZjcUeUWIozEg21mIuKEwHLFilGagMAAA==
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-3.tower-346.messagelabs.com!1626390544!31108!1
X-Originating-IP: [104.232.225.12]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12313 invoked from network); 15 Jul 2021 23:09:05 -0000
Received: from unknown (HELO lenovo.com) (104.232.225.12)
  by server-3.tower-346.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Jul 2021 23:09:05 -0000
Received: from reswpmail01.lenovo.com (unknown [10.62.32.20])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id ECB87E75B949E489881B;
        Thu, 15 Jul 2021 19:09:03 -0400 (EDT)
Received: from localhost.localdomain.com (10.38.110.74) by
 reswpmail01.lenovo.com (10.62.32.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2176.2; Thu, 15 Jul 2021 19:09:03 -0400
From:   Mark Pearson <markpearson@lenovo.com>
To:     <markpearson@lenovo.com>
CC:     <hdegoede@redhat.com>, <mgross@linux.intel.com>,
        <platform-driver-x86@vger.kernel.org>
Subject: [PATCH] platform/x86: think-lmi: add debug_cmd
Date:   Thu, 15 Jul 2021 19:08:50 -0400
Message-ID: <20210715230850.389961-1-markpearson@lenovo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <markpearson@lenovo.com>
References: <markpearson@lenovo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.38.110.74]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Many Lenovo BIOS's support the ability to send a debug command which
is useful for debugging and testing unreleased or early features.
Adding support for this feature.

Also moved the pending_reboot node under attributes dir where it should
correctly live. Got that wrong in my last commit and realised as I was
updating the documentation for debug_cmd

Signed-off-by: Mark Pearson <markpearson@lenovo.com>
---
 .../testing/sysfs-class-firmware-attributes   | 11 +++
 drivers/platform/x86/think-lmi.c              | 77 ++++++++++++++++++-
 drivers/platform/x86/think-lmi.h              |  1 +
 3 files changed, 88 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-class-firmware-attributes b/Documentation/ABI/testing/sysfs-class-firmware-attributes
index 3348bf80a37c..db0aa2939efc 100644
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
index 64dcec53a7a0..d58d4b155139 100644
--- a/drivers/platform/x86/think-lmi.c
+++ b/drivers/platform/x86/think-lmi.c
@@ -116,6 +116,14 @@
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
@@ -660,6 +668,63 @@ static ssize_t pending_reboot_show(struct kobject *kobj, struct kobj_attribute *
 
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
+static struct kobj_attribute debug_cmd = __ATTR_WO(debug_cmd);
+
 /* ---- Initialisation --------------------------------------------------------- */
 static void tlmi_release_attr(void)
 {
@@ -681,6 +746,8 @@ static void tlmi_release_attr(void)
 	kobject_put(&tlmi_priv.pwd_power->kobj);
 	kset_unregister(tlmi_priv.authentication_kset);
 	sysfs_remove_file(&tlmi_priv.class_dev->kobj, &pending_reboot.attr);
+	if (tlmi_priv.can_debug_cmd)
+		sysfs_remove_file(&tlmi_priv.class_dev->kobj, &debug_cmd.attr);
 }
 
 static int tlmi_sysfs_init(void)
@@ -761,10 +828,15 @@ static int tlmi_sysfs_init(void)
 		goto fail_create_attr;
 
 	/* Create global sysfs files */
-	ret = sysfs_create_file(&tlmi_priv.class_dev->kobj, &pending_reboot.attr);
+	ret = sysfs_create_file(&tlmi_priv.attribute_kset->kobj, &pending_reboot.attr);
 	if (ret)
 		goto fail_create_attr;
 
+	if (tlmi_priv.can_debug_cmd) {
+		ret = sysfs_create_file(&tlmi_priv.attribute_kset->kobj, &debug_cmd.attr);
+		if (ret)
+			goto fail_create_attr;
+	}
 	return ret;
 
 fail_create_attr:
@@ -796,6 +868,9 @@ static int tlmi_analyze(void)
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

