Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86B75C3527D
	for <platform-driver-x86@archiver.kernel.org>; Mon,  4 Apr 2022 21:37:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382596AbiDDVbc (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 4 Apr 2022 17:31:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380589AbiDDUi1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 4 Apr 2022 16:38:27 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10CA9387AD
        for <platform-driver-x86@vger.kernel.org>; Mon,  4 Apr 2022 13:36:31 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id i7so11287923oie.7
        for <platform-driver-x86@vger.kernel.org>; Mon, 04 Apr 2022 13:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=qk4dHCzq6OS+6wQmPbPKS2u/ZPFPZRiwLoUaUgtocjI=;
        b=LJN06XJjDnKj1VH389AYLaJljTHjYQNI0eHoJEze1g6O6QFR9zKfDTbr6gaWdms2/t
         hxIdMj9jeg/w13PQfAsvfNlrkGRlMBRLi2HwmFz57wkmbnSyoirfEDLAN2G9cPu1leGL
         sGRWyw0IvHIYKy1xZkcRZlyx3Q9EhrSOprXtukOdhjigG+27pVwGt9egscn2nGyrHyli
         1VDB9byZzoVE/A8/E0syF2k/FS6RWg+XPp/A1YyHHYQg5KHSrBbetznIaK1vhJJItZK0
         w/VLY3KeaEFBbp8L7KLwLjMhG1yN+hezIk9gBYUD3W5US+x+QI0BramTjQUAaDoA/o6K
         yQsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qk4dHCzq6OS+6wQmPbPKS2u/ZPFPZRiwLoUaUgtocjI=;
        b=W5fOWU9TXsjuSQMKfGsAnCumjTbkB2/RDcLQnC+6ejB+eRrf1C0A0rzAxdh5YuroAQ
         Ym33yfxnxI7F/GL9EHoxqCufalI/Xa3N3v0uIwWAa/bpnj+lxpGBqKPlVpf8BZ2dc2Bp
         1L5jRkQWTAWplQVYytyUzcD/IuktSYuoHlYy6qISZwlIEt3cgBybW32mfmdtF3y70bl/
         yqBZDOeielng6uG80pXRfEbpjQauVT36ymXSDEvrciu+zP52TZwSF/B3vdxC/ufDjqYC
         ChebK4qGun77riqbUUt0vYCFlPcvOHKYpPOD0Y3n4J2pAouFKwqHKb9OOolGoYegP7rG
         Reiw==
X-Gm-Message-State: AOAM530oVDKiqjgN1UcTckdZ0a85gkCZe0hetanUTvjF3vW9mzLTAEq/
        9Si7lsTz4qrcVXmLNDlI28syM4pLv30=
X-Google-Smtp-Source: ABdhPJyZWcGB+cMarFwdjQLwvJRkMG8zONjJGzyN4QMPsrVUqZfrviCb8VhABn7TxkoivMPIZJXDjg==
X-Received: by 2002:a05:6808:f89:b0:2f9:7676:be3a with SMTP id o9-20020a0568080f8900b002f97676be3amr26080oiw.21.1649104590194;
        Mon, 04 Apr 2022 13:36:30 -0700 (PDT)
Received: from grumpy-vm.hsd1.tx.comcast.net ([2601:2c3:480:7390:c57b:f63e:33f5:caed])
        by smtp.gmail.com with ESMTPSA id u20-20020a4a9e94000000b003291f6ac4b2sm3765786ook.28.2022.04.04.13.36.29
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 13:36:29 -0700 (PDT)
From:   Jorge Lopez <jorgealtxwork@gmail.com>
X-Google-Original-From: Jorge Lopez <jorge.lopez2@hp.com>
To:     platform-driver-x86@vger.kernel.org
Subject: [PATCH v1 4/6] Sure Start Security Feature
Date:   Mon,  4 Apr 2022 15:36:24 -0500
Message-Id: <20220404203626.4311-5-jorge.lopez2@hp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220404203626.4311-1-jorge.lopez2@hp.com>
References: <20220404203626.4311-1-jorge.lopez2@hp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Sure Start provides advanced firmware protection and resiliency by
identifying and repairing unauthorized BIOS changes.  It maintains an
audit log of these events and other important system configuration
changes.  The following sysfs entries can be used to read the contents
of the audit log.

      /sys/devices/platform/hp-wmi/sure_start/audit_log_entry_count
      /sys/devices/platform/hp-wmi/sure_start/audit_log_entries

'audit_log_entry_count' is a read-only file that returns the number of
existing audit log events available to be read

'audit_log_entries' is a read-only file that returns the events in the
log

This feature requires "Update hp_wmi_group to simplify feature
addition" patch.

All changes were validated on a HP ZBook Workstation,
HP EliteBook x360, and HP EliteBook 850 G8 notebooks.

Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>

---
Based on the latest platform-drivers-x86.git/for-next
---
 drivers/platform/x86/hp-wmi.c | 108 ++++++++++++++++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index 139dc079c1fa..918e3eaf1b67 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -126,6 +126,11 @@ enum hp_wmi_spm_commandtype {
 	HPWMI_SECUREPLATFORM_SET_SK	= 0x12,
 };
 
+enum hp_wmi_surestart_commandtype {
+	HPWMI_SURESTART_GET_LOG_COUNT	= 0x01,
+	HPWMI_SURESTART_GET_LOG	= 0x02,
+};
+
 enum hp_wmi_gm_commandtype {
 	HPWMI_FAN_SPEED_GET_QUERY = 0x11,
 	HPWMI_SET_PERFORMANCE_MODE = 0x1A,
@@ -138,6 +143,7 @@ enum hp_wmi_command {
 	HPWMI_READ	= 0x01,
 	HPWMI_WRITE	= 0x02,
 	HPWMI_ODM	= 0x03,
+	HPWMI_SURESTART = 0x20006,
 	HPWMI_GM	= 0x20008,
 	HPWMI_SECUREPLATFORM = 0x20010,
 };
@@ -851,6 +857,7 @@ static ssize_t spm_kek_store(struct kobject *kobj,
 {
 	int ret = hp_wmi_perform_query(HPWMI_SECUREPLATFORM_SET_KEK,
 				       HPWMI_SECUREPLATFORM, (void *)buf, count, 0);
+
 	return ret ? -EINVAL : count;
 }
 
@@ -918,6 +925,106 @@ static const struct attribute_group spm_group = {
 	.attrs = spm_attrs,
 };
 
+/* Sure Start functions */
+
+#define LOG_MAX_ENTRIES	254
+#define LOG_ENTRY_SIZE	16
+
+/*
+ * sure_start_audit_log_entry_count_show - Reports the number of
+ *				existing audit log entries available
+ *				to be read
+ *
+ * @kobj:  Pointer to a kernel object of things that show up as directory
+ *	   in the sysfs filesystem.
+ * @attr:  Pointer to list of attributes for the operation
+ * @buf:   Pointer to buffer
+ *
+ * Returns number of existing audit log entries available to be read,
+ *         audit log entry size, and maximum number of entries
+ *         supported. Otherwise, an HP WMI query specific error code
+ *         (which is negative)
+ *
+ *         [No of entries],[log entry size],[Max number of entries supported]
+ */
+static ssize_t sure_start_audit_log_entry_count_show(struct kobject *kobj,
+						     struct kobj_attribute *attr, char *buf)
+{
+	int ret;
+	u32 count = 0;
+
+	ret = hp_wmi_perform_query(HPWMI_SURESTART_GET_LOG_COUNT, HPWMI_SURESTART,
+				   &count, 0, sizeof(count));
+	if (ret < 0)
+		return ret;
+
+	return snprintf(buf, PAGE_SIZE, "%d,%d,%d\n", count, LOG_ENTRY_SIZE, LOG_MAX_ENTRIES);
+}
+
+/*
+ * sure_start_audit_log_entries_show() - Return all entries found in log file
+ *
+ * @kobj:  Pointer to a kernel object of things that show up as
+ *	   directory in the sysfs filesystem.
+ * @attr:  Pointer to list of attributes for the operation
+ * @buf:   Pointer to buffer
+ *
+ * Returns number of bytes needed to read all audit logs entries to be read.
+ *         Otherwise, an HP WMI query specific error code (which is negative)
+ *	   -EFAULT if the audit logs size exceeds 4KB
+ *
+ */
+static ssize_t sure_start_audit_log_entries_show(struct kobject *kobj,
+						 struct kobj_attribute *attr, char *buf)
+{
+	int ret;
+	int i;
+	u32 count = 0;
+
+	// Get the number of event logs
+	ret = hp_wmi_perform_query(HPWMI_SURESTART_GET_LOG_COUNT, HPWMI_SURESTART,
+				   &count, 1, 4);
+
+	/*
+	 * The show() api will not work if the audit logs ever go
+	 *  beyond 4KB
+	 */
+	if (count * LOG_ENTRY_SIZE > PAGE_SIZE)
+		return -EFAULT;
+
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * We are guaranteed the buffer is 4KB so today all the event
+	 * logs will fit
+	 */
+	for (i = 0; ((i < count) & (ret >= 0)); i++) {
+		*buf = (i + 1);
+		ret = hp_wmi_perform_query(HPWMI_SURESTART_GET_LOG,
+					   HPWMI_SURESTART,
+					   buf, 1, 128);
+		if (ret >= 0)
+			buf += LOG_ENTRY_SIZE;
+	}
+
+	return (count * LOG_ENTRY_SIZE);
+}
+
+HPWMI_ATTR_RO(sure_start, audit_log_entry_count);
+HPWMI_ATTR_RO(sure_start, audit_log_entries);
+
+static struct attribute *sure_start_attrs[] = {
+	&sure_start_audit_log_entry_count.attr,
+	&sure_start_audit_log_entries.attr,
+	NULL,
+};
+
+static const struct attribute_group sure_start_group = {
+	.name = "sure_start",
+	.attrs = sure_start_attrs,
+};
+
 static DEVICE_ATTR_RO(display);
 static DEVICE_ATTR_RO(hddtemp);
 static DEVICE_ATTR_RW(als);
@@ -942,6 +1049,7 @@ static const struct attribute_group hp_wmi_group = {
 static const struct attribute_group *hp_wmi_groups[] = {
 	&hp_wmi_group,
 	&spm_group,
+	&sure_start_group,
 	NULL,
 };
 
-- 
2.25.1

