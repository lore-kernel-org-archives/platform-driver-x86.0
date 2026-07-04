Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D913CBE71
	for <platform-driver-x86@vger.kernel.org>; Sat,  4 Jul 2026 16:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783181316; cv=none; b=gWCFtcrsmragXFXGc4ZVBT4lOrzmgUXVcW1hquRWM71rIAZNk+SuKD/kaneoCQLHEU6NjYdiDSylTn4+HlyVydJO0RhH7sBOv/tOM/4JHHfLU83MjpQs7/Cu+6gncBAxoJOuBgnFqYL1bauhrfVWxsWHGjgfPoVVS4tYk8dUMmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783181316; c=relaxed/simple;
	bh=e6b8ChuhFBskKb8L1PG143Qfh8QmDgMqw8uM3DLv0Hg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ikE340G0yYPJfvtS9vxQ2I5eO9yiHlmorBv16Zh2PD4Ao7lS++Q7qQuO5M9s8wih61f5XqHev8MDGfS3ePyhM0ERK+MfHIHzL1gDF8b+6UJYhuYSvrA3RUrU521gvtmrjzA232nvgIFk20KDZgbuMVSOTHlG9HNQ74iDgkxTwMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DEmXwiXL; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DEmXwiXL"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6983f20a8bfso2638865a12.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 04 Jul 2026 09:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783181313; x=1783786113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GfzFaR0Y5iazGcey5nVjMT/xy6XgcHF6j7w9Vftwlc0=;
        b=DEmXwiXLcoOJGpUIhTjKMHJyGmAUyhrLF03HhrWzgsRq0A1ot4xKJVp7ztLhceHacK
         h/e6ATZSCxxpeOLAyLbgoIsAn2wwNraqNXWaae0ffAYSjT7AvNyFhSRtGdINCcxD/08u
         NdWfvFY5UmqbVBMAL4NMaZoQWB7eLpRK8GaPwKp/hZEDriNiKiTpEKdtbI0sbWDnfjcd
         92LHBuK0WAO4fU3bn31DP8vG/C6IUM6l7DOrGwv/iOUqMIqCSXU5+EuSFW1A/WGDSfat
         hWRHft1O6nukTn8/Xb7f7Xfvx6iXPGueEjZLd1eosV88tulCafrQx6VGdESWo99nBcEM
         BwQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783181313; x=1783786113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GfzFaR0Y5iazGcey5nVjMT/xy6XgcHF6j7w9Vftwlc0=;
        b=SDELOzlVRYLGco7GfXmkme2tJxgSZ0S6SZT9ed6oo1sbN0/lgQXnIVM9XDykNRZQwx
         54m/ffQVLrZebZHuvczxPeA8XsYA9O7I+aCpf6HIVJWGWMMUUsT2cTb85ufnCub9/PXW
         HFqNaptQoNRKxQt698UO9Hzc1OBKj4OveQJP8adVXUu+1pjNnD25pYC+vDY/y7vRm6z0
         6vBhFryjUDtNZDkgwPeKKEbbH3dmXFEuTGFsLv8Ypq3oU3GsnhUqDUuItso+X3Whe5tP
         /wSgO3m+2ntSzSOMgtaIHYtLPfXnJ8ysnC4c1KjfJmgun01wNmO9blEyceykntF1Iw5c
         mzzQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp0bCoUZjJXmxM/+tQ3ncxA4gWvO5A5V7TF/zdnZFmpGn9N+omHCHvS0jkPaWv7Ip0YEZML7t6C5fyFNh4WeY1MEdea@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3WwBJS6HgUgVuK3km6GJluR0vEAM70zbjyh5hlyAn25I8Uhr9
	ahYNOXPxKd+SlHwLHF24PVdJOn4+adMUCEhcWyrSBs65Py8Xy4yN1D33
X-Gm-Gg: AfdE7cl/zkJopxlTw/EYGle6DRLd9fhEtmsPfYveab7ZxMVtxHYGiN/1Xg8KWqNNTGv
	vvZQD1bYgracoZL6UNAkgml/wir5KvNJp6Q+2vGTostZn50b2hi2eDSxNLorxtamNvw72s15iEo
	AYSenytuYCj1n4zZcwNd3WbUM/1Lgj7xtfL7FrKFTgBsplZrLr+p23FUXsYwYW/g1QPguTd/51h
	sppq46jgKNJ0SDkbLQOuW0xQoF1Sm+1viG7dnJwkzkf5s/FDlRq4VpOBJpnKfoYarpLiOZd0H92
	Renk1lBZO0ZnQeIXBSy5bs1DKzEPqEFNUhGHu//eJPi0RYj8s5jj5aDy5h/6cAFcGkHm9W421+0
	FEZKpmZaqhQj4yj1AHvSq5xRzkr/6fU9tmWtuS+Efrv+G5DZME9VOf+JYRL7jcXJdz3r2GECVJv
	T+F2i3glYilGmlwqS5MJzYnUzQAREECVZ+JST2wQFWuQ0XZv2+FGXXGNu5CmYs4J+Y4Rf1XqKEI
	w==
X-Received: by 2002:a17:907:7b85:b0:c12:34ed:da14 with SMTP id a640c23a62f3a-c12e6c2300bmr113055366b.64.1783181312699;
        Sat, 04 Jul 2026 09:08:32 -0700 (PDT)
Received: from node ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b60575c4sm438586266b.9.2026.07.04.09.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 09:08:32 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	jorge.lopez2@hp.com,
	Thomas.Weissschuh@linutronix.de,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org,
	Mario Limonciello <superm1@kernel.org>,
	Armin Wolf <W_Armin@gmx.de>,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH v2 1/3] platform/x86: hp-bioscfg: pass validated element count to package parsers
Date: Sat,  4 Jul 2026 21:07:57 +0500
Message-ID: <20260704160759.236249-2-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260704160759.236249-1-meatuni001@gmail.com>
References: <20260704160759.236249-1-meatuni001@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hp_init_bios_package_attribute() validates obj->package.count against
min_elements and then hands off elements = obj->package.elements to
one of the five per-type hp_populate_*_package_data() wrappers
(string, integer, enumeration, ordered list, password). None of these
wrappers receive that validated count. Instead each one re-derives it
locally:

  hp_populate_integer_elements_from_package(integer_obj,
                                            integer_obj->package.count,
                                            instance_id);

integer_obj here is elements, i.e. a pointer to elements[0] (the NAME
field, always ACPI_TYPE_STRING). Reading ->package.count off a string
object aliases ->string.length in the underlying union acpi_object, so
the "count" passed down is not the real package size at all.

For string, integer, enumeration and password attributes,
hp_populate_*_elements_from_package() bounds its iteration using the
corresponding per-type ELEM_CNT constant (STR_ELEM_CNT,
INT_ELEM_CNT, ENUM_ELEM_CNT and PSWD_ELEM_CNT). This relies on
hp_init_bios_package_attribute() rejecting packages with fewer than
ELEM_CNT elements before invoking the parsers.

Relaxing that check would allow shorter packages to reach these
functions, making the fixed loop bounds unsafe.

hp_populate_ordered_list_elements_from_package() doesn't even use the
count for its main loop bound - it iterates unconditionally up to
ORD_ELEM_CNT:

  for (elem = 1, eloc = 1; eloc < ORD_ELEM_CNT; elem++, eloc++)

which relies entirely on the same coincidence.

This is only safe as long as every caller is guaranteed to hand these
functions a package with at least ELEM_CNT real elements. A following
change relaxes that guarantee to allow shorter packages through, which
would turn this into a real out-of-bounds heap read of the
elements[] array once the real count drops below the fixed ELEM_CNT
loop bound.

Fix this at the source: thread the real, already-validated
obj->package.count down through each *_package_data() wrapper instead
of letting the per-type code guess at it, and use it to also bound
hp_populate_ordered_list_elements_from_package()'s main loop. This is a
no-op for any package that already meets the existing ELEM_CNT
minimums, and is a prerequisite for safely accepting shorter packages.

Fixes: a34fc329b189 ("platform/x86: hp-bioscfg: bioscfg")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c               | 5 +++++
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.h               | 5 +++++
 drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c       | 3 ++-
 drivers/platform/x86/hp/hp-bioscfg/int-attributes.c        | 3 ++-
 drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c | 7 ++++---
 drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c  | 5 +++--
 drivers/platform/x86/hp/hp-bioscfg/string-attributes.c     | 3 ++-
 7 files changed, 23 insertions(+), 8 deletions(-)

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
index af4d1920d4880..3aa2c440e0528 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
@@ -304,6 +304,7 @@ static int hp_populate_enumeration_elements_from_package(union acpi_object *enum
  * @attr_name_kobj: The parent kernel object
  */
 int hp_populate_enumeration_package_data(union acpi_object *enum_obj,
+					 int enum_obj_count,
 					 int instance_id,
 					 struct kobject *attr_name_kobj)
 {
@@ -312,7 +313,7 @@ int hp_populate_enumeration_package_data(union acpi_object *enum_obj,
 	enum_data->attr_name_kobj = attr_name_kobj;
 
 	hp_populate_enumeration_elements_from_package(enum_obj,
-						      enum_obj->package.count,
+						      enum_obj_count,
 						      instance_id);
 	hp_update_attribute_permissions(enum_data->common.is_readonly,
 					&enumeration_current_val);
diff --git a/drivers/platform/x86/hp/hp-bioscfg/int-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/int-attributes.c
index d96e160953e39..107e4cf1efb8a 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/int-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/int-attributes.c
@@ -279,6 +279,7 @@ static int hp_populate_integer_elements_from_package(union acpi_object *integer_
  * @attr_name_kobj: The parent kernel object
  */
 int hp_populate_integer_package_data(union acpi_object *integer_obj,
+				     int integer_obj_count,
 				     int instance_id,
 				     struct kobject *attr_name_kobj)
 {
@@ -286,7 +287,7 @@ int hp_populate_integer_package_data(union acpi_object *integer_obj,
 
 	integer_data->attr_name_kobj = attr_name_kobj;
 	hp_populate_integer_elements_from_package(integer_obj,
-						  integer_obj->package.count,
+						  integer_obj_count,
 						  instance_id);
 	hp_update_attribute_permissions(integer_data->common.is_readonly,
 					&integer_current_val);
diff --git a/drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c
index f09489a085c86..a50d074125268 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c
@@ -145,7 +145,7 @@ static int hp_populate_ordered_list_elements_from_package(union acpi_object *ord
 	if (!order_obj)
 		return -EINVAL;
 
-	for (elem = 1, eloc = 1; eloc < ORD_ELEM_CNT; elem++, eloc++) {
+	for (elem = 1, eloc = 1; eloc < ORD_ELEM_CNT && elem < order_obj_count; elem++, eloc++) {
 
 		switch (order_obj[elem].type) {
 		case ACPI_TYPE_STRING:
@@ -301,7 +301,8 @@ static int hp_populate_ordered_list_elements_from_package(union acpi_object *ord
  * @instance_id: The instance to enumerate
  * @attr_name_kobj: The parent kernel object
  */
-int hp_populate_ordered_list_package_data(union acpi_object *order_obj, int instance_id,
+int hp_populate_ordered_list_package_data(union acpi_object *order_obj, int order_obj_count,
+					  int instance_id,
 					  struct kobject *attr_name_kobj)
 {
 	struct ordered_list_data *ordered_list_data = &bioscfg_drv.ordered_list_data[instance_id];
@@ -309,7 +310,7 @@ int hp_populate_ordered_list_package_data(union acpi_object *order_obj, int inst
 	ordered_list_data->attr_name_kobj = attr_name_kobj;
 
 	hp_populate_ordered_list_elements_from_package(order_obj,
-						       order_obj->package.count,
+						       order_obj_count,
 						       instance_id);
 	hp_update_attribute_permissions(ordered_list_data->common.is_readonly,
 					&ordered_list_current_val);
diff --git a/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
index 4d79eb8056a5d..89316d90454d2 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
@@ -388,7 +388,8 @@ static int hp_populate_password_elements_from_package(union acpi_object *passwor
  * @instance_id: The instance to enumerate
  * @attr_name_kobj: The parent kernel object
  */
-int hp_populate_password_package_data(union acpi_object *password_obj, int instance_id,
+int hp_populate_password_package_data(union acpi_object *password_obj, int password_obj_count,
+				      int instance_id,
 				      struct kobject *attr_name_kobj)
 {
 	struct password_data *password_data = &bioscfg_drv.password_data[instance_id];
@@ -396,7 +397,7 @@ int hp_populate_password_package_data(union acpi_object *password_obj, int insta
 	password_data->attr_name_kobj = attr_name_kobj;
 
 	hp_populate_password_elements_from_package(password_obj,
-						   password_obj->package.count,
+						   password_obj_count,
 						   instance_id);
 
 	hp_friendly_user_name_update(password_data->common.path,
diff --git a/drivers/platform/x86/hp/hp-bioscfg/string-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/string-attributes.c
index fe5a9a3a4ef17..da5e81f1d188f 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/string-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/string-attributes.c
@@ -267,6 +267,7 @@ static int hp_populate_string_elements_from_package(union acpi_object *string_ob
  * @attr_name_kobj: The parent kernel object
  */
 int hp_populate_string_package_data(union acpi_object *string_obj,
+				    int string_obj_count,
 				    int instance_id,
 				    struct kobject *attr_name_kobj)
 {
@@ -275,7 +276,7 @@ int hp_populate_string_package_data(union acpi_object *string_obj,
 	string_data->attr_name_kobj = attr_name_kobj;
 
 	hp_populate_string_elements_from_package(string_obj,
-						 string_obj->package.count,
+						 string_obj_count,
 						 instance_id);
 
 	hp_update_attribute_permissions(string_data->common.is_readonly,
-- 
2.55.0

