Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDED5CD8CA9
	for <platform-driver-x86@archiver.kernel.org>; Tue, 10 Oct 2023 17:21:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233468AbjJJRVo (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 10 Oct 2023 13:21:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232756AbjJJRVn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 10 Oct 2023 13:21:43 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 216B38E
        for <platform-driver-x86@vger.kernel.org>; Tue, 10 Oct 2023 10:21:42 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5041cc983f9so7172393e87.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 10 Oct 2023 10:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696958499; x=1697563299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DxM1TtTAL1X0sr1GxhkLH7LQwr6tOWLMQghrHxILekA=;
        b=Az9yvqhtO9zWl16uTkXmAQltdPpYHzLeUWSX8Jn9L5s4M0Q4IDDy20m70I7Gu77hgB
         2NYq7J9T8ttixiyNGcOgqpxH4Tl7tPVeX6xYKlLyvpXqZcRsiNZVvtaeBP1y91rVhi1b
         xZgqOsMegKbiJf4VG/DDVMSn4ZZdClkoBZ2ZFSJ0XroVyzrnGiWmcYROtbkSljmYSHh/
         MlvwqqHTcD6KcRkOkpkWJinZ9ktHIa0jelGpMxXIbBfCM7NbqJQGCf11l8ZVOAVnCXEj
         861gyqE142gna4yTPXDO9uUAqI8GA21HGPIsy5avoFbxsoSlmfTR4KyfcrvEx+Dq6w/V
         mGCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696958499; x=1697563299;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DxM1TtTAL1X0sr1GxhkLH7LQwr6tOWLMQghrHxILekA=;
        b=HoJk4w5IUgbSDaVGNH3JfvZB1gRmlM22sGyNl6DzDrapDmdmEzsUHgMFlBK9GS/OCr
         IvbhAxQZOIM2lGqSFmzrVoyZBhlmeo+4/vKZ23szuwMA0Y9uriClXPUmxguqDarC3syh
         rE8sXd2ksmzdgD6e2EZeDw1cDHnA9ohzfJERFdRBJkAh6RRzrU3kLmtZwkThc6KYqvBs
         mT2PLsd8CQS+VKYTBPKDFMmH8G2lLBaDpKfinRMSJWecVefLXVcboUN1oQJxV4NwM7tz
         wnU6TkCttodE2hm50znjB3u5BABEjeQTj6PT0Q+2IqDE7JMlDZpln86y/eHPKxGvKZbD
         AQdQ==
X-Gm-Message-State: AOJu0YyAaCIdGzo03Ad3A8Iw7R39099bYEHS8zNgVd7CeYWqALAGfzrk
        vRPgkIWw+S0m2+mFXaAUQDZ8jHVaT34=
X-Google-Smtp-Source: AGHT+IEoi8/MtCDM/KBEBfkolWGPvs2ckFdcaX6PvsPFFkloeTUa9RF6MgsRpQRGZpiJq3ds4weYrA==
X-Received: by 2002:a05:6512:203a:b0:504:33da:b659 with SMTP id s26-20020a056512203a00b0050433dab659mr14388015lfs.57.1696958498455;
        Tue, 10 Oct 2023 10:21:38 -0700 (PDT)
Received: from localhost.localdomain ([81.177.126.138])
        by smtp.gmail.com with ESMTPSA id y2-20020a197502000000b005041f004d33sm1881636lfe.90.2023.10.10.10.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 10:21:38 -0700 (PDT)
From:   Nikita Kravets <teackot@gmail.com>
To:     platform-driver-x86@vger.kernel.org
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Nikita Kravets <teackot@gmail.com>,
        Aakash Singh <mail@singhaakash.dev>,
        Jose Angel Pastrana <japp0005@red.ujaen.es>
Subject: [PATCH 0/5] platform/x86: msi-ec: Add the first platform device attributes
Date:   Tue, 10 Oct 2023 20:20:34 +0300
Message-ID: <20231010172037.611063-3-teackot@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi!

This patch series implements a platform driver and the first three
platform device attributes: firmware version (RO), firmware release
date (RO) and cooler boost (RW).

Cc: Aakash Singh <mail@singhaakash.dev>
Cc: Jose Angel Pastrana <japp0005@red.ujaen.es>

Nikita Kravets (5):
  platform/x86: msi-ec: Register a platform driver
  platform/x86: msi-ec: Add fw version and release date attributes
  platform/x86: msi-ec: Filter out unsupported attributes
  platform/x86: msi-ec: Add EC bit operation functions
  platform/x86: msi-ec: Add a cooler boost attribute

 drivers/platform/x86/msi-ec.c | 194 ++++++++++++++++++++++++++++++++++
 drivers/platform/x86/msi-ec.h |   5 +
 2 files changed, 199 insertions(+)

-- 
2.42.0

