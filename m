Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5488FC7EE2C
	for <platform-driver-x86@archiver.kernel.org>; Thu, 25 May 2023 10:04:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238966AbjEYKEI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 25 May 2023 06:04:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229719AbjEYKEH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 25 May 2023 06:04:07 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89D0F139
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 May 2023 03:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685008999;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=7CA3N1jhgCA+EK9INjfeIU30KXLxoA1XUpS7B8fqlp8=;
        b=P4ql0qMyW3N20EFHlwwdLI9i4DJ4SSbe2wfzyyWEW7QrCbofUrhQXIc3OiZjrVLmQJIn/E
        iXG1wrHZeW/Gb+Ym16theC4TIjVyQNcL9wrN5xxlzrJrARjsokEJ9vjxkRmOErBox3JUW+
        9r7l04cxIDGSvyfh8W9DAPYjaPsd1xM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-573-PuNgx3_rNVuMTH6mh8rxvg-1; Thu, 25 May 2023 06:03:18 -0400
X-MC-Unique: PuNgx3_rNVuMTH6mh8rxvg-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-94a356c74e0so45430466b.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 May 2023 03:03:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685008997; x=1687600997;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7CA3N1jhgCA+EK9INjfeIU30KXLxoA1XUpS7B8fqlp8=;
        b=LSmiTUftsECU6NJ0feHzxj6YLHdKRLfDX2O1y0o5+I3pcqP7yTWAEW5+3pXUIjzJ7O
         lIgv86/S0Hg8ECqIMXaIik5HfBiTiXPrcvArYsB1DfGZ4YdmM3Fir46jagatTvPME1jV
         UgBrJu1l9FCPKC6nuNYKU3WqYktflh3VrdyOQTM4/XHZbEC7cXy4UG6ZyvRMbh+6eejf
         pyXGNqGrCvEFpk72QgAZv9caOdXzmYtDNUCAx99MAriJOCbffnSY4gIMLKfUrmzgWNvs
         DWR3Tjf2WjABTAMX2yuNARf9/vL83+vx7cjSQNtCeuh3i9N8kgi4OKMR7FqwJTVWdsTg
         NhRg==
X-Gm-Message-State: AC+VfDzBbyz4BWGUBA6F7Y9+iKKS5hvjKejSSjrN7s/+UILjt5nycPOp
        GVCl7n/ptnbj13pjiRVF+Eceu8m//KF77Ru+S3FiJQdLivJI4qiQxBCFavDePjuWNi9AvzQvhil
        aZ+dgIRjlBFB/I/JUQ0RyFPkmys6eQqUhG9+8CnROgA==
X-Received: by 2002:a17:906:9745:b0:966:5a6c:7549 with SMTP id o5-20020a170906974500b009665a6c7549mr1054354ejy.14.1685008996862;
        Thu, 25 May 2023 03:03:16 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7Q/2L1bB5XlZ25R02jsIi9NDc7RewW3lxurnawYDHDbUeLbd0pet0VGr9CchlQrrMi8QRVUg==
X-Received: by 2002:a17:906:9745:b0:966:5a6c:7549 with SMTP id o5-20020a170906974500b009665a6c7549mr1054330ejy.14.1685008996511;
        Thu, 25 May 2023 03:03:16 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id j23-20020a170906475700b00967a18df1easm632621ejs.117.2023.05.25.03.03.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 May 2023 03:03:16 -0700 (PDT)
Message-ID: <941d687d-ef8e-0823-fff0-3011be6c0e0a@redhat.com>
Date:   Thu, 25 May 2023 12:03:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From:   Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] platform-drivers-x86 for 6.4-3
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

Here is the second round of fixes for platform-drivers-x86 for 6.4.

Nothing special to report just a few small fixes.

Regards,

Hans


The following changes since commit 3d43f9f639542fadfb28f40b509bf147a6624d48:

  platform/mellanox: fix potential race in mlxbf-tmfifo driver (2023-05-09 11:54:35 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.4-3

for you to fetch changes up to 3279decb2c3c8d58cb0b70ed5235c480735a36ee:

  platform/x86/intel/ifs: Annotate work queue on stack so object debug does not complain (2023-05-23 12:55:16 +0200)

----------------------------------------------------------------
platform-drivers-x86 for v6.4-3

A small set of assorted bug fixes for 6.4.

The following is an automated git shortlog grouped by driver:

ISST:
 -  Remove 8 socket limit

asus-wmi:
 -  Ignore WMI events with codes 0x7B, 0xC0

platform/mellanox:
 -  mlxbf-pmc: fix sscanf() error checking

platform/x86/amd/pmf:
 -  Fix CnQF and auto-mode after resume

platform/x86/intel/ifs:
 -  Annotate work queue on stack so object debug does not complain

----------------------------------------------------------------
Alexandru Sorodoc (1):
      platform/x86: asus-wmi: Ignore WMI events with codes 0x7B, 0xC0

Dan Carpenter (1):
      platform/mellanox: mlxbf-pmc: fix sscanf() error checking

David Arcari (1):
      platform/x86/intel/ifs: Annotate work queue on stack so object debug does not complain

Mario Limonciello (1):
      platform/x86/amd/pmf: Fix CnQF and auto-mode after resume

Steve Wahl (1):
      platform/x86: ISST: Remove 8 socket limit

 drivers/platform/mellanox/mlxbf-pmc.c              |  5 ++--
 drivers/platform/x86/amd/pmf/core.c                | 34 +++++++++++++++++-----
 drivers/platform/x86/asus-nb-wmi.c                 |  2 ++
 drivers/platform/x86/intel/ifs/load.c              |  2 +-
 .../x86/intel/speed_select_if/isst_if_common.c     | 12 ++++----
 5 files changed, 36 insertions(+), 19 deletions(-)

