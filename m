Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C214C4332F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 18 Oct 2022 20:35:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbiJRUfh (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 18 Oct 2022 16:35:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230117AbiJRUfg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 18 Oct 2022 16:35:36 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70F306E898
        for <platform-driver-x86@vger.kernel.org>; Tue, 18 Oct 2022 13:35:35 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id a14-20020a9d470e000000b00661b66a5393so8312109otf.11
        for <platform-driver-x86@vger.kernel.org>; Tue, 18 Oct 2022 13:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m8kK6rLItF/0pjg44b3n/aGs0jVKQfAhuUkNBxFA9lk=;
        b=T9oUv9zjFygwch/LQz1kfivEj3Efr1rcEjZe7bi5S2Icc3Hbkt1vXKebCPo5DPWR2t
         Nj/wwZr0JrFm5q42dSnEBKO+xO2SoAU11vmEAR6LQWeqOo7Xy+vzcGmjBnXCtBh2fn3C
         bR1Lx4nUV0O91TlxdGBytfKZz7aJ9LYObTTL71cayb69B2bX1giW/2Gv3iTOISiLJb4x
         RKxWXEOgcAxDZkiuU5AJtpNsjrQ8LfPwpVEkXFcHSpHogdJm1tLZ8+brinfl4vSDsFBF
         J6WptP27aShBN/x+nXLkPonoBAd64nCDeinwSPEti3qG/lqPDWK7QzNXKDEBJ+WQu8TE
         LdKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m8kK6rLItF/0pjg44b3n/aGs0jVKQfAhuUkNBxFA9lk=;
        b=YqztXaWhik+AXm1bjgCf3rOQfYevd74VimDRDjAuehCrYSR+FPDImm/eNDX5y/IEbU
         SY4j39vtp9osdtXRcRDtGxdMzBMvdMG49W16/Bo03JJnOOlrY/XhmXzWcMilCrkyCmVz
         lzmyItXLRc3/bl7aUgSbnO19Mf5OhEwwahcZgOSDIcsk0Tcwd8+0Kds6JrcTy8eX6bvB
         3J4h+r5Q9foxDXcSqNlPIpvhPu8hVGOtc/BX7vSjjyiWuH196lzBTu9hrqxHJzzz8t5g
         aWOrdyNDszJ9QB3joaX2vGTLHKwSwRdINpRsLEf32ldcZlsVEcfHoXaA0LPPKuT87iNQ
         6xKQ==
X-Gm-Message-State: ACrzQf21HmBLsBpbaykdstWzvz/pZ0U0FSQ4lJ3NrthWqOlWbuVo6yid
        0HyUUHKU6yItrcd/arEIXqtohjovw3U=
X-Google-Smtp-Source: AMsMyM7j4cG1MJ4YVRxGaNmqWYyPwvrrjNtKWC34GtS8WNBf75l2j2JWPk1bvxmR/XhtlQtUGzMEOw==
X-Received: by 2002:a9d:7012:0:b0:661:9481:7ac4 with SMTP id k18-20020a9d7012000000b0066194817ac4mr2190130otj.135.1666125334792;
        Tue, 18 Oct 2022 13:35:34 -0700 (PDT)
Received: from grumpy-VECTOR.hsd1.tx.comcast.net ([2601:2c3:480:7390:6d8c:32db:7793:d4c0])
        by smtp.gmail.com with ESMTPSA id s4-20020a056870248400b00136cfb02a94sm6580722oaq.7.2022.10.18.13.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 13:35:34 -0700 (PDT)
From:   Jorge Lopez <jorgealtxwork@gmail.com>
X-Google-Original-From: Jorge Lopez <jorge.lopez2@hp.com>
To:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org
Subject: [PATCH v3 2/6] Update pending_reboot state value
Date:   Tue, 18 Oct 2022 15:35:27 -0500
Message-Id: <20221018203531.17130-3-jorge.lopez2@hp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221018203531.17130-1-jorge.lopez2@hp.com>
References: <20221018203531.17130-1-jorge.lopez2@hp.com>
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

