Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77838C433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed,  8 Jun 2022 17:16:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231328AbiFHRQa (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 8 Jun 2022 13:16:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229904AbiFHRQT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Jun 2022 13:16:19 -0400
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com [IPv6:2001:4860:4864:20::31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6918D4126C4
        for <platform-driver-x86@vger.kernel.org>; Wed,  8 Jun 2022 10:02:49 -0700 (PDT)
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-e656032735so28022180fac.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 08 Jun 2022 10:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PkvNwl7k5o6vGvofD3GN9ipKIKtyH4SlSWn107gtYwI=;
        b=EPQMgKHAYI4J1NkcSxM1c/yZIVlXAMJmxgx0DXYJZIWVDRPsZOWFFMdL1uLla0FZnj
         18J9CxRVaKCntBniLo5F0trHR7dCrHNPwZyrvj7bGJGPKKk7ZDoomPbk0cZnIBvtUF+a
         iMcf21q5Is+/7DSsfBHOnYURRP6094SlhOo8QBTrJCiasltFZbYwiUGHo6/FUrDOIBIX
         BUB7txefMmJ27ODu34U0Tjh+uJEc9OL4e9zrCCMIerGtG5bLEINfMST01SgHeHr+V+Q/
         jpZIcE+/FHCg1ISXucEXgkMftN8+ouJHdCFG4PLqnzcIJKM6nA46f1KKx110s5YVy+JJ
         BaOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PkvNwl7k5o6vGvofD3GN9ipKIKtyH4SlSWn107gtYwI=;
        b=0J+jm9jWbmhwC5Fn8QtF5xMJ2QC04Nqq7enXa4d0l1VHvpgOuCj3LPhCc/hZGEuPJZ
         izrIYVNPPB6ohhlw7r/7uLsebzTgarQqynMdwnwSemqU+u9Q35j0kFUebTQzAZgxeZXf
         EDVfw58dN4zgu7sMChHJ0McEojKiGPGmmSRIsCa5h6Ra8VDC4PpeJD/GiuiO/vlX+TjD
         SsnwTDo2Yx61kapCNbwZrZCvUIsHJjTFbwfuIUbhc/mETlXHezzI/SdB3nRoYCdvdP9R
         l7Dd8My33IoOOs5ffamB3nNe4EpC98zPHSU2wQ41epF6sUCqxqg3NMUPrnmlU2T3RqnJ
         4TmQ==
X-Gm-Message-State: AOAM530Us3uBbCw85ecQjFb3V+OxFSzyMnzp+TbqtXnEViwQySnaD2L3
        s5MDxFVInXqfjZBOVIUiYNYlorLcrTw=
X-Google-Smtp-Source: ABdhPJzIRD3Z5f09ERp++Px8FEOkE9y9Vi+dMf2d4GOZlw4fpThe/fEkHlCWIUK5zLwtnkAJ7rrPFw==
X-Received: by 2002:a05:6870:89a8:b0:f1:97d2:931a with SMTP id f40-20020a05687089a800b000f197d2931amr3017300oaq.82.1654707768652;
        Wed, 08 Jun 2022 10:02:48 -0700 (PDT)
Received: from grumpy-vm.hsd1.tx.comcast.net ([2601:2c3:480:7390:e5f7:48da:3306:a654])
        by smtp.gmail.com with ESMTPSA id g24-20020a544f98000000b00325cda1ffb4sm11411196oiy.51.2022.06.08.10.02.27
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 10:02:36 -0700 (PDT)
From:   Jorge Lopez <jorgealtxwork@gmail.com>
X-Google-Original-From: Jorge Lopez <jorge.lopez2@hp.com>
To:     platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 0/2] Resolve-WMI-query-failures-on-some-devices
Date:   Wed,  8 Jun 2022 12:02:18 -0500
Message-Id: <20220608170220.5751-1-jorge.lopez2@hp.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The intention for this patch is resolve WMI query failures reported
in several HP OMEN notebooks.  WMI queries fail on some devices where
the ACPI method HWMC unconditionally attempts to create Fields beyond
the buffer if the buffer is too small, this breaks essential features
such as power profiles.


Description of changes between version 1 and version 2
------------------------------------------------------
v2 patch 1: Resolve-WMI-query-failures-on-some-devices
            - No new changes to the logic.

v2 patch 2: Organize-declaration-variables
            - Organize declared variables in hp_wmi_perform_query method

Jorge Lopez (2):
  Resolve WMI query failures on some devices
  Organize declaration variables

 drivers/platform/x86/hp-wmi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

-- 
2.25.1

