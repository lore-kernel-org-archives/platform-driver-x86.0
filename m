Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 044DCC433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon,  7 Mar 2022 22:09:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237520AbiCGWKa (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 7 Mar 2022 17:10:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232229AbiCGWK3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 7 Mar 2022 17:10:29 -0500
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FE4B49FBD
        for <platform-driver-x86@vger.kernel.org>; Mon,  7 Mar 2022 14:09:34 -0800 (PST)
Received: by mail-ot1-x335.google.com with SMTP id t8-20020a0568301e2800b005b235a56f2dso2991086otr.9
        for <platform-driver-x86@vger.kernel.org>; Mon, 07 Mar 2022 14:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2ZvQfKeLVCcQMJ5iHiBQd1KvX1UEGyxBfnXVsEPboPU=;
        b=dohP/1Oceckr7Zgo4JSeC8Wt9iYVxpXe+WboOuJtyfkE6uWgHRxnxvWWzRoLK/siNW
         mFfitAIb1bvPXsIu1UlBZZHOMF2WkK6w5RF65bM9MpCDJStILVyngpDJr31ymFWnS6Pl
         F2dY1vxEovhxse8jX+afGaz18WlCLRRtgGFM6aLYEpqdNdnDoW5TK4lkyzaz0S6FHusK
         UwScQTNv73nV8/XK4qe53eXbFG2xZqYZoiJd1FHwFxON37+xF3yBqg6TV3M8yu0+8Omc
         2nOyhHgHaqaptAoZe+b+o6eyZfa7RBsjxJSwW1A1eQyjqtlJ6FFMihnoOc73xTO0HWPX
         ClgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2ZvQfKeLVCcQMJ5iHiBQd1KvX1UEGyxBfnXVsEPboPU=;
        b=w8ku+l7hk8Z4g+VzcvuMzE+YuouHAr3TFsiCaw9LjENM2JX+0kY+u13fnWh4RHPKjx
         OxvtqW5l2PpoDgRXlAYsc7B6LStks4R5jI0mAt2mw93ZVF/PnD2k96614gS+EwXij6U1
         wGmpTq7i7EmcJDzdnsGHA2Ax1DPs8DzbDorOs46o+p/e7KsvuOI6oL5mKyHX3vPjGhbW
         Me07VczUz7YE2iHR5GE4awJCpM1yKfIMjqRf4vaetD9x7S0qeevQUDIN7naBp9SKOh//
         IrqYfh0lYWiTBiULjqsVO4LCMXEtHg5ExTtq0EMVdM0IofBwQ1Y/ZpOg0XRgmCiqEbgB
         ToDQ==
X-Gm-Message-State: AOAM532+7AbToPdQADbL3z0FNslaAeO8cS01bVQjGVS3NBF9saAeYXOQ
        MJzq91k9/MvEs3/C4MXTCpRJsFxOwGg=
X-Google-Smtp-Source: ABdhPJwkBw5VjtTzUM+EjqsH+wKD3Zkkd0vCghU1UjXfP941sD2a36+5cSLG9TX2FBW74Dqf7ceAow==
X-Received: by 2002:a05:6830:1687:b0:5ad:4b8f:a3bf with SMTP id k7-20020a056830168700b005ad4b8fa3bfmr6825634otr.365.1646690973560;
        Mon, 07 Mar 2022 14:09:33 -0800 (PST)
Received: from grumpy-vm.hsd1.tx.comcast.net ([2601:2c3:480:7390:c8fd:9e42:5ced:850e])
        by smtp.gmail.com with ESMTPSA id z25-20020a056808065900b002d97bda386esm6892644oih.51.2022.03.07.14.09.32
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 14:09:33 -0800 (PST)
From:   Jorge Lopez <jorgealtxwork@gmail.com>
X-Google-Original-From: Jorge Lopez <jorge.lopez2@hp.com>
To:     platform-driver-x86@vger.kernel.org
Subject: [PATCH v4 0/3] Fix SW_TABLET_MODE detection method
Date:   Mon,  7 Mar 2022 16:09:29 -0600
Message-Id: <20220307220932.23607-1-jorge.lopez2@hp.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The intension for this patch was to address SW_TABLET_MODE detection 
problem.  It is during the initial investigation; two other issues were 
identified and are related to the initial task.  

First, several WMI queries were reporting error 0x05 including 
HPWMI_HARDWARE_QUERY that is responsible for returning dock and table 
modes values. See patch v3 part 2 comments for list of WMI queries 
affected.  The driver now reports the appropriate states and values 
correctly.

Lastly, a limiting data size restriction was discovered. 
struct bios_args data member size limits all possible WMI commands 
to those requiring buffer size of 128 bytes or less.  Several WMI 
commands and queries require a buffer size larger than 128 bytes 
hence limiting current and new feature supported by the driver. 
hp_wmi_perform_query function changed to handle the memory 
allocation and release of any required buffer size. 

Jorge Lopez (3):
  Fix SW_TABLET_MODE detection method
  Fix 0x05 error code reported by several WMI calls
  Changing bios_args.data to be dynamically allocated

 drivers/platform/x86/hp-wmi.c | 161 +++++++++++++++++++++++-----------
 1 file changed, 109 insertions(+), 52 deletions(-)

-- 
2.25.1

