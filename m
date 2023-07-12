Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14DD5EB64D9
	for <platform-driver-x86@archiver.kernel.org>; Wed, 12 Jul 2023 10:21:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232817AbjGLKVC (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 12 Jul 2023 06:21:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232476AbjGLKVB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 12 Jul 2023 06:21:01 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B019199D
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Jul 2023 03:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689157212;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=EPjeYevfqbPQ4JlLcY8o9Fqt9gv9gjqLCmOEwCBjH0Y=;
        b=fYWfV2ZRMDeFYYh5mFvDO9xnX/eXYyOXVNV0MeQMIiVehE1D3/hFRIOT/4fJvIK163089b
        CW1PwBUFL3cq2z8KAroSlRXo6MOe48AZDypxlGP+qdVUaktxDxNw70+MohVCt+8Naaid8M
        eLn0Yx9IOvChSh/eM9ZkcgEp+Lhxk04=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-128-HKu9PK8gPj2axZca46ogOA-1; Wed, 12 Jul 2023 06:20:11 -0400
X-MC-Unique: HKu9PK8gPj2axZca46ogOA-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-51df80f3afeso4502345a12.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Jul 2023 03:20:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689157210; x=1691749210;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EPjeYevfqbPQ4JlLcY8o9Fqt9gv9gjqLCmOEwCBjH0Y=;
        b=IxtNdtROUYNZZpHAfH3ZCRsQD6atnEEFqaekdEiSCAjyEaAXjCYrGkoRsRqV98+IvO
         tAEyx+HqKzqvZzl1yQ555Ulg2ahPc6klbuCOzcE+YbXMgD5dbxfB2jJLOXeLRFM0l0h3
         Y4PcUvE8Ix/49JHrmS9OVGHKGOirfqhE3IT8IeYJEMbI7m/6zvqdi03AaK5/TU2ttnHp
         AuN4t2K1rCk6PleMwuZE6mi4VkDXHQ7n+QIvEy6WkkejIHE3eff5Fh/ZLVuCHoyvyO37
         8cTd3FEbcbD83N9Xcm/J0spNQBP1nWWZxIymCMc6ErcYhkdmTOfvAyj8gO4JLP3S6Aha
         VvPw==
X-Gm-Message-State: ABy/qLaUuAWHvCJ6gZF5tc7n2f5sBlx6bSYpPR7NTkzgGwUt4TPy5OXN
        U15FB8fEe9P99LkWLG9VaTwHBswOJ2Aiq+tQ0KGolbnyXo7jN0t56a0sHyrZsGSVzIY9Xl2tiQ7
        Z4wp+CppRkN4D9Q63ulCQXdqxteWkIGpu7g==
X-Received: by 2002:a05:6402:4c9:b0:51d:df5e:5674 with SMTP id n9-20020a05640204c900b0051ddf5e5674mr19076585edw.1.1689157210261;
        Wed, 12 Jul 2023 03:20:10 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGsYUWHNn5ole/Z1wCnN0grhEeSpqhiQIF15CpZEW+eQ4zV1FRMf2WQrYguHABgq3AUj8ZUjA==
X-Received: by 2002:a05:6402:4c9:b0:51d:df5e:5674 with SMTP id n9-20020a05640204c900b0051ddf5e5674mr19076567edw.1.1689157209891;
        Wed, 12 Jul 2023 03:20:09 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id be25-20020a0564021a3900b00514a5f7a145sm2544922edb.37.2023.07.12.03.20.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jul 2023 03:20:09 -0700 (PDT)
Message-ID: <d56a3a15-58f7-1af6-0563-55e2db4ac45b@redhat.com>
Date:   Wed, 12 Jul 2023 12:20:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From:   Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] platform-drivers-x86 for 6.5-2
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org,
        =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Linus,

Here is the first round of fixes for platform-drivers-x86 for 6.5.

Nothing special to report just various small fixes + hw-id additions.

Regards,

Hans


The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.5-2

for you to fetch changes up to 6b293a8c91bca52726448d03216e65da509e9bb7:

  platform/x86: touchscreen_dmi: Add info for the Archos 101 Cesium Educ tablet (2023-07-11 12:15:30 +0200)

----------------------------------------------------------------
platform-drivers-x86 for v6.5-2

Misc. small fixes and hw-id additions.

The following is an automated git shortlog grouped by driver:

Move s2idle quirk from thinkpad-acpi to amd-pmc:
 - Move s2idle quirk from thinkpad-acpi to amd-pmc

dell-ddv:
 -  Fix mangled list in documentation
 -  Improve error handling

int3472/discrete:
 -  set variable skl_int3472_regulator_second_sensor storage-class-specifier to static

platform/x86/amd:
 -  pmf: Add new ACPI ID AMDI0103
 -  pmc: Add new ACPI ID AMDI000A
 -  pmc: Apply nvme quirk to HP 15s-eq2xxx

platform/x86/intel/tpmi:
 -  Prevent overflow for cap_offset

touchscreen_dmi:
 -  Add info for the Archos 101 Cesium Educ tablet

wmi:
 -  Replace open coded guid_parse_and_compare()
 -  Break possible infinite loop when parsing GUID

----------------------------------------------------------------
Andy Shevchenko (2):
      platform/x86: wmi: Break possible infinite loop when parsing GUID
      platform/x86: wmi: Replace open coded guid_parse_and_compare()

Armin Wolf (2):
      platform/x86: dell-ddv: Improve error handling
      platform/x86: dell-ddv: Fix mangled list in documentation

Mario Limonciello (2):
      platform/x86: Move s2idle quirk from thinkpad-acpi to amd-pmc
      platform/x86/amd: pmc: Apply nvme quirk to HP 15s-eq2xxx

Shyam Sundar S K (2):
      platform/x86/amd: pmc: Add new ACPI ID AMDI000A
      platform/x86/amd: pmf: Add new ACPI ID AMDI0103

Srinivas Pandruvada (1):
      platform/x86/intel/tpmi: Prevent overflow for cap_offset

Thomas GENTY (1):
      platform/x86: touchscreen_dmi: Add info for the Archos 101 Cesium Educ tablet

Tom Rix (1):
      platform/x86: int3472/discrete: set variable skl_int3472_regulator_second_sensor storage-class-specifier to static

 Documentation/wmi/devices/dell-wmi-ddv.rst         |   3 +-
 drivers/platform/x86/amd/Makefile                  |   2 +-
 drivers/platform/x86/amd/pmc-quirks.c              | 176 +++++++++++++++++++++
 drivers/platform/x86/amd/pmc.c                     |  32 ++--
 drivers/platform/x86/amd/pmc.h                     |  44 ++++++
 drivers/platform/x86/amd/pmf/core.c                |   3 +
 drivers/platform/x86/dell/dell-wmi-ddv.c           |   7 +-
 .../platform/x86/intel/int3472/clk_and_regulator.c |   2 +-
 drivers/platform/x86/intel/tpmi.c                  |   4 +-
 drivers/platform/x86/thinkpad_acpi.c               | 143 -----------------
 drivers/platform/x86/touchscreen_dmi.c             |  22 +++
 drivers/platform/x86/wmi.c                         |  28 ++--
 12 files changed, 276 insertions(+), 190 deletions(-)
 create mode 100644 drivers/platform/x86/amd/pmc-quirks.c
 create mode 100644 drivers/platform/x86/amd/pmc.h

