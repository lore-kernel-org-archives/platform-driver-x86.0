Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8F8EC4332B
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Mar 2021 14:42:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 850B364F45
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Mar 2021 14:42:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232178AbhCDOlY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 4 Mar 2021 09:41:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51630 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232170AbhCDOkz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 4 Mar 2021 09:40:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614868770;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YeI6QVqkyPzlDneIoONGdEk8YS3pU6UwxyPDkx6WF8w=;
        b=M5crdVkXxqd43zVF1YpSTJFWUAa6xTYGX7+lfeRR8zYicEROWzd9HlgBoX+USbH62SsAvZ
        8n1r41NZrqJXr4FiG1CXTaidd1anhgRkTCCBlnpsL8mfkXCNVy+wvKHgCp/SEvSc51Qi7s
        G88aK7vLvyQh2BKGRZVXMKbCApTyOfg=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-emqdHgxAPVm2IX8kd6sk4A-1; Thu, 04 Mar 2021 09:39:28 -0500
X-MC-Unique: emqdHgxAPVm2IX8kd6sk4A-1
Received: by mail-ej1-f69.google.com with SMTP id v10so12194215ejh.15
        for <platform-driver-x86@vger.kernel.org>; Thu, 04 Mar 2021 06:39:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YeI6QVqkyPzlDneIoONGdEk8YS3pU6UwxyPDkx6WF8w=;
        b=HWMFA+PW7+8c6jNPFO0dqZrDyvgwuAR4oboW9WEeLjtliJRycIBf9w4kTQGY1/0ZGO
         D4NkmQjA4AuTZKiDqF0YJ8Vs9phtN9/qpkd83plUKkt5eEN1ZtbhEiNbx0bkt0EHIZAq
         RXtLQQr809/xLh+7MjBLbpk9RsV8s7L/F/KKnFtIaOwXjekeOPavJiM+ghxv2XPQvPum
         IN9GYYXvMJHVQ+jtYo9IxaIsj5OHS15I7m2llReodL8QYSCDY9Swlz7c+YydWRooFSAT
         ONAPcrCR5N9h2kEsKnGPAIA1Aw5tD3JlJWWSZaLsDibZlQIJlKj8ed0/RYl8Y7utsaaj
         lutQ==
X-Gm-Message-State: AOAM533oACY/oaSmG8uCf8JZvlvGcHzI92kmOI7AfnZYMtMr+F+Cn+UX
        BEhzg9Z/5AjYYLSAr18PWxQ0RkfZmjQbwuIdZbEGILQvhUbtUfQAXgIZSmHyqnMl7wAiJfEgtnZ
        PRssfhB31XEwfDGEGI6J9kIkabHwj3iDAhpYN/32Bd/E20EpnfP3w51fYHg6WyUwqHpM8QmNtE7
        XFr5vVAHXEfA==
X-Received: by 2002:a17:906:25c4:: with SMTP id n4mr4591167ejb.359.1614868767225;
        Thu, 04 Mar 2021 06:39:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy11/QudyVeoNft6ZYg7MKckI/1nBzMHtbfeqLfhy/toGFI5OlBPYK91MTO7BEHOCQe6YfuqQ==
X-Received: by 2002:a17:906:25c4:: with SMTP id n4mr4591126ejb.359.1614868766778;
        Thu, 04 Mar 2021 06:39:26 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id m7sm24180154ejk.52.2021.03.04.06.39.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Mar 2021 06:39:26 -0800 (PST)
Subject: Re: [PATCH] platform/x86: touchscreen_dmi: Handle device properties
 with software node API
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Mark Gross <mgross@linux.intel.com>, linux-input@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
References: <20210304082023.17689-1-heikki.krogerus@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <059af9be-46c3-11ee-a9ff-3384e307ed58@redhat.com>
Date:   Thu, 4 Mar 2021 15:39:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210304082023.17689-1-heikki.krogerus@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/4/21 9:20 AM, Heikki Krogerus wrote:
> The old device property API (device_add_properties()) is
> going to be removed. Replacing the it with the software node
> API equivalent, device_create_managed_software_node().
> 
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
>  drivers/platform/x86/touchscreen_dmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
> index c44a6e8dceb8c..45203e333f578 100644
> --- a/drivers/platform/x86/touchscreen_dmi.c
> +++ b/drivers/platform/x86/touchscreen_dmi.c
> @@ -1355,7 +1355,7 @@ static void ts_dmi_add_props(struct i2c_client *client)
>  
>  	if (has_acpi_companion(dev) &&
>  	    !strncmp(ts_data->acpi_name, client->name, I2C_NAME_SIZE)) {
> -		error = device_add_properties(dev, ts_data->properties);
> +		error = device_create_managed_software_node(dev, ts_data->properties, NULL);
>  		if (error)
>  			dev_err(dev, "failed to add properties: %d\n", error);
>  	}
> 

