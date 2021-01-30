Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C2B8C433E0
	for <platform-driver-x86@archiver.kernel.org>; Sat, 30 Jan 2021 21:45:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C82DA64DF5
	for <platform-driver-x86@archiver.kernel.org>; Sat, 30 Jan 2021 21:45:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230517AbhA3VpO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 30 Jan 2021 16:45:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30532 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230168AbhA3VpN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 30 Jan 2021 16:45:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612043027;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KY38Yv3dX+Efk7Jch8wqw9QHlMFgj63ZWy69oyr9HzE=;
        b=JkF2iYzmiCzpqY+uwOkMKF2YJpGGkGIafksWn+rLC28feeueObnWix4paTdIn2fvOAEigs
        kBX6cjvd1rruTjimPJPo63aOH77y1Ar3PlHEBm7LIDxtXMh9E1ExKZlAh2ebSuu2lagU/o
        s87bUeoTkuebMYq+csYWh/iO9h7ZIpE=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-VAL3Mx3kN3GFJhQEqc0zXA-1; Sat, 30 Jan 2021 16:43:45 -0500
X-MC-Unique: VAL3Mx3kN3GFJhQEqc0zXA-1
Received: by mail-ej1-f70.google.com with SMTP id bz10so845305ejc.20
        for <platform-driver-x86@vger.kernel.org>; Sat, 30 Jan 2021 13:43:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KY38Yv3dX+Efk7Jch8wqw9QHlMFgj63ZWy69oyr9HzE=;
        b=AvZJP9n8+a0jRZ+KU1utlRDtalLDzetodbnVwYxtfkOtnvFdi2elJm/XTD1TcccUgA
         BqnR5N6riGvvCbjD7PtRH69LrIHMbpxBkXBvkNAtN5tnHSR+tSSRoBARou2NLSitftjE
         8zFYPJl/0eI7j4ptwbJl/A86mNArjPEiD34Zt03PK3DWGEvRYMV8U3064tpKoA0QtK3v
         z1+He6OCUDSLbr6YovMo6ZsVLFHqKOdM/LoR63OrGhzb0wf8p36knfTMOLh8v157AQKs
         6hUatL/KVxnoZ2fpU6WNoRJSK+oDYJZaPwsD2Nie54Gxp4gCbwRHm0ea9jkaTSZydchO
         B9yg==
X-Gm-Message-State: AOAM533QtQ2mvlFSBL8+9Oe8VmxGFc2AbuDSuSZx3r8Pbv4F1/KnxF6Q
        gm/f7wmJwNGhahvJbdkuEgibXpqKSj9UUsjN8XxgEe8uDxtEkVGtdQQRj2okZdoHN25Ap5a0X1U
        gEh6KWKilTACFh3fM+rM/uGwPnrUnF7+14XQyw+39WANw97nLyndRHCgESbMWdC4+VMTBiFwvlM
        BCqTybTg49xA==
X-Received: by 2002:a17:907:1b27:: with SMTP id mp39mr10545772ejc.519.1612043024309;
        Sat, 30 Jan 2021 13:43:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyg+51j/F9EnIRu2VdUBTmnDBB1pmKAFdYpf71MvO6TWqpL5hIeu9lRUlVRlh/pPZAHQgoCNw==
X-Received: by 2002:a17:907:1b27:: with SMTP id mp39mr10545757ejc.519.1612043024068;
        Sat, 30 Jan 2021 13:43:44 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id n27sm5805415eje.29.2021.01.30.13.43.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Jan 2021 13:43:43 -0800 (PST)
Subject: Re: [PATCH] platform/x86: dell-wmi-sysman: fix a NULL pointer
 dereference
To:     Mario Limonciello <mario.limonciello@dell.com>,
        Mark Gross <mgross@linux.intel.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org
References: <20210129172654.2326751-1-mario.limonciello@dell.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <0da9ca30-53b1-8d34-4fc7-62edb6423b26@redhat.com>
Date:   Sat, 30 Jan 2021 22:43:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210129172654.2326751-1-mario.limonciello@dell.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/29/21 6:26 PM, Mario Limonciello wrote:
> An upcoming Dell platform is causing a NULL pointer dereference
> in dell-wmi-sysman initialization.  Validate that the input from
> BIOS matches correct ACPI types and abort module initialization
> if it fails.
> 
> This leads to a memory leak that needs to be cleaned up properly.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
> ---
>  drivers/platform/x86/dell-wmi-sysman/sysman.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/dell-wmi-sysman/sysman.c b/drivers/platform/x86/dell-wmi-sysman/sysman.c
> index dc6dd531c996..38b497991071 100644
> --- a/drivers/platform/x86/dell-wmi-sysman/sysman.c
> +++ b/drivers/platform/x86/dell-wmi-sysman/sysman.c
> @@ -419,13 +419,19 @@ static int init_bios_attributes(int attr_type, const char *guid)
>  		return retval;
>  	/* need to use specific instance_id and guid combination to get right data */
>  	obj = get_wmiobj_pointer(instance_id, guid);
> -	if (!obj)
> +	if (!obj || obj->type != ACPI_TYPE_PACKAGE) {
> +		release_attributes_data();

All calls of  init_bios_attributes() have the following error handling:

        ret = init_bios_attributes(INT, DELL_WMI_BIOS_INTEGER_ATTRIBUTE_GUID);
        if (ret) {
                pr_debug("failed to populate integer type attributes\n");
                goto fail_create_group;
        }

	...

fail_create_group:
        release_attributes_data();

So that added release_attributes_data() call is not necessary. If you can respin
this patch Monday with the release_attributes_data(); addition dropped, then
I will try to get this to Linus in time for 5.11 .

Or I can fix this up locally if you agree with dropping the unnecessary
release_attributes_data() call.

Regards,

Hans




>  		return -ENODEV;
> +	}
>  	elements = obj->package.elements;
>  
>  	mutex_lock(&wmi_priv.mutex);
>  	while (elements) {
>  		/* sanity checking */
> +		if (elements[ATTR_NAME].type != ACPI_TYPE_STRING) {
> +			pr_debug("incorrect element type\n");
> +			goto nextobj;
> +		}
>  		if (strlen(elements[ATTR_NAME].string.pointer) == 0) {
>  			pr_debug("empty attribute found\n");
>  			goto nextobj;
> 

