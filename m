Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 429B4C433EF
	for <platform-driver-x86@archiver.kernel.org>; Fri, 24 Dec 2021 11:28:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352560AbhLXL2B (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 24 Dec 2021 06:28:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36036 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1352554AbhLXL2A (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 24 Dec 2021 06:28:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1640345279;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=8XQNItkHvztHDkow0Cptlxf4zXbwc0CF9zV8fZFGlRk=;
        b=BJj+6FiWUShoURE1hke83xfJU7z5okwuUAEL+Fn/GLwgMloyYOeGtj5jKik3RMjjZJzLeZ
        PdkpZOBW05mRwO77/Mn+81AKX6X3m+v/4/ZYXzq2c9CQsMyxUsr+ktkdXRlGqXOFl7qWlS
        V8wGbeHN0ao8hMBeUuSuUuZUT2gD2f0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-107-oIutRZK6NQSsFIzhY-LZGg-1; Fri, 24 Dec 2021 06:27:58 -0500
X-MC-Unique: oIutRZK6NQSsFIzhY-LZGg-1
Received: by mail-ed1-f69.google.com with SMTP id ay24-20020a056402203800b003f8491e499eso6594232edb.21
        for <platform-driver-x86@vger.kernel.org>; Fri, 24 Dec 2021 03:27:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:from
         :subject:to:cc:content-language:content-transfer-encoding;
        bh=8XQNItkHvztHDkow0Cptlxf4zXbwc0CF9zV8fZFGlRk=;
        b=QHbWeIdiSsQEJj70kY/CpIuHfMR1i8+Jv3KpqXuL68MQSNi9GR87to80bfve6TW2VU
         AUnvHRPO46uRZaQJKEYuS7ma13TcpHBEAPO13EyY/0i/k+VSiA/hFaS/HktFA0Wxek6u
         78iXJG1P9vnFuYPSr0aADMmb3ec8/TiLB4CJb2VzcNP6dX23JpcpvwDWl5PPd85t6Y5j
         WWFQK58AEu6V8dZgxThCHEfCkCSzVYvSqNeXqM/Ba25kuVmqZvmNkoDAf21Seo54K/JP
         X5gGsSU+EE1cbVaO3laqjk74cwF45Itk4webnek2gFjS5krc8uzVa7DpqCd/q70ASte2
         HyOg==
X-Gm-Message-State: AOAM532SaghBFQWE60wo7poSRp0Yp9Ylzn3fl8aze1evtJsmvfsywiMi
        JMeVEu3jwuEL0rERviPySDFF0qKFyiGfJxj9bAyp20oyQIiDS2LlLALB8in4DcFq1/1q6ikUXrH
        +Yz8pg910YbSTkDklRTds2EFTOf4BzqN+iA==
X-Received: by 2002:a17:907:118f:: with SMTP id uz15mr5109127ejb.726.1640345277143;
        Fri, 24 Dec 2021 03:27:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw811lPIqVt7UGBqixNFbdtutB4UBMb2MQsvMvpJ3nfoKULW//G41M25v8zszhQS9HCgd+leQ==
X-Received: by 2002:a17:907:118f:: with SMTP id uz15mr5109120ejb.726.1640345276979;
        Fri, 24 Dec 2021 03:27:56 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id b22sm435730edt.96.2021.12.24.03.27.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Dec 2021 03:27:56 -0800 (PST)
Message-ID: <312bc446-6f8c-c447-b3cd-bf2d46581f8b@redhat.com>
Date:   Fri, 24 Dec 2021 12:27:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
From:   Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] platform-drivers-x86 for 5.16-4
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

Here is the third round of bug-fixes for platform-drivers-x86
for 5.16.

This consists of just a few small bug-fixes.

Regards,

Hans


The following changes since commit 7d0c009043f6a970f62dbf5aecda9f8c3ccafcff:

  platform/x86/intel: hid: add quirk to support Surface Go 3 (2021-12-06 22:28:18 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v5.16-4

for you to fetch changes up to 26a8b09437804fabfb1db080d676b96c0de68e7c:

  platform/x86: intel_pmc_core: fix memleak on registration failure (2021-12-23 19:30:32 +0100)

----------------------------------------------------------------
platform-drivers-x86 for v5.16-4

Various bug-fixes.

The following is an automated git shortlog grouped by driver:

amd-pmc:
 -  only use callbacks for suspend

apple-gmux:
 -  use resource_size() with res

intel_pmc_core:
 -  fix memleak on registration failure

platform/mellanox:
 -  mlxbf-pmc: Fix an IS_ERR() vs NULL bug in mlxbf_pmc_map_counters

platform/x86/intel:
 -  Remove X86_PLATFORM_DRIVERS_INTEL

system76_acpi:
 -  Guard System76 EC specific functionality

----------------------------------------------------------------
Andy Shevchenko (1):
      platform/x86/intel: Remove X86_PLATFORM_DRIVERS_INTEL

Johan Hovold (1):
      platform/x86: intel_pmc_core: fix memleak on registration failure

Mario Limonciello (1):
      platform/x86: amd-pmc: only use callbacks for suspend

Miaoqian Lin (1):
      platform/mellanox: mlxbf-pmc: Fix an IS_ERR() vs NULL bug in mlxbf_pmc_map_counters

Tim Crawford (1):
      platform/x86: system76_acpi: Guard System76 EC specific functionality

Wang Qing (1):
      platform/x86: apple-gmux: use resource_size() with res

 drivers/platform/mellanox/mlxbf-pmc.c   |  4 +--
 drivers/platform/x86/Makefile           |  2 +-
 drivers/platform/x86/amd-pmc.c          |  3 +-
 drivers/platform/x86/apple-gmux.c       |  2 +-
 drivers/platform/x86/intel/Kconfig      | 15 ---------
 drivers/platform/x86/intel/pmc/pltdrv.c |  2 +-
 drivers/platform/x86/system76_acpi.c    | 58 +++++++++++++++++----------------
 7 files changed, 37 insertions(+), 49 deletions(-)

