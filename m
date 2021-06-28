Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0501CC2B9F4
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Jun 2021 09:01:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DB0F361988
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Jun 2021 09:01:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232415AbhF1JER (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 28 Jun 2021 05:04:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28253 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231935AbhF1JER (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 28 Jun 2021 05:04:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1624870911;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YSVaYiflx1SeHj//NhESyitcGuHf7twGbF1g3UdTqwM=;
        b=KzEE+OfnPqas7qMx+qq0z37X684G2Q9ON7BZNmn25UfeMQg2JU1+8UnaYItcWUQBpf+Z/y
        6VfY0z7US0xLQ73gU6bipZZYekVJU+ew8uTx3Nyj5q2NWyer3Cr9DkIZpIeXXz8KPr1WVg
        Fp/JrCliysIFKWV6QiyGa3P/ZXQQn1E=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-znnRY5UdPQ-5LZ5Sv9oBxA-1; Mon, 28 Jun 2021 05:01:44 -0400
X-MC-Unique: znnRY5UdPQ-5LZ5Sv9oBxA-1
Received: by mail-ej1-f69.google.com with SMTP id lt4-20020a170906fa84b0290481535542e3so4114204ejb.18
        for <platform-driver-x86@vger.kernel.org>; Mon, 28 Jun 2021 02:01:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YSVaYiflx1SeHj//NhESyitcGuHf7twGbF1g3UdTqwM=;
        b=KJ4joBae3oJTR0tLe4ZAHpiWBo9sJfuwCqt51Com9Ip+Nr3Qz7iJyFbo2Tb/2/06HY
         5ca8rODFsi1c2kvQ/uroqpq0zv/tK1z0h32QK3Tv9h1EVSi2nsbar9Jpsd0L5j965U5X
         hPLN3FUDyF9XG3MB8yQRiQd/5FHpmC+LKYlUlc+u3lR+apsOQAcJHEY0Gd3CtutK5ug5
         KqdnyCz6m8g0R4/tdfGt6Vvej/Uj6VeUAfmB0NsPn8o3BAguVZkUoMT3MabVl35Zxg6K
         IkQpFMQCVzvPBFi4IpSqUzelNBjHXDcg5B4X9oV7/89U4BFoWl0N2lCk0oXSK8+C3m7w
         ZXlw==
X-Gm-Message-State: AOAM532SOR99knEmHrMweBg85BwrRIEB/EPkuexBvVagKpRywSlTHict
        Gyw9aUngTcSUv1iHrfOnaBC7pza74LJM2MwhXUiyo7H7hULF6MiyVAObwqtlxQ4eel2C2J5QW5k
        sjuohG51xpTFkF+hbGXciTTw0CG4lOHsv5A==
X-Received: by 2002:a17:906:2844:: with SMTP id s4mr23084252ejc.263.1624870903043;
        Mon, 28 Jun 2021 02:01:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrx5m8n/Qj4hNbL00gXrN8ViquI032VdXMGuqLGnSgmbo1CV23S2WOpo6+cmsKSdDF5Wk/8Q==
X-Received: by 2002:a17:906:2844:: with SMTP id s4mr23084225ejc.263.1624870902816;
        Mon, 28 Jun 2021 02:01:42 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id o9sm4492306edc.91.2021.06.28.02.01.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jun 2021 02:01:42 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: dell-wmi-sysman: Change user experience
 when Admin/System Password is modified
To:     Prasanth KSR <kosigiprasanth@gmail.com>, dvhart@infradead.org
Cc:     LKML <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org,
        Prasanth KSR <prasanth.ksr@dell.com>,
        Divya Bharathi <divya.bharathi@dell.com>
References: <20210628084906.4233-1-prasanth.ksr@dell.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <e9818bf6-13fb-dec1-c2ee-87ecb2b2cc20@redhat.com>
Date:   Mon, 28 Jun 2021 11:01:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210628084906.4233-1-prasanth.ksr@dell.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/28/21 10:49 AM, Prasanth KSR wrote:
> Whenever user has changed an Admin/System Password using the sysfs,
> then we are automatically copying the new password to existing
> password field.
> 
> Co-developed-by: Divya Bharathi <divya.bharathi@dell.com>
> Signed-off-by: Divya Bharathi <divya.bharathi@dell.com>
> Signed-off-by: Prasanth KSR <prasanth.ksr@dell.com>

Thank you.

I assume this was tested?  The reason I'm asking because in the
Lenovo Think* case it turned out that the modified password only
becomes active after a reboot, so the right thing to do there was
to just keep current_password as is.

Regards,

Hans



> ---
>  .../x86/dell/dell-wmi-sysman/passwordattr-interface.c         | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/passwordattr-interface.c b/drivers/platform/x86/dell/dell-wmi-sysman/passwordattr-interface.c
> index 339a082d6c18..86ec962aace9 100644
> --- a/drivers/platform/x86/dell/dell-wmi-sysman/passwordattr-interface.c
> +++ b/drivers/platform/x86/dell/dell-wmi-sysman/passwordattr-interface.c
> @@ -95,9 +95,9 @@ int set_new_password(const char *password_type, const char *new)
>  
>  	print_hex_dump_bytes("set new password data: ", DUMP_PREFIX_NONE, buffer, buffer_size);
>  	ret = call_password_interface(wmi_priv.password_attr_wdev, buffer, buffer_size);
> -	/* clear current_password here and use user input from wmi_priv.current_password */
> +	/* on success copy the new password to current password */
>  	if (!ret)
> -		memset(current_password, 0, MAX_BUFF);
> +		strscpy(current_password, new, MAX_BUFF);
>  	/* explain to user the detailed failure reason */
>  	else if (ret == -EOPNOTSUPP)
>  		dev_err(&wmi_priv.password_attr_wdev->dev, "admin password must be configured\n");
> 

