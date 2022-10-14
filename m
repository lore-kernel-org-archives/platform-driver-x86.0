Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36E32C4332F
	for <platform-driver-x86@archiver.kernel.org>; Fri, 14 Oct 2022 23:27:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229648AbiJNX1c (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 14 Oct 2022 19:27:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbiJNX1b (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 14 Oct 2022 19:27:31 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC08E6747B
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Oct 2022 16:27:30 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id p24-20020a9d6958000000b00661c528849eso2715679oto.9
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Oct 2022 16:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m8kK6rLItF/0pjg44b3n/aGs0jVKQfAhuUkNBxFA9lk=;
        b=l030jiI9DLzuY27nTR5PO8E51Z51dxQPFexz34xUcTd4miao54Ycjzl4h0rJVAATju
         v0nuwwGIeM363gB6VnFZqh3otSzqXo0xn4wPxy4cL6mBXPleIBV/k4W0K+52MrM1dJd/
         AUOO+jp6b6FWfavama+6V/tfQl2G0ItmZnOASMAsr/jMw4UCXYWArsPTgH/7dtsBAmIM
         2Vy/xw+JRc0p69DuMgxE5uTsC2F/4elp9ZrsLmcjs3bDCC3HMcv6HN1L6DY3ZIUS1CGA
         AnetQKUM/KVeH6+1CelLkNvyg6NEKxL3MxVW5ddCiR82UvPcts1YZk6UheHMiwxZbYKT
         6IDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m8kK6rLItF/0pjg44b3n/aGs0jVKQfAhuUkNBxFA9lk=;
        b=x3vNMLnYQTJWUHsoS9cJzhuBmcfcDt6tvtIL6ULJBywt+jJD6hvKjB6Hr/ZVYwOqea
         pNjxhpjeBhHWSxvUIRTcuA0ZGNiH27+ujgibFzFp5wtZbLXkPuicNutzJrBo91ab8T2A
         VChAly02TUMa63DYols9wp0d7VWRk2FTzuFFWVKJXoyjVqnzjEjpP6RAxq4yuv7Pd2W4
         BgzyKuTKB68/bCGkhWndQys5FB8yoqllblIcDb46UJ7DNDcocDUIiaxgijjFXiG6uk4h
         Lp8RM+Yh7WOuZ7mGYuHb3lleZShOifHYY9h4kVjpTvQQXXftkSTZu54JRMer1Ou/wn/o
         atAw==
X-Gm-Message-State: ACrzQf0uABgeUECX6jJg1X8AN235Neuz6QqVEPCadsOsy+hM+bAF19Pw
        mFZtDGGeGYgv+RQqnmoLnlsk3EJfWv8=
X-Google-Smtp-Source: AMsMyM5gojlOBHjtdE056jmBOF9eSFz7kwfpaMvm6sGh8gPrmoCTsfgfDBksN6hx8y6pyYJH8EA9Fw==
X-Received: by 2002:a9d:68d1:0:b0:661:c3ac:c4c1 with SMTP id i17-20020a9d68d1000000b00661c3acc4c1mr157310oto.150.1665790050462;
        Fri, 14 Oct 2022 16:27:30 -0700 (PDT)
Received: from grumpy-VECTOR.hsd1.tx.comcast.net ([2601:2c3:480:7390:d0e8:abee:fc20:2322])
        by smtp.gmail.com with ESMTPSA id r6-20020a9d7cc6000000b0066192cb6ccfsm1778431otn.77.2022.10.14.16.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 16:27:30 -0700 (PDT)
From:   Jorge Lopez <jorgealtxwork@gmail.com>
X-Google-Original-From: Jorge Lopez <jorge.lopez2@hp.com>
To:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 2/4] Update pending_reboot state value
Date:   Fri, 14 Oct 2022 18:27:24 -0500
Message-Id: <20221014232726.31301-3-jorge.lopez2@hp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221014232726.31301-1-jorge.lopez2@hp.com>
References: <20221014232726.31301-1-jorge.lopez2@hp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

There is not a reliable mechanism to programmatically determine which
BIOS settings require a reboot to be updated.  The latest changes
leverages “RequiredPhysicalPresence” reported value to set
pending_reboot.

Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>

---
Based on the latest platform-drivers-x86.git/for-next
---
 drivers/platform/x86/hp/enum-attributes.c     |  6 ++++
 drivers/platform/x86/hp/int-attributes.c      |  7 +++-
 drivers/platform/x86/hp/ordered-attributes.c  |  6 ++++
 .../platform/x86/hp/passwdobj-attributes.c    |  9 ++++-
 .../platform/x86/hp/sureadmin-attributes.c    | 34 +++++++++++++++++--
 5 files changed, 58 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/hp/enum-attributes.c b/drivers/platform/x86/hp/enum-attributes.c
index 6ec02b61857c..9d4b6e97bd16 100644
--- a/drivers/platform/x86/hp/enum-attributes.c
+++ b/drivers/platform/x86/hp/enum-attributes.c
@@ -78,6 +78,12 @@ static int validate_enumeration_input(int instance_id, const char *buf)
 	strscpy(bioscfg_drv.enumeration_data[instance_id].new_value,
 		buf,
 		sizeof(bioscfg_drv.enumeration_data[instance_id].new_value));
+	/*
+	 * set pending reboot flag depending on
+	 * "RequiresPhysicalPresence" value
+	 */
+	if (bioscfg_drv.enumeration_data[instance_id].requires_physical_presence)
+		bioscfg_drv.pending_reboot = TRUE;
 
 exit_validate_enum_input:
 	kfree(options);
diff --git a/drivers/platform/x86/hp/int-attributes.c b/drivers/platform/x86/hp/int-attributes.c
index 9a49a528fd9e..aa61497b44d5 100644
--- a/drivers/platform/x86/hp/int-attributes.c
+++ b/drivers/platform/x86/hp/int-attributes.c
@@ -56,7 +56,12 @@ static int validate_integer_input(int instance_id, char *buf)
 		return -EINVAL;
 
 	bioscfg_drv.integer_data[instance_id].new_value = in_val;
-
+	/*
+	 * set pending reboot flag depending on
+	 * "RequiresPhysicalPresence" value
+	 */
+	if (bioscfg_drv.integer_data[instance_id].requires_physical_presence)
+		bioscfg_drv.pending_reboot = TRUE;
 	return 0;
 }
 
diff --git a/drivers/platform/x86/hp/ordered-attributes.c b/drivers/platform/x86/hp/ordered-attributes.c
index a66d7f0b34d2..585abc3bd362 100644
--- a/drivers/platform/x86/hp/ordered-attributes.c
+++ b/drivers/platform/x86/hp/ordered-attributes.c
@@ -127,6 +127,12 @@ static int validate_ordered_list_input(int instance_id, const char *buf)
 	strscpy(bioscfg_drv.ordered_list_data[instance_id].new_value,
 		buf,
 		sizeof(bioscfg_drv.ordered_list_data[instance_id].new_value));
+	/*
+	 * set pending reboot flag depending on
+	 * "RequiresPhysicalPresence" value
+	 */
+	if (bioscfg_drv.ordered_list_data[instance_id].requires_physical_presence)
+		bioscfg_drv.pending_reboot = TRUE;
 
 validate_ordered_list_exit:
 	return ret;
diff --git a/drivers/platform/x86/hp/passwdobj-attributes.c b/drivers/platform/x86/hp/passwdobj-attributes.c
index 75d2f2c1e0e3..e69688e7d55e 100644
--- a/drivers/platform/x86/hp/passwdobj-attributes.c
+++ b/drivers/platform/x86/hp/passwdobj-attributes.c
@@ -100,10 +100,17 @@ static ssize_t current_password_store(struct kobject *kobj,
 	if (id >= 0)
 		ret = validate_password_input(id, buf_cp);
 
-	if (!ret)
+	if (!ret) {
 		strscpy(bioscfg_drv.password_data[id].current_password,
 			buf_cp,
 			sizeof(bioscfg_drv.password_data[id].current_password));
+		/*
+		 * set pending reboot flag depending on
+		 * "RequiresPhysicalPresence" value
+		 */
+		if (bioscfg_drv.password_data[id].requires_physical_presence)
+			bioscfg_drv.pending_reboot = TRUE;
+	}
 
 exit_current_password:
 	kfree(buf_cp);
diff --git a/drivers/platform/x86/hp/sureadmin-attributes.c b/drivers/platform/x86/hp/sureadmin-attributes.c
index dba5f94e8c9a..5ad45cdddad9 100644
--- a/drivers/platform/x86/hp/sureadmin-attributes.c
+++ b/drivers/platform/x86/hp/sureadmin-attributes.c
@@ -158,14 +158,29 @@ int update_attribute_value(char *attr_name, char *attr_value)
 		strscpy(bioscfg_drv.string_data[instance].current_value,
 			attr_value,
 			sizeof(bioscfg_drv.string_data[instance].current_value));
+
+		/*
+		 * set pending reboot flag depending on
+		 * "RequiresPhysicalPresence" value
+		 */
+		if (bioscfg_drv.string_data[instance].requires_physical_presence)
+			bioscfg_drv.pending_reboot = TRUE;
 		goto exit_update_attribute;
 	}
 
 	instance = get_instance_id_for_integer(attr_name);
 	if (instance >= 0) {
 		ret = kstrtoint(attr_value, 10, &int_val);
-		if (!ret)
+		if (!ret) {
 			bioscfg_drv.integer_data[instance].current_value = int_val;
+			/*
+			 * set pending reboot flag depending on
+			 * "RequiresPhysicalPresence" value
+			 */
+			if (bioscfg_drv.integer_data[instance].requires_physical_presence)
+				bioscfg_drv.pending_reboot = TRUE;
+		}
+
 		goto exit_update_attribute;
 	}
 
@@ -174,14 +189,29 @@ int update_attribute_value(char *attr_name, char *attr_value)
 		strscpy(bioscfg_drv.enumeration_data[instance].current_value,
 			attr_value,
 			sizeof(bioscfg_drv.enumeration_data[instance].current_value));
+		/*
+		 * set pending reboot flag depending on
+		 * "RequiresPhysicalPresence" value
+		 */
+		if (bioscfg_drv.enumeration_data[instance].requires_physical_presence)
+			bioscfg_drv.pending_reboot = TRUE;
+
 		goto exit_update_attribute;
 	}
 	instance = get_instance_id_for_ordered_list(attr_name);
-	if (instance >= 0)
+	if (instance >= 0) {
 		strscpy(bioscfg_drv.ordered_list_data[instance].current_value,
 			attr_value,
 			sizeof(bioscfg_drv.ordered_list_data[instance].current_value));
 
+		/*
+		 * set pending reboot flag depending on
+		 * "RequiresPhysicalPresence" value
+		 */
+		if (bioscfg_drv.ordered_list_data[instance].requires_physical_presence)
+			bioscfg_drv.pending_reboot = TRUE;
+	}
+
 exit_update_attribute:
 	return instance;
 }
-- 
2.34.1

