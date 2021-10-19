Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43A21C433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 19 Oct 2021 15:11:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1CB2D6135F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 19 Oct 2021 15:11:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229803AbhJSPOJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 19 Oct 2021 11:14:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55461 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229930AbhJSPOI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 19 Oct 2021 11:14:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1634656315;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wy1q67PmsQEWT0t/bDJArNsi4tOz0lyrwcasr3/ZP0c=;
        b=f75RN+u2gEr78lI2BtUrij/w5IOyMEXNgBFm3BwVWQcxn7hnj8R1Q3GRIwVefk68JQ+I3P
        eN6KjPzEpEGFpMiYE1swcwKd6I85hxw4oDy0PvckPasAgc53QVfgMasmH2TLwkcxyChi5o
        iLc1me1AdxQEuY0aows96PV0TFfOHJk=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-Ro36FfVCNfWxhP8xCtn6sQ-1; Tue, 19 Oct 2021 11:11:53 -0400
X-MC-Unique: Ro36FfVCNfWxhP8xCtn6sQ-1
Received: by mail-ed1-f72.google.com with SMTP id i7-20020a50d747000000b003db0225d219so13281978edj.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 19 Oct 2021 08:11:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=wy1q67PmsQEWT0t/bDJArNsi4tOz0lyrwcasr3/ZP0c=;
        b=Cyi5hWkd20yg6K+qY+kaNrTjSlhyhFZHDoyqWjjVNmCnzih4edNLKFTUj2eYS1vGWJ
         QtN9AEPdOcpS41qZRhpCE6mmcekgrV6E3/bg5Hrrii7LfdOjzfxMCuqsnijj1Abxzk5m
         GgISEuYNieCEC7+6EHmyZdlXPBjFSuMESv5/G5HPcPmLzUN8EUnAOcxXSox4dN4kfqBL
         d01qOL+l/5H45DWjIetHOSYYyfHZJf+F82hSrgs5C58uLWXhrBaHVPxEFDiqWnO7oWsU
         lLp42AjrlXoRGy4OSt1E4/XlBZ+Brc09M+xGeR+HtgH0nftluhrNoViYWG0rgxKKfbUF
         p5vA==
X-Gm-Message-State: AOAM532cLnI6kAlFKUwSXsQ88qsrne+/3MSr5pn4qGVLDb3T9G82vY05
        QwcIzg7Rm4HdZfONaiCZagcFqz7Iuu+8FoxXoCYkae2QBZddHQLveNr2ZQRdT7U4Qoq6N+ln/2T
        KqvSb55Lyxw4A9J6ZCY3eScH0bvIH2ujdig==
X-Received: by 2002:a17:906:ed1:: with SMTP id u17mr38510776eji.304.1634656312683;
        Tue, 19 Oct 2021 08:11:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyKzeihlDIYchkrpEqgLfWhRWUnW2ZweF0Ah/DI0EDT/vfTeHEiVHtgV3LM3BGLGPjRsI1j7Q==
X-Received: by 2002:a17:906:ed1:: with SMTP id u17mr38510754eji.304.1634656312469;
        Tue, 19 Oct 2021 08:11:52 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id h10sm11276959edf.85.2021.10.19.08.11.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Oct 2021 08:11:52 -0700 (PDT)
Message-ID: <2deb56e0-24a6-6615-d95e-e0efb7f86db2@redhat.com>
Date:   Tue, 19 Oct 2021 17:11:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] platform/x86: wmi: change notification handler type
Content-Language: en-US
To:     Mikalai Ramanovich <nikolay.romanovich.00@gmail.com>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org
References: <20211015191322.73388-1-nikolay.romanovich.00@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211015191322.73388-1-nikolay.romanovich.00@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/15/21 21:13, Mikalai Ramanovich wrote:
> Since AML code on some Xiaomi laptops notifies the WMI hotkey with
> 0x20 event, we need ACPI_ALL_NOTIFY here to be able to handle it.
> 
> Signed-off-by: Mikalai Ramanovich <nikolay.romanovich.00@gmail.com>

Hmm, this is a rather unusual change and I'm worried that it may have
some bad side-effects.

Can you provide the model-number and an acpidump for the laptop where
you need this ? And maybe also point out which bit (which lines after
disassembling) of the DSDT needs this ?

ATM I'm thinking that it might be best to do something like this:

static u32 acpi_wmi_get_handler_type(void)
{
	if (dmi_name_in_vendors("XIAOMI"))
		return ACPI_ALL_NOTIFY;
	else
		return ACPI_DEVICE_NOTIFY;
}

	status = acpi_install_notify_handler(acpi_device->handle,
					     acpi_wmi_get_handler_type(),
					     acpi_wmi_notify_handler,
					     NULL);

(and the same for the remove)

So that we limit this behavior to the Xiaomi case.

Note you may need to change the capitalization of XIAOMI to match
the value used in /sys/class/dmi/id/sys_vendor

Regards,

Hans



> ---
>  drivers/platform/x86/wmi.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
> index e6997be206f1..c34341f4da76 100644
> --- a/drivers/platform/x86/wmi.c
> +++ b/drivers/platform/x86/wmi.c
> @@ -1352,7 +1352,7 @@ static int acpi_wmi_remove(struct platform_device *device)
>  {
>  	struct acpi_device *acpi_device = ACPI_COMPANION(&device->dev);
>  
> -	acpi_remove_notify_handler(acpi_device->handle, ACPI_DEVICE_NOTIFY,
> +	acpi_remove_notify_handler(acpi_device->handle, ACPI_ALL_NOTIFY,
>  				   acpi_wmi_notify_handler);
>  	acpi_remove_address_space_handler(acpi_device->handle,
>  				ACPI_ADR_SPACE_EC, &acpi_wmi_ec_space_handler);
> @@ -1385,7 +1385,7 @@ static int acpi_wmi_probe(struct platform_device *device)
>  	}
>  
>  	status = acpi_install_notify_handler(acpi_device->handle,
> -					     ACPI_DEVICE_NOTIFY,
> +					     ACPI_ALL_NOTIFY,
>  					     acpi_wmi_notify_handler,
>  					     NULL);
>  	if (ACPI_FAILURE(status)) {
> @@ -1414,7 +1414,7 @@ static int acpi_wmi_probe(struct platform_device *device)
>  	device_unregister(wmi_bus_dev);
>  
>  err_remove_notify_handler:
> -	acpi_remove_notify_handler(acpi_device->handle, ACPI_DEVICE_NOTIFY,
> +	acpi_remove_notify_handler(acpi_device->handle, ACPI_ALL_NOTIFY,
>  				   acpi_wmi_notify_handler);
>  
>  err_remove_ec_handler:
> 

