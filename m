Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B907EC433E0
	for <platform-driver-x86@archiver.kernel.org>; Mon, 22 Feb 2021 09:56:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 672F464E13
	for <platform-driver-x86@archiver.kernel.org>; Mon, 22 Feb 2021 09:56:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230125AbhBVJ4y (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 22 Feb 2021 04:56:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24909 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230060AbhBVJ4x (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 22 Feb 2021 04:56:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613987727;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hRBICccBgEcAau0frnzIZLdNGmFu16xAVTYuVaZrsmQ=;
        b=JjFpbklg+VMWFfKM/bqUexnoppgEtrau0Hi9AOcI21V7nDBL0YGQtVAaEFQjDNZiHiuCoB
        A/xcnx5QZvwzSCACSsaXBfKLe+1fyS/EQdNv5AWY3gF6y9Yny8jXvxmiKFWv1fiyAsP80F
        lNT+ISeM1Upzta3q0PHv3AGD2qie5Yc=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-tpbqJyvdPByntvNYlRA0pw-1; Mon, 22 Feb 2021 04:55:24 -0500
X-MC-Unique: tpbqJyvdPByntvNYlRA0pw-1
Received: by mail-ed1-f72.google.com with SMTP id ch30so2867007edb.14
        for <platform-driver-x86@vger.kernel.org>; Mon, 22 Feb 2021 01:55:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hRBICccBgEcAau0frnzIZLdNGmFu16xAVTYuVaZrsmQ=;
        b=Lw2ZmvJKBeMXWfhsjz44Z6cvMk3a2wsX1MYwu48eWubS5clX5tSqFh1AWvjWlXxd33
         E6yZRJu9k2ID+Y6O+EGZfuco9WwX0n1Z2E6ru0S1iwnzm9c+/sh0L24uPOxUdEAqIq4E
         XEtraBLrOyZXklcu2F/kL8ZXOfm0CGeydfq9ewSmEGY83Zmvz74dGGQID6/7pqIMfJwM
         zXmD8M94pc+ga/D84evtF46l6jEC8cs1kuAJv7Py5IAICnwtfjKsG1BE0iMIws6exHN1
         KVHA1+7b15H7sltswZNqsAhiZNVjMMmx5zPllxj4CqARtdwvIzruqdzDtwsYf52pUuZI
         S3bw==
X-Gm-Message-State: AOAM530+Hm4zZwNEXbehgXh30Ghh6ILhtUdFDNn7VLiuZqP55pMuOPHB
        8xmdrBPIeFRJCYuSCY4/wcreShqfk2o4tsNvVtNJdLIVg7NR9WmCX92sPMure3BwSZXTIk8kOrg
        ix7sqEyLd4shd+TXf2V/Bi/olpuyORjIdIw==
X-Received: by 2002:a05:6402:1593:: with SMTP id c19mr2829591edv.274.1613987723453;
        Mon, 22 Feb 2021 01:55:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzplWvd2ZJiexdrTEF1gNnTBzIhr4LG2vPt5qZmzus9ICwwvtYFaL7eGZAVHOpxqxMqrO9Skg==
X-Received: by 2002:a05:6402:1593:: with SMTP id c19mr2829586edv.274.1613987723344;
        Mon, 22 Feb 2021 01:55:23 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id li22sm10085829ejb.29.2021.02.22.01.55.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Feb 2021 01:55:23 -0800 (PST)
Subject: Re: [PATCH 1/2] platform/x86: hp-wmi: rename "thermal policy" to
 "thermal profile"
To:     Elia Devito <eliadevito@gmail.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210221210256.68198-1-eliadevito@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <525eef3b-6534-6f3f-e8f0-338500d8023f@redhat.com>
Date:   Mon, 22 Feb 2021 10:55:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210221210256.68198-1-eliadevito@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/21/21 10:02 PM, Elia Devito wrote:
> rename "thermal policy" with the more appropriate term "thermal profile"
> 
> Signed-off-by: Elia Devito <eliadevito@gmail.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

I will merge this once we are out of the merge-window / once 5.12-rc1 is out.

Regards,

Hans



> ---
>  drivers/platform/x86/hp-wmi.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
> index e94e59283ecb..6d7b91b8109b 100644
> --- a/drivers/platform/x86/hp-wmi.c
> +++ b/drivers/platform/x86/hp-wmi.c
> @@ -85,7 +85,7 @@ enum hp_wmi_commandtype {
>  	HPWMI_FEATURE2_QUERY		= 0x0d,
>  	HPWMI_WIRELESS2_QUERY		= 0x1b,
>  	HPWMI_POSTCODEERROR_QUERY	= 0x2a,
> -	HPWMI_THERMAL_POLICY_QUERY	= 0x4c,
> +	HPWMI_THERMAL_PROFILE_QUERY	= 0x4c,
>  };
>  
>  enum hp_wmi_command {
> @@ -869,19 +869,19 @@ static int __init hp_wmi_rfkill2_setup(struct platform_device *device)
>  	return err;
>  }
>  
> -static int thermal_policy_setup(struct platform_device *device)
> +static int thermal_profile_setup(struct platform_device *device)
>  {
>  	int err, tp;
>  
> -	tp = hp_wmi_read_int(HPWMI_THERMAL_POLICY_QUERY);
> +	tp = hp_wmi_read_int(HPWMI_THERMAL_PROFILE_QUERY);
>  	if (tp < 0)
>  		return tp;
>  
>  	/*
> -	 * call thermal policy write command to ensure that the firmware correctly
> +	 * call thermal profile write command to ensure that the firmware correctly
>  	 * sets the OEM variables for the DPTF
>  	 */
> -	err = hp_wmi_perform_query(HPWMI_THERMAL_POLICY_QUERY, HPWMI_WRITE, &tp,
> +	err = hp_wmi_perform_query(HPWMI_THERMAL_PROFILE_QUERY, HPWMI_WRITE, &tp,
>  							   sizeof(tp), 0);
>  	if (err)
>  		return err;
> @@ -900,7 +900,7 @@ static int __init hp_wmi_bios_setup(struct platform_device *device)
>  	if (hp_wmi_rfkill_setup(device))
>  		hp_wmi_rfkill2_setup(device);
>  
> -	thermal_policy_setup(device);
> +	thermal_profile_setup(device);
>  
>  	return 0;
>  }
> 

