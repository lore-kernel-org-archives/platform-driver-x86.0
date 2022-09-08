Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB5BEC38145
	for <platform-driver-x86@archiver.kernel.org>; Thu,  8 Sep 2022 09:09:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230285AbiIHJJG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 8 Sep 2022 05:09:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231681AbiIHJI7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 8 Sep 2022 05:08:59 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0DE8F7573
        for <platform-driver-x86@vger.kernel.org>; Thu,  8 Sep 2022 02:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662628138;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/krVfjUcXPqxA6kVZaVoncTlCalwWv86HVLAzmQ2k5g=;
        b=L1NrmBiLD+ify6xg+TAnH5f5fojgX1M3X9FiCkokmQWbds3XsLV6wbO9GEtygY9JhzPTT8
        J2uwDideOEDRb+Fz9EzV30VH/8bwvQ6zs8jMXwafHlmfVDo924+93Xo7lJkjSmghwx0Vwo
        oH3ko+LvSxEyWILnpqn7abDLcj2kkC0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-675-3KknCyMQNIaohwt2sQk0Bw-1; Thu, 08 Sep 2022 05:08:56 -0400
X-MC-Unique: 3KknCyMQNIaohwt2sQk0Bw-1
Received: by mail-ed1-f70.google.com with SMTP id m15-20020a056402430f00b00448af09b674so10966653edc.13
        for <platform-driver-x86@vger.kernel.org>; Thu, 08 Sep 2022 02:08:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=/krVfjUcXPqxA6kVZaVoncTlCalwWv86HVLAzmQ2k5g=;
        b=YCY94IOdzcZ+W+4+dg7k9vgzf62TOyiYhoqUnfcnhEMrUPaBrh0jGd1Gm0EvVu/aSW
         EaRq9bfpODqBr8Zm+349Ri1OvpdbN0Dj9W0yPSTCJ/V/mxpp8jCb/bDicla+KLDaY494
         dYMZf7b9BSdXbx9CN7rlPXs80n4UKygmNQnRnaHYbRF9dpn/lV9Lcz1bilAzlHKYdxQ3
         SJBq87Gt35w9DFVgg+49lZHQ4kRIftyAOnTqT4Li3fGl542YOOjQnEpg7vE9gUm+j6Hs
         16t8ND7/yDKSdKqKECRHd5jtQscsCyuQzoYGlaFUy5UBA9NAcJ80oEsyA/fkfGlEwrRV
         mnMA==
X-Gm-Message-State: ACgBeo2eoAsUoEq03lyFAx4UQTEjTdBcoj7PxKLcc5BwGHt7RF4dvnYa
        NnjdIo2gf7RmXwUM0OxWRRYZ6o5hh6yxOS77PIza0dvx+jfHphf43qVjXA3IwQ1ah2np9F3nu3h
        ZCcVqvQeXfisezJT/3xTmbswyZIOOCLtWNQ==
X-Received: by 2002:a17:907:72cc:b0:73d:d482:647e with SMTP id du12-20020a17090772cc00b0073dd482647emr5306275ejc.348.1662628135878;
        Thu, 08 Sep 2022 02:08:55 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5yJ1YkpPN+R864nSxa6fad35o3VTwStfREOOJAuAhVs/YDbTvl5WuXn2wI0dEv5Tswezj7xw==
X-Received: by 2002:a17:907:72cc:b0:73d:d482:647e with SMTP id du12-20020a17090772cc00b0073dd482647emr5306263ejc.348.1662628135699;
        Thu, 08 Sep 2022 02:08:55 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id c14-20020a17090603ce00b0073022b796a7sm995260eja.93.2022.09.08.02.08.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 02:08:55 -0700 (PDT)
Message-ID: <f7c02f07-f8f1-6fa8-4e88-0b4c651e4795@redhat.com>
Date:   Thu, 8 Sep 2022 11:08:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 0/4] platform/x86/amd/pmf: Introduce CnQF feature for AMD
 PMF
Content-Language: en-US
To:     Bastien Nocera <bnocera@redhat.com>
Cc:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org,
        platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20220823102913.4181217-1-Shyam-sundar.S-k@amd.com>
 <6ab21af2-e1c6-f76e-9bee-74e21f019be5@redhat.com>
 <CAKEBQogpK-Kgrgc=gb20w07XnsU7ASVjm4XHWMG=rhD0yQLUKw@mail.gmail.com>
 <a528cbe2-847b-9b15-5123-536900e0d943@redhat.com>
 <CAKEBQoiuDA1DM4Y_EMRNpRmisCc6KAa2akwxSpbKDrDDnrB71Q@mail.gmail.com>
 <a5ac5eb7-6a8e-aafd-10ca-b3049a7a74f4@amd.com>
 <CAKEBQohHJcxgRr4rMcdDMyi1cgBebcbeVcQu7qfAPuNK5E4t=Q@mail.gmail.com>
 <b29956c0-6b72-a8a4-ccca-0bad7b07c041@redhat.com>
 <CAKEBQojBveLyF7fe=Bv6WAwog6cwtWsyCdwqC5mpqnL4w1aB8A@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAKEBQojBveLyF7fe=Bv6WAwog6cwtWsyCdwqC5mpqnL4w1aB8A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/7/22 17:35, Bastien Nocera wrote:
> On Wed, 7 Sept 2022 at 16:35, Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi Bastien,
>>
>> On 9/7/22 16:24, Bastien Nocera wrote:
>>> Hey Shyam,
>>>
>>> I misunderstood that CnQF was a single setting, but it looks like it
>>> has 4 different levels, right?
>>> Unless there's a major malfunction, I don't think that offering to
>>> switch between 2 different policies where the difference is how
>>> "static" the performance boosts are is very useful, or comprehensible,
>>> to end-users.
>>>
>>> If CnQF only has a single "on" setting, then this could replace the
>>> balanced mode for what you call "static slider", so the end-user can
>>> still make a choice and have agency on whether the system tries to
>>> save power, or increase performance.
>>>
>>> If CnQF has multiple levels (Turbo, Performance, Balanced and Quiet,
>>> right?), then I don't think it's useful to have a sysfs setting to
>>> switch it at runtime, which only confuses user-space and the users.
>>> BIOS setting and/or kernel command-line option are the way to go.
>>>
>>> Did I understand this correctly?
>>
>> Let me try clarify things:
>>
>> CnQF has 4 levels internally, between which it switches automatically
>> based on the workload of the last 5 minutes.
> 
> Oh, those profiles are internal only, OK. Do those automated levels
> behave like the "static slider" ones, to the point of being
> indistinguishable? So for example, does the static slider
> "performance" behave like "CnQF" if the machine was heavily loaded
> machine for 5 minutes?

This is more of a question for AMD to answer. But yes I believe that
the CnQF internal performance mode which it boosts to if the machine
is heavily loaded for 5 minutes is similar to the static slider
performance setting.

Regards,

Hans

