Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E9C9C433FE
	for <platform-driver-x86@archiver.kernel.org>; Tue, 18 Oct 2022 20:35:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230130AbiJRUfm (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 18 Oct 2022 16:35:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230119AbiJRUfk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 18 Oct 2022 16:35:40 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D19EA61715
        for <platform-driver-x86@vger.kernel.org>; Tue, 18 Oct 2022 13:35:37 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id cy15-20020a056830698f00b0065c530585afso8320495otb.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 18 Oct 2022 13:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N2/W98ZeaNXRnoYFBxUO3dg+Vv5x2+Q0qKFw+vc5/ZQ=;
        b=beyPTPdmGX7dENLSSxJklqhsOIVM5nifnbcRlsSBicasG7Uacb5Y/3gdCg+6Zr3Fhk
         xpGdWW1tsVhver88r4uqCVZZpNSY/2VzfGbQtCybuK/BzZLXgrbveqrTTpoqes3VGzkf
         bIvT+O+FBzlWKK5T7nsNBnsWKQoP9NUKMkAeWiFEjxN/8T8HgVvZ9mtkncMCkJD7O9ll
         XkSbMRdNZsLRFXvQJDeMXZk7zHkjPKGVtMIQ49hZWVSbUoPwfytS+uidabBeSmudDWiA
         JXqSRLpLKD/IcKvT9l469JFJJxbjSNgDl0VM92wlGVMGYJpXt6hzVgG19m8tlFIGdZB+
         4cLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N2/W98ZeaNXRnoYFBxUO3dg+Vv5x2+Q0qKFw+vc5/ZQ=;
        b=hNe7Skz+F6zHHx79AomOOFmiU5JCDbyqL2aFeMUw33aglPCtPhYhGaguEawynSKOxa
         /GIcHD7UPWJqmgcmH9lBaEgTD08HI99Dj+5r1Ezhf9PjBPZX/r+/TlzKDh7dTJhfoCcn
         9NG4+pk4N1tsgRgHOXha2OXZ6aJqtoA2ygxn4oAWSUaud8ifiZ4+lfVpP8n+6+R1kNXV
         HMycbtpcRLO9M6QE/5sbXzaNyeVZ4NQdIKZ8sMSWBnkvYEZ3723tqjdV529l0tg4UZ7+
         SPULRMgoXh7c2oIR5HzTZxhOsUnfIcvJZoKMgJc6gIr11SrdJUU2R7G2btGLW9i7aoTl
         huGA==
X-Gm-Message-State: ACrzQf3zPqMIVYgbPPDjucl7xly+jZwUjkKkh3SN3Ghr8r9RQ/2zhzrH
        Qwd8GhNCRwlxZfiY2B9rYxAfTcTNZg0=
X-Google-Smtp-Source: AMsMyM4wa6UVmnYUrqab9XpwxWhT6Kw2vdC3FgqvZiT9K2CTA5ZYdkLgaThcohnDqobVBgbfmBJb6w==
X-Received: by 2002:a9d:27a8:0:b0:661:a16f:2952 with SMTP id c37-20020a9d27a8000000b00661a16f2952mr2147140otb.36.1666125336661;
        Tue, 18 Oct 2022 13:35:36 -0700 (PDT)
Received: from grumpy-VECTOR.hsd1.tx.comcast.net ([2601:2c3:480:7390:6d8c:32db:7793:d4c0])
        by smtp.gmail.com with ESMTPSA id s4-20020a056870248400b00136cfb02a94sm6580722oaq.7.2022.10.18.13.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 13:35:35 -0700 (PDT)
From:   Jorge Lopez <jorgealtxwork@gmail.com>
X-Google-Original-From: Jorge Lopez <jorge.lopez2@hp.com>
To:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org
Subject: [PATCH v3 4/6] Improve friendly display name values
Date:   Tue, 18 Oct 2022 15:35:29 -0500
Message-Id: <20221018203531.17130-5-jorge.lopez2@hp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221018203531.17130-1-jorge.lopez2@hp.com>
References: <20221018203531.17130-1-jorge.lopez2@hp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The purpose of this patch is to improve the friendly display name for
few numbers of attributes associated with ‘Schedule Power-ON.’  BIOS
assign names such ‘Tuesday’ to an attribute. The name is correct, but
it is not descriptive enough for the user.  It is under those
conditions a portion of the path data value is append to the attribute
name to create a user-friendly display name.

For instance, the attribute name is ‘Tuesday,’ and the display name
value is ‘Schedule Power-ON – Tuesday’

Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>
---
 drivers/platform/x86/hp/bioscfg.c            | 18 ++++++++++++++++++
 drivers/platform/x86/hp/bioscfg.h            |  5 ++++-
 drivers/platform/x86/hp/enum-attributes.c    |  9 ++++++++-
 drivers/platform/x86/hp/int-attributes.c     |  8 ++++++++
 drivers/platform/x86/hp/ordered-attributes.c | 10 +++++++++-
 drivers/platform/x86/hp/string-attributes.c  | 10 ++++++++--
 6 files changed, 55 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/hp/bioscfg.c b/drivers/platform/x86/hp/bioscfg.c
index 72dd963f29ae..ce3226d79696 100644
--- a/drivers/platform/x86/hp/bioscfg.c
+++ b/drivers/platform/x86/hp/bioscfg.c
@@ -542,6 +542,24 @@ inline int encode_outsize_for_pvsz(int outsize)
 	return 1;
 }
 
+/*
+ * Update friendly display name for several attributes associated to
+ * 'Schedule Power-On'
+ */
+void friendly_user_name_update(char *path, const char *attr_name,
+				char *attr_display, int attr_size)
+{
+	char *found = NULL;
+
+	found = strstr(path, SCHEDULE_POWER_ON);
+	if (found)
+		snprintf(attr_display,
+			 attr_size,
+			 "%s - %s",
+			 SCHEDULE_POWER_ON,
+			 attr_name);
+}
+
 /**
  * update_attribute_permissions() - Update attributes permissions when
  * isReadOnly value is 1
diff --git a/drivers/platform/x86/hp/bioscfg.h b/drivers/platform/x86/hp/bioscfg.h
index ff030399b3a2..4409481f84f2 100644
--- a/drivers/platform/x86/hp/bioscfg.h
+++ b/drivers/platform/x86/hp/bioscfg.h
@@ -33,7 +33,8 @@
 #define SETUP_PASSWD	"Setup Password"
 #define POWER_ON_PASSWD	"Power-On Password"
 
-#define LANG_CODE_STR	"en_US.UTF-8"
+#define LANG_CODE_STR		"en_US.UTF-8"
+#define SCHEDULE_POWER_ON	"Scheduled Power-On"
 
 /* Sure Admin Functions */
 
@@ -521,6 +522,8 @@ union acpi_object *get_wmiobj_pointer(int instance_id, const char *guid_string);
 int get_instance_count(const char *guid_string);
 void strlcpy_attr(char *dest, char *src);
 void update_attribute_permissions(u32 isReadOnly, struct kobj_attribute *current_val);
+void friendly_user_name_update(char *path, const char *attr_name,
+				char *attr_display, int attr_size);
 
 /* String attributes */
 int populate_string_buffer_data(union acpi_object *str_obj,
diff --git a/drivers/platform/x86/hp/enum-attributes.c b/drivers/platform/x86/hp/enum-attributes.c
index f4fe6a583ca4..e67e7c397c12 100644
--- a/drivers/platform/x86/hp/enum-attributes.c
+++ b/drivers/platform/x86/hp/enum-attributes.c
@@ -192,7 +192,10 @@ int populate_enumeration_package_data(union acpi_object *enum_obj, int instance_
 	populate_enumeration_elements_from_package(enum_obj, instance_id, HPWMI_ENUMERATION_TYPE);
 	update_attribute_permissions(bioscfg_drv.enumeration_data[instance_id].is_readonly,
 				    &enumeration_current_val);
-
+	friendly_user_name_update(bioscfg_drv.enumeration_data[instance_id].path,
+				  attr_name_kobj->name,
+				   bioscfg_drv.enumeration_data[instance_id].display_name,
+				   sizeof(bioscfg_drv.enumeration_data[instance_id].display_name));
 	return sysfs_create_group(attr_name_kobj, &enumeration_attr_group);
 }
 
@@ -366,6 +369,10 @@ int populate_enumeration_buffer_data(union acpi_object *enum_obj, int instance_i
 	populate_enumeration_elements_from_buffer(enum_obj, instance_id, HPWMI_ENUMERATION_TYPE);
 	update_attribute_permissions(bioscfg_drv.enumeration_data[instance_id].is_readonly,
 				    &enumeration_current_val);
+	friendly_user_name_update(bioscfg_drv.enumeration_data[instance_id].path,
+				  attr_name_kobj->name,
+				   bioscfg_drv.enumeration_data[instance_id].display_name,
+				   sizeof(bioscfg_drv.enumeration_data[instance_id].display_name));
 
 	return sysfs_create_group(attr_name_kobj, &enumeration_attr_group);
 }
diff --git a/drivers/platform/x86/hp/int-attributes.c b/drivers/platform/x86/hp/int-attributes.c
index eaae4b065098..dc295ac4f83a 100644
--- a/drivers/platform/x86/hp/int-attributes.c
+++ b/drivers/platform/x86/hp/int-attributes.c
@@ -170,6 +170,10 @@ int populate_integer_package_data(union acpi_object *elements, int instance_id,
 	populate_integer_elements_from_package(elements, instance_id, HPWMI_INTEGER_TYPE);
 	update_attribute_permissions(bioscfg_drv.integer_data[instance_id].is_readonly,
 				    &integer_current_val);
+	friendly_user_name_update(bioscfg_drv.integer_data[instance_id].path,
+				  attr_name_kobj->name,
+				   bioscfg_drv.integer_data[instance_id].display_name,
+				   sizeof(bioscfg_drv.integer_data[instance_id].display_name));
 	return sysfs_create_group(attr_name_kobj, &integer_attr_group);
 }
 
@@ -333,6 +337,10 @@ int populate_integer_buffer_data(union acpi_object *integer_obj, int instance_id
 	populate_integer_elements_from_buffer(integer_obj, instance_id, HPWMI_INTEGER_TYPE);
 	update_attribute_permissions(bioscfg_drv.integer_data[instance_id].is_readonly,
 				    &integer_current_val);
+	friendly_user_name_update(bioscfg_drv.integer_data[instance_id].path,
+				  attr_name_kobj->name,
+				   bioscfg_drv.integer_data[instance_id].display_name,
+				   sizeof(bioscfg_drv.integer_data[instance_id].display_name));
 
 	return sysfs_create_group(attr_name_kobj, &integer_attr_group);
 }
diff --git a/drivers/platform/x86/hp/ordered-attributes.c b/drivers/platform/x86/hp/ordered-attributes.c
index 723db9a0316d..603222c086a7 100644
--- a/drivers/platform/x86/hp/ordered-attributes.c
+++ b/drivers/platform/x86/hp/ordered-attributes.c
@@ -241,7 +241,10 @@ int populate_ordered_list_package_data(union acpi_object *order_obj, int instanc
 	populate_ordered_list_elements_from_package(order_obj, instance_id, HPWMI_ORDERED_LIST_TYPE);
 	update_attribute_permissions(bioscfg_drv.ordered_list_data[instance_id].is_readonly,
 				    &ordered_list_current_val);
-
+	friendly_user_name_update(bioscfg_drv.ordered_list_data[instance_id].path,
+				  attr_name_kobj->name,
+				   bioscfg_drv.ordered_list_data[instance_id].display_name,
+				  sizeof(bioscfg_drv.ordered_list_data[instance_id].display_name));
 	return sysfs_create_group(attr_name_kobj, &ordered_list_attr_group);
 }
 
@@ -431,6 +434,11 @@ int populate_ordered_list_buffer_data(union acpi_object *order_obj, int instance
 	populate_ordered_list_elements_from_buffer(order_obj, instance_id, HPWMI_ORDERED_LIST_TYPE);
 	update_attribute_permissions(bioscfg_drv.ordered_list_data[instance_id].is_readonly,
 				    &ordered_list_current_val);
+	friendly_user_name_update(bioscfg_drv.ordered_list_data[instance_id].path,
+				  attr_name_kobj->name,
+				   bioscfg_drv.ordered_list_data[instance_id].display_name,
+				  sizeof(bioscfg_drv.ordered_list_data[instance_id].display_name));
+
 	return sysfs_create_group(attr_name_kobj, &ordered_list_attr_group);
 }
 
diff --git a/drivers/platform/x86/hp/string-attributes.c b/drivers/platform/x86/hp/string-attributes.c
index a8e4f8b60dff..56ca02b00d1d 100644
--- a/drivers/platform/x86/hp/string-attributes.c
+++ b/drivers/platform/x86/hp/string-attributes.c
@@ -166,7 +166,10 @@ int populate_string_package_data(union acpi_object *elements, int instance_id,
 	populate_string_elements_from_package(elements, instance_id, HPWMI_STRING_TYPE);
 	update_attribute_permissions(bioscfg_drv.string_data[instance_id].is_readonly,
 				    &string_current_val);
-
+	friendly_user_name_update(bioscfg_drv.string_data[instance_id].path,
+				  attr_name_kobj->name,
+				   bioscfg_drv.string_data[instance_id].display_name,
+				   sizeof(bioscfg_drv.string_data[instance_id].display_name));
 	return sysfs_create_group(attr_name_kobj, &string_attr_group);
 }
 
@@ -325,7 +328,10 @@ int populate_string_buffer_data(union acpi_object *string_obj, int instance_id,
 	populate_string_elements_from_buffer(string_obj, instance_id, HPWMI_STRING_TYPE);
 	update_attribute_permissions(bioscfg_drv.string_data[instance_id].is_readonly,
 				    &string_current_val);
-
+	friendly_user_name_update(bioscfg_drv.string_data[instance_id].path,
+				  attr_name_kobj->name,
+				   bioscfg_drv.string_data[instance_id].display_name,
+				   sizeof(bioscfg_drv.string_data[instance_id].display_name));
 	return sysfs_create_group(attr_name_kobj, &string_attr_group);
 }
 
-- 
2.34.1

