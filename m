Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A93C39C00E
	for <platform-driver-x86@vger.kernel.org>; Thu,  9 Jul 2026 16:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783616353; cv=none; b=tQ4FJGLNAyziBVShfa8eSSJ5j5G5bGicgyRIBwCqmTN0kfF9kQ2TmsOeIW4o6xS5bQHinMFNNF8cLf/Hi6di8gwzIjJR/cAQUUF7xpv94ZKQfNJPcLCaD6wDn2a2IIIDflgWkscE9pOPUMQZkcSz+Na2i4EZpYnWDed5Gf7q9H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783616353; c=relaxed/simple;
	bh=ncnC0cZgOIn9WbDqi4OeJBlvxuN/aT4ju5W4zu4///s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mt1crDMP2SRBeDksaoYek9KaRMSPW2CJ65eTpLFBKjH1Ug2XFUIlscyYmllYgrR22i7cG+lD6GeLBR1KUx8GK4GfgDnmftGyomplFJPGOoen9vnhxOYDAEQ/IJi2Ctwt9O5ktFUKnJI8ZsMpoWanxrukj+rRN726495Rr5E+i6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AJ2lwe7a; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AJ2lwe7a"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-69c108fee0aso17135a12.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 09 Jul 2026 09:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783616350; x=1784221150; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tqupO2cycfWRYtbmT/oP3+yrh6nW6on2Bsj2SXIaYZc=;
        b=AJ2lwe7aP6k/57iTdIGtv2IyXtGyrWe5KqLKjRNQY0bf+CGgNDz8IFdpsG1lFR8uZc
         x7hSvKTJDcdiqjPFI9rCYXkskmqUC+ktPBp5erq8a0zmJTdtvtzOQCnh9p59SsLYvDzu
         PYDGZB5WX+NR0mpdUfW0d8i0ijMM0tLouuYT3gtoNhqDfOUSvsbfhRzv43RjKta1AaI6
         xlpFySCtH/dTwaaVe/r89uvnn8mAZ6D7dI8SKb2U+ybO/hCEDVNeVO/4MpNSnuelYFyN
         ZTN+qjPRH1Ex7q/R5J2eGUbdVOmkOUu7XneU40yQIzdxdlllXmhlg8qj1+qC1ZmmwGxR
         f7JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783616350; x=1784221150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tqupO2cycfWRYtbmT/oP3+yrh6nW6on2Bsj2SXIaYZc=;
        b=EKUGw0LknkSG9UGGXg7FclLbL5Wuzg+BWEpa9/TbQ/M4wqr0VbhRbEB1GBYsKYmTUE
         4qcDg3XUhA5HS0apzZrZIFw/Jn9XaUOjI3nprrTQ5BNfrQzD8exYA4U/S7d/6+E9SbPE
         hWeBhZyVsgGRcd+dIGev5rGeRJd1K57N45TH42X9K6p+Vk8fJxDeoqbLTRqLi28fFsLw
         KPQgcSGaG0SVkBNZjZ6iS7BrwSbSRFUG02QGaiCn6mGBSU3JDvM2mFvn8g1lr4+zHqJe
         HGgQl7kxOvTOvyPLsS5mo214YjJ/+ySOd9kiMuZ0HJ8L20o2pviGcCFGY1p6BJlaOsIB
         ZVlQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr60rjWND4FkMa4S8gXosb4b24UsxGuABDuJhD/2XOHXPpMXCfmd8IimBCVC9UbnMSWZyDGIH7BIiLx0RzHdCuz8FKQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwFxKO+PetzWWac2ocMJGR8vHRirbMWu2vV3oDt67qK379l3ZCP
	DvSaW2dh35v0fU0CWqpwlJQa5lT3fq156vt2JiKrwq7HWFDaINH/tmJxHNO9cc11
X-Gm-Gg: AfdE7cl47PwxKlgiJ/nuf2RW1ShW4qJmXGzg34nwSYUq+YBvLFvtbfZm8RSY/+vpEyN
	nNXZrrhWDnqqWu9UDqm2Bc4GW+84/M6gLgfWxraM3U3irarDL7vu1NjVLS/l0d6+jKZfP10zb9z
	IUcBsTlfWcWxDmgMeWHhmcVDz8WL+ya9yimb5MLs05Tob0y1ib3rUtmDHytuH9x12Ef7yavepNZ
	Ukxz8jx6dkeWP7md7YYn/blOpxuFnwmD7/0aTDBoZjeMns4jho0iwM2MC2lSDIOoAm2mpIJLQrh
	kvwfY0WUKularEZRrJZVmqjlp6V+x9QtxBD9x8rLWYO2gbKJqHVtFntszVGk2xyLXsAy4VHOTf5
	65zjPsM9Ea7NLJnrpqwl1OQXfmBwPSEp4FMJUswN8pC/hMUaSNlUPV4wOhefayXlMJfSqvJ4zZk
	mvbm+6dgowqyCCq8JPMhExAYmQBvM7//KEu+N0LgN5bzQtgJfNQELHeV2kFOQK/RsYAOIe71Eqg
	w==
X-Received: by 2002:a17:907:8a8f:b0:c15:cf51:d827 with SMTP id a640c23a62f3a-c15cf51decdmr382259866b.57.1783616349425;
        Thu, 09 Jul 2026 09:59:09 -0700 (PDT)
Received: from node ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15c79f2a3fsm329902666b.49.2026.07.09.09.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 09:59:08 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Jorge Lopez <jorge.lopez2@hp.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org,
	Mario Limonciello <superm1@kernel.org>,
	Armin Wolf <W_Armin@gmx.de>,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH v5 1/4] platform/x86: hp-bioscfg: pass validated element count to package parsers
Date: Thu,  9 Jul 2026 21:58:56 +0500
Message-ID: <20260709165900.30615-2-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260709165900.30615-1-meatuni001@gmail.com>
References: <20260709165900.30615-1-meatuni001@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The per-type package parsers are handed the wrong element count.

hp_init_bios_package_attribute() validates obj->package.count and then
calls one of the five hp_populate_*_package_data() wrappers (string,
integer, enumeration, ordered list, password). Each wrapper forwards a
count to its hp_populate_*_elements_from_package() parser, but instead
of forwarding the validated obj->package.count it derives the count
from elements[0]. elements[0] is the NAME field and is always an
ACPI_TYPE_STRING, so reading ->package.count from it in fact reads
->string.length through the union acpi_object. The parsers thus bound
themselves against the length of the name string rather than against
the real number of elements in the package.

This is safe today because hp_init_bios_package_attribute() refuses any
package that has fewer than the type's element count, so a parser only
ever runs on a full package and never reads past it regardless of the
bogus bound.

An upcoming change relaxes that check to accept shorter packages. Once
a parser can receive fewer elements than its per-type count, a bound
taken from the name length no longer reflects the array size, and the
"elem < count" loop conditions and "elem + n >= count" sub-loop guards
read past the end of elements[] - an out-of-bounds heap read.

Forward the validated obj->package.count to every *_package_data()
wrapper so the parsers bound themselves against the real package size.
This does not change behaviour for the packages that enumerate
correctly today and is a prerequisite for accepting shorter packages
safely.

Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c               | 5 +++++
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.h               | 5 +++++
 drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c       | 4 +++-
 drivers/platform/x86/hp/hp-bioscfg/int-attributes.c        | 4 +++-
 drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c | 6 ++++--
 drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c  | 6 ++++--
 drivers/platform/x86/hp/hp-bioscfg/string-attributes.c     | 4 +++-
 7 files changed, 27 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
index 27fd6cd215290..768330d291da8 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
@@ -731,26 +731,31 @@ static int hp_init_bios_package_attribute(enum hp_wmi_data_type attr_type,
 	switch (attr_type) {
 	case HPWMI_STRING_TYPE:
 		ret = hp_populate_string_package_data(elements,
+						      obj->package.count,
 						      instance_id,
 						      attr_name_kobj);
 		break;
 	case HPWMI_INTEGER_TYPE:
 		ret = hp_populate_integer_package_data(elements,
+						       obj->package.count,
 						       instance_id,
 						       attr_name_kobj);
 		break;
 	case HPWMI_ENUMERATION_TYPE:
 		ret = hp_populate_enumeration_package_data(elements,
+							   obj->package.count,
 							   instance_id,
 							   attr_name_kobj);
 		break;
 	case HPWMI_ORDERED_LIST_TYPE:
 		ret = hp_populate_ordered_list_package_data(elements,
+							    obj->package.count,
 							    instance_id,
 							    attr_name_kobj);
 		break;
 	case HPWMI_PASSWORD_TYPE:
 		ret = hp_populate_password_package_data(elements,
+							obj->package.count,
 							instance_id,
 							attr_name_kobj);
 		break;
diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.h b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.h
index f1eec0e4ba075..416d7e7aaaae3 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.h
+++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.h
@@ -401,6 +401,7 @@ int hp_populate_string_buffer_data(u8 *buffer_ptr, u32 *buffer_size,
 int hp_alloc_string_data(void);
 void hp_exit_string_attributes(void);
 int hp_populate_string_package_data(union acpi_object *str_obj,
+				    int str_obj_count,
 				    int instance_id,
 				    struct kobject *attr_name_kobj);
 
@@ -411,6 +412,7 @@ int hp_populate_integer_buffer_data(u8 *buffer_ptr, u32 *buffer_size,
 int hp_alloc_integer_data(void);
 void hp_exit_integer_attributes(void);
 int hp_populate_integer_package_data(union acpi_object *integer_obj,
+				     int integer_obj_count,
 				     int instance_id,
 				     struct kobject *attr_name_kobj);
 
@@ -421,6 +423,7 @@ int hp_populate_enumeration_buffer_data(u8 *buffer_ptr, u32 *buffer_size,
 int hp_alloc_enumeration_data(void);
 void hp_exit_enumeration_attributes(void);
 int hp_populate_enumeration_package_data(union acpi_object *enum_obj,
+					 int enum_obj_count,
 					 int instance_id,
 					 struct kobject *attr_name_kobj);
 
@@ -432,6 +435,7 @@ int hp_populate_ordered_list_buffer_data(u8 *buffer_ptr,
 int hp_alloc_ordered_list_data(void);
 void hp_exit_ordered_list_attributes(void);
 int hp_populate_ordered_list_package_data(union acpi_object *order_obj,
+					  int order_obj_count,
 					  int instance_id,
 					  struct kobject *attr_name_kobj);
 
@@ -440,6 +444,7 @@ int hp_populate_password_buffer_data(u8 *buffer_ptr, u32 *buffer_size,
 				     int instance_id,
 				     struct kobject *attr_name_kobj);
 int hp_populate_password_package_data(union acpi_object *password_obj,
+				      int password_obj_count,
 				      int instance_id,
 				      struct kobject *attr_name_kobj);
 int hp_alloc_password_data(void);
diff --git a/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
index af4d1920d4880..de156a9f88a18 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
@@ -300,10 +300,12 @@ static int hp_populate_enumeration_elements_from_package(union acpi_object *enum
  * Populate all properties of an instance under enumeration attribute
  *
  * @enum_obj: ACPI object with enumeration data
+ * @enum_obj_count: Number of elements in @enum_obj
  * @instance_id: The instance to enumerate
  * @attr_name_kobj: The parent kernel object
  */
 int hp_populate_enumeration_package_data(union acpi_object *enum_obj,
+					 int enum_obj_count,
 					 int instance_id,
 					 struct kobject *attr_name_kobj)
 {
@@ -312,7 +314,7 @@ int hp_populate_enumeration_package_data(union acpi_object *enum_obj,
 	enum_data->attr_name_kobj = attr_name_kobj;
 
 	hp_populate_enumeration_elements_from_package(enum_obj,
-						      enum_obj->package.count,
+						      enum_obj_count,
 						      instance_id);
 	hp_update_attribute_permissions(enum_data->common.is_readonly,
 					&enumeration_current_val);
diff --git a/drivers/platform/x86/hp/hp-bioscfg/int-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/int-attributes.c
index d96e160953e39..f2fd966c9ca4c 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/int-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/int-attributes.c
@@ -275,10 +275,12 @@ static int hp_populate_integer_elements_from_package(union acpi_object *integer_
  * Populate all properties of an instance under integer attribute
  *
  * @integer_obj: ACPI object with integer data
+ * @integer_obj_count: Number of elements in @integer_obj
  * @instance_id: The instance to enumerate
  * @attr_name_kobj: The parent kernel object
  */
 int hp_populate_integer_package_data(union acpi_object *integer_obj,
+				     int integer_obj_count,
 				     int instance_id,
 				     struct kobject *attr_name_kobj)
 {
@@ -286,7 +288,7 @@ int hp_populate_integer_package_data(union acpi_object *integer_obj,
 
 	integer_data->attr_name_kobj = attr_name_kobj;
 	hp_populate_integer_elements_from_package(integer_obj,
-						  integer_obj->package.count,
+						  integer_obj_count,
 						  instance_id);
 	hp_update_attribute_permissions(integer_data->common.is_readonly,
 					&integer_current_val);
diff --git a/drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c
index f09489a085c86..cc5bebe73a93b 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c
@@ -298,10 +298,12 @@ static int hp_populate_ordered_list_elements_from_package(union acpi_object *ord
  * Populate all properties of an instance under ordered_list attribute
  *
  * @order_obj: ACPI object with ordered_list data
+ * @order_obj_count: Number of elements in @order_obj
  * @instance_id: The instance to enumerate
  * @attr_name_kobj: The parent kernel object
  */
-int hp_populate_ordered_list_package_data(union acpi_object *order_obj, int instance_id,
+int hp_populate_ordered_list_package_data(union acpi_object *order_obj, int order_obj_count,
+					  int instance_id,
 					  struct kobject *attr_name_kobj)
 {
 	struct ordered_list_data *ordered_list_data = &bioscfg_drv.ordered_list_data[instance_id];
@@ -309,7 +311,7 @@ int hp_populate_ordered_list_package_data(union acpi_object *order_obj, int inst
 	ordered_list_data->attr_name_kobj = attr_name_kobj;
 
 	hp_populate_ordered_list_elements_from_package(order_obj,
-						       order_obj->package.count,
+						       order_obj_count,
 						       instance_id);
 	hp_update_attribute_permissions(ordered_list_data->common.is_readonly,
 					&ordered_list_current_val);
diff --git a/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
index 4d79eb8056a5d..ed5e2080f22bd 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
@@ -385,10 +385,12 @@ static int hp_populate_password_elements_from_package(union acpi_object *passwor
  *	Populate all properties for an instance under password attribute
  *
  * @password_obj: ACPI object with password data
+ * @password_obj_count: Number of elements in @password_obj
  * @instance_id: The instance to enumerate
  * @attr_name_kobj: The parent kernel object
  */
-int hp_populate_password_package_data(union acpi_object *password_obj, int instance_id,
+int hp_populate_password_package_data(union acpi_object *password_obj, int password_obj_count,
+				      int instance_id,
 				      struct kobject *attr_name_kobj)
 {
 	struct password_data *password_data = &bioscfg_drv.password_data[instance_id];
@@ -396,7 +398,7 @@ int hp_populate_password_package_data(union acpi_object *password_obj, int insta
 	password_data->attr_name_kobj = attr_name_kobj;
 
 	hp_populate_password_elements_from_package(password_obj,
-						   password_obj->package.count,
+						   password_obj_count,
 						   instance_id);
 
 	hp_friendly_user_name_update(password_data->common.path,
diff --git a/drivers/platform/x86/hp/hp-bioscfg/string-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/string-attributes.c
index fe5a9a3a4ef17..f98c32dacbc74 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/string-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/string-attributes.c
@@ -263,10 +263,12 @@ static int hp_populate_string_elements_from_package(union acpi_object *string_ob
  * Populate all properties of an instance under string attribute
  *
  * @string_obj: ACPI object with string data
+ * @string_obj_count: Number of elements in @string_obj
  * @instance_id: The instance to enumerate
  * @attr_name_kobj: The parent kernel object
  */
 int hp_populate_string_package_data(union acpi_object *string_obj,
+				    int string_obj_count,
 				    int instance_id,
 				    struct kobject *attr_name_kobj)
 {
@@ -275,7 +277,7 @@ int hp_populate_string_package_data(union acpi_object *string_obj,
 	string_data->attr_name_kobj = attr_name_kobj;
 
 	hp_populate_string_elements_from_package(string_obj,
-						 string_obj->package.count,
+						 string_obj_count,
 						 instance_id);
 
 	hp_update_attribute_permissions(string_data->common.is_readonly,
-- 
2.55.0

