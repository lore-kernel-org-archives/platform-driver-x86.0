Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF607C76196
	for <platform-driver-x86@archiver.kernel.org>; Fri, 17 Mar 2023 15:47:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231286AbjCQPrB (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 17 Mar 2023 11:47:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230031AbjCQPrA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 17 Mar 2023 11:47:00 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2C85BDD00
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Mar 2023 08:46:43 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 85B4B320091F;
        Fri, 17 Mar 2023 11:46:42 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Fri, 17 Mar 2023 11:46:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
        :cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1679068002; x=
        1679154402; bh=y6PWYXpuekZgpPtcJ15isJkzl47+IeMknWrLd+HCfWk=; b=v
        YWJTaFSkYPOQfzKJLbx5HWTIA1HSqIyu4L5VW9e5sv4GHmb2f+CsZ0bjhWzTjyKa
        Yf4oHnhD3YPliA/ASx/j+kc6ATQIFD/V5NwP7ald4J+cBBneppCAd2p5cBoZdTJs
        abdrbcYe4D4J16zih9p3P3CyumGqoytdHY1G1Kp6asZJAvvgTGj3uYGl757EvO4e
        KIQ7n/+MqrfxJKhdarN6PT+jyRYe6UBj7berHDgH4S0GBWUrSeYqGG9pmSV8QQ7R
        cAPaZeIViZ8vRGzolsWcvrJEAPZXriUGSzdWcv8oTlc0U9MY8sVoDC2o76xUTxIg
        kTUrrAklCMqOCRgwp60WA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1679068002; x=
        1679154402; bh=y6PWYXpuekZgpPtcJ15isJkzl47+IeMknWrLd+HCfWk=; b=S
        DJuKduxX0142TbxZtO+Sz2JYYR1g8JzPuL3s4PS81T8wa/2ICwevDQ1EL0A4xa/1
        i/s8r+oKAM+KBULvOolNlTw5Y9XiQJDc5h3zMy0N2rym660YLCW820keAIAG/7Qg
        rsgrEEeWmF5ary2TMlRtWl3Bf8kCVeSjRBZbCgeF/UoLqcxo0/RExiOOJpbJP1p3
        LFv2lRSDIdpfctGGK/tgdIn4nhCiaLCIG0jc1tq9BHXFpkqjR73N0O0Y/Efqga30
        ETH0pAOCg/wobn93JWx5rwPZaWGZlWesGApRVUnc2NAfSiNxnQ3M6Jzx1qSYFDNp
        mVlZVKRKB8CezVVUbXvnw==
X-ME-Sender: <xms:YYsUZNm2r90LtCKk74P8GL3pOJXdDdbVr-I9-2gLIW369jxt-_MD_g>
    <xme:YYsUZI3sGUj7M-q67j54b3dUlGgEyeffsVgjx10NToRDw_M2XN9C_lEhenrhNafo1
    QI7bg_Yti7wVJdbp6A>
X-ME-Received: <xmr:YYsUZDq-7EwARte_WNI9NOo-0D8eMrJmGv6iKo6jybNXZF_gj8GUWm_KE0VnS_9B3yd3Z7M6JUoVp4Pycvi2cfyt0_vOnsUFYKzNBa4dDfIOiG1a7Sb_aikhgbu3lMwlw-958DEmMK_j>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdefvddgjeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucgoteeftdduqddtudculdduhedmnecujfgurhephf
    fvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrrhhkucfrvggrrhhs
    ohhnuceomhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrgeqnecuggftrf
    grthhtvghrnhepfedtvdejfeelffevhffgjeejheduteetieeguefgkefhhfegjeduueet
    hefgvdffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrg
X-ME-Proxy: <xmx:YYsUZNmGEGJ5j33ZwAzeAQ0CO9DNT6_Ae8BDztbuFx3mDIXsWcOXZQ>
    <xmx:YYsUZL0kgFT_HFLA4FoyDLCZiqQezcbpVhRYZ86cipSUaLJW8-lTJA>
    <xmx:YYsUZMsOtGCbX9vNvqpV1rJG6WvydeiOm5lEFj5TBtWt1Y5nWy5czw>
    <xmx:YosUZMxiZWqW5lK-BhsC8P-tsFBiPBg5Blhl-kZNbyy5BIgCInGhpA>
Feedback-ID: ibe194615:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Mar 2023 11:46:41 -0400 (EDT)
From:   Mark Pearson <mpearson-lenovo@squebb.ca>
To:     mpearson-lenovo@squebb.ca
Cc:     hdegoede@redhat.com, markgross@kernel.org, markpearson@lenovo.com,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH v3 3/3] platform/x86: think-lmi: use correct possible_values delimters
Date:   Fri, 17 Mar 2023 11:46:35 -0400
Message-Id: <20230317154635.39692-3-mpearson-lenovo@squebb.ca>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230317154635.39692-1-mpearson-lenovo@squebb.ca>
References: <mpearson-lenovo@squebb.ca>
 <20230317154635.39692-1-mpearson-lenovo@squebb.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

firmware-attributes class requires that possible values are delimited
using ';' but the Lenovo firmware uses ',' instead.
Parse string and replace where appropriate

Thanks to Thomas W for pointing this out.

Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
---
 Changes in V3: New patch added to the series. No V1 & V2.

 drivers/platform/x86/think-lmi.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
index d89a1c9bdbf1..204f1060a533 100644
--- a/drivers/platform/x86/think-lmi.c
+++ b/drivers/platform/x86/think-lmi.c
@@ -1040,7 +1040,7 @@ static ssize_t type_show(struct kobject *kobj, struct kobj_attribute *attr,
 
 	if (setting->possible_values) {
 		/* Figure out what setting type is as BIOS does not return this */
-		if (strchr(setting->possible_values, ','))
+		if (strchr(setting->possible_values, ';'))
 			return sysfs_emit(buf, "enumeration\n");
 	}
 	/* Anything else is going to be a string */
@@ -1471,6 +1471,17 @@ static int tlmi_analyze(void)
 				}
 			}
 		}
+		/*
+		 * firmware-attributes requires that possible_values are separated by ';' but
+		 * Lenovo FW uses ','. Replace appropriately.
+		 */
+		if (setting->possible_values) {
+			char *tmp = setting->possible_values;
+
+			while ((tmp = strchr(tmp, ',')) != NULL)
+				*tmp++ = ';';
+		}
+
 		kobject_init(&setting->kobj, &tlmi_attr_setting_ktype);
 		tlmi_priv.setting[i] = setting;
 		kfree(item);
-- 
2.39.2

