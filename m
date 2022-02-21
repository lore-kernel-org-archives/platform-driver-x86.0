Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70C35C433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon, 21 Feb 2022 16:01:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379796AbiBUQCG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 21 Feb 2022 11:02:06 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:38956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379794AbiBUQCF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 21 Feb 2022 11:02:05 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A6EB660F3
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Feb 2022 08:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1645459300;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=Cb1gv6npfu4idu3pHayrR5ukHhJ7mVg0cNNyTZcjOlg=;
        b=det+QqT3A2qK7dVzurkmGnPXqTroHR+8vxQ30Rp99/PmBctS4s7BPLyK4VU4jCzHpesQuK
        nFa1RgW8K6RGzVxYN7/aAAh5fZvvAszJ2+v+qwDSRK8N2lpDXAJ67iE+h1dKg8kl5k3X9w
        uH3Elpmc5oQb7Y5qx/HyhmzKXJrmuDY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-84-kVcoIepFPliYWwOxbFpuEw-1; Mon, 21 Feb 2022 11:01:38 -0500
X-MC-Unique: kVcoIepFPliYWwOxbFpuEw-1
Received: by mail-ej1-f72.google.com with SMTP id ky6-20020a170907778600b0068e4bd99fd1so4805753ejc.15
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Feb 2022 08:01:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:from
         :subject:to:cc:content-language:content-transfer-encoding;
        bh=Cb1gv6npfu4idu3pHayrR5ukHhJ7mVg0cNNyTZcjOlg=;
        b=Nrzb9SbO0szNyVO+mgO3G+Oee0I41u35G7hLKJP4x/Kt1wutdmQArc56XEP7m4eYb7
         2Urq7uTckjYPEYlEHZDwIUuPDMsr11F6c8jUyi5bGJ08NixVb48GKKEguQH91aw/UyLZ
         hTj8qyK6rD8Vlr0bFBw4qsvlPoxpzHG4h4imGPaF2kZ0Ff2HFGcINmoXgfguXGCBF0BO
         IJhvBLpWFbTrlJQKCdgcIvE/Cg39NHwSK6tqyFcMky0gV1HVbHt/UsGOFVegW9Z0emnX
         yQdBsiL+f60L6nRwa/tqK8VSMKjYnCYTu/O4RMNy5brRWqlNxSOaFMyqRBZIoJ3adH7I
         mX1A==
X-Gm-Message-State: AOAM5334iP0aNiRMzrSQzmQMZErH5sM4i7Xf7/r17sPAMyIZG0MQnIpb
        rKeq0O0fkQdFcUuIAzedxWJ1fYzNKl3E9nHljRBtq386ZJHuP9pdd+5J6UJmEioECzgFQ/kkpuX
        LOHJ0lodlHTIGWMZBYjEjQMqcRBzjYMBxFA==
X-Received: by 2002:a17:906:53d2:b0:6ce:791a:31a0 with SMTP id p18-20020a17090653d200b006ce791a31a0mr16369875ejo.59.1645459297325;
        Mon, 21 Feb 2022 08:01:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwQ1J7D2THN1JbfyPMJMRpe1+M995BN4S2ZExUKXgG16/2e3xBSYaRnoxPZNOtQ13w1L5z9pw==
X-Received: by 2002:a17:906:53d2:b0:6ce:791a:31a0 with SMTP id p18-20020a17090653d200b006ce791a31a0mr16369855ejo.59.1645459297072;
        Mon, 21 Feb 2022 08:01:37 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id f29sm5360647ejl.12.2022.02.21.08.01.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Feb 2022 08:01:36 -0800 (PST)
Message-ID: <7ea773bf-c020-c815-fe1c-8401dbc6a86e@redhat.com>
Date:   Mon, 21 Feb 2022 17:01:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
From:   Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] platform-drivers-x86 for 5.17-3
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
for 5.17.

This consists of 2 small fixes and 1 hardware-id addition.

Regards,

Hans


The following changes since commit 836f35f79153ce09d813c83f341dba4481996966:

  platform/x86: thinkpad_acpi: Fix incorrect use of platform profile on AMD platforms (2022-02-01 15:37:00 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v5.17-3

for you to fetch changes up to ae09639e3b2a0291b37b122c94dd4f773cd4e513:

  platform/x86: int3472: Add terminator to gpiod_lookup_table (2022-02-21 14:47:59 +0100)

----------------------------------------------------------------
platform-drivers-x86 for v5.17-3

2 small fixes and 1 hardware-id addition.

The following is an automated git shortlog grouped by driver:

asus-wmi:
 -  Fix regression when probing for fan curve control

int3472:
 -  Add terminator to gpiod_lookup_table

thinkpad_acpi:
 -  Add dual-fan quirk for T15g (2nd gen)

----------------------------------------------------------------
Daniel Scally (1):
      platform/x86: int3472: Add terminator to gpiod_lookup_table

Hans de Goede (2):
      platform/x86: thinkpad_acpi: Add dual-fan quirk for T15g (2nd gen)
      platform/x86: asus-wmi: Fix regression when probing for fan curve control

 drivers/platform/x86/asus-wmi.c                          | 2 +-
 drivers/platform/x86/intel/int3472/tps68470_board_data.c | 3 ++-
 drivers/platform/x86/thinkpad_acpi.c                     | 1 +
 3 files changed, 4 insertions(+), 2 deletions(-)

