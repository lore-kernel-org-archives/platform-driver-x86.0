Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 109F2C4338F
	for <platform-driver-x86@archiver.kernel.org>; Thu, 29 Jul 2021 17:34:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EB9EC60E9B
	for <platform-driver-x86@archiver.kernel.org>; Thu, 29 Jul 2021 17:34:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232080AbhG2Rej (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 29 Jul 2021 13:34:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55383 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229739AbhG2Rej (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 29 Jul 2021 13:34:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1627580075;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=N3IraJdEilssUFQ+/UjwCkbDSBGh8IXc7v9bkIq+gbU=;
        b=Ysm/OKLkvhFrANQN1gGucBXJgPvrDqqHAu7qtMkJagmtbubHlERywTCCS7HUQZOckk+Ka2
        KR+pTrbwLoSoapi9XL4wW8De5ozoE16MZk7LRs0d4X36pxjGBqXI3lQSvYrxv9lLqjihM2
        mHPDOhta68AKsTXwdwr5bgT4KjgldiA=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-8zDI6XvTOq2spc2oDk464Q-1; Thu, 29 Jul 2021 13:34:34 -0400
X-MC-Unique: 8zDI6XvTOq2spc2oDk464Q-1
Received: by mail-ej1-f69.google.com with SMTP id q19-20020a1709064cd3b02904c5f93c0124so2229157ejt.14
        for <platform-driver-x86@vger.kernel.org>; Thu, 29 Jul 2021 10:34:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=N3IraJdEilssUFQ+/UjwCkbDSBGh8IXc7v9bkIq+gbU=;
        b=hSmrpnY50v6u1Vhh7XQC0QYlBlFlPnbVQPC/85wdpad+/uwtvuzKWOu2zIdnzpE3wS
         yFi44LtGmnBY/xNvLX74HVsM5x6q59xpdQwOPbeI7bokpW/i0hLt9E4+uFL8LfTZfTul
         0vzdzYeoqua3mVjgISsecWr0/OBZnUnveBXVQyeqjWfEMs7jxurHJY58haOF1G/+LnAh
         EOoVL9AUq6LKvIB2NqOkqVITVOKkZ6WAgIOpql1TjNifgZl19rk/45tDqcjBqpD3fAak
         E1YF1rtjkXv276dGrM5neLnxAZKF1fV4Sntv1lso5s+J2aPgOol0fWm8PdpGZlub5t9/
         GVCA==
X-Gm-Message-State: AOAM533ywHXpm4n6fzBDitA+Kt7GxvDl/Ybf2I13Pa+A6PLFBVxfjg4n
        YIudPVJLo+YVK+8mtaxH20nliV801tawZ4eJxTEkOUbqItXATuwW23hflL/qOFJ95k61WNKpwis
        CzbbH+GMSmcyYmDWagiEN6CuTT3drLTsnhMcOJ2C1ck6NoUe+w+L/wdS77dLZCynziQmc79c8jD
        VaESL/2EVyBQ==
X-Received: by 2002:a17:906:6d4e:: with SMTP id a14mr5634113ejt.328.1627580072929;
        Thu, 29 Jul 2021 10:34:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyoF0tecMLDi2xG/O7wdIk3NSRqOBp7DnadEElytUZzleMWkFK/XvFcl/w51awv8ahL5nfX2Q==
X-Received: by 2002:a17:906:6d4e:: with SMTP id a14mr5634093ejt.328.1627580072640;
        Thu, 29 Jul 2021 10:34:32 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id m13sm1190759ejg.76.2021.07.29.10.34.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jul 2021 10:34:32 -0700 (PDT)
Subject: Re: [External]Re: [PATCH] platform/x86: think-lmi: add debug_cmd
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     mgross@linux.intel.com, platform-driver-x86@vger.kernel.org
References: <markpearson@lenovo.com>
 <20210715230850.389961-1-markpearson@lenovo.com>
 <4e59c26c-d58b-dfd5-ed21-f9cd83fc43b6@redhat.com>
 <fc392326-9d19-dc78-bf06-da85b3b53fb2@lenovo.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <985c01bb-76f4-a7c1-e614-470cb5009576@redhat.com>
Date:   Thu, 29 Jul 2021 19:34:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <fc392326-9d19-dc78-bf06-da85b3b53fb2@lenovo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Mark,

On 7/19/21 2:46 PM, Mark Pearson wrote:
> Thanks for the review Hans
> 
> On 2021-07-17 9:59 a.m., Hans de Goede wrote:
>> Hi Mark,
>>
>> On 7/16/21 1:08 AM, Mark Pearson wrote:
>>> Many Lenovo BIOS's support the ability to send a debug command which
>>> is useful for debugging and testing unreleased or early features.
>>> Adding support for this feature.
>>>
>>> Also moved the pending_reboot node under attributes dir where it should
>>> correctly live. Got that wrong in my last commit and realised as I was
>>> updating the documentation for debug_cmd
>>>
>>> Signed-off-by: Mark Pearson <markpearson@lenovo.com>
>>
>> Thank you for the patch, I'm not entirely sure if we want this in its
>> current form though, isn't this new debug_cmd file not something which
>> would be better under debugfs ?  Or maybe have it only show up if
>> a module parameter is passed to enable it ?
>>
>> Note that both have implications wrt secureboot. debugfs is only
>> writeable when secureboot is disabled; and ATM module options are
>> not protected by secureboot, but at least in Fedora we would actually
>> like to change that in the future.
>>
>> Anyways, lets discuss this a bit further and then merge something
>> for this later.
>>
> I wasn't sure about debugfs but did consider it. It seemed to be adding a whole extra layer. I'm happy to do that if that's what is recommended but not having it available with secureboot could be annoying for users.

I agree that adding debugfs support just for a single file seems a bit overkill.

> This feature is mostly used internally (which is fine) but we have had occasions where we've used it with customers; and with the WMI interface it's usually the enterprise customers who do have secure boot enabled. I'd like to avoid that limitation if possible.

So given that using debugfs seems a bit overkill and it has issues with
selinux I think that it might be best to hide this file behind a module
option (and mention that in the docs, or maybe not document it at all?).

At least for now kernel commandline options an be set without breaking
secureboot and even if secureboot ever starts verifying the cmdline then
we can always use a /etc/modprobe.d/*.conf file to specify the option
instead of passing it through the kernel cmdline.

Would using a module option to enable the debug_cmd file
work for you ?

Regards,

Hans

