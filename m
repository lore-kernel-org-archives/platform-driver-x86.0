Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E490C4332D
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Jan 2021 18:36:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E7ED02224C
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Jan 2021 18:36:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387833AbhAZRX3 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 26 Jan 2021 12:23:29 -0500
Received: from mail.v3.sk ([167.172.186.51]:48094 "EHLO shell.v3.sk"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2389376AbhAZHio (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 26 Jan 2021 02:38:44 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id 099F8E0AE3;
        Tue, 26 Jan 2021 07:33:44 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id LiDkEwULDfYZ; Tue, 26 Jan 2021 07:33:43 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id 02148E0B00;
        Tue, 26 Jan 2021 07:33:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id zfSGgeEiMIkE; Tue, 26 Jan 2021 07:33:42 +0000 (UTC)
Received: from localhost (unknown [109.183.109.54])
        by zimbra.v3.sk (Postfix) with ESMTPSA id 32E5DE075A;
        Tue, 26 Jan 2021 07:33:42 +0000 (UTC)
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH 2/3] Platform: OLPC: Remove dcon_rdev from olpc_ec_priv
Date:   Tue, 26 Jan 2021 08:37:39 +0100
Message-Id: <20210126073740.10232-3-lkundrak@v3.sk>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210126073740.10232-1-lkundrak@v3.sk>
References: <20210126073740.10232-1-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

It is not needed. Use a local variable instead.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 drivers/platform/olpc/olpc-ec.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/olpc/olpc-ec.c b/drivers/platform/olpc/olpc=
-ec.c
index 2db7113383fdc..3c852d573e9b4 100644
--- a/drivers/platform/olpc/olpc-ec.c
+++ b/drivers/platform/olpc/olpc-ec.c
@@ -37,7 +37,6 @@ struct olpc_ec_priv {
 	struct mutex cmd_lock;
=20
 	/* DCON regulator */
-	struct regulator_dev *dcon_rdev;
 	bool dcon_enabled;
=20
 	/* Pending EC commands */
@@ -405,6 +404,7 @@ static int olpc_ec_probe(struct platform_device *pdev=
)
 {
 	struct olpc_ec_priv *ec;
 	struct regulator_config config =3D { };
+	struct regulator_dev *regulator;
 	int err;
=20
 	if (!ec_driver)
@@ -432,11 +432,10 @@ static int olpc_ec_probe(struct platform_device *pd=
ev)
 	config.dev =3D pdev->dev.parent;
 	config.driver_data =3D ec;
 	ec->dcon_enabled =3D true;
-	ec->dcon_rdev =3D devm_regulator_register(&pdev->dev, &dcon_desc,
-								&config);
-	if (IS_ERR(ec->dcon_rdev)) {
+	regulator =3D devm_regulator_register(&pdev->dev, &dcon_desc, &config);
+	if (IS_ERR(regulator)) {
 		dev_err(&pdev->dev, "failed to register DCON regulator\n");
-		err =3D PTR_ERR(ec->dcon_rdev);
+		err =3D PTR_ERR(regulator);
 		goto error;
 	}
=20
--=20
2.29.2

