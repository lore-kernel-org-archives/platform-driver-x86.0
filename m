Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 890AFC433FE
	for <platform-driver-x86@archiver.kernel.org>; Thu, 20 Oct 2022 20:10:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229882AbiJTUKn (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 20 Oct 2022 16:10:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbiJTUKm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 20 Oct 2022 16:10:42 -0400
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com [IPv6:2001:4860:4864:20::2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B0D41633A7
        for <platform-driver-x86@vger.kernel.org>; Thu, 20 Oct 2022 13:10:36 -0700 (PDT)
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-13af2d12469so905645fac.13
        for <platform-driver-x86@vger.kernel.org>; Thu, 20 Oct 2022 13:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=rjrepLmnUzZCFcT31EWZrD92lIwZFg6a7ostgsreZlc=;
        b=EbPpbYOoRAjUzl1xtyB05dJVoBYPT9729sP9gHdah7gvLjvopNyE2uCIKjNbVLEQ4H
         qf63mjooGV1uPzW28dhGRpav79q7btUs73+R6tawZtteDdCAgoakVOCSLMot2pSUHIX1
         VOaClT7Y9Eeu8hkMq7GIz/pLKSDlZkrf9xKlZogHbfT6Ux6aJF+H8Cc3fvbdll6HAXIp
         a94T8e9eSxthRVKl2mqkMyAV/QKw3B4C7ZaGl734Yd4B9NsxOn0Bdps/7zprpP1ZTrmX
         snJf9slSyXvdJ+QxTzFPlj/+/TAgfB+wVs0DoN5y03BOYb/fB9oyycZCZseZLn849DO2
         No2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rjrepLmnUzZCFcT31EWZrD92lIwZFg6a7ostgsreZlc=;
        b=KyLyNvf1hMAmgFFL66OvR8bet/FFu2beDsig52BG+w0nsjuT69/JTICQLJUAQRylos
         YIsHkRQ2hlI9f7ofTLxmJGXMblSO0fxX/zQLRfZo3BeKM054bwiBXJpvMKYodM6OPRXQ
         pPfePYPWTBBL5lpL2MdZgdHbUNbexZBpFPl3PFFxDYzLEu9nap09/ihJiCMWMk0yzkIq
         FjXqAg9A21jJASiIkNcwoFrQU8JBRM6DnyvAV7xAl0qXNG5ks/SLsBN6qmSx53cU1YM2
         vDAToZL5XigQTWN1Xu9C5LnMxzR5i8FzCMfIVHk4xgJlZId5W2vMOL8YWshtZ5Mm+t8K
         4I7w==
X-Gm-Message-State: ACrzQf3TUoXZos7OgOQxPBlhcVI8CUpm2aueAV06jayLGq+91UGvCoGI
        CBFmgWfEtXn+RfbRJWbzu9WvX2dzAVs=
X-Google-Smtp-Source: AMsMyM6PXtk73ejN2PnCnYZGRfzFgh5dv40q2ODVgO0dIP283N04znGUjXxFZvqpDlDpOnO535PjJg==
X-Received: by 2002:a05:6870:2054:b0:132:d1fb:ddf0 with SMTP id l20-20020a056870205400b00132d1fbddf0mr27442389oad.283.1666296635359;
        Thu, 20 Oct 2022 13:10:35 -0700 (PDT)
Received: from grumpy-Fury.hsd1.tx.comcast.net ([2601:2c3:480:7390:ece5:3818:e03c:2cb7])
        by smtp.gmail.com with ESMTPSA id a25-20020a544e19000000b003539686cb7bsm302896oiy.53.2022.10.20.13.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 13:10:34 -0700 (PDT)
From:   Jorge Lopez <jorgealtxwork@gmail.com>
X-Google-Original-From: Jorge Lopez <jorge.lopez2@hp.com>
To:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org
Subject: [PATCH v4 0/6] Introduction of HP-BIOSCFG driver
Date:   Thu, 20 Oct 2022 15:10:27 -0500
Message-Id: <20221020201033.12790-1-jorge.lopez2@hp.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Version 4 restructures the patches submitted in previous versions.
Earlier hp-bioscfg patches were squashed together before creating
the new split.

Version 4.0 breaks down the changes as follows:

1. Moving existing HP drivers to a central location

The driver files were broken down in 5 patches of 3 files each
with exception of patch 6/6

2. Introduction of HP-BIOSCFG driver - Set 1
3. HP BIOSCFG driver - set 2
4. HP BIOSCFG driver - set 3
5. HP BIOSCFG driver - set 4
6. HP BIOSCFG driver - remaining components

--


Jorge Lopez (6):
  Moving existing HP drivers to a central location
  Introduction of HP-BIOSCFG driver
  HP BIOSCFG driver - set 2
  HP BIOSCFG driver - set 3
  HP BIOSCFG driver - set 4
  HP BIOSCFG driver - remaining components

 .../testing/sysfs-class-firmware-attributes   |  181 ++-
 MAINTAINERS                                   |   15 +-
 drivers/platform/x86/Kconfig                  |   80 +-
 drivers/platform/x86/Makefile                 |    4 +-
 drivers/platform/x86/hp/Kconfig               |   81 ++
 drivers/platform/x86/hp/Makefile              |   11 +
 drivers/platform/x86/hp/hp-bioscfg/Makefile   |   19 +
 .../x86/hp/hp-bioscfg/biosattr-interface.c    |  285 +++++
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c  | 1064 +++++++++++++++++
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.h  |  671 +++++++++++
 .../x86/hp/hp-bioscfg/enum-attributes.c       |  521 ++++++++
 .../x86/hp/hp-bioscfg/int-attributes.c        |  478 ++++++++
 .../x86/hp/hp-bioscfg/ordered-attributes.c    |  586 +++++++++
 .../x86/hp/hp-bioscfg/passwdattr-interface.c  |   50 +
 .../x86/hp/hp-bioscfg/passwdobj-attributes.c  |  647 ++++++++++
 .../x86/hp/hp-bioscfg/spmobj-attributes.c     |  408 +++++++
 .../x86/hp/hp-bioscfg/string-attributes.c     |  457 +++++++
 .../x86/hp/hp-bioscfg/sureadmin-attributes.c  | 1014 ++++++++++++++++
 .../x86/hp/hp-bioscfg/surestart-attributes.c  |  145 +++
 drivers/platform/x86/{ => hp}/hp-wmi.c        |    0
 drivers/platform/x86/{ => hp}/hp_accel.c      |    0
 drivers/platform/x86/{ => hp}/tc1100-wmi.c    |    0
 22 files changed, 6647 insertions(+), 70 deletions(-)
 create mode 100644 drivers/platform/x86/hp/Kconfig
 create mode 100644 drivers/platform/x86/hp/Makefile
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/Makefile
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/bioscfg.h
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/int-attributes.c
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/ordered-attributes.c
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/passwdattr-interface.c
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/string-attributes.c
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/sureadmin-attributes.c
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/surestart-attributes.c
 rename drivers/platform/x86/{ => hp}/hp-wmi.c (100%)
 rename drivers/platform/x86/{ => hp}/hp_accel.c (100%)
 rename drivers/platform/x86/{ => hp}/tc1100-wmi.c (100%)

--
2.34.1

