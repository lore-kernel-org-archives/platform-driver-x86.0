Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDC12C04A95
	for <platform-driver-x86@archiver.kernel.org>; Tue, 25 Oct 2022 09:58:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231797AbiJYJ6g (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 25 Oct 2022 05:58:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231751AbiJYJ6O (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 25 Oct 2022 05:58:14 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B363F17C169
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Oct 2022 02:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666691585;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=EtrW71D5/2sPWM7kdpNEu7omKbDnLBRaRCZse75RN24=;
        b=QQ7GqgiROqwNihh5xpWeymUpLIh0ZBEcTt7mqRP16dDDKdZGe3+iGWGMORSc0P6zF+eXvj
        2gd5wqRl5eLL1dDe/hInjx97l8Ado2xyoC0OrHCb+pkCb9ld2GnTjIKmJx5YVd+0RE86Pp
        Hv5/9vHdDALa8+MXPk4HfukKgYC28Gk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-668-GUyHsxd0MqqQuijZKWtxwQ-1; Tue, 25 Oct 2022 05:53:04 -0400
X-MC-Unique: GUyHsxd0MqqQuijZKWtxwQ-1
Received: by mail-ed1-f70.google.com with SMTP id b14-20020a056402278e00b004621a2642d7so856522ede.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Oct 2022 02:53:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EtrW71D5/2sPWM7kdpNEu7omKbDnLBRaRCZse75RN24=;
        b=L6lOxjTJUrJiomc/tXnaeEtqe17lJkl8CEmt8Re92Wb+/HmMnCuKFnqp2Wk5ET/aYs
         OcjePlvJ9Wodp1qlETLYDDA01r9DxG625KX0i0/4Zj3phyY/PDfEqPqu+rFENnm6NnHC
         reGZ7O1+HDpmaGPhVWEY2LS6aPIYKhqVEVNg+Zdf1Xu+1ze+W35Z2woaC1GV4riK0OD+
         nsGB4RTYnMrK/4bCio1CmBrk+oJq/ezDruS215Ixkeb60eqmomxQw6fvCM2mkSi3V/RJ
         L+QEkOhKxmgSQdkz90rOqQyiK7MJ87JSQtfHMr5vOe5tLvmk2x1yF0Hh9qkaoAp/KRZ0
         yCEw==
X-Gm-Message-State: ACrzQf1xBHssdSHEbR6CAubOz8ssSOT4jlvtjSd/AqJmV59U6GOmUkbZ
        fgQvqBFYQDVgE8ovFA0n2r2vn0UTb0RQ+P/kL6bM/iZ9tfLAJna5kpruGL8JQ50dRL1Vnbh3jEY
        3MiJPsZTzRp1zc+pAZDS/Kgc52krUp4keeg==
X-Received: by 2002:a17:907:2c71:b0:79e:8603:72c6 with SMTP id ib17-20020a1709072c7100b0079e860372c6mr17250277ejc.172.1666691582329;
        Tue, 25 Oct 2022 02:53:02 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5UdWVp2QHWe3GuycJ8wnLjKKaJcsY9oYSs676/vqh3nm58pjFII9O6z3LyFVUZl1FBqX3rgg==
X-Received: by 2002:aa7:c14f:0:b0:460:e1cc:2c29 with SMTP id r15-20020aa7c14f000000b00460e1cc2c29mr24718596edp.423.1666691571384;
        Tue, 25 Oct 2022 02:52:51 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id o6-20020a17090611c600b007919ba4295esm1072639eja.216.2022.10.25.02.52.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Oct 2022 02:52:50 -0700 (PDT)
Message-ID: <9256cedf-151d-724b-1e39-fe016fce8a44@redhat.com>
Date:   Tue, 25 Oct 2022 11:52:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
From:   Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] platform-drivers-x86 for 6.1-2
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

Here is the first round of fixes for platform-drivers-x86 for 6.1.

The only thing which stands out is a fix for a backlight regression
on Chromebooks (under drivers/acpi, with ack from Rafael).

Other then that nothing special to report just various small fixes
and hardware-id additions.

Regards,

Hans


The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.1-2

for you to fetch changes up to e9cf4d9b9a6fdb1df6401a59f5ac5d24006bfeae:

  ACPI: video: Fix missing native backlight on Chromebooks (2022-10-24 17:02:13 +0200)

----------------------------------------------------------------
platform-drivers-x86 for v6.1-2

A small set of assorted fixes and hardware-id additions for 6.1.

The following is an automated git shortlog grouped by driver:

ACPI:
 -  video: Fix missing native backlight on Chromebooks

asus-wmi:
 -  Add support for ROG X16 tablet mode

leds:
 -  simatic-ipc-leds-gpio: fix incorrect LED to GPIO mapping

platform/x86/amd:
 -  pmc: Read SMU version during suspend on Cezanne systems

platform/x86/intel:
 -  pmc/core: Add Raptor Lake support to pmc core driver

thinkpad_acpi:
 -  Fix reporting a non present second fan on some models

----------------------------------------------------------------
Dmitry Osipenko (1):
      ACPI: video: Fix missing native backlight on Chromebooks

Gayatri Kammela (1):
      platform/x86/intel: pmc/core: Add Raptor Lake support to pmc core driver

Henning Schild (1):
      leds: simatic-ipc-leds-gpio: fix incorrect LED to GPIO mapping

Jelle van der Waa (1):
      platform/x86: thinkpad_acpi: Fix reporting a non present second fan on some models

Luke D. Jones (1):
      platform/x86: asus-wmi: Add support for ROG X16 tablet mode

Mario Limonciello (1):
      platform/x86/amd: pmc: Read SMU version during suspend on Cezanne systems

 drivers/acpi/video_detect.c                 | 12 ++++++++++++
 drivers/leds/simple/simatic-ipc-leds-gpio.c | 12 ++++++------
 drivers/platform/x86/amd/pmc.c              |  7 +++++++
 drivers/platform/x86/asus-nb-wmi.c          |  9 +++++++++
 drivers/platform/x86/intel/pmc/core.c       |  2 ++
 drivers/platform/x86/thinkpad_acpi.c        |  4 +++-
 6 files changed, 39 insertions(+), 7 deletions(-)

