Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0534C7EE25
	for <platform-driver-x86@archiver.kernel.org>; Mon, 12 Jun 2023 07:41:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234909AbjFLHlm (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 12 Jun 2023 03:41:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234942AbjFLHli (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 12 Jun 2023 03:41:38 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 782D6173F
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Jun 2023 00:40:52 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1q8c8r-00042r-1P; Mon, 12 Jun 2023 09:39:09 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1q8c8p-006pmo-VE; Mon, 12 Jun 2023 09:39:07 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1q8c8o-00DQwk-RG; Mon, 12 Jun 2023 09:39:06 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Corentin Chary <corentin.chary@gmail.com>,
        Daniel Scally <djrscally@gmail.com>
Cc:     platform-driver-x86@vger.kernel.org, kernel@pengutronix.de,
        acpi4asus-user@lists.sourceforge.net
Subject: [PATCH 0/3] platform: Switch back to use struct i2c_driver's .probe()
Date:   Mon, 12 Jun 2023 09:38:59 +0200
Message-Id: <20230612073902.840435-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=964; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=0sPDBAvxSDiQWVYBnZyVzCOvbyNtBnc364k2Oh1KXVY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkhsuPGZ0oJdd/cSgBqjPJ9F7CW3YCVR6zRTNgA JpO18LDQCaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZIbLjwAKCRCPgPtYfRL+ Ti2UB/0co/D321+MhWjyA7OXBQcK32V8RKycEQsebsznUFoCA0VVMeL7j0otTodHMyG3of9lbD8 GV39CLfzOlFpKhNe6/QecT1A1O4Xw5DB1whGeRtoMqrbxITOJkaTDcFdo/ONU//GGAmieboXOPI N53ZuyodTuq1G3WiUzcx0hLzFWJtCgcxho3R0w6K0ewr08ruaTmFIngme7cRtXnDs2klc9mOcay zoMIuHXSeTrlDlL7h6lOWx34GP/U+Vt+Sxc83T6FtWW2EqcZaf/SJmQY8TDQ9VNXZa5SbNu8iU4 /zulj1ABdUSxVlKoKuOQlU7fx9MYXLpVfYZrEudEk22/VrDo
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: platform-driver-x86@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hello,

these three patches convert three i2c drivers back to use .probe() after
its prototype was changed.

I was unsure if I should put the surface change together with the two
other x86 changes but as surfaces are x86, too, I thought this might be
right. If not: The patches are orthogonal to each other, so they can be
applied to different trees without interdependencies.

Best regards
Uwe

Uwe Kleine-König (3):
  surface: surface3_power: Switch back to use struct i2c_driver's
    .probe()
  platform/x86: asus-tf103c-dock: Switch back to use struct i2c_driver's
    .probe()
  platform/x86: int3472: Switch back to use struct i2c_driver's .probe()

 drivers/platform/surface/surface3_power.c     | 2 +-
 drivers/platform/x86/asus-tf103c-dock.c       | 2 +-
 drivers/platform/x86/intel/int3472/tps68470.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

base-commit: ac9a78681b921877518763ba0e89202254349d1b
-- 
2.39.2

