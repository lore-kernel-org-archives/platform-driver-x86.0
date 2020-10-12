Return-Path: <SRS0=Q59L=DT=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1B45C433DF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 12 Oct 2020 19:08:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AFCF420878
	for <platform-driver-x86@archiver.kernel.org>; Mon, 12 Oct 2020 19:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602529687;
	bh=iTvTgCIoHdV77uoZ2jtGBMZh/lLvks6Ml0bJunUJMfQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=17S/ZqPPhTQPi1GEUhuLU76W+YAn2dmblqe1RnGFwNgD1/PoDYCQIoeXo/Rtw3DCB
	 64prrfRmpsuaC5MAKsU3WTxg/XWP8Q2Ry6HDlOxhEgFz82qqZ0C5GsZUZYVvb3mgDU
	 cyELPR+fhmHA9yPe3gM6+AwRMSovdslBatnrdEd0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391168AbgJLTIG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 12 Oct 2020 15:08:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:52918 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390520AbgJLTD0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 12 Oct 2020 15:03:26 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2500C21D7F;
        Mon, 12 Oct 2020 19:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602529398;
        bh=iTvTgCIoHdV77uoZ2jtGBMZh/lLvks6Ml0bJunUJMfQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Iys38gNykFSGyDzakMlCvs/BtrZ/2tsDBg/YFWde+5mf2cLXdphfn8q7+pj2Npq+Z
         XqS+C+bCbmbl/gbN1waeZS5FexRhlBJzCFJvgbpvRkwF9R10KO3tTqeEo94xFlaPDO
         PgacQMMxOl6u/EhivX8ioMur3wSpIILdO2NxpQ5I=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Marius Iacob <themariusus@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sasha Levin <sashal@kernel.org>,
        acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 03/15] platform/x86: asus-wmi: Add BATC battery name to the list of supported
Date:   Mon, 12 Oct 2020 15:03:00 -0400
Message-Id: <20201012190313.3279397-3-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201012190313.3279397-1-sashal@kernel.org>
References: <20201012190313.3279397-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Marius Iacob <themariusus@gmail.com>

[ Upstream commit 1d2dd379bd99ee4356ae4552fd1b8e43c7ca02cd ]

The Intel Atom Cherry Trail platform reports a new battery
name (BATC). Tested on ASUS Transformer Mini T103HAF.

Signed-off-by: Marius Iacob <themariusus@gmail.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/platform/x86/asus-wmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index ed83fb135bab3..457fb5de70ee5 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -425,6 +425,7 @@ static int asus_wmi_battery_add(struct power_supply *battery)
 	 */
 	if (strcmp(battery->desc->name, "BAT0") != 0 &&
 	    strcmp(battery->desc->name, "BAT1") != 0 &&
+	    strcmp(battery->desc->name, "BATC") != 0 &&
 	    strcmp(battery->desc->name, "BATT") != 0)
 		return -ENODEV;
 
-- 
2.25.1

