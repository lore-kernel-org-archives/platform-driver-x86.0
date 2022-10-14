Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C21E6C43219
	for <platform-driver-x86@archiver.kernel.org>; Fri, 14 Oct 2022 23:27:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229614AbiJNX1d (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 14 Oct 2022 19:27:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbiJNX1c (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 14 Oct 2022 19:27:32 -0400
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C218EA570D
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Oct 2022 16:27:31 -0700 (PDT)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-1322d768ba7so7599962fac.5
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Oct 2022 16:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j/kHIbP8Pj39JAAO9mLvYMjlYVVVvfKIUa5qufcwuCY=;
        b=BwLt8xp0Yj9NDwvkOpA9i4gAyyDi4c26nMs+FUT49ZioFKKVlBJbEKcM5hxC2ngXnX
         wgPMs2995HxDoV1OyI/JdngVRgTecIiu4k0f724A83Ld8yVaxY/5nhxXXgw6D2E66U4f
         sn7e1W5LV4zsL5Zxt/ZsgsrB5jb3NOosrn7jRel0hIIk7z8ufeTeUp6nVKNcSDLILezO
         cg9txVhWYehlHVZPK7FnKJKRITbEPToCsTlxmfMlWMczRYHxyj+NS/ghyAwFUt0arKbM
         LzDuatfKaBYPHfgaXq/8l+GzeL9KcNh6rG2uajft/mzn5lZHPwmkBn2MY7FLceBMBGpN
         6Hew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j/kHIbP8Pj39JAAO9mLvYMjlYVVVvfKIUa5qufcwuCY=;
        b=LfTxQFCSw+xIi2TQyjPyMB6ArHPl0bIMRuiIKf7jIbfd69dlJBlhqR9IdPEEc8xHYy
         q2Lo/2Zby84fop2UO1zu55mjux+8hLWInuYiKeOHkEK335M0UE0wG3pFbUDidFxYIlMq
         g5eAEZxK148SphWIY2ekGbQVzrt+QdUtgdtsf7GCP0ADpP1v1BB+TaDuuzKGp42UU8kq
         ummhgZAntJ1uIxuAIbbABPrx/Yu1DNx5p3DCl9sNuJ6Y9I8kORB+0eFZ33nqarwwj2Eu
         KM3oa4151xq0mtDH6TrTjdVUeIQn21i2+yii6r8QybyXqtS0ZqRMDm187cLYNZnC3YbL
         CrYA==
X-Gm-Message-State: ACrzQf0zcaZWs5kFNNM81AChJskTiwli3TU9eLHbRCnFwMHAH1CY7lYb
        steJyN/n1mH+RY0qsrdsbd/wOJrcA/Q=
X-Google-Smtp-Source: AMsMyM5AGDwwdYxZ80/NS7jbkXgl0DuSAiRJmoJUyrs03jayJ1dpSN+5jasoTgzkhKEg08W8noACaw==
X-Received: by 2002:a05:6870:a18e:b0:136:4add:e0d9 with SMTP id a14-20020a056870a18e00b001364adde0d9mr130586oaf.28.1665790051147;
        Fri, 14 Oct 2022 16:27:31 -0700 (PDT)
Received: from grumpy-VECTOR.hsd1.tx.comcast.net ([2601:2c3:480:7390:d0e8:abee:fc20:2322])
        by smtp.gmail.com with ESMTPSA id r6-20020a9d7cc6000000b0066192cb6ccfsm1778431otn.77.2022.10.14.16.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 16:27:30 -0700 (PDT)
From:   Jorge Lopez <jorgealtxwork@gmail.com>
X-Google-Original-From: Jorge Lopez <jorge.lopez2@hp.com>
To:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 3/4] Set current_value permissions appropriate to read-only attributes
Date:   Fri, 14 Oct 2022 18:27:25 -0500
Message-Id: <20221014232726.31301-4-jorge.lopez2@hp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221014232726.31301-1-jorge.lopez2@hp.com>
References: <20221014232726.31301-1-jorge.lopez2@hp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This patch updates ‘current_value’ permissions to match the value
reported by ‘is_readonly’ value associated with the attribute.
‘current_value’ permissions are set to read-only if ‘is_readonly’
value is 1.  ‘current_value’ permissions are set to read-write if
‘is_readonly’ value is zero.   Other read-only and write-only
permissions will remain unchanged.

Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>
---
 drivers/platform/x86/hp/bioscfg.c            | 17 +++++++++++++++++
 drivers/platform/x86/hp/bioscfg.h            |  1 +
 drivers/platform/x86/hp/enum-attributes.c    |  4 ++++
 drivers/platform/x86/hp/int-attributes.c     |  4 ++++
 drivers/platform/x86/hp/ordered-attributes.c |  6 +++++-
 drivers/platform/x86/hp/string-attributes.c  |  4 ++++
 6 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp/bioscfg.c b/drivers/platform/x86/hp/bioscfg.c
index f08bcae5752a..72dd963f29ae 100644
--- a/drivers/platform/x86/hp/bioscfg.c
+++ b/drivers/platform/x86/hp/bioscfg.c
@@ -542,6 +542,23 @@ inline int encode_outsize_for_pvsz(int outsize)
 	return 1;
 }
 
+/**
+ * update_attribute_permissions() - Update attributes permissions when
+ * isReadOnly value is 1
+ *
+ * @isReadOnly:  ReadOnly value
+ * @current_val: kobj_attribute corresponding to attribute.
+ *
+ **/
+void update_attribute_permissions(u32 isReadOnly, struct kobj_attribute *current_val)
+{
+	if (isReadOnly)
+		current_val->attr.mode = (umode_t)0444;
+	else
+		current_val->attr.mode = (umode_t)0600;
+}
+
+
 /**
  * destroy_attribute_objs() - Free a kset of kobjects
  * @kset: The kset to destroy
diff --git a/drivers/platform/x86/hp/bioscfg.h b/drivers/platform/x86/hp/bioscfg.h
index ac02c8c1e5f2..ff030399b3a2 100644
--- a/drivers/platform/x86/hp/bioscfg.h
+++ b/drivers/platform/x86/hp/bioscfg.h
@@ -520,6 +520,7 @@ __BIN_ATTR(_name, 0444 | 0200, _group##_##_name##_read, _group##_##_name##_write
 union acpi_object *get_wmiobj_pointer(int instance_id, const char *guid_string);
 int get_instance_count(const char *guid_string);
 void strlcpy_attr(char *dest, char *src);
+void update_attribute_permissions(u32 isReadOnly, struct kobj_attribute *current_val);
 
 /* String attributes */
 int populate_string_buffer_data(union acpi_object *str_obj,
diff --git a/drivers/platform/x86/hp/enum-attributes.c b/drivers/platform/x86/hp/enum-attributes.c
index 9d4b6e97bd16..f4fe6a583ca4 100644
--- a/drivers/platform/x86/hp/enum-attributes.c
+++ b/drivers/platform/x86/hp/enum-attributes.c
@@ -190,6 +190,8 @@ int populate_enumeration_package_data(union acpi_object *enum_obj, int instance_
 	str_value = NULL;
 
 	populate_enumeration_elements_from_package(enum_obj, instance_id, HPWMI_ENUMERATION_TYPE);
+	update_attribute_permissions(bioscfg_drv.enumeration_data[instance_id].is_readonly,
+				    &enumeration_current_val);
 
 	return sysfs_create_group(attr_name_kobj, &enumeration_attr_group);
 }
@@ -362,6 +364,8 @@ int populate_enumeration_buffer_data(union acpi_object *enum_obj, int instance_i
 
 	/* Populate enumeration elements */
 	populate_enumeration_elements_from_buffer(enum_obj, instance_id, HPWMI_ENUMERATION_TYPE);
+	update_attribute_permissions(bioscfg_drv.enumeration_data[instance_id].is_readonly,
+				    &enumeration_current_val);
 
 	return sysfs_create_group(attr_name_kobj, &enumeration_attr_group);
 }
diff --git a/drivers/platform/x86/hp/int-attributes.c b/drivers/platform/x86/hp/int-attributes.c
index aa61497b44d5..eaae4b065098 100644
--- a/drivers/platform/x86/hp/int-attributes.c
+++ b/drivers/platform/x86/hp/int-attributes.c
@@ -168,6 +168,8 @@ int populate_integer_package_data(union acpi_object *elements, int instance_id,
 	str_value = NULL;
 
 	populate_integer_elements_from_package(elements, instance_id, HPWMI_INTEGER_TYPE);
+	update_attribute_permissions(bioscfg_drv.integer_data[instance_id].is_readonly,
+				    &integer_current_val);
 	return sysfs_create_group(attr_name_kobj, &integer_attr_group);
 }
 
@@ -329,6 +331,8 @@ int populate_integer_buffer_data(union acpi_object *integer_obj, int instance_id
 
 	/* Populate integer elements */
 	populate_integer_elements_from_buffer(integer_obj, instance_id, HPWMI_INTEGER_TYPE);
+	update_attribute_permissions(bioscfg_drv.integer_data[instance_id].is_readonly,
+				    &integer_current_val);
 
 	return sysfs_create_group(attr_name_kobj, &integer_attr_group);
 }
diff --git a/drivers/platform/x86/hp/ordered-attributes.c b/drivers/platform/x86/hp/ordered-attributes.c
index 585abc3bd362..723db9a0316d 100644
--- a/drivers/platform/x86/hp/ordered-attributes.c
+++ b/drivers/platform/x86/hp/ordered-attributes.c
@@ -239,6 +239,9 @@ int populate_ordered_list_package_data(union acpi_object *order_obj, int instanc
 	str_value = NULL;
 
 	populate_ordered_list_elements_from_package(order_obj, instance_id, HPWMI_ORDERED_LIST_TYPE);
+	update_attribute_permissions(bioscfg_drv.ordered_list_data[instance_id].is_readonly,
+				    &ordered_list_current_val);
+
 	return sysfs_create_group(attr_name_kobj, &ordered_list_attr_group);
 }
 
@@ -426,7 +429,8 @@ int populate_ordered_list_buffer_data(union acpi_object *order_obj, int instance
 
 	/* Populate ordered list elements */
 	populate_ordered_list_elements_from_buffer(order_obj, instance_id, HPWMI_ORDERED_LIST_TYPE);
-
+	update_attribute_permissions(bioscfg_drv.ordered_list_data[instance_id].is_readonly,
+				    &ordered_list_current_val);
 	return sysfs_create_group(attr_name_kobj, &ordered_list_attr_group);
 }
 
diff --git a/drivers/platform/x86/hp/string-attributes.c b/drivers/platform/x86/hp/string-attributes.c
index c85688cfbccc..a8e4f8b60dff 100644
--- a/drivers/platform/x86/hp/string-attributes.c
+++ b/drivers/platform/x86/hp/string-attributes.c
@@ -164,6 +164,8 @@ int populate_string_package_data(union acpi_object *elements, int instance_id,
 	str_value = NULL;
 
 	populate_string_elements_from_package(elements, instance_id, HPWMI_STRING_TYPE);
+	update_attribute_permissions(bioscfg_drv.string_data[instance_id].is_readonly,
+				    &string_current_val);
 
 	return sysfs_create_group(attr_name_kobj, &string_attr_group);
 }
@@ -321,6 +323,8 @@ int populate_string_buffer_data(union acpi_object *string_obj, int instance_id,
 	/* Populate string elements */
 
 	populate_string_elements_from_buffer(string_obj, instance_id, HPWMI_STRING_TYPE);
+	update_attribute_permissions(bioscfg_drv.string_data[instance_id].is_readonly,
+				    &string_current_val);
 
 	return sysfs_create_group(attr_name_kobj, &string_attr_group);
 }
-- 
2.34.1

