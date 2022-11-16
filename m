Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91458C4332F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Nov 2022 11:02:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229695AbiKPLCe (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 16 Nov 2022 06:02:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231641AbiKPLB2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 16 Nov 2022 06:01:28 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1F01450A2
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Nov 2022 02:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668595696;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=actXV8V/4HNDVBL7ZEvrJbHCudo+/TOoQCTQnP3PDcQ=;
        b=RH5BsmjCypHbUok0SIvkNJ3oc//gmyFLEdrj4GShfX1eDjEVm0xo1KbgPhOwbCIIxuy2xv
        ZCzonoDDWMETxkWxlLw0/7cR3giqbC6Y86OfkROqS87PoHdBGlecufnIVzIehDdMratPOy
        qM90iZcaBgV/CufnnsOPGiMT/HFc4bQ=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-341-vbSjJu7yO_GqO8ZOMhDNbw-1; Wed, 16 Nov 2022 05:48:15 -0500
X-MC-Unique: vbSjJu7yO_GqO8ZOMhDNbw-1
Received: by mail-ej1-f71.google.com with SMTP id hq18-20020a1709073f1200b007ade8dd3494so9441965ejc.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Nov 2022 02:48:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=actXV8V/4HNDVBL7ZEvrJbHCudo+/TOoQCTQnP3PDcQ=;
        b=fKpp4Ybzh13z1x8XlGgXfmO+gtPuZ1hg9OVZdywhU02LKeUaoNQG7MqYeLO5P+pN4P
         jCSPQ/oefi5PgrJ2PoeJ36psvQPnyAclB+INH0mJgzJTgEWPq+XH4RDsCk34wEVpsgld
         wtIBafC651LWh00dsd7dBH8n50FHlPkfCDH1svebTAgW+cCz8r1hVQWOjoIlj+6W0BDf
         NTNm5EE+kq7FV9Dhk40nX6QfYqQorNH2lS9zYD53i2NeoW5upXICi/Co1cfFIeHu8apL
         KF+VrEbEXWqW/ykUIATb6JIaibukYMYvz3PxvnbR8pzbvj858wcrrQbAYOrcQvSUongS
         TzVQ==
X-Gm-Message-State: ANoB5pm4f5YwMQG1hPKSc2PC+ZYgKXZ9cFwAOc5Ks6v7tIDCYF2Fb0IS
        C83rHQFSusNIVbaxPOS1itZtXNGTnv4tZ1Bo9H+EHZfCLcpo7r+Ri423Gr7B1nVbsWM/dNIxHkm
        akSfi81FFQUWWLbkg3NpfxNXm+wHC2o5Vpg==
X-Received: by 2002:a17:906:b046:b0:7ae:50c6:453a with SMTP id bj6-20020a170906b04600b007ae50c6453amr17306080ejb.596.1668595693653;
        Wed, 16 Nov 2022 02:48:13 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5Qqw6Edkg9M9z4WOBmEeBBINk3jGmghVcVxARQQw1FpxITl3iaW+gro9yRTHhbZ3vlSsggIw==
X-Received: by 2002:a17:906:b046:b0:7ae:50c6:453a with SMTP id bj6-20020a170906b04600b007ae50c6453amr17306068ejb.596.1668595693457;
        Wed, 16 Nov 2022 02:48:13 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id a2-20020aa7d742000000b004623028c594sm7333413eds.49.2022.11.16.02.48.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 02:48:12 -0800 (PST)
Message-ID: <5e425476-5f04-23e2-03e0-1f8ea57c1a55@redhat.com>
Date:   Wed, 16 Nov 2022 11:48:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
From:   Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] platform-drivers-x86 for 6.1-4
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org,
        "Rafael J. Wysocki" <rafael@kernel.org>
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Linus,

Here is the third round of fixes for platform-drivers-x86 for 6.1:

 -  Surface Pro 9 and Surface Laptop 5 kbd, battery, etc. support
    (this is just a few hw-id additions)
 -  A couple of other hw-id / DMI-quirk additions
 -  A few small bug fixes + 1 build fix

Regards,

Hans


The following changes since commit 53eb64c88f17b14b324fbdfd417f56c5d3fa6fee:

  platform/x86: p2sb: Don't fail if unknown CPU is found (2022-11-07 12:33:49 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.1-4

for you to fetch changes up to b44fd994e45112b58b6c1dec4451d9a925784589:

  platform/x86: ideapad-laptop: Add module parameters to match DMI quirk tables (2022-11-16 08:47:08 +0100)

----------------------------------------------------------------
platform-drivers-x86 for v6.1-4

Highlights:
 -  Surface Pro 9 and Surface Laptop 5 kbd, battery, etc. support
    (this is just a few hw-id additions)
 -  A couple of other hw-id / DMI-quirk additions
 -  A few small bug fixes + 1 build fix

The following is an automated git shortlog grouped by driver:

acer-wmi:
 -  Enable SW_TABLET_MODE on Switch V 10 (SW5-017)

asus-wmi:
 -  add missing pci_dev_put() in asus_wmi_set_xusb2pr()

hp-wmi:
 -  Ignore Smart Experience App event

ideapad-laptop:
 -  Add module parameters to match DMI quirk tables
 -  Fix interrupt storm on fn-lock toggle on some Yoga laptops

platform/surface:
 -  aggregator_registry: Add support for Surface Laptop 5
 -  aggregator_registry: Add support for Surface Pro 9
 -  aggregator: Do not check for repeated unsequenced packets

platform/x86/amd:
 -  pmc: Add new ACPI ID AMDI0009
 -  pmc: Remove more CONFIG_DEBUG_FS checks

platform/x86/intel:
 -  pmc: Don't unconditionally attach Intel PMC when virtualized

thinkpad_acpi:
 -  Enable s2idle quirk for 21A1 machine type

----------------------------------------------------------------
Arnav Rawat (1):
      platform/x86: ideapad-laptop: Fix interrupt storm on fn-lock toggle on some Yoga laptops

Hans de Goede (2):
      platform/x86: acer-wmi: Enable SW_TABLET_MODE on Switch V 10 (SW5-017)
      platform/x86: ideapad-laptop: Add module parameters to match DMI quirk tables

Kai-Heng Feng (1):
      platform/x86: hp-wmi: Ignore Smart Experience App event

Lennard Gäher (1):
      platform/x86: thinkpad_acpi: Enable s2idle quirk for 21A1 machine type

Mario Limonciello (1):
      platform/x86/amd: pmc: Remove more CONFIG_DEBUG_FS checks

Maximilian Luz (3):
      platform/surface: aggregator: Do not check for repeated unsequenced packets
      platform/surface: aggregator_registry: Add support for Surface Pro 9
      platform/surface: aggregator_registry: Add support for Surface Laptop 5

Roger Pau Monné (1):
      platform/x86/intel: pmc: Don't unconditionally attach Intel PMC when virtualized

Shyam Sundar S K (1):
      platform/x86/amd: pmc: Add new ACPI ID AMDI0009

Xiongfeng Wang (1):
      platform/x86: asus-wmi: add missing pci_dev_put() in asus_wmi_set_xusb2pr()

 .../platform/surface/aggregator/ssh_packet_layer.c | 24 +++++++++++---
 .../platform/surface/surface_aggregator_registry.c | 37 ++++++++++++++++++++++
 drivers/platform/x86/acer-wmi.c                    |  9 ++++++
 drivers/platform/x86/amd/pmc.c                     |  3 +-
 drivers/platform/x86/asus-wmi.c                    |  2 ++
 drivers/platform/x86/hp-wmi.c                      |  3 ++
 drivers/platform/x86/ideapad-laptop.c              | 37 ++++++++++++++++++++--
 drivers/platform/x86/intel/pmc/pltdrv.c            |  9 ++++++
 drivers/platform/x86/thinkpad_acpi.c               |  8 +++++
 9 files changed, 124 insertions(+), 8 deletions(-)

