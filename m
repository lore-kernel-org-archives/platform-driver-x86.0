Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1A7DEE4993
	for <platform-driver-x86@archiver.kernel.org>; Mon, 21 Aug 2023 13:20:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232082AbjHUNUT (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 21 Aug 2023 09:20:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232013AbjHUNUS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 21 Aug 2023 09:20:18 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC8A0B1
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Aug 2023 06:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1692623977;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3iiqyRSxj16akmSutM6aV/PIkcKkD7OlE2OvC2dSwkg=;
        b=CX6KYwcppEEXbaJlWQz01at9En1EVlhDm6xo5bwRZaTsGfVIqGA9eSFM3gwXJdFk/fQ70F
        KtkBcmsTxnxrTeZZvD63Ty0P1HR6fWXzIffYGV3lcdQ1OMPVfqoZ8ngOvGrzf28dhlYecp
        oYNPZx8uxvgAmgd54G2glSuTRC0/9aA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-223-WbR7mY6sOMy7RnJHn5Jk-A-1; Mon, 21 Aug 2023 09:19:35 -0400
X-MC-Unique: WbR7mY6sOMy7RnJHn5Jk-A-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-51866148986so2120837a12.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Aug 2023 06:19:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692623973; x=1693228773;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3iiqyRSxj16akmSutM6aV/PIkcKkD7OlE2OvC2dSwkg=;
        b=EGpC0sK3uLee4xdMyhME4B9VqDDefRqFJianD5ViM/mNRgm6ruGO2Ngg1NlFGXTeOw
         1F98hl3uw4D3239DRKZy/XeDZTJdpooiP0XfdpYkDO0SLohJutaQseEjgPQQOy1VNnir
         N8en2LVD21yO2AtLV0bvsdZEI5N3M4Gi7k28JnJQ5lntvhHQCi2a/sX7fTmMMuuUTj6b
         F+w7eaRKRICodTMaMB+gb7utQ6U0SU4QTwEnL9YEnRH9zkclNtK2/uB/bwGYQOR9pQG5
         QHBTCW0DjTSSBJQx+3/7Z4ysZWVZ7Pl1UGxWZBvPRcFRYzKUKesVxALQgfu1wA4RMeIS
         5KoQ==
X-Gm-Message-State: AOJu0YzTMF8m2fTtKrDXUZy3ffI1sLqBwFhsaeM81cWiJ10tOF9mwou2
        7mw4107EtacVve4I7dR/s8LtLD6OVTLRoM5JyF9iJfnVjOKiaKUGzXddSWXGvvx6rbjwaPosVNI
        R5pIu0MzHXYF/jypXW/Vw85HqzykCdnsgZKzihqoKhg==
X-Received: by 2002:a50:ee8c:0:b0:51d:9ddf:f0f6 with SMTP id f12-20020a50ee8c000000b0051d9ddff0f6mr4796930edr.36.1692623973311;
        Mon, 21 Aug 2023 06:19:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHKyD7cu+ZPZYV1VKCkyxNZmDOasOsCci0u+XO3vo3t8NgTR1ULpdxu2hG4vFMVuZtcjsMWg==
X-Received: by 2002:a50:ee8c:0:b0:51d:9ddf:f0f6 with SMTP id f12-20020a50ee8c000000b0051d9ddff0f6mr4796919edr.36.1692623973014;
        Mon, 21 Aug 2023 06:19:33 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id ca3-20020aa7cd63000000b00529fa63ef6fsm4456761edb.57.2023.08.21.06.19.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Aug 2023 06:19:32 -0700 (PDT)
Message-ID: <6cb1e07a-5896-fd49-cbfb-99499969092b@redhat.com>
Date:   Mon, 21 Aug 2023 15:19:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH platform-next v2 00/16] Add new features and amendments
 for Nvidia systems
Content-Language: en-US
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

Thanks.

1 remark about Patch #16: Documents new attributes, this does not document
the new reset_swb_dc_dc_pwr_fail attribute, please add this.

With that fixed the entire looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

for the series.

I tried applying this, but it is based on a tree which does not
have the recent: dd635e33b5c9a ("platform: mellanox: Introduce
support ofnew Nvidia L1 switch") commit causing patch 2/16 to
not apply.

Please rebase on top of the latest pdx86/for-next:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=for-next

and submit a version 3.

Regards,

Hans




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

