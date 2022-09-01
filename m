Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3C5FECAAD1
	for <platform-driver-x86@archiver.kernel.org>; Thu,  1 Sep 2022 14:53:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232430AbiIAOxf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 1 Sep 2022 10:53:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233545AbiIAOxa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 1 Sep 2022 10:53:30 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBAD082759
        for <platform-driver-x86@vger.kernel.org>; Thu,  1 Sep 2022 07:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662044009;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=A0g1blcGod6K82z7PHFW5jtZohl7FHhnQON5Wk+LVyQ=;
        b=S3EV/+vPYAy1cW7/4C/yQ1rVTrB1E/2GV5Czy7Q8GXM8eMZGmxllsTvMC9inBOxxXFtjNA
        zjsJBQ5QWNxNChqvMP1q7iHlHTLUnE+v1RABekj/FS2r44/vAtScVmX3dvteN+7+X2iHzV
        TuedTHRwQMJeqK1+8JSfGXFdAJFAMss=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-547-WF9D6k9TOmC11DVwhIwhVg-1; Thu, 01 Sep 2022 10:53:28 -0400
X-MC-Unique: WF9D6k9TOmC11DVwhIwhVg-1
Received: by mail-ed1-f72.google.com with SMTP id l19-20020a056402255300b0043df64f9a0fso11980288edb.16
        for <platform-driver-x86@vger.kernel.org>; Thu, 01 Sep 2022 07:53:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=A0g1blcGod6K82z7PHFW5jtZohl7FHhnQON5Wk+LVyQ=;
        b=jxsaLgOMPszUTAQyDnnhXQRsNbwGoKsHEtmUREeVdLUX9TwxSy1pFM5GZ87yfbGfcr
         gv5B8bycRhWXcDN91hVAtDKmm7gZj/TXXJqkDF86p643h1rwQR1cqFlmgnwZaEf5g+DZ
         lCIgZA7GPL3Q9yfW8W2rtvdoX/JsuPeMhPN/KJfxEDrdA6AI/a6mazt/6ukV3rpuCMbg
         USYq/czUombbNj6gSYH6XfgcU9aIDnxZurn8hBmXV7uvSss9b8CYyfOslipGAfFMXayz
         D+ptWiaIeKMJEqjNBmZzYd6tohOXt/51ydETqVg0IB8lBtFc3jGTZJLkcCKFr7xz9PMg
         lpCg==
X-Gm-Message-State: ACgBeo1jp4E+VRekHxYhFvvXqZOJYcQDf1iKqlc30BMQGIkM58BMxv9H
        b87xNHL3BwGlHEHhZ29pjy9Y6vMu68o9fyWffXQ9vcwYOONpoTsVPEZGZ+w0AgY0YIwpNiQ4oLU
        dKYXmi2deYh0+TSfAqx+jw4IF1oSR2mVIsg==
X-Received: by 2002:a17:907:97d3:b0:73d:8b9b:a6c1 with SMTP id js19-20020a17090797d300b0073d8b9ba6c1mr23841558ejc.71.1662044006881;
        Thu, 01 Sep 2022 07:53:26 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6A5xb5zxDdAmIlrBKOAQ/kfMCQXQVATSUFSS8Zk3+p7j3ebhCP6gZtK0drupcmwhEfsr5TTQ==
X-Received: by 2002:a17:907:97d3:b0:73d:8b9b:a6c1 with SMTP id js19-20020a17090797d300b0073d8b9ba6c1mr23841540ejc.71.1662044006697;
        Thu, 01 Sep 2022 07:53:26 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id vs23-20020a170907139700b0072ed9efc9dfsm8530465ejb.48.2022.09.01.07.53.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 07:53:26 -0700 (PDT)
Message-ID: <298e6d86-dc7b-ed24-893d-2211017463bb@redhat.com>
Date:   Thu, 1 Sep 2022 16:53:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
From:   Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] Immutable branch with 6.0-rc1 + "[PATCH v6 0/7] add
 support for another simatic board" series
To:     Henning Schild <henning.schild@siemens.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Pavel Machek <pavel@ucw.cz>, Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Lee Jones <lee@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Cc:     Sheng-Yuan Huang <syhuang3@nuvoton.com>,
        Tasanakorn Phaipool <tasanakorn@gmail.com>,
        simon.guinot@sequanux.org
References: <20220825104422.14156-1-henning.schild@siemens.com>
Content-Language: en-US
In-Reply-To: <20220825104422.14156-1-henning.schild@siemens.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Dear GPIO and LED subsystem maintainers,

Here is a pull-request for v6.0-rc1 + the
"[PATCH v6 0/7] add support for another simatic board" series
for merging into the gpio and leds subsystems.

Regards,

Hans


The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-simatec-1

for you to fetch changes up to 8f5c9858c5db129359b5de2f60f5f034bf5d56c0:

  platform/x86: simatic-ipc: add new model 427G (2022-09-01 16:15:03 +0200)

----------------------------------------------------------------
Tag (immutable branch) for:
v6.0-rc1 + "[PATCH v6 0/7] add support for another simatic board" series
for merging into the gpio, leds and pdx86 subsystems.

----------------------------------------------------------------
Henning Schild (7):
      gpio-f7188x: switch over to using pr_fmt
      gpio-f7188x: add a prefix to macros to keep gpio namespace clean
      gpio-f7188x: Add GPIO support for Nuvoton NCT6116
      gpio-f7188x: use unique labels for banks/chips
      leds: simatic-ipc-leds-gpio: add new model 227G
      platform/x86: simatic-ipc: enable watchdog for 227G
      platform/x86: simatic-ipc: add new model 427G

 drivers/gpio/Kconfig                               |   3 +-
 drivers/gpio/gpio-f7188x.c                         | 275 ++++++++++++---------
 drivers/leds/simple/simatic-ipc-leds-gpio.c        |  42 +++-
 drivers/platform/x86/simatic-ipc.c                 |  10 +-
 include/linux/platform_data/x86/simatic-ipc-base.h |   1 +
 include/linux/platform_data/x86/simatic-ipc.h      |   2 +
 6 files changed, 216 insertions(+), 117 deletions(-)

