Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D32DC433E4
	for <platform-driver-x86@archiver.kernel.org>; Sat, 20 Mar 2021 14:35:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3B1C96195F
	for <platform-driver-x86@archiver.kernel.org>; Sat, 20 Mar 2021 14:35:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229843AbhCTOfL (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 20 Mar 2021 10:35:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55211 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229846AbhCTOew (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 20 Mar 2021 10:34:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1616250891;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cTir6aiQwLsSIBXS0+hw5CKMF1BTV8Mae4n8w574PKI=;
        b=I7c0oUwPhkh2bN7ulpLGqIj+DmA9UWBr1sCAOlej8mOycHRZBHag+N71t7EDbRHJ9IWxJ9
        Idus/gAyoLNuooxPE2cGpb4ZNM8jDYQ7K4BSCKUwiuIrVvoQsNcYYYCB59KUKuFo9Hc1N4
        Sg6ZuUrITAtECdjDlmvz9V87mi8O9vQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-67-J8wO2XQHO4G0fDbhNkMTNg-1; Sat, 20 Mar 2021 10:34:49 -0400
X-MC-Unique: J8wO2XQHO4G0fDbhNkMTNg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 636495B361;
        Sat, 20 Mar 2021 14:34:48 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-22.ams2.redhat.com [10.36.112.22])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 063E960C04;
        Sat, 20 Mar 2021 14:34:46 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mario Limonciello <mario.limonciello@dell.com>,
        Divya Bharathi <Divya_Bharathi@dell.com>,
        Alexander Naumann <alexandernaumann@gmx.de>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 6/7] platform/x86: dell-wmi-sysman: Make init_bios_attributes() ACPI object parsing more robust
Date:   Sat, 20 Mar 2021 15:34:28 +0100
Message-Id: <20210320143429.76047-7-hdegoede@redhat.com>
In-Reply-To: <20210320143429.76047-1-hdegoede@redhat.com>
References: <20210320143429.76047-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Make init_bios_attributes() ACPI object parsing more robust:
1. Always check that the type of the return ACPI object is package, rather
   then only checking this for instance_id == 0
2. Check that the package has the minimum amount of elements which will
   be consumed by the populate_foo_data() for the attr_type
3. Don't return -ENODEV when the get_wmiobj_pointer() call for
   instance_id == 0 returns NULL. It is possible for a BIOS to e.g.
   only have ENUM + INT attributes and no STR attributes

Note/TODO: The populate_foo_data() functions should also be made more
robust. The should check the type of each of the elements matches the
type which they expect and in case of populate_enum_data()
obj->package.count should be passed to it as an argument and it should
re-check this itself since it consume a variable number of elements.

Cc: Divya Bharathi <Divya_Bharathi@dell.com>
Cc: Mario Limonciello <mario.limonciello@dell.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../x86/dell/dell-wmi-sysman/sysman.c         | 34 +++++++++++++++----
 1 file changed, 28 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
index 6ed3cee2208b..c2ccf86f4037 100644
--- a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
+++ b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
@@ -400,6 +400,7 @@ static int init_bios_attributes(int attr_type, const char *guid)
 	union acpi_object *obj = NULL;
 	union acpi_object *elements;
 	struct kset *tmp_set;
+	int min_elements;
 
 	/* instance_id needs to be reset for each type GUID
 	 * also, instance IDs are unique within GUID but not across
@@ -410,14 +411,36 @@ static int init_bios_attributes(int attr_type, const char *guid)
 	retval = alloc_attributes_data(attr_type);
 	if (retval)
 		return retval;
+
+	switch (attr_type) {
+	case ENUM:	min_elements = 8;	break;
+	case INT:	min_elements = 9;	break;
+	case STR:	min_elements = 8;	break;
+	case PO:	min_elements = 4;	break;
+	default:
+		pr_err("Error: Unknown attr_type: %d\n", attr_type);
+		return -EINVAL;
+	}
+
+	mutex_lock(&wmi_priv.mutex);
+
 	/* need to use specific instance_id and guid combination to get right data */
 	obj = get_wmiobj_pointer(instance_id, guid);
-	if (!obj || obj->type != ACPI_TYPE_PACKAGE)
-		return -ENODEV;
-	elements = obj->package.elements;
+	while (obj) {
+		if (obj->type != ACPI_TYPE_PACKAGE) {
+			pr_err("Error: Expected ACPI-package type, got: %d\n", obj->type);
+			retval = -EIO;
+			goto err_attr_init;
+		}
+
+		if (obj->package.count < min_elements) {
+			pr_err("Error: ACPI-package does not have enough elements: %d < %d\n",
+			       obj->package.count, min_elements);
+			goto nextobj;
+		}
+
+		elements = obj->package.elements;
 
-	mutex_lock(&wmi_priv.mutex);
-	while (elements) {
 		/* sanity checking */
 		if (elements[ATTR_NAME].type != ACPI_TYPE_STRING) {
 			pr_debug("incorrect element type\n");
@@ -482,7 +505,6 @@ static int init_bios_attributes(int attr_type, const char *guid)
 		kfree(obj);
 		instance_id++;
 		obj = get_wmiobj_pointer(instance_id, guid);
-		elements = obj ? obj->package.elements : NULL;
 	}
 
 	mutex_unlock(&wmi_priv.mutex);
-- 
2.30.2

