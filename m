Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55F1BC77B7C
	for <platform-driver-x86@archiver.kernel.org>; Tue,  9 May 2023 10:34:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235199AbjEIKeX (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 9 May 2023 06:34:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235353AbjEIKeK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 9 May 2023 06:34:10 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF96010A15
        for <platform-driver-x86@vger.kernel.org>; Tue,  9 May 2023 03:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683628383;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rY0wAhFO0QvQXSIMKQo3/4SZywWKrbnd3LDq+RJ6btQ=;
        b=OiYv/rkhhOV+MA9a57cyIijO1vCpytl9dI1mFQgucXuBmylCdyqPKnZFuZvqge9bmItugD
        wjSZWZw24ZIaW3ApRlc8ff+23bgvQ0SUCPeddSTzEtzgo9dUAQOQDSS4at87kx5ddilwKp
        h+wGT1AjOiUPTQJH7p3FxVVeltGkcEA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-597-UD0lW88LPmy4cBfQ7IbG0g-1; Tue, 09 May 2023 06:33:01 -0400
X-MC-Unique: UD0lW88LPmy4cBfQ7IbG0g-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-94a355cf318so657289766b.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 09 May 2023 03:33:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683628381; x=1686220381;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rY0wAhFO0QvQXSIMKQo3/4SZywWKrbnd3LDq+RJ6btQ=;
        b=EFNQu/zzJxs0OCBgQvkKYhQOFmlELSrq6F2F3oMRtv2mrb43Kcz0rQA2ThRxwaIqVL
         OD8vHDNMjdiig2zq5ud94bvTM5mfA3Zz9fSGNujmtvJJsmQ0plYD0snFbvPNPYuuUGcI
         euw6xMCI3yH9dEIul+UNsUZNEixGs3/RrUpj/nnVQX3sl/yCJbdvUjcSBpRMYVacRNpC
         8iyqdnoa63Dknk95dQ7JqzzMOwHbv0TvbGdQGBKTV27dn74ToHzj8Z97PMn7Cb2AmkIb
         jNHvcZqYEwErrT1xVLgKwXtGs8aNw/nXW72F8M7BqxqmLl0dRIvO289V5pfRNyRWS4/c
         uk1g==
X-Gm-Message-State: AC+VfDwY3mNLtjFUvsf/jYWrxusXO2jaqQJ6WtIMGzLrhch+dNbuLgsy
        HSne0lQDqjFnFaNwdeJnvFlgyemi1/K4YXAwTiQIH4eMASM7TtKgD6p3xPp/8tw+wt5F1jjd036
        k03ucOaiCJXmw4TurtI4nzK/T9zVuQVbhjg==
X-Received: by 2002:a17:907:a4d:b0:95e:de94:5bea with SMTP id be13-20020a1709070a4d00b0095ede945beamr11586525ejc.56.1683628380814;
        Tue, 09 May 2023 03:33:00 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5ZAQ9eCkaXMHHXerfZzIta4y0/T8ovCZ82gEgyXT6wc8rMWJpmUYK9BAFnT0SZXGRYHhkx1g==
X-Received: by 2002:a17:907:a4d:b0:95e:de94:5bea with SMTP id be13-20020a1709070a4d00b0095ede945beamr11586508ejc.56.1683628380502;
        Tue, 09 May 2023 03:33:00 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id v20-20020a170906b01400b0096165b2703asm1153586ejy.110.2023.05.09.03.32.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 May 2023 03:33:00 -0700 (PDT)
Message-ID: <a36a760f-6f64-190f-f94b-d30b82b3382e@redhat.com>
Date:   Tue, 9 May 2023 12:32:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 10/19] platform/x86: lenovo-yogabook: Split probe()
 into generic and WMI specific parts
Content-Language: en-US, nl
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Yauhen Kharuzhy <jekhor@gmail.com>,
        platform-driver-x86@vger.kernel.org, linux-pwm@vger.kernel.org
References: <20230430165807.472798-1-hdegoede@redhat.com>
 <20230430165807.472798-11-hdegoede@redhat.com>
 <CAHp75VejjvfjLSsePfhRetEiWTE7ve=uZR87V9MZLET9KG6C1g@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VejjvfjLSsePfhRetEiWTE7ve=uZR87V9MZLET9KG6C1g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/1/23 11:53, Andy Shevchenko wrote:
> On Sun, Apr 30, 2023 at 7:58 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Split probe() and remove() into generic and WMI specific parts.
>>
>> This is a preparation patch for making lenovo-yogabook-wmi also work
>> on the Android version of the Yoga Book 1 which does not have a WMI
>> interface to deal with toggling the keyboard half between
>> touch-keyboard and wacom-digitizer mode.
> 
> ...
> 
>> Changes in v2:
>> - Use "return dev_err_probe(...);" in several places to simplify
>>   error-exits in the new yogabook_probe() function
> 
> I'm not sure you have changed previous patches where it makes sense to
> use dev_err_probe().

Actually the 2 cases you point out below are the 2 last regular dev_err()
calls in the probe() path of the driver.

> Neither it's done (in full) here (in case you
> wanted to split replacement to a separate change). See below.
> 
> ...
> 
>> +       data->kbd_adev = acpi_dev_get_first_match_dev("GDIX1001", NULL, -1);
>> +       if (!data->kbd_adev) {
>> +               dev_err(dev, "Cannot find the touchpad device in ACPI tables\n");
>> +               return -ENODEV;
> 
> Here...
> 
>> +       }
>> +
>> +       data->dig_adev = acpi_dev_get_first_match_dev("WCOM0019", NULL, -1);
>> +       if (!data->dig_adev) {
>> +               dev_err(dev, "Cannot find the digitizer device in ACPI tables\n");
>> +               r = -ENODEV;
> 
> ...and here.

Ack I've fixed these both up while merging this series.

Regards,

Hans


