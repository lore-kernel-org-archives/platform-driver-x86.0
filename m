Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1A5CC433DB
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Mar 2021 02:41:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7D01964E90
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Mar 2021 02:41:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233670AbhCCC3b (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 2 Mar 2021 21:29:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:39000 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1384037AbhCBNwd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 2 Mar 2021 08:52:33 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0F6EE64F85;
        Tue,  2 Mar 2021 11:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614686279;
        bh=6c15F5Uhi6U8dgs+Iy1Mr9IC+YG/q6nRShgMK4C9KO8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TE/m0REPVl1o+kQCXSfBPLN/N1NxH6VMpsjugcfeCRneC1UDRHc7Nd9gGaOCDj/L6
         uqsX1ThYStboOiIO6Y8etNuaEa2KkwR0HomTqQ3ydTlj8gE8R+iba4XsHz0xAyoD2Q
         z8jHWssXMcIue5b5KsBWAITX17CegpreLLEAVUuhc98eNin/gqpS2qhXJD/EUDDkAQ
         7qPdGZ//DoTA+5inNUOiQEuE3VIdIBH5j3qwtgU/Xtm9V0y4RuezWwmTWGLYxe0adR
         34QJ6+7MEP+aa2+1jmVEHXMCTWapbMSWvv76fv4iLmoGgZfEyLVwai1eDCEcXFutn3
         hzQKH/9/yodBQ==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Lubomir Rintel <lkundrak@v3.sk>,
        Hans de Goede <hdegoede@redhat.com>,
        Sasha Levin <sashal@kernel.org>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 07/33] Platform: OLPC: Fix probe error handling
Date:   Tue,  2 Mar 2021 06:57:23 -0500
Message-Id: <20210302115749.62653-7-sashal@kernel.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210302115749.62653-1-sashal@kernel.org>
References: <20210302115749.62653-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Lubomir Rintel <lkundrak@v3.sk>

[ Upstream commit cec551ea0d41c679ed11d758e1a386e20285b29d ]

Reset ec_priv if probe ends unsuccessfully.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
Link: https://lore.kernel.org/r/20210126073740.10232-2-lkundrak@v3.sk
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/platform/olpc/olpc-ec.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/olpc/olpc-ec.c b/drivers/platform/olpc/olpc-ec.c
index f64b82824db2..2db7113383fd 100644
--- a/drivers/platform/olpc/olpc-ec.c
+++ b/drivers/platform/olpc/olpc-ec.c
@@ -426,11 +426,8 @@ static int olpc_ec_probe(struct platform_device *pdev)
 
 	/* get the EC revision */
 	err = olpc_ec_cmd(EC_FIRMWARE_REV, NULL, 0, &ec->version, 1);
-	if (err) {
-		ec_priv = NULL;
-		kfree(ec);
-		return err;
-	}
+	if (err)
+		goto error;
 
 	config.dev = pdev->dev.parent;
 	config.driver_data = ec;
@@ -440,12 +437,16 @@ static int olpc_ec_probe(struct platform_device *pdev)
 	if (IS_ERR(ec->dcon_rdev)) {
 		dev_err(&pdev->dev, "failed to register DCON regulator\n");
 		err = PTR_ERR(ec->dcon_rdev);
-		kfree(ec);
-		return err;
+		goto error;
 	}
 
 	ec->dbgfs_dir = olpc_ec_setup_debugfs();
 
+	return 0;
+
+error:
+	ec_priv = NULL;
+	kfree(ec);
 	return err;
 }
 
-- 
2.30.1

