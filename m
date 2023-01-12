Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7528FC61DB3
	for <platform-driver-x86@archiver.kernel.org>; Thu, 12 Jan 2023 21:02:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240439AbjALVCK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 12 Jan 2023 16:02:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240502AbjALVAN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 12 Jan 2023 16:00:13 -0500
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9A249FD4
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Jan 2023 12:45:21 -0800 (PST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 585AD5C0126;
        Thu, 12 Jan 2023 15:45:19 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Thu, 12 Jan 2023 15:45:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm1; t=1673556319; x=1673642719; bh=pj
        n1W6K0BjFyb36RWaXrdfxBFdNrxOAKuHP5ZTBXTpY=; b=bkrDFX5Y9BlbkrEdyY
        cJgJ0rRytvYrQrLWGgr5dvZu5KmJz5F+XWP6YtSfIXkSzKy7NxBsCMTLzL/jBkZq
        ExUGdcETME2eaqS4CptFkKXor8wnER1mlkT7yLYk1qUZ9IIsGl1uuuB7V7Yaquq3
        dM8ILTnOf0vSkjEJ5indyl/BZNYk3YCNJDpL4QjgW93U5KHoZiimxK1LdoBgHEx6
        F+8mGdsl0k4/+/j7u+R6DetTvzHvnfIQzVNaPBaeQKF/NE11vedb5OWGFOz7MDtx
        BSWQUS3ZZTjaqsr90EqUd1Tj7J8dihhNXaelCASTfNBpsS/ctlUgw4LilicOUWQv
        dZqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1673556319; x=1673642719; bh=pjn1W6K0BjFyb
        36RWaXrdfxBFdNrxOAKuHP5ZTBXTpY=; b=AUwtq+yP3nh5Ele6KBsbuXkaVu/pO
        UQ7mZ+0/OwfjnnpZ8GCRwIkssIpBo/NsgCs5R31cTWtbktAlIoUqFhHE/uXo13hF
        fkFcx/Bpb6fvSFmoN4M8kZjhCkaaBuyocr4lMAMQqq/kixiGK8CJ55A5Nuxjgk1M
        66ZOk49N/XjmY7Jw8K9agy7+sy9d1Vo6/Dsc4g3UzuhAen5BDpYuEqauZsOiBx02
        Pry9ObnewomOPGy4gWonXcQX1tPC4cci0AJ7jqsTnEqVnLf6i3s59inE8NyDs+pi
        WTEavwKOmuxsZF5amBR0ySfTdiLS1m4mfHKF65RYy724gtUuDexiQO/Ug==
X-ME-Sender: <xms:X3HAY_jac18m39gQlo5Fz9EJAOt0rd3IeKaJkbQSuuSHdV0udllHKw>
    <xme:X3HAY8Anpe9gAkEZXo30MrVh--1rabXC0SM0B9vwDJNErhfNwfa75E0ydC_5JcQG_
    tU2thnkJaTvTYkcQYs>
X-ME-Received: <xmr:X3HAY_HEaIdWkKdSXqTrjFhEoU1Y5SkGne5YGG8OilPmeVsM0kaYXLLRR-NcGwKiNbM7EY3sze7G5f7ZukT9JS48pJvW0j2m-Bpi0UhtCCnJi-JarcLlr5BqzmrRs2qZ_SVoYhM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrleeigddugeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucgoteeftdduqddtudculdduhedmnecujfgurhephf
    fvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrrhhkucfrvggrrhhs
    ohhnuceomhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrgeqnecuggftrf
    grthhtvghrnhepfedtvdejfeelffevhffgjeejheduteetieeguefgkefhhfegjeduueet
    hefgvdffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrg
X-ME-Proxy: <xmx:X3HAY8TMm5mRIrmf5f7amv9nItkQcZOliaYspzEcnTBTJ6aP0Y7XYg>
    <xmx:X3HAY8wLQlrql7ha3vCNCKq7MS6NOtuH8vXUD_EWASZKxHgaCkHrYw>
    <xmx:X3HAYy7qrg2NKytsnpMRIWPotEjyAo3vZKcv55TWXnhiksjTy7e7uQ>
    <xmx:X3HAY48nTbdsCGNCSC9Iag3uBTT_0WC8jmS82Ub97Lyb82tqAjgIjw>
Feedback-ID: ibe194615:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 Jan 2023 15:45:18 -0500 (EST)
From:   Mark Pearson <mpearson-lenovo@squebb.ca>
To:     mpearson-lenovo@squebb.ca
Cc:     hdegoede@redhat.com, mario.limonciello@amd.com,
        markgross@kernel.org, platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: thinkpad_acpi: Remove AMT enablement
Date:   Thu, 12 Jan 2023 15:45:01 -0500
Message-Id: <20230112204501.487920-1-mpearson-lenovo@squebb.ca>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <mpearson-lenovo@squebb.ca>
References: <mpearson-lenovo@squebb.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Recently AMT mode was enabled (somewhat unexpectedly) on the Lenovo
Z13 platform. The FW is advertising it is available and the driver tries
to use it - unfortunately it reports the profile mode incorrectly.

Note, there is also some extra work needed to enable the dynamic aspect
of AMT support that I will be following up with; but more testing is
needed first. This patch just fixes things so the profiles are reported
correctly.

Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
---
 drivers/platform/x86/thinkpad_acpi.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 1195293b22fd..a95946800ae9 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -10311,9 +10311,11 @@ static DEFINE_MUTEX(dytc_mutex);
 static int dytc_capabilities;
 static bool dytc_mmc_get_available;
 
-static int convert_dytc_to_profile(int dytcmode, enum platform_profile_option *profile)
+static int convert_dytc_to_profile(int funcmode, int dytcmode,
+		enum platform_profile_option *profile)
 {
-	if (dytc_capabilities & BIT(DYTC_FC_MMC)) {
+	switch (funcmode) {
+	case DYTC_FUNCTION_MMC:
 		switch (dytcmode) {
 		case DYTC_MODE_MMC_LOWPOWER:
 			*profile = PLATFORM_PROFILE_LOW_POWER;
@@ -10329,8 +10331,7 @@ static int convert_dytc_to_profile(int dytcmode, enum platform_profile_option *p
 			return -EINVAL;
 		}
 		return 0;
-	}
-	if (dytc_capabilities & BIT(DYTC_FC_PSC)) {
+	case DYTC_FUNCTION_PSC:
 		switch (dytcmode) {
 		case DYTC_MODE_PSC_LOWPOWER:
 			*profile = PLATFORM_PROFILE_LOW_POWER;
@@ -10344,6 +10345,14 @@ static int convert_dytc_to_profile(int dytcmode, enum platform_profile_option *p
 		default: /* Unknown mode */
 			return -EINVAL;
 		}
+		return 0;
+	case DYTC_FUNCTION_AMT:
+		/* For now return balanced. It's the closest we have to 'auto' */
+		*profile =  PLATFORM_PROFILE_BALANCED;
+		return 0;
+	default:
+		/* Unknown function */
+		return -EOPNOTSUPP;
 	}
 	return 0;
 }
@@ -10492,6 +10501,7 @@ static int dytc_profile_set(struct platform_profile_handler *pprof,
 		err = dytc_command(DYTC_SET_COMMAND(DYTC_FUNCTION_PSC, perfmode, 1), &output);
 		if (err)
 			goto unlock;
+
 		/* system supports AMT, activate it when on balanced */
 		if (dytc_capabilities & BIT(DYTC_FC_AMT))
 			dytc_control_amt(profile == PLATFORM_PROFILE_BALANCED);
@@ -10507,7 +10517,7 @@ static void dytc_profile_refresh(void)
 {
 	enum platform_profile_option profile;
 	int output, err = 0;
-	int perfmode;
+	int perfmode, funcmode;
 
 	mutex_lock(&dytc_mutex);
 	if (dytc_capabilities & BIT(DYTC_FC_MMC)) {
@@ -10522,8 +10532,9 @@ static void dytc_profile_refresh(void)
 	if (err)
 		return;
 
+	funcmode = (output >> DYTC_GET_FUNCTION_BIT) & 0xF;
 	perfmode = (output >> DYTC_GET_MODE_BIT) & 0xF;
-	convert_dytc_to_profile(perfmode, &profile);
+	convert_dytc_to_profile(funcmode, perfmode, &profile);
 	if (profile != dytc_current_profile) {
 		dytc_current_profile = profile;
 		platform_profile_notify();
-- 
2.39.0

