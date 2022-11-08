Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2BCCC433FE
	for <platform-driver-x86@archiver.kernel.org>; Tue,  8 Nov 2022 15:10:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234240AbiKHPKx (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 8 Nov 2022 10:10:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234165AbiKHPKv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 8 Nov 2022 10:10:51 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BE1C17E3F
        for <platform-driver-x86@vger.kernel.org>; Tue,  8 Nov 2022 07:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667920188;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xx8DSoSqPeiCR+L6dCFIgvpc7UX9vd69Eqa8YxShRjs=;
        b=WheZyUqUYiN/TLpy4DG+dNNN8oWuruOuQmNkvwuqUyJRx/ytxRi3/0px4e7TUFue6xYkSq
        /ssFAZSd3Nyl6+BS8t1EVWV+5UDo6SfjzcnicCXoulgCkmR3rPt81RroP2GUtUK0zwgRit
        YJ6Bhwn1DSScu9+b81SWS+L9V0WcRYw=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-590-QschJAPMMoGKJ5Rh3Oueug-1; Tue, 08 Nov 2022 10:09:45 -0500
X-MC-Unique: QschJAPMMoGKJ5Rh3Oueug-1
Received: by mail-ej1-f70.google.com with SMTP id qa14-20020a170907868e00b007ae24f77742so7733994ejc.8
        for <platform-driver-x86@vger.kernel.org>; Tue, 08 Nov 2022 07:09:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xx8DSoSqPeiCR+L6dCFIgvpc7UX9vd69Eqa8YxShRjs=;
        b=YE4IgSQ7ONXqZ1CpdH4Crsg0zwebZsso1GstbrluIVpLqDvs3yeYcvbm1JNpT7x+gi
         f4PtfWElyJ+PCjPJzr4mWK5tElQkzq1On2KAqGj7v3lD9ItF7xAuSLwtGlwMvt/xn8bs
         ZIU7giwd66QWPKBaJJMJ9HPW2mR36MOBQ3HbummDKd3CSQlzsEmZQrbUklr3YD0+7HJE
         SLhh1HLFv3c7y0kT6XM0Sl3hcwx7jQdAumm0bsfE7BKHJaAAztRtHimlOThKIoWIqN4R
         aBNmQXH13rssn1OhuoPNQuzN5va/sfCysgQrJ872zzkEwhKyV26wEpTgGGyysYbCxE/W
         TLpA==
X-Gm-Message-State: ACrzQf0FLCMUfpN0wCWOzg1EFKPJaRIEWpXHPYq9zS4e5MMGcppJoeTS
        lKrDI3njXDpmyX2wNpmwmjL6Cs7kH/K8hH+zHQIMlGy8bZb03K7gGVG8PR3gu8rBgwJTkDkxdVa
        pwbRYCtU20qnifyTtfwWIgCAfY9rgZkf9Eg==
X-Received: by 2002:a17:907:60c8:b0:78d:bc56:8f04 with SMTP id hv8-20020a17090760c800b0078dbc568f04mr52467085ejc.560.1667920183969;
        Tue, 08 Nov 2022 07:09:43 -0800 (PST)
X-Google-Smtp-Source: AMsMyM685x1/pcWzxnBB1hF/ciAtR7cTKDpGouxFzRsiH4/aMHgXZ9Ocrs9lP363ydVQ66TeCiz8zw==
X-Received: by 2002:a17:907:60c8:b0:78d:bc56:8f04 with SMTP id hv8-20020a17090760c800b0078dbc568f04mr52467067ejc.560.1667920183754;
        Tue, 08 Nov 2022 07:09:43 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id ee2-20020a056402290200b004614fd33789sm5639349edb.18.2022.11.08.07.09.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 07:09:43 -0800 (PST)
Message-ID: <c5773d2f-da0d-ef73-694e-a7ae9d98610d@redhat.com>
Date:   Tue, 8 Nov 2022 16:09:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] platform/x86: ideapad-laptop: Fix fn-lock LED on Yoga
 14ITL5 laptops
Content-Language: en-US, nl
To:     Ike Panhc <ike.pan@canonical.com>,
        "Rawat, Arnav" <arnavr3@illinois.edu>,
        "markgross@kernel.org" <markgross@kernel.org>,
        Meng Dong <whenov@gmail.com>
Cc:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <4785687.31r3eYUQgx@fedora>
 <0bbca08c-6caf-e830-ca3d-105cf72015d5@canonical.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <0bbca08c-6caf-e830-ca3d-105cf72015d5@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/8/22 06:58, Ike Panhc wrote:
> On 11/8/22 07:25, Rawat, Arnav wrote:
>> From 5bce4f5860d54e125715d896f144add831d19483 Mon Sep 17 00:00:00 2001
>> From: Arnav Rawat <arnavr3@illinois.edu>
>> Date: Mon, 7 Nov 2022 17:12:41 -0600
>> Subject: [PATCH] platform/x86: ideapad-laptop: Fix fn-lock LED on Yoga 14ITL5
>>  laptops
>>
>> The commit 3ae86d2d4704796ee658a34245cb86e68c40c5d7: Fix Legion 5 Fnlock LED
>> set the WMI id for the fn-lock event on some Legion 5 laptops. However,
>> the same WMI ID is also sent on some Yoga laptops. Here, setting the fn-lock
>> state is not valid behavior, and causes the ec to spam interrupts until the
>> laptop is rebooted, so include a check for this line of laptops.
>>
>> Signed-off-by: Arnav Rawat <arnavr3@illinois.edu>
> 
> Thanks.
> 
> But I will be more comfortable if we also check DMI_BOARD_NAME or
> DMI_PRODUCT_VERSION, not just DMI_PRODUCT_NAME.
> 
> and it will be good to create a table like ideapad_dytc_v4_allow_table.
> I have a feeling that your ideapad is not the only one has this issue.

I agree IMHO it would be better to find out the DMI strings of the
laptop for which this fix was added and then only do the:

	exec_sals(priv->adev->handle, state ? SALS_FNLOCK_ON : SALS_FNLOCK_OFF);

call on that model. So move to an allow-list model, rather then using
a deny-list model.

Especially also since the behavior without the call is a LED not turning on,
which is something we can live with.

Where as the behavior when doing the call on the wrong model is an interrupt
storm which is a much bigger problem.

I have added Meng Dong the author of the patch adding the:

	exec_sals(priv->adev->handle, state ? SALS_FNLOCK_ON : SALS_FNLOCK_OFF);

call to the To list of this email.

The commit msg of 3ae86d2d4704796 ("platform/x86: ideapad-laptop: Fix Legion 5 Fn lock LED")

mentions this bug:

https://bugzilla.kernel.org/show_bug.cgi?id=212671

So we may want to ask the reporter to test any fixes we come up with here.

The commit msg says the fix was needed on a Legion 5 (R7000P)

I have found this dmidecode for this laptop model, which should
give us enough info to start a DMI based allow-list for this:

https://github.com/linuxhw/DMI/blob/master/Notebook/Lenovo/Legion/Legion%20R7000P2020H%2082GR/D5E3FD9569F2

Regards,

Hans



