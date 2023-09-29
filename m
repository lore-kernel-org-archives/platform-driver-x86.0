Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5857AE7F154
	for <platform-driver-x86@archiver.kernel.org>; Fri, 29 Sep 2023 11:32:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232803AbjI2Lc5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 29 Sep 2023 07:32:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229687AbjI2Lc5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 29 Sep 2023 07:32:57 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FB81DE
        for <platform-driver-x86@vger.kernel.org>; Fri, 29 Sep 2023 04:32:53 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-5041cc983f9so22164983e87.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 29 Sep 2023 04:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695987171; x=1696591971; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LTKwNWsLtH3P5OiCMjIf1WhtdlxvdJ9kgp2R6+i59kA=;
        b=aL/etJcvc6ED8AeE0rnndkUmxIS2BKw6M0X5M28oa9coX1STH9cal3f4Ua61y0OnRF
         IXzYYYv8RbqDNfHeqTUiGkWULPJWCc7ejxJzLxt8vF1nrJTNhKTArzsffMuBTT1ydzZ5
         s4l/muCZ9hkpJbZ3kdo7cIRapnZvpJrv9qa84s6Y1JFMGdR1em1Lryb4aP3TOFZvCIpi
         sGs7e2Ddp0SYZ/h0W+xUq/74Jp28PEwxv60PANDZORLacz+uWtJwA3aXuZ7dpdd1U7vG
         PT9jWOY0s0uPZfKWdD5tjdAu1Ux6klMdZ7/QluuZiux1p8ScYuc4URqhf83SokxzAhNV
         sXdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695987171; x=1696591971;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LTKwNWsLtH3P5OiCMjIf1WhtdlxvdJ9kgp2R6+i59kA=;
        b=u2YI0qcq8sLUoHVYaqJzn/WEjQ5KovBulpk2BYn52OICLlkUGKKV3sR2k8qXm1p6Um
         uWUFteCmFkSxBVbGesJyPgB2oCst3/6uh08XJ1YxMi+OasqPSCc8JFp53kyGuxGTvY1w
         0LkEcPIRiQrYO27pArFF/jyKlz+2wh0nNtSJC2l9V+bAaJTVB5fgMFXOF1Opfu2BcfGR
         n04MMpkOLvYinj+n/Xar30W/eeM4vJrEOHjMAEhs587+J3eZOB6nwKK/Ri7bxy/47dfM
         RFu1EYtt1f3YmlVIIVB3jU+XynS1bHtTaoAiQba3PN/6K2AqcrhGp+zHe25kBPRpch3T
         tfnw==
X-Gm-Message-State: AOJu0YyrbA+tXDCrivGrk8hg7QAgBpWvrYL03VylDumpGlS82RGOucoR
        VCRTGHhwKNzy6KGxGLfbc/ulWn0IVWo=
X-Google-Smtp-Source: AGHT+IFFHc16qAW5rNAw9KG+ttq5zh5vxzpQ6SXuK5qCNL8fqRwLyYpTSBpzZzmZM5XawEqzkNIuUg==
X-Received: by 2002:a05:6512:743:b0:503:3753:9db9 with SMTP id c3-20020a056512074300b0050337539db9mr3072712lfs.35.1695987171354;
        Fri, 29 Sep 2023 04:32:51 -0700 (PDT)
Received: from localhost.localdomain ([31.173.85.123])
        by smtp.gmail.com with ESMTPSA id l23-20020a19c217000000b00501c77ad909sm3471315lfc.208.2023.09.29.04.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 04:32:51 -0700 (PDT)
From:   Nikita Kravets <teackot@gmail.com>
To:     platform-driver-x86@vger.kernel.org
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Nikita Kravets <teackot@gmail.com>,
        Aakash Singh <mail@singhaakash.dev>,
        Jose Angel Pastrana <japp0005@red.ujaen.es>
Subject: [PATCH 0/2] platform/x86: msi-ec: add and fix EC configs
Date:   Fri, 29 Sep 2023 14:31:47 +0300
Message-ID: <20230929113149.587436-1-teackot@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi!

This patch series adds EC configs for more firmware (patch 2)
and fixes a couple of issues with an existing configuration (patch 1)
in the msi-ec driver.

Cc: Aakash Singh <mail@singhaakash.dev>
Cc: Jose Angel Pastrana <japp0005@red.ujaen.es>

Nikita Kravets (2):
  platform/x86: msi-ec: Fix the 3rd config
  platform/x86: msi-ec: Add more EC configs

 drivers/platform/x86/msi-ec.c | 486 +++++++++++++++++++++++++++++++++-
 drivers/platform/x86/msi-ec.h |   4 +-
 2 files changed, 478 insertions(+), 12 deletions(-)

-- 
2.42.0

