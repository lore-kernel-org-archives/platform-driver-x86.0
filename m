Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69675C433EF
	for <platform-driver-x86@archiver.kernel.org>; Sat,  5 Feb 2022 13:45:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379998AbiBENpy (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 5 Feb 2022 08:45:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41179 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234562AbiBENpy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 5 Feb 2022 08:45:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1644068753;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=D6JG/BZaid8JhOZ1mbGLv87KT0IJJWRNq9H/HSBNA8Y=;
        b=SyJi8cYFPb8I6/MCqDMdZBROY2eDfX/pPq+kDJJu3kmDnhxXwnaViv003V+hr147Kqn86v
        SZTPCu7Uo7iIGYNZ1GmLQqbVB+0UfN8Ui3gCNM844K9d3TS9JFBUHcDTIK+phPbRd+8o7q
        mv/u6XcJd3C83JLlj3eo8qWKuIJdhg0=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-316-iVwut8JTN-uUzhCFgSTVIA-1; Sat, 05 Feb 2022 08:45:52 -0500
X-MC-Unique: iVwut8JTN-uUzhCFgSTVIA-1
Received: by mail-ej1-f69.google.com with SMTP id q3-20020a17090676c300b006a9453c33b0so3537305ejn.13
        for <platform-driver-x86@vger.kernel.org>; Sat, 05 Feb 2022 05:45:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=D6JG/BZaid8JhOZ1mbGLv87KT0IJJWRNq9H/HSBNA8Y=;
        b=bYxqcJz+bHoRMy1mKX8MxsFtXf/hOfjwGD21WcpgM/E1eUM0PE0VKONGAT8omYFnVA
         lU9p0rV1/KH8KQLHIs75FPGvTMTpKHwzIwf9N06BE5smO9tpGtZP1nB+AUyQ3Vp3oLaY
         JbCvWeEqQTBm9fH0WVRVldFB7TJi3qF/iXzoX8u1vUncqAhJP0R35AgjGJsKV69pOmVJ
         QVADfdzb3+4LnaoM2bF0u3jfPiZ5lkdQW/MK6fb76okmcyRt94crldBkW/MumTqyNxcO
         AecZVzxTkZlcpRoIxolYroBq+0zWehIHh89RoAs+tpQx0fIR1rghmGPryO5eYh8pfC21
         9qvA==
X-Gm-Message-State: AOAM532gMgMF+i5e7WSk11KlRYfl5+ANKPJ9RjXRfU+5741J455BK4LW
        LZ0iC2Xa+T/KyAGCP20ijL39OuANNaQvK76ES3osWKTjo1wCXiq2g1AyIBgmklrchRdciLnYxKI
        UhDhis/F/oghATtIrO6cJKdZUQ2oZrYq/Rg==
X-Received: by 2002:a05:6402:348b:: with SMTP id v11mr4365008edc.353.1644068751169;
        Sat, 05 Feb 2022 05:45:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwibUMRMGY5sYezJ/ei6BMfKDySe52eoD+sRiINOGvddtUA2oaK66MJLuikRtG+ejh1K5OB7w==
X-Received: by 2002:a05:6402:348b:: with SMTP id v11mr4364992edc.353.1644068751033;
        Sat, 05 Feb 2022 05:45:51 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id la1sm488526ejb.22.2022.02.05.05.45.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Feb 2022 05:45:50 -0800 (PST)
Message-ID: <9e5fb269-75e6-25f4-c111-1a5ce4a694cd@redhat.com>
Date:   Sat, 5 Feb 2022 14:45:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] platform/x86: asus-wmi: Fix regression when probing for
 fan curve control
Content-Language: en-US
To:     Abhijeet Viswa <abhijeetviswa@gmail.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org
References: <20220205112840.33095-1-hdegoede@redhat.com>
 <94d60c8a-3716-7b29-be79-10ecad96cae3@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <94d60c8a-3716-7b29-be79-10ecad96cae3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/5/22 13:05, Abhijeet Viswa wrote:
> Hi,
> 
> Tested this out and it works as expected. Thanks for the quick resolution!

Thank you,

I've added this to my review-hans (soon to be for-next) branch now
I'll also include this in my next fixes pull-req for 5.17 (the bug
only exists in 5.17).

Regards,

Hans


> On 05/02/22 16:58, Hans de Goede wrote:
>> The fan curve control patches introduced a regression for at least the
>> TUF FX506 and possibly other TUF series laptops that do not have support
>> for fan curve control.
>>
>> As part of the probing process, asus_wmi_evaluate_method_buf is called
>> to get the factory default fan curve . The WMI management function
>> returns 0 on certain laptops to indicate lack of fan curve control
>> instead of ASUS_WMI_UNSUPPORTED_METHOD. This 0 is transformed to
>> -ENODATA which results in failure when probing.
>>
>> Fixes: 0f0ac158d28f ("platform/x86: asus-wmi: Add support for custom fan curves")
>> Reported-by: Abhijeet V <abhijeetviswa@gmail.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/platform/x86/asus-wmi.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
>> index a3b83b22a3b1..2104a2621e50 100644
>> --- a/drivers/platform/x86/asus-wmi.c
>> +++ b/drivers/platform/x86/asus-wmi.c
>> @@ -2223,7 +2223,7 @@ static int fan_curve_check_present(struct asus_wmi *asus, bool *available,
>>  
>>  	err = fan_curve_get_factory_default(asus, fan_dev);
>>  	if (err) {
>> -		if (err == -ENODEV)
>> +		if (err == -ENODEV || err == -ENODATA)
>>  			return 0;
>>  		return err;
>>  	}
> 

