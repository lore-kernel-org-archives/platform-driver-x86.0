Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C90DC433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 13 Sep 2021 11:53:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5584460FBF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 13 Sep 2021 11:53:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239720AbhIMLy7 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 13 Sep 2021 07:54:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25933 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239689AbhIMLy6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Sep 2021 07:54:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1631534022;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=87yE+ybe2tCEraT4jxexI9nrys/d4oDs+rourCMyNBE=;
        b=h7hY55KI8ZqzMfxqHhH3rr6al49qEwSD+tdgXLb8mhKnp37Ki5KzdX3z1P9EIXKuyO84Ax
        /nzrwf+Ubjm9dhqxPaF5RjI4ArnUO5UmivfV8pG5BumXf2f7RJd9fDfDhNcrwlfyS+O73T
        C9uszwb8ki6Ez+14ztbfpPYbg3E6AZQ=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-rBVuRI1wPn-KkiiVZV8f3Q-1; Mon, 13 Sep 2021 07:53:41 -0400
X-MC-Unique: rBVuRI1wPn-KkiiVZV8f3Q-1
Received: by mail-ej1-f71.google.com with SMTP id ar17-20020a170907265100b005eff65b9184so1399662ejc.21
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Sep 2021 04:53:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=87yE+ybe2tCEraT4jxexI9nrys/d4oDs+rourCMyNBE=;
        b=5ThPpSPfKiIAdM44c8dyjdD/YN4UQ+Vu+JT8ZnWHmTgjmaQ8bBzvsVVx+0J3BUMhkR
         FsGFccDGl8d5MYNmH6Em41y2NFl21eNjNh9pispF6Tu9WIpVAX3u8pXvjZkxzrHrxVnp
         ZVM/kG5cOiB6CZhm1KntrNyetK5y/bGwdnpbzu98mq485GJdOLZJ71qt5nJmA2E74kGV
         /vFyPSk8U4IcYCby7TGo9EFoQbKpUyDBnSkfEfvKSEHouUA44TBAOzlL5IXSnB6s4Ssi
         AQWXYpJo+jVpYQSUCnPTybynxUJwkMxXK6In0elzM7QiWXl9Cxgv2o09QhMsbTGA5H1W
         m+Eg==
X-Gm-Message-State: AOAM532PS0HpWO9LZNbx6CvTmPcD5namLwUZ9St12C0ggYTTAWZrT3Uj
        MLPU8yk/B8SrDegSZdcqCvuMuMXnIaJ0oa/I9fFRLYeW5AUjlYzB/plvYtUKVCBpEz19HBuX+8Q
        c3/0/CyrrmxioJrP6azAKBaEN+d4LRZsgSGVA75t6jvF0bsT6iwaxcIhQgsNnihxNIgGh1kPUNK
        eFcoOekeZy6A==
X-Received: by 2002:a17:906:6dc1:: with SMTP id j1mr12258870ejt.324.1631534020109;
        Mon, 13 Sep 2021 04:53:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKG7HiiHTzjst+CG7JXnBImW+LH1AOK51HaDr9lNUZkIL+6CPlJl4nAnjOMlZbMnlq0UPXVQ==
X-Received: by 2002:a17:906:6dc1:: with SMTP id j1mr12258861ejt.324.1631534019920;
        Mon, 13 Sep 2021 04:53:39 -0700 (PDT)
Received: from x1.localdomain ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id y4sm1946959ejr.101.2021.09.13.04.53.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Sep 2021 04:53:39 -0700 (PDT)
Subject: Re: [PATCH v1] platform/x86: wmi: initialize method name directly
To:     =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
References: <20210913110805.12387-1-pobrn@protonmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <14e14dd2-a51e-87ae-5776-5f0a585e4936@redhat.com>
Date:   Mon, 13 Sep 2021 13:53:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210913110805.12387-1-pobrn@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/13/21 1:08 PM, Barnabás Pőcze wrote:
> Instead of calling `snprintf()`, generate the method
> name in the initializer. This way the array size
> is determined automatically, specifying it explicitly
> is no longer needed.
> 
> Signed-off-by: Barnabás Pőcze <pobrn@protonmail.com>

In "platform/x86: wmi: introduce helper to generate method names"
you added a get_acpi_method_name() helper for generating WMI
method-names and you are using that everywhere else.

IMHO it would be better to also use that here. Is there any
specific reason why you are not using this here ?

Regards,

Hans



> ---
>  drivers/platform/x86/wmi.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
> index e6997be206f1..1cde9dd417c4 100644
> --- a/drivers/platform/x86/wmi.c
> +++ b/drivers/platform/x86/wmi.c
> @@ -184,15 +184,17 @@ static int get_subobj_info(acpi_handle handle, const char *pathname,
> 
>  static acpi_status wmi_method_enable(struct wmi_block *wblock, bool enable)
>  {
> -	struct guid_block *block;
> -	char method[5];
> +	acpi_handle handle = wblock->acpi_device->handle;
> +	struct guid_block *block = &wblock->gblock;
>  	acpi_status status;
> -	acpi_handle handle;
> -
> -	block = &wblock->gblock;
> -	handle = wblock->acpi_device->handle;
> +	char method[] = {
> +		'W',
> +		'E',
> +		hex_asc_upper_hi(block->notify_id),
> +		hex_asc_upper_lo(block->notify_id),
> +		'\0'
> +	};
> 
> -	snprintf(method, 5, "WE%02X", block->notify_id);
>  	status = acpi_execute_simple_method(handle, method, enable);
>  	if (status == AE_NOT_FOUND)
>  		return AE_OK;
> --
> 2.33.0
> 
> 

