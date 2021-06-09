Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D8F6C48BCD
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Jun 2021 17:23:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 26230613CA
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Jun 2021 17:23:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231519AbhFIRZJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 9 Jun 2021 13:25:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34479 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231515AbhFIRZI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 9 Jun 2021 13:25:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623259392;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=peNQguMIZxsiTtT/t38MJAly3Hcz6eiRy0HbljXWio4=;
        b=VAfjwtwdlF5Ifvpahkf30nbdbpyayyN3kGVXvvqeV+zJ2Iq2CYnzQfV6jiUOMsfC5LEcY7
        RGXH179WQ5eXt53s+aAkg5XtiagrukZZHuAHj5/CbShasQBK2lRbQvBQkNYs/Mb88YHdk/
        nAbmwKV785YMg+M/BKEEsEe9RdPx2WY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-dSpZd0xuO26PY0nejgB8yg-1; Wed, 09 Jun 2021 13:23:10 -0400
X-MC-Unique: dSpZd0xuO26PY0nejgB8yg-1
Received: by mail-ej1-f70.google.com with SMTP id hz18-20020a1709072cf2b02903fbaae9f4faso8300475ejc.4
        for <platform-driver-x86@vger.kernel.org>; Wed, 09 Jun 2021 10:23:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=peNQguMIZxsiTtT/t38MJAly3Hcz6eiRy0HbljXWio4=;
        b=RYI1BXUiZzTMylgZSE56604enuRvGzidGzgOIs7X3QVvkoBB4sbodnbUhA4Z+u1Da2
         DdzhJ/zzh1uFCwxVMVdMKohytoKyDjxLnwo63YCuh5/lkeog7Qqy9Et+1kvp9pLkWQYD
         C80VVs4EihePzEp2jWgeP2YHVStLB4utMIEkS2HozR9qcKycISw+XAMM43Ji+KZ3eSEG
         027BaVgBx+Z01e3D9qk4l9GRNThyjMFx5hT8clvxc1I4NGOyQB4EdJDqIqC9tkfk8n6S
         /NOkt8+MMriQT9Fw+vfUvvpKvyjIykX0q6UJNsos1xz/n7m0mjf9rKsZ0/pHy/QGSqJB
         6rAA==
X-Gm-Message-State: AOAM533rxGmP1aLxWp7Ifvh7armoQ9o39rbmOUQV6E5wcV+JDhJcR8An
        wbsy6eGwnONAGZ9BwW2JwDd0frfNZ87+zhwKNe07ZUJnCAMWu6D5x/blPWN3a3C89Q9Xbiz2LHd
        KPycQgN970gKFAIt+V225NYchWwiSoDOSkZPyg/p64pfLd65CFdjPDjZRI33TnlgqlJ5PxLyL+7
        h/PCwra2Y52A==
X-Received: by 2002:a05:6402:5a:: with SMTP id f26mr515577edu.306.1623259389329;
        Wed, 09 Jun 2021 10:23:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyknKH2uiTBUeCGPhqnlCmEMhOzuj4jQmm2WzSOkynDnzdAldpkRtK2yvTxGj4868DxwKg3Hg==
X-Received: by 2002:a05:6402:5a:: with SMTP id f26mr515557edu.306.1623259389156;
        Wed, 09 Jun 2021 10:23:09 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id i25sm122999ejg.103.2021.06.09.10.23.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jun 2021 10:23:08 -0700 (PDT)
From:   Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] platform-drivers-x86 for 5.13-3
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org
Message-ID: <f389f824-2a3f-e0fb-2120-7bfa0baf7bb1@redhat.com>
Date:   Wed, 9 Jun 2021 19:23:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Linus,

Here is a second set of bug-fixes and some hardware-id additions for platform-drivers-x86 for 5.13.

Note the mlxreg-hotplug revert is a regression-fix.

Regards,

Hans


The following changes since commit e68671e9e1275dfdda333c3e83b6d28963af16b6:

  platform/x86: touchscreen_dmi: Add info for the Chuwi Hi10 Pro (CWI529) tablet (2021-05-20 14:11:03 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v5.13-3

for you to fetch changes up to 701b54bcb7d0d72ee3f032afc900608708409be0:

  platform/mellanox: mlxreg-hotplug: Revert "move to use request_irq by IRQF_NO_AUTOEN flag" (2021-06-04 22:03:13 +0200)

----------------------------------------------------------------
platform-drivers-x86 for v5.13-3

Assorted pdx86 bug-fixes and some hardware-id additions for 5.13.

The following is an automated git shortlog grouped by driver:

platform/mellanox:
 -  mlxreg-hotplug: Revert "move to use request_irq by IRQF_NO_AUTOEN flag"

platform/surface:
 -  dtx: Add missing mutex_destroy() call in failure path
 -  aggregator: Fix event disable function
 -  aggregator_registry: Add support for 13" Intel Surface Laptop 4
 -  aggregator_registry: Update comments for 15" AMD Surface Laptop 4

thinkpad_acpi:
 -  Add X1 Carbon Gen 9 second fan support

----------------------------------------------------------------
Maximilian Luz (4):
      platform/surface: aggregator_registry: Update comments for 15" AMD Surface Laptop 4
      platform/surface: aggregator_registry: Add support for 13" Intel Surface Laptop 4
      platform/surface: aggregator: Fix event disable function
      platform/surface: dtx: Add missing mutex_destroy() call in failure path

Mykola Kostenok (1):
      platform/mellanox: mlxreg-hotplug: Revert "move to use request_irq by IRQF_NO_AUTOEN flag"

Til Jasper Ullrich (1):
      platform/x86: thinkpad_acpi: Add X1 Carbon Gen 9 second fan support

 drivers/platform/mellanox/mlxreg-hotplug.c             | 4 ++--
 drivers/platform/surface/aggregator/controller.c       | 2 +-
 drivers/platform/surface/surface_aggregator_registry.c | 7 +++++--
 drivers/platform/surface/surface_dtx.c                 | 1 +
 drivers/platform/x86/thinkpad_acpi.c                   | 1 +
 5 files changed, 10 insertions(+), 5 deletions(-)

