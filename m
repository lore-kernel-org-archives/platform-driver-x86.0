Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BC83C433E5
	for <platform-driver-x86@archiver.kernel.org>; Sun, 21 Mar 2021 12:00:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 764BF61934
	for <platform-driver-x86@archiver.kernel.org>; Sun, 21 Mar 2021 12:00:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229870AbhCUL7f (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 21 Mar 2021 07:59:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43607 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229863AbhCUL7P (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 21 Mar 2021 07:59:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1616327955;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=63sGUIPGwRX8T776t41Ah9DZ0E6jDqpaAgBQx7Fo0GA=;
        b=LgiK8RPQxdf6x4ibbQc5gYmjS66VL3Hrp0dnz86bYE1ay0kiu2heyR6VNLSMdU1bbH4aBM
        BQ3KXtsE8hLMqM1aAx35As/wlGhhVXRdGFVF+qUikHvt/TV5o5c2URiRv0NtFCl/rwzYNd
        YIObEIKc0lk19yyefvnRLZxDgg9Khug=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-pBOpqXG2NsSFMbnAlgzSKw-1; Sun, 21 Mar 2021 07:59:13 -0400
X-MC-Unique: pBOpqXG2NsSFMbnAlgzSKw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A7B21084C83;
        Sun, 21 Mar 2021 11:59:12 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-68.ams2.redhat.com [10.36.112.68])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B2A3A5DAA5;
        Sun, 21 Mar 2021 11:59:09 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mario Limonciello <mario.limonciello@dell.com>,
        Divya Bharathi <Divya_Bharathi@dell.com>,
        Alexander Naumann <alexandernaumann@gmx.de>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 3/7] platform/x86: dell-wmi-sysman: Make it safe to call exit_foo_attributes() multiple times
Date:   Sun, 21 Mar 2021 12:58:57 +0100
Message-Id: <20210321115901.35072-4-hdegoede@redhat.com>
In-Reply-To: <20210321115901.35072-1-hdegoede@redhat.com>
References: <20210321115901.35072-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

Fixes: e8a60aa7404b ("platform/x86: Introduce support for Systems Management Driver over WMI for Dell Systems")
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

