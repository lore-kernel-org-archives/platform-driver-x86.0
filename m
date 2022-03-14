Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E2F1C433FE
	for <platform-driver-x86@archiver.kernel.org>; Mon, 14 Mar 2022 10:52:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238588AbiCNKxH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 14 Mar 2022 06:53:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238694AbiCNKxA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Mar 2022 06:53:00 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 849FF30F49
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Mar 2022 03:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1647255109;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rZtkaVdmZJCIz0Q95xTUlGstvX3u5LA2ki+aXzxs3N8=;
        b=cAg3f5ostUB/W0lJ08WD81aCMYAYBvfatmwD/fSinW8g5sMCNV2bZzGloM10bMubzy1zvj
        EhgYWuQGXWFiwoevD3nxhAMD7UXsCbItKl8SH1KUNH8REvSrFyruAjTJP8qFbnRRFOg26S
        +O47r3755icFMzR8a7oG66wpSOB5Qjs=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-K7G9QU5YMnCSvUxB2-UQsw-1; Mon, 14 Mar 2022 06:51:45 -0400
X-MC-Unique: K7G9QU5YMnCSvUxB2-UQsw-1
Received: by mail-ej1-f70.google.com with SMTP id ey18-20020a1709070b9200b006da9614af58so7763471ejc.10
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Mar 2022 03:51:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=rZtkaVdmZJCIz0Q95xTUlGstvX3u5LA2ki+aXzxs3N8=;
        b=eivWlut4dWPxrtBjiUiZ3k1CCykz35eQG7eHfJUEmMXqzPvCkO6SBwK78ST1cEdS6m
         m45b2/knQzevNOMSAd0Qo9ajUwAV77YnmhDtAxOBG7xBg4xMv9x1SH6gYvdge1mPfFVV
         dnybmWP5J95ewzsSpKdRLfWV+iHRiAf48fUSENY+I5+FGbQ+BmJ0OChSJPT7xSp+uRS+
         wiOYtB+atF315G3jOIB09xrsNSnIJ6gcqJYsHU+DQCFw6OrjWJ2pyFqjnyPXxNGUinAr
         F8qzNeFBJ/PqzftF27E35Sn9MCLTrA6fi57to9d9YpPKWrULLTSuTe5FL4bLTMcQA0XE
         s81w==
X-Gm-Message-State: AOAM533BdCmzLmCdTct0VJzcKwTYq9eoYhUTViFYF1FEnpmEC62l+jHz
        e6INtu0VYhihokIT7TyNRpCpSgSYu+XwKK132HW+kMVW7rs86/0cMSaHT8vTfKhTXl2d7w1Uu8+
        v4jY07Oeumq/PSKVVbzyQf94R5V1KltdL4w==
X-Received: by 2002:a17:907:1c95:b0:6db:6b05:549c with SMTP id nb21-20020a1709071c9500b006db6b05549cmr17497520ejc.651.1647255103728;
        Mon, 14 Mar 2022 03:51:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJws42K8FBQzlclCxaIuzv5lDf2Cg3xb7WQKoO2bwAMm7XL9lgUbqSxo2mcRdfZZI50GEuqMqQ==
X-Received: by 2002:a17:907:1c95:b0:6db:6b05:549c with SMTP id nb21-20020a1709071c9500b006db6b05549cmr17497506ejc.651.1647255103420;
        Mon, 14 Mar 2022 03:51:43 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id r14-20020a05640251ce00b004186b7c1268sm3797256edd.50.2022.03.14.03.51.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Mar 2022 03:51:43 -0700 (PDT)
Message-ID: <85bb25b0-32f1-e7a1-c94c-012dc8f2dbec@redhat.com>
Date:   Mon, 14 Mar 2022 11:51:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v5 4/4] Changing bios_args.data to be dynamically
 allocated
Content-Language: en-US
To:     Jorge Lopez <jorgealtxwork@gmail.com>,
        platform-driver-x86@vger.kernel.org
References: <20220310210853.28367-1-jorge.lopez2@hp.com>
 <20220310210853.28367-5-jorge.lopez2@hp.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220310210853.28367-5-jorge.lopez2@hp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/10/22 22:08, Jorge Lopez wrote:
> The purpose of this patch is to remove 128 bytes buffer limitation
> imposed in bios_args structure.
> 
> A limiting factor discovered during this investigation was the struct
> bios_args.data size restriction.  The data member size limits all
> possible WMI commands to those requiring buffer size of 128 bytes or
> less. Several WMI commands and queries require a buffer size larger
> than 128 bytes hence limiting current and feature supported by the
> driver. It is for this reason, struct bios_args.data changed and is
> dynamically allocated.  hp_wmi_perform_query function changed to
> handle the memory allocation and release of any required buffer size.
> 
> All changes were validated on a HP ZBook Workstation notebook,
> HP EliteBook x360, and HP EliteBook 850 G8.  Additional
> validation was included in the test process to ensure no other
> commands were incorrectly handled.
> 
> Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>
> 
> ---
> Based on the latest platform-drivers-x86.git/for-next
> ---
>  drivers/platform/x86/hp-wmi.c | 64 +++++++++++++++++++++++------------
>  1 file changed, 42 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
> index e76bd4bef6b5..cc5c4f637328 100644
> --- a/drivers/platform/x86/hp-wmi.c
> +++ b/drivers/platform/x86/hp-wmi.c
> @@ -82,12 +82,17 @@ enum hp_wmi_event_ids {
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
> +	u8 data[];
>  };
>  
>  enum hp_wmi_commandtype {
> @@ -268,34 +273,40 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
>  	int mid;
>  	struct bios_return *bios_return;
>  	int actual_outsize;
> -	union acpi_object *obj;
> -	struct bios_args args = {
> -		.signature = 0x55434553,
> -		.command = command,
> -		.commandtype = query,
> -		.datasize = insize,
> -		.data = { 0 },
> -	};
> -	struct acpi_buffer input = { sizeof(struct bios_args), &args };
> +	union acpi_object *obj = NULL;
> +	struct bios_args *args = NULL;
> +	size_t bios_args_size = struct_size(args, data, insize);
> +	
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

The variable declaration here again looks a bit messy, also
there is no reason to move the block setting + checking mid,
that just makes the diff unnecessarily large.

I've cleaned this up while mergin (no functional changes).


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
> +		goto out_free;
> +	}
>  
> -	obj = output.pointer;
> +	memcpy(args->data, buffer, flex_array_size(args, data, insize));
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
> +	if (ret)
> +		goto out_free;
> +
> +	obj = output.pointer;
> +	if (!obj) {
>  		ret = -EINVAL;
>  		goto out_free;
>  	}
> @@ -310,9 +321,17 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
>  		goto out_free;
>  	}
>  
> +	if (obj->type != ACPI_TYPE_BUFFER) {
> +		pr_warn("query 0x%x returned an invalid object 0x%x\n", query, ret);
> +		ret = -EINVAL;
> +		goto out_free;
> +	}
> +

You have now moved the obj->type != ACPI_TYPE_BUFFER check to after the:
	
	bios_return = (struct bios_return *)obj->buffer.pointer;

Statement, which dereferences the buffer member of the obj union.  That check
MUST be done before looking at the buffer member, so I have moved it back to
its old place, this also makes the diff/patch smaller.  Note this one is
a functional change to your patch.

The changed initial block of the function now looks like this:

static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
				void *buffer, int insize, int outsize)
{
	struct acpi_buffer input, output = { ACPI_ALLOCATE_BUFFER, NULL };
	size_t bios_args_size = struct_size(args, data, insize);
	struct bios_return *bios_return;
	union acpi_object *obj = NULL;
	struct bios_args *args = NULL;
	int mid, actual_outsize, ret;

	mid = encode_outsize_for_pvsz(outsize);
	if (WARN_ON(mid < 0))
		return mid;

	args = kmalloc(bios_args_size, GFP_KERNEL);
	if (!args)
		return -ENOMEM;

	input.length = bios_args_size;
	input.pointer = args;

	args->signature = 0x55434553;
	args->command = command;
	args->commandtype = query;
	args->datasize = insize;
	memcpy(args->data, buffer, flex_array_size(args, data, insize));

	ret = wmi_evaluate_method(HPWMI_BIOS_GUID, 0, mid, &input, &output);
	if (ret)
		goto out_free;

	obj = output.pointer;
	if (!obj) {
		ret = -EINVAL;
		goto out_free;
	}

	if (obj->type != ACPI_TYPE_BUFFER) {
		pr_warn("query 0x%x returned an invalid object 0x%x\n", query, ret);
		ret = -EINVAL;
		goto out_free;
	}

	bios_return = (struct bios_return *)obj->buffer.pointer;


And the new diff for this chunk of the patch now is:

@@ -266,37 +271,42 @@ static inline int encode_outsize_for_pvsz(int outsize)
 static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
 				void *buffer, int insize, int outsize)
 {
-	int mid;
+	struct acpi_buffer input, output = { ACPI_ALLOCATE_BUFFER, NULL };
+	size_t bios_args_size = struct_size(args, data, insize);
 	struct bios_return *bios_return;
-	int actual_outsize;
-	union acpi_object *obj;
-	struct bios_args args = {
-		.signature = 0x55434553,
-		.command = command,
-		.commandtype = query,
-		.datasize = insize,
-		.data = { 0 },
-	};
-	struct acpi_buffer input = { sizeof(struct bios_args), &args };
-	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
-	int ret = 0;
+	union acpi_object *obj = NULL;
+	struct bios_args *args = NULL;
+	int mid, actual_outsize, ret;
 
 	mid = encode_outsize_for_pvsz(outsize);
 	if (WARN_ON(mid < 0))
 		return mid;
 
-	if (WARN_ON(insize > sizeof(args.data)))
-		return -EINVAL;
-	memcpy(&args.data[0], buffer, insize);
+	args = kmalloc(bios_args_size, GFP_KERNEL);
+	if (!args)
+		return -ENOMEM;
 
-	wmi_evaluate_method(HPWMI_BIOS_GUID, 0, mid, &input, &output);
+	input.length = bios_args_size;
+	input.pointer = args;
 
-	obj = output.pointer;
+	args->signature = 0x55434553;
+	args->command = command;
+	args->commandtype = query;
+	args->datasize = insize;
+	memcpy(args->data, buffer, flex_array_size(args, data, insize));
 
-	if (!obj)
-		return -EINVAL;
+	ret = wmi_evaluate_method(HPWMI_BIOS_GUID, 0, mid, &input, &output);
+	if (ret)
+		goto out_free;
+
+	obj = output.pointer;
+	if (!obj) {
+		ret = -EINVAL;
+		goto out_free;
+	}
 
 	if (obj->type != ACPI_TYPE_BUFFER) {
+		pr_warn("query 0x%x returned an invalid object 0x%x\n", query, ret);
 		ret = -EINVAL;
 		goto out_free;
 	}
@@ ...

I've merged this patch with the above changes:

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








>  	/* Ignore output data of zero size */
> -	if (!outsize)
> +	if (!outsize) {
> +		ret = 0;
>  		goto out_free;
> +	}
>  
>  	actual_outsize = min(outsize, (int)(obj->buffer.length - sizeof(*bios_return)));
>  	memcpy(buffer, obj->buffer.pointer + sizeof(*bios_return), actual_outsize);
> @@ -320,6 +339,7 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
>  
>  out_free:
>  	kfree(obj);
> +	kfree(args);
>  	return ret;
>  }
>  


