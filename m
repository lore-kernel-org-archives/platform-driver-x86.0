Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E6DCC433DB
	for <platform-driver-x86@archiver.kernel.org>; Mon,  4 Jan 2021 12:01:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3014E21D79
	for <platform-driver-x86@archiver.kernel.org>; Mon,  4 Jan 2021 12:01:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726306AbhADMBM (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 4 Jan 2021 07:01:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31025 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726098AbhADMBM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 4 Jan 2021 07:01:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1609761585;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pres5e8WrRpvRCj7iEQnIu8o6lrBPcNGoStEUF06tHM=;
        b=ZpQdC2mOIa7qbn1oAqbCO+f4Q/rcONdSidSZGp/8HJpjZxMVgsZqT5WfsAoy0ZGSwQTGGr
        njveq2LpA2KvanUDW11jbMFRXlwaxDwLmSiFuV35JJUfRNE9T1QJ746zPvofSaJfwQrUg3
        pThGhov62I7H5O819blXDxaeCSFwdDw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-05aQ-JSAOFymBV10O52sGA-1; Mon, 04 Jan 2021 06:59:42 -0500
X-MC-Unique: 05aQ-JSAOFymBV10O52sGA-1
Received: by mail-ej1-f72.google.com with SMTP id k3so6886982ejr.16
        for <platform-driver-x86@vger.kernel.org>; Mon, 04 Jan 2021 03:59:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pres5e8WrRpvRCj7iEQnIu8o6lrBPcNGoStEUF06tHM=;
        b=OoN+D0AW9oLRPQRR3R0fEafXvz7kyxUkLfe+klb+y6Pe2GkNVgkXU+xr/gNYYmrq0B
         vJAX4WOyIjZnerMk76Gx4yhaYosajrOSIE2/RTB8ABy2Bv1KCzFvACEO4zNtpub2nISo
         EfHInHv50/NHiUcpmoqPKB2oqQOWcGuw+I9SU0fkv44Xqa3uUy1Z1Ybmk7xD7EX0wcj2
         QVcWYyNVjaAb4q98a7hmyuV8AqfcjUZH7ZXHegK7DmlfnhiC/ufPPLYDjj8g7+5TnxSL
         bR0tNBqMALs4kjZ/xh4+0P+92yKZ9ZJON4BqmhEEzMo0glYwIArl5nopINf2lrvGTPQI
         gCZg==
X-Gm-Message-State: AOAM530oQ0/cJO5iFyoolyS8CBp0s/DdEdSMZABfGX3zWOAQRYs961gp
        LpS3DjfB4qm4wiCw0amY/mC1gXikJPtZEJb74TauJCgEGsBLO6oL20mek0csSDlKvBw5CVdx2Vt
        XzB8qwj94/B+8kDV0Cprat0f2fuIWFwTHWg==
X-Received: by 2002:a17:906:d784:: with SMTP id pj4mr64447413ejb.360.1609761580992;
        Mon, 04 Jan 2021 03:59:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxtNlcqeBweOBOg+dDeiF31iBz+D6P3NJw9O4uA6DMPJS1Pge79InvCsi/rq7oRYQrdZ6wEfw==
X-Received: by 2002:a17:906:d784:: with SMTP id pj4mr64447403ejb.360.1609761580815;
        Mon, 04 Jan 2021 03:59:40 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id 35sm43202887ede.0.2021.01.04.03.59.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jan 2021 03:59:40 -0800 (PST)
Subject: Re: [PATCH] ACPI / scan: Don't create platform device for INT3515
 ACPI nodes
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Moody Salem <moody@uniswap.org>, stable@vger.kernel.org
References: <20201223143644.33341-1-heikki.krogerus@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <ae94a191-4273-0000-deda-4859034343b8@redhat.com>
Date:   Mon, 4 Jan 2021 12:59:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201223143644.33341-1-heikki.krogerus@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 12/23/20 3:36 PM, Heikki Krogerus wrote:
> There are several reports about the tps6598x causing
> interrupt flood on boards with the INT3515 ACPI node, which
> then causes instability. There appears to be several
> problems with the interrupt. One problem is that the
> I2CSerialBus resources do not always map to the Interrupt
> resource with the same index, but that is not the only
> problem. We have not been able to come up with a solution
> for all the issues, and because of that disabling the device
> for now.
> 
> The PD controller on these platforms is autonomous, and the
> purpose for the driver is primarily to supply status to the
> userspace, so this will not affect any functionality.
> 
> Reported-by: Moody Salem <moody@uniswap.org>
> Fixes: a3dd034a1707 ("ACPI / scan: Create platform device for INT3515 ACPI nodes")
> Cc: stable@vger.kernel.org
> Link: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1883511
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

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
>  drivers/platform/x86/i2c-multi-instantiate.c | 31 +++++++++++++++-----
>  1 file changed, 23 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/platform/x86/i2c-multi-instantiate.c b/drivers/platform/x86/i2c-multi-instantiate.c
> index 6acc8457866e1..e1df665d3ad31 100644
> --- a/drivers/platform/x86/i2c-multi-instantiate.c
> +++ b/drivers/platform/x86/i2c-multi-instantiate.c
> @@ -166,13 +166,29 @@ static const struct i2c_inst_data bsg2150_data[]  = {
>  	{}
>  };
>  
> -static const struct i2c_inst_data int3515_data[]  = {
> -	{ "tps6598x", IRQ_RESOURCE_APIC, 0 },
> -	{ "tps6598x", IRQ_RESOURCE_APIC, 1 },
> -	{ "tps6598x", IRQ_RESOURCE_APIC, 2 },
> -	{ "tps6598x", IRQ_RESOURCE_APIC, 3 },
> -	{}
> -};
> +/*
> + * Device with _HID INT3515 (TI PD controllers) has some unresolved interrupt
> + * issues. The most common problem seen is interrupt flood.
> + *
> + * There are at least two known causes. Firstly, on some boards, the
> + * I2CSerialBus resource index does not match the Interrupt resource, i.e. they
> + * are not one-to-one mapped like in the array below. Secondly, on some boards
> + * the irq line from the PD controller is not actually connected at all. But the
> + * interrupt flood is also seen on some boards where those are not a problem, so
> + * there are some other problems as well.
> + *
> + * Because of the issues with the interrupt, the device is disabled for now. If
> + * you wish to debug the issues, uncomment the below, and add an entry for the
> + * INT3515 device to the i2c_multi_instance__ids table.
> + *
> + * static const struct i2c_inst_data int3515_data[]  = {
> + *	{ "tps6598x", IRQ_RESOURCE_APIC, 0 },
> + *	{ "tps6598x", IRQ_RESOURCE_APIC, 1 },
> + *	{ "tps6598x", IRQ_RESOURCE_APIC, 2 },
> + *	{ "tps6598x", IRQ_RESOURCE_APIC, 3 },
> + *	{ }
> + * };
> + */
>  
>  /*
>   * Note new device-ids must also be added to i2c_multi_instantiate_ids in
> @@ -181,7 +197,6 @@ static const struct i2c_inst_data int3515_data[]  = {
>  static const struct acpi_device_id i2c_multi_inst_acpi_ids[] = {
>  	{ "BSG1160", (unsigned long)bsg1160_data },
>  	{ "BSG2150", (unsigned long)bsg2150_data },
> -	{ "INT3515", (unsigned long)int3515_data },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(acpi, i2c_multi_inst_acpi_ids);
> 

