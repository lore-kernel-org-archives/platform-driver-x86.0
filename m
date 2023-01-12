Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75A2DC54EBD
	for <platform-driver-x86@archiver.kernel.org>; Thu, 12 Jan 2023 16:32:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239173AbjALQcH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 12 Jan 2023 11:32:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235533AbjALQa5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 12 Jan 2023 11:30:57 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABEF460E5
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Jan 2023 08:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673540971;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=F8QFx6rD0tZGXtw+3YejuZrVA8epe8wgxFVyC2mwSi8=;
        b=OMOiOseY6AVyfYdwyeUXV7r512MgBHjUBrE9eh17rlqeql2RhuWv8XZg11Vv1yfY2toPSj
        qe0JmkHurbRhJ+2RVWEINfbX8NVK2AmjJH2h7U3c4GBUU3/5jfkK+43hbpo8iLX1gKtXf+
        A9+5AvI+GdMlcGUMieVNSbfdslyj5ag=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-596-nCm2hVrjM726XFbK2IEK_A-1; Thu, 12 Jan 2023 11:29:30 -0500
X-MC-Unique: nCm2hVrjM726XFbK2IEK_A-1
Received: by mail-ed1-f69.google.com with SMTP id z3-20020a05640235c300b0048ed61c1394so12669294edc.18
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Jan 2023 08:29:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F8QFx6rD0tZGXtw+3YejuZrVA8epe8wgxFVyC2mwSi8=;
        b=1RwSzdGvz881Ot+qEkqig+sWGeggclHUIXZtJsFb3uSvaCHmz2BGWlC/rWPhAGMWcN
         cpwWO2LbXHkrguXxK893cdlesTmNf1kDLqHeA+aWb8b7aXuFb+0pfsDeSnPJ91eDn8r9
         ZTd91bomKsEKpQ7ftDH8HSr42I6jP4b7mtSXHO5ZpLFLhb7B0H0jS5pERiI+bfaz/ANp
         pBrkMjyiMrcv55rvndZ19WRBN7cMeSp/uTlofhsDrTGoZIO9wXLo+BO55uawrZhnvQMA
         /q0BN3wXUN9/KZpsslagUb4GHeNDyWGGc0hjmu5yuGphJXi2yA6BrBoam2F3rwwn0ERH
         8HLQ==
X-Gm-Message-State: AFqh2kroCr1TizC+OJnkOoqnzYPQaJxaIriiZHNFijAoPX87WOkHRNT7
        /glVmqPLa9j6X4y1AodNwQfWbHqS4siIdXzuEIaITrHBI0EEL51jkjYpBFLIfm5yf5e9FUfxtti
        PGbZzngH4J/Pt2hP3dQQBsU98bWCwpO9/Qg==
X-Received: by 2002:a17:907:c388:b0:849:e96f:51f4 with SMTP id tm8-20020a170907c38800b00849e96f51f4mr58246913ejc.23.1673540969368;
        Thu, 12 Jan 2023 08:29:29 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvZSC1Wa4LCrtCOkbTupGR6XMS+zg5T5j2iCYuycXiuwzfyDJ+QcyOLUSpBxiiJ9X7ozf7E8Q==
X-Received: by 2002:a17:907:c388:b0:849:e96f:51f4 with SMTP id tm8-20020a170907c38800b00849e96f51f4mr58246900ejc.23.1673540969154;
        Thu, 12 Jan 2023 08:29:29 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id v27-20020a17090606db00b0081d2d9a0b45sm7545480ejb.186.2023.01.12.08.29.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 08:29:28 -0800 (PST)
Message-ID: <b642fb9c-5184-92ce-4406-96a5f9bbde29@redhat.com>
Date:   Thu, 12 Jan 2023 17:29:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] platform/x86: sony-laptop: Don't turn off 0x153 keyboard
 backlight during probe
Content-Language: en-US, nl
To:     Mattia Dongili <malattia@linux.it>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        platform-driver-x86@vger.kernel.org
References: <20221213122943.11123-1-hdegoede@redhat.com>
 <CANER=bYHYNSi3fTwqAt89n-6uS5dSV+o+6H4oD6doeSzgtoZoQ@mail.gmail.com>
 <f2cc7aaf-3a2d-f3f0-9a65-1a67ac780131@redhat.com>
 <CANER=bb5wxxvUJfGDZHquExeC1Q=k8HdUmPmb2HxmUwrsNMbRg@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CANER=bb5wxxvUJfGDZHquExeC1Q=k8HdUmPmb2HxmUwrsNMbRg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 12/14/22 10:49, Mattia Dongili wrote:
> On Wed, 14 Dec 2022 at 18:13, Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi Mattia,
>>
>> On 12/14/22 09:55, Mattia Dongili wrote:
>>> On Tue, 13 Dec 2022 at 21:29, Hans de Goede <hdegoede@redhat.com <mailto:hdegoede@redhat.com>> wrote:
>>>
>>>     The 0x153 version of the kbd backlight control SNC handle has no separate
>>>     address to probe if the backlight is there.
>>>
>>>     This turns the probe call into a set keyboard backlight call with a value
>>>     of 0 turning off the keyboard backlight.
>>>
>>>     Skip probing when there is no separate probe address to avoid this.
>>>
>>>     Link: https://bugzilla.redhat.com/show_bug.cgi?id=1583752 <https://bugzilla.redhat.com/show_bug.cgi?id=1583752>
>>>     Fixes: 800f20170dcf ("Keyboard backlight control for some Vaio Fit models")
>>>     Signed-off-by: Hans de Goede <hdegoede@redhat.com <mailto:hdegoede@redhat.com>>
>>>
>>>
>>> Signed-off-by: Mattia Dongili <malattia@linux.it <mailto:malattia@linux.it>>
>>>
>>>
>>>     ---
>>>      drivers/platform/x86/sony-laptop.c | 21 ++++++++++++++-------
>>>      1 file changed, 14 insertions(+), 7 deletions(-)
>>>
>>>     diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
>>>     index 765fcaba4d12..5ff5aaf92b56 100644
>>>     --- a/drivers/platform/x86/sony-laptop.c
>>>     +++ b/drivers/platform/x86/sony-laptop.c
>>>     @@ -1888,14 +1888,21 @@ static int sony_nc_kbd_backlight_setup(struct platform_device *pd,
>>>                     break;
>>>             }
>>>
>>>     -       ret = sony_call_snc_handle(handle, probe_base, &result);
>>>     -       if (ret)
>>>     -               return ret;
>>>     +       /*
>>>     +        * Only probe if there is a separate probe_base, otherwise the probe call
>>>     +        * is equivalent to __sony_nc_kbd_backlight_mode_set(0), resulting in
>>>     +        * the keyboard backlight being turned off.
>>>     +        */
>>>     +       if (probe_base) {
>>>     +               ret = sony_call_snc_handle(handle, probe_base, &result);
>>>     +               if (ret)
>>>     +                       return ret;
>>>
>>>     -       if ((handle == 0x0137 && !(result & 0x02)) ||
>>>     -                       !(result & 0x01)) {
>>>     -               dprintk("no backlight keyboard found\n");
>>>     -               return 0;
>>>     +               if ((handle == 0x0137 && !(result & 0x02)) ||
>>>     +                               !(result & 0x01)) {
>>>     +                       dprintk("no backlight keyboard found\n");
>>>     +                       return 0;
>>>     +               }
>>>             }
>>>
>>>             kbdbl_ctl = kzalloc(sizeof(*kbdbl_ctl), GFP_KERNEL);
>>>     --
>>>     2.38.1
>>>
>>> ---
>>>
>>> Aha, looking at the bug report and the commit that caused it I think this fix makes sense.
>>> You can add my sign-off too.
>>
>> I think you mean Reviewed-by? Singed-off-by: is only for patches passing
>> through you. E.g. it was send to you personally and you then submit it
>> to the list.
> 
> Sigh yeah... It's been too long.
> 
> Reviewed-by: Mattia Dongili <malattia@linux.it>

Thanks.

I've added this to my review-hans (soon to be for-next) branch now.

Regards,

Hans


