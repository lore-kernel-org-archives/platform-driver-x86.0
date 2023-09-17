Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C527BCD37B4
	for <platform-driver-x86@archiver.kernel.org>; Sun, 17 Sep 2023 20:39:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241220AbjIQUi6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 17 Sep 2023 16:38:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241278AbjIQUiZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 17 Sep 2023 16:38:25 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5F0012F
        for <platform-driver-x86@vger.kernel.org>; Sun, 17 Sep 2023 13:38:18 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qhyWz-0005na-JG; Sun, 17 Sep 2023 22:38:13 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qhyWy-00742p-FD; Sun, 17 Sep 2023 22:38:12 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qhyWy-002Q6y-5j; Sun, 17 Sep 2023 22:38:12 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>
Cc:     platform-driver-x86@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 0/7] platform/surface: Convert to platform remove callback returning void
Date:   Sun, 17 Sep 2023 22:37:58 +0200
Message-Id: <20230917203805.1149595-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1626; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=KGi6TlhWf2+J9ge1FIfn3Jd14bTepuATa3o4gw3q7D0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlB2Og16Fv4en0p42vvxpO0N8GXeiKi3xS6x2zo NZJVSjxDXaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQdjoAAKCRCPgPtYfRL+ TgS7CACKhMvJDapnqtviNM/+swzLfHnFAF3iisif134eXYupxne1DxmuyTK4t0uKkqIe2hvEdah mIHBx0lQ+QWzDQdS5mFJGNCegmEz8qe79sqBUTYSfAGtcwx2o5zjqmavDbz2THOc4tnRsWgLKML RYYw+mzekPjZfoq1kdr3rdGol55liddb1i6KRYJLVGDyvzTISpEuQeVRU7k2XD2Sfb4agPCsGlw iC5m1GmJkqpQE9DAomU/ig/pLgU9T5bBohSTiG4Eo6R60bXPkCpJf+FJQq1ZwYgsHzuKnqkseMP +USgo1dMW8MrwWpujshA7GZ7XNARyHOPcpLog55YKzLZev0b
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: platform-driver-x86@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hello,

this series converts all platform drivers below drivers/platform/surface
to use .remove_new. The motivation is to get rid of an integer return
code that is (mostly) ignored by the platform driver core. 

See commit 5c5a7680e67b ("platform: Provide a remove callback that
returns no value") for an extended explanation and the eventual goal.

Best regards
Uwe

Uwe Kleine-König (7):
  platform/surface: surface3-wmi: Convert to platform remove callback
    returning void
  platform/surface: acpi-notify: Convert to platform remove callback
    returning void
  platform/surface: aggregator-cdev: Convert to platform remove callback
    returning void
  platform/surface: aggregator-registry: Convert to platform remove
    callback returning void
  platform/surface: dtx: Convert to platform remove callback returning
    void
  platform/surface: gpe: Convert to platform remove callback returning
    void
  platform/surface: hotplug: Convert to platform remove callback
    returning void

 drivers/platform/surface/surface3-wmi.c                | 5 ++---
 drivers/platform/surface/surface_acpi_notify.c         | 6 ++----
 drivers/platform/surface/surface_aggregator_cdev.c     | 5 ++---
 drivers/platform/surface/surface_aggregator_registry.c | 5 ++---
 drivers/platform/surface/surface_dtx.c                 | 5 ++---
 drivers/platform/surface/surface_gpe.c                 | 6 ++----
 drivers/platform/surface/surface_hotplug.c             | 6 ++----
 7 files changed, 14 insertions(+), 24 deletions(-)


base-commit: dfa449a58323de195773cf928d99db4130702bf7
-- 
2.40.1

