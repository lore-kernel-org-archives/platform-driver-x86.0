Return-Path: <SRS0=KVMw=EB=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75252C4363A
	for <platform-driver-x86@archiver.kernel.org>; Mon, 26 Oct 2020 15:44:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 19F5322400
	for <platform-driver-x86@archiver.kernel.org>; Mon, 26 Oct 2020 15:44:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DDeY1bGu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1784355AbgJZPn7 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 26 Oct 2020 11:43:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34686 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1784354AbgJZPn7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 26 Oct 2020 11:43:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603727037;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UkkSlBpzl8ZbgLanW23WOmGlofYpyc9dPTQMHVQx1zM=;
        b=DDeY1bGu2+vm44bdXeqKPredKB0POHTB+DNI2iWS73DvmuYuxAqw7hUG4LuXwE1Aj3psOG
        8TVYCrCnOrZKonfSMPyQ/7MrMtlIo2lkseAsM4zYfFvBNw6LyIMnH9ICkkI13t00JHAWJu
        jKlDPIeonG//Azr9MJYk0gEbVcQMZSk=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-DL1fBvblP2WkXkzLJFiAow-1; Mon, 26 Oct 2020 11:43:56 -0400
X-MC-Unique: DL1fBvblP2WkXkzLJFiAow-1
Received: by mail-ed1-f72.google.com with SMTP id j6so4613651edh.4
        for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2020 08:43:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UkkSlBpzl8ZbgLanW23WOmGlofYpyc9dPTQMHVQx1zM=;
        b=CjEgPe9NuVpJlv4OutqNu/5nA7mx23u6K3Xm7emoKmeYKsasys89wcV7KWnYUwCT+D
         IQ8tXDIcLnx/Xd881ez5kV9VlY9FeKoG4y6iHkB0wpprpZX5ACg5HDl61sYZ0LEwrx8D
         tBRX3xxCPsI/Iv/Yw0y+YULKvEJryFDLMjD2f42VXG5DXZV2RCwIZV6l7z74AI2w6Qlh
         1f87XFJjQ/xpvKm+IjBpKuuJQGUmwz1r/KCfGD+4YCus/HtskaScSPi10EbbuS5pwsh5
         dhjf8u2v5HiGVRQcoJ+GCOYczL+lPHWOKT4iyYh6pFfqAPb885aDtWZ8azFiFqd0UFO0
         PAuw==
X-Gm-Message-State: AOAM530lcG82BMrFMYnJiBqqi/S1yFoh5WB4IIfLdcs+1GuRCc9bDym0
        LnulRGjVlh26uBy7tD9Cm8WxD502Gze80zNhbGfagZp7USj16OU1ClbVmcM2H6+KVEIsJ2JRh1e
        OcBNr1h9nLbeN+3QirpghCgtno7jDCLQEpg==
X-Received: by 2002:a17:906:383:: with SMTP id b3mr15930064eja.351.1603727034678;
        Mon, 26 Oct 2020 08:43:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIOML01mnCZuw1dS1rM8IZ95Joxj/x+lwVLD52oYIi3TYgc0ba/boLje3pOtEhpwdZUlxREw==
X-Received: by 2002:a17:906:383:: with SMTP id b3mr15930040eja.351.1603727034356;
        Mon, 26 Oct 2020 08:43:54 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id dn20sm5565621ejc.63.2020.10.26.08.43.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2020 08:43:53 -0700 (PDT)
Subject: Re: [PATCH 1/6] platform/x86: acer-wmi: Drop no-op set_quirks call
 from find_quirks
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mark Gross <mgross@linux.intel.com>, Lee Chun-Yi <jlee@suse.com>,
        Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
References: <20201019185628.264473-1-hdegoede@redhat.com>
 <CAHp75Vcrghf330j_6P5iSxcxJYa_LvDvN3OGBBJWFpUXBPMRJQ@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <1cb8c938-df6d-2c99-1160-27b389b1f198@redhat.com>
Date:   Mon, 26 Oct 2020 16:43:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <CAHp75Vcrghf330j_6P5iSxcxJYa_LvDvN3OGBBJWFpUXBPMRJQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/26/20 4:15 PM, Andy Shevchenko wrote:
> On Mon, Oct 19, 2020 at 9:56 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> set_quirks has a "if (!interface) return;" check at its beginning and
>> interface always is NULL when set_quirks is called from find_quirks,
>> so it is a no-op and we can drop it.
>>
>> This also allows dropping the "if (!interface) return;" from set_quirks
>> since set_quirks now always is called with interface != NULL.
> 
> Is there any cover letter for this?

Nope, in hindsight I should have probably added one. The intention was
to only write patch 6/6 the rest is all prep work / cleanups to make
patch 6/6 possible.

> In any case, LGTM, you may use my tag
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Thank you, I assume that applies to the entire series ?

> I'm not sure about ACPI_EXCEPTION() use, though.

That is the only way I could find to easily print a sensible
error message given an acpi status code return...

Regards,

Hans




> 
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/platform/x86/acer-wmi.c | 5 -----
>>  1 file changed, 5 deletions(-)
>>
>> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
>> index 49f4b73be513..db6167a10981 100644
>> --- a/drivers/platform/x86/acer-wmi.c
>> +++ b/drivers/platform/x86/acer-wmi.c
>> @@ -302,9 +302,6 @@ static struct quirk_entry *quirks;
>>
>>  static void __init set_quirks(void)
>>  {
>> -       if (!interface)
>> -               return;
>> -
>>         if (quirks->mailled)
>>                 interface->capability |= ACER_CAP_MAILLED;
>>
>> @@ -648,8 +645,6 @@ static void __init find_quirks(void)
>>
>>         if (quirks == NULL)
>>                 quirks = &quirk_unknown;
>> -
>> -       set_quirks();
>>  }
>>
>>  /*
>> --
>> 2.28.0
>>
> 
> 

