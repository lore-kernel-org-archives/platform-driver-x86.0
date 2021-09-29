Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 439BBC433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 29 Sep 2021 09:55:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2576C613D3
	for <platform-driver-x86@archiver.kernel.org>; Wed, 29 Sep 2021 09:55:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245171AbhI2J5h (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 29 Sep 2021 05:57:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56183 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S245211AbhI2J5g (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 29 Sep 2021 05:57:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1632909355;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RVQAnFI8ylXXisSBN43J8tIyC4Cp0ukVjcqgK/DHzrU=;
        b=SAl8MM8jcbJtdE9noyhdCcINenxuXGNa+q/MHGhRABuDmYzbM9a9h+CMK3QtIAwcEPg5CD
        vbQxGMoRcoC4CXYpc+H7CknaAVnNv7zzabeY+czFPN66Z6jB5e8V3aU3v9YnuYBm3+4TjI
        moAVF897oqd9lsCXb7XWKIKjtKjitaQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-aWmkt6ufNYeG-S6WKY1GBg-1; Wed, 29 Sep 2021 05:55:54 -0400
X-MC-Unique: aWmkt6ufNYeG-S6WKY1GBg-1
Received: by mail-ed1-f70.google.com with SMTP id e7-20020a50d4c7000000b003d871ecccd8so1801754edj.18
        for <platform-driver-x86@vger.kernel.org>; Wed, 29 Sep 2021 02:55:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RVQAnFI8ylXXisSBN43J8tIyC4Cp0ukVjcqgK/DHzrU=;
        b=4abxi7OvOXV11bJob4GlDY+RS924sOgqHxtSoAkRh+9vJIVQigiTqkpcH1qhdBAesT
         Pou0VUVvkkU6oz+GaGxcCIALqZst3shMlRiNgzVA5YpgIHTMHbkHtclE61SNBDPhyyFA
         wUY83zlQ9bzDTtHwnbic55YZJ02/dg4cqgW8kziYFmuHTRPmc+rE9dY/Jri12Tj/QyMm
         Z2rLKCqWVN2w3BrLjNMOvewImjkmFqsEhjbv/je9OV1Bf89S0s6ACjeH1Uml23hzqGhd
         iajBxcJ0PBbXiMvx0zhl+RPNgvgrqZV5Rf6GC2Vx6ttpIUA3ZxHLn+DZc4kMpNXl58JQ
         UN+g==
X-Gm-Message-State: AOAM530MZV9Yxk1lJKRsKG8u35c9gPfDE4auMmGaejIniDINNESPXhBP
        T3VvV1ZPRkwuFkUYUbgQ91KGLuiEe0P3KKcxvQ0jpQiUt08g+CnGEzsQOXnKdv/omdr47v1TWib
        K7TII2n9kxsUyuonIgLuAWD9vwFSXXkBSqA==
X-Received: by 2002:a05:6402:b5a:: with SMTP id bx26mr5539215edb.252.1632909352857;
        Wed, 29 Sep 2021 02:55:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyaXnLBC7cJra+6IITL8OhJcs9V8d4e4ufHnZRsEOLBxZtf3ioR1Y6nxwocicEtgEAXSgjWPw==
X-Received: by 2002:a05:6402:b5a:: with SMTP id bx26mr5539196edb.252.1632909352642;
        Wed, 29 Sep 2021 02:55:52 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id v4sm1151903edq.88.2021.09.29.02.55.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Sep 2021 02:55:52 -0700 (PDT)
Subject: Re: [PATCH 1/3] thinkpad_acpi: add support for force_discharge
To:     Thomas Koch <linrunner@gmx.net>,
        =?UTF-8?Q?Nicol=c3=b2_Piazzalunga?= <nicolopiazzalunga@gmail.com>,
        Mark Pearson <markpearson@lenovo.com>,
        platform-driver-x86@vger.kernel.org,
        Nitin Joshi1 <njoshi1@lenovo.com>,
        Sebastian Reichel <sre@kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        Benjamin Berg <bberg@redhat.com>
Cc:     jwrdegoede@fedoraproject.org, smclt30p@gmail.com
References: <c2504700-06e9-e7d8-80f7-de90b0b6dfb5@gmail.com>
 <06f65bb5-eca4-c1ba-a8c2-b44f8a94c699@redhat.com>
 <2ea2d9b7-4a15-6aea-1aff-4e1cb80a026f@lenovo.com>
 <ac508b49-7958-3afa-25cf-416d701034e3@gmail.com>
 <ba6698de-1700-fce9-6bca-12ee577ac09b@redhat.com>
 <943fa4fb-273a-0a36-4919-26c05ae4a534@gmx.net>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <0eeb17bd-59f7-075e-f789-3814cc9a0505@redhat.com>
Date:   Wed, 29 Sep 2021 11:55:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <943fa4fb-273a-0a36-4919-26c05ae4a534@gmx.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/29/21 7:47 AM, Thomas Koch wrote:
> Hi Hans,
> 
> On 27.09.21 17:12, Hans de Goede wrote:
>> Hi Nicolò,
>>
>> On 9/27/21 5:00 PM, Nicolò Piazzalunga wrote:
>>> Hi,
>>>
>>> On 9/27/21 3:59 PM, Mark Pearson wrote:
>>>> Do let me know if there are some important use cases for these so I can go back to the FW team and discuss supporting them properly.
>>>
>>> The important use cases are force discharge and inhibit charge.
>>> These at present are dealt with using tpacpi-bat, which relies on (out of tree) acpi_call.
>>> See also your previous reply.
>>
>> I can see how those can be useful in certain circumstances.
>>
>> I can also understand how Lenovo does not want these to be
>> available by default everywhere.
>>
>> I think a good compromise would be to add a bool module option
>> which defaults to false to enable these.
> 
> From the user perspective, I don't agree that this is a good
> compromise. Users simply want to recalibrate their battery.

But can't they already do this by just unplugging the AC and
then let the machine die ?

How is this different, does it somehow magically flicks on the
AC just before the battery deep-discharge protection kicks in
so no unsaved work is lost ?

I have never used this, but that seems unlikely.

Or is the advantage of this that the AC being present results in
no nagging low battery warnings as well as no auto-shutdown
near the end ?

If the advantage of this is indeed the no nagging + auto-shutdown
a better fix would be to do some userspace work to allow a
full, undisturbed, discharge while not on AC for calibration
purposes. That would also work on any vendor laptop, which would
be a big added bonus.

I do believe that Lenovo does want to support doing a calibration
cycle under Linux. This whole thread got resurfaced / revived by
Mark because of discussions with Lenovo about offering better
battery management options under Linux.

> Having to
> set the module option beforehand is an unnecessary hurdle imho.
> 
> Of course a module option again leads to support overhead in "user
> space". Then tlp-stat -b would have to inform the user that
> force_discharge is unfortunately not available, but he should try to set
> the module option. What would that be good for?
> 
> While I respect Mark's official opinion, I would like to counter with my
> experience from 10 years of TLP development and support:
> 
> The calls for force_discharge work unmodified since the 2012 ThinkPads
> (T420/X220) on all models that also support charge thresholds.
> 
> They also work reliably, otherwise the issue tracker at tpacpi-bat and
> TLP would be full of user issues.
> 
> inhibit_charge is probably used rather rarely, at least no TLP user has
> asked for it.

Ok, so I think we should look at the end goal here, which is doing
a battery calibration run, which AFAIK means discharging until
the machine turns off (by itself rather then an emergency shutdown
by the OS), followed by charging to 100%/full in one go.

So as mentioned before if we can disable the emergency shutdown
then we should be able to do this on all vendor laptops.

But I guess the real question here is, what do the Lenovo tools
under Windows do?

Mark, I assume that the Lenovo battery management tool under Windows
does allow doing a calibration, can you figure out how this works?

Maybe that does actually use force_disharge and things got mixed up
when you asked the firmware team about all 3 features in one email,
and the other 2 are only for testing purposes?

> @Mark: what is Lenovo's position on the calls for charge thresholds
> already included in thinkpad_acpi? Are they also internal?

I'm not Mark, but I believe that these are officially supported,
as mentioned before Lenovo does want to offer better battery management
options under Linux.

Regards,

Hans

