Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68793C433DB
	for <platform-driver-x86@archiver.kernel.org>; Sun, 21 Mar 2021 12:18:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 22BC16193E
	for <platform-driver-x86@archiver.kernel.org>; Sun, 21 Mar 2021 12:18:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230024AbhCUMRQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 21 Mar 2021 08:17:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53565 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229834AbhCUMQd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 21 Mar 2021 08:16:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1616328974;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=BpxkM5oiszKtV6XEy/xn+ANEYXQeiAGcS1Kt72wxxH0=;
        b=YIBJbM062eWQW9Rx/jtadpltBE7U2+ddBf0hQzEr/pQBaiwu6aPX+WVlSXKJohhZ8UCNJY
        p4qiHThfHxZ3aB1irDiNcCwbnZKiD+lQTCdx7lf5ERffW32fiYrkQdNVzC3pz5Il3f+hyJ
        1POh6Qxm7cSJ+x+QoauglcB/l2o2yZ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-ApOsfsyTPgyvMdBgztaRew-1; Sun, 21 Mar 2021 08:16:12 -0400
X-MC-Unique: ApOsfsyTPgyvMdBgztaRew-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E18631007474;
        Sun, 21 Mar 2021 12:16:10 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-68.ams2.redhat.com [10.36.112.68])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 782C610023AC;
        Sun, 21 Mar 2021 12:16:09 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mario Limonciello <mario.limonciello@dell.com>,
        Divya Bharathi <Divya_Bharathi@dell.com>,
        Alexander Naumann <alexandernaumann@gmx.de>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH v2] platform/x86: dell-wmi-sysman: Make init_bios_attributes() ACPI object parsing more robust
Date:   Sun, 21 Mar 2021 13:16:07 +0100
Message-Id: <20210321121607.35717-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Make init_bios_attributes() ACPI object parsing more robust:
1. Always check that the type of the return ACPI object is package, rather
   then only checking this for instance_id == 0
2. Check that the package has the minimum amount of elements which will
   be consumed by the populate_foo_data() for the attr_type

Note/TODO: The populate_foo_data() functions should also be made more
robust. The should check the type of each of the elements matches the
type which they expect and in case of populate_enum_data()
obj->package.count should be passed to it as an argument and it should
re-check this itself since it consume a variable number of elements.

Fixes: e8a60aa7404b ("platform/x86: Introduce support for Systems Management Driver over WMI for Dell Systems")
Cc: Divya Bharathi <Divya_Bharathi@dell.com>
Cc: Mario Limonciello <mario.limonciello@dell.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Restore behavior of returning -ENODEV when the get_wmiobj_pointer() call
  for instance_id == 0 returns NULL. Otherwise
  /sys/class/firmware-attributes/dell-wmi-sysman will get created with an
  empty attributes dir (empty except for pending_reboot and reset_bios)
---
 .../x86/dell/dell-wmi-sysman/sysman.c         | 32 ++++++++++++++++---
 1 file changed, 28 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
index 7410ccae650c..a90ae6ba4a73 100644
--- a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
+++ b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
@@ -399,6 +399,7 @@ static int init_bios_attributes(int attr_type, const char *guid)
 	union acpi_object *obj = NULL;
 	union acpi_object *elements;
 	struct kset *tmp_set;
+	int min_elements;
 
 	/* instance_id needs to be reset for each type GUID
 	 * also, instance IDs are unique within GUID but not across
@@ -409,14 +410,38 @@ static int init_bios_attributes(int attr_type, const char *guid)
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
 	/* need to use specific instance_id and guid combination to get right data */
 	obj = get_wmiobj_pointer(instance_id, guid);
-	if (!obj || obj->type != ACPI_TYPE_PACKAGE)
+	if (!obj)
 		return -ENODEV;
-	elements = obj->package.elements;
 
 	mutex_lock(&wmi_priv.mutex);
-	while (elements) {
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
+
 		/* sanity checking */
 		if (elements[ATTR_NAME].type != ACPI_TYPE_STRING) {
 			pr_debug("incorrect element type\n");
@@ -481,7 +506,6 @@ static int init_bios_attributes(int attr_type, const char *guid)
 		kfree(obj);
 		instance_id++;
 		obj = get_wmiobj_pointer(instance_id, guid);
-		elements = obj ? obj->package.elements : NULL;
 	}
 
 	mutex_unlock(&wmi_priv.mutex);
-- 
2.30.2

