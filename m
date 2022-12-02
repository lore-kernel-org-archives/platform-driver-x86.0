Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AFF2C4332F
	for <platform-driver-x86@archiver.kernel.org>; Fri,  2 Dec 2022 17:36:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233673AbiLBRg0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 2 Dec 2022 12:36:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233736AbiLBRg0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 2 Dec 2022 12:36:26 -0500
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86691E8E3C
        for <platform-driver-x86@vger.kernel.org>; Fri,  2 Dec 2022 09:36:19 -0800 (PST)
Received: by mail-ot1-x331.google.com with SMTP id cn2-20020a056830658200b0066c74617e3dso3344318otb.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 02 Dec 2022 09:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5H8zpnEKVWMbWdocj4v9Sgxhu/tIBti8ud600urSNOk=;
        b=ReWDoRjrgb+PfrfHwNMyuUrfrsgPfURGSDRTNFQ2/Zwk9fmtcDS37u6RX1d69vB45N
         XwJOqyMLrVsntEckTYoCvd6FQ6TsuGHRoKws3ICi9tQl+qlg3LNyEgTdSIijJq4VcF4Q
         MDRu4abNYs2u8MOzEnBROht3nAblJYmktypqPkcXzsVgGmTHMjljAmHv5eFgFmRnv1Y/
         JLK4Ws+JXu2o0xKCk95yg9Y6MmL+8MzyTncliBkzsL5mMDpztkeRW1zEBidTMqMcWio4
         AKYieNLrafMUhQOYMRH1rKU9diDEplTf2rsJjgazxTUmW5CqsqN/BTdllkMpXDknunrm
         Xf3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5H8zpnEKVWMbWdocj4v9Sgxhu/tIBti8ud600urSNOk=;
        b=j2aPzChGAvC0kpinf8XDotR0B5B+BUCigMl2ifeKIOEqQkO2gGwbBko8k0ZVxKr5cl
         2W6eMEBuskVXEaKgCdi9bOz/jz2eRqaYo+dllLHsK21sG0O9kHSWrtPXFjM2ImIClNhS
         1QySbMtVvh9NO90Y0/hP6quwPxDh/+MCHmdxcBtDJxDOKnOCOUiPXvAd7PlMV8vSZS8m
         qKv6wIWRGZfvpb2+3MQROF/f/jI4whLWNn9Sq+wRvkmWVv45YCw0Ri8K1BQKZ6iAuZfD
         U1Ylo8jnwacolxUyWfYCcgcrnlkIL/Iwvn3NmhvJTxJ+T2TZaimjerRBjcxKP2JgGtbj
         GTNw==
X-Gm-Message-State: ANoB5pnjKDAN7WxAHVCPI6H2MCi/ytTgKqde50FtKV6lBj6f4E+lhOhH
        I6flrfS/wKw8MADm5s42cycRnZ/Iid0zXg==
X-Google-Smtp-Source: AA0mqf4gTTOj2GQ+1sMcMLbox2cwmVWOfzTW3gdgGwvbqYaz2r0neEqChFXIws87oMwP/DyO2Dvt7A==
X-Received: by 2002:a05:6830:1604:b0:66c:52cd:cc31 with SMTP id g4-20020a056830160400b0066c52cdcc31mr36795930otr.88.1670002578829;
        Fri, 02 Dec 2022 09:36:18 -0800 (PST)
Received: from grumpy-VECTOR.hsd1.tx.comcast.net ([2601:2c3:480:7390:bec7:8390:5104:e759])
        by smtp.gmail.com with ESMTPSA id n7-20020a056870558700b0013cd709659dsm4371692oao.52.2022.12.02.09.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 09:36:18 -0800 (PST)
From:   Jorge Lopez <jorgealtxwork@gmail.com>
X-Google-Original-From: Jorge Lopez <jorge.lopez2@hp.com>
To:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org
Subject: [PATCH v5 0/5] Introduction of HP-BIOSCFG driver
Date:   Fri,  2 Dec 2022 11:36:11 -0600
Message-Id: <20221202173616.180108-1-jorge.lopez2@hp.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Version 5 restructures the patches submitted in previous versions.
Earlier hp-bioscfg patches were squashed together before creating
the new split.

Version 5.0 breaks down the changes into 5 patches

The driver files were broken down in 5 patches of 3 files each
with exception of patch 1/5

Jorge Lopez (5):
  Introduction of HP-BIOSCFG driver (1)
  Introduction of HP-BIOSCFG driver (2)
  Introduction of HP-BIOSCFG driver (3)
  Introduction of HP-BIOSCFG driver (4)
  Introduction of HP-BIOSCFG driver (5)

 .../testing/sysfs-class-firmware-attributes   |  181 ++-
 MAINTAINERS                                   |    6 +
 drivers/platform/x86/hp/Kconfig               |   16 +
 drivers/platform/x86/hp/Makefile              |    1 +
 drivers/platform/x86/hp/hp-bioscfg/Makefile   |   19 +
 .../x86/hp/hp-bioscfg/biosattr-interface.c    |  283 +++++
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c  | 1066 +++++++++++++++++
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.h  |  673 +++++++++++
 .../x86/hp/hp-bioscfg/enum-attributes.c       |  499 ++++++++
 .../x86/hp/hp-bioscfg/int-attributes.c        |  450 +++++++
 .../x86/hp/hp-bioscfg/ordered-attributes.c    |  549 +++++++++
 .../x86/hp/hp-bioscfg/passwdattr-interface.c  |   51 +
 .../x86/hp/hp-bioscfg/passwdobj-attributes.c  |  631 ++++++++++
 .../x86/hp/hp-bioscfg/spmobj-attributes.c     |  419 +++++++
 .../x86/hp/hp-bioscfg/string-attributes.c     |  425 +++++++
 .../x86/hp/hp-bioscfg/sureadmin-attributes.c  | 1014 ++++++++++++++++
 .../x86/hp/hp-bioscfg/surestart-attributes.c  |  149 +++
 17 files changed, 6430 insertions(+), 2 deletions(-)
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

-- 
2.34.1

