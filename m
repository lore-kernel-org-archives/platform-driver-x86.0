Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47735C433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Feb 2022 17:15:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234594AbiBVRPb (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Feb 2022 12:15:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234597AbiBVRPa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Feb 2022 12:15:30 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id EECE5108769
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Feb 2022 09:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1645550103;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lWl+b64b/Izv3VJXyM/TvquMJfoN+EPi8bPxXU6eJwY=;
        b=EMe8oY1dTyK05ZKwxnDTJBmwqxHEzHxnad+ouzFZLQAnUFHp3E3gbJ2E9fG5vXTIq2RSsx
        KinQ/KZlPaNGSCnPzOOk5f4bKfDb7rMsORRstVlm9htdGhGT6eY1AFcDDHbubAhPOAEybl
        +aBdZf+SrEjhziHnTz6r+R8dZoNTzpY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-171-4prffwYPPKmhxNZl-SH1hA-1; Tue, 22 Feb 2022 12:15:01 -0500
X-MC-Unique: 4prffwYPPKmhxNZl-SH1hA-1
Received: by mail-ej1-f72.google.com with SMTP id ky6-20020a170907778600b0068e4bd99fd1so6058194ejc.15
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Feb 2022 09:15:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=lWl+b64b/Izv3VJXyM/TvquMJfoN+EPi8bPxXU6eJwY=;
        b=ehwV/rHkzdpSmPAbPhqmE7zPg4kL3H/U5uTHbTvsZ3mpzkPDUWqZy9HN6nUent5wlV
         Xls1A6/gw4OCsAx/GKBBcd6B5dyoHblA9vrB8o0Iu9wHo1iL3pIoKo/SdoNQJXdF3fQr
         0qZ/P1rbYvKynwMl3+tmojBHyjgRhQQIxei9wtK03IIzqR+eBqKbTuFGSqrDn1sCHlSj
         8WtqVQgdXLbrDVXZDtlhxW0toHOrlkc6pyk5tK/e5ozD0zdnYqCOf7oOh7ze8gOdCD5N
         bMihXkrNGC+4fwiZyDdAGbkgajZxdIdHACqMtYoLJHjenvdOo/icZhOi1+e+InLOASOw
         d+Kw==
X-Gm-Message-State: AOAM531S+RGVfTYNztF3AjLZKlBAQUhAvg6o5d2Ol29sxpSMWm45rGC8
        VKVKqeHK4BLaBVZ3XkUrOUBf7/1BYaTAXJgrapDIBdp1QD6NXBvpFuzfdDITUaBlMGHTQv9q4UZ
        ymVHPb7Rvf6W8kBkHJPdGCdYB0bRCLIfsZA==
X-Received: by 2002:a50:9b45:0:b0:410:7cdb:5d3a with SMTP id a5-20020a509b45000000b004107cdb5d3amr28285196edj.275.1645550100064;
        Tue, 22 Feb 2022 09:15:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyE/IO/RcMbB1yx0e55cvm+pRWXFC5GHETijI6iTZNC+CQtqsnpiF4t9I4Gigdaj50zRwqUdA==
X-Received: by 2002:a50:9b45:0:b0:410:7cdb:5d3a with SMTP id a5-20020a509b45000000b004107cdb5d3amr28285176edj.275.1645550099747;
        Tue, 22 Feb 2022 09:14:59 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id p16sm504857ejn.33.2022.02.22.09.14.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Feb 2022 09:14:59 -0800 (PST)
Message-ID: <eb0d491a-9f67-16ed-ee55-659c0e60ef3d@redhat.com>
Date:   Tue, 22 Feb 2022 18:14:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 3/3] Changing bios_args.data to be dynamically
 allocated
Content-Language: en-US
To:     Jorge Lopez <jorgealtxwork@gmail.com>,
        platform-driver-x86@vger.kernel.org
References: <20220218160907.3422-1-jorge.lopez2@hp.com>
 <20220218160907.3422-4-jorge.lopez2@hp.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220218160907.3422-4-jorge.lopez2@hp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/18/22 17:09, Jorge Lopez wrote:
> The purpose of this patch is to remove 128 bytes buffer limitation
> imposed in bios_args structure.
> 
> A limiting factor discovered during this investigation was the struct
> bios_args.data size restriction.  The data member size limits all possible
> WMI commands to those requiring buffer size of 128 bytes or less.
> Several WMI commands and queries require a buffer size larger than 128
> bytes hence limiting current and feature supported by the driver.
> It is for this reason, struct bios_args.data changed and is dynamically
> allocated.  hp_wmi_perform_query function changed to handle the memory
> allocation and release of any required buffer size.
> 
> All changes were validated on a ZBook Workstation notebook. Additional
> validation was included to ensure no other commands were failing or
> incorrectly handled.
> 
> Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>
> 
> ---
> Based on the latest platform-drivers-x86.git/for-next
> ---
>  drivers/platform/x86/hp-wmi.c | 67 +++++++++++++++++++++++------------
>  1 file changed, 44 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
> index de715687021a..11c8e9b6e64a 100644
> --- a/drivers/platform/x86/hp-wmi.c
> +++ b/drivers/platform/x86/hp-wmi.c
> @@ -83,12 +83,17 @@ enum hp_wmi_event_ids {
>  	HPWMI_BATTERY_CHARGE_PERIOD	= 0x10,
>  };
>  
> +/**
> + * struct bios_args buffer is dynamically allocated.  New WMI command types
> + * were introduced that exceeds 128-byte data size.  Changes to handle
> + * the data size allocation scheme were kept in hp_wmi_perform_qurey function.
> + */
>  struct bios_args {
>  	u32 signature;
>  	u32 command;
>  	u32 commandtype;
>  	u32 datasize;
> -	u8 data[128];
> +	u8 data[0];
>  };
>  
>  enum hp_wmi_commandtype {
> @@ -258,39 +263,47 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
>  	struct bios_return *bios_return;
>  	int actual_outsize;
>  	union acpi_object *obj;
> -	struct bios_args args = {
> -		.signature = 0x55434553,
> -		.command = command,
> -		.commandtype = query,
> -		.datasize = insize,
> -		.data = { 0 },
> -	};
> -	struct acpi_buffer input = { sizeof(struct bios_args), &args };
> +	size_t bios_args_size = sizeof(struct bios_args) + insize;
> +	struct bios_args *args = NULL;
> +	struct acpi_buffer input;
>  	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
>  	int ret = 0;
>  
> -	mid = encode_outsize_for_pvsz(outsize);
> -	if (WARN_ON(mid < 0))
> -		return mid;
> +	args = kmalloc(bios_args_size, GFP_KERNEL);
> +	if (!args)
> +		return -ENOMEM;
>  
> -	if (WARN_ON(insize > sizeof(args.data)))
> -		return -EINVAL;
> -	memcpy(&args.data[0], buffer, insize);
> +	input.length = bios_args_size;
> +	input.pointer = args;
>  
> -	wmi_evaluate_method(HPWMI_BIOS_GUID, 0, mid, &input, &output);
> +	mid = encode_outsize_for_pvsz(outsize);
> +	if (WARN_ON(mid < 0)) {
> +		ret = mid;
> +		goto in_free;
> +	}
>  
> -	obj = output.pointer;
> +	/* Avoid unnecessary copy to the data buffer if input buffer size is zero */
> +	if (insize > 0)

This if is not necessary, memcpy should touch neither dst nor src when
called with size==0.


> +		memcpy(args->data, buffer, insize);
>  
> -	if (!obj)
> -		return -EINVAL;
> +	args->signature = 0x55434553;
> +	args->command = command;
> +	args->commandtype = query;
> +	args->datasize = insize;
>  
> -	if (obj->type != ACPI_TYPE_BUFFER) {
> +	ret = wmi_evaluate_method(HPWMI_BIOS_GUID, 0, mid, &input, &output);

Add:
	if (ret)
		goto in_free;

Here ? AFAIK if ret is set &output is not touched, so other
wise you end up reading unitialized mem when doing:

	obj = output.pointer;
> +	if (!obj) {
> +		pr_warn("query 0x%x returned a null obj 0x%x\n", query, ret);

Are you sure this can never happen when e.g. querying features on
older models ? I believe it is probably best to just drop this as
it is an unrelated behavior change and if you really think this is
a good idea, put the adding of the pr_warn in a separate commit
with an explanation why this is being added.

>  		ret = -EINVAL;
> -		goto out_free;
> +		goto in_free;
>  	}
>  
> -	bios_return = (struct bios_return *)obj->buffer.pointer;
> -	ret = bios_return->return_code;
> +	if (!ret && obj->type == ACPI_TYPE_BUFFER) {
> +		bios_return = (struct bios_return *)obj->buffer.pointer;
> +		ret = bios_return->return_code;
> +	}

Please keep this in the form of:

	if (unexpected_condition) {
		ret = -EINVAL;
		goto out_free;
	}

	straight-path-statements-here;

This form is consistently used in most kernel code so that the
"straight-path" code is always indented only 1 level which makes
it easier to follow.

And this would also mean that you end up making less changes
in this patch.

>  
>  	if (ret) {
>  		if (ret != HPWMI_RET_UNKNOWN_COMMAND &&
> @@ -299,6 +312,12 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
>  		goto out_free;
>  	}
>  
> +	if (obj->type != ACPI_TYPE_BUFFER) {
> +		pr_warn("query 0x%x returned an invalid object 0x%x\n", query, ret);
> +		ret = -EINVAL;
> +		goto out_free;
> +	}
> +
>  	/* Ignore output data of zero size */
>  	if (!outsize)
>  		goto out_free;
> @@ -309,6 +328,8 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
>  
>  out_free:
>  	kfree(obj);
> +in_free:
> +	kfree(args);
>  	return ret;

IMHO it would be better to have a single "out" label here and
initialize obj to NULL when declared, kfree(NULL) is a no-op,
so this way you don't need 2 labels and you also avoid potentially
jumping to the wrong label.

Regards,

Hans

