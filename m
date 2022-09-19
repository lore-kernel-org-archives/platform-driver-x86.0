Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D44E1C54EE9
	for <platform-driver-x86@archiver.kernel.org>; Mon, 19 Sep 2022 12:56:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230261AbiISM4p (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 19 Sep 2022 08:56:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229975AbiISM4n (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 19 Sep 2022 08:56:43 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D77E625C53
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Sep 2022 05:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663592201;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/twziYe5SmyrEoxkmcqYfkTZMoyCl+SSBlFYTEK2DNs=;
        b=LyQz/ZOPuMBo1pmEoRSRF8u8ALn9j1p7n8onuVH7Sbs3uND/c9BOFdnMicl3sOGyH5vx/S
        Mv3GWAMj+VsdhC3YqmBJkj62qrmZpyQQbERtqh5wQzu7S3dWJMSed1EtJebqHsThwCo6Zd
        nHSfcekIIdQNIHfmJoIu3YyUu2h3OK4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-618-zoIYtPDkO3Wv4cgKHATEPw-1; Mon, 19 Sep 2022 08:56:40 -0400
X-MC-Unique: zoIYtPDkO3Wv4cgKHATEPw-1
Received: by mail-ej1-f71.google.com with SMTP id qa33-20020a17090786a100b0077a69976d24so9784027ejc.7
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Sep 2022 05:56:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=/twziYe5SmyrEoxkmcqYfkTZMoyCl+SSBlFYTEK2DNs=;
        b=8CeKVU/URnfSSdFCTq4XCZCwXIFpC+l6p0LvWPdWXj+v7nUP/HsggqRobWBwQMJ3UD
         QFzRv/gLl5pe40PEN7IwHSZRGrwwBa3lf0ZyB1J+gvGFSzh5uKDTL9nKLxQZtM9bKU71
         iIFDpV7oovTmWFImDRdzYvjfMf0aRT8xZycgTwR0Io9WOQtASZGB6qBEWMjf/lP9nVnT
         WRRbJA+3rDi7DMYO07jO/6BBvAxCo/ow0DZGSJztP+5z3finEZh63WAX6GMlU3Mga74B
         jXPtSO66dFBL/nmIqmT8bgmo04wRaqPgXW85wmNVJ3XznvVtryN5FcV34bQADZGtbF3I
         Zeyw==
X-Gm-Message-State: ACrzQf1MN1/Z2D3PoxjN9DGkqIlULyANRvytG5SXESbFDCZzWY0fswA2
        xhTk3FUj3WjIDgk1DCYgZOsrXxpXq5LptvWkFluLQKh5aeZu2Cymp8nZKthe+1xM3HuYLEgsSga
        R3/f6klmiaJMVt+77J96REqY31WCtJAIJDw==
X-Received: by 2002:a05:6402:1655:b0:44e:b208:746d with SMTP id s21-20020a056402165500b0044eb208746dmr15724354edx.229.1663592198955;
        Mon, 19 Sep 2022 05:56:38 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7rfRFLT6JfQ5SKwX4r9xQ2KH8nb+iQ995AwRvF/w4vEW5FKYAF6xdGQkIMqd18cCrxImUgUQ==
X-Received: by 2002:a05:6402:1655:b0:44e:b208:746d with SMTP id s21-20020a056402165500b0044eb208746dmr15724340edx.229.1663592198684;
        Mon, 19 Sep 2022 05:56:38 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id o23-20020a17090611d700b007341663d7ddsm15532923eja.96.2022.09.19.05.56.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 05:56:38 -0700 (PDT)
Message-ID: <ddad44a9-e228-e492-9ec9-e6be32ad8e15@redhat.com>
Date:   Mon, 19 Sep 2022 13:56:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] platform/x86: wmi: Drop forward declaration of static
 functions
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org, kernel@pengutronix.de
References: <20220919122213.852322-1-u.kleine-koenig@pengutronix.de>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220919122213.852322-1-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/19/22 13:22, Uwe Kleine-König wrote:
> Usually it's not necessary to declare static functions if the symbols are
> in the right order. Moving the definition of acpi_wmi_driver down in the
> compilation unit allows to drop two such declarations.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

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
>  drivers/platform/x86/wmi.c | 21 +++++++++------------
>  1 file changed, 9 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
> index aed293b5af81..dbc535b772b3 100644
> --- a/drivers/platform/x86/wmi.c
> +++ b/drivers/platform/x86/wmi.c
> @@ -95,9 +95,6 @@ module_param(debug_dump_wdg, bool, 0444);
>  MODULE_PARM_DESC(debug_dump_wdg,
>  		 "Dump available WMI interfaces [0/1]");
>  
> -static int acpi_wmi_remove(struct platform_device *device);
> -static int acpi_wmi_probe(struct platform_device *device);
> -
>  static const struct acpi_device_id wmi_device_ids[] = {
>  	{"PNP0C14", 0},
>  	{"pnp0c14", 0},
> @@ -105,15 +102,6 @@ static const struct acpi_device_id wmi_device_ids[] = {
>  };
>  MODULE_DEVICE_TABLE(acpi, wmi_device_ids);
>  
> -static struct platform_driver acpi_wmi_driver = {
> -	.driver = {
> -		.name = "acpi-wmi",
> -		.acpi_match_table = wmi_device_ids,
> -	},
> -	.probe = acpi_wmi_probe,
> -	.remove = acpi_wmi_remove,
> -};
> -
>  /*
>   * GUID parsing functions
>   */
> @@ -1449,6 +1437,15 @@ void wmi_driver_unregister(struct wmi_driver *driver)
>  }
>  EXPORT_SYMBOL(wmi_driver_unregister);
>  
> +static struct platform_driver acpi_wmi_driver = {
> +	.driver = {
> +		.name = "acpi-wmi",
> +		.acpi_match_table = wmi_device_ids,
> +	},
> +	.probe = acpi_wmi_probe,
> +	.remove = acpi_wmi_remove,
> +};
> +
>  static int __init acpi_wmi_init(void)
>  {
>  	int error;
> 
> base-commit: 568035b01cfb107af8d2e4bd2fb9aea22cf5b868

