Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AEB9EB64DD
	for <platform-driver-x86@archiver.kernel.org>; Wed, 12 Jul 2023 15:20:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232004AbjGLPUt (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 12 Jul 2023 11:20:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231417AbjGLPUs (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 12 Jul 2023 11:20:48 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB72B1FCC
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Jul 2023 08:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689175144;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PCzMnIk4EUAlNIXsbTPgnejSeR7W3lLfeJIjDNvrQT4=;
        b=bBEWp6cyotkHa5HRxkQfrUox4kzPl+RjWD2+0W/OlpvE+YdRcGjasAYsmmSMvM6Feor0By
        aJa/2CCtFhKukQErzUIHMWvUsMvEK1epEYsIqnIDl5aEEpXRNnGv1dqb2PVx6kmNFufhex
        +jh69vwEcqV5tVufmR3RXzMU190nep0=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-21-PRYW6aoUMHa9SfbibtFe8Q-1; Wed, 12 Jul 2023 11:18:59 -0400
X-MC-Unique: PRYW6aoUMHa9SfbibtFe8Q-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-993831c639aso425875466b.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Jul 2023 08:18:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689175137; x=1691767137;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PCzMnIk4EUAlNIXsbTPgnejSeR7W3lLfeJIjDNvrQT4=;
        b=GlN44flTYNiRO15dEYm4XBI/JJwlb6V0WN+t53u1Y+oeM37PST3OWkzfMvne3uHfiC
         O/7EBZOrcrz89g1NU2Vysthng+3abpXTiQyxaQO2hXsMXcjS8wnvf9d/0Cc50hSIcEjq
         ANmUcNJxmAs0hOJHInjRO3KWOINk28uo4hnoYxgceNV3zIN4VjoeAc0sUsbcockf0lWw
         brxDoEmEnhd6/p2zVg1de2LdRTMnaaxWjE98lc2CPVrhkT8ysZMG21ztQm4QmKqprdF3
         U4cwIPLRYZlpdR5cwBvDE1CSgSiuXt0LKvtRpSBLKsHW9PeSVfYmVSiAZyxNg3/m9uPh
         2WJQ==
X-Gm-Message-State: ABy/qLbHXyx79Rg3YKO2DP5CLxrTr9jKc30ZPUZLur/jC10qHIVcF5fQ
        rizoJZDRqVa/niCIMU/nwD1HCm/NrmE0yp6S8BH6+G+/Y25iBS03JPgwZuH1TjR6Jef/xdSS5E8
        1y2x//E6MX4kzTBXeXzD71mQZCrB+eH94rA==
X-Received: by 2002:a17:906:7a4c:b0:993:d617:bdc5 with SMTP id i12-20020a1709067a4c00b00993d617bdc5mr15974669ejo.37.1689175137744;
        Wed, 12 Jul 2023 08:18:57 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFcNAAKYJsGE//IOnyL66tt6b+ZlctKs3M4YV0iRoylH/+zyuyjTaePkU8BFtzDx/53R0C8HQ==
X-Received: by 2002:a17:906:7a4c:b0:993:d617:bdc5 with SMTP id i12-20020a1709067a4c00b00993d617bdc5mr15974659ejo.37.1689175137468;
        Wed, 12 Jul 2023 08:18:57 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id p6-20020a170906614600b00993a508b818sm2729216ejl.1.2023.07.12.08.18.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jul 2023 08:18:56 -0700 (PDT)
Message-ID: <365026b2-86a1-3984-e602-c818a9739df3@redhat.com>
Date:   Wed, 12 Jul 2023 17:18:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 0/8] platform/x86: asus-wmi:
Content-Language: en-US, nl
To:     "Luke D. Jones" <luke@ljones.dev>
Cc:     corentin.chary@gmail.com, acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, markgross@kernel.org,
        jdelvare@suse.com, linux@roeck-us.net
References: <20230630053552.976579-1-luke@ljones.dev>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230630053552.976579-1-luke@ljones.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/30/23 07:35, Luke D. Jones wrote:
> This patch series adds or exposes more features that are available in the ROG
> laptop series.
> 
> - expose dGPU and CPU tunables for ROG
>   - These are things like GPU boost, CPU Pl1 and PL2, package power limits
> - support setting mini-LED mode
>   - Some newer laptops have a screen that can toggle between regular style
>     backlight and using mini-LED backlight
> - add WMI method to show if egpu connected
>   - This WMI method can be monitored/queried to see if it is possible to begin
>     the change-over to eGPU
> - support middle fan custom curves
>   - Some newer laptops have a center/middle fan which blows across the CPU and GPU
> - add support for showing middle fan RPM
> - add support for showing charger mode (AC, USB-C, both plugged)
> - add additional checks to GPU switching code
>   - These try to prevent a sceanrio such as the user disabling the dGPU while it
>     is driving the internal panel via MUX, resulting in no output at all.
>     There are no checks in the ACPI code for this, but on some newer models ASUS
>     did finally add a switch in the BIOS menu. It is best to try and prevent this
>     at the kernel level rather than userland level.
> 
> All patches pass ./scripts/checkpatch.pl

Thank you for your patch-series, I've applied the series to my
review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans



> 
> Changelog:
> - v2-0008-platform-x86-asus-wmi-expose-dGPU-and-CPU-tunable.patch
> 	- Rename the WMI defs to match what ASUS supplied as names
> 	- Remove EDC and TDC exposure (unsafe)
> 	- Slight change to formatting
> 	- Add better notes to documentation
> 		
> 
> Luke D. Jones (8):
>   platform/x86: asus-wmi: add support for showing charger mode
>   platform/x86: asus-wmi: add support for showing middle fan RPM
>   platform/x86: asus-wmi: support middle fan custom curves
>   platform/x86: asus-wmi: add WMI method to show if egpu connected
>   platform/x86: asus-wmi: don't allow eGPU switching if eGPU not
>     connected
>   platform/x86: asus-wmi: add safety checks to gpu switching
>   platform/x86: asus-wmi: support setting mini-LED mode
>   platform/x86: asus-wmi: expose dGPU and CPU tunables for ROG
> 
>  .../ABI/testing/sysfs-platform-asus-wmi       |  86 +++
>  drivers/platform/x86/asus-wmi.c               | 605 +++++++++++++++++-
>  include/linux/platform_data/x86/asus-wmi.h    |  19 +-
>  3 files changed, 707 insertions(+), 3 deletions(-)
> 

