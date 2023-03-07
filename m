Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9165C678D4
	for <platform-driver-x86@archiver.kernel.org>; Tue,  7 Mar 2023 11:46:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229913AbjCGLqG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 7 Mar 2023 06:46:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229525AbjCGLpc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 7 Mar 2023 06:45:32 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC3637B990
        for <platform-driver-x86@vger.kernel.org>; Tue,  7 Mar 2023 03:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678189251;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BuRIa4Kkg+iPgKiGUy/r/ZJ/DTgJgfCKW68hsfWjBQk=;
        b=bFdRIFMJhxXJTFGlr2odhsVg5ps2PZ+atMKUGcDkkjUsMTG4AE2SlLsLhEyVL/yN9lgVYv
        gvEfLGCbmf4XWZQIJRlYL4LzaeZwhFYd0PToFQcirUCo0qLTwBArm1KDvaI//HppY+im7e
        oNZrhQ37y1Zgmm768l9SaNvuvss6dts=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-417-p4bDXbMsNuea7RBCSrnJQA-1; Tue, 07 Mar 2023 06:40:49 -0500
X-MC-Unique: p4bDXbMsNuea7RBCSrnJQA-1
Received: by mail-ed1-f72.google.com with SMTP id h11-20020a0564020e8b00b004e59d4722a3so8370227eda.6
        for <platform-driver-x86@vger.kernel.org>; Tue, 07 Mar 2023 03:40:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678189249;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BuRIa4Kkg+iPgKiGUy/r/ZJ/DTgJgfCKW68hsfWjBQk=;
        b=eqS00ddgABBrXzMSHZzdCr9ApBCchjB7QMJfQXP3wUmGum2aFAUJ9OhYQ4/Ht6zuhm
         CYR8yTLp+fv50FDSKXqWqLrgL4H1iSV28wG3U0vxL4fE6QoGw/5uUPMrO26WD1kOZCNZ
         XkHj/SLhsB1tMGjMLzQfE0NexqUicRQh45FYaPjWyVzW70vThth6NPKa8Zhy39xTo3Zi
         vYvz3FI1sRGjq+HXG0c2Jfs4RTbTNDgPjvz77sSy8H7ZEMaricw+ZDNlCXHyq8NJ+h6a
         Y6QCs1DD4a5vYBodXxN5DdJjxT9wCBAr10ZxVNKrXNODO7V7rMP7POYu4vY6/oDAIxnN
         jg+Q==
X-Gm-Message-State: AO0yUKXXqvD2x0s5FeDjl6y5LfM3A4LSyXuD9V0in0B7u2v53q3VjTpo
        9AAlo4fED1APljhXieZ/orWxYvuvu+Hk6auckF85TjmD4m3CspMFPRKtvs8ZPJJNja+T73R0/Cl
        XrKMd7ANmtOh4n3bcMndi+8EpTMGbV4mOXA==
X-Received: by 2002:a17:907:7244:b0:8b1:78b6:bbd7 with SMTP id ds4-20020a170907724400b008b178b6bbd7mr17804839ejc.10.1678189248865;
        Tue, 07 Mar 2023 03:40:48 -0800 (PST)
X-Google-Smtp-Source: AK7set/dwu9oNmtGv1EbYzEzbDqpHsymiIGD9i9ctCHgX1mjyDDygQYhzzK0iEpc11cltDc/mQlbKA==
X-Received: by 2002:a17:907:7244:b0:8b1:78b6:bbd7 with SMTP id ds4-20020a170907724400b008b178b6bbd7mr17804822ejc.10.1678189248600;
        Tue, 07 Mar 2023 03:40:48 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ig2-20020a1709072e0200b008e7916f0bdesm5985012ejc.138.2023.03.07.03.40.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Mar 2023 03:40:48 -0800 (PST)
Message-ID: <c3106995-b848-4569-a062-84b18dc73838@redhat.com>
Date:   Tue, 7 Mar 2023 12:40:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 0/4] apple-gmux: support MMIO gmux type on T2 Macs
Content-Language: en-US, nl
To:     Orlando Chamberlain <orlandoch.dev@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lukas Wunner <lukas@wunner.de>,
        Seth Forshee <sforshee@kernel.org>,
        Aditya Garg <gargaditya08@live.com>,
        Aun-Ali Zaidi <admin@kodeit.net>,
        Kerem Karabay <kekrby@gmail.com>
References: <20230303112842.3094-1-orlandoch.dev@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230303112842.3094-1-orlandoch.dev@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/3/23 12:28, Orlando Chamberlain wrote:
> Hi All,
> 
> This patch series adds support for the MMIO based gmux present on these
> Dual GPU Apple T2 Macs: MacBookPro15,1, MacBookPro15,3, MacBookPro16,1,
> MacBookPro16,4 (although amdgpu isn't working on MacBookPro16,4 [1]).
> 
> Changes from v3[2]:
> 
> - Use acpi_execute_simple_method()
> - Document extra info about the gmux provided by Lukas
> - Squash the GMSP acpi method into the support MMIO gmux commit, as we
>   now just check if it's a MMIO gmux, not if the gmux config has a flag
>   set. This means it's hard to seperate the two now, so making them one
>   commit is simpler.

Thank you for your patch series, I've applied this series to my
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
> # 1:
> 
> has a slight change in how the switch state is read: instead of checking
> for x == 2, check !(x & 1)
> 
> # 2:
> 
> implements a system to support more than 2 gmux types
> 
> # 3:
> 
> Adds support for the MMIO based gmux on T2 macs.
> 
> # 4:
> 
> Add a debugfs interface to apple-gmux so data from ports can be read
> and written to from userspace.
> 
> This can be used for more easily researching what unknown ports do,
> and switching gpus when vga_switcheroo isn't ready (e.g. when one gpu
> is bound to vfio-pci and in use by a Windows VM, I can use this to
> switch my internal display between Linux and Windows easily).
> 
> # Issues:
> 
> 1. Switching gpus at runtime has the same issue as indexed gmux's: the
> inactive gpu can't probe the DDC lines for eDP [3]
> 
> 2. iMacPro1,1, iMac20,1 and iMac20,2 all seem to have a gmux in their
> acpi tables, but they shouldn't. A check that hopefully will detect this
> is used, but it's untested as I don't have any of those computers.
> 
> 3. Powering on the amdgpu with vga_switcheroo doesn't work well. I'm
> told on the MacBookPro15,1 it works sometimes, and adding delays helps,
> but on my MacBookPro16,1 I haven't been able to get it to work at all:
> 
> amdgpu: switched off
> amdgpu: switched on
> amdgpu 0000:03:00.0:
>     Unable to change power state from D3hot to D0, device inaccessible
> amdgpu 0000:03:00.0:
>     Unable to change power state from D3cold to D0, device inaccessible
> [drm] PCIE GART of 512M enabled (table at 0x00000080FEE00000).
> [drm] PSP is resuming...
> [drm:psp_hw_start [amdgpu]] *ERROR* PSP create ring failed!
> [drm:psp_resume [amdgpu]] *ERROR* PSP resume failed
> [drm:amdgpu_device_fw_loading [amdgpu]]
>     *ERROR* resume of IP block <psp> failed -62
> amdgpu 0000:03:00.0: amdgpu: amdgpu_device_ip_resume failed (-62).
> snd_hda_intel 0000:03:00.1: Enabling via vga_switcheroo
> snd_hda_intel 0000:03:00.1:
>     Unable to change power state from D3cold to D0, device inaccessible
> snd_hda_intel 0000:03:00.1: CORB reset timeout#2, CORBRP = 65535
> snd_hda_codec_hdmi hdaudioC0D0: Unable to sync register 0x2f0d00. -5
> 
> There are some acpi methods (PWRD, PWG1 [4, 5]) that macOS calls when
> changing the amdgpu's power state, but we don't use them and that could be
> a cause. Additionally unlike previous generation Macbooks which work
> better, on MacBookPro16,1 the gpu is located behind 2 pci bridges:
> 
> 01:00.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI]
>     Navi 10 XL Upstream Port of PCI Express Switch (rev 43)
> 02:00.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI]
>     Navi 10 XL Downstream Port of PCI Express Switch
> 03:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI]
>     Navi 14 [Radeon RX 5500/5500M / Pro 5500M] (rev 43)
> 03:00.1 Audio device: Advanced Micro Devices, Inc. [AMD/ATI]
>     Navi 10 HDMI Audio
> 
> Upon attempting to power on the gpu with vga_switcheroo, all these
> devices except 01:00.0 have their config space filled with 1s.
> Rescanning pci makes the config space of all the devices go back to
> normal, however amdgpu still fails to resume with the same logs as
> above.
> 
> [1]: https://lore.kernel.org/all/3AFB9142-2BD0-46F9-AEA9-C9C5D13E68E6@live.com/
> [2]: https://lore.kernel.org/platform-driver-x86/20230218132007.3350-1-orlandoch.dev@gmail.com/
> [3]: https://lore.kernel.org/all/9eed8ede6f15a254ad578e783b050e1c585d5a15.1439288957.git.lukas@wunner.de/
> [4]: https://gist.github.com/Redecorating/6c7136b7a4ac7ce3b77d8e41740dd87b
> [5]: https://lore.kernel.org/all/20120710160555.GA31562@srcf.ucam.org/
> 
> Orlando Chamberlain (4):
>   apple-gmux: use first bit to check switch state
>   apple-gmux: refactor gmux types
>   apple-gmux: support MMIO gmux on T2 Macs
>   apple-gmux: add debugfs interface
> 
>  drivers/platform/x86/apple-gmux.c | 351 ++++++++++++++++++++++++++----
>  include/linux/apple-gmux.h        |  70 ++++--
>  2 files changed, 357 insertions(+), 64 deletions(-)
> 

