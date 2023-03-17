Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D212C74A5B
	for <platform-driver-x86@archiver.kernel.org>; Fri, 17 Mar 2023 15:46:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229813AbjCQPq4 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 17 Mar 2023 11:46:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231286AbjCQPqz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 17 Mar 2023 11:46:55 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6ABF1BCFE7
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Mar 2023 08:46:40 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.west.internal (Postfix) with ESMTP id 8ECD03200920;
        Fri, 17 Mar 2023 11:46:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Fri, 17 Mar 2023 11:46:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
        :cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1679067999; x=
        1679154399; bh=oJTqiA1lEnsX4JQ/GzZ+6aUGQXMpeKwlUqLPE3H2zHE=; b=P
        4noveNzRLhYFAA5ZfCjszSSaHTA2okyb2+xjRXQWYVPYyRs6Ta4JP29N8OQTVRuh
        vOnTMDupiDcVtIS+g7AQsM7BobpTljPfc6VPbjR3VwE6IldlNI4RcTsfgbtJeEUX
        LKWxxK7Qrwl0CMGoeFam23LFr0YbBJwD547v4ypGtG7PBai7AXL9NXcrXvYTs76r
        nfiPEjR332PZkDsvtNCy95h6qVowTMEwvhLAeOmqK9jjDj0jOu2Ytww9JjKYJ+pt
        3VPHaNIBqeez24wqIGtNs/S6v+IL7dGW6FO9WoDJpf/2gSmf3FyIbamFAjXIcXZy
        J7iQ8v3/g95B4dGBUTp6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1679067999; x=
        1679154399; bh=oJTqiA1lEnsX4JQ/GzZ+6aUGQXMpeKwlUqLPE3H2zHE=; b=k
        jdPDF11a0od6aeEUindR1yCk2NzZtQviY2rP82pAV4402of0RfgMtBV4ka0ciiz7
        PKsTgkUrCTOY+VkiT875AC2gijOvVvZOf/ms5IQYOkpFmlz47magDyuY/t09PN3F
        tsBOn5wJbGVjXsnDsyBfMp/N1Qd1Zkk3y+kzxVmIx2QkIac0/Je3EUFdu6Sryxsj
        ZH/OfSPJNlcYCGEpHPwtvsdknWI/dCp3alXOyK28znyS875/lzGgvLg5z8viqz+E
        9PFLDfunAJVYe+vRI3C1bZB3nUFgQg42LN/jcHJgElFckgwBK+doeDrqDTU3Qkat
        4hPHgAjvKPUOchogVwjbg==
X-ME-Sender: <xms:X4sUZCIL9q5lBF4omsiXHYBgrhG6WBHx5ADnjbV-mt6iFFengV1g2Q>
    <xme:X4sUZKJlEZRkmVuCifqhZQ06s9speYsDha9Gr_uQbJl_bO8IQcLs8sl_XpaWgM4ib
    9ZlqP23hVe-gNloNWw>
X-ME-Received: <xmr:X4sUZCsqcNGx8S0olQObQgNeG7q0Bp-61ZQ3I41V9atM_JIassgFuI68S9oaQVHtrpFSiQujLmDVS0OOkg5jzkHNFjHvTFh_JrUpBK11ZCn88D2Ne2ys_gmJHVuWyPGRAqWbxLuVfDh9>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdefvddgjeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucgoteeftdduqddtudculdduhedmnecujfgurhephf
    fvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrrhhkucfrvggrrhhs
    ohhnuceomhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrgeqnecuggftrf
    grthhtvghrnhepvedtlefggefgjeettddvgfekhfeugfeutdekfeefudeuuddvieeutdel
    jedvhfdvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmphgvrghrshhonhdqlhgvnhhovhho
    sehsqhhuvggssgdrtggr
X-ME-Proxy: <xmx:X4sUZHYCLGGmySyePB2NTodPbCX13zZWQRQvTP4n94DFkw3IWTOTvw>
    <xmx:X4sUZJbU_r4821zeSUMZolOWYmXQke8OGohop9YuD45xXdgWeGgCUw>
    <xmx:X4sUZDDkrdRkVw5DGESRP1ENyVGHbfF7S9TvEuyLXoCziAySmdUICA>
    <xmx:X4sUZNGfvBvEEyZeFaJAExpRVMS349e_G7xsmP-SLphVjTR76wLvPg>
Feedback-ID: ibe194615:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Mar 2023 11:46:38 -0400 (EDT)
From:   Mark Pearson <mpearson-lenovo@squebb.ca>
To:     mpearson-lenovo@squebb.ca
Cc:     hdegoede@redhat.com, markgross@kernel.org, markpearson@lenovo.com,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH v3 1/3] platform/x86: think-lmi: add missing type attribute
Date:   Fri, 17 Mar 2023 11:46:33 -0400
Message-Id: <20230317154635.39692-1-mpearson-lenovo@squebb.ca>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <mpearson-lenovo@squebb.ca>
References: <mpearson-lenovo@squebb.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This driver was missing the mandatory type attribute...oops.

Add it in along with logic to determine whether the attribute is an
enumeration type or a string by parsing the possible_values attribute.

Upstream bug https://bugzilla.kernel.org/show_bug.cgi?id=216460

Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
---
Changes in v3:
 - Rebased on latest pdx86, review_hans branch
Changes in v2: 
 - Simplify the code and move type determination into show function
 - Don't use Fixes with URL in commit info

 drivers/platform/x86/think-lmi.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
index 86b33b74519b..5fa5451c4802 100644
--- a/drivers/platform/x86/think-lmi.c
+++ b/drivers/platform/x86/think-lmi.c
@@ -947,6 +947,20 @@ static ssize_t possible_values_show(struct kobject *kobj, struct kobj_attribute
 	return sysfs_emit(buf, "%s\n", setting->possible_values);
 }
 
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
+
 static ssize_t current_value_store(struct kobject *kobj,
 		struct kobj_attribute *attr,
 		const char *buf, size_t count)
@@ -1036,10 +1050,13 @@ static struct kobj_attribute attr_possible_values = __ATTR_RO(possible_values);
 
 static struct kobj_attribute attr_current_val = __ATTR_RW_MODE(current_value, 0600);
 
+static struct kobj_attribute attr_type = __ATTR_RO(type);
+
 static struct attribute *tlmi_attrs[] = {
 	&attr_displ_name.attr,
 	&attr_current_val.attr,
 	&attr_possible_values.attr,
+	&attr_type.attr,
 	NULL
 };
 
-- 
2.39.2

