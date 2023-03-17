Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CE65C74A5B
	for <platform-driver-x86@archiver.kernel.org>; Fri, 17 Mar 2023 15:47:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230337AbjCQPrA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 17 Mar 2023 11:47:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231286AbjCQPq7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 17 Mar 2023 11:46:59 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19E3DB863A
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Mar 2023 08:46:42 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 226613200925;
        Fri, 17 Mar 2023 11:46:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Fri, 17 Mar 2023 11:46:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
        :cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1679068000; x=
        1679154400; bh=aHEYHVPzZbIieasq8y0o5PCoM67EEVNfROQvWKJOpVM=; b=A
        RzF0+Yev7GYT17xfG4WIxa5esJ25uVSGwTuZVQxHXupX8Zx96RAMza7JoTdt6fRP
        3Z0B3L/dNrJI7mxRwoqyQAxN2XxILq5wV5fGyD0+KmQW1r54vngtzz/fed6PtcDF
        bP518wtEihl1xQS6bnWzCTELi+MMzTSXNfAYpSNsyaWganGSODlsZVi7QWP12UES
        TLMBmUfk4TTX0kdXAkWFJmbIRw66GpbhqfKqV1pk4qGAanGSZU/Uy6J+VGrhw/DO
        M2RXIQNOw0g8hjj9EoGFTzGWdqLKjQkO4g4P7d38FNXfncFiM/TQeKMgxz/4pPFq
        EoUFzn4xlopdrY+cZJ5rA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1679068000; x=
        1679154400; bh=aHEYHVPzZbIieasq8y0o5PCoM67EEVNfROQvWKJOpVM=; b=M
        6n0L94JEK5qRs9Tqw1w2uBRVkv0L/js7K+omSRBYvnFVr8rPZviv1C6RCAlmftIN
        yG8V32TMYXBrH1psMPKmvTPX6DvW5dMnDMx9zfujhUQHMtK0ezwW93tk+8FwIHpz
        JQCU1zvlQxzKLKX7RDMEBJXET8LJM4bzT1ZZMg0BRmMLjB93CuLD2fx/O9KTHdgc
        c1dzUfMCFh9Mb5EO2q3v4D5e8tdIsQm/i1m6RtR06czHH68VhcUG27ppAwFILhdE
        k1nX7/Da/JiiYeN+HoBsPyN7lF+AFdLjJtBPQi/0dbE/+6gznDg+5d3CN1Wl7xJC
        up0JzBYnN9Wo8TvUVyKUA==
X-ME-Sender: <xms:YIsUZGae8F-F0pRzguLO3oh1G5nYcFoyG0BsnRDNtZxrkdyoYdDPCg>
    <xme:YIsUZJYxwclLSYVMSSWCvToSP31YBdcPiVnOFQ65axxWyZQ2qTCH5QBHEzOPbSMEj
    6SKa_1zzvZWybCVtSc>
X-ME-Received: <xmr:YIsUZA85dzu9OF9XsrRv7ZC-sNmIaehp9yA9IoYNj-N8yngeRxivUp4XzAGsWXcdmwc-y5QMFZOcrW0VINjlObraYWAQfOMZh_4lKKWkRr6KVCUIsIukIG0-ym4qb89RRmrbK167pIGM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdefvddgjeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucgoteeftdduqddtudculdduhedmnecujfgurhephf
    fvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrrhhkucfrvggrrhhs
    ohhnuceomhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrgeqnecuggftrf
    grthhtvghrnhepfedtvdejfeelffevhffgjeejheduteetieeguefgkefhhfegjeduueet
    hefgvdffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrg
X-ME-Proxy: <xmx:YIsUZIoxvk_hMm9AfZ0LpGEM-KE6zNjZ_BMZrQLsdxUQXRxkhzHe_A>
    <xmx:YIsUZBrY-Gc3QxFpy8Y3saqgMxV8uu1dmaZAhwuqyhRNkWFcksxzzw>
    <xmx:YIsUZGT7-RsARoUpcvtpV6vVTS8GNoLfwYGnx8Hg6aesB-ZbzxGJOg>
    <xmx:YIsUZIXpeDWsj3Grv2404X4Y7Q8e692M0b3e4R4HGvseYpUiID8gGA>
Feedback-ID: ibe194615:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Mar 2023 11:46:40 -0400 (EDT)
From:   Mark Pearson <mpearson-lenovo@squebb.ca>
To:     mpearson-lenovo@squebb.ca
Cc:     hdegoede@redhat.com, markgross@kernel.org, markpearson@lenovo.com,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH v3 2/3] platform/x86: think-lmi: Add possible_values for ThinkStation
Date:   Fri, 17 Mar 2023 11:46:34 -0400
Message-Id: <20230317154635.39692-2-mpearson-lenovo@squebb.ca>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230317154635.39692-1-mpearson-lenovo@squebb.ca>
References: <mpearson-lenovo@squebb.ca>
 <20230317154635.39692-1-mpearson-lenovo@squebb.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

ThinkStation platforms don't support the API to return possible_values
but instead embed it in the settings string.

Try and extract this information and set the possible_values attribute
appropriately.

If there aren't any values possible then don't display possible_values.

Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
---
Changes in V3:
 - Use is_visible attribute to determine if possible_values should be
   available
 - Code got refactored a bit to make compilation cleaner
Changes in V2:
 - Move no value for possible_values handling into show function
 - use kstrndup for allocating string

 drivers/platform/x86/think-lmi.c | 82 ++++++++++++++++++++++----------
 1 file changed, 56 insertions(+), 26 deletions(-)

diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
index 5fa5451c4802..d89a1c9bdbf1 100644
--- a/drivers/platform/x86/think-lmi.c
+++ b/drivers/platform/x86/think-lmi.c
@@ -917,6 +917,8 @@ static ssize_t display_name_show(struct kobject *kobj, struct kobj_attribute *at
 	return sysfs_emit(buf, "%s\n", setting->display_name);
 }
 
+static struct kobj_attribute attr_displ_name = __ATTR_RO(display_name);
+
 static ssize_t current_value_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
 {
 	struct tlmi_attr_setting *setting = to_tlmi_attr_setting(kobj);
@@ -937,30 +939,6 @@ static ssize_t current_value_show(struct kobject *kobj, struct kobj_attribute *a
 	return ret;
 }
 
-static ssize_t possible_values_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
-{
-	struct tlmi_attr_setting *setting = to_tlmi_attr_setting(kobj);
-
-	if (!tlmi_priv.can_get_bios_selections)
-		return -EOPNOTSUPP;
-
-	return sysfs_emit(buf, "%s\n", setting->possible_values);
-}
-
-static ssize_t type_show(struct kobject *kobj, struct kobj_attribute *attr,
-		char *buf)
-{
-	struct tlmi_attr_setting *setting = to_tlmi_attr_setting(kobj);
-
-	if (setting->possible_values) {
-		/* Figure out what setting type is as BIOS does not return this */
-		if (strchr(setting->possible_values, ','))
-			return sysfs_emit(buf, "enumeration\n");
-	}
-	/* Anything else is going to be a string */
-	return sysfs_emit(buf, "string\n");
-}
-
 static ssize_t current_value_store(struct kobject *kobj,
 		struct kobj_attribute *attr,
 		const char *buf, size_t count)
@@ -1044,14 +1022,46 @@ static ssize_t current_value_store(struct kobject *kobj,
 	return ret ?: count;
 }
 
-static struct kobj_attribute attr_displ_name = __ATTR_RO(display_name);
+static struct kobj_attribute attr_current_val = __ATTR_RW_MODE(current_value, 0600);
+
+static ssize_t possible_values_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
+{
+	struct tlmi_attr_setting *setting = to_tlmi_attr_setting(kobj);
+
+	return sysfs_emit(buf, "%s\n", setting->possible_values);
+}
 
 static struct kobj_attribute attr_possible_values = __ATTR_RO(possible_values);
 
-static struct kobj_attribute attr_current_val = __ATTR_RW_MODE(current_value, 0600);
+static ssize_t type_show(struct kobject *kobj, struct kobj_attribute *attr,
+		char *buf)
+{
+	struct tlmi_attr_setting *setting = to_tlmi_attr_setting(kobj);
+
+	if (setting->possible_values) {
+		/* Figure out what setting type is as BIOS does not return this */
+		if (strchr(setting->possible_values, ','))
+			return sysfs_emit(buf, "enumeration\n");
+	}
+	/* Anything else is going to be a string */
+	return sysfs_emit(buf, "string\n");
+}
 
 static struct kobj_attribute attr_type = __ATTR_RO(type);
 
+static umode_t attr_is_visible(struct kobject *kobj,
+					     struct attribute *attr, int n)
+{
+	struct tlmi_attr_setting *setting = to_tlmi_attr_setting(kobj);
+
+	/* We don't want to display possible_values attributes if not available */
+	if (attr == (struct attribute *)&attr_possible_values)
+		if (!setting->possible_values)
+			return 0;
+
+	return attr->mode;
+}
+
 static struct attribute *tlmi_attrs[] = {
 	&attr_displ_name.attr,
 	&attr_current_val.attr,
@@ -1061,6 +1071,7 @@ static struct attribute *tlmi_attrs[] = {
 };
 
 static const struct attribute_group tlmi_attr_group = {
+	.is_visible = attr_is_visible,
 	.attrs = tlmi_attrs,
 };
 
@@ -1440,6 +1451,25 @@ static int tlmi_analyze(void)
 			if (ret || !setting->possible_values)
 				pr_info("Error retrieving possible values for %d : %s\n",
 						i, setting->display_name);
+		} else {
+			/*
+			 * Older Thinkstations don't support the bios_selections API.
+			 * Instead they store this as a [Optional:Option1,Option2] section of the
+			 * name string.
+			 * Try and pull that out if it's available.
+			 */
+			char *item, *optstart, *optend;
+
+			if (!tlmi_setting(setting->index, &item, LENOVO_BIOS_SETTING_GUID)) {
+				optstart = strstr(item, "[Optional:");
+				if (optstart) {
+					optstart += strlen("[Optional:");
+					optend = strstr(optstart, "]");
+					if (optend)
+						setting->possible_values =
+							kstrndup(optstart, optend - optstart, GFP_KERNEL);
+				}
+			}
 		}
 		kobject_init(&setting->kobj, &tlmi_attr_setting_ktype);
 		tlmi_priv.setting[i] = setting;
-- 
2.39.2

