Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0640C6FD19
	for <platform-driver-x86@archiver.kernel.org>; Mon, 13 Mar 2023 18:47:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229540AbjCMSrY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 13 Mar 2023 14:47:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231484AbjCMSrS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Mar 2023 14:47:18 -0400
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B25A28482F
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Mar 2023 11:46:46 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 595B05C0120;
        Mon, 13 Mar 2023 14:45:54 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Mon, 13 Mar 2023 14:45:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
        :cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1678733154; x=
        1678819554; bh=D1rgGmXWlY32Bp9HU49vIgmrx/+NEjxC9B42YEb20qM=; b=I
        Fx0vpf3eMnhD5HgwnmsRpdkGVGSYeeq6NG9L0xPfliwsjw6dN3f5FxjJ3fRp9tjl
        QtVMH7SyV0D6rURCANYMTJJBm2a7cGf8vOGc/7rSzGo1MSVnhqW8isCrNAplxDmY
        XMr9aM/6Z/2PPm51Lfca+gXjlOqpSjPudc5gMkEMenylvkbJAAt9UqdFvH7fGct/
        YQ/0UhmS93ADo8ZzGAGeO0FOgwUf8mBXoNzyp4Vw/azLXkmLfid//DG6ir5zY/tS
        AbxRB/XC0j/jdTtxz/oxXzM6n0reU80/aD/p/kPL0aetftf90xjDKMcK0dAM0k1N
        VQwueJO4tTZRRMg/woyLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1678733154; x=
        1678819554; bh=D1rgGmXWlY32Bp9HU49vIgmrx/+NEjxC9B42YEb20qM=; b=C
        OOiZcdqAAkrS9OmvDeDqSBdJjXaQR9SYib8pLtWcUJjNckEzidlsracIViGBdW4I
        270XHIKjq/Mgn6ufHpulCprLa6kQjgW43SAeroIW0Q5AA+0wvLf1EAl5WN+y0ewS
        epA7Jj6TrsefBKs5/AbNUkrooGE8JMnP6xf9Y33uCMWd9/lgYAeT5gQsuvsS57K5
        CT6+KhoK3cOjrAGseZ0bPIsGZOdbbW/W/JAPpp3bcK/mLFaurglDZJvJgATvKu4M
        bmTCo3R6t2zlr5TjA+HxbHTK43GS3D94ilPtg6cQQma/7J3PVsGVWrLnDKiDKcTP
        /l6WTEhUcy88EZ/immpjw==
X-ME-Sender: <xms:Ym8PZGWA72ezrUTNDog4RuRzy6tBpflBs19lUPqGemxJsyZeLC7DEA>
    <xme:Ym8PZCmFZqmStCi-207sSBBIZ7N3HkjGBXJteCw4LR7l5solj4Qb7cjYxsbZrIqox
    47DnsOJqdkqCJRFkoE>
X-ME-Received: <xmr:Ym8PZKbgdYOeEcbSzUjJ7fnaC8PX6G810lCXXF2DoW_MY8tsd75FJV0VCi--sbyqrSzuVhBqvHUeZV3h7TRo3HSj-sOvBA2FsUIzlYqYSnuVNUlUx6SU4CjFhjKscK8frEG9ScTVNmxX>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddvgedgudduhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecuogetfedtuddqtdduucdludehmdenucfjughrpe
    fhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforghrkhcurfgvrghr
    shhonhcuoehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtggrqeenucggtf
    frrghtthgvrhhnpeevtdelgfeggfejtedtvdfgkefhuefguedtkeeffeduueduvdeiuedt
    leejvdfhvdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhhpvggrrhhsohhnqdhlvghnohhv
    ohesshhquhgvsggsrdgtrg
X-ME-Proxy: <xmx:Ym8PZNU28TKYaaPyqjD6X5o3BUB2wsmuG8cRxRaKG_oImSlS1Q5o1w>
    <xmx:Ym8PZAl7l-Y6vSQ-Iws3q7J9_gszppYS5nKMTYYTEyhNYok-vrO3oA>
    <xmx:Ym8PZCcVPAJDRb0YiBnuFUN9Ij7M6pufSFcUa6P3TZnbAthYop53hw>
    <xmx:Ym8PZKhYLchLYBGr0cI0Rh4KAd79Y8o4aY1Ugj5Qwz-GS4WAe_61vw>
Feedback-ID: ibe194615:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Mar 2023 14:45:53 -0400 (EDT)
From:   Mark Pearson <mpearson-lenovo@squebb.ca>
To:     mpearson-lenovo@squebb.ca
Cc:     hdegoede@redhat.com, markgross@kernel.org, markpearson@lenovo.com,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 1/2] platform/x86: think-lmi: add missing type attribute
Date:   Mon, 13 Mar 2023 14:45:40 -0400
Message-Id: <20230313184541.193733-1-mpearson-lenovo@squebb.ca>
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

