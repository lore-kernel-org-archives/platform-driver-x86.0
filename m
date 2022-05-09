Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38FA0C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 May 2022 07:46:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229662AbiEIHtU (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 9 May 2022 03:49:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236744AbiEIHdD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 May 2022 03:33:03 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 514A710DC
        for <platform-driver-x86@vger.kernel.org>; Mon,  9 May 2022 00:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1652081275;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=V2c9vBmEzL9GnOTwGUFGbuZHpMHymiK976kVFmr4dm0=;
        b=ANpSGgeqFsTwCdcld7hd1sMBf4MFaopChjXMzpr++jsxNrmKBFS80BxrhClRejZIesLmfJ
        ZhPm2QlM0KCZGBgNVAO3yDHrKpexW6D9rSDTm6nzhxClV1ybOCDkghagD2KG1DVBxBSfHG
        pyzPU2PA4R8/AD/5MLtLqc41HWHcy0E=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-ebefpZfXNoS016HRueEjrg-1; Mon, 09 May 2022 03:27:53 -0400
X-MC-Unique: ebefpZfXNoS016HRueEjrg-1
Received: by mail-ej1-f72.google.com with SMTP id x2-20020a1709065ac200b006d9b316257fso6244903ejs.12
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 May 2022 00:27:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:from
         :subject:to:cc:content-language:content-transfer-encoding;
        bh=V2c9vBmEzL9GnOTwGUFGbuZHpMHymiK976kVFmr4dm0=;
        b=gk61KxxHF+PotNBnZ4umBFU9MX9uv7Iu+X7kHMIoY8qO02wF6hSw0aQiXnoIbdJXmH
         eULIpIpxdeOym5q/kvjnKIWoN0dshHJlJjieOlMdfTValhrlcoYZwdPqW5/VtpLzHNUO
         8Ej62lkEZXP+mKUaQNDeR32oWfLgH13jYUl0wTn/3rjL9iuvezaSA151INvDb9hltQg2
         BE+Luw/JF3cUsGi3pe5bQgBdMPF39KMx7jx8NO1uZwAdYLc/L4Rem62POK/WVPJKu8//
         ixgK/Dg97v4ZIenx7GYbH+YoW7pJ4iPbqk18A6rt3G5Fmf7bpaTEuScX9ysEJSzdzF68
         aPww==
X-Gm-Message-State: AOAM530SmlJieH2QlgcAbaw1PVlcGkrp/2IvjsSzQnVm4MowIQaLYBuT
        1/PTnrDZpEX+XTwoA9Yz0YHmRoEHxLPdeFKIHY4S0tBVY3rMEKl4q4ZA8k/JpiKJzSMr0ydrpIL
        6zva/xzb5nqkj51kSnwg5SC2P3fQPmSjWjw==
X-Received: by 2002:a05:6402:4256:b0:428:39:c6c7 with SMTP id g22-20020a056402425600b004280039c6c7mr15465374edb.374.1652081272625;
        Mon, 09 May 2022 00:27:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxtLYjqjd+JSRhyz+2aHDlDZujkKSuS44yxRLRXeGdCffdJgodAPLKfV+vb4QTZPqFG8D2GdQ==
X-Received: by 2002:a05:6402:4256:b0:428:39:c6c7 with SMTP id g22-20020a056402425600b004280039c6c7mr15465361edb.374.1652081272439;
        Mon, 09 May 2022 00:27:52 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id k14-20020aa7c04e000000b0042617ba639asm5967014edo.36.2022.05.09.00.27.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 May 2022 00:27:52 -0700 (PDT)
Message-ID: <d9007c58-71a2-e081-c609-fbf04855b591@redhat.com>
Date:   Mon, 9 May 2022 09:27:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
From:   Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] platform-drivers-x86 for 5.18-4
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Linus,

Here is a third round of bug-fixes for platform-drivers-x86
for 5.18:

 -  thinkpad_acpi AMD suspend/resume + fan detection fixes
 -  2 other small fixes
 -  1 hardware-id addition

Regards,

Hans


The following changes since commit eb2fd9b43fae0c51982ac4229535b6cfd77380db:

  platform/x86/intel: pmc/core: change pmc_lpm_modes to static (2022-04-27 16:55:54 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v5.18-4

for you to fetch changes up to 44acfc22c7d055d9c4f8f0974ee28422405b971a:

  platform/surface: aggregator: Fix initialization order when compiling as builtin module (2022-05-06 13:05:57 +0200)

----------------------------------------------------------------
platform-drivers-x86 for v5.18-4

3th set of pdx86 fixes for 5.18:
 -  thinkpad_acpi AMD suspend/resume + fan detection fixes
 -  2 other small fixes
 -  1 hardware-id addition

The following is an automated git shortlog grouped by driver:

platform/surface:
 -  aggregator: Fix initialization order when compiling as builtin module
 -  gpe: Add support for Surface Pro 8

platform/x86/intel:
 -  Fix 'rmmod pmt_telemetry' panic

thinkpad_acpi:
 -  Correct dual fan probe
 -  Add a s2idle resume quirk for a number of laptops
 -  Convert btusb DMI list to quirks

----------------------------------------------------------------
Mario Limonciello (2):
      platform/x86: thinkpad_acpi: Convert btusb DMI list to quirks
      platform/x86: thinkpad_acpi: Add a s2idle resume quirk for a number of laptops

Mark Pearson (1):
      platform/x86: thinkpad_acpi: Correct dual fan probe

Maximilian Luz (2):
      platform/surface: gpe: Add support for Surface Pro 8
      platform/surface: aggregator: Fix initialization order when compiling as builtin module

Prarit Bhargava (1):
      platform/x86/intel: Fix 'rmmod pmt_telemetry' panic

 drivers/platform/surface/aggregator/core.c |   2 +-
 drivers/platform/surface/surface_gpe.c     |   8 ++
 drivers/platform/x86/intel/pmt/telemetry.c |   2 +-
 drivers/platform/x86/thinkpad_acpi.c       | 175 +++++++++++++++++++++++++++--
 4 files changed, 173 insertions(+), 14 deletions(-)

