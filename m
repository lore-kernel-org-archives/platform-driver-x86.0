Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD74CC197A0
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Nov 2023 10:13:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232562AbjKTKNw (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 20 Nov 2023 05:13:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232305AbjKTKNv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Nov 2023 05:13:51 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA063A2
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Nov 2023 02:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1700475225;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+8Cf8BKeV0pkEdGP4/x58exYBD4GzFePWhGzA/67l48=;
        b=MeeHBYlSXLrdIu6C+rGaPlWYwl2mTOEbBUfVRwZl6KYOIt/wtrh/D2Q4Uj8zoyC8LDUH+w
        U44hccvDNAnrzZBTKIu3ZkvX3E6XENpuXmAVqU6EpNjuKcbPiYbbfAr0gK3ebiFn3mpeTX
        P6zEnoStxy+fBXmvt9/jyadv59qT0aE=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-511-XzwrUF_dNRqM04jdKIzaow-1; Mon, 20 Nov 2023 05:13:43 -0500
X-MC-Unique: XzwrUF_dNRqM04jdKIzaow-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-542fe446d45so3254371a12.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Nov 2023 02:13:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700475223; x=1701080023;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+8Cf8BKeV0pkEdGP4/x58exYBD4GzFePWhGzA/67l48=;
        b=blaQOQLll1SacWJSgKaqMmaziT1H6r3p0rQ3GK5wiK/fRuQVt1DYdzCrEnwWYpMm1e
         3fVAw9drr0UJ7ycIG40Y8E1uHbWcfmEILG6Vwrqp7FDjoSm3Ei5WCuy4oegV35L2lEHm
         2g3TAQz1pwINDgqsQGgkH9hUbc6oY8WHnJt2AfnQQz76FiHjy7GsCGF4upW4Q5o4LEr9
         N9Npj4z6NnWpNlx4OOuIV4CYsS0CmSKqH4mQzgkyoq7yjmIVoR1g+PRGXRQfjj8ioBah
         oVLceHUNkz1w27rB9LbrLj9VB6xnxGb5DLJh6io14pNXIpn92fpm0VwEntESrTH0TQIV
         wBfw==
X-Gm-Message-State: AOJu0Yyyze2GQgCw1zFTgHs8hkGE6+Ar9sHzQ/HybXgDYD4MGRE6ZSEt
        Kkw0ypci75Zzfb9bRXhIYxxUrosnu1mUCs6OCk2mXMsPvzNjE8r90mx1vntvLUXuzsbfDUxQnIY
        GReKI/XFiamUFu4U4kmlannGuPR9VDk/TyA==
X-Received: by 2002:a17:906:5199:b0:9fb:4b:343e with SMTP id y25-20020a170906519900b009fb004b343emr4151857ejk.11.1700475222891;
        Mon, 20 Nov 2023 02:13:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGSBH+yx2NmpNYiWxm4OlzWiAMg4nzp9ipXurOvFoirK1V/ViSG8EiKO8IMspR4zBvdndBBZA==
X-Received: by 2002:a17:906:5199:b0:9fb:4b:343e with SMTP id y25-20020a170906519900b009fb004b343emr4151837ejk.11.1700475222556;
        Mon, 20 Nov 2023 02:13:42 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id s2-20020a1709066c8200b009e656ce2930sm3712141ejr.60.2023.11.20.02.13.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Nov 2023 02:13:41 -0800 (PST)
Message-ID: <32a73a9d-812c-47b5-9de7-95c77ce028b5@redhat.com>
Date:   Mon, 20 Nov 2023 11:13:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Add support for drivers to decide bridge D3 policy
Content-Language: en-US, nl
To:     Mario Limonciello <mario.limonciello@amd.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
        "open list:X86 PLATFORM DRIVERS" 
        <platform-driver-x86@vger.kernel.org>,
        Lukas Wunner <lukas@wunner.de>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>
References: <20231025020546.504-1-mario.limonciello@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231025020546.504-1-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/25/23 04:05, Mario Limonciello wrote:
> The policy for whether PCI bridges are allowed to select D3 is dictated
> by empirical results that are enumerated into pci_bridge_d3_possible().
> 
> In Windows this behaves differently in that Windows internal policy is
> not used for devices when a power engine plugin driver provided by the
> SOC vendor is installed.  This driver is used to decide the policy in
> those cases.
> 
> This series implements a system that lets drivers register such a policy
> control as well. It isn't activated for any SOCs by default.

I must admit that I've lost track of the status of this series...

With that said patch 4/4 looks good to me and I believe that
if this series gets accepted it will be best to send 4/4
upstream together with the rest through some other tree
then the the pdx86 tree.

So here is my ack for sending a future version of patch 4/4
("platform/x86/amd: pmc: Add support for using constraints
to decide D3 policy") upstream through another subsystem tree:

Acked-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans






> This is heavily leveraged from the work in [1]
> 
> [1] https://lore.kernel.org/platform-driver-x86/20230906184354.45846-1-mario.limonciello@amd.com/
> 
> RFC v1->PATCH v1
>  * Simplify the logic, use pci_d3cold_enable()/pci_d3cold_disable() functions
>  * Roll https://lore.kernel.org/linux-pci/20231004144731.158342-1-mario.limonciello@amd.com/ into series
>  * Updates for some typos
>  * Re-order series.  Patches 1 and 2 can potentially apply to PCI tree, 3 and 4 to platform-x86 tree.
> 
> Mario Limonciello (4):
>   PCI: Make d3cold_allowed sysfs attribute read only
>   PCI: Refresh root ports in pci_bridge_d3_update()
>   ACPI: x86: s2idle: Export symbol for fetching constraints for module
>     use
>   platform/x86/amd: pmc: Add support for using constraints to decide D3
>     policy
> 
>  Documentation/ABI/testing/sysfs-bus-pci |  4 +-
>  drivers/acpi/x86/s2idle.c               |  1 +
>  drivers/pci/pci-acpi.c                  |  2 +-
>  drivers/pci/pci-sysfs.c                 | 14 +-----
>  drivers/pci/pci.c                       | 12 ++++--
>  drivers/platform/x86/amd/pmc/pmc.c      | 57 +++++++++++++++++++++++++
>  include/linux/pci.h                     |  1 -
>  7 files changed, 72 insertions(+), 19 deletions(-)
> 

