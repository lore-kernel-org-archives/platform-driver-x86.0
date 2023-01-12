Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B2C9C54EBE
	for <platform-driver-x86@archiver.kernel.org>; Thu, 12 Jan 2023 22:21:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240502AbjALWVT (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 12 Jan 2023 17:21:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240560AbjALWUi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 12 Jan 2023 17:20:38 -0500
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FF5054706
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Jan 2023 14:12:48 -0800 (PST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 5BA3C5C00B4;
        Thu, 12 Jan 2023 17:12:48 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Thu, 12 Jan 2023 17:12:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm1; t=1673561568; x=1673647968; bh=NR
        yVj2YDYWfyOZi6RBETUXuViVJc7UptXM4CPsqjukk=; b=xKGci3p7AK1ou+3a0a
        czvJn4skdytfEKo1pkDRo1oHI98Rm8c7tY/f5NsoR4elyQxaslphXNo2wjg6fT73
        EF5z92NpqiJG60SikeJmo/h8tVSXwQ3Cg4+UJMbHqplF3Uzast6y1kWto1fi0MV7
        dBpmGyDHX9LtAzMvFfBNombtXFb5rYYkT0CZumq7Z/NP3JhCVTVnFNNzaxcncBDb
        FoEYPwi+IOQY0YmiVV6B4XcnUm7F88V40hHQ6lOmW4cAUP0ed8PPS5XZq5SCl49k
        bCGA7MryKrGxQV60sB10j+KipZ0RZC7FE+iV7VEF+1MsrT9oi5F1NO/u9qvUzR0i
        8W7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1673561568; x=1673647968; bh=NRyVj2YDYWfyO
        Zi6RBETUXuViVJc7UptXM4CPsqjukk=; b=EoC1H5zNiFciKD7RbklqCFTYNSJt7
        Pa6lA31chM1bP+85znLP/UWA+BZK5P5yJYswconf68fgsSfZejG/e/oAwW+7xNSD
        PBUFZCQxm4KZL6Rw5phzgWPMymGteDMwwPc1zMNAL3oW82oH3Sv+iZJouzlKOBVs
        kb0+QdHeOXCPksxXa9mHV9fU+VGOOeoqiNROdxqL6z1jxM3noer+R5Bk/IFddadh
        EHO8sc78Vfhbt8LAiS3unzI0J9dNST/dAI34MW94eQ95FDsFIiljLBX6hv5XkjD1
        VdXeSqM8hmwootqIwkyjJkzk4NB5ByQqHuImqABl5Q1/8bTzLgF8IM4FQ==
X-ME-Sender: <xms:4IXAYyorcXn9USVDolA4Z3vWhthDaadkgpII0h_Ao94oEuDy8a9Mxg>
    <xme:4IXAYwo5peD62dke63Zh5WYbJYNWPgXNVe2Xzgtv7tyCKEHeL3G4whBN-6ralWfLC
    N7yfVQRCU46fLNfR8A>
X-ME-Received: <xmr:4IXAY3OdMFAR9J6WYIqlpZD1a1FHXMJ4mhkhaQ9EFviuEiGZiaLJzwcNQprpDEnDD69lMrwbg1-ZCFFKphOGFK-eMfbI7toMVi0hg--BIdfWMPj86HnykQGLxIuso0sRdYddt7k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrleeigdduiedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucgoteeftdduqddtudculdduhedmnecujfgurhephf
    fvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrrhhkucfrvggrrhhs
    ohhnuceomhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrgeqnecuggftrf
    grthhtvghrnhepheejffeuveefvefgledtveejfedvhfdthfdtgffgffevfeetudfhtdfh
    hfefhfeinecuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhhpvggrrhhsohhnqdhl
    vghnohhvohesshhquhgvsggsrdgtrg
X-ME-Proxy: <xmx:4IXAYx7ID_cXuKcvminiMpNELM1dkHaQRjtpNH45-yGP03PArki1Hg>
    <xmx:4IXAYx7tbhuYHRFDq-Ou-OD6VFaZ5ME5G9U8waxkocIk1UGrNHvzJg>
    <xmx:4IXAYxiG0nPRbtnP7324VTFOj2EtnVt4zJDYPBQBdQj7c1RleggIqQ>
    <xmx:4IXAY7mWjN7-q4hGRIWAR_SaoHxTbzEjvJt_fHOaqtYlFjyENd2IPg>
Feedback-ID: ibe194615:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 Jan 2023 17:12:47 -0500 (EST)
From:   Mark Pearson <mpearson-lenovo@squebb.ca>
To:     mpearson-lenovo@squebb.ca
Cc:     hdegoede@redhat.com, mario.limonciello@amd.com,
        markgross@kernel.org, platform-driver-x86@vger.kernel.org
Subject: [PATCH v2] platform/x86: thinkpad_acpi: Fix profile mode display in AMT mode
Date:   Thu, 12 Jan 2023 17:12:28 -0500
Message-Id: <20230112221228.490946-1-mpearson-lenovo@squebb.ca>
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

Link: https://gitlab.freedesktop.org/hadess/power-profiles-daemon/-/issues/115
Fixes: 46dcbc61b739 ("platform/x86: thinkpad-acpi: Add support for automatic mode transitions")

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
---
v2: Corrected title and added link and fixes details

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

