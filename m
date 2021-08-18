Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30BF8C4338F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 18 Aug 2021 13:36:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0FEE560238
	for <platform-driver-x86@archiver.kernel.org>; Wed, 18 Aug 2021 13:36:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236629AbhHRNha (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 18 Aug 2021 09:37:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233722AbhHRNh3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 18 Aug 2021 09:37:29 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AFBCC061764
        for <platform-driver-x86@vger.kernel.org>; Wed, 18 Aug 2021 06:36:55 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id u3so5150137ejz.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 18 Aug 2021 06:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=svgalib-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:from:date:subject:to:cc;
        bh=bv+dqkUeALEA4dFjqQWci0NNwR0oDkTQ4eVJuwQ7icQ=;
        b=hGBIX6QTnS7x6/CjL0uhcbvUPMLZpULaCLxroUi7rrtDF71jRTdgEUOGsAwHP6eT1s
         aIbCqfmuupZZSG6Z0qRcFcMinJCeJXaUIG+OsW0HtzAKpINin7GPCi3mq/z4TA5i1gLs
         DsAMfbV/f2I1m8oSF+Xt09Mh+/LnJ+wltPlLmVxJ4aw8bCt0CPEb/SDIKJfNwzeCZ/y9
         xrZkUwNLnDN6yPAZRi+N14s1PaKrJoQCfBkMeEDWRWnwD95nKJOTxL2qdz1WFJqKw0IG
         JuyigYnl+FfVk/OyLDB5eY5i0pnpkpiGollOxF6e2qqup2W5HSp2Sk8USdYVQOWs1A14
         SWzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:from:date:subject:to:cc;
        bh=bv+dqkUeALEA4dFjqQWci0NNwR0oDkTQ4eVJuwQ7icQ=;
        b=VatonOhdz2yaCf1wZp34ialXSYd4LV6KfzvB+2wkwaPXKKA+TI5Q4VUzi5DJBZJLzX
         sUSB7L9RNMWQH+P4nxN3/g/HNBfkpyl+8Yj4i/ZQtqdPH0CgI7m9ku6je1rygoUhnoTr
         wfPATTwkrMWPN961XnwmfGlcmMTfgec+6U4NoxYgRVrWjKH6op62oK5aLRARrKOCfwPJ
         r6FxEtd5LObo6BGQY90pEQJamqM4WLp1rncGyC21LgPrf2uWy2MBnISgMefNgxccDUCh
         Jiba2sH/gTTwh2On7rTQNkRE+pdO2ow0ZClbjW8qrX9vT0JvhwxTJEgZux08jhmV6nHw
         0taw==
X-Gm-Message-State: AOAM530Fm+fv9Fiu77PsbZ6oCU9KwIcQVCSzNTW3ZhOtpHLMtY3L/dT8
        3sna3aMIG4MZIOn76pkcYmg3MoOY739kiaw=
X-Google-Smtp-Source: ABdhPJwaNgSWCRE24jL3Ul1E0c5edPX3WqzYykMCkijEBhzQjMcA+D8i1in8Vc+65r6nDqbhRQtLwg==
X-Received: by 2002:a17:906:a28d:: with SMTP id i13mr9453699ejz.535.1629293813356;
        Wed, 18 Aug 2021 06:36:53 -0700 (PDT)
Received: from localhost ([2a00:a040:195:275f:ad44:6808:2596:8580])
        by smtp.gmail.com with ESMTPSA id w5sm2113989ejz.25.2021.08.18.06.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 06:36:52 -0700 (PDT)
Message-Id: <cover.1629291912.git.matan@svgalib.org>
From:   Matan Ziv-Av <matan@svgalib.org>
Date:   Wed, 18 Aug 2021 16:05:12 +0300
Subject: [PATCH V2 0/3] lg-laptop: Support new models and correct events for FN keys
To:     Platform Driver <platform-driver-x86@vger.kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

V2 of lg-laptop driver fixes, according to Hans de Goede's comments.

Matan Ziv-Av (3):
  platform/x86: lg-laptop: Support for battery charge limit on newer
    models
  platform/x86: lg-laptop: Use correct event for touchpad toggle FN-key
  platform/x86: lg-laptop: Use correct event for keyboard backlight
    FN-key

 .../admin-guide/laptops/lg-laptop.rst         |   4 +-
 drivers/platform/x86/lg-laptop.c              | 107 +++++++++++++++---
 2 files changed, 90 insertions(+), 21 deletions(-)

-- 
Matan.

