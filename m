Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D4C5C4332F
	for <platform-driver-x86@archiver.kernel.org>; Mon, 10 Oct 2022 16:23:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229701AbiJJQXj (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 10 Oct 2022 12:23:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230044AbiJJQXh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 10 Oct 2022 12:23:37 -0400
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com [IPv6:2001:4860:4864:20::2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CC4E75393
        for <platform-driver-x86@vger.kernel.org>; Mon, 10 Oct 2022 09:23:29 -0700 (PDT)
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-1321a1e94b3so13030053fac.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 10 Oct 2022 09:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=LMgp3Lq2lVuOz8i2buenRCXQ+pBEx0t7gNTm0hvMzoU=;
        b=OIA5aT8DLE/88MHhouGqAYcC17DTRKS0BUU/00nmjQH4/OH2KWEgAJi6YxD4fiTNmn
         IBwMnM+L5T8dv1VAC+A9jXbSaxRTbBsieOk51h+DebZo/EwHTs9AQQdFuvsBPQu94gVk
         yOG+DPS2ul+ft4xwAJB9wtxEu3+JR7DqXCB7WGYt5cpixOIJC9hfgU8DcsszYAqkmpiB
         o8jFDmChHF65T981z2+ZmU3MuTvYTWxyy9nM161/PhHEAazOaEfgkhz0FSg4ii1ykZ59
         gQF3jRfgzgMzJO3gjfCzPKarFy9yeaDh8xe2NfVJjiGKV+fn8AdgoJ4qrCBBlJifpTV/
         P2Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LMgp3Lq2lVuOz8i2buenRCXQ+pBEx0t7gNTm0hvMzoU=;
        b=Da9+dCE+mE0fIX8h5Qe2nQTcgB/K/fpuXNg3wGUmJ9VYUv+Pw/AMGKlJrKzQJZbkV8
         vU2T/5DJlfSGKFvdU8wlFNCe7LVTHMD+jhCb/D6dyCEypjFVw1Y4PVgwVo4xVRivr3aK
         FoswSl2AOPGkubeQg78y3y2kzrhO2hFQDpP4lehXBqSQ2waB1yQE6z+Z3MQ79uAEf+KU
         2ZSakrkcI9pGlLOlEuBO8nabHgBGLlhvC+g0WcbrUGB7786ieQk7MdnTIDxi7MBG8gU6
         xqM7eahYeQHZIF1KedMLCwQ7zbpsjOeF5u79lJrNGH0e7XNbLWddRTfteTrzR5UuNnj9
         5e/g==
X-Gm-Message-State: ACrzQf2gGL96o3wCRcjE9J6G5/+LJmmNuC1Dn7x82xLKdmKGMJY4F7Fc
        Kye6L3p8BoZG5+vzjHfgGitbe9/B+5E=
X-Google-Smtp-Source: AMsMyM4XkEfu0C6EkwL4S8O275qXlANfFoNZ7OWiwqrK47ImYJ3+zQizCCZl16G54xVWlNQzX1/DJA==
X-Received: by 2002:a05:6870:a9a0:b0:12b:45b6:80e1 with SMTP id ep32-20020a056870a9a000b0012b45b680e1mr16186486oab.209.1665419008415;
        Mon, 10 Oct 2022 09:23:28 -0700 (PDT)
Received: from grumpy-VECTOR.hsd1.tx.comcast.net ([2601:2c3:480:7390:a7eb:8d3:d3d2:6cd0])
        by smtp.gmail.com with ESMTPSA id c12-20020a9d784c000000b00655bc32a413sm5113221otm.42.2022.10.10.09.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Oct 2022 09:23:27 -0700 (PDT)
From:   Jorge Lopez <jorgealtxwork@gmail.com>
X-Google-Original-From: Jorge Lopez <jorge.lopez2@hp.com>
To:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org
Subject: [PATCH v1 0/1] Introduction of HP-BIOSCFG driver
Date:   Mon, 10 Oct 2022 11:23:25 -0500
Message-Id: <20221010162326.12957-1-jorge.lopez2@hp.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The purpose for this patch is submit HP BIOSCFG driver to be list of
HP Linux kernel drivers.  HP BIOS Configuration driver purpose is to
provide a driver supporting the latest sysfs class firmware attributes
framework allowing the user to change BIOS settings and security
solutions on HP Inc.’s commercial notebooks.

Many features of HP Commercial PC’s can be managed using Windows
Management Instrumentation (WMI). WMI is an implementation of Web-Based
Enterprise Management (WBEM) that provides a standards-based interface
for changing and monitoring system settings.  HP BISOCFG driver provides
a native Linux solution and the exposed features facilitates the
migration to Linux environments.

The Linux security features to be provided in hp-bioscfg driver enables
managing the BIOS settings and security solutions via sysfs, a virtual
filesystem that can be used by user-mode applications.   The new
documentation cover features such Secure Platform Management, Sure
Admin, and Sure Start.  Each section provides security feature
description and identifies sysfs directories and files exposed by
the driver.

Many HP Commercial PC’s include a feature called Secure Platform
Management (SPM), which replaces older password-based BIOS settings
management with public key cryptography. PC secure product management
begins when a target system is provisioned with cryptographic keys
that are used to ensure the integrity of communications between system
management utilities and the BIOS.

HP Commercial PC’s have several BIOS settings that control its behaviour
and capabilities, many of which are related to security. To prevent
unauthorized changes to these settings, the system can be configured
to use a Sure Admin cryptographic signature-based authorization string
that the BIOS will use to verify authorization to modify the setting.


Jorge Lopez (1):
  Introduction of HP-BIOSCFG driver

 .../testing/sysfs-class-firmware-attributes   |  175 ++-
 drivers/platform/x86/Kconfig                  |    1 +
 drivers/platform/x86/Makefile                 |    1 +
 drivers/platform/x86/hp/Kconfig               |   35 +
 drivers/platform/x86/hp/Makefile              |   19 +
 drivers/platform/x86/hp/biosattr-interface.c  |  286 +++++
 drivers/platform/x86/hp/bioscfg.c             | 1029 +++++++++++++++++
 drivers/platform/x86/hp/bioscfg.h             |  667 +++++++++++
 drivers/platform/x86/hp/enum-attributes.c     |  504 ++++++++
 drivers/platform/x86/hp/int-attributes.c      |  461 ++++++++
 drivers/platform/x86/hp/ordered-attributes.c  |  568 +++++++++
 .../platform/x86/hp/passwdattr-interface.c    |   50 +
 .../platform/x86/hp/passwdobj-attributes.c    |  640 ++++++++++
 drivers/platform/x86/hp/spmobj-attributes.c   |  408 +++++++
 drivers/platform/x86/hp/string-attributes.c   |  447 +++++++
 .../platform/x86/hp/sureadmin-attributes.c    |  984 ++++++++++++++++
 .../platform/x86/hp/surestart-attributes.c    |  145 +++
 17 files changed, 6419 insertions(+), 1 deletion(-)
 create mode 100644 drivers/platform/x86/hp/Kconfig
 create mode 100644 drivers/platform/x86/hp/Makefile
 create mode 100644 drivers/platform/x86/hp/biosattr-interface.c
 create mode 100644 drivers/platform/x86/hp/bioscfg.c
 create mode 100644 drivers/platform/x86/hp/bioscfg.h
 create mode 100644 drivers/platform/x86/hp/enum-attributes.c
 create mode 100644 drivers/platform/x86/hp/int-attributes.c
 create mode 100644 drivers/platform/x86/hp/ordered-attributes.c
 create mode 100644 drivers/platform/x86/hp/passwdattr-interface.c
 create mode 100644 drivers/platform/x86/hp/passwdobj-attributes.c
 create mode 100644 drivers/platform/x86/hp/spmobj-attributes.c
 create mode 100644 drivers/platform/x86/hp/string-attributes.c
 create mode 100644 drivers/platform/x86/hp/sureadmin-attributes.c
 create mode 100644 drivers/platform/x86/hp/surestart-attributes.c

-- 
2.34.1

