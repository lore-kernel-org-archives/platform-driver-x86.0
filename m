Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFD63C48BE5
	for <platform-driver-x86@archiver.kernel.org>; Mon, 21 Jun 2021 14:13:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A23626124B
	for <platform-driver-x86@archiver.kernel.org>; Mon, 21 Jun 2021 14:13:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229949AbhFUOPw (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 21 Jun 2021 10:15:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45617 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229765AbhFUOPw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 21 Jun 2021 10:15:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1624284818;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0PE2gLBRQDabx/JL/tEHXKjqfWmO1gtcvRiJkJUeodI=;
        b=brD9dDK06gAL+lHNsjkDq4aNM9EKaHw/nonTJCrxGXVwaPTotUcknVtVZQTb9f6olqIXR9
        SNPN8eqjrQWqLNxNweChAAmgeekITfHPkUP/9G1o7E1Uuwui2fP7rIILslqfvVklsUBcUX
        nn9tWCh3AHrIaNENaHwRUJqVo7E/evA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-z6vQELcHPMC_2tIObd5hFg-1; Mon, 21 Jun 2021 10:13:36 -0400
X-MC-Unique: z6vQELcHPMC_2tIObd5hFg-1
Received: by mail-ed1-f72.google.com with SMTP id g13-20020a056402090db02903935a4cb74fso7832279edz.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Jun 2021 07:13:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0PE2gLBRQDabx/JL/tEHXKjqfWmO1gtcvRiJkJUeodI=;
        b=UVFdKEmLeCgEak81DRuaMZTGhUheWMwr6mT10S8a0wrJo9/qSGZ424KaJxDJUx0cub
         9QR0sqYMAPAGYlHKA3lNIxA+3h+bfYljr9fEWuYZVEHCSzF0KCP5r4dvvN3Xij0Z/hiI
         43zr1grgS8EJIJRB2naEQVrQNcwN3Q4VQPVsrlaTjIfFviz7B50BajJ17+LyDN2jeZbL
         V1exBNqKeeiG+qUjXvpz/70HcaHLE/yxpCgqPbBTe9hm53iiD/jidqTBdmAQ+RPwmRXa
         PRYCcp7kPIVVYgfb0rrVLl9hsaR8kTIycjrWwAVnpOOvE1KmSyWCyEfZMaY4mJJlP+jc
         frJg==
X-Gm-Message-State: AOAM530xDPld7pR3dL1+tU+hIqHt79sYUIOpqK0FJXVl67UjIKpFsISi
        2khodf+/sR2IycVhV5DGaEFrVIWdsif6wG0POI3NrHRqORJvtsMoNHT+SAShS/p7XJtDwLLTBTa
        8xfaDyiFrtANhrRCcw9JNIbDz5JTzSXyyVNac3beEDJF9RcuJ4Ht/YC8ueb8QDtBx660GjKzaEU
        Lu80OEZOYa8A==
X-Received: by 2002:a05:6402:1e8e:: with SMTP id f14mr16833866edf.193.1624284815581;
        Mon, 21 Jun 2021 07:13:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwjTQbCX/KYQ6lds0ilECoKgw8ONK4Ghul1t4j1VcOFjocrryrAo6eij3WZEKXEwmKNZ9KUqw==
X-Received: by 2002:a05:6402:1e8e:: with SMTP id f14mr16833845edf.193.1624284815454;
        Mon, 21 Jun 2021 07:13:35 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id ck2sm1998069edb.72.2021.06.21.07.13.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jun 2021 07:13:35 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: think-lmi: Return EINVAL when kbdlang gets
 set to a 0 length string
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>,
        Mark Pearson <markpearson@lenovo.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
References: <20210621132354.57127-1-hdegoede@redhat.com>
 <CAHp75Veh-t0KO4To8gbZej1bifJbrc3ppxnLzun0BcbsOBqZnA@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <ca520d5f-0288-30ef-0191-96f890a2ba4c@redhat.com>
Date:   Mon, 21 Jun 2021 16:13:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAHp75Veh-t0KO4To8gbZej1bifJbrc3ppxnLzun0BcbsOBqZnA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/21/21 3:58 PM, Andy Shevchenko wrote:
> On Mon, Jun 21, 2021 at 4:24 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Commit 0ddcf3a6b442 ("platform/x86: think-lmi: Avoid potential read before
>> start of the buffer") moved the lengt == 0 up to before stripping the '\n'
> 
> length

Ack, will fix.

>> which typically gets added when users echo a value to a sysfs-attribute
>> from the shell.
>>
>> This avoids a potential buffer-underrun, but it also causes a behavioral
>> change, prior to this change "echo > kbdlang", iow writing just a single
>> '\n' would result in an EINVAL error, but after the change this gets
>> accepted setting kbdlang to an empty string.
> 
> And why is it a problem?

Because there are only a couple of valid string like "de", "fr", "es"
and "us". We don't know the exact set of valid strings for a certain
BIOS, but we do not for sure that an empty string is not valid.

Regards,

Hans

