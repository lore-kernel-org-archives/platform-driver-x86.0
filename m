Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CBD1C6FD19
	for <platform-driver-x86@archiver.kernel.org>; Thu, 16 Mar 2023 15:00:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229943AbjCPPAo (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 16 Mar 2023 11:00:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229887AbjCPPAn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 16 Mar 2023 11:00:43 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DB1D4EE4
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Mar 2023 07:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678978793;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/5GJ5x2FVjONVIigRbh22XI3AOSyKuTQRXeE+fd3MDU=;
        b=FecjREasRKCdCpK9da8vgAWij8DeZG65udl/fBptyTV7OapUGvXaYNl7K/+wLMTgo5p+94
        +ZiHR8qcpZY9IO4hzuSMmAHmr2h+iP85LSFXJ+S9Km0+2UAGfO0/ei9jcmDP4wr4853QcE
        n/SunA4ABXy8glB+K8j+1IQE4NhvAj8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-248-ZH5OONoXPuugTms8OLOs0Q-1; Thu, 16 Mar 2023 10:59:52 -0400
X-MC-Unique: ZH5OONoXPuugTms8OLOs0Q-1
Received: by mail-ed1-f69.google.com with SMTP id es16-20020a056402381000b004fa3e04c882so3427629edb.10
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Mar 2023 07:59:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678978791;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/5GJ5x2FVjONVIigRbh22XI3AOSyKuTQRXeE+fd3MDU=;
        b=7nJcRfp9/n/JelogWiRTT5zM00VN/D8fWT5f7Z+/fTO/I/XhldUcB7h7bhvUKQO+eK
         ba8m7hHCfFb+c7HA758CqGKcGO/dXbTVafwWjSeaQWZql3b9BMMR8Ugvo6W0rvzN4IYb
         hMKHKGFmXLilRQ5vLTd5zY2XlhdYUtyBgWfZaaE+VStdQYBxDRP1VjD8UR8UthzQDUR6
         RQSWi7cLzAjRo1FnTioF87z5atCfE8NQKuAODwFxJt6waSQb5dsuMaUGQa+bVtQUrY9T
         YzKXsw4vB36HTf6ynW3o6L7JlchNSyzdcLaOgW0NRlD4DUIAFR9/vcgiWpYnweXhKqbc
         wNvw==
X-Gm-Message-State: AO0yUKUMBOjNNH4W6ykQuOfa5t4NxUlX7Lcay6YVKnjMN/IWg34+wnd2
        WuRGl7rJL5QiGRFxRlp3/zWch1vcxLPEVUBk4fjwrevgHVQ5hQVNywDCiAwDDm8dXMN5IYDZB6W
        F4ArgVOqxBfyCbt32hfDJc0gVVBp5Rvb1Fg==
X-Received: by 2002:a17:906:ae09:b0:931:2f96:819c with SMTP id le9-20020a170906ae0900b009312f96819cmr810593ejb.27.1678978791177;
        Thu, 16 Mar 2023 07:59:51 -0700 (PDT)
X-Google-Smtp-Source: AK7set99L1X1rurag79LZEm9FJLFTV9mg72SYqJoWEXYOUA3JNtjMPJNbvZY/E5dfGAuEJGLiXz7Sw==
X-Received: by 2002:a17:906:ae09:b0:931:2f96:819c with SMTP id le9-20020a170906ae0900b009312f96819cmr810572ejb.27.1678978790872;
        Thu, 16 Mar 2023 07:59:50 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id i8-20020a1709063c4800b009307c596cb8sm835266ejg.100.2023.03.16.07.59.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Mar 2023 07:59:50 -0700 (PDT)
Message-ID: <a97e6200-bdc3-ce8e-cb9b-498b35510bd7@redhat.com>
Date:   Thu, 16 Mar 2023 15:59:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] platform/x86: int3472: Remap reset GPIO for INT347E
Content-Language: en-US, nl
To:     Daniel Scally <dan.scally@ideasonboard.com>,
        Daniel Scally <djrscally@gmail.com>,
        Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org
References: <20230311223019.14123-1-dan.scally@ideasonboard.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230311223019.14123-1-dan.scally@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Daniel,

On 3/11/23 23:30, Daniel Scally wrote:
> ACPI _HID INT347E represents the OmniVision 7251 camera sensor. The
> driver for this sensor expects a single pin named "enable", but on
> some Microsoft Surface platforms the sensor is assigned a single
> GPIO who's type flag is INT3472_GPIO_TYPE_RESET.
> 
> Remap the GPIO pin's function from "reset" to "enable". This is done
> outside of the existing remap table since it is a more widespread
> discrepancy than that method is designed for. Additionally swap the
> polarity of the pin to match the driver's expectation.
> 
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>

I have recently been looking into GPIO mappings on various devices
using the atomisp2 ISP. These use the same _DSM as the IPU3 but
then directly on the sensor ACPI device node.

What I came up with is this (I still need to submit this upstream):

https://github.com/jwrdegoede/linux-sunxi/commit/e2287979db43d46fa7d354c1bde92eb6219b613d

One thing which I learned while working on this is that in the value returned by the _DSM
the byte with mask 0xff00 is the pin-number on the GPIO controller; and (and this is the important bit!) unlike the assumption in the IPU3/INT3472 code the order in which the GPIOs are listed in the "79234640-9e10-4fea-a5c1-b5aa8b19756f" _DSM is *NOT* always the order in which they are listed in the GPIO resources!

So as you can see in the linked commit I'm finding the GPIO resource to go with the _DSM value by matching the pin-numbers.

I'm wondering if we need to do the same thing on IPU3 and if this is maybe why we need to do any remapping at all ?

Can you please check if there is not something like the above going on before we add a remap quirk for this ?

Regards,

Hans






> ---
>  drivers/platform/x86/intel/int3472/discrete.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
> index f064da74f50a..2064b3bbe530 100644
> --- a/drivers/platform/x86/intel/int3472/discrete.c
> +++ b/drivers/platform/x86/intel/int3472/discrete.c
> @@ -98,6 +98,9 @@ static int skl_int3472_map_gpio_to_sensor(struct int3472_discrete_device *int347
>  {
>  	const struct int3472_sensor_config *sensor_config;
>  	char *path = agpio->resource_source.string_ptr;
> +	const struct acpi_device_id ov7251_ids[] = {
> +		{ "INT347E" },
> +	};
>  	struct gpiod_lookup *table_entry;
>  	struct acpi_device *adev;
>  	acpi_handle handle;
> @@ -120,6 +123,17 @@ static int skl_int3472_map_gpio_to_sensor(struct int3472_discrete_device *int347
>  		}
>  	}
>  
> +	/*
> +	 * In addition to the function remap table we need to bulk remap the
> +	 * "reset" GPIO for the OmniVision 7251 sensor, as the driver for that
> +	 * expects its only GPIO pin to be called "enable" (and to have the
> +	 * opposite polarity).
> +	 */
> +	if (!strcmp(func, "reset") && !acpi_match_device_ids(int3472->sensor, ov7251_ids)) {
> +		func = "enable";
> +		polarity = GPIO_ACTIVE_HIGH;
> +	}
> +
>  	/* Functions mapped to NULL should not be mapped to the sensor */
>  	if (!func)
>  		return 0;

