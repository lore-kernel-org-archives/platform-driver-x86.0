Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E154E81E0D
	for <platform-driver-x86@archiver.kernel.org>; Fri,  6 Oct 2023 15:41:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232754AbjJFPl3 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 6 Oct 2023 11:41:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232387AbjJFPl3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 6 Oct 2023 11:41:29 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 925A89E
        for <platform-driver-x86@vger.kernel.org>; Fri,  6 Oct 2023 08:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696606841;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=nALYOKCC0YiRzy6N9xbW1yp3uBd9CydAHdfvHs8i1Ek=;
        b=QLW0yNygPnY2OO/L75usoEfSvOnFenT4FHvU5CBv7WDa5Cnl7rYMT7siUcUXRMsBV1DOaZ
        DRj+A5Vhvw5/bY1hmdEfg6mAtYvpVEQqAGc3/eifomE9bT/69CAzaHNqMa8m/5fuOvwyC4
        XfuxrPDWYp9gtSTKoL0R5KUSRJSqo/I=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-BL5X0JaBP9GnbggwA1D0AQ-1; Fri, 06 Oct 2023 11:40:30 -0400
X-MC-Unique: BL5X0JaBP9GnbggwA1D0AQ-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-99bcb13d8ddso197089566b.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 06 Oct 2023 08:40:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696606829; x=1697211629;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nALYOKCC0YiRzy6N9xbW1yp3uBd9CydAHdfvHs8i1Ek=;
        b=tYINT+kwM57v1JK4VOs4xsi//NA6T2JOVIiXsVMbN8PsS1gJv2iEVh6IyLID7VszXY
         esUs1PxwYZI6FzeJ5OC23doRcBYyy9iB9DYD7aw6e3zDWIcuHYGZ5dPkKJ7FImfOiW06
         oc5mg02iI55O9svoVBx9BKvjgJSBGwb0PMh5lCJT7YKMbAe5HQahLy+CLk05TKsOQCQv
         KtiRsWMHRUIl7ueGl44Gsq1g9+Z2NLXgMqf8a+ASTY2aB6FZcXqaSH2j3cK2klDUPSAh
         pG7PNU6fFsI8y5EyYqmKPPI5AO0WL9fwUONEeaP959HmlVWPtiAbp0ToHrr7d9jG2WC3
         91hw==
X-Gm-Message-State: AOJu0YymjEkooDUrzwHBSfwTnnMD3lgTals+YUd98Ip3NdCZ+6fYIhja
        hyrYaRrGYZckswRRRZPdsXhF0cg6Tz5dbFOCWKvhhOpiOOUJ2gQMFFw98RUp4QIyzj+Jmxla5QU
        oHJXOFZvAkGAps4mlCKmPemyaYujMxQ0QSg==
X-Received: by 2002:a17:906:c5:b0:9ad:c763:bc7a with SMTP id 5-20020a17090600c500b009adc763bc7amr7013508eji.23.1696606829477;
        Fri, 06 Oct 2023 08:40:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFo+NWYA55pWF3/tO6Eh9I2TvUI8nzqrZ/Y9eKKlSbQTOVC8TQHC6/PsAs8r7kuRIv7BWrj8g==
X-Received: by 2002:a17:906:c5:b0:9ad:c763:bc7a with SMTP id 5-20020a17090600c500b009adc763bc7amr7013490eji.23.1696606829146;
        Fri, 06 Oct 2023 08:40:29 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id x20-20020a170906299400b00997c1d125fasm3088382eje.170.2023.10.06.08.40.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Oct 2023 08:40:28 -0700 (PDT)
Message-ID: <41cdbbf9-f270-d6ba-8c8e-5f06cc264b93@redhat.com>
Date:   Fri, 6 Oct 2023 17:40:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From:   Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] platform-drivers-x86 for 6.6-4
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

Here is the third round of fixes for platform-drivers-x86 for 6.6.

Nothing really special, just a few bug fixes, build warning fixes and
DMI quirk additions.

Regards,

Hans


The following changes since commit bc3b6f59463ba9f4367a80331213db491766b5a1:

  MAINTAINERS: Add x86 platform drivers patchwork (2023-09-21 18:03:03 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.6-4

for you to fetch changes up to 5b44abbc39ca15df80d0da4756078c98c831090f:

  platform/x86: hp-wmi:: Mark driver struct with __refdata to prevent section mismatch warning (2023-10-06 15:09:40 +0200)

----------------------------------------------------------------
platform-drivers-x86 for v6.6-4

Bug fixes, build warning fixes and DMI quirk additions for pdx86 for 6.6.

The following is an automated git shortlog grouped by driver:

hp-bioscfg:
 -  Fix reference leak

hp-wmi:
 -  Mark driver struct with __refdata to prevent section mismatch warning

platform/mellanox:
 -  tmfifo: fix kernel-doc warnings

platform/x86/intel/ifs:
 -  release cpus_read_lock()

think-lmi:
 -  Fix reference leak

touchscreen_dmi:
 -  Add info for the Positivo C4128B
 -  Add info for the BUSH Bush Windows tablet

----------------------------------------------------------------
Armin Wolf (2):
      platform/x86: think-lmi: Fix reference leak
      platform/x86: hp-bioscfg: Fix reference leak

Jithu Joseph (1):
      platform/x86/intel/ifs: release cpus_read_lock()

Randy Dunlap (1):
      platform/mellanox: tmfifo: fix kernel-doc warnings

Renan Guilherme Lebre Ramos (1):
      platform/x86: touchscreen_dmi: Add info for the Positivo C4128B

Tomasz Swiatek (1):
      platform/x86: touchscreen_dmi: Add info for the BUSH Bush Windows tablet

Uwe Kleine-König (1):
      platform/x86: hp-wmi:: Mark driver struct with __refdata to prevent section mismatch warning

 drivers/platform/mellanox/mlxbf-tmfifo.c     | 14 +++++----
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c | 14 ++++++---
 drivers/platform/x86/hp/hp-wmi.c             |  8 ++++-
 drivers/platform/x86/intel/ifs/runtest.c     |  7 +++--
 drivers/platform/x86/think-lmi.c             | 24 ++++++++++++---
 drivers/platform/x86/touchscreen_dmi.c       | 45 ++++++++++++++++++++++++++++
 6 files changed, 94 insertions(+), 18 deletions(-)

