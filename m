Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABE5AC4332F
	for <platform-driver-x86@archiver.kernel.org>; Mon, 21 Nov 2022 10:09:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230034AbiKUKJv (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 21 Nov 2022 05:09:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231131AbiKUKJr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 21 Nov 2022 05:09:47 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89A0EE0F5
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Nov 2022 02:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669025302;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0HvKPc+ay8M4Vl556wnCm14qv6ZSMG6yNu+WHGXfdgk=;
        b=cnOzlF28rREGb5+TPImrJWxf13cJ4ZwF5sL7HJE0ZSnPekifWltOsyETxz+WmO+LqvDm3L
        XCU+zhcRGK3tinGN/cy++vJnJEatOKGlN324KRGXGnj8z3IkJNfKAskYfkV3P0EVW7+v5n
        5yzJH7zWBZPhz+8m5TYDvTE2gZma4pU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-172-a0R_g2YQPs2X8FlGiTcHkQ-1; Mon, 21 Nov 2022 05:08:21 -0500
X-MC-Unique: a0R_g2YQPs2X8FlGiTcHkQ-1
Received: by mail-ej1-f71.google.com with SMTP id nb1-20020a1709071c8100b007ae4083d6f5so6320635ejc.15
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Nov 2022 02:08:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0HvKPc+ay8M4Vl556wnCm14qv6ZSMG6yNu+WHGXfdgk=;
        b=zgDDckve16MV5jyxQ9VdrGsZg0Hh5SlBVr4fRLbtN7eskDg8xkhZ3+bqDIktBzqQQQ
         /loI7g8qv8Aiw9X6Z4asO3FH+aDuc5xU5LpzlJL9seoIg/s2pjptzWfsMqQszhWD//4s
         ch+IXYM9V28B+FpLjL6LblbPjZ+PTW6z5hcJLQtfbhrkESJG5KYLN16jM5apOJzKTTlm
         Uzgi/1/hoxmfeoDtMlqHs2vhQQ3UMzwOPA9fAl+rWzpvrbOIOCQzSVhmgfvIM9QiamMR
         Uu6mmejhroC2oGCDniKBy28a17rN78lAxO2G6gzqHs+/0Who3++QbcsvreH67k+eKU4u
         j5pA==
X-Gm-Message-State: ANoB5pnyPtwIIiskWLfVUs+vgLBRxug7tjAZuusvEdUi7qDKZ2XJ+nVC
        zuWyNxUhpBotPaOox08QEMYPqN2cgEHGdERcWT0tF4H1oHhQaXmKzO1ZuKJOJpvOa0/FAZH/ghE
        OkrcFOCSnJOHvnwXZfQ93Nq9qDcfbVt4OUQ==
X-Received: by 2002:a17:906:edbd:b0:783:5326:90e5 with SMTP id sa29-20020a170906edbd00b00783532690e5mr14505264ejb.374.1669025300213;
        Mon, 21 Nov 2022 02:08:20 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5TsIeiNG3vbRVgn0V72i8/Qdn0mf5CjJ/XpNZcX6GHccfW23yvRjqB4ED0CR1lmo7LXj0pyQ==
X-Received: by 2002:a17:906:edbd:b0:783:5326:90e5 with SMTP id sa29-20020a170906edbd00b00783532690e5mr14505258ejb.374.1669025300028;
        Mon, 21 Nov 2022 02:08:20 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id d7-20020a170906304700b007b29d292852sm2033409ejd.148.2022.11.21.02.08.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 02:08:19 -0800 (PST)
Message-ID: <c44a9297-47ef-99da-9fbf-553e103985e7@redhat.com>
Date:   Mon, 21 Nov 2022 11:08:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 0/6] platform/x86: ideapad-laptop: Rework touchpad
 control code
Content-Language: en-US
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>,
        Kai Heng Feng <kai.heng.feng@canonical.com>,
        Maxim Mikityanskiy <maxtram95@gmail.com>,
        GOESSEL Guillaume <g_goessel@outlook.com>,
        Manyi Li <limanyi@uniontech.com>,
        =?UTF-8?Q?Eray_Or=c3=a7unus?= <erayorcunus@gmail.com>,
        Philipp Jungkamp <p.jungkamp@gmx.net>,
        Arnav Rawat <arnavr3@illinois.edu>,
        Kelly Anderson <kelly@xilka.com>, Meng Dong <whenov@gmail.com>,
        Felix Eckhofer <felix@eckhofer.com>,
        Ike Panhc <ike.pan@canonical.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
References: <20221117110244.67811-1-hdegoede@redhat.com>
 <4738204e-303a-4280-9644-1d5f69155637@app.fastmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <4738204e-303a-4280-9644-1d5f69155637@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Jiaxun,

On 11/17/22 19:26, Jiaxun Yang wrote:
> 
> 
> 在2022年11月17日十一月 上午11:02，Hans de Goede写道：
>> Hi All,
>>
>> Here is v2 of my series to rework the ideapad-laptop touchpad control code.
>>
>> New in v2:
>> - Split patch 3/3 in to 3 patches (3-5/6) since it was doing to much at once
>>   - Update r_touchpad_val on sysfs read/writes
>>   - Drop the write(VPCCMD_W_TOUCHPAD, 1) call at probe in a separate patch
>>     and document why this is done in the commit msg
>> - Add a new patch (6/6) to hide the touchpad sysfs attribute behind a
>>   module-parameter which is disabled by default, see the commit message
>>   for why this is done.
>>
> 
> For the whole series:
> Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Tested-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> 
> Can confirm this approach works fine on my problematic ideaPad Yoga 14s.

Thank you for the review and for testing!

I will go and add this series to my review-hans branch now and from there
it will move to for-next once the builders have done a test-build of it.

Regards,

Hans

