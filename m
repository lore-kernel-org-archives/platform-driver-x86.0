Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9781FC4707F
	for <platform-driver-x86@archiver.kernel.org>; Mon,  4 Apr 2022 21:37:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382601AbiDDVbd (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 4 Apr 2022 17:31:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380585AbiDDUiZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 4 Apr 2022 16:38:25 -0400
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com [IPv6:2607:f8b0:4864:20::c2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7310B25EB8
        for <platform-driver-x86@vger.kernel.org>; Mon,  4 Apr 2022 13:36:28 -0700 (PDT)
Received: by mail-oo1-xc2b.google.com with SMTP id s203-20020a4a3bd4000000b003191c2dcbe8so1939242oos.9
        for <platform-driver-x86@vger.kernel.org>; Mon, 04 Apr 2022 13:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/ENHVJgFHLd5cojLCsO6sZBsvevegw/gYfgyEPsPFGI=;
        b=e452IM5tjil1XP+V1459oaXJhZTHkzE1+i/f/SadBCl+pC3hN73PyLsh8mxrDba61c
         Y1c6kRH1A6tYRl+jjY+xAeNXzsiUmWf+77/LMTWadj3CstbG0GumFXHltwRcaH/KNNDn
         Ll9NBONVbO4ei0wxUCraPzPc9WkseEM8ys6vWaxc+EYZe847iZjD86MK8sWF5dl6KPHZ
         fSwNhB7tloRj7DVmvAIS+u01y+hpjxwfm0mF+IUWCyLnlyOCCWOtFxVtHB9h2y9xANhf
         vreum75dy6Yh3GTGSZMda9D+zDlR3+kWiHjpCw45IRSlKg9YiJAZN5pZyx9idorqrPqx
         nPWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/ENHVJgFHLd5cojLCsO6sZBsvevegw/gYfgyEPsPFGI=;
        b=uhKDSD/NIhLK9UEb5ChdSq8T4u9ZOOT2QkgBLFil5CYQzGeAKM8bT+tyPTQIRqjx7r
         8BBCiseQItFC0D1AI5wbQJc8T9T4qAZGGSz73b6HNxdtkxDuu+PFYVj72MILgpF1rTCW
         yxW2I56oQkNuth9zsBVDQXOwpIjzzU1fgT8ha+yR2oxbCay8KIspxBb+FVGv9C75LLRI
         RBUELhKAGOR+e1kL85rLLTiR1xk7dAb+Yh6MToNBqtsfBaykkAU9ug/a+Tyqb+LsZiZJ
         x0QxbfFFx5WL4+6w4zPeOMHUlvLg4FUQUpDwFZa1x96OTRjBjGdJKpKPPuYZro76bkJq
         KDcg==
X-Gm-Message-State: AOAM533ezLgDAxAq1yNgjatBy/UoziYOWKbnspaj6y47FxXjMYItGgYU
        o5VYMpi/icaEkpvTZiP4Eod5Js5Tyrs=
X-Google-Smtp-Source: ABdhPJznj4myV61szOLJKEK+IwskjPu56JEd9ngkyeUbwDZsWUdC4cJ9S41WnGkbSoaigX3C0bnfPw==
X-Received: by 2002:a4a:c449:0:b0:320:f8ac:8f88 with SMTP id h9-20020a4ac449000000b00320f8ac8f88mr34193ooq.94.1649104587622;
        Mon, 04 Apr 2022 13:36:27 -0700 (PDT)
Received: from grumpy-vm.hsd1.tx.comcast.net ([2601:2c3:480:7390:c57b:f63e:33f5:caed])
        by smtp.gmail.com with ESMTPSA id u20-20020a4a9e94000000b003291f6ac4b2sm3765786ook.28.2022.04.04.13.36.26
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 13:36:27 -0700 (PDT)
From:   Jorge Lopez <jorgealtxwork@gmail.com>
X-Google-Original-From: Jorge Lopez <jorge.lopez2@hp.com>
To:     platform-driver-x86@vger.kernel.org
Subject: [PATCH v1 0/6] HP WMI Security Features
Date:   Mon,  4 Apr 2022 15:36:20 -0500
Message-Id: <20220404203626.4311-1-jorge.lopez2@hp.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

These set of patches include new driver support of HP Security Features,
documentation, and other minor changes.

These changes include  documentation for three new security features
introduced in the hp-wmi driver. The security features include
Secure Platform, Management, Sure Admin, and Sure Start.
Each documentation section provides security feature description,
identifies sysfs directories, and files exposed by the driver.

Sure Admin allows the user to configure the system to use a Sure Admin
cryptographic signature-based authorization string that the BIOS will
use to verify authorization to modify the setting.
    
Sure Start provides advanced firmware protection and resiliency by
identifying and repairing unauthorized BIOS changes.  

Secure Platform Management (SPM)  replaces older password-based BIOS settings
management with public key cryptography.  PC secure product management
begins when a target system is provisioned with cryptographic keys that
are used to ensure the integrity of communications between system
management utilities and the BIOS.

Lastly, changes were introduced in preparation to submission of three
security features.  The addition of hp_wmi_groups will simplify the
integration of driver security features.
    

Jorge Lopez (6):
  Correct code style related issues in hp-wmi
  Update hp_wmi_group to simplify feature addition
  Secure Platform Management Security Feature
  Sure Start Security Feature
  Sure Admin Security Feature
  HP Security Features Documentation

 .../ABI/testing/sysfs-platform-hp-wmi         |   96 ++
 Documentation/admin-guide/hp_wmi.rst          |  141 ++
 Documentation/admin-guide/index.rst           |    1 +
 drivers/platform/x86/hp-wmi.c                 | 1298 ++++++++++++++++-
 4 files changed, 1535 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/ABI/testing/sysfs-platform-hp-wmi
 create mode 100644 Documentation/admin-guide/hp_wmi.rst

-- 
2.25.1

