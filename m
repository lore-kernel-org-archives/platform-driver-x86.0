Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C470C433ED
	for <platform-driver-x86@archiver.kernel.org>; Sat, 10 Apr 2021 14:23:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DC8BD61041
	for <platform-driver-x86@archiver.kernel.org>; Sat, 10 Apr 2021 14:23:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235021AbhDJOXR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 10 Apr 2021 10:23:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50707 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235012AbhDJOVn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 10 Apr 2021 10:21:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1618064485;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=E20j8QF6n5g5Vv33/KXs7vN5ylgikj8Bfrf7cJBagL0=;
        b=dCj7j025w+TcCFTnLvs/6CWFPo6RNd5wAeLbk0POutavNgfw20IgB/FAFNBQ/iOfJFBdSI
        nmBA5KbeY//dpXX5aZDh9R2iS6uizlCsUtxiwE/zVJ4S9zYIsmyhMV7297dYmkuly0/l1D
        Vmj4T9AnuHP8n29XxCEqYIO8dSKox1A=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-Z10uAzORONylPNMrgtcTKg-1; Sat, 10 Apr 2021 10:21:23 -0400
X-MC-Unique: Z10uAzORONylPNMrgtcTKg-1
Received: by mail-ed1-f70.google.com with SMTP id b8so683670ede.5
        for <platform-driver-x86@vger.kernel.org>; Sat, 10 Apr 2021 07:21:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=E20j8QF6n5g5Vv33/KXs7vN5ylgikj8Bfrf7cJBagL0=;
        b=V0ocicoKo9Lcka/IpjmzSqE/lDZlfup/m/Sqc4d0Mk51jcdJflfJ26MEdnkCcfOMyr
         cT55+LHETeJomjw+X0zqiINJnZUfN/TgM4uth8FLaGFjNBGW0qf3kKD+HZdkLettXHQn
         T8Y/gcr/BUDTpKt7igMrMiU7xN5n9Oeo9iwjtN8Dz8zevUw1kqdP4N+EsjhIGrCYn6N5
         lbgO8BG1holBPZ5XEj88rdk5KOzRIb1JGwYIArjnN4SgHeHZeTqYrJuDJ2u+hvJCEQ7p
         ho8Q+s+GoEcMS1fLGsM7nG5CQwwmaDmG7Ij4dBrn8f04kaXxyYZlzTHyfRO+ABQNC4KE
         RcRw==
X-Gm-Message-State: AOAM533bQ+EjcFKV1ON47+vRU027EKaOySZgEUjjtUagylMrYNBm866B
        ziQJw1rE7LTwCfvz2pry5zVYBZ4D6suokpbGULE6bcWxFloPGxYW0I/HcSqFsrXvxkvc6sAL3yJ
        F61CZ1AMXm2JacnY8vEylEwhLRVHGPsPXSQ==
X-Received: by 2002:a05:6402:2787:: with SMTP id b7mr21921401ede.225.1618064482358;
        Sat, 10 Apr 2021 07:21:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzTXRXJxAQ/x4YsQ+C4zTq84sRYMeMG1jXfDX4hnjgUCgJtnjYoxFte43NiBAQu8e8Sctf/1Q==
X-Received: by 2002:a05:6402:2787:: with SMTP id b7mr21921379ede.225.1618064482106;
        Sat, 10 Apr 2021 07:21:22 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id r25sm3195315edv.78.2021.04.10.07.21.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Apr 2021 07:21:21 -0700 (PDT)
Subject: Re: [PATCH v2] platform/x86: add Gigabyte WMI temperature driver
To:     Guenter Roeck <linux@roeck-us.net>,
        =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <linux@weissschuh.net>
Cc:     Jean Delvare <jdelvare@suse.com>,
        platform-driver-x86@vger.kernel.org,
        Mark Gross <mgross@linux.intel.com>,
        linux-kernel@vger.kernel.org,
        =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>,
        Matthew Garrett <mjg59@srcf.ucam.org>
References: <N6sOrC__lJeA1mtEKUtB18DPy9hp5bSjL9rq1TfOXiRE7IAO5aih5oyPEpq-vyqdZZsF4W8FIe-9GWB15lO-3fQlqjWQrMTlTJvqLBBGYOQ=@protonmail.com>
 <20210405204810.339763-1-linux@weissschuh.net>
 <44fbb57c-88ee-62f0-c72c-507cad17eb7d@redhat.com>
 <123d021b-b86b-4356-b234-fb46fa260193@t-8ch.de>
 <6993d257-fdc1-2be6-555d-86c6b8c9d18d@redhat.com>
 <d6cc98f4-1be2-f8bf-0426-58e324fc495b@roeck-us.net>
 <c55b1f8e-24b9-4574-8668-aed64832242b@t-8ch.de>
 <b236c75e-43c0-e56d-aed7-153fdc11729c@roeck-us.net>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <117cadef-c1cb-d66a-15f8-ce50d596be4b@redhat.com>
Date:   Sat, 10 Apr 2021 16:21:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <b236c75e-43c0-e56d-aed7-153fdc11729c@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/10/21 8:56 AM, Guenter Roeck wrote:
> On 4/8/21 11:02 PM, Thomas Weißschuh wrote:
>> On Do, 2021-04-08T08:00-0700, Guenter Roeck wrote:
>>> On 4/8/21 2:36 AM, Hans de Goede wrote:
>>>> On 4/7/21 9:43 PM, Thomas Weißschuh wrote:
>>>>> On Mi, 2021-04-07T17:54+0200, Hans de Goede wrote:
>>>> Jean, Guenter,
>>>>
>>>> Thomas has been working on a WMI driver to expose various motherboard
>>>> temperatures on a gigabyte board where the IO-addresses for the it87 chip
>>>> are reserved by ACPI. We are discussing how best to deal with this, there
>>>> are some ACPI methods to directly access the super-IO registers (with locking
>>>> to protect against other ACPI accesses). This reminded me of an idea I had
>>>> a while ago to solve a similar issue with an other superIO chip, abstract
>>>> the superIO register access-es using some reg_ops struct and allow an ACPI/WMI
>>>> driver to provide alternative reg_ops:
>>>> https://bugzilla.kernel.org/show_bug.cgi?id=204807#c47
>>>>
>>>> Do you think this is a good idea (or a bad one)? And would something like that
>>>> be acceptable to you ?
>>>>
>>>
>>> The upstream it87 driver is severely out of date. I had an out-of-tree driver
>>> with various improvements which I didn't upstream, first because no one was willing
>>> to review changes and then because it had deviated too much. I pulled it from
>>> public view because I got pounded for not upstreaming it, because people started
>>> demanding support (not asking, demanding) for it, and because Gigabyte stopped
>>> providing datasheets for the more recent ITE chips and it became effectively
>>> unmaintainable.
>>>
>>> Some ITE chips have issues which can cause system hangs if accessed directly.
>>> I put some work to remedy that into the non-upstream driver, but that was all
>>> just guesswork. Gigabyte knows about the problem (or so I was told from someone
>>> who has an NDA with them), but I didn't get them or ITE to even acknowledge it
>>> to me. I even had a support case open with Gigabyte for a while, but all I could
>>> get out of them is that they don't support Linux and what I would have to reproduce
>>> the problem with Windows for them to provide assistance (even though, again,
>>> they knew about it).
>>>
>>> As for using ACPI locks or WMI to ensure that ACPI leaves the chip alone while
>>> the driver accesses chips directly: That is an option, but it has (at least)
>>> two problems.
>>>
>>> First, ACPI access methods are not well documented or standardized. I had tried
>>> to find useful means to do that some time ago, but I gave up because each board
>>> (even from the same vendor) handles locking and accesses differently. We would
>>> end up with lots of board specific code. Coincidentally, that was for ASUS boards
>>> and the nct6775 driver.
>>
>> At least for all the Gigabyte ACPI tables I have looked at all access is done
>> via two-byte "OperationRegion" over the Index/Data addresses, a "Field" with
>> two entries for these and an "IndexField" that is actually used to perform the
>> accesses.
>> As the IndexField is synchronized via "Lock" it should take a lock on the
>> OperationRegion itself.
>>
>> So I think we should be technically fine with validating these assumption and
>> then also taking locks on the OperationRegion.
>>
>> If it is reasonable to do so is another question.
>>
> You'd still have to validate this for each individual board unless you get
> confirmation from Gigabyte that the mechanism is consistent on their boards.
> Then you'd have to handle other vendors using it87 chips, and those are
> just as close-lipped as Gigabyte. Ultimately it would require acpi match
> tables to match the various boards and access methods. I had experimented
> with this this a long time ago but gave up on it after concluding that it was
> unmaintainable.
> 
>>> Second, access through ACPI is only one of the issues. Turns out there are two
>>> ITE chips on many of the Gigabyte boards nowadays, and the two chips talk to each
>>> other using I2C. My out-of-tree driver tried to remedy that by blocking those
>>> accesses while the driver used the chip, but, again, without Gigabyte / ITE
>>> support this was never a perfect solution, and there was always the risk that
>>> the board ended up hanging because that access was blocked for too long.
>>> Recent ITE chips solve that problem by providing memory mapped access to the
>>> chip registers, but that is only useful if one has a datasheet.
>>
>> Are both of these chips available at the two well-known registers 0x2e and
>> 0x4e?
>>
> 
> The ones I know of are, yes.
> 
> Oh, that reminds me, there is another bug. Here are my comments about that:
> 
> /*
>  * On various Gigabyte AM4 boards (AB350, AX370), the second Super-IO chip
>  * (IT8792E) needs to be in configuration mode before accessing the first
>  * due to a bug in IT8792E which otherwise results in LPC bus access errors.
>  * This needs to be done before accessing the first Super-IO chip since
>  * the second chip may have been accessed prior to loading this driver.
>  *
>  * The problem is also reported to affect IT8795E, which is used on X299 boards
>  * and has the same chip ID as IT8792E (0x8733). It also appears to affect
>  * systems with IT8790E, which is used on some Z97X-Gaming boards as well as
>  * Z87X-OC.
>  * DMI entries for those systems will be added as they become available and
>  * as the problem is confirmed to affect those boards.
>  */
> 
>> Would this too-long blocking also occur when only accessing single registers
>> for read-only access?
> 
> I don't know. Remember, zero support from Gigabyte / ITE.

So this all sounds like just using the WMI temperature functions as
v2 of this driver does, does sound best overall. Presumably those are also
used by Gigabyte's own Windows tool.

Although even there we have the issue of the interface possibly changing
from board to board. So even there I think we should start with a DMI
based allow-list approach for now; we can revisit this when we have a
better picture of things.

Regards,

Hans

