Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EB38C7619A
	for <platform-driver-x86@archiver.kernel.org>; Mon, 27 Mar 2023 11:29:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229692AbjC0L3z (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 27 Mar 2023 07:29:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbjC0L3y (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Mar 2023 07:29:54 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8345B49EA
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Mar 2023 04:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679916534;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=rkuxBgcicCbLlAWCMSm6u84bCBuR5ufAzUhgm80rCGs=;
        b=Iig7wtyw/Ile8X2T2UF1yAHW9kDKk/PQntgZWb50nrxBz1BiN+kfP25gPm5NY33iPTvTWC
        Muz/3euoGR9uIJAPjQ0mCMYixi5oAQOvF0Eei4VwCk1KUr7RxyKDpY/33c3iMQCAGVe6Cs
        KI6KnNnsty6aGDBHIetHE5mkWvygIGI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-193-9cG8sKJDN_CRis6kw5fQLQ-1; Mon, 27 Mar 2023 07:28:53 -0400
X-MC-Unique: 9cG8sKJDN_CRis6kw5fQLQ-1
Received: by mail-ed1-f72.google.com with SMTP id f15-20020a50a6cf000000b0050050d2326aso12037463edc.18
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Mar 2023 04:28:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679916532;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rkuxBgcicCbLlAWCMSm6u84bCBuR5ufAzUhgm80rCGs=;
        b=BW8GVjjYSP3gYu08jtw+4q/LL7pq8DR/F3Bswzj8viXgmBxtWmfTMujnco3DiC/E4J
         kcJwthc/nMH0h0vPqSqjR/v/2uvJD31/T/LapGt4sHXWhHaIyrJ3MiufvCES7l9Vp5oK
         hvmvh/HsvxCZnTHxOJqb6+7WBhQN84liMwwfohyYbPdUO6gE8M+eTarROymZ6GBCDzI1
         C83TYlGCETimbeXj4DrAPJ+vEuQXMkkQ7fmTY716iyprI2Y7Iqdg/wDBFkB5SpJ/iRl/
         qIXX9t6RCptppXNysXbNwRQUFPvXQXCNrzxpCgvoSmCwX+VmA0VOaQIZfqRnEf/vukJi
         WW3Q==
X-Gm-Message-State: AAQBX9do4COQSUa4K9dFMwoWQIpTWeVPN5KzR7hIpdk1RfBBMOl3TBAn
        +YyVLK2tOGk1KIytWFMb/pC83NmhjRf1r+s+mLrvI5ldg5kNZ4vRM41yzIfy3IkIooyPkcr7C0x
        l/LGpkAuu97u5xgH+TKISauT9zPKrPg4EEbJAELGi0g==
X-Received: by 2002:a17:907:c70c:b0:91e:acf4:b009 with SMTP id ty12-20020a170907c70c00b0091eacf4b009mr12954745ejc.22.1679916531812;
        Mon, 27 Mar 2023 04:28:51 -0700 (PDT)
X-Google-Smtp-Source: AKy350YCRAcl533WfxbmZNPNJHMPSUJR4lGWp+1hNdlqCIqDzgiSFMXFE9EE7PfxAGnoFuWK0b0u0A==
X-Received: by 2002:a17:907:c70c:b0:91e:acf4:b009 with SMTP id ty12-20020a170907c70c00b0091eacf4b009mr12954735ejc.22.1679916531579;
        Mon, 27 Mar 2023 04:28:51 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id q11-20020a1709064c8b00b00932ebffdf4esm12904064eju.214.2023.03.27.04.28.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 04:28:50 -0700 (PDT)
Message-ID: <faa15528-9143-7f60-f534-c59f2f6c1ebe@redhat.com>
Date:   Mon, 27 Mar 2023 13:28:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From:   Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] platform-drivers-x86 for 6.3-3
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

Here is the second round of fixes for platform-drivers-x86 for 6.3.

Highlights:
 -  Intel tpmi/vsec fixes
 -  think-lmi fixes
 -  2 other small fixes / hw-id additions

Regards,

Hans


The following changes since commit 1a0009abfa7893b9cfcd3884658af1cbee6b26ce:

  platform: mellanox: mlx-platform: Initialize shift variable to 0 (2023-03-07 12:08:30 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.3-3

for you to fetch changes up to acd0acb802b90f88d19ad4337183e44fd0f77c50:

  platform/surface: aggregator: Add missing fwnode_handle_put() (2023-03-22 15:23:03 +0100)

----------------------------------------------------------------
platform-drivers-x86 for v6.3-3

Highlights:
 -  Intel tpmi/vsec fixes
 -  think-lmi fixes
 -  2 other small fixes / hw-id additions

The following is an automated git shortlog grouped by driver:

platform/surface:
 -  aggregator: Add missing fwnode_handle_put()

platform/x86 (gigabyte-wmi):
 -  Add support for A320M-S2H V2

platform/x86/intel:
 -  tpmi: Revise the comment of intel_vsec_add_aux
 -  tpmi: Fix double free in tpmi_create_device()
 -  vsec: Fix a memory leak in intel_vsec_add_aux

think-lmi:
 -  Add possible_values for ThinkStation
 -  only display possible_values if available
 -  use correct possible_values delimiters
 -  add missing type attribute

----------------------------------------------------------------
Dongliang Mu (3):
      platform/x86/intel: vsec: Fix a memory leak in intel_vsec_add_aux
      platform/x86/intel: tpmi: Fix double free in tpmi_create_device()
      platform/x86/intel: tpmi: Revise the comment of intel_vsec_add_aux

Frank Crawford (1):
      platform/x86 (gigabyte-wmi): Add support for A320M-S2H V2

Liang He (1):
      platform/surface: aggregator: Add missing fwnode_handle_put()

Mark Pearson (4):
      platform/x86: think-lmi: add missing type attribute
      platform/x86: think-lmi: use correct possible_values delimiters
      platform/x86: think-lmi: only display possible_values if available
      platform/x86: think-lmi: Add possible_values for ThinkStation

 drivers/platform/surface/aggregator/bus.c |  4 ++-
 drivers/platform/x86/gigabyte-wmi.c       |  1 +
 drivers/platform/x86/intel/tpmi.c         | 23 ++++--------
 drivers/platform/x86/intel/vsec.c         |  1 +
 drivers/platform/x86/think-lmi.c          | 60 +++++++++++++++++++++++++++++--
 5 files changed, 69 insertions(+), 20 deletions(-)

