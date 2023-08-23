Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA53DEE49A3
	for <platform-driver-x86@archiver.kernel.org>; Wed, 23 Aug 2023 15:23:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237131AbjHWPXT (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 23 Aug 2023 11:23:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234657AbjHWPXS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 23 Aug 2023 11:23:18 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BFA0E7D
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Aug 2023 08:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1692804088;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=b9aQoG5wWYtUNwiG1wbJ/D0OR4T6nTWAl0MOhHXNNrY=;
        b=jC3M+d8jCC3nUIbTYQqhnrAKnfHE9ZGSFENJgbXt+uC+GUzLqDH5EpjlrnLxY6oZr6Y1Ei
        Bu277bQSyCt6iay3Szd9wwUR8iqL+dopXC0dnlkN8+ObA0aZROYuONJfOlgZVBGkxno6gA
        7RI9jGabysuscp+60ZpkeJrfMGrNScI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-138-FY5gnuAENtWJ1vFUkrUFRA-1; Wed, 23 Aug 2023 11:21:27 -0400
X-MC-Unique: FY5gnuAENtWJ1vFUkrUFRA-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-99bfe6a531bso400344466b.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Aug 2023 08:21:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692804085; x=1693408885;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b9aQoG5wWYtUNwiG1wbJ/D0OR4T6nTWAl0MOhHXNNrY=;
        b=Q/LzMnNOMTIhZMsZxXvYp2eRXPptCaBMCbeQAzIJ6pH5O2vSgyYmcAIxbempWHfj0S
         JF6cy+5oW4KqB1Yoc4Axw8PBgTChVcsAkFmeOW7xTmYvf1/CLb679pTY2MB3JKUuHtcw
         eo+rO+fUOFOwEpqJlJYyD0jhEd+xgqIe598MUw9k/y+VhWNEQTGU30TorV2iXQgXmM7/
         brAL2RHlWiS4fTSCr0Ipp1FW0nJogJUFcvn+Bhaxq5FC77MaydTGrkhsaTMNUQrGBRJ5
         cg/RX7QWix31F8oMGiqJgJevvA6GVCE7psGDnHnLHZ3Rry4C62VoGmgp8EYuW1nN4lgT
         eFJQ==
X-Gm-Message-State: AOJu0YylN7VMznleteDzID9z15TUoNshpqN55eQVtNEQUj4bM4lqK9Em
        aM8/3qJxR9qqX9vphRqdDM9zTmsMdCoyPXdL+0rURn9mbu1Vf5V46owTKlu6l+Lnit1eSvij57N
        181RmH5JP5N43JpnoS9kjIypSZ57I3YwQgLtI1sQqWA==
X-Received: by 2002:a17:907:784f:b0:99d:fc8f:5a34 with SMTP id lb15-20020a170907784f00b0099dfc8f5a34mr10205472ejc.36.1692804084909;
        Wed, 23 Aug 2023 08:21:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWSO2lRijfORc4RMAemUB1OnH+ySoDK7/sfLkj/ZRBS5w/mSp9VeB2uhbEgJw1pi5Z5zJm5g==
X-Received: by 2002:a17:907:784f:b0:99d:fc8f:5a34 with SMTP id lb15-20020a170907784f00b0099dfc8f5a34mr10205458ejc.36.1692804084661;
        Wed, 23 Aug 2023 08:21:24 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id t23-20020a170906269700b00992b50fbbe9sm9950205ejc.90.2023.08.23.08.21.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Aug 2023 08:21:24 -0700 (PDT)
Message-ID: <1526d93d-c4bb-579b-daea-f3581d8a6b71@redhat.com>
Date:   Wed, 23 Aug 2023 17:21:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From:   Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] platform-drivers-x86 for 6.5-5
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org,
        =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Linus,

Here is one last pull-request for 6.5 with 3 small fixes.

Regards,

Hans


The following changes since commit 2b6aa6610dc9690f79d305ca938abfb799a4f766:

  platform/x86: lenovo-ymc: Only bind on machines with a convertible DMI chassis-type (2023-08-13 14:50:25 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.5-5

for you to fetch changes up to 0848cab765c634597636810bf76d0934003cce28:

  platform/mellanox: Fix mlxbf-tmfifo not handling all virtio CONSOLE notifications (2023-08-23 17:13:36 +0200)

----------------------------------------------------------------
platform-drivers-x86 for v6.5-5

Final set of pdx86 fixes for 6.5.

The following is an automated git shortlog grouped by driver:

ideapad-laptop:
 -  Add support for new hotkeys found on ThinkBook 14s Yoga ITL

lenovo-ymc:
 -  Add Lenovo Yoga 7 14ACN6 to ec_trigger_quirk_dmi_table

platform/mellanox:
 -  Fix mlxbf-tmfifo not handling all virtio CONSOLE notifications

----------------------------------------------------------------
André Apitzsch (1):
      platform/x86: ideapad-laptop: Add support for new hotkeys found on ThinkBook 14s Yoga ITL

Shih-Yi Chen (1):
      platform/mellanox: Fix mlxbf-tmfifo not handling all virtio CONSOLE notifications

Swapnil Devesh (1):
      platform/x86: lenovo-ymc: Add Lenovo Yoga 7 14ACN6 to ec_trigger_quirk_dmi_table

 drivers/platform/mellanox/mlxbf-tmfifo.c | 1 +
 drivers/platform/x86/ideapad-laptop.c    | 5 +++++
 drivers/platform/x86/lenovo-ymc.c        | 7 +++++++
 3 files changed, 13 insertions(+)

