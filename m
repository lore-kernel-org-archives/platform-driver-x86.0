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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17CCBC433E9
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Mar 2021 10:42:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E78CA64F31
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Mar 2021 10:42:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238840AbhCDKlf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 4 Mar 2021 05:41:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38907 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238837AbhCDKl1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 4 Mar 2021 05:41:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614854401;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nAP0Z4s43h/z1kWawj9MTUHekViQQwgsSUptcLaCIVo=;
        b=L9DAUly5I4kCUwaEYMRPNVj9Ko2+Cn/+gxuLN+OEveevaPb30maFqHP086iDLrfOzBCASU
        Jh8Twc4Nl1h8Gls5rqi5V8n+y0IMlHWY+7xOb08xguZAqbCQ6k5PoA1IR4ix6gGl/hVZeX
        qaa27ZA/cdZBw4roSNfJDCp7Rv9Az7g=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-fwnNNe7bNuyG_e5aj5dEzg-1; Thu, 04 Mar 2021 05:40:00 -0500
X-MC-Unique: fwnNNe7bNuyG_e5aj5dEzg-1
Received: by mail-ed1-f72.google.com with SMTP id u2so13819269edj.20
        for <platform-driver-x86@vger.kernel.org>; Thu, 04 Mar 2021 02:39:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nAP0Z4s43h/z1kWawj9MTUHekViQQwgsSUptcLaCIVo=;
        b=ZB3KpFzK6KIX3/7jcuDq8wna6U3bGsJcy+D2AkZYE/0E/vkAX0uNAQkbo6Ygzlt5L5
         zgttLa7XbyKPFI0YlUZnsDg3EupghnhVZjr6XN4X4htWcUtdb16te4Fdp+mYMlQczRs9
         +gN8Zgln80rX003j/Bz6n5t1eNXogYa67m17g/p9uLZ0k/Z8ll4ONIrSkVhk7w4Z5+2u
         4Y/bh4sAoEQUeUNT9mS8OPvG7P+zfrjxRxopDtITjOYwcmATqxc4+mKKUs36j4TTfwES
         VBn+tqJYK0DC6c3HBY4zrsNGfjwaWQ1rFHg3d+Wxz+PKplhNBE475dPnzf8Wbke1Ry/n
         qZjQ==
X-Gm-Message-State: AOAM533MS7b27pMjjMMKNRbkHOBrz13ciF+outknsm6ab2Ye6w4H/TT8
        ltfZAWZe3K0MqYb6iEVTSQ3MfSUp+YFAJ1D7f723ubeOyWSTWjuG/GbT/Wt67HOSJ3xV9pz1N5n
        H5AiTNs2Os8t7sPV+adQsygO8jTFZP5j7f/tgCmnV8Hy0Dv7fobLR51QSPMytlgH3TfuUeZfGVI
        O+172V790zHw==
X-Received: by 2002:a17:906:2dda:: with SMTP id h26mr3447005eji.163.1614854398412;
        Thu, 04 Mar 2021 02:39:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzHPssODCRcYY8snkF0G8LEdAIZCyX7jC7X+DFyxjteo0XsDeWB4BGv0ZeZNmblNi0YCFaZSg==
X-Received: by 2002:a17:906:2dda:: with SMTP id h26mr3446992eji.163.1614854398191;
        Thu, 04 Mar 2021 02:39:58 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id dz7sm23995937edb.74.2021.03.04.02.39.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Mar 2021 02:39:57 -0800 (PST)
Subject: Re: [PATCH RFC platform-next 8/8] Documentation/ABI: Add new line
 card attributes for mlxreg-io sysfs interfaces
To:     Vadim Pasternak <vadimp@nvidia.com>, andy@infradead.org
Cc:     platform-driver-x86@vger.kernel.org
References: <20210203173622.5845-1-vadimp@nvidia.com>
 <20210203173622.5845-9-vadimp@nvidia.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <009a1a80-62ca-35ce-5f02-b43b25e5ebd1@redhat.com>
Date:   Thu, 4 Mar 2021 11:39:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210203173622.5845-9-vadimp@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/3/21 6:36 PM, Vadim Pasternak wrote:
> Add documentation for the new attributes for line cards:
> - CPLDs versioning.
> - Write protection control for 'nvram' devices.
> - Line card reset reasons.
> - Enabling burning of FPGA and CPLDs.
> - Enabling burning of FPGA and gearbox SPI flashes,
> - Enabling power of whole line card.
> - Enabling power of QSFP ports equipped on line card.
> - The maximum powered required for line card feeding.
> - Line card configuration Id.
> 
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
> ---
>  Documentation/ABI/stable/sysfs-driver-mlxreg-io | 92 +++++++++++++++++++++++++
>  1 file changed, 92 insertions(+)
> 
> diff --git a/Documentation/ABI/stable/sysfs-driver-mlxreg-io b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
> index 1d1a8ee59534..a22e9d6c0904 100644
> --- a/Documentation/ABI/stable/sysfs-driver-mlxreg-io
> +++ b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
> @@ -326,3 +326,95 @@ Description:	This file unlocks system after hardware or firmware thermal
>  		locking.
>  
>  		The file is read/write.
> +
> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/cpld1_pn
> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/cpld1_version
> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/cpld1_version_min
> +Date:		March 2021
> +KernelVersion:	5.12
> +Contact:	Vadim Pasternak <vadimp@nvidia.com>
> +Description:	These files show with which CPLD major and minor versions
> +		and part number has been burned CPLD device on line card.
> +
> +		The files are read only.
> +
> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/fpga1_pn
> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/fpga1_version
> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/fpga1_version_min
> +Date:		March 2021
> +KernelVersion:	5.12
> +Contact:	Vadim Pasternak <vadimp@nvidia.com>
> +Description:	These files show with which FPGA major and minor versions
> +		and part number has been burned FPGA device on line card.
> +
> +		The files are read only.
> +
> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/ini_wp
> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/vpd_wp
> +Date:		March 2021
> +KernelVersion:	5.12
> +Contact:	Vadim Pasternak <vadimp@nvidia.com>
> +Description:	These files allow to overwrite line card VPD and firmware blob
> +		hardware write protection mode. When attribute is set 1 - write
> +		protection is disabled, when 0 - enabled. By default both are
> +		write protected.
> +
> +		The files are read/write.

This seems to have some serious security implications. IMHO this should be tie into the
kernel's new(ish) lockdown system, so that if the system is in locked-down mode writing
these will not be allowed.

> +
> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/reset_aux_pwr_or_ref
> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/reset_dc_dc_pwr_fail
> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/reset_fpga_not_done
> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/reset_from_chassis
> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/reset_line_card
> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/reset_pwr_off_from_chassis
> +Date:		March 2021
> +KernelVersion:	5.12
> +Contact:	Vadim Pasternak <vadimp@nvidia.com>
> +Description:	These files show the line reset cause, as following: power
> +		auxiliary outage or power refresh, DC-to-DC power failure, FPGA reset
> +		failed, line card reset failed, power off from chassis.
> +		Value 1 in file means this is reset cause, 0 - otherwise. Only one of
> +		the above causes could be 1 at the same time, representing only last
> +		reset cause.
> +
> +		The files are read only.
> +
> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/cpld_upgrade_en
> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/fpga_upgrade_en
> +Date:		March 2021
> +KernelVersion:	5.12
> +Contact:	Vadim Pasternak <vadimp@nvidia.com>
> +Description:	These files allow CPLD and FPGA burning. Value 1 in file means burning
> +		is enabled, 0 - otherwise.
> +
> +		The files are read/write.

Same remark as above.

> +
> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/qsfp_pwr_en
> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/pwr_en
> +Date:		March 2021
> +KernelVersion:	5.12
> +Contact:	Vadim Pasternak <vadimp@nvidia.com>
> +Description:	These files allow to power on/off all QSFP ports and whole line card.
> +		The attributes are set 1 for power on, 0 - for power off.
> +
> +		The files are read/write.
> +
> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/agb_spi_burn_en
> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/fpga_spi_burn_en
> +Date:		March 2021
> +KernelVersion:	5.12
> +Contact:	Vadim Pasternak <vadimp@nvidia.com>
> +Description:	These files allow gearboxes and FPGA SPI flash burning.
> +		The attributes are set 1 to enable burning, 0 - to disable.
> +
> +		The file is read/write.

Same remark as above.

> +
> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/max_power
> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/config
> +Date:		March 2021
> +KernelVersion:	5.12
> +Contact:	Vadim Pasternak <vadimp@nvidia.com>
> +Description:	These files provide the maximum powered required for line card
> +		feeding and line card configuration Id.
> +
> +		The files are read only.
> 

Regards,

Hans

