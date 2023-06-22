Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BBFCEB64DA
	for <platform-driver-x86@archiver.kernel.org>; Thu, 22 Jun 2023 08:27:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230229AbjFVI1A (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 22 Jun 2023 04:27:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230234AbjFVI0u (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 22 Jun 2023 04:26:50 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD69B1FE6
        for <platform-driver-x86@vger.kernel.org>; Thu, 22 Jun 2023 01:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687422364;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=S+Ti1dqnxp8NEPmpHi6JTw6FRUjLwFr7pvodcLGKjZo=;
        b=VHA4kDo+VtNbywhsju7nqy1rLqNGrDoxEvOGyP2+g6DzpSucCc+rKyh8Fr0ukT5wEmxKjU
        6MwYwmU94jSqG/gDI5GTUXPLst8gfFtPdXxbjpKVU9S6F9itQdbIv9b6hrc2WjqbBk0T9E
        auwlxVvN6Vlu43Yj+psCkDtmYiRTxeI=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-cORYkH1mMkKV7h-EJi3YYw-1; Thu, 22 Jun 2023 04:26:02 -0400
X-MC-Unique: cORYkH1mMkKV7h-EJi3YYw-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-9892f7b022eso45021366b.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 22 Jun 2023 01:26:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687422361; x=1690014361;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S+Ti1dqnxp8NEPmpHi6JTw6FRUjLwFr7pvodcLGKjZo=;
        b=VfYmGtu6NrUNNQDl5tAr5J0E+BL+zB7dOnMivPC/h7NMT0iMFqKecLfzcwMlBCqWGs
         HeS8yySifzk2Gwc6uiq7IfDtcc4TWoLD9ydHvHbCKza2rTdnJ3QVk4JnlvUO+za9OLFa
         2V0vvahAjOgmfIZ5kPR65zq5ol1Ocwy4fGNIefgVsgaVh/B/BEACkDmtti3xIARij0SZ
         8piccP3byhaSCLyw3jXnAvqHfflOc++o9/xWmpGUdIfvkYCxp24Ol1X/Hcd+pv96UuCa
         2862aUfJHXYbFR5pLLTrT1tqJTtvsgx+GrlgIZaxxnwD+UlJKo0gDFOVE5YJdEjhfMFv
         w1+g==
X-Gm-Message-State: AC+VfDzQRsnxmW7DE7NMg42AwJS93NnEucE5rsgsECMalVEtFxyRVhce
        NjuFgeNS5qiNehU6blvyWUVo+n1Kb8bRSFwfw5j+SbYw2ipfeiyF7U7zI1uTSYsYCBbU9vunV9r
        IAKEzD2Qnq6KEAvPKlyu+tlEcZkUg4ZYaF7ItCJMd+w==
X-Received: by 2002:a17:907:d8c:b0:987:3ef4:e6be with SMTP id go12-20020a1709070d8c00b009873ef4e6bemr12995742ejc.12.1687422361096;
        Thu, 22 Jun 2023 01:26:01 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6rCNJx6oxLNWwvzwXRnr5zb55xl350wq0EtNMj7cb0kJcS0UPYSC5XDChWFHVGJmhYUsDb5A==
X-Received: by 2002:a17:907:d8c:b0:987:3ef4:e6be with SMTP id go12-20020a1709070d8c00b009873ef4e6bemr12995730ejc.12.1687422360803;
        Thu, 22 Jun 2023 01:26:00 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id f3-20020a1709062c4300b009887bb956e0sm4276940ejh.103.2023.06.22.01.25.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jun 2023 01:26:00 -0700 (PDT)
Message-ID: <075d2f89-aa61-ce14-edb1-f56cfcc90bcf@redhat.com>
Date:   Thu, 22 Jun 2023 10:25:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From:   Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] platform-drivers-x86 for 6.4-5
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org,
        =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Linus,

Here is one last pull-request for 6.4 with a small fix for an AMD PMF driver
issue which is causing issues for users of just released AMD laptop models.

Regards,

Hans


The following changes since commit fb109fba728407fa4a84d659b5cb87cd8399d7b3:

  platform/x86: int3472: Avoid crash in unregistering regulator gpio (2023-05-30 12:10:22 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.4-5

for you to fetch changes up to 146b6f6855e7656e8329910606595220c761daac:

  platform/x86/amd/pmf: Register notify handler only if SPS is enabled (2023-06-22 10:20:00 +0200)

----------------------------------------------------------------
platform-drivers-x86 for v6.4-5

One small fix for an AMD PMF driver issue which is causing issues
for users of just released AMD laptop models.

The following is an automated git shortlog grouped by driver:

platform/x86/amd/pmf:
 -  Register notify handler only if SPS is enabled

----------------------------------------------------------------
Shyam Sundar S K (1):
      platform/x86/amd/pmf: Register notify handler only if SPS is enabled

 drivers/platform/x86/amd/pmf/core.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

