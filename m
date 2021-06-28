Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C400DC11F64
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Jun 2021 22:29:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9917361CED
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Jun 2021 22:29:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235371AbhF1Wbf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 28 Jun 2021 18:31:35 -0400
Received: from mail1.bemta23.messagelabs.com ([67.219.246.116]:9423 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235319AbhF1Wbe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 28 Jun 2021 18:31:34 -0400
Received: from [100.112.4.164] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-5.bemta.az-c.us-east-1.aws.symcld.net id 92/22-54191-43D4AD06; Mon, 28 Jun 2021 22:29:08 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrIIsWRWlGSWpSXmKPExsWSLveKTdfY91a
  CwZUnBhZvjk9nsli8fhmjxeeOySwWq/e8YHZg8Wi99JfNY97JQI/3+66yeXzeJBfAEsWamZeU
  X5HAmvHo+Er2gv2iFY0rfrA1MN4S6mLk4hAS+M8o0XttMyuE84RRYvLBs0xdjJwcbALaElu2/
  GLrYuTgEBGQkfiw1hMkzCxQITHlSRcjiC0s4C5xc95iZhCbRUBV4ujEF2CtvAJWEnsnP2EHsS
  UE5CVOn7gGVs8JVHOm6zELiC0koCJx/8ESNoh6QYmTM5+wQMyXl2jeOpsZwpaQOPjiBTPEHAW
  JN+/3Qc1MkOj594htAqPALCTts5C0z0LSvoCReRWjWVJRZnpGSW5iZo6uoYGBrqGhka6JrpGx
  hV5ilW6yXmmxbmpicYmuoV5iebFecWVuck6KXl5qySZGYMinFLC828F49vUHvUOMkhxMSqK8N
  21uJQjxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4G30BsoJFqWmp1akZeYA4w8mLcHBoyTCm+wJlO
  YtLkjMLc5Mh0idYlSUEueVBekTAElklObBtcFi/hKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkY
  lYd42kPE8mXklcNNfAS1mAlq86MlNkMUliQgpqQYm9amiizYtu+y2vn67oFmw5WaPtSVPpt9+
  Ovms0ClD0e8eBd/tyx3soo7kznFeY1lzX/0FyzTe4/GVj7x3v2pfO3FrdBSXuGZwacah2r1KC
  84Gs+62+9p5pXjpjrt17c7ldS5rxXPncJfvjuZKMdI7/OrRpzt90nM86yfZWM1wuG167316d8
  RB+2szHXs572hrHrl9QpK5wtbgegRfru3s1Q88H3d+X2Ivm8yfEaTU++5UbcgzZt/ke2vOMr0
  +rSidyrFWc4pe2bNDjxeZSr3ZEqvdsq2ET3zDFhbGE8IT5Z26y9Ovznbn37iiTeHw3K2BJ1Yb
  TFm8y/DRtdKNj4U/bsqLNpCRee6ev+GbxKGpSizFGYmGWsxFxYkA+gKPTXQDAAA=
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-14.tower-415.messagelabs.com!1624919346!40344!1
X-Originating-IP: [103.30.234.6]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11709 invoked from network); 28 Jun 2021 22:29:07 -0000
Received: from unknown (HELO lenovo.com) (103.30.234.6)
  by server-14.tower-415.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 28 Jun 2021 22:29:07 -0000
Received: from reswpmail01.lenovo.com (unknown [10.62.32.20])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id ACC4776C00445E394572;
        Tue, 29 Jun 2021 06:29:04 +0800 (CST)
Received: from fedora.Lenovo.com (10.38.106.36) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2176.2; Mon, 28 Jun
 2021 18:28:59 -0400
From:   Mark Pearson <markpearson@lenovo.com>
To:     <markpearson@lenovo.com>
CC:     <hdegoede@redhat.com>, <mgross@linux.intel.com>,
        <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>
Subject: [PATCH v2] platform/x86: think-lmi: Add pending_reboot support
Date:   Mon, 28 Jun 2021 18:28:46 -0400
Message-ID: <20210628222846.8830-1-markpearson@lenovo.com>
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

The Think-lmi driver was missing pending_reboot support as it wasn't
available from the BIOS. Turns out this is really useful to have from
user space so implementing from a purely SW point of view.

Thanks to Mario Limonciello for guidance on how fwupd would use this.

Suggested-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Mark Pearson <markpearson@lenovo.com>
---
Changes in v2: 
  - added in Mario's Suggested-by tag (and will use correct email when
    submitting patch)

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

