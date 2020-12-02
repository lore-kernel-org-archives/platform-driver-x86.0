Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E28DAC83012
	for <platform-driver-x86@archiver.kernel.org>; Wed,  2 Dec 2020 12:23:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9925D22203
	for <platform-driver-x86@archiver.kernel.org>; Wed,  2 Dec 2020 12:23:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729551AbgLBMWo (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 2 Dec 2020 07:22:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32918 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729859AbgLBMWm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 2 Dec 2020 07:22:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606911675;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=F7u4vMj3ouC+FQN5tXZq6LGEkO4TiuyXwQTPhBCOFZI=;
        b=Jk2vVRdUzDWJeoDmChgPKbLi5DIYrCrmgDcH9FwPkSLFhYxJcWkDAOTwWvWFGobf4SXWP5
        7bXrUqBCBmYk1u7xagsKalr0i+D1RzTpqgBNOnHZyjEK4YlslnOPxerryUTI/b2PW2fXuB
        OMLucxX9lu95KLdYSodVsrDnRmfrXkE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-nBUJasUpP4SlOh9yFRtPow-1; Wed, 02 Dec 2020 07:21:14 -0500
X-MC-Unique: nBUJasUpP4SlOh9yFRtPow-1
Received: by mail-ed1-f71.google.com with SMTP id b13so2916714edy.8
        for <platform-driver-x86@vger.kernel.org>; Wed, 02 Dec 2020 04:21:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=F7u4vMj3ouC+FQN5tXZq6LGEkO4TiuyXwQTPhBCOFZI=;
        b=NSnGT3U3TGBpJnAlKwEAUSjsxbd9FzCmtcTb0it0jCw+sbc6JN0GD6QsUXW30dCgl3
         UPCW4Eol2SNnlzwfhV9R/WHIZStehon5spdfharlUBV5UJ24s5E/fKxOrSXzPdWHto3q
         XkGotGHAiE+UjpGymdULuzAEzVEcrjqA6djD6iD/EE6dNp2nOowuh+06B1eICYE3IEgl
         IzRNA09fB28yws16yan2F2rgzOBN7FmDCLnqB4tTtjyXDZ2fN+XErivxFxP14OsqIB7y
         qqk+Uvv6i9uKR3Q8QTA61hEyFIibC2oTIbZMEBcpPAwb1wfvak5xmdbWBgMWwTbM2CQN
         ADAQ==
X-Gm-Message-State: AOAM53002vNT8DXI9MtGcgYRj+gcvzWP60DH7KyOyBrygdw7NLVzLg5R
        hyyuRj+VeWGHsvjX4c2+hDlxNzRj3P5OkqokGsPBMdfzNNLRLnWfPzoXc9uiAmGdgRBQUojI+Xa
        cyg1v82WRAPnnliKkDJT488Tz+fQurtN4hQ==
X-Received: by 2002:a17:906:a186:: with SMTP id s6mr2017640ejy.193.1606911672834;
        Wed, 02 Dec 2020 04:21:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxB4/5iEEMITnaT5+f8dbWBw/936RDdwkELroxEQgaQPw1PYFhmh5DNqzRQTs4qeFIQao8YbA==
X-Received: by 2002:a17:906:a186:: with SMTP id s6mr2017625ejy.193.1606911672679;
        Wed, 02 Dec 2020 04:21:12 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id n22sm1080944edr.11.2020.12.02.04.21.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Dec 2020 04:21:12 -0800 (PST)
Subject: Re: [PATCH] platform/x86: dell-wmi-sysman: work around for BIOS bug
To:     Divya Bharathi <divya27392@gmail.com>, dvhart@infradead.org
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org,
        Divya Bharathi <divya.bharathi@dell.com>,
        Mario Limonciello <mario.limonciello@dell.com>,
        Prasanth KSR <prasanth.ksr@dell.com>
References: <20201202065636.299000-1-divya.bharathi@dell.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <06db27af-7387-9343-acd3-d75e8c46b623@redhat.com>
Date:   Wed, 2 Dec 2020 13:21:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201202065636.299000-1-divya.bharathi@dell.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 12/2/20 7:56 AM, Divya Bharathi wrote:
> BIOS sets incorrect value (zero) when SET value passed for integer attribute
> with + sign. Added workaround to remove + sign before passing input to BIOS
> 
> Co-developed-by: Mario Limonciello <mario.limonciello@dell.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
> Co-developed-by: Prasanth KSR <prasanth.ksr@dell.com>
> Signed-off-by: Prasanth KSR <prasanth.ksr@dell.com>
> Signed-off-by: Divya Bharathi <divya.bharathi@dell.com>
> ---
>  drivers/platform/x86/dell-wmi-sysman/int-attributes.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/dell-wmi-sysman/int-attributes.c b/drivers/platform/x86/dell-wmi-sysman/int-attributes.c
> index ea773d8e8d3a..f30d155135c3 100644
> --- a/drivers/platform/x86/dell-wmi-sysman/int-attributes.c
> +++ b/drivers/platform/x86/dell-wmi-sysman/int-attributes.c
> @@ -39,7 +39,7 @@ static ssize_t current_value_show(struct kobject *kobj, struct kobj_attribute *a
>   * @instance_id: The instance on which input is validated
>   * @buf: Input value
>   */
> -static int validate_integer_input(int instance_id, const char *buf)
> +static int validate_integer_input(int instance_id, char *buf)
>  {
>  	int in_val;
>  	int ret;
> @@ -51,6 +51,12 @@ static int validate_integer_input(int instance_id, const char *buf)
>  			in_val > wmi_priv.integer_data[instance_id].max_value)
>  		return -EINVAL;
>  
> +	/* workaround for BIOS error.
> +	 * validate input to avoid setting 0 when integer input passed with + sign
> +	 */
> +	if (*buf == '+')
> +		memmove(buf, (buf + 1), strlen(buf));

Can you please use "strlen(buf + 1) + 1" as last argument to the memmove?

I know the effect is the same but that makes it much clearer that you
are also moving the terminating 0 (which at first I thought you were not).

Otherwise this looks good to me.

Regards,

Hans

