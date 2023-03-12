Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCE4CC74A4B
	for <platform-driver-x86@archiver.kernel.org>; Sun, 12 Mar 2023 02:47:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229473AbjCLCrW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 11 Mar 2023 21:47:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjCLCrV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 11 Mar 2023 21:47:21 -0500
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92A89366A7
        for <platform-driver-x86@vger.kernel.org>; Sat, 11 Mar 2023 18:47:18 -0800 (PST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.west.internal (Postfix) with ESMTP id C6C8232002E2;
        Sat, 11 Mar 2023 21:47:14 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Sat, 11 Mar 2023 21:47:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
        :cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm2; t=1678589234; x=
        1678675634; bh=9lhBb6qoKhun9tL3D5R/TKRDZ8AAgMXm0KJP8mLgLDY=; b=Y
        XrvfYyUmKtM2rGt0j28xTg5ZT4wTknYnaG7JRZ7zf11mnHKHD9WwHN8xUzsbpgnx
        sPWPmxQdY661IPY/gyzaSAnq4RkHz68xr0645emlkCdt85EjSyWbSbQIOBhzVSCn
        6avK2FZbZIVgVXaECU24r8C14aG8Vqhrgk4HpG7z8XIMy003Li/YwS7E3Cat8c/J
        AudVBrGPCY131FoMLKNoGCX6oK/kOwAtO9wq0EzcRoMG7XcmArYYyGQtbfdCS6pi
        hT9k/vuAyxV3fRdT9YHCidW1SckX6PJt14Rf63+U+KjN/LEsjAYorhF9kzqr33uV
        3n4bXgatxROXkXq9HcG+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1678589234; x=
        1678675634; bh=9lhBb6qoKhun9tL3D5R/TKRDZ8AAgMXm0KJP8mLgLDY=; b=s
        LYpGvXdkIMVXeVU+XfInbGOZ3vgm0qV/W6oeafUelXMBjsXeyaqvF8EAg22WOAOd
        eaKCn/mo+Iw5LgaHU1IrogOmGYgM1JkL9mOBarv8jepeOyKL9w1C9VYajMAnjHYx
        1dAwJr8t/Lj+A0QfB+N31uhNXLPEjCB7l3s/xyk1CZNQ0GGkUR/mbShPy55k2KRG
        nMjOIBPRw1+U874OdW+kR8cq2D+nGpttlVAUFBSlgzdPKZugc2ZNeu0CoXkj+GtQ
        NdDGJvOhwbARBUE3OBkZqMjwE5hIZQpjoUl3sAV09BxG6keRfojr/MDQ7aich7gX
        Tf10hNlZrKCqkrWbzFI/A==
X-ME-Sender: <xms:Mj0NZAR0JyXPtUvOpm-OEKoR8KAv634lhO07twA_z6Rf4L50IJT8_g>
    <xme:Mj0NZNwZrvdy7OCGJGBhqEdpSW1COXH-8wlbjQkhwN6VSGHqbj2gmhLHOWO20rto1
    cRJUD5Mu_wTYOoMdTo>
X-ME-Received: <xmr:Mj0NZN0CjXbwXftXsPmJfZkCzvl-rfVtXkwnoSvTkgxFwbgUJZtg5HDDk8bjelTBD1_Vub_ZwHRZW-gK6wvaqdFoXAt-9eEtrMAg7eAM59TuX-5V0C7kiNMROKhmkVmWEmb6S1D3uQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddvuddghedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucgoteeftdduqddtudculdduhedmnecujfgurhephf
    fvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrrhhkucfrvggrrhhs
    ohhnuceomhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrgeqnecuggftrf
    grthhtvghrnhepvedtlefggefgjeettddvgfekhfeugfeutdekfeefudeuuddvieeutdel
    jedvhfdvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmphgvrghrshhonhdqlhgvnhhovhho
    sehsqhhuvggssgdrtggr
X-ME-Proxy: <xmx:Mj0NZEAyPLkQ0ydAB34UP-MT3RScqgu_9vkeoycqR8d4lZvlkmEYnQ>
    <xmx:Mj0NZJipCgMz4YwS9SykOAY32gOZQVkFEZIA1pr-XFKwPB99LnNqdQ>
    <xmx:Mj0NZApi74hoUwhLVH1CwOk0vKsN8p8oXDVbAKxkZ-LTuxw2LePyPA>
    <xmx:Mj0NZOs-2pvizUVnWaKRrHK9aO23KmlePaW368YmOVJwoTMtw_QcLg>
Feedback-ID: ibe194615:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 11 Mar 2023 21:47:13 -0500 (EST)
From:   Mark Pearson <mpearson-lenovo@squebb.ca>
To:     mpearson-lenovo@squebb.ca
Cc:     hdegoede@redhat.com, markgross@kernel.org, markpearson@lenovo.com,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 1/2] platform/x86: think-lmi: add missing type attribute
Date:   Sat, 11 Mar 2023 21:46:34 -0500
Message-Id: <20230312024635.518769-1-mpearson-lenovo@squebb.ca>
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

Some platforms (and some attributes) don't return possible_values so to
prevent trying to scan NULL strings mark these as "N/A".

Fixes: https://bugzilla.kernel.org/show_bug.cgi?id=216460
Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
---
 drivers/platform/x86/think-lmi.c | 26 +++++++++++++++++++++++---
 drivers/platform/x86/think-lmi.h |  6 ++++++
 2 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
index 86b33b74519b..495a5e045069 100644
--- a/drivers/platform/x86/think-lmi.c
+++ b/drivers/platform/x86/think-lmi.c
@@ -941,12 +941,18 @@ static ssize_t possible_values_show(struct kobject *kobj, struct kobj_attribute
 {
 	struct tlmi_attr_setting *setting = to_tlmi_attr_setting(kobj);
 
-	if (!tlmi_priv.can_get_bios_selections)
-		return -EOPNOTSUPP;
-
 	return sysfs_emit(buf, "%s\n", setting->possible_values);
 }
 
+static ssize_t type_show(struct kobject *kobj, struct kobj_attribute *attr,
+		char *buf)
+{
+	struct tlmi_attr_setting *setting = to_tlmi_attr_setting(kobj);
+
+	return sysfs_emit(buf, "%s\n",
+			setting->type == TLMI_ENUMERATION ? "enumeration" : "string");
+}
+
 static ssize_t current_value_store(struct kobject *kobj,
 		struct kobj_attribute *attr,
 		const char *buf, size_t count)
@@ -1036,10 +1042,13 @@ static struct kobj_attribute attr_possible_values = __ATTR_RO(possible_values);
 
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
 
@@ -1424,6 +1433,17 @@ static int tlmi_analyze(void)
 				pr_info("Error retrieving possible values for %d : %s\n",
 						i, setting->display_name);
 		}
+		/* If we don't have a possible value mark as N/A */
+		if (!setting->possible_values) {
+			setting->possible_values = kmalloc(strlen("N/A"), GFP_KERNEL);
+			sprintf(setting->possible_values, "N/A");
+		}
+		/* Figure out what setting type is as BIOS does not return this */
+		if (strchr(setting->possible_values, ','))
+			setting->type = TLMI_ENUMERATION;
+		else
+			setting->type = TLMI_STRING;
+
 		kobject_init(&setting->kobj, &tlmi_attr_setting_ktype);
 		tlmi_priv.setting[i] = setting;
 		kfree(item);
diff --git a/drivers/platform/x86/think-lmi.h b/drivers/platform/x86/think-lmi.h
index 4daba6151cd6..b76edcb9b1af 100644
--- a/drivers/platform/x86/think-lmi.h
+++ b/drivers/platform/x86/think-lmi.h
@@ -27,6 +27,11 @@ enum level_option {
 	TLMI_LEVEL_MASTER,
 };
 
+enum attr_type {
+	TLMI_ENUMERATION,
+	TLMI_STRING,
+};
+
 /* password configuration details */
 struct tlmi_pwdcfg_core {
 	uint32_t password_mode;
@@ -73,6 +78,7 @@ struct tlmi_attr_setting {
 	int index;
 	char display_name[TLMI_SETTINGS_MAXLEN];
 	char *possible_values;
+	enum attr_type type;
 };
 
 struct think_lmi {
-- 
2.39.1

