Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76317C2B9F8
	for <platform-driver-x86@archiver.kernel.org>; Mon, 24 May 2021 15:28:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 55E90611CE
	for <platform-driver-x86@archiver.kernel.org>; Mon, 24 May 2021 15:28:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232860AbhEXP35 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 24 May 2021 11:29:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52430 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233364AbhEXP2w (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 24 May 2021 11:28:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621870044;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pt/de1Lgz8ygj8VZ99P7nbeMY04Wc9k2Ms4AzKs3C+E=;
        b=dFczS98/IDSUUPFrsPsez/C9RhKp/L8yf2ou8H3hbH9UhRH9n2SOR9B6I0Taqu2/T9dBco
        4MhhofLUzojDNJAysP3TII7Uf55BxuZ4rtSZxX+ga20AcMeeud5+CuHww4dcfMSeM9s2mW
        x+zIoWj6hxH3Ul2U8ZY7Sn081wcoGw8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-G1LaJ8pHNgiAaH0cesd7Ww-1; Mon, 24 May 2021 11:27:22 -0400
X-MC-Unique: G1LaJ8pHNgiAaH0cesd7Ww-1
Received: by mail-ej1-f72.google.com with SMTP id la2-20020a170906ad82b02903d4bcc8de3bso7706290ejb.4
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 May 2021 08:27:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pt/de1Lgz8ygj8VZ99P7nbeMY04Wc9k2Ms4AzKs3C+E=;
        b=k0wIiS+ouaGHkVbeCrMlj75mtTt3/hoaqMw0/CXYTxD2gXOl056fMkPy1b6kECO3FM
         H5jhnFJZqR9M86WY12RNKuK/pFv7LIH6FxCNRWA4r5sjFaisduPloE92YDQy2VUTFR40
         XuYZaah7/NQX0LHbabGxMvqCFfdHmg+T+SxBUGw4cokkeRLT9+02OkBmAkju6IiEtoVW
         8qgYAV/KsF9g7ulylFvtK3PkEf7fWWAV2hG13sgX/zbqOGOeX4dVxy3bT3UGtTiRQ+0d
         mEADNb+UBG+1v+7pC/L0mPMnMXnCB+SNJqo0MV+9a4SgDCXcoOZlpKq2h2bDmETcSWV9
         Dwaw==
X-Gm-Message-State: AOAM533uQz9mDZN4RRQaIf++ZasnDabldb8Pi72O4kJxZ1utZMMaFFrY
        RnW9Ba6P5eCtcpRAD8iKTyjjh+XqLw+ExfIbzxteRuotKB3pHF5qCdL7Wz50gG5trPSLcB1BIZS
        zuSE/7mu8pSkjoGv+Pxp2j9PMIK2WSnZdpQ==
X-Received: by 2002:a17:906:2b8c:: with SMTP id m12mr20368170ejg.358.1621870040917;
        Mon, 24 May 2021 08:27:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzi3OR8wQ75Ptni43vxQcrfeoUw86savuVqbATWaUArE3wjTskCPaqPucLRWD0xu09X3hZk0w==
X-Received: by 2002:a17:906:2b8c:: with SMTP id m12mr20368159ejg.358.1621870040669;
        Mon, 24 May 2021 08:27:20 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id p8sm4565697eds.95.2021.05.24.08.27.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 May 2021 08:27:19 -0700 (PDT)
Subject: Re: [External] Re: [PATCH v2 3/3] platform/x86: think-lmi: Add WMI
 interface support on Lenovo platforms
To:     "Ksr, Prasanth" <Prasanth.Ksr@dell.com>,
        Mark Pearson <markpearson@lenovo.com>
Cc:     "mgross@linux.intel.com" <mgross@linux.intel.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "Bharathi, Divya" <Divya.Bharathi@Dell.com>,
        Dell Client Kernel <Dell.Client.Kernel@dell.com>
References: <markpearson@lenovo.com>
 <20210509015708.112766-1-markpearson@lenovo.com>
 <20210509015708.112766-3-markpearson@lenovo.com>
 <bbd0f3c9-63c3-2fbb-7712-ecb3131a4c0a@redhat.com>
 <ac30f95e-8398-fb11-8c94-b50050a3f88f@lenovo.com>
 <1c21c3d3-7ff1-a7b2-86d0-245050426760@redhat.com>
 <c8b706bb-5397-758e-8ab8-1d75b2920054@lenovo.com>
 <971080ef-a9c2-6de9-c6e1-895e7c5903f2@redhat.com>
 <CO1PR19MB5078C56213656707579025AD82269@CO1PR19MB5078.namprd19.prod.outlook.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <b454148c-640e-f642-cd3d-17c71e573b95@redhat.com>
Date:   Mon, 24 May 2021 17:27:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CO1PR19MB5078C56213656707579025AD82269@CO1PR19MB5078.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/24/21 12:19 PM, Ksr, Prasanth wrote:
> Hi,
> 
>> -----Original Message-----
>> From: Hans de Goede <hdegoede@redhat.com>
>> Sent: Friday, May 21, 2021 10:25 PM
>> To: Mark Pearson
>> Cc: mgross@linux.intel.com; platform-driver-x86@vger.kernel.org; Bharathi,
>> Divya; Ksr, Prasanth; Dell Client Kernel
>> Subject: Re: [External] Re: [PATCH v2 3/3] platform/x86: think-lmi: Add WMI
>> interface support on Lenovo platforms
>>
>>
>> [EXTERNAL EMAIL]
>>
>> Hi,
>>
>> On 5/21/21 5:55 PM, Mark Pearson wrote:
>>
>> <snip>
>>
>>>>> I know it would make Dell and Lenovo operate differently (I can add
>>>>> that detail to the documentation) but it just feels like a nicer
>>>>> design.
>>>>
>>>> That works for me. Perhaps you can also do a (compile tested only)
>>>> RFC patch for the Dell code to do the same thing (replace the memset
>>>> 0 with the strscpy) to see if the Dell folks are ok with also doing
>>>> things this way ?
>>>>
>>> I'm not hugely comfortable with that. If for some reason it broke
>>> things for Dell customers I wouldn't want to be responsible :)
>>
>> Right, that is why I suggested making it a RFC patch and I would certainly not
>> apply that patch without it being tested by Dell first.
>>
>> The idea behind the patch is for it to be a way to get a discussion about this
>> started. In my experience patches tend to get more of a reaction then
>> hypothetical discussions about changes :)
>>
>>> I'd rather they
>>> made the changes and were able to test it - I know that's what I'd
>>> prefer if it was the other way around. Apologies if I'm being over cautious!
>>
>> If you don't feel comfortable doing this, that is fine, lets wait what the Dell
>> folks have to say; and if they don't respond I might do a RFC myself.
>>
> 
> Ack. We will implement the same from Dell side as well to have uniformity and
> seems nicer from a user point of view rather than populating the 
> current_password field again in case of password change scenario. 

Great, thank you.

Regards,

Hans

