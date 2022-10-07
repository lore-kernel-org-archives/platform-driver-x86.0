Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8637C4332F
	for <platform-driver-x86@archiver.kernel.org>; Fri,  7 Oct 2022 11:22:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229525AbiJGLWM (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 7 Oct 2022 07:22:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229722AbiJGLWJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 7 Oct 2022 07:22:09 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E08FCCF872
        for <platform-driver-x86@vger.kernel.org>; Fri,  7 Oct 2022 04:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1665141725;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=//JPZdPANwhoFqf+OA/iOmWMDquIrTYtHlGibpx0n8k=;
        b=BQ9e07JbyQ0U7ONCWLbBhSNE3OUIEzU47ZtJIouJSeSJeGANSHElwcdzCaJr1iUKssUP1P
        xD3pKIHo2IRrDSKpUDzLNw3e8uWneDrvL404McFExspr2Q3tC3sOrEeE1yaYOTNOfrBtA+
        3tGn4JaWwFUH002pOivMR9hcsNgLy6Y=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-339-E63HGnZNMmOqrhQvfav_4A-1; Fri, 07 Oct 2022 07:22:03 -0400
X-MC-Unique: E63HGnZNMmOqrhQvfav_4A-1
Received: by mail-ej1-f69.google.com with SMTP id gb42-20020a170907962a00b0078d194624a9so2667927ejc.11
        for <platform-driver-x86@vger.kernel.org>; Fri, 07 Oct 2022 04:22:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=//JPZdPANwhoFqf+OA/iOmWMDquIrTYtHlGibpx0n8k=;
        b=vDeXxZxMIHyAZSIMpaXBWzjiqTL1nKmh38RFSxqPoUcjOtzxqprq2b+Q2IeHJitri/
         u+Bc7ESMtfFGPxYWze8G4zlD7BNWs3FhzRQJfZi/DWVL56ETTMWWjFducoZqAGGpQSm6
         7dDl/NBgJaJKORbOXwTq9lE2wSWuEg0lwe+jgNm6QxMR37bxb1kqS4paR844cIr5QRkQ
         IxdscrJL8JnnaxH0eGNdbZjPGByFdpVmHRs2Xg1u39SlWqJSGsmWOB2vAaOI5+Zo+fb0
         IvC/Wmh3WiU8O1bMmiV17IAd8yvUjUKt/0PA6wJNUyXZ435e/3j6BthZHG+lGZ7sews/
         awyQ==
X-Gm-Message-State: ACrzQf1pgsXISM2K+N5XhgwDG+JXy2Izcd7E5hkW5gC2jm/xVlCRC3iS
        qRDUzws38mmFQ8QbBlE1shStbOWYbEtOByfFxsti1gj8N4hWo3VvsgoKTaXtNRs30zfNNj18Bbr
        o0kwGZoZ6vAflEG/56Wq/SW/I2d6cwNJVZw==
X-Received: by 2002:a05:6402:3481:b0:459:50a9:5ab2 with SMTP id v1-20020a056402348100b0045950a95ab2mr3941994edc.279.1665141722174;
        Fri, 07 Oct 2022 04:22:02 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM50+AiXJ6ibuK0/Sc2THUANgDNoaszWIjxJaFpiIAJBaVmNIlYbhZKyHfBH5kYh4trNOyZfnw==
X-Received: by 2002:a05:6402:3481:b0:459:50a9:5ab2 with SMTP id v1-20020a056402348100b0045950a95ab2mr3941972edc.279.1665141721923;
        Fri, 07 Oct 2022 04:22:01 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id k8-20020a17090632c800b007030c97ae62sm1045282ejk.191.2022.10.07.04.22.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Oct 2022 04:22:01 -0700 (PDT)
Message-ID: <cbc43ef7-66b6-5b78-581f-d5e63e565f24@redhat.com>
Date:   Fri, 7 Oct 2022 13:22:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: Issue with toshiba fan sensors & missing feedback on patch
Content-Language: en-US, nl
To:     Arvid Norlander <lkml@vorpal.se>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>
References: <5c917c78-610b-96fa-8cf3-81f8d3dc505f@vorpal.se>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <5c917c78-610b-96fa-8cf3-81f8d3dc505f@vorpal.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Arvid,

On 10/6/22 23:12, Arvid Norlander wrote:
> Hi Hans,
> 
> Two things:
> * I have discovered that reading the fan RPM in toshiba_acpi is slow,
>   around 50 ms. I didn't notice it at first, but after adding some more
>   sensors I found (current and voltage for AC and battery) it started to
>   make running "sensors" visibly slow.
>   
>   I don't know what proper fix to this would be. Feel free to revert the
>   fan RPM for now if it is not acceptable for reading sensors to block for
>   ~50 ms (as opposed to the 100s of micro-seconds that other sensors such
>   as coretemp and acpitz take to read on that laptop).

Hmm, so apparently the single ACPI call this ends up making takes along time.

I wonder what happens with the CPU load if you cat the file from
a "while true; do cat /sys/class/hwmon/...; done" loop in the shell.

With some luck most of that 50 ms is sleeping, so we won't see say
25% load on a quad core CPU (so 100% load on 1 core) in "top".

Regardless we also want any desktop-environment sensor applets which
poll more then once/second to block on this all the time. What most hwmon
drivers with slow HW access do is update the readings once per second
and then return cached values for a second see e.g. :

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/hwmon/f71882fg.c

and then specifically the "bool valid;" and "unsigned long last_updated;	/* In jiffies */"
members of "struct f71882fg_data" and how those are used.

I believe that keeping the fan rpm reading, which IMHO is the most
useful one is fine when adding the caching; or alternatively you
can submit a revert.

As for the AC + bat voltage/current can those be / are those retreived
with the same tci_raw() call or do those require separate calls ?
And if they require separate calls do those calls also all take 50 ms?

The battery values should already be available in some form under
/sys/class/power_supply/BAT*  although you may only have the
multiplied value of the 2 there in the form of energy_now. 

And the AC values are nice to have but not super interesting,
so if they require another slow tci_raw() call then I'm not sure
if they are worth adding.

> * I never got any feedback from you on the cover letter of this patch
>   series: https://www.spinics.net/lists/platform-driver-x86/msg34818.html
> 
>   In a reply to the one of the patches in the series you alluded to that
>   you would write a reply to the cover letter as well. Instead you sent
>   the response to patch 1/2 twice.

Sorry besides the double reply to 1/2 I did send another reply to 1/2:

https://lore.kernel.org/platform-driver-x86/36cc9c55-bc8c-ed9e-3467-8be0aa450167@redhat.com/

Where I ended up answering the userspace API question (or at least I intended
to answer it there, that may not have been clear). Which is why I ended
up not reply-ing to the cover-letter. I will take another look at the
cover-letter and answer any other questions you may have asked there.

As for the userspace API question, see my linked reply above. To
summarize / clarify:

- I'm fine with the suggested wakeup_cause + button_id sysfs-attributes.
- For the wakeup_cause I would like to see the format be a standard
  kernel bool fmt as also used by module options. This mostly means
  using kstrtobool() in the store function
- As mentioned in my reply please add a Documentation file documenting
  both sysfs attributes

>  We are already halfway through the merge
>   window soon, so I would appreciate getting that feedback soon.

Generally speaking patches must be ready no later then around rc6 to
get merged into the next release. So to get this merged you have
about 7 weeks until 6.1-rc6 is released to get this ready and then
I'll merge it into my pdx86/for-next branch for the 6.2 cycle.

Anything feature work which is not ready around rc6 of the
previous cycle will not make the current cycle (instead it
gets delayed to the next cycle).

I will go and answer the cover-letter now, for real this time...

Regards,

Hans

