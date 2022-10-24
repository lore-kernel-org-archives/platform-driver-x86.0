Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BA28C67871
	for <platform-driver-x86@archiver.kernel.org>; Mon, 24 Oct 2022 19:50:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232561AbiJXTue (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 24 Oct 2022 15:50:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234275AbiJXTuM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 24 Oct 2022 15:50:12 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF0541C5E16
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Oct 2022 11:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666635309;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1ebv5PfsZX2R6eh39y9WmbJdsnetujUEQgGrB9f3X2I=;
        b=gev7xcvrJStgxollKyBZ4C1tmH/NBRPHQHC1XgrR3tDSjFLrHfHc6b0IuA6Yyn98xO0D0Q
        LeTTFvxigavXD8WpnI4hSZPIIRXs0I9qRmziSogcNICcbnY46OSXzG3T/XGDpdI8M/TQwH
        NxWxzsRB/u5brOjO4F0LttmgU3HXJls=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-513-pZn7s446Pc-pqKP10KwsYg-1; Mon, 24 Oct 2022 09:47:40 -0400
X-MC-Unique: pZn7s446Pc-pqKP10KwsYg-1
Received: by mail-ed1-f69.google.com with SMTP id x18-20020a05640226d200b00461e027f704so2058371edd.7
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Oct 2022 06:47:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1ebv5PfsZX2R6eh39y9WmbJdsnetujUEQgGrB9f3X2I=;
        b=R9kdnU1DYAxwSuIEd7IUhm5LclUc6pL+v2en6Kq5SqB8Jyw3tsJObWJpSHRX+rXohT
         FulcL0I0J+mgRC1PFLgKn9DF8GbyI/vFbnSgvBzhJXHfcu9MOryG0GG2FxywqrHnbg+X
         Fg0w0SA+yMzLTcTTmlkPFdCqbCAZ7277eJbYe5cPPjTn+QU6ToBByZ543EBLrMbqhdjl
         DlIDP3jrRSS5AEyqSf7RmQVk2ysVl/vQoHF5OqCCf0Ij2WICleUUdzZYWFMAbZXddPdM
         KIZbSNL1VXL/Z3hXrFJrVNsBNKIXwvT1gw6s/4AYlIxOKjMLPXcQN9pZub1Fq1J05O9V
         JxkA==
X-Gm-Message-State: ACrzQf2acNE34CjxNekVbswEzdVX9oUuPBOu2xZd/lhukkJ5gCKlBaZf
        peMiJ2671j326r8v+6MbgETB/KZbJMYxYqqp/viC/J2no9F/WADvqgfwOnUD9CjDhT5ASMEYVwv
        5NhSqqINm2eDVfDS3rnnxAqqsSkOJDjy4IQ==
X-Received: by 2002:a17:907:a067:b0:7a7:dc5e:eb2d with SMTP id ia7-20020a170907a06700b007a7dc5eeb2dmr4709573ejc.121.1666619259238;
        Mon, 24 Oct 2022 06:47:39 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7oLEXiE5I2sif+CugVS4fAFykp7aZ+J8hwrp6+8o79Py19z5YlVBnOblcNVHSJKIVCIbJM4Q==
X-Received: by 2002:a17:907:a067:b0:7a7:dc5e:eb2d with SMTP id ia7-20020a170907a06700b007a7dc5eeb2dmr4709548ejc.121.1666619259029;
        Mon, 24 Oct 2022 06:47:39 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id ck5-20020a0564021c0500b00461b169c02csm2670629edb.91.2022.10.24.06.47.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 06:47:38 -0700 (PDT)
Message-ID: <a70f951c-98d2-5b48-e8c0-08067a7a535c@redhat.com>
Date:   Mon, 24 Oct 2022 15:47:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2] platform/x86: dell-ddv: Minor style fixes
Content-Language: en-US
To:     Armin Wolf <W_Armin@gmx.de>, markgross@kernel.org
Cc:     andriy.shevchenko@intel.com, rafael@kernel.org, lenb@kernel.org,
        hmh@hmh.eng.br, matan@svgalib.org, corentin.chary@gmail.com,
        jeremy@system76.com, productdev@system76.com,
        mario.limonciello@amd.com, pobrn@protonmail.com,
        coproscefalo@gmail.com, platform-driver-x86@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220928221501.3823-1-W_Armin@gmx.de>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220928221501.3823-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/29/22 00:15, Armin Wolf wrote:
> Fix some style issues found during review to improve
> code maintainability, no functional changes.
> 
> Tested on a Dell Inspiron 3505.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans

> ---
> Changes in v2:
> - change commit message
> ---
>  drivers/platform/x86/dell/dell-wmi-ddv.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/dell-wmi-ddv.c b/drivers/platform/x86/dell/dell-wmi-ddv.c
> index 6ccce90f475d..699feae3c435 100644
> --- a/drivers/platform/x86/dell/dell-wmi-ddv.c
> +++ b/drivers/platform/x86/dell/dell-wmi-ddv.c
> @@ -1,13 +1,12 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
>  /*
> - * dell-wmi-ddv.c -- Linux driver for WMI sensor information on Dell notebooks.
> + * Linux driver for WMI sensor information on Dell notebooks.
>   *
>   * Copyright (C) 2022 Armin Wolf <W_Armin@gmx.de>
>   */
> 
>  #define pr_format(fmt) KBUILD_MODNAME ": " fmt
> 
> -#include <acpi/battery.h>
>  #include <linux/acpi.h>
>  #include <linux/debugfs.h>
>  #include <linux/device.h>
> @@ -21,6 +20,8 @@
>  #include <linux/sysfs.h>
>  #include <linux/wmi.h>
> 
> +#include <acpi/battery.h>
> +
>  #define DRIVER_NAME	"dell-wmi-ddv"
> 
>  #define DELL_DDV_SUPPORTED_INTERFACE 2
> @@ -52,7 +53,8 @@ enum dell_ddv_method {
> 
>  struct dell_wmi_ddv_data {
>  	struct acpi_battery_hook hook;
> -	struct device_attribute temp_attr, eppid_attr;
> +	struct device_attribute temp_attr;
> +	struct device_attribute eppid_attr;
>  	struct wmi_device *wdev;
>  };
> 
> @@ -153,8 +155,9 @@ static int dell_wmi_ddv_query_string(struct wmi_device *wdev, enum dell_ddv_meth
> 
>  static int dell_wmi_ddv_battery_index(struct acpi_device *acpi_dev, u32 *index)
>  {
> -	const char *uid_str = acpi_device_uid(acpi_dev);
> +	const char *uid_str;
> 
> +	uid_str = acpi_device_uid(acpi_dev);
>  	if (!uid_str)
>  		return -ENODEV;
> 
> --
> 2.30.2
> 

