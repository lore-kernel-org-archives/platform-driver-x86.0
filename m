Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DA4BC5519F
	for <platform-driver-x86@archiver.kernel.org>; Fri, 27 Nov 2020 18:06:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C2ADA20853
	for <platform-driver-x86@archiver.kernel.org>; Fri, 27 Nov 2020 18:06:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eGxlUsea"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732369AbgK0SGU (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 27 Nov 2020 13:06:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33288 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732332AbgK0SGT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 27 Nov 2020 13:06:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606500377;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ebGUnf+D+tjWZN898crtikDbD2Vzc37yJxhrZ6b2A1w=;
        b=eGxlUsea+RbwCaxE4EFUQllXk5kS39uk3SPAShzvq1kSPKL6LAT6ofengGaFI99fO79cfN
        7UwMbbLt5cUy7/Jxg8FwBnNYAvDM2QJeX6RWmXrXPjTdWb/WF/eCfjdwfj3he5GEBePfqc
        dkBaAvfBN5urplrxhYMiG9NzvnPlLm4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-vrfyQHcaMrOO3Ei8s1Wqlw-1; Fri, 27 Nov 2020 13:06:16 -0500
X-MC-Unique: vrfyQHcaMrOO3Ei8s1Wqlw-1
Received: by mail-ed1-f71.google.com with SMTP id n25so2697545edr.20
        for <platform-driver-x86@vger.kernel.org>; Fri, 27 Nov 2020 10:06:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ebGUnf+D+tjWZN898crtikDbD2Vzc37yJxhrZ6b2A1w=;
        b=P2U7ShvuRkMwJ7KOz8woiv5LIowUcM5kX/DluVueHOm36hhcG+fiIHTGNfkYWozexL
         a/Fz804XFQfK+eFjdyT6LtxKNiHaBE5Md1hkknDN8T72rMbvG2FLUQRCOZCETDMAvpTU
         eXaO5W+kmljK497e6HUiIO2XkFLKLBEx1XJq5k78NcRBA0VBtuUSErtg+IJ/Lrb7tBqB
         ba3lO21FcWLEq2qhKYvQrmSkan84w9CAJvQbhTL19DUH2fSL4Y/dlX5O04jNZHqOdjsE
         4vmxPJ/iPQdcdgc8Y4oFME8+DQa9OWGyI0CUp3uexYzhVv5vJr0kVUpHIVO6sK3bC7j+
         4qvg==
X-Gm-Message-State: AOAM530cxzapGp7wo1aSpzxJARXVTeKHOXkrvZdYa6ZMPwkBoBb8bLVC
        PXLIMxsdlkVCEADh+r1pMpbC/F2PgNvyoY6KrCWDV8PvE5RJSUaMpuvcrIkBAfRU7fd3Xgcfxad
        Bdjn8DG6MM+PPIUFYJKMOaia7f/6BGxiUvgDGHrdqY4ixon39wEXstzeINFiHQkfZTgQDDPiqWy
        71iSgA4TTYZA==
X-Received: by 2002:a17:907:28ca:: with SMTP id en10mr2824016ejc.268.1606500374759;
        Fri, 27 Nov 2020 10:06:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw6aBkfGtGOFXG+casGEklTCCi3P6db8+wezgmFhHiiinJMxIYWNDQV8Ig3nS5DzlXFauuGiQ==
X-Received: by 2002:a17:907:28ca:: with SMTP id en10mr2823978ejc.268.1606500374452;
        Fri, 27 Nov 2020 10:06:14 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id c6sm5397373edy.62.2020.11.27.10.06.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2020 10:06:13 -0800 (PST)
Subject: Re: [PATCH 4/5] x86/platform/uv: Add deprecated messages to /proc
 info leaves
To:     Mike Travis <mike.travis@hpe.com>,
        Justin Ernst <justin.ernst@hpe.com>,
        Mark Gross <mgross@linux.intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, Steve Wahl <steve.wahl@hpe.com>
Cc:     Dimitri Sivanich <dimitri.sivanich@hpe.com>,
        Russ Anderson <russ.anderson@hpe.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Ilya Dryomov <idryomov@gmail.com>,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20201125172907.240996-1-mike.travis@hpe.com>
 <20201125172907.240996-5-mike.travis@hpe.com>
 <b0339696-049a-e46e-bcd4-079f1b13d725@redhat.com>
 <ebd8451a-5910-1da5-4792-2a3d2f59b348@hpe.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <3bc4d491-e4c9-132e-97ce-8acfbe9dc509@redhat.com>
Date:   Fri, 27 Nov 2020 19:06:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <ebd8451a-5910-1da5-4792-2a3d2f59b348@hpe.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/27/20 3:58 PM, Mike Travis wrote:
> 
> 
> On 11/26/2020 2:45 AM, Hans de Goede wrote:
>> Hi,
>>
>> On 11/25/20 6:29 PM, Mike Travis wrote:
>>> Add "deprecated" message to any access to old /proc/sgi_uv/* leaves.
>>>
>>> Signed-off-by: Mike Travis <mike.travis@hpe.com>
>>> Reviewed-by: Steve Wahl <steve.wahl@hpe.com>
>>> ---
>>>   arch/x86/kernel/apic/x2apic_uv_x.c | 26 +++++++++++++++++++++++++-
>>>   1 file changed, 25 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/x86/kernel/apic/x2apic_uv_x.c b/arch/x86/kernel/apic/x2apic_uv_x.c
>>> index 48746031b39a..bfd77a00c2a1 100644
>>> --- a/arch/x86/kernel/apic/x2apic_uv_x.c
>>> +++ b/arch/x86/kernel/apic/x2apic_uv_x.c
>>> @@ -1615,21 +1615,45 @@ static void check_efi_reboot(void)
>>>           reboot_type = BOOT_ACPI;
>>>   }
>>>   -/* Setup user proc fs files */
>>> +/*
>>> + * User proc fs file handling now deprecated.
>>> + * Recommend using /sys/firmware/sgi_uv/... instead.
>>> + */
>>> +static void proc_print_msg(int *flag, char *what, char *which)
>>> +{
>>> +    if (*flag)
>>> +        return;
>>> +
>>> +    pr_notice(
>>> +        "%s: using deprecated /proc/sgi_uv/%s, use /sys/firmware/sgi_uv/%s\n",
>>> +        current->comm, what, which ? which : what);
>>> +
>>> +    *flag = 1;
>>> +}
>>> +
>>
>> You have just re-invented pr_notice_once, please just use pr_notice_once
>> directly in the _show functions.
> 
> I tried it both ways (actually with rate limiting as well).  The problem with using a static check in the error print function it will only print the first instance it encounters, not all of the references.
> 
> If I move it to the final output I need to replicate the verbiage of the format for every instance as you can't seem to combine the KERN_* level of printing and the pr_fmt reference of the format string.  I tried a few ways including just putting everything into a format character list.  But what used to work (indirect format pointer) doesn't any more.  Or I didn't hit on the correct combination of KERN_* level and indirect format string.
> 
> The last combination was no print limiting which caused of course the error message to be output on every occurrence.  (NASA has 35,000 customers for their big systems, that's a lot of potential console messages.)  This really annoys them and we would get calls from those that don't have any means of changing this so they ask us.
> 
> So I just chose this method of accomplishing all goals, except of course using the higher level of print function (pr_notice_once).  But if you think method two ("use pr_notice_once directly in the _show function") is most favorable I will switch to that.

Yeah I think using that is much better then reinventing it, you can simply just write
out the 3 different messages which you are "formatting" now as static strings so you get:

	pr_notice_once("%s: using deprecated /proc/sgi_uv/hubbed, use /sys/firmware/sgi_uv/hub_type\n", current->comm);

	pr_notice_once("%s: using deprecated /proc/sgi_uv/hubless, use /sys/firmware/sgi_uv/hubless\n", current->comm);

	pr_notice_once("%s: using deprecated /proc/sgi_uv/archtype, use /sys/firmware/sgi_uv/archtype\n", current->comm);

Regards,

Hans




> 
>>
>> Regards,
>>
>> Hans
>>
>>
>>
>>
>>>   static int __maybe_unused proc_hubbed_show(struct seq_file *file, void *data)
>>>   {
>>> +    static int flag;
>>> +
>>> +    proc_print_msg(&flag, "hubbed", "hub_type");
>>>       seq_printf(file, "0x%x\n", uv_hubbed_system);
>>>       return 0;
>>>   }
>>>     static int __maybe_unused proc_hubless_show(struct seq_file *file, void *data)
>>>   {
>>> +    static int flag;
>>> +
>>> +    proc_print_msg(&flag, "hubless", NULL);
>>>       seq_printf(file, "0x%x\n", uv_hubless_system);
>>>       return 0;
>>>   }
>>>     static int __maybe_unused proc_archtype_show(struct seq_file *file, void *data)
>>>   {
>>> +    static int flag;
>>> +
>>> +    proc_print_msg(&flag, "archtype", NULL);
>>>       seq_printf(file, "%s/%s\n", uv_archtype, oem_table_id);
>>>       return 0;
>>>   }
>>>
>>
> 

