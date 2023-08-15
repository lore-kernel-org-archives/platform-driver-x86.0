Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBE92C001B0
	for <platform-driver-x86@archiver.kernel.org>; Tue, 15 Aug 2023 08:07:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235556AbjHOIHA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 15 Aug 2023 04:07:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235538AbjHOIGh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 15 Aug 2023 04:06:37 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 790411984
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Aug 2023 01:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1692086749;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qhprIM6hY/iuxPy5lR02/M1aZ7iIX9RH9xD2H8AWyoM=;
        b=MQz+zuz/26FHjWlQOS4imHhdsGv3p9imIBMOFhB/cyTBh7uU0Lne5JFURIF0lNKylpV7iI
        ZVbcesgLx41ZNLXk33GLQU/9jRYuOSnja3SoEnlWJwyqieowt2X3suAbbYRzuwONvPINYW
        XFddvU7XenDL3b9EFt4czjD1g2hOuXk=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-184-kHCPbfuZOFSIhXvvZS0jTg-1; Tue, 15 Aug 2023 04:05:48 -0400
X-MC-Unique: kHCPbfuZOFSIhXvvZS0jTg-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-993eeb3a950so299550566b.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Aug 2023 01:05:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692086746; x=1692691546;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qhprIM6hY/iuxPy5lR02/M1aZ7iIX9RH9xD2H8AWyoM=;
        b=heMfZAb34wn1kweuh+N9HXfhINF9Rr1lvoTMgSheGGLX6MYHAGcoYKgrJs59syYMAf
         Hau8VSRktcIbe91Ly0IQeBeEzD8mndxkGQ27EJLwTvARrEk6S04twUTGSppUG/Q56fph
         c+/cf1HDyh/Lpm/GtYduzqHvO0Mx9xBp5c6KpY29pR+n7EKAr6I+4Og3EEDOUVg79i5P
         NKhpYVc+Q54HBsWCsJUJ9N5hwzyUTt3dY430gTgXMsWz8awlbBdK+Utw0XNiqWFgjY5t
         FV96X1P4trF3+jUFvN66FaulUdmmI3SdNVG51rrE8Gbe4EWWJJDbKZgr1TBLPqQ7Kaan
         oDaw==
X-Gm-Message-State: AOJu0Yzh3sIf3FLvQhhKJ05X+/hBdeaylwWaimRFwtcSbXuBdvZi87Ii
        2HmPGD0vZLhmhhueuwgJgoOcaxhSza7Sr+vIo6tFNF08zWJqZQJyuybjsMz8w1kTs3E9GgCg1CP
        CoJJfC4xAp4cZvrmpFaVPp2aZJXdduaPXi/k7+hnOSw==
X-Received: by 2002:a17:907:2724:b0:99b:f3f5:9752 with SMTP id d4-20020a170907272400b0099bf3f59752mr9640017ejl.14.1692086746026;
        Tue, 15 Aug 2023 01:05:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPHSzXn1d/mAu9NqDEoFu1o9B70LsUXHY5lHRbiMemSd2TGYpCGib82OHwFvLchQk8YJdjBw==
X-Received: by 2002:a17:907:2724:b0:99b:f3f5:9752 with SMTP id d4-20020a170907272400b0099bf3f59752mr9640007ejl.14.1692086745611;
        Tue, 15 Aug 2023 01:05:45 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id x18-20020a170906805200b0099bcbaa242asm6684626ejw.9.2023.08.15.01.05.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Aug 2023 01:05:44 -0700 (PDT)
Message-ID: <34f2c08b-c07b-b789-487b-615868cde500@redhat.com>
Date:   Tue, 15 Aug 2023 10:05:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH platform-next v2 00/16] Add new features and amendments
 for Nvidia systems
Content-Language: en-US, nl
To:     Vadim Pasternak <vadimp@nvidia.com>
Cc:     ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org
References: <20230814203406.12399-1-vadimp@nvidia.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230814203406.12399-1-vadimp@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

It would be nice if there was a changelog somewhere in this cover
letter explaining what has changed in v2 ?

Regards,

Hans

On 8/14/23 22:33, Vadim Pasternak wrote:
> The patch set:
> - Provides New system attributes for monitoring.
> - Adds system reboot callback to perform system specific operations.
> - Adds support for ACPI based initialization flow.
> - Adds support for FPGA device connected through PCIe bus.
> - Adds additional logic for hotplug events handling.
> - Contains some amendments and cosmetic changes.
> 
> The patch set includes:
> Patches #1 - #3, #5: add new attributes for monitoring.
> Patch #4: sets hotplug event action for health and power signals.
> Patch #6: adds CPLD versioning registers for systems equipped with five
> 	  CPLD devices.
> Patch #7: modifies power off callback.
> Patch #8: cosmetic changes - fixes misspelling.
> Patch #9: provides system reboot callback through system reboot
> 	  notifier.
> Patch #10: prepares driver to allow probing through ACPI hooks along
> 	   with probing through DMI hooks.
> Patch #11: adds ACPI match hook for initialization flow.
> Patch #12: adds support for getting system interrupt line from ACPI
> 	   table.
> Patch #13: adds initial support for programming logic device connected
> 	   through PCIe.
> Patch #14: Extends condition for notification callback processing.
> Patch #15: defines the exact i2c bus of fans on the SN2201 system.
> Patch #16: Documents new attributes.
> 
> Michael Shych (1):
>   platform: mellanox: nvsw-sn2201: change fans i2c busses.
> 
> Vadim Pasternak (15):
>   platform: mellanox: Add new attributes
>   platform: mellanox: Add field upgrade capability register
>   platform: mellanox: Modify reset causes description
>   platform: mellanox: mlx-platform: Modify health and power hotplug
>     action
>   platform: mellanox: mlx-platform: Add reset cause attribute
>   platform: mellanox: mlx-platform: add support for additional CPLD
>   platform: mellanox: mlx-platform: Modify power off callback
>   platform: mellanox: Cosmetic changes
>   platform: mellanox: mlx-platform: Add reset callback
>   platform: mellanox: mlx-platform: Prepare driver to allow probing
>     through ACPI infrastructure
>   platform: mellanox: mlx-platform: Introduce ACPI init flow
>   platform: mellanox: mlx-platform: Get interrupt line through ACPI
>   platform: mellanox: Add initial support for PCIe based programming
>     logic device
>   platform/mellanox: mlxreg-hotplug: Extend condition for notification
>     callback processing
>   Documentation/ABI: Add new attribute for mlxreg-io sysfs interfaces
> 
>  .../ABI/stable/sysfs-driver-mlxreg-io         |  42 ++
>  drivers/platform/mellanox/mlxreg-hotplug.c    |   2 +-
>  drivers/platform/mellanox/nvsw-sn2201.c       |  12 +-
>  drivers/platform/x86/mlx-platform.c           | 376 ++++++++++++++++--
>  4 files changed, 383 insertions(+), 49 deletions(-)
> 

