Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE5FDC74A4B
	for <platform-driver-x86@archiver.kernel.org>; Mon, 13 Mar 2023 18:47:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229792AbjCMSr0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 13 Mar 2023 14:47:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231486AbjCMSrT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Mar 2023 14:47:19 -0400
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AA3186148
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Mar 2023 11:46:47 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id D00BA5C0132;
        Mon, 13 Mar 2023 14:45:57 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Mon, 13 Mar 2023 14:45:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
        :cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1678733157; x=
        1678819557; bh=TVaLzBYLTEA/2WzJl1c9xbIUn9yQ2wzcjQmgIsMNKZA=; b=o
        PNsMaCglPBFDolo26RzSh5/uuelBIiW2vQ8w9fWfQHqfGeV4SsNSvkreFO+pCnRS
        /0zWqniQ2tq2TKz1fW39B72LIJIm9tFWl2KBx2IkctGi4Hxdz5orXTTg0BCGS9LR
        XzbL1n21y3w10nq8ni/n8ppv5j9dWU7QeXDw9rF7bSGsRNkQGNeNGrP6IHrHipKO
        /WRPtcLYdUVcVadskVe6pGnXc9cn35jnqkELm9J+rUFHQKtG2QWeiZC5w5USSCtl
        jyMMuj6Rc0LqqHd2OeyMr6oCTPLg4ZazNXXv7Shw8U6R2wjYTtpb5rteMStnR/z1
        hvkXThId+4dvPiL8X97CA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1678733157; x=
        1678819557; bh=TVaLzBYLTEA/2WzJl1c9xbIUn9yQ2wzcjQmgIsMNKZA=; b=I
        HwW7V9LT30710IR5hBFF2N1wu8GTXfNqDgK4wHSm5fhZ5/c5bnyvoxXKRPA/IFkv
        qcKClqn4HZAySFbvzAlfb8Bek6JDxPEJ65Zr7IiXsE1ruPdKwHjSN59ppWMGQiVH
        b9bvozbpHnDbuynJv2Uk/8FoyuAbL4Bg8nmBClo+bcEMalxzT9u20AqjVqttRN0F
        RFbWkkYWEUbW3AW7shylv3M1yPdtEv+sGEYhnlEAHZugM66s+mAPoDUzqZs6OTaf
        I+pSJVqM8Xj5hKab75EP1Nfp1Q6K6YWfZwhBFlv1KzC1v3H2HAiMv13wqxcdQ2Qi
        rJrU5DFygDBtFLqN/vQMA==
X-ME-Sender: <xms:ZW8PZPEvxKsB7iaBqst0zD10ajfIbKST4vY0JW83Pm1IUDAJw3Wbiw>
    <xme:ZW8PZMULvd2YA2MpVqVA7cQDrr0a3sOmOmwiMWJiFxFglZpfND7KZFRLLpppGhCpk
    IQzEk5_Tm1PCQzT1KA>
X-ME-Received: <xmr:ZW8PZBJZDemFG8MA44nuZFieeh8W3hPA550fVmsp-j8zWAm1ES2SeaDSEOma6xR-b-q_IPhCAnW3edYGKHdTSFu4xOdKmo-t2hdX_SxWH1qaEGq27SU1nJ50_Q5a1K_xa_0MlMWGt_Cx>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddvgedgudduhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecuogetfedtuddqtdduucdludehmdenucfjughrpe
    fhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforghrkhcurfgvrghr
    shhonhcuoehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtggrqeenucggtf
    frrghtthgvrhhnpeeftddvjeefleffvefhgfejjeehudetteeigeeugfekhffhgeejudeu
    teehgfdvffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtggr
X-ME-Proxy: <xmx:ZW8PZNGEMDZGp564K_Bpyj7wuUCw7ErWCct2h3kXd2N4X3byAVaXhg>
    <xmx:ZW8PZFUX7JTowVjcD6xJf2oHcCZEQMqFDor62oq3wDvrWHSVI3ffMw>
    <xmx:ZW8PZIPpvj6ECCw_HHsS4z4fnV0DaRWi2IRHr2lCasqTgw1z28k7-g>
    <xmx:ZW8PZITcO6xysk1MAzwBi82K0bpxM4TfoBsdNSTCbBx3OMulzTdGqg>
Feedback-ID: ibe194615:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Mar 2023 14:45:57 -0400 (EDT)
From:   Mark Pearson <mpearson-lenovo@squebb.ca>
To:     mpearson-lenovo@squebb.ca
Cc:     hdegoede@redhat.com, markgross@kernel.org, markpearson@lenovo.com,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 2/2] platform/x86: think-lmi: Add possible_values for ThinkStation
Date:   Mon, 13 Mar 2023 14:45:41 -0400
Message-Id: <20230313184541.193733-2-mpearson-lenovo@squebb.ca>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230313184541.193733-1-mpearson-lenovo@squebb.ca>
References: <mpearson-lenovo@squebb.ca>
 <20230313184541.193733-1-mpearson-lenovo@squebb.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

ThinkStation platforms don't support the API to return possible_values
but instead embed it in the settings string.

Try and extract this information and set the possible_values attribute
appropriately.

Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
---
Changes in V2:
 - Move no value for possible_values handling into show function
 - use kstrndup for allocating string

 drivers/platform/x86/think-lmi.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
index 5fa5451c4802..7dd8f72176f5 100644
--- a/drivers/platform/x86/think-lmi.c
+++ b/drivers/platform/x86/think-lmi.c
@@ -941,10 +941,9 @@ static ssize_t possible_values_show(struct kobject *kobj, struct kobj_attribute
 {
 	struct tlmi_attr_setting *setting = to_tlmi_attr_setting(kobj);
 
-	if (!tlmi_priv.can_get_bios_selections)
-		return -EOPNOTSUPP;
-
-	return sysfs_emit(buf, "%s\n", setting->possible_values);
+	if (setting->possible_values)
+		return sysfs_emit(buf, "%s\n", setting->possible_values);
+	return sysfs_emit(buf, "not available\n");
 }
 
 static ssize_t type_show(struct kobject *kobj, struct kobj_attribute *attr,
@@ -1440,6 +1439,25 @@ static int tlmi_analyze(void)
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

