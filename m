Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6723BC433FE
	for <platform-driver-x86@archiver.kernel.org>; Fri, 14 Oct 2022 23:27:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbiJNX1e (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 14 Oct 2022 19:27:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbiJNX1e (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 14 Oct 2022 19:27:34 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 052C7A570D
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Oct 2022 16:27:33 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id o64so6591090oib.12
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Oct 2022 16:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sWb+78uC7CHlBFqLRSQ5cpHKpMO04JPVzVBunxPUzws=;
        b=DfXd6lPJZBSETlOQ0PKxuGA//th/myJvX2ttBYkgplO01qjeGwlI9IUnl4CkLMsWSL
         zWPBo80ald6BkqyoLa2Ny4S9Ij4G671ZW6I3NOn5tF/JZF7OAv3yLpEaS0xDdNWxQCMN
         ke4CG0EW3Tfiate5fTEre8Hof7h7z86Ftn+c9h3Y0cp41fJq0bK3GC/ol/x/ub18p896
         uONqxcpQvn9+nIoD47iaax5+/q5Qib8zVpJ2crLBk4WvX7lxfeIT4RW+fU58dou0fdKD
         1iaZhMdAsw4iKChP4dh+S6f8SXWWPTH9CtUqM5Nobh2EX329Hj1aS66hf6bAXniL/0i+
         VoZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sWb+78uC7CHlBFqLRSQ5cpHKpMO04JPVzVBunxPUzws=;
        b=myJuKXP2pqr5iAf/x1UxNR04KqYUJCaE9yLjzgZNNWCAHZD54z/5qVYWsMwoZL0dnd
         GZphludpWTGd5+JXB09BKIhIXb59uNQH8hEUTdWgsTtQvBtTSJlFUSZCjYSHLR8OFoWe
         ndObasErkm5EzvmRdcpRc4ZAT+mdQ0mVAX/pH3KIPsNb1UXb2OmNyQY5m82cBT5dcXw7
         Ym1Gqkvw+wpoZH4Mf3IP81rdgr1duThkLfIevmoiiga9/jQIZIpjY2/h7sG9i4iRWbQj
         MU14ok453HynZcrZZIx+jLHczOgUiRIN1lQ4xQe3TX7j0+froKL89ox0LFO3hydOnkug
         jKxQ==
X-Gm-Message-State: ACrzQf0vd/mIXml19dyMBk82wCxsnVjnCyugqhwiuhjfSv/qBL0qjA56
        gVrOsHfD14kGpq9zzhNN2/td01/mIrw=
X-Google-Smtp-Source: AMsMyM5/zEhqzCLt6h1rdetspEHVhHztqOSkqtEkoh8z1LTyV97iOyCPEZoA4AtESvS8w0zqMETJHg==
X-Received: by 2002:a05:6808:1184:b0:350:f681:8c9a with SMTP id j4-20020a056808118400b00350f6818c9amr125687oil.282.1665790052210;
        Fri, 14 Oct 2022 16:27:32 -0700 (PDT)
Received: from grumpy-VECTOR.hsd1.tx.comcast.net ([2601:2c3:480:7390:d0e8:abee:fc20:2322])
        by smtp.gmail.com with ESMTPSA id r6-20020a9d7cc6000000b0066192cb6ccfsm1778431otn.77.2022.10.14.16.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 16:27:31 -0700 (PDT)
From:   Jorge Lopez <jorgealtxwork@gmail.com>
X-Google-Original-From: Jorge Lopez <jorge.lopez2@hp.com>
To:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 4/4] Improve friendly display name values
Date:   Fri, 14 Oct 2022 18:27:26 -0500
Message-Id: <20221014232726.31301-5-jorge.lopez2@hp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221014232726.31301-1-jorge.lopez2@hp.com>
References: <20221014232726.31301-1-jorge.lopez2@hp.com>
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
Based on the latest platform-drivers-x86.git/for-next
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
index eaae4b065098..6564a7266e9e 100644
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

