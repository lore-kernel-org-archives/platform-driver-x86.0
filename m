Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AADE3C6FA82
	for <platform-driver-x86@archiver.kernel.org>; Sat, 10 Sep 2022 12:17:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229549AbiIJMRC (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 10 Sep 2022 08:17:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbiIJMRC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 10 Sep 2022 08:17:02 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A435564F1
        for <platform-driver-x86@vger.kernel.org>; Sat, 10 Sep 2022 05:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662812216;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=s0lFzmtysPc2XiOrnSujQj62qKf0uyarqSp12XT3KGA=;
        b=IIWHorLJAaUYmyB27y5RkFir/a2FjY5F60UewuUojl9ZFw+xQZ/WjOLr4xkULiusmwQ5Cz
        i7tTzGnFp5Ddi9imjShGvKsYAyRPT1xXekG6BZ4Dk//GMlwec/43Z6cVJNxKNdqHpBJ1kG
        ytpmKBuWqSl6G+w5Lm8ZXfCQXof/KiU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-621-UU4afFD3MieiT5nyccY2fg-1; Sat, 10 Sep 2022 08:16:47 -0400
X-MC-Unique: UU4afFD3MieiT5nyccY2fg-1
Received: by mail-ed1-f70.google.com with SMTP id b16-20020a056402279000b0044f1102e6e2so3033474ede.20
        for <platform-driver-x86@vger.kernel.org>; Sat, 10 Sep 2022 05:16:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=s0lFzmtysPc2XiOrnSujQj62qKf0uyarqSp12XT3KGA=;
        b=W7gWATePII5MGMxCyytOwRknVbWiXBzK/PWBa9jRmHlT50jL21tMhcUVjXFB1k2l72
         rFvbqq83ZX2yUYEztAAkHpiAcqIF/vKjIcG8TDRPw1V0MHIP64khVcvAmbmdoVFw9gMP
         +2YyHr2fKnUq5CcrPJRDKR3DSZATIYtIWWl1ZtaxMMzn1Ls5HPS5xtBqlDrKUwJxHMpG
         zB0ynGW085j1GkMB9S4lqqIFZQa5YbDH3xwGUa4ziCbTn47U2SP/ePqcA1EVSfajUbO0
         Ws3ZDjEiWkQ4G+OFvqjyDtwldyyHd4h4hVz0KBkTeaWpi3qRwL23uf03JtzAFzi/ytlv
         yWmQ==
X-Gm-Message-State: ACgBeo2RG/34Ca9A050GDkpagq5xqM44QN5lRLjGdFjFXRBps4xiS6Zd
        g3R5vzwKcfNgcXEB8w9YTzFxnLMsQD57GGPazqKQhxzl3NiVcQQ4svvBvffvrrWRdXQyBDWuYgy
        s19yIBBWjRo2sRth1+Lgx+fNW9TxqPPaVwg==
X-Received: by 2002:aa7:c506:0:b0:44e:6abd:1fb8 with SMTP id o6-20020aa7c506000000b0044e6abd1fb8mr14923470edq.308.1662812206512;
        Sat, 10 Sep 2022 05:16:46 -0700 (PDT)
X-Google-Smtp-Source: AA6agR670DLUMkU65RFMHJHQd64+wbf7jcIqeSGgqYe6UyAJT6RvJbiEBM6rBRJ2gUyNrUQCVpMXgg==
X-Received: by 2002:aa7:c506:0:b0:44e:6abd:1fb8 with SMTP id o6-20020aa7c506000000b0044e6abd1fb8mr14923459edq.308.1662812206270;
        Sat, 10 Sep 2022 05:16:46 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id m22-20020aa7c496000000b0044f1bd0fbd1sm2108938edq.34.2022.09.10.05.16.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Sep 2022 05:16:45 -0700 (PDT)
Message-ID: <05fa0692-de86-f3b4-290c-1dd33d5043dc@redhat.com>
Date:   Sat, 10 Sep 2022 14:16:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] platform/x86: asus-wmi: Make kbd_rgb_mode_groups statis
Content-Language: en-US
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>
Cc:     Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org,
        kernel test robot <lkp@intel.com>
References: <20220909210950.385398-1-hdegoede@redhat.com>
 <feaddc04-7274-24d2-57ef-850c502ba9eb@redhat.com>
In-Reply-To: <feaddc04-7274-24d2-57ef-850c502ba9eb@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi again,

On 9/10/22 14:15, Hans de Goede wrote:
> Hi all,
> 
> On 9/9/22 23:09, Hans de Goede wrote:
>> kbd_rgb_mode_groups is only used inside asus-wmi.c, make it static.
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> I've added this to my review-hans (soon to be for-next) branch now.

With the typo in the subject fixed.

Regards,

Hans


>> ---
>>  drivers/platform/x86/asus-wmi.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
>> index d95170b7dba0..ae46af731de9 100644
>> --- a/drivers/platform/x86/asus-wmi.c
>> +++ b/drivers/platform/x86/asus-wmi.c
>> @@ -835,7 +835,7 @@ static const struct attribute_group kbd_rgb_state_group = {
>>  	.attrs = kbd_rgb_state_attrs,
>>  };
>>  
>> -const struct attribute_group *kbd_rgb_mode_groups[] = {
>> +static const struct attribute_group *kbd_rgb_mode_groups[] = {
>>  	NULL,
>>  	NULL,
>>  	NULL,

