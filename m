Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33AC2C433B4
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Apr 2021 10:08:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F3D9461382
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Apr 2021 10:08:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347081AbhDGKIU (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 7 Apr 2021 06:08:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38391 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1350763AbhDGKIM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Apr 2021 06:08:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617790083;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=nBCxJ0o3bINWUeTY8uTJzzPW9J0E58tiHX6VMm19G10=;
        b=OTJoLFDY4jbbIGhej5FoI1yfZlyKVGVzkXMh52fn0tRnq8AD1TO3vinICJIz+p/8bvPjiT
        09X+mqiDEco6NArHGa0xNuQ3/DGxbcOrgKRv1LEXbdtm+EaV1AUR5BaSPmsa2CmSQXNM1l
        PEZeSpqHJztvzz8nxJXSVoKkihnWLos=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-0v8NxwOjP2K_rozoXr53sw-1; Wed, 07 Apr 2021 06:08:01 -0400
X-MC-Unique: 0v8NxwOjP2K_rozoXr53sw-1
Received: by mail-ed1-f71.google.com with SMTP id q12so11843734edv.9
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 Apr 2021 03:08:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=nBCxJ0o3bINWUeTY8uTJzzPW9J0E58tiHX6VMm19G10=;
        b=oJPrJHzl/0H+K5Ad97CVq2ZbBJhrQBsYiBzqZONMphb+3YP5yQodGcRah8A1dWcNxY
         ka5w0QgsoxYbaFnwSjSCUQ9kmFNZyT4KXqFVJXAL9+86djxa2NvUWrhG2Ujm15Rg9ter
         Z/iZRBJmJi4TZqTWI2JHWFQRYLdk/WLJqPAxhVOK0yVGJIoHROB3L694zRgDFeTbzTjV
         qkXTkp8LGYvYDvryvzG+Tqo6V81qFpR3ml6qFDcTsmgBGm0HoD4tQa988HN2A0cLG3k3
         QTuuQR9uljwK2NOgFiVTgV97A2q3Otydnf+99IBr6bqICVgPVhKA5mG9L0Iai/DCSnt/
         0R+Q==
X-Gm-Message-State: AOAM531IYiEf5i8nLvvR3CKHAPV4UqhI6Q1+ByY/mtemBdrmWlLOGjY7
        Ft3QAMlmtD0vtB9+FNXAhbtW802MDElJVek/xh3YWgmLyJ5h/0NVFYP6o+QE43XBlp0iqr37sYn
        PXjDp81JIYw1vrP8g02oSbSgTuH1jb2x8zK7cmwHQwitFEChcpwDSw8Z7NMniczMJabHm+sGFxk
        6zkGJvlSK+UA==
X-Received: by 2002:a05:6402:350b:: with SMTP id b11mr3358478edd.288.1617790080375;
        Wed, 07 Apr 2021 03:08:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz37LDfDUorLC4jq3U3yk6+qlw0n7GzMMUh2QtX9o1jduRD0upLoLdKWceKNNibQzX52x8Ksg==
X-Received: by 2002:a05:6402:350b:: with SMTP id b11mr3358454edd.288.1617790080173;
        Wed, 07 Apr 2021 03:08:00 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id bq18sm8334584ejb.27.2021.04.07.03.07.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Apr 2021 03:07:59 -0700 (PDT)
From:   Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] platform-drivers-x86 for 5.12-3
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org
Message-ID: <5dd4526e-b5c2-4071-0f82-6ecbffe085a5@redhat.com>
Date:   Wed, 7 Apr 2021 12:07:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Linus,

Here is a single bugfix (on top of platform-drivers-x86-v5.12-2) to fix
spurious wakeups from suspend caused by recent intel-hid driver changes.

Regards,

Hans


The following changes since commit d1635448f1105e549b4041aab930dbc6945fc635:

  platform/x86: intel_pmc_core: Ignore GBE LTR on Tiger Lake platforms (2021-03-23 21:50:14 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v5.12-3

for you to fetch changes up to a3790a8a94fc0234c5d38013b48e74ef221ec84c:

  platform/x86: intel-hid: Fix spurious wakeups caused by tablet-mode events during suspend (2021-04-06 22:10:21 +0200)

----------------------------------------------------------------
platform-drivers-x86 for v5.12-3

A single bugfix (on top of platform-drivers-x86-v5.12-2) to fix spurious
wakeups from suspend caused by recent intel-hid driver changes.

The following is an automated git shortlog grouped by driver:

intel-hid:
 -  Fix spurious wakeups caused by tablet-mode events during suspend

----------------------------------------------------------------
Hans de Goede (1):
      platform/x86: intel-hid: Fix spurious wakeups caused by tablet-mode events during suspend

 drivers/platform/x86/intel-hid.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

