Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BE99C4332F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Nov 2022 15:20:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232615AbiKPPUq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 16 Nov 2022 10:20:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229703AbiKPPUX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 16 Nov 2022 10:20:23 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AD6651C05
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Nov 2022 07:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668611956;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=l89qCrq1U9T8u97FIa2n3OAEqPVINdofzy80A7hMnhk=;
        b=XZneAiSUf0lafla2p9xmGjWyf1SSpS9lHaQX5cjc+vYh5GZ87+gjaUGGYaBwV8rtSUd9VJ
        thl6e3FioTvlfCA78JiOrtC4xxJgTmrpAvDbNhF7DzlAcv322YZ0sVJ1NwDWYJvoCGoapB
        0p8ExSAY58Y2Fkn4CIpyl4SmZbMaQa4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-642-n_2hCfetN5eThKzOxZwNUQ-1; Wed, 16 Nov 2022 10:19:13 -0500
X-MC-Unique: n_2hCfetN5eThKzOxZwNUQ-1
Received: by mail-ej1-f72.google.com with SMTP id qa14-20020a170907868e00b007ae24f77742so10065147ejc.8
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Nov 2022 07:19:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l89qCrq1U9T8u97FIa2n3OAEqPVINdofzy80A7hMnhk=;
        b=lCZQQ7pZ4MZIqrBadhCen8BW6MmJ/Fq7+QGIz/JAzEUE+j4KqloMs+p+rWHum+65v+
         780z0dG7P4Rs5wbl112qHJvY2Lq2ANc8MWqoTiyewJ9YjqqMs1mG7MgLP03b9Rd15rDB
         nrH7cHfZHjnIwar3yDWDd/Gv0fhvV1O+WJD7sgcQS4NhAfnd3CsKuG4pDUN2La7jWzAX
         Cb2UQxQU9/cwg7kI/KcSCX4w9ED9s05mu56Fl+JdB04sHuWww4agTB2qGrEh53tuKoeH
         x3l7ydY0agcD9pvWMOfvyfZAPJFkvhtMPgByxjbcOqM+CKWL/OL9KJtKf+VVThku1JZu
         /tug==
X-Gm-Message-State: ANoB5pmQhKD3/FtUhllhtHRZQqKzS9MjCXnc7lf6g9gGgqm8L2Zcm23F
        cOdYGW1P1ubbsXGpzRog0wYc4vO0ieHkkjjimEhl095fJCuweWsBS7cIiOgTazY1H4YfTPH24uZ
        8thvwOpALbZEhdurpWdoLKuJi8ImOb7zU8A==
X-Received: by 2002:aa7:d3c6:0:b0:463:c64e:bc75 with SMTP id o6-20020aa7d3c6000000b00463c64ebc75mr19689459edr.205.1668611951884;
        Wed, 16 Nov 2022 07:19:11 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4NiBNML+nPc2OzqnIu+EyVYzT5c142JzKq0xbJnu5Qvqmv7oQncE3BLXR1Rc68Js8pcxRrZg==
X-Received: by 2002:aa7:d3c6:0:b0:463:c64e:bc75 with SMTP id o6-20020aa7d3c6000000b00463c64ebc75mr19689442edr.205.1668611951675;
        Wed, 16 Nov 2022 07:19:11 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id ft31-20020a170907801f00b0078d9cd0d2d6sm7135860ejc.11.2022.11.16.07.19.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 07:19:11 -0800 (PST)
Message-ID: <51b68bf6-94d5-8ae3-6da4-58136d49c36e@redhat.com>
Date:   Wed, 16 Nov 2022 16:19:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: ideapad-laptop touchpad handling problems, request for help
Content-Language: en-US, nl
To:     Maxim Mikityanskiy <maxtram95@gmail.com>
Cc:     =?UTF-8?Q?Eray_Or=c3=a7unus?= <erayorcunus@gmail.com>,
        cleverline1mc@gmail.com, g_goessel@outlook.com,
        ike.pan@canonical.com, jiaxun.yang@flygoat.com,
        limanyi@uniontech.com, mjg59@srcf.ucam.org,
        platform-driver-x86@vger.kernel.org
References: <bc1202d1-d85d-4173-5979-237bb1ee9254@redhat.com>
 <CAKErNvqfH-C7xJU3F7ga68o3AK-_ae-K2ggKcUOp1iqtmdSYdw@mail.gmail.com>
 <20221110120022.35041-1-erayorcunus@gmail.com>
 <4bcf4e6b-ae2f-0e22-a291-7faa6731e6c7@redhat.com>
 <20221110164220.46640-1-erayorcunus@gmail.com>
 <CAKErNvo+fh6sXUOPj9sCucuzUOKybOUgBo5riCfLpCF_8t9_uA@mail.gmail.com>
 <20221110184709.52768-1-erayorcunus@gmail.com>
 <d86d9c20-6f5c-0de9-2c09-7667080dd65c@redhat.com>
 <CAKErNvquRV9M6CU2RTO7nj1X=vwnByomk7Xndg2eGLN4DBh4uw@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAKErNvquRV9M6CU2RTO7nj1X=vwnByomk7Xndg2eGLN4DBh4uw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/11/22 12:44, Maxim Mikityanskiy wrote:
> On Thu, 10 Nov 2022 at 21:18, Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi Eray,
>>
>> On 11/10/22 19:47, Eray Orçunus wrote:
>>> Hi,
>>>
>>> On 10 Nov 2022 at 21:09, Maxim Mikityanskiy <maxtram95@gmail.com>  wrote:
>>>> A small note on the DMI allow-list: I don't think Z570 is the only
>>>> laptop where EC fails to disable the touchpad. While I would like this
>>>> hack to affect as few laptops as possible, I would expect that other
>>>> similar models produced in the same time period suffer from the same
>>>> issue, and I don't think we have the full list of them.
>>>
>>> I just checked Z570 ACPI table, and this is what it does when it receives
>>> VPCCMD_R_TOUCHPAD:
>>>
>>>       VDAT = TPEN /* \_SB_.PCI0.LPCB.EC0_.TPEN */
>>>       If ((TPEN == One))
>>>       {
>>>           GL04 |= 0x02
>>>       }
>>>       Else
>>>       {
>>>           GL04 &= 0xFD
>>>       }
>>>
>>> VDAT is the data returned to user.
>>> So we can say that TPEN is the logical state of touchpad key, and GL04
>>> is state of touchpad LED or series of LEDs.
>>>
>>> VPCCMD_W_TOUCHPAD is nulled, it doesn't work.
>>>
>>> I also checked which DSDTs I have (13 DSDTs from 2008 to this year)
>>> contain TPEN, and turned out it was only S12, from 2009. It also had
>>> nulled VPCCMD_W_TOUCHPAD, and returns TPEN on VPCCMD_R_TOUCHPAD, except
>>> it doesn't have an LED or GL04.
>>>
>>> So, it's possible that we can only check if TPEN exists on ACPI table,
>>> instead of having a white-list.
>>
>> Hmm, lets keep that idea in case it turns out the allow-list based
>> approach turns out to cause issue/grow out of control. I would rather
>> not rely on ACPI variables having a specific name for something like
>> this, but you might be on to something.
> 
> Maybe also add a module parameter to force the i8042 workaround? This
> change is likely to break the touchpad toggle for some devices similar
> to Z570 (maybe Z580? Y580? idk), so people would at least have an
> option to force enable it using the module parameter, before the
> relevant entry gets added to the DMI table, the patch gets merged, and
> the kernel gets updated.

That is a good idea. I'm about to send out this as a proper patch-series
and I've added a module parameter to the version.

> Another note on the comments in patch 4:
> 
>         /*
>          * Some IdeaPads don't really turn off touchpad - they only
>          * switch the LED state. We (de)activate KBC AUX port to turn
>          * the touchpad on and off.
>          */
>                /*
>                 * On older models the EC controls the touchpad and toggles it
>                 * on/off itself, in this case we report KEY_TOUCHPAD_ON/_OFF.
>                 * If the EC did not toggle, report KEY_TOUCHPAD_TOGGLE.
>                 */
> 
> These two comments would sound confusing to me if I read them without
> having context on Ideapads. I mean this part where "EC controls the
> touchpad and toggles it itself", but at the same time these laptops
> "don't really turn off the touchpad". Could you rephrase it somehow,
> so that it would be clear that there are models where the EC cares
> about the touchpad because it toggles *either* the touchpad or at
> least its LED?

To me the comments are clear the code under the first comment
block starts with a "if (priv->features.ctrl_ps2_aux_port)" that
+ the comment to me makes it clear this is a workaround for
some models where the EC fails to turn off the touchpad itself.

Where as the second comment is just about which key-presses are
being reported and why. With that said suggestions / patches to
improve the comments are certainly welcome.

BTW did you ever try simply writing back the value returned from
VPCCMD_R_TOUCHPAD to VPCCMD_W_TOUCHPAD ?

Eray has been looking at what the Windows tools do and according
to Eray they always call VPCCMD_W_TOUCHPAD on touchpad toggle
events. So maybe just writing back the value is enough to actually
disable the touchpad ?

Regards,

Hans


