Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9DF8C2D0E4
	for <platform-driver-x86@archiver.kernel.org>; Tue, 24 Nov 2020 14:10:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 72688206FB
	for <platform-driver-x86@archiver.kernel.org>; Tue, 24 Nov 2020 14:10:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V2AQAc4L"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729239AbgKXOKv (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 24 Nov 2020 09:10:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35625 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727123AbgKXOKu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 24 Nov 2020 09:10:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606227048;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IRJMvy4oaeH/5rg8te3kj/H29tatOGuciiO1T+cpOXU=;
        b=V2AQAc4LMpfQSE1DoLfZfDO9kNGK5xpWnlPhgjX2OHi8QIbLSdolMN0d3qocnTeOdr0Gf6
        /Bw3YuBVo6c9Gs/2eHjSewNFARwWv9pJAWCxhV42/chrfECNRSqpi1sXr4FD7lusfpgXPm
        OOYcEmvLQHf/JaeWRMkbj2DsTvvUqzw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-81D35WsPPI-KoELWcRl9lw-1; Tue, 24 Nov 2020 09:10:46 -0500
X-MC-Unique: 81D35WsPPI-KoELWcRl9lw-1
Received: by mail-ed1-f70.google.com with SMTP id bu17so7917946edb.22
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2020 06:10:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IRJMvy4oaeH/5rg8te3kj/H29tatOGuciiO1T+cpOXU=;
        b=Thw31Y1MRIo0VoLezAx08exU+vqIJHkO7uy1pxs7Lm7wFioODcaswsO0fnZmZk8/S4
         qO7w9O48TjUkitwZIX9kUYUGBnsIMPw6hWKSY5sOdKvpPa0HwAZj6h1+6CAXRBpQclPD
         sKkGYyn1LDOwI5rPXFJb0yw6n4t66bh9Ge1AkeRV0aNsyHcWst64n44NiS4+rX9d6HcE
         H7TBAKqLI6zkYtL3/V+n/1ts2PBJM8uk+i7udoTKW9T1WAL1DKFnDFx+nntuxocYT3gA
         pIGQKcWUjFtXyc4kLgg0BBUbFnQj4oLla/UOLWELkbn+9vKUtGhPGYB+7Maji1F4UF0Q
         T1JQ==
X-Gm-Message-State: AOAM532Ks39krBYjOGXr72BOdujiHpRbqB6xXepgafVSpZKEKqxJwMwT
        S0m+Gew1GRmykv3OK3ouYNhPU4PtGkbwssmT2VwCq3xHkkKzX9OjysHUxJGqVImUgAflfhuvCQ0
        UZViYS1kGqAYeWC1pEDnvSa2gdsa0EQNIPZkCe0YO+6OS5xCI/tMlUkipq5TtFG4fV6a3bJF8jf
        hQn8Ge7Vwysg==
X-Received: by 2002:a17:907:2089:: with SMTP id pv9mr4469568ejb.34.1606227044956;
        Tue, 24 Nov 2020 06:10:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwlVT1jlG/++8NvXT4sx7TMRg3REYNfV+EVzvMvA7b+2vrzaTJv1gwlziwWPqJMVdKmEbUiVw==
X-Received: by 2002:a17:907:2089:: with SMTP id pv9mr4469545ejb.34.1606227044722;
        Tue, 24 Nov 2020 06:10:44 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id z2sm6980944edr.47.2020.11.24.06.10.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2020 06:10:44 -0800 (PST)
Subject: Re: [PATCH 2/3] platform/x86: asus-wmi: Add new fan type check
To:     Vasiliy Kupriakov <rublag-ns@yandex.ru>,
        Corentin Chary <corentin.chary@gmail.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     platform-driver-x86@vger.kernel.org
References: <20200828214932.20866-1-rublag-ns@yandex.ru>
 <20200828214932.20866-3-rublag-ns@yandex.ru>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <1869d98a-7e57-bddd-27a0-b51d77fd9fdb@redhat.com>
Date:   Tue, 24 Nov 2020 15:10:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20200828214932.20866-3-rublag-ns@yandex.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/28/20 11:49 PM, Vasiliy Kupriakov wrote:
> Some of the new ASUS laptops like TUF Gaming FA706II do not set bit
> indicating presence of method. Instead, just the fan speed is returned.
> 
> Implement ugly way to check if for the cpu fan.
> It seems that in other TUF models SPEC version and SFUN are the same.
> So it checks these two values, then tries to read fan speed, and last,
> checks that fan speed is in adequate range.
> 
> Signed-off-by: Vasiliy Kupriakov <rublag-ns@yandex.ru>

I am worried that this patch is going to cause issues on some systems,
not only does it register a bunch of files in the hwmon class device
(which would be ok-ish since those won't do anything unless used),
but it also causes asus_fan_set_auto() to get called during driver init.

I know that you have tried to limit this to only affected devices by
adding this check:

	if (asus->spec != 0x80001 || !(asus->sfun & 0x400000))

But doing a quick search for dmesg output on Asus devices it seems
that that check will actually be true on many many devices I'm afraid.

Also see the recent history of asus-wmi related to SW_TABLET_MODE support:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/drivers/platform/x86/asus-wmi.c

Specifically:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b0dbd97de1f1fd6b3c9a7bb8f7c795bba7e169d8
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1797d588af15174d4a4e7159dac8c800538e4f8c

Where the first commit took a generic approach like you are doing here;
and the second commit switches to a DMI based allow list.

It seems that the ASUS_WMI_DSTS_PRESENCE_BIT simply is not very reliable
(in either direction) and I wish we had some knowledge what the sfun fields
actually means...

I think for now that unfortunately the best way forward with this patch;
and with your 3th patch too is to use DMI based allow-listing for using the
FAN_TYPE_SPEC83 fan on devices where the ASUS_WMI_DSTS_PRESENCE_BIT is not
set.  What is also interesting is that your WMI versions (spec) seems to be
8.1 where as the SPEC83 stands for 8.3, so I guess that this interface
was actually introduced before the 8.3 WMI API version.

Regards,

Hans



> ---
>  drivers/platform/x86/asus-wmi.c | 34 +++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 71559d429ba0..82505307ec17 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -1309,6 +1309,38 @@ static bool asus_wmi_has_agfn_fan(struct asus_wmi *asus)
>  		 || (!asus->sfun && !(value & ASUS_WMI_DSTS_PRESENCE_BIT)));
>  }
>  
> +/*
> + * Check for fan availability. Some of the newer laptops don't set
> + * the ASUS_WMI_DSTS_PRESENCE_BIT. This is ad hoc solution. It compares
> + * few attributes to constants found in DSDT, then tries to read fan speed
> + */
> +static bool asus_wmi_has_fan(struct asus_wmi *asus, u32 dev_id)
> +{
> +	int status;
> +	u32 value;
> +
> +	/*
> +	 * On multiple TUF laptops with similar DSDT interface
> +	 * for fans, these two values are as following.
> +	 * On some older laptops, they are different.
> +	 */
> +	if (asus->spec != 0x80001 || !(asus->sfun & 0x400000))
> +		return false;
> +
> +	status = asus_wmi_get_devstate(asus, dev_id, &value);
> +	if (status != 0 || value == ASUS_WMI_UNSUPPORTED_METHOD)
> +		return false;
> +
> +	/*
> +	 * Check that fan RPM is in adequate range (0 <= RPM <= 10000)
> +	 * Note that firmware returns RPM/100.
> +	 */
> +	if (value > 100)
> +		return false;
> +
> +	return true;
> +}
> +
>  static int asus_fan_set_auto(struct asus_wmi *asus)
>  {
>  	int status;
> @@ -1613,6 +1645,8 @@ static int asus_wmi_fan_init(struct asus_wmi *asus)
>  		asus->fan_type = FAN_TYPE_SPEC83;
>  	else if (asus_wmi_has_agfn_fan(asus))
>  		asus->fan_type = FAN_TYPE_AGFN;
> +	else if (asus_wmi_has_fan(asus, ASUS_WMI_DEVID_CPU_FAN_CTRL))
> +		asus->fan_type = FAN_TYPE_SPEC83;
>  
>  	if (asus->fan_type == FAN_TYPE_NONE)
>  		return -ENODEV;
> 

