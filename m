Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFCC3C6FD19
	for <platform-driver-x86@archiver.kernel.org>; Tue, 14 Mar 2023 00:08:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229743AbjCNAIE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 13 Mar 2023 20:08:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229664AbjCNAID (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Mar 2023 20:08:03 -0400
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E19C5BDCF;
        Mon, 13 Mar 2023 17:08:01 -0700 (PDT)
From:   =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
        s=mail; t=1678752479;
        bh=24lS7AT/mJMlMTu5fR6dYKGL0CJ7L1D9wf89E1D7eb0=;
        h=From:Date:Subject:To:Cc:From;
        b=qRfRQaiGBZirLnDK+0SyFSagcmW6luCRN6PFEVxbgcLMKHYu1umN3IotIlfLARUzy
         /6C4B+zOMSRok6aHbGZ1kWHP0HHhnWl0lSmPMGeYJD/+jvwQOiNQJnHHw7OC2xVybv
         x2gGZOSF3z5cb1fWujr3iN4j5wEeQ5fCvfVAmF2M=
Date:   Tue, 14 Mar 2023 00:07:52 +0000
Subject: [PATCH] platform/x86: think-lmi: Remove custom kobject sysfs_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230314-think-lmi-sysfs_ops-v1-1-9d4f1cf9caec@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIANe6D2QC/x2N0QrCMAwAf2Xk2cDa7WH1V0Sk3TIbrNloVBxj/
 27w8Q6O20GpMimcmx0qfVh5EQN3amDMUe6EPBmDb33Xdq7HV2Z5YHky6qaz3pZVkYY+RDf4EFI
 CK1NUwlSjjNlaeZdicq008/e/ulyP4wcrffniegAAAA==
To:     Mark Pearson <markpearson@lenovo.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678752477; l=2247;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=24lS7AT/mJMlMTu5fR6dYKGL0CJ7L1D9wf89E1D7eb0=;
 b=kwdNGsBKDqC0SGg4gsX5c+cdmkanAlkbduZs0G6NlNzgTqcR8t+oinfPIZA0KjGDD8ILFmFS+
 hKmx34onCk5DL8eXC2zXvOd+zE/ZQS/1CNLiMmtKcM/49c3XQSa7xre
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

think-lmi defines its own sysfs_ops that are identical to the standard
kobj_sysfs_ops. Use the standard definitions.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---

This has only been compile-tested.
---
 drivers/platform/x86/think-lmi.c | 31 ++-----------------------------
 1 file changed, 2 insertions(+), 29 deletions(-)

diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
index 86b33b74519b..2b5ae68ffce8 100644
--- a/drivers/platform/x86/think-lmi.c
+++ b/drivers/platform/x86/think-lmi.c
@@ -1047,33 +1047,6 @@ static const struct attribute_group tlmi_attr_group = {
 	.attrs = tlmi_attrs,
 };
 
-static ssize_t tlmi_attr_show(struct kobject *kobj, struct attribute *attr,
-				    char *buf)
-{
-	struct kobj_attribute *kattr;
-
-	kattr = container_of(attr, struct kobj_attribute, attr);
-	if (kattr->show)
-		return kattr->show(kobj, kattr, buf);
-	return -EIO;
-}
-
-static ssize_t tlmi_attr_store(struct kobject *kobj, struct attribute *attr,
-				     const char *buf, size_t count)
-{
-	struct kobj_attribute *kattr;
-
-	kattr = container_of(attr, struct kobj_attribute, attr);
-	if (kattr->store)
-		return kattr->store(kobj, kattr, buf, count);
-	return -EIO;
-}
-
-static const struct sysfs_ops tlmi_kobj_sysfs_ops = {
-	.show	= tlmi_attr_show,
-	.store	= tlmi_attr_store,
-};
-
 static void tlmi_attr_setting_release(struct kobject *kobj)
 {
 	struct tlmi_attr_setting *setting = to_tlmi_attr_setting(kobj);
@@ -1091,12 +1064,12 @@ static void tlmi_pwd_setting_release(struct kobject *kobj)
 
 static const struct kobj_type tlmi_attr_setting_ktype = {
 	.release        = &tlmi_attr_setting_release,
-	.sysfs_ops	= &tlmi_kobj_sysfs_ops,
+	.sysfs_ops	= &kobj_sysfs_ops,
 };
 
 static const struct kobj_type tlmi_pwd_setting_ktype = {
 	.release        = &tlmi_pwd_setting_release,
-	.sysfs_ops	= &tlmi_kobj_sysfs_ops,
+	.sysfs_ops	= &kobj_sysfs_ops,
 };
 
 static ssize_t pending_reboot_show(struct kobject *kobj, struct kobj_attribute *attr,

---
base-commit: eeac8ede17557680855031c6f305ece2378af326
change-id: 20230314-think-lmi-sysfs_ops-e849a18299bb

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>

