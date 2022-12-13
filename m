Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8A19C4332F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 13 Dec 2022 16:24:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235691AbiLMQYR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 13 Dec 2022 11:24:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235640AbiLMQYQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 13 Dec 2022 11:24:16 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE79FD84
        for <platform-driver-x86@vger.kernel.org>; Tue, 13 Dec 2022 08:24:15 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1p584c-00013Q-Jr; Tue, 13 Dec 2022 17:24:06 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1p584Z-004Hor-Oh; Tue, 13 Dec 2022 17:24:04 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1p584Z-004orA-N9; Tue, 13 Dec 2022 17:24:03 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Peter Kaestle <peter@piie.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        =?utf-8?q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>,
        Zha Qipeng <qipeng.zha@intel.com>
Cc:     platform-driver-x86@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 0/3] platform/x86: Drop empty platform remove functions
Date:   Tue, 13 Dec 2022 17:23:56 +0100
Message-Id: <20221213162359.651529-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=936; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=UsNvErgBYK04Nq/boe5sO6DagxTNewLWwoIFjONwfCM=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjmKcPAQvbqoGRHgxgTp34NCh/X9vmIdDmO3ZI5T96 Igfgh32JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY5inDwAKCRDB/BR4rcrsCRzzB/ 9xJp2zdlQZxquhYA2U28eyp89VT17DVYGvt95F7rwYTCRVF2Azd6lToNC9okHK4kPemeRm7Sh/QELX vF6gywJu+/l8IZRzg2Wp39G2hEQhiJbO/xrklw3/r6Ko9IjVsARRbE3rWVYWe26KB4mfnmjtcZ81ro Ra/IDgll6HcjaPBrU57fAa2WXOs09DhYbj4Xfg53NTAZ4BXzVducs1B6eXruI7KvL3ewdUgLir598R DGTeO+7jCkJiWcgfAY81cwfV9rHsm1UiP29gtAj8558ZQWFfJSTcU01sYAFcyrOXkbMwjANa/knAfK PzC8SQd/0D210JEtwszoBWChNXDbjO
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

this series removes all platform remove functions that only return zero
below drivers/platform/x86. There is no reason to have these, as the only
caller is platform core code doing:

        if (drv->remove) {
                int ret = drv->remove(dev);

                if (ret)
                        dev_warn(...)
        }

(in platform_remove()) and so having no remove function is both
equivalent and simpler.


Uwe Kleine-König (3):
  platform/x86: acerhdf: Drop empty platform remove function
  platform/x86: intel: oaktrail: Drop empty platform remove function
  platform/x86: intel: punit_ipc: Drop empty platform remove function

 drivers/platform/x86/acerhdf.c         | 6 ------
 drivers/platform/x86/intel/oaktrail.c  | 6 ------
 drivers/platform/x86/intel/punit_ipc.c | 6 ------
 3 files changed, 18 deletions(-)


base-commit: 830b3c68c1fb1e9176028d02ef86f3cf76aa2476
-- 
2.38.1

