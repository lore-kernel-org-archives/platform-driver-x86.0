Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B42CC11F64
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Jun 2021 20:03:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5F9D761CB8
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Jun 2021 20:03:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233004AbhF1UGL (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 28 Jun 2021 16:06:11 -0400
Received: from mail1.bemta24.messagelabs.com ([67.219.250.5]:58518 "EHLO
        mail1.bemta24.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235388AbhF1UGK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 28 Jun 2021 16:06:10 -0400
Received: from [100.112.131.194] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-5.bemta.az-a.us-west-2.aws.symcld.net id F0/99-57636-B1B2AD06; Mon, 28 Jun 2021 20:03:39 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMIsWRWlGSWpSXmKPExsWS8eIhr6609q0
  Eg+ePJC3eHJ/OZLH2zxcWi88dk1ksVu95wezA4tF66S+bx7yTgR7v911l8/i8SS6AJYo1My8p
  vyKBNWP16kXsBVNFKponHGNrYDwn2MXIxSEk8J9R4t6mdhYI5wmjxP62o4xdjJwcbALaElu2/
  GLrYuTgEBGQkfiw1hMkzCxQIbFp3TYWEFtYwEVi4/5TTCA2i4CqxJ35PewgNq+AlcTV18/BbA
  kBeYnTJ66BjeQEqjnT9RisV0hAReL+gyVsEPWCEidnPmGBmC8v0bx1NjOELSFx8MULZog5ChJ
  v3u+Dmpkg0fPvEdsERoFZSNpnIWmfhaR9ASPzKkaLpKLM9IyS3MTMHF1DAwNdQ0MjXUMjS11D
  YxO9xCrdRL3SYt3y1OISXSO9xPJiveLK3OScFL281JJNjMCwTylobNvBOPPNB71DjJIcTEqiv
  DnPbiYI8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuB9pnErQUiwKDU9tSItMwcYgzBpCQ4eJRHeM2
  pAad7igsTc4sx0iNQpRkUpcV57kD4BkERGaR5cGyzuLzHKSgnzMjIwMAjxFKQW5WaWoMq/YhT
  nYFQS5uXQBJrCk5lXAjf9FdBiJqDFi57cBFlckoiQkmpgsmSY/42Vr/VcpsE2Nt7oy3Mja5aH
  GYi/yqiPntPzYutv3ue3DnwqnfIkuuD+ivPR5oYq03s+vXzb9vnug6hvLw2LCr4un2wpF6NzT
  ipfdqGfmdDzKMOZ3soaN7gXcb1oS3fctP3oRB+hk9KpmXzCRe69m57mfQu7lKG89LZZ3/P9X6
  yvMmmdtvyXYBp+cN/7uee8GCIzLY1qb10sPsGfLKAvfJ6vxiF+QmboykPMDNv50398F75g+E0
  piy/JY/pm9xPswWrZX9y373yuMYnjRmDZR7Zp/MZNM+qfaZ7UP66iLadodSv+hUOeRF7ziSsT
  Muqnz57qJfQ5tGee3qytp5Yv9XJTEGwvr97QP2G1EktxRqKhFnNRcSIAKC7DUHYDAAA=
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-7.tower-335.messagelabs.com!1624910618!15423!1
X-Originating-IP: [104.232.225.13]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18095 invoked from network); 28 Jun 2021 20:03:39 -0000
Received: from unknown (HELO lenovo.com) (104.232.225.13)
  by server-7.tower-335.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 28 Jun 2021 20:03:39 -0000
Received: from reswpmail01.lenovo.com (unknown [10.62.32.20])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id 3868211D5A2442133370;
        Mon, 28 Jun 2021 16:03:38 -0400 (EDT)
Received: from fedora.Lenovo.com (10.38.106.36) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2176.2; Mon, 28 Jun
 2021 16:03:37 -0400
From:   Mark Pearson <markpearson@lenovo.com>
To:     <markpearson@lenovo.com>
CC:     <hdegoede@redhat.com>, <mgross@linux.intel.com>,
        <platform-driver-x86@vger.kernel.org>, <mario.limnociello@amd.com>
Subject: [PATCH] platform/x86: think-lmi: Add pending_reboot support
Date:   Mon, 28 Jun 2021 16:03:25 -0400
Message-ID: <20210628200325.8240-1-markpearson@lenovo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <markpearson@lenovo.com>
References: <markpearson@lenovo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.38.106.36]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

ThetThink-lmi driver was missing pending_reboot support as it wasn't
available from the BIOS. Turns out this is really useful to have from
user space so implementing from a purely SW point of view.

Thanks to Mario Limonciello for guidance on how fwupd would use this.

Signed-off-by: Mark Pearson <markpearson@lenovo.com>
---
 drivers/platform/x86/think-lmi.c | 19 +++++++++++++++++++
 drivers/platform/x86/think-lmi.h |  1 +
 2 files changed, 20 insertions(+)

diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
index b57061079..bcc3d6fcd 100644
--- a/drivers/platform/x86/think-lmi.c
+++ b/drivers/platform/x86/think-lmi.c
@@ -566,6 +566,11 @@ static ssize_t current_value_store(struct kobject *kobj,
 	else
 		ret = tlmi_save_bios_settings("");
 
+	if (!ret && !tlmi_priv.pending_changes) {
+		tlmi_priv.pending_changes = true;
+		/* let userland know it may need to check reboot pending again */
+		kobject_uevent(&tlmi_priv.class_dev->kobj, KOBJ_CHANGE);
+	}
 out:
 	kfree(auth_str);
 	kfree(set_str);
@@ -641,6 +646,14 @@ static struct kobj_type tlmi_pwd_setting_ktype = {
 	.sysfs_ops	= &tlmi_kobj_sysfs_ops,
 };
 
+static ssize_t pending_reboot_show(struct kobject *kobj, struct kobj_attribute *attr,
+				   char *buf)
+{
+	return sprintf(buf, "%d\n", tlmi_priv.pending_changes);
+}
+
+static struct kobj_attribute pending_reboot = __ATTR_RO(pending_reboot);
+
 /* ---- Initialisation --------------------------------------------------------- */
 static void tlmi_release_attr(void)
 {
@@ -662,6 +675,7 @@ static void tlmi_release_attr(void)
 	sysfs_remove_group(&tlmi_priv.pwd_power->kobj, &auth_attr_group);
 	kobject_put(&tlmi_priv.pwd_power->kobj);
 	kset_unregister(tlmi_priv.authentication_kset);
+	sysfs_remove_file(&tlmi_priv.class_dev->kobj, &pending_reboot.attr);
 }
 
 static int tlmi_sysfs_init(void)
@@ -730,6 +744,11 @@ static int tlmi_sysfs_init(void)
 	if (ret)
 		goto fail_create_attr;
 
+	/* Create global sysfs files */
+	ret = sysfs_create_file(&tlmi_priv.class_dev->kobj, &pending_reboot.attr);
+	if (ret)
+		goto fail_create_attr;
+
 	return ret;
 
 fail_create_attr:
diff --git a/drivers/platform/x86/think-lmi.h b/drivers/platform/x86/think-lmi.h
index 6fa8da7af..eb5988466 100644
--- a/drivers/platform/x86/think-lmi.h
+++ b/drivers/platform/x86/think-lmi.h
@@ -60,6 +60,7 @@ struct think_lmi {
 	bool can_get_bios_selections;
 	bool can_set_bios_password;
 	bool can_get_password_settings;
+	bool pending_changes;
 
 	struct tlmi_attr_setting *setting[TLMI_SETTINGS_COUNT];
 	struct device *class_dev;
-- 
2.31.1

