Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80B57C433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 21 Sep 2021 10:07:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6180661100
	for <platform-driver-x86@archiver.kernel.org>; Tue, 21 Sep 2021 10:07:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231591AbhIUKIf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 21 Sep 2021 06:08:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231555AbhIUKIf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 21 Sep 2021 06:08:35 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E250C061574
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Sep 2021 03:07:07 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id d6so37269561wrc.11
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Sep 2021 03:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H8nvK4KH7/1AlEsyvZuhDb1vG4cOGI6m3avl1LbtNXU=;
        b=gYBw+wz/+FfwtujvL56WecAPXR6aMYo5IukkSdNIYQ/4lJaB6+fPfzsFFV5EKCUWia
         FoxsW+LjJHF0pIPqAliCevT3a57aSUtnX+3hs7kNgBKkynEHjk2Bhpata7TQd2srZwCS
         3PAOiqYswFKt13w75OSa+zTbnDoHkPuFEKBYZxhAWnpW2ASabS9c2nJIxs/kzLRB68Q4
         Pj9X/xxNhwS9DNyjnAXKdQbG/aDvzU80+qv4yyU5+nJay7FBas57dTkDow3DIeE1LKSK
         OcSg+YwiVZe2LDEJB2Ss7AhJtUnY3VDEnzuhFCSbHhwA9BjkecXbG5huPnCwG7AIe8IV
         r+gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H8nvK4KH7/1AlEsyvZuhDb1vG4cOGI6m3avl1LbtNXU=;
        b=a14jFiOlRsEA23IXW0/fgs/pTVVHGmrPqvufvZobH3imCM8aivYcCCXi7/8jHGg5zR
         TWkmGHOnSgfrr8HrQ9u3SrBfpzg9MXp/l/8KethkKnxgulehd5Pbrbiz5/1mrLhXAtEY
         wwNOi/euZ3O93LG+dS6oyIeyUmnibjY/qEGONL2zgoC3XOKghTA6Fvn4Wk6dCl4Sf13m
         p7juzXaAt+m/5n4bilInpnkQTxwioJmYr89dtH0UPm9kELJOH1PkXFQtWhoiAJVbyns1
         2AWuJSEl41Y+/q2/4xhRBbyu4GEW1CHPfzpPmfKH7aj8unLaISzgBq0za9REFc28klkY
         vUiQ==
X-Gm-Message-State: AOAM532GTePeAwtC9f09oS80x4LqEeelfeO4VEo85aTa5B8Ij3qtixVf
        OEHG1Ru8iDrAMSz8D7RkG54nrKOeHo8=
X-Google-Smtp-Source: ABdhPJxjoaVai2QOklSI5ysg15YB4yT+RVlUpiP9SuKwK4B+R2qKAdTsbFh4gObAcA7TfhYqSRpWxA==
X-Received: by 2002:adf:e88e:: with SMTP id d14mr34593271wrm.207.1632218825792;
        Tue, 21 Sep 2021 03:07:05 -0700 (PDT)
Received: from localhost (ip5f5afd21.dynamic.kabel-deutschland.de. [95.90.253.33])
        by smtp.gmail.com with ESMTPSA id s24sm2172032wmh.34.2021.09.21.03.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 03:07:05 -0700 (PDT)
From:   Tobias Jakobi <cubic2k@gmail.com>
X-Google-Original-From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
To:     thomas@weissschuh.net
Cc:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org,
        Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH] platform/x86: gigabyte-wmi: add support for B550I Aorus Pro AX
Date:   Tue, 21 Sep 2021 12:07:02 +0200
Message-Id: <20210921100702.3838-1-tjakobi@math.uni-bielefeld.de>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

- tested with a AMD Ryzen 7 5800X

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/platform/x86/gigabyte-wmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/gigabyte-wmi.c b/drivers/platform/x86/gigabyte-wmi.c
index 7f3a03f937f6..d53634c8a6e0 100644
--- a/drivers/platform/x86/gigabyte-wmi.c
+++ b/drivers/platform/x86/gigabyte-wmi.c
@@ -144,6 +144,7 @@ static const struct dmi_system_id gigabyte_wmi_known_working_platforms[] = {
 	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B550 AORUS ELITE"),
 	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B550 AORUS ELITE V2"),
 	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B550 GAMING X V2"),
+	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B550I AORUS PRO AX"),
 	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B550M AORUS PRO-P"),
 	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B550M DS3H"),
 	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("Z390 I AORUS PRO WIFI-CF"),
-- 
2.32.0

