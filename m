Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC3D3C433E0
	for <platform-driver-x86@archiver.kernel.org>; Sat, 20 Mar 2021 14:35:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C27E76195F
	for <platform-driver-x86@archiver.kernel.org>; Sat, 20 Mar 2021 14:35:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229756AbhCTOfK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 20 Mar 2021 10:35:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46507 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229791AbhCTOem (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 20 Mar 2021 10:34:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1616250882;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JscDOzEjwWKMBq3/f5KJpJLF+2hyMnsW98dOxqNRtkg=;
        b=iDtubtEWVqY46xhVT5porLPKx/Rf23st9wKDez5z3nZ8cmTbh0FtHc/rQ8vF8dUkzgg+Ni
        0GjMCGPbaucfO83lDTxVqV0lcNFvK24AJtUq/tThTocXsI4Q4GUFhQQgovGpjWP6wXArY+
        EoL3kQE2ksNZXfn4/bqMxel09FiSluo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-u6Wkycy_MfaxS1w-f_kFNg-1; Sat, 20 Mar 2021 10:34:40 -0400
X-MC-Unique: u6Wkycy_MfaxS1w-f_kFNg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1391100746C;
        Sat, 20 Mar 2021 14:34:38 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-22.ams2.redhat.com [10.36.112.22])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 46AB360C04;
        Sat, 20 Mar 2021 14:34:37 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mario Limonciello <mario.limonciello@dell.com>,
        Divya Bharathi <Divya_Bharathi@dell.com>,
        Alexander Naumann <alexandernaumann@gmx.de>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 2/7] platform/x86: dell-wmi-sysman: Make it safe to call exit_foo_attributes() multiple times
Date:   Sat, 20 Mar 2021 15:34:24 +0100
Message-Id: <20210320143429.76047-3-hdegoede@redhat.com>
In-Reply-To: <20210320143429.76047-1-hdegoede@redhat.com>
References: <20210320143429.76047-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

During some of the error-exit paths it is possible that
release_attributes_data() will get called multiple times,
which results in exit_foo_attributes() getting called multiple
times.

Make it safe to call exit_foo_attributes() multiple times,
avoiding double-free()s in this case.

Note that release_attributes_data() really should only be called
once during error-exit paths. This will be fixed in a separate patch
and it is good to have the exit_foo_attributes() functions modified
this way regardless.

Cc: Divya Bharathi <Divya_Bharathi@dell.com>
Cc: Mario Limonciello <mario.limonciello@dell.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c    | 3 +++
 drivers/platform/x86/dell/dell-wmi-sysman/int-attributes.c     | 3 +++
 drivers/platform/x86/dell/dell-wmi-sysman/passobj-attributes.c | 3 +++
 drivers/platform/x86/dell/dell-wmi-sysman/string-attributes.c  | 3 +++
 4 files changed, 12 insertions(+)

diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c b/drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c
index 80f4b7785c6c..091e48c217ed 100644
--- a/drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c
+++ b/drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c
@@ -185,5 +185,8 @@ void exit_enum_attributes(void)
 			sysfs_remove_group(wmi_priv.enumeration_data[instance_id].attr_name_kobj,
 								&enumeration_attr_group);
 	}
+	wmi_priv.enumeration_instances_count = 0;
+
 	kfree(wmi_priv.enumeration_data);
+	wmi_priv.enumeration_data = NULL;
 }
diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/int-attributes.c b/drivers/platform/x86/dell/dell-wmi-sysman/int-attributes.c
index 75aedbb733be..8a49ba6e44f9 100644
--- a/drivers/platform/x86/dell/dell-wmi-sysman/int-attributes.c
+++ b/drivers/platform/x86/dell/dell-wmi-sysman/int-attributes.c
@@ -175,5 +175,8 @@ void exit_int_attributes(void)
 			sysfs_remove_group(wmi_priv.integer_data[instance_id].attr_name_kobj,
 								&integer_attr_group);
 	}
+	wmi_priv.integer_instances_count = 0;
+
 	kfree(wmi_priv.integer_data);
+	wmi_priv.integer_data = NULL;
 }
diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/passobj-attributes.c b/drivers/platform/x86/dell/dell-wmi-sysman/passobj-attributes.c
index 3abcd95477c0..834b3e82ad9f 100644
--- a/drivers/platform/x86/dell/dell-wmi-sysman/passobj-attributes.c
+++ b/drivers/platform/x86/dell/dell-wmi-sysman/passobj-attributes.c
@@ -183,5 +183,8 @@ void exit_po_attributes(void)
 			sysfs_remove_group(wmi_priv.po_data[instance_id].attr_name_kobj,
 								&po_attr_group);
 	}
+	wmi_priv.po_instances_count = 0;
+
 	kfree(wmi_priv.po_data);
+	wmi_priv.po_data = NULL;
 }
diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/string-attributes.c b/drivers/platform/x86/dell/dell-wmi-sysman/string-attributes.c
index ac75dce88a4c..552537852459 100644
--- a/drivers/platform/x86/dell/dell-wmi-sysman/string-attributes.c
+++ b/drivers/platform/x86/dell/dell-wmi-sysman/string-attributes.c
@@ -155,5 +155,8 @@ void exit_str_attributes(void)
 			sysfs_remove_group(wmi_priv.str_data[instance_id].attr_name_kobj,
 								&str_attr_group);
 	}
+	wmi_priv.str_instances_count = 0;
+
 	kfree(wmi_priv.str_data);
+	wmi_priv.str_data = NULL;
 }
-- 
2.30.2

