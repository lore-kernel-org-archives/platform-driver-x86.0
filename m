Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37FC3C433F5
	for <platform-driver-x86@archiver.kernel.org>; Fri,  4 Mar 2022 20:31:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230118AbiCDUcf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 4 Mar 2022 15:32:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230120AbiCDUc1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 4 Mar 2022 15:32:27 -0500
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DB141E747E
        for <platform-driver-x86@vger.kernel.org>; Fri,  4 Mar 2022 12:31:33 -0800 (PST)
Received: by mail-qt1-x82d.google.com with SMTP id bc10so8425396qtb.5
        for <platform-driver-x86@vger.kernel.org>; Fri, 04 Mar 2022 12:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SzyztJ5GRz/Bab7ba8IwVJyzNlv8p3R99wbJp7O+MoI=;
        b=anPH+pBPigDblFt9rcebNAO+V3mIS7m8HEqbllkLggeluyoHmWzwFlRB8a+K06OQVL
         g4EL5gkUOPn2JDt7aiVezzMPLltk50MisS5I20xMFo06SWziorfusa43UtdJo81kD0qG
         MJm6lYgKNu4RQZpZ5/hkVrYWh4kqD2DZ8st41B/2HKbfXjgxVlZyHyAe18Jm5uYvrfW/
         tMt2X3O6n6eXnqwAWWgAKC49/cC3gh+sLyphI/VAVQ2kcb7SHOam0nk4oK/fLnm4s5Xu
         3uwcPwn0reftKUBf6/KbRrqRE7R8Xz1DtOZpkK4k65Ghsp6wBGFBUNmGwooyoZvMWoOG
         nGaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SzyztJ5GRz/Bab7ba8IwVJyzNlv8p3R99wbJp7O+MoI=;
        b=JCOJiCq8PxyaLF5No+vBpvJ3b58WZZygm3cS5727PCObPTygfpvnTlxvqT7hm11dJl
         oMYohOxsxKrGl3OKhvymIQ84k4hPO0yO8uYlR8EawROEgTtk9Ew3G61Mr2sXeKJk80hS
         7wnZGLj/nSJ/aBPwmteIPDaUcXeO1aoavJ+o/ZYuSZfs3zkXSnnUtS6nKFdgWlpV5mXP
         RzhX2MlCFkjCIap7TPRmi/JVsMiZZ2+pzymaQIbnXGyCGTDUyEDtSoLd/HagHF9darS/
         nAGEQdhaktbTgmrbGswFqDSRc99IezwQbLJNK/ofFOSl/IcQNOzwBUZvmcbcF6tSgtPF
         JQzw==
X-Gm-Message-State: AOAM531/K7gBJgnZOwpzwE2SbENNt9z/YVCN4Qlf60llNBdzxDu7i82p
        +obL16g1ie9wYTBzyvtS9xBpbZjjdT8=
X-Google-Smtp-Source: ABdhPJxQLr3Mt3YXY+QH8zBP4D/NVoXj/9p3oVnK8P1aoJ9qCNmBI9mI3i95PWyokXejWo11Q4H6hg==
X-Received: by 2002:ac8:5b56:0:b0:2cc:2dc9:9a89 with SMTP id n22-20020ac85b56000000b002cc2dc99a89mr493135qtw.182.1646425892331;
        Fri, 04 Mar 2022 12:31:32 -0800 (PST)
Received: from grumpy-vm.hsd1.tx.comcast.net ([2601:2c3:480:7390:27a2:529c:40d3:26aa])
        by smtp.gmail.com with ESMTPSA id de18-20020a05620a371200b00662cf4b5631sm2974513qkb.23.2022.03.04.12.31.31
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 12:31:31 -0800 (PST)
From:   Jorge Lopez <jorgealtxwork@gmail.com>
X-Google-Original-From: Jorge Lopez <jorge.lopez2@hp.com>
To:     platform-driver-x86@vger.kernel.org
Subject: [PATCH v3 0/3] Fix SW_TABLET_MODE detection method
Date:   Fri,  4 Mar 2022 14:31:27 -0600
Message-Id: <20220304203130.43150-1-jorge.lopez2@hp.com>
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

 drivers/platform/x86/hp-wmi.c | 119 ++++++++++++++++++++++------------
 1 file changed, 76 insertions(+), 43 deletions(-)

-- 
2.25.1

