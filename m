Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E774FC433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Feb 2022 10:57:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239427AbiBQK6I (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Feb 2022 05:58:08 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:60522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239408AbiBQK54 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Feb 2022 05:57:56 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3D88715A32
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Feb 2022 02:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1645095460;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Lq4QSsW6aezoXMrT3PK31p6J+nq/y/c2qlpB6zsi1DI=;
        b=DF2GVc78kOLXXk9kfhJoD2QwGF58hc4ndW7mbMz5fXGYv/D4RXzpIjWX6flPZJmeXwef20
        gsXUTiGUNznF0mnwshoIyaUQpflWQrlL3LDO905EGnKTI3U6eyLLEUkUHjZrSb9k14SQOH
        XULcIR04Hgk62+Kjjl7N7QmMeiRPX+E=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-1A7ZWzugOfSmYxiOKoJS1w-1; Thu, 17 Feb 2022 05:57:38 -0500
X-MC-Unique: 1A7ZWzugOfSmYxiOKoJS1w-1
Received: by mail-ed1-f71.google.com with SMTP id k5-20020a508ac5000000b00408dec8390aso3257388edk.13
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Feb 2022 02:57:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Lq4QSsW6aezoXMrT3PK31p6J+nq/y/c2qlpB6zsi1DI=;
        b=dLEgXdozj2dROZkg0BGcYlorYPMNbqWBAS10gbZtNxER9ag4wSS7Fl9KAIZsKilKh0
         SCrycwGF672vEIxBPJpCDNwc5g8KWPIVt9byAXfrsGS7L7kWL60783g5WErwBBP/ILiD
         coIWBloZv2OaihLbjyTKD6/mNtDASvYM7Oye+0S4fvGejUvYnru8D9ZewfQBBtqzWInT
         Wq3gImrsRGpL1WGNEgAMUSpuBljwADG+x/9scA+8OsLhUEYin8jgSV1hImwUegxzQnLx
         33T4LbVdz89rXvapHFfzXqq6x9YKqkDIFNKsbDgIlmnUbv+8mC7VhUB/eUnZLRwF9pRY
         RXcA==
X-Gm-Message-State: AOAM532zcWcJf6JfxaOmOt5j631zRNOLXQcX5LkNB8gIhpsI+aVaFCl8
        xMr9UTkpTlJHU5MYrLgjlaGcu85d/26WS4HSS25XKq+s86idV9XLio5ViSZrhS2Tu6KHyD7R1bY
        IuznzzVQgquXqhWQP7qSBW1/7fEDm8AXTHQ==
X-Received: by 2002:a17:906:b155:b0:6c9:ea2d:3363 with SMTP id bt21-20020a170906b15500b006c9ea2d3363mr1828455ejb.729.1645095457235;
        Thu, 17 Feb 2022 02:57:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxgXn9M9YU2UuUctNC3IK/l5bDHXGEce0nMRSK2lBW2AGQ7ep28YC3Hd+QE/2o0easBTgDN0A==
X-Received: by 2002:a17:906:b155:b0:6c9:ea2d:3363 with SMTP id bt21-20020a170906b15500b006c9ea2d3363mr1828433ejb.729.1645095456850;
        Thu, 17 Feb 2022 02:57:36 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id z5sm1051236eja.20.2022.02.17.02.57.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Feb 2022 02:57:36 -0800 (PST)
Message-ID: <ec6d06e4-a8e2-74af-f31f-3b6874b8bab1@redhat.com>
Date:   Thu, 17 Feb 2022 11:57:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] Fix SW_TABLET_MODE detection method
Content-Language: en-US
To:     Jorge Lopez <jorgealtxwork@gmail.com>,
        platform-driver-x86@vger.kernel.org, jorge.lopez2@hp.com
References: <20220216163147.11266-1-jorge.lopez2@hp.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220216163147.11266-1-jorge.lopez2@hp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Jorge,

On 2/16/22 17:31, Jorge Lopez wrote:
> The purpose of this patch is to introduce a fix and removal
> of the current hack when determining tablet mode status.
> 
> Determining the tablet mode status requires reading Byte 0 bit 2 and 3
> as reported by HPWMI_HARDWARE_QUERY.  The investigation identified the
> failure was rooted in two areas; HPWMI_HARDWARE_QUERY failure (0x05)
> and reading Byte 0, bit 2 only to determine the table mode status.
> HPWMI_HARDWARE_QUERY WMI failure also rendered the dock state value invalid.
> 
> Several WMI queries leverage hp_wmi_read_int function to read their data.
> hp_wmi_read_int function returns the appropiate value if
> the WMI command requires an input and output buffer size values
> greater than zero.  WMI queries such HPWMI_HARDWARE_QUERY,
> HPWMI_WIRELESS2_QUERY, and HPWMI_FEATURE2_QUERY requires calling
> hp_wmi_perform_query function with input buffer size value of zero.
> Any input buffer size greater than zero will cause error 0x05 to be
> returned.
> 
> A limiting factor discovered during this investigation was the
> struct bios_args.data size restriction.  The data member size limits
> all possible WMI commands to those requiring buffer size of 128
> bytes or less.  Several WMI commands and queries require a buffer size
> larger than 128 bytes hence limiting current and feature supported by
> the driver.  It is for this reason, struct bios_args.data changed and
> it is dynamically allocated.  hp_wmi_perform_query function changed to
> handle the memory allocation and release of any required buffer size.
> 
> All identified problems were resolved and their correct operation
> validated on a ZBook Workstation notebook.  Additional validation was
> included to ensure no other commands were failing or incorrectly handled.

First of all thank you for looking into the SW_TABLET_MODE issues on HP
laptops, this is much appreciated!

Reading through the commit message I see that this single patch does a bunch of
things, without having looked at the code yet I see at least 3 changes described
in the commit msg:

1. Changing bios_args.data to be dynamically allocated
2. Use different sizes for bios_args.data in different cases
3. Some changes around the actual SW_TABLET_MODE stuff

Typically when a commit message describes multiple changes like this,
it is better to just split the patch into a series with 1 change per
patch. This makes it easier to review the patches and in the future
also makes it easier to figure out what each change does and why it
was done that way.

Can you please split this into a small patch-series ?

Also this patch is missing a Signed-off-by line in the commit-message.
I can only accept patches with a Signed-off-by line in the commit-message
like this:

Signed-off-by: Your Real Name <email@your.domain>

So in your case that would be:

Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>

By adding this line you indicate that you are the author of the code and
are submitting it under the existing license for the file which you are
modifying (typically GPL-2.0) or that you have permission from the author
to submit it under this license. See:

https://www.kernel.org/doc/html/latest/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin

For the next version of this patch please add a valid Signed-off-by at
the end of the commit message.

Some small notes about posting a v2 of a patch(-series) usually
with a new version a small changelog is added after the Signed-off-by
like this:

Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>
---
Changes in v2:
- change 1
- change 2

The --- is a cut-line and when I apply the patches with "git am" anything
after it will be automatically omitted, so you can also add other small
notes here like "based on the latest platform-drivers-x86.git/for-next"

Once you have the set of patches, with proper commit-msgs with S-o-b and
changelog ready, you can generate patches marked as v2 like this:

git format-patch -v2 HEAD~3

Assuming you want patches for the last 3 commits in your current branch
and then to email these do:

git send-email v2-00*.patch

You can optionally also add a --cover-letter to the format-patch to get
a v2-0000-cover-letter.patch template, which you can then fill with some
extra info about the series.

Regards,

Hans




> ---
>  drivers/platform/x86/hp-wmi.c | 122 ++++++++++++++++++++++------------
>  1 file changed, 79 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
> index 48a46466f086..5320c1eb5cfc 100644
> --- a/drivers/platform/x86/hp-wmi.c
> +++ b/drivers/platform/x86/hp-wmi.c
> @@ -35,9 +35,6 @@ MODULE_LICENSE("GPL");
>  MODULE_ALIAS("wmi:95F24279-4D7B-4334-9387-ACCDC67EF61C");
>  MODULE_ALIAS("wmi:5FB7F034-2C63-45e9-BE91-3D44E2C707E4");
>  
> -static int enable_tablet_mode_sw = -1;
> -module_param(enable_tablet_mode_sw, int, 0444);
> -MODULE_PARM_DESC(enable_tablet_mode_sw, "Enable SW_TABLET_MODE reporting (-1=auto, 0=no, 1=yes)");
>  
>  #define HPWMI_EVENT_GUID "95F24279-4D7B-4334-9387-ACCDC67EF61C"
>  #define HPWMI_BIOS_GUID "5FB7F034-2C63-45e9-BE91-3D44E2C707E4"
> @@ -86,12 +83,17 @@ enum hp_wmi_event_ids {
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
> @@ -127,6 +129,7 @@ enum hp_wmi_command {
>  enum hp_wmi_hardware_mask {
>  	HPWMI_DOCK_MASK		= 0x01,
>  	HPWMI_TABLET_MASK	= 0x04,
> +	HPWMI_DETACHABLE_MASK	= 0x08,
>  };
>  
>  struct bios_return {
> @@ -260,39 +263,47 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
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
> +
> +	obj = output.pointer;
> +	if (!obj) {
> +		pr_warn("query 0x%x returned a null obj 0x%x\n", query, ret);
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
>  
>  	if (ret) {
>  		if (ret != HPWMI_RET_UNKNOWN_COMMAND &&
> @@ -301,6 +312,12 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
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
> @@ -311,6 +328,8 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
>  
>  out_free:
>  	kfree(obj);
> +in_free:
> +	kfree(args);
>  	return ret;
>  }
>  
> @@ -347,12 +366,19 @@ static int hp_wmi_read_int(int query)
>  
>  static int hp_wmi_hw_state(int mask)
>  {
> -	int state = hp_wmi_read_int(HPWMI_HARDWARE_QUERY);
> +	int state = 0, ret;
>  
> -	if (state < 0)
> -		return state;
> +	ret = hp_wmi_perform_query(HPWMI_HARDWARE_QUERY, HPWMI_READ, &state,
> +				   0, sizeof(state));
> +	
> +	if (ret)
> +		return ret < 0 ? ret : -EINVAL;
>  
> -	return !!(state & mask);
> +	/* determine if Detachable mode is enabled */
> +	if (HPWMI_TABLET_MASK == mask) 
> +		state = (state & HPWMI_DETACHABLE_MASK );
> +	
> +	return (state & mask);
>  }
>  
>  static int omen_thermal_profile_set(int mode)
> @@ -437,7 +463,7 @@ static int __init hp_wmi_bios_2009_later(void)
>  {
>  	u8 state[128];
>  	int ret = hp_wmi_perform_query(HPWMI_FEATURE2_QUERY, HPWMI_READ, &state,
> -				       sizeof(state), sizeof(state));
> +				       0, sizeof(state));
>  	if (!ret)
>  		return 1;
>  
> @@ -472,25 +498,37 @@ static const struct rfkill_ops hp_wmi_rfkill_ops = {
>  static bool hp_wmi_get_sw_state(enum hp_wmi_radio r)
>  {
>  	int mask = 0x200 << (r * 8);
> +	int ret= 0;
> +	int wireless = 0;
>  
> -	int wireless = hp_wmi_read_int(HPWMI_WIRELESS_QUERY);
> +	ret = hp_wmi_perform_query(HPWMI_WIRELESS_QUERY, HPWMI_READ, &wireless,
> +				   0, sizeof(wireless));
> +
> +	if (ret < 0)
> +	  return -EINVAL;
>  
>  	/* TBD: Pass error */
>  	WARN_ONCE(wireless < 0, "error executing HPWMI_WIRELESS_QUERY");
>  
> -	return !(wireless & mask);
> +	return (wireless & mask);
>  }
>  
>  static bool hp_wmi_get_hw_state(enum hp_wmi_radio r)
>  {
>  	int mask = 0x800 << (r * 8);
> +	int ret= 0;
> +	int wireless = 0;
> +
> +	ret = hp_wmi_perform_query(HPWMI_WIRELESS_QUERY, HPWMI_READ, &wireless,
> +				   0, sizeof(wireless));
>  
> -	int wireless = hp_wmi_read_int(HPWMI_WIRELESS_QUERY);
> +	if (ret < 0)
> +	  return -EINVAL;
>  
>  	/* TBD: Pass error */
>  	WARN_ONCE(wireless < 0, "error executing HPWMI_WIRELESS_QUERY");
>  
> -	return !(wireless & mask);
> +	return (wireless & mask);
>  }
>  
>  static int hp_wmi_rfkill2_set_block(void *data, bool blocked)
> @@ -515,7 +553,7 @@ static int hp_wmi_rfkill2_refresh(void)
>  	int err, i;
>  
>  	err = hp_wmi_perform_query(HPWMI_WIRELESS2_QUERY, HPWMI_READ, &state,
> -				   sizeof(state), sizeof(state));
> +				   0, sizeof(state));
>  	if (err)
>  		return err;
>  
> @@ -781,18 +819,16 @@ static int __init hp_wmi_input_setup(void)
>  
>  	/* Dock */
>  	val = hp_wmi_hw_state(HPWMI_DOCK_MASK);
> -	if (!(val < 0)) {
> +	if (val > 0) {
>  		__set_bit(SW_DOCK, hp_wmi_input_dev->swbit);
>  		input_report_switch(hp_wmi_input_dev, SW_DOCK, val);
>  	}
>  
>  	/* Tablet mode */
> -	if (enable_tablet_mode_sw > 0) {
> -		val = hp_wmi_hw_state(HPWMI_TABLET_MASK);
> -		if (val >= 0) {
> -			__set_bit(SW_TABLET_MODE, hp_wmi_input_dev->swbit);
> +	val = hp_wmi_hw_state(HPWMI_TABLET_MASK);
> +	if (val > 0) {
> +		__set_bit(SW_TABLET_MODE, hp_wmi_input_dev->swbit);
>  			input_report_switch(hp_wmi_input_dev, SW_TABLET_MODE, val);
> -		}
>  	}
>  
>  	err = sparse_keymap_setup(hp_wmi_input_dev, hp_wmi_keymap, NULL);
> @@ -919,7 +955,7 @@ static int __init hp_wmi_rfkill2_setup(struct platform_device *device)
>  	int err, i;
>  
>  	err = hp_wmi_perform_query(HPWMI_WIRELESS2_QUERY, HPWMI_READ, &state,
> -				   sizeof(state), sizeof(state));
> +				   0, sizeof(state));
>  	if (err)
>  		return err < 0 ? err : -EINVAL;
>  
> 

