Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CBF8C433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 28 Apr 2022 12:32:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231824AbiD1Mfv (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 28 Apr 2022 08:35:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346314AbiD1Mft (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 28 Apr 2022 08:35:49 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 001D7AF1E7
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Apr 2022 05:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651149154;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=79ijUU1b0VRmLKbXz4qgsT0z7n1OHeYnxMCv7eaIW+M=;
        b=NojOdHRgy8xdf2aaBCevbBpf23ODn7js9dxR2kDyK4tbYdLcJu7MRFOKuP3gSoI02G5TAC
        ewK8KLGWfpj9yg0HiHRQ5hc50Yz63Gx8mLfOY00IzpylSox/VuwlSbhnH1UEWAJC9Bi+fL
        Pn8mlNANWKckBNODxs5JMpi0ENaJiDI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-171-LGcPlhx4OUC4fqLH9sOG1Q-1; Thu, 28 Apr 2022 08:32:32 -0400
X-MC-Unique: LGcPlhx4OUC4fqLH9sOG1Q-1
Received: by mail-ed1-f72.google.com with SMTP id l14-20020aa7cace000000b003f7f8e1cbbdso2672255edt.20
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Apr 2022 05:32:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:from
         :subject:to:cc:content-language:content-transfer-encoding;
        bh=79ijUU1b0VRmLKbXz4qgsT0z7n1OHeYnxMCv7eaIW+M=;
        b=VTBKkJo6oceBMzPu+dbs9vYo6fHGobxEDjQmPL6T9IxoPG10SfZ06MykkMTqTy4+jo
         OOi0iwSB4vgisMqtPRLnAyP7pVX3dJR1skr46jHK3HpA0Y8uFp8MhxNJroVWJb/PlLCd
         ImJyFm/RaBMecb34/4ZQhldbLL7xuDN/rnd8IQrkvcQxAk82XvqlI4Wz47dpuARSkzkk
         ZhEiGM8+kWDa39bkFQ9REAsGoUpmn10DTipMMBNPqKZnBkWIJLQoZq8Hh7LIE1bkEjI9
         VFqQHHaYc09z68Bimikeg+a6ndPYRBpjmUWLB544614fIBUOoVByq52z3z0yQpKGHi3w
         8Rjg==
X-Gm-Message-State: AOAM533IF94NRUYdQwbQ0zE9jvS5QtFxufUUGu6bwSL1t1TOTD95h9yv
        3lbYfKjvnd/pBu3Llgqq5GLxj/n5lnIgG58lIxMN6tWTbMXnH8MTo9cQrGn8SjlhvwYdN1PWvng
        ZgoDvPChPk2HT0g2ixrhJM4zj/bLYkP8HoQ==
X-Received: by 2002:a05:6402:1698:b0:425:f339:80ef with SMTP id a24-20020a056402169800b00425f33980efmr18247479edv.225.1651149151491;
        Thu, 28 Apr 2022 05:32:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwYjIWNYosD45YvuSoiB3jXXzi9dlVmimt3o+fubvnpzx7imtEdfiVLtQkurUQXLRnblwe5kw==
X-Received: by 2002:a05:6402:1698:b0:425:f339:80ef with SMTP id a24-20020a056402169800b00425f33980efmr18247464edv.225.1651149151293;
        Thu, 28 Apr 2022 05:32:31 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id a25-20020a056402169900b0042617ba63c8sm1533454edv.82.2022.04.28.05.32.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Apr 2022 05:32:30 -0700 (PDT)
Message-ID: <d6954974-3ee8-9573-f906-c141165cd4b7@redhat.com>
Date:   Thu, 28 Apr 2022 14:32:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
From:   Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] platform-drivers-x86 for 5.18-3
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

Here is the second round of bug-fixes for platform-drivers-x86
for 5.18.

Highlights:
- asus-wmi bug-fixes
- intel-sdsi bug-fixes
- build (warning) fixes
- couple of hw-id additions

Regards,

Hans


The following changes since commit 753ee989f7cf0c0a76a7f56956827a8863a60f97:

  platform/x86: amd-pmc: Fix compilation without CONFIG_SUSPEND (2022-04-04 16:26:09 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v5.18-3

for you to fetch changes up to eb2fd9b43fae0c51982ac4229535b6cfd77380db:

  platform/x86/intel: pmc/core: change pmc_lpm_modes to static (2022-04-27 16:55:54 +0200)

----------------------------------------------------------------
platform-drivers-x86 for v5.18-3

Highlights:
- asus-wmi bug-fixes
- intel-sdsu bug-fixes
- build (warning) fixes
- couple of hw-id additions

The following is an automated git shortlog grouped by driver:

asus-wmi:
 -  Fix driver not binding when fan curve control probe fails
 -  Potential buffer overflow in asus_wmi_evaluate_method_buf()

dell-laptop:
 -  Add quirk entry for Latitude 7520

gigabyte-wmi:
 -  added support for B660 GAMING X DDR4 motherboard

intel-uncore-freq:
 -  Prevent driver loading in guests

platform/x86/intel:
 -  pmc/core: change pmc_lpm_modes to static

platform/x86/intel/sdsi:
 -  Fix bug in multi packet reads
 -  Poll on ready bit for writes
 -  Handle leaky bucket

tools/power/x86/intel-speed-select:
 -  fix build failure when using -Wl,--as-needed

----------------------------------------------------------------
Dan Carpenter (1):
      platform/x86: asus-wmi: Potential buffer overflow in asus_wmi_evaluate_method_buf()

Darryn Anton Jordan (1):
      platform/x86: gigabyte-wmi: added support for B660 GAMING X DDR4 motherboard

David E. Box (3):
      platform/x86/intel/sdsi: Handle leaky bucket
      platform/x86/intel/sdsi: Poll on ready bit for writes
      platform/x86/intel/sdsi: Fix bug in multi packet reads

Gabriele Mazzotta (1):
      platform/x86: dell-laptop: Add quirk entry for Latitude 7520

Hans de Goede (1):
      platform/x86: asus-wmi: Fix driver not binding when fan curve control probe fails

Herton R. Krzesinski (1):
      tools/power/x86/intel-speed-select: fix build failure when using -Wl,--as-needed

Srinivas Pandruvada (1):
      platform/x86: intel-uncore-freq: Prevent driver loading in guests

Tom Rix (1):
      platform/x86/intel: pmc/core: change pmc_lpm_modes to static

 drivers/platform/x86/asus-wmi.c                    | 15 +++++---
 drivers/platform/x86/dell/dell-laptop.c            | 13 +++++++
 drivers/platform/x86/gigabyte-wmi.c                |  1 +
 drivers/platform/x86/intel/pmc/core.h              |  2 +-
 drivers/platform/x86/intel/sdsi.c                  | 44 +++++++++++++++-------
 .../x86/intel/uncore-frequency/uncore-frequency.c  |  3 ++
 tools/power/x86/intel-speed-select/Makefile        |  2 +-
 7 files changed, 59 insertions(+), 21 deletions(-)

