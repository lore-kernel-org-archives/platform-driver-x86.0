Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEA3FC76196
	for <platform-driver-x86@archiver.kernel.org>; Thu,  6 Apr 2023 09:52:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236391AbjDFJwb (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 6 Apr 2023 05:52:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236370AbjDFJv6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 6 Apr 2023 05:51:58 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74A437EC6
        for <platform-driver-x86@vger.kernel.org>; Thu,  6 Apr 2023 02:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680774543;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=1Yxg8/NohpMkUI9kgckbkMqSggfHgNmj7IZRmk35CHc=;
        b=ENJ7ZChCjW/1pAns0/qw7rzw2FQBsznfeoVIEDtxl2TyyySGGx5LF+IHFtVVTuDuYugE7n
        CdblQBNGiOa4NafHLWsq71nFrLAr/Te99qaGJHgV7RoWldNUtTKOqUumOE9r8b8RH9FCzO
        d3C0XjYyWYF0pn+e0LLs+NMkPNSQfuY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-jmyiGB3YNvyyh1WkDscwqw-1; Thu, 06 Apr 2023 05:49:00 -0400
X-MC-Unique: jmyiGB3YNvyyh1WkDscwqw-1
Received: by mail-ed1-f69.google.com with SMTP id i17-20020a50d751000000b005045c08ca6dso813393edj.7
        for <platform-driver-x86@vger.kernel.org>; Thu, 06 Apr 2023 02:49:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680774539; x=1683366539;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1Yxg8/NohpMkUI9kgckbkMqSggfHgNmj7IZRmk35CHc=;
        b=ikf1HdhPGjGRU+mYFF9Hcbu1e3a90z8rS2/LJJZZZxZWCUs9x+smmJQVIJcch5OmBr
         wS/gjPcGkMUDx/nhnyB/UJf2ufPtGNIH/d01N6pmgfXk68ouA5EEllfRYfV6kmYSdFXk
         S+jyzHze3eotZ9yrQG7M73kZ5mOYh9aJiC+qE56UWIRcseT3cp6xYImBbhpMIUbpXRvH
         /14DpPzZ8KPw2ALmQB9AvJD1cHC8f7uS9BS44RwU8TW5uvhb4I99TPrUsKFYc20kS+ue
         o+WLcCqbLHukAJ5HkKWG1FDHZvdaKGOag2q+P/GlUPFDKlqijExJOHjW+Z6wAojRWCpp
         cr/A==
X-Gm-Message-State: AAQBX9ewO1x4FPrTDnaBsGYHdmrMusmGS4DPPUt6eXMYgrO5Yaq5ZDKS
        rX8AEGwhPKZBhNYi9HWaFvXPKdh4lsgGIAdxtpJ1yzYgopM/QtUJ3vXrfmwwDZQFyaB4VyDpdA3
        YRCczIRZb00qF1aT1Q/Pvm7oUn2sWjcSFQvNmY7giFg==
X-Received: by 2002:a17:906:7315:b0:930:e53e:759b with SMTP id di21-20020a170906731500b00930e53e759bmr7672272ejc.11.1680774538933;
        Thu, 06 Apr 2023 02:48:58 -0700 (PDT)
X-Google-Smtp-Source: AKy350YIhpliq4YDYu7kfmb0VoXG1T09gat7l/4xuEDCgKrspb5WJObFo4ihh3LOrtRvsKP48pXPFw==
X-Received: by 2002:a17:906:7315:b0:930:e53e:759b with SMTP id di21-20020a170906731500b00930e53e759bmr7672256ejc.11.1680774538675;
        Thu, 06 Apr 2023 02:48:58 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id t19-20020a50d713000000b005021d17d896sm521157edi.21.2023.04.06.02.48.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 02:48:58 -0700 (PDT)
Message-ID: <93693a29-ea2a-3e6a-6581-f336abcffc80@redhat.com>
Date:   Thu, 6 Apr 2023 11:48:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From:   Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] platform-drivers-x86 for 6.3-5
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Linus,

Here is another (small) round of fixes for platform-drivers-x86 for 6.3.

Highlights:
 -  more think-lmi fixes
 -  1 DMI quirk addition

Regards,

Hans


The following changes since commit e3271a5917d1501089b1a224d702aa053e2877f4:

  platform/x86: ideapad-laptop: Stop sending KEY_TOUCHPAD_TOGGLE (2023-03-31 19:37:18 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.3-5

for you to fetch changes up to 9a469c6dfab38326f99f105386db84230be09ee3:

  platform/x86: thinkpad_acpi: Add missing T14s Gen1 type to s2idle quirk list (2023-04-03 11:57:27 +0200)

----------------------------------------------------------------
platform-drivers-x86 for v6.3-5

Highlights:
 -  more think-lmi fixes
 -  1 DMI quirk addition

The following is an automated git shortlog grouped by driver:

think-lmi:
 -  Clean up display of current_value on Thinkstation
 -  Fix memory leaks when parsing ThinkStation WMI strings
 -  Fix memory leak when showing current settings

thinkpad_acpi:
 -  Add missing T14s Gen1 type to s2idle quirk list

----------------------------------------------------------------
Armin Wolf (1):
      platform/x86: think-lmi: Fix memory leak when showing current settings

Benjamin Asbach (1):
      platform/x86: thinkpad_acpi: Add missing T14s Gen1 type to s2idle quirk list

Mark Pearson (2):
      platform/x86: think-lmi: Fix memory leaks when parsing ThinkStation WMI strings
      platform/x86: think-lmi: Clean up display of current_value on Thinkstation

 drivers/platform/x86/think-lmi.c     | 20 +++++++++++++-------
 drivers/platform/x86/thinkpad_acpi.c |  8 ++++++++
 2 files changed, 21 insertions(+), 7 deletions(-)

