Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD007C433E0
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Mar 2021 10:40:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 70E3964F32
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Mar 2021 10:40:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232740AbhCDKj1 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 4 Mar 2021 05:39:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51545 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238828AbhCDKjS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 4 Mar 2021 05:39:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614854272;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Mq6s6lGlN1ZbVnZ4h5bMHHoyyqWTE3vQLnBrrEva7IA=;
        b=OOEGpPppJ7o55l+s4OmwtWIpFzR9scLfMyaKrD5QiRDvDARCah25kDlsQyEEwtIyKuXTe6
        xT6Lf/8Rm1QbQ+0aV/QuHOS6//lLY6LDnrPu7BAk5JIN6nvdLfxNWatJD5stNeB8yGM9KE
        iH9Q/5q4Gi7SLwB5IysaBHBa/xUZIuE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-QmeEAOyPMrqIbNjqNr4-xQ-1; Thu, 04 Mar 2021 05:37:50 -0500
X-MC-Unique: QmeEAOyPMrqIbNjqNr4-xQ-1
Received: by mail-ed1-f72.google.com with SMTP id p12so13833119edw.9
        for <platform-driver-x86@vger.kernel.org>; Thu, 04 Mar 2021 02:37:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Mq6s6lGlN1ZbVnZ4h5bMHHoyyqWTE3vQLnBrrEva7IA=;
        b=IhgR/eY+TI70AtEOVrOYC1koH/bMdWm2r71v+c69AIUsKjRXkQ3LnjeUu0FUZ5UQJs
         GuURmGADuhz7lMTGr4wrahBYKOooOcZSt5MeAi+POlqwwSDduuuZR4Ix2zum2Uj6JEit
         f1MYE3a4SPHewHcSQxSN8GSOB8jyzVs4U4fN1Oh/dTPXX8MDpqT9erWZc/7n2nB2epP8
         nKYWoiClGLUn8MM1JN/hHIfFfogQsjZjVsQQdhCt994ic7MsbHKgCsHyvVqSOe4vGODT
         g8dwLzo2g6g0e19aIdCRB+H2NdyavDV7bSmk/F6YEb44xEkH1AkpI9WIrCai38d46jmJ
         2iTQ==
X-Gm-Message-State: AOAM533zxe/lvZLXq7Ulb1u22zmDnNAEEGMruabt1t8+g/oSFeUnORfK
        2RoRM1MIL9GFpTM6u1xAt7ZEQ9krutDB4sM3/hy/6tYgxho+GH0p6LPqENpaW2wyOsJnV/KktR4
        8Bm39wja+WvSLAlOLHoOYl57v0ItKCT4xNfYJN6Fw83nZruVDDYoyQpg+URlOlXgMXGtKE88l5R
        nmROl9A3rWsQ==
X-Received: by 2002:a05:6402:1c86:: with SMTP id cy6mr3504989edb.276.1614854269314;
        Thu, 04 Mar 2021 02:37:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxYfbyts3THpjan6uGgUPsayCjza9attobJPh865JxUuoXtDOsrnMu7rfTskvIH432tDTGGmg==
X-Received: by 2002:a05:6402:1c86:: with SMTP id cy6mr3504970edb.276.1614854269057;
        Thu, 04 Mar 2021 02:37:49 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id fw3sm19735787ejb.82.2021.03.04.02.37.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Mar 2021 02:37:48 -0800 (PST)
Subject: Re: [PATCH RFC platform-next 3/8] Documentation/ABI: Add new
 attributes for mlxreg-io sysfs interfaces
To:     Vadim Pasternak <vadimp@nvidia.com>, andy@infradead.org
Cc:     platform-driver-x86@vger.kernel.org
References: <20210203173622.5845-1-vadimp@nvidia.com>
 <20210203173622.5845-4-vadimp@nvidia.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <d348de53-5c4d-7086-bf69-8089254f8dcf@redhat.com>
Date:   Thu, 4 Mar 2021 11:37:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210203173622.5845-4-vadimp@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/3/21 6:36 PM, Vadim Pasternak wrote:
> Add documentation for the new attributes:
> - "lc{n}_enable" - for put/release the line card to/from enable state.
> - "lc{n}_pwr" - for power on/off the line card.
> - "lc{n}_rst_mask" - for line card reset state enforced by ASIC, when
>   it sets it due to some abnormal ASIC behavior.
> - "psu3_on"; "psu4_on" - for connection/disconnection power supply unit
>   to/from the power source.
> - "os_ready" - for indication that OS is taking control over systems
>   programmable devices.
> - "pm_mgmt_en" - for setting power management control ownership. When
>   power management control is provided by hardware, it means that
>   hardware will automatically power off one or more line cards in case
>   system power budget is under power required for feeding all powered
>   on line cards. It could be a case, when some of power units lost
>   power good state.
> - "shutdown_unlock" - for unlocking system after hardware or firmware
>   thermal shutdown, which causes locking of the all interfaces to ASIC.
> 
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
> ---
>  Documentation/ABI/stable/sysfs-driver-mlxreg-io | 103 ++++++++++++++++++++++++
>  1 file changed, 103 insertions(+)
> 
> diff --git a/Documentation/ABI/stable/sysfs-driver-mlxreg-io b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
> index fd9a8045bb0c..1d1a8ee59534 100644
> --- a/Documentation/ABI/stable/sysfs-driver-mlxreg-io
> +++ b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
> @@ -223,3 +223,106 @@ Description:	These files show with which CPLD part numbers and minor
>  		system.
>  
>  		The files are read only.
> +
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc1_enable
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc2_enable
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc3_enable
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc4_enable
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc5_enable
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc6_enable
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc7_enable
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc8_enable
> +Date:		March 2021
> +KernelVersion:	5.12
> +Contact:	Vadim Pasternak <vadimp@nvidia.com>
> +Description:	These files allow line cards enable state control.
> +		Expected behavior:
> +		When  lc{n}_enable is written 1, related line card is released
> +		from the reset state, when 0 - is hold in reset state.
> +
> +		The files are read/write.
> +
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc1_pwr
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc2_pwr
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc3_pwr
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc4_pwr
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc5_pwr
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc6_pwr
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc7_pwr
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc8_pwr
> +Date:		March 2021
> +KernelVersion:	5.12
> +Contact:	Vadim Pasternak <vadimp@nvidia.com>
> +Description:	These files switching line cards power on and off.
> +		Expected behavior:
> +		When  lc{n}_pwr is written 1, related line card is powered
> +		on, when written 0 - powered off.
> +
> +		The files are read/write.
> +
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc1_rst_mask
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc2_rst_mask
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc3_rst_mask
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc4_rst_mask
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc5_rst_mask
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc6_rst_mask
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc7_rst_mask
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc8_rst_mask
> +Date:		March 2021
> +KernelVersion:	5.12
> +Contact:	Vadim Pasternak <vadimp@nvidia.com>
> +Description:	These files clear line card reset bit enforced by ASIC, when it
> +		sets it due to some abnormal ASIC behavior.
> +		Expected behavior:
> +		When  lc{n}_rst_mask is written 1, related line card reset bit
> +		is cleared, when written 0 - no effect.
> +
> +		The files are read/write.

What happens when reading these ?  Maybe they should be write only ?

> +
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/os_ready
> +Date:		March 2021
> +KernelVersion:	5.12
> +Contact:	Vadim Pasternak <vadimp@nvidia.com>
> +Description:	This file, when written 1, indicates that OS is taking control
> +		over systems programmable devices.
> +
> +		The file is read only.

I don't understand what this file does, the description suggests (to me) that the
OS (userspace?) writes 1 to it to indicate it is taking over control from the firmware,
but then it says that this is "read only" ?

Please make the doc here a bit more clear about what this file is for.

> +
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/pm_mgmt_en
> +Date:		March 2021
> +KernelVersion:	5.12
> +Contact:	Vadim Pasternak <vadimp@nvidia.com>
> +Description:	This file assigns power management control ownership.
> +		When power management control is provided by hardware, it means
> +		that hardware will automatically power off one or more line
> +		cards in case system power budget is under power required for

's/under/below the/' make this sentence more clear I believe.

> +		feeding all powered on line cards. It could be a case, when
> +		some of power units lost power good state.
> +		When pm_mgmt_en is written 1, power management control by
> +		software is enabled, 0 - power management control by hardware.
> +		Default is 0.
> +
> +		The file is read/write.

What happens if the software is responsible and it enables all line modules and
that leads to the system going over its power-budget ?

> +
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/psu3_on
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/psu4_on
> +Date:		March 2021
> +KernelVersion:	5.12
> +Contact:	Vadim Pasternak <vadimp@nvidia.com>
> +Description:	These files switching power supply units on and off.
> +		Expected behavior:
> +		When  psu3_on or psu4_on is written 1, related unit will be
> +		disconnected from the power source, when written 0 - connected.
> +
> +		The files are write only.
> +
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/shutdown_unlock
> +Date:		March 2021
> +KernelVersion:	5.12
> +Contact:	Vadim Pasternak <vadimp@nvidia.com>
> +Description:	This file unlocks system after hardware or firmware thermal
> +		shutdown, which causes locking of the all interfaces to ASIC.
> +		When shutdown_unlock is written 1 and after that 0, it removes
> +		locking.
> +
> +		The file is read/write.
> 

Regards,

Hans

