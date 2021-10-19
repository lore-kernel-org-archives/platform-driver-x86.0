Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40963C433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 19 Oct 2021 08:57:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1CBE96103D
	for <platform-driver-x86@archiver.kernel.org>; Tue, 19 Oct 2021 08:57:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234814AbhJSJAA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 19 Oct 2021 05:00:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20756 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229930AbhJSI77 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 19 Oct 2021 04:59:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1634633866;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HwxXgeM2NASyS4XYB6ZEI/fVlAuU1XAQdiPjyGiePyE=;
        b=HsS32GO6UD0RbuRfZEhFs7GdeeLRTL65BRJM3R62JfFHG/JyWI6yGdDE+WWcyJmB5+VkiR
        sSj9MgLDJH0XCg0GoMxaz4iYu55KmHd+OoLY7oEt95aX3AOj3KAt0nHcj3gzFVLIY4GCQh
        IRwnKGOm1J/Gqs9obP/DuT0Xb5GOyDs=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-571-UFO8qa23PEm-ud_LpPS28w-1; Tue, 19 Oct 2021 04:57:15 -0400
X-MC-Unique: UFO8qa23PEm-ud_LpPS28w-1
Received: by mail-ed1-f69.google.com with SMTP id g28-20020a50d0dc000000b003dae69dfe3aso16934597edf.7
        for <platform-driver-x86@vger.kernel.org>; Tue, 19 Oct 2021 01:57:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=HwxXgeM2NASyS4XYB6ZEI/fVlAuU1XAQdiPjyGiePyE=;
        b=d/kB2TQ+cjlac29BTAuboFqfDEEUzCNRyMJxpXHBNH9BQjlU2/IfrqCeXh4x+K8tCS
         Z5rm3njDaYihA18/PEhqaUtEDODrZ2uUHb/FRzcljyPFE3x19VhGsEzkgBWHCcBF+do7
         lopyLjLFWOf9VnYVMI6keSUJMj7PAqfOhJzJ4hQmn0WKwK0NmeO7bnhZNoJQ8uOrsroc
         +bl3nqjxx8vs/tTVuyzF6i73B44Ot76UG2IMMRoLi+GxDL7kU7QbSJrO2N2oX7D5O4H8
         CyQijKzlV2Qebzcc78q+ftqF0N5UbxMwQiXcYxT2f931buuvRgOiZuEfMFqiok4DCaTg
         b3uQ==
X-Gm-Message-State: AOAM533WCbbFNed4Ozzhs9uv5cwrRVpbYF+lhY4qEjDFm6XycU2R7DlE
        XLz8IFrH9lp9daOwGDEqv7Q61rSjdn717e7/oqOEvjO3FQkY9huMPbiZfb54nWbgDs6ndwdnFQk
        18qktIjPHCASYFuE3BiXfm4Tki8OFIm0Tnw==
X-Received: by 2002:a05:6402:34f:: with SMTP id r15mr52486973edw.111.1634633834087;
        Tue, 19 Oct 2021 01:57:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJUfQGO+e495adUgOZt66X+NO4k1mXrBnvdAtGG+TdvAWf4lToDoAv857MWNXt/v7RLb1XlQ==
X-Received: by 2002:a05:6402:34f:: with SMTP id r15mr52486943edw.111.1634633833825;
        Tue, 19 Oct 2021 01:57:13 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id u23sm10914236edr.97.2021.10.19.01.57.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Oct 2021 01:57:13 -0700 (PDT)
Message-ID: <bb2330cf-07db-e9df-67bd-de8e62650a0e@redhat.com>
Date:   Tue, 19 Oct 2021 10:57:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH platform-next 09/10] Documentation/ABI: Add new line card
 attributes for mlxreg-io sysfs interfaces
Content-Language: en-US
To:     Vadim Pasternak <vadimp@nvidia.com>
Cc:     platform-driver-x86@vger.kernel.org, michaelsh@nvidia.com
References: <20211002093238.3771419-1-vadimp@nvidia.com>
 <20211002093238.3771419-10-vadimp@nvidia.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211002093238.3771419-10-vadimp@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/2/21 11:32, Vadim Pasternak wrote:
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
> Reviewed-by: Michael Shych <michaelsh@nvidia.com>

Applying this gave the following warnings:

Applying: Documentation/ABI: Add new line card attributes for mlxreg-io sysfs interfaces
/home/hans/projects/linux/.git/worktrees/platform-drivers-x86/rebase-apply/patch:44: space before tab in indent.
 		If the system is in locked-down mode writing this file will not
/home/hans/projects/linux/.git/worktrees/platform-drivers-x86/rebase-apply/patch:76: space before tab in indent.
 		If the system is in locked-down mode writing these files will
/home/hans/projects/linux/.git/worktrees/platform-drivers-x86/rebase-apply/patch:100: space before tab in indent.
 		If the system is in locked-down mode writing these files will
warning: 3 lines add whitespace errors.

I've fixed this up locally.

FYI the 3 "If the system is in locked-down mode writing this file will not"
lines started with <tab><space><tab> which I've replaced with <tab><tab>.

Regards,

Hans


> ---
>  .../ABI/stable/sysfs-driver-mlxreg-io         | 103 ++++++++++++++++++
>  1 file changed, 103 insertions(+)
> 
> diff --git a/Documentation/ABI/stable/sysfs-driver-mlxreg-io b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
> index 6ef6979c9448..b25e963ec0fa 100644
> --- a/Documentation/ABI/stable/sysfs-driver-mlxreg-io
> +++ b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
> @@ -361,3 +361,106 @@ Description:	This file allows to unlock ASIC after thermal shutdown event.
>  		Default is 1.
>  
>  		The file is read/write.
> +
> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/cpld1_pn
> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/cpld1_version
> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/cpld1_version_min
> +Date:		October 2021
> +KernelVersion:	5.16
> +Contact:	Vadim Pasternak <vadimp@nvidia.com>
> +Description:	These files show with which CPLD major and minor versions
> +		and part number has been burned CPLD device on line card.
> +
> +		The files are read only.
> +
> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/fpga1_pn
> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/fpga1_version
> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/fpga1_version_min
> +Date:		October 2021
> +KernelVersion:	5.16
> +Contact:	Vadim Pasternak <vadimp@nvidia.com>
> +Description:	These files show with which FPGA major and minor versions
> +		and part number has been burned FPGA device on line card.
> +
> +		The files are read only.
> +
> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/vpd_wp
> +Date:		October 2021
> +KernelVersion:	5.16
> +Contact:	Vadim Pasternak <vadimp@nvidia.com>
> +Description:	This file allow to overwrite line card VPD hardware write
> +		protection mode. When attribute is set 1 - write protection is
> +		disabled, when 0 - enabled.
> +		Default is 0.
> + 		If the system is in locked-down mode writing this file will not
> +		be allowed.
> +		The purpose if this file is to allow line card VPD burning
> +		during production flow.
> +
> +		The file is read/write.
> +
> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/reset_aux_pwr_or_ref
> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/reset_dc_dc_pwr_fail
> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/reset_fpga_not_done
> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/reset_from_chassis
> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/reset_line_card
> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/reset_pwr_off_from_chassis
> +Date:		October 2021
> +KernelVersion:	5.16
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
> +Date:		October 2021
> +KernelVersion:	5.16
> +Contact:	Vadim Pasternak <vadimp@nvidia.com>
> +Description:	These files allow CPLD and FPGA burning. Value 1 in file means burning
> +		is enabled, 0 - otherwise.
> + 		If the system is in locked-down mode writing these files will
> +		not be allowed.
> +		The purpose of these files to allow line card CPLD and FPGA
> +		upgrade through the JTAG daisy-chain.
> +
> +		The files are read/write.
> +
> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/qsfp_pwr_en
> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/pwr_en
> +Date:		October 2021
> +KernelVersion:	5.16
> +Contact:	Vadim Pasternak <vadimp@nvidia.com>
> +Description:	These files allow to power on/off all QSFP ports and whole line card.
> +		The attributes are set 1 for power on, 0 - for power off.
> +
> +		The files are read/write.
> +
> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/agb_spi_burn_en
> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/fpga_spi_burn_en
> +Date:		October 2021
> +KernelVersion:	5.16
> +Contact:	Vadim Pasternak <vadimp@nvidia.com>
> +Description:	These files allow gearboxes and FPGA SPI flash burning.
> +		The attributes are set 1 to enable burning, 0 - to disable.
> + 		If the system is in locked-down mode writing these files will
> +		not be allowed.
> +		The purpose of these files to allow line card Gearboxes and FPGA
> +		burning during production flow.
> +
> +		The file is read/write.
> +
> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/max_power
> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/config
> +Date:		October 2021
> +KernelVersion:	5.16
> +Contact:	Vadim Pasternak <vadimp@nvidia.com>
> +Description:	These files provide the maximum powered required for line card
> +		feeding and line card configuration Id.
> +
> +		The files are read only.
> 

