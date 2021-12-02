Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F6BBC433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu,  2 Dec 2021 09:11:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241341AbhLBJOV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 2 Dec 2021 04:14:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29516 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236286AbhLBJOV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Dec 2021 04:14:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1638436258;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pICo6C9T76aaYlZI36J7CawUJTw/wTJ+iQlvTZFXEEI=;
        b=AuiVZoeMKvPZLjFWwR00XEXhPs1qN9Ngz9mvfmbNkVvsVKubAwSBn1dlNkhpXKcpDbv9o7
        Jb7g+bMJx/13+qxxtYy25P6E+2ohNt+Uv2afd0c0tfOGuRN4DyBHHJQOYihMV/n5binAO4
        VpdTCGBGrQBNfS2RUY4J+NASCpgI8/k=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-138-hgBbk7shOAquqHAuIcgzHQ-1; Thu, 02 Dec 2021 04:10:57 -0500
X-MC-Unique: hgBbk7shOAquqHAuIcgzHQ-1
Received: by mail-ed1-f72.google.com with SMTP id c1-20020aa7c741000000b003e7bf1da4bcso22819429eds.21
        for <platform-driver-x86@vger.kernel.org>; Thu, 02 Dec 2021 01:10:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=pICo6C9T76aaYlZI36J7CawUJTw/wTJ+iQlvTZFXEEI=;
        b=13dKogVjcdWBJEok4SYGKLZDpCyVXKKVylvG0xldPRRfKUYuXon904iR++DHL/HG38
         Qll9woty+UT/OcuGL2U/+4zsgWfZdDilsTkMivUrHS88SVoqkBD85Iz2FO/vQ1Abbcwn
         RCerQ5O9KJZitmYvitU2gK2H4VM88te2jyK9RH+hK8vkyCzbmvm35d5eTJMxUWYJJfip
         a6gXQ4AGjIWFmfTHp8+h1911QJkpVbTd+uNkQWOsD21B0hevkH3gq12VoowwCh1MrgpD
         gBx6u9ln9nVPWkm8hDK3bckj2EztuKim6UzRMA3qCbO2OwvrsiHaGEmNEJVrywGq+s3n
         okIA==
X-Gm-Message-State: AOAM533AFBssWacCmjz6xWos5jM11ER0ki/cNMNBVOTrtJwMICAnhNYk
        FxR4MEhGOmec3gpvPrUAXm9IJqzAi/3LEcpEMxRX6Fbcgy0CRQshwhbrxgczNqadZJlhSfMkFsf
        4vFc+OfhkkYIPWzsDI1jxrYCwPdu9/6UIBA==
X-Received: by 2002:a17:907:9608:: with SMTP id gb8mr13969731ejc.301.1638436256696;
        Thu, 02 Dec 2021 01:10:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwVmgMKOBMpbv4iA3DbHO+OvJdAaQkwB+iT5xQmOIBEtIW48S++u5kUoSJ7BSR8Ir9Iv3hsNw==
X-Received: by 2002:a17:907:9608:: with SMTP id gb8mr13969708ejc.301.1638436256501;
        Thu, 02 Dec 2021 01:10:56 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id q7sm1656136edr.9.2021.12.02.01.10.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Dec 2021 01:10:56 -0800 (PST)
Message-ID: <d642a431-41f9-fef5-0c7f-c4cf133c945e@redhat.com>
Date:   Thu, 2 Dec 2021 10:10:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] x86/platform/uv: make const pointer dots a static const
 array
Content-Language: en-US
To:     Steve Wahl <steve.wahl@hpe.com>, Joe Perches <joe@perches.com>
Cc:     Colin Ian King <colin.i.king@googlemail.com>,
        Mike Travis <mike.travis@hpe.com>,
        Dimitri Sivanich <dimitri.sivanich@hpe.com>,
        Russ Anderson <russ.anderson@hpe.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H . Peter Anvin" <hpa@zytor.com>,
        platform-driver-x86@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211127170320.77963-1-colin.i.king@gmail.com>
 <YaZ8vtajDKUVDCne@swahl-home.5wahls.com>
 <c5a827c2b690aeadf7d633c29edaf4db23d94fdb.camel@perches.com>
 <YafrrfwAMzxrPvWU@swahl-home.5wahls.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YafrrfwAMzxrPvWU@swahl-home.5wahls.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 12/1/21 22:39, Steve Wahl wrote:
> On Tue, Nov 30, 2021 at 04:26:39PM -0800, Joe Perches wrote:
>> On Tue, 2021-11-30 at 13:34 -0600, Steve Wahl wrote:
>>> On Sat, Nov 27, 2021 at 05:03:20PM +0000, Colin Ian King wrote:
>>>> Don't populate the const array dots on the stack
>> []
>>> Examination of the disassembly shows that the compiler actually
>>> eliminates the creation of the pointer "dots" on the stack and just
>>> passes the address of the string constant to the printk function.
>>>
>>> So this change should not have any actual effect (I don't know where
>>> you got the "shrinks object code" from), and in my humble opinion
>>> makes the code less clear.
>>
>> Probably shrinks an allmodconfig where the symbols are referenced.
>> It probably doesn't do anything to a defconfig.
> 
> OK, I looked. Under allmodconfig, the new code is one byte smaller.
> 
> Defconfig doesn't include CONFIG_X86_UV and this file doesn't get
> compiled.
> 
> Using defconfig plus CONFIG_X86_UV and prerequisites, the new code is
> 24 bytes larger, probably because of alignment added.
> 
> allmodconfig:
> 
>    text	   data	    bss	    dec	    hex	filename
>   30827	  18358	   1472	  50657	   c5e1	uv_nmi.o
>   30828	  18358	   1472	  50658	   c5e2	uv_nmi.orig.o
> 
> default config + CONFIG_X86_UV:
> 
>    text	   data	    bss	    dec	    hex	filename
>    9918	    216	    160	  10294	   2836	uv_nmi.o
>    9894	    216	    160	  10270	   281e	uv_nmi.orig.o
> 
> So I still don't think this patch makes sense.

I agree, so I've dropped this patch from the queue.

Regards,

Hans

