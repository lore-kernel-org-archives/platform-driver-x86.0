Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA9D4C433DB
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Feb 2021 13:15:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 830B864F4D
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Feb 2021 13:15:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236161AbhBDNPT (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 4 Feb 2021 08:15:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48905 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236029AbhBDNPS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 4 Feb 2021 08:15:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612444431;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hQ7ftLisEtrbD3nvPMM1qLqviSAiLANOhKU7vQoTi+4=;
        b=eKKWRmIorlehN3gkpm+y1odaxibWtxN1vhBsKA21o3HEDs3y2coYRRHklHPzjuucF14kfH
        O+jZjyVdloqDAkgv87U+WOgmcA4UidpZawy0LOZufPABqiB/jh7G8E849lWtvwfK4mF4tv
        yNSzqnspY2oonI84LwYitTBHOG7XCUg=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-fEVlKSAXNi-NOLFDEcW2kQ-1; Thu, 04 Feb 2021 08:13:50 -0500
X-MC-Unique: fEVlKSAXNi-NOLFDEcW2kQ-1
Received: by mail-ej1-f72.google.com with SMTP id q11so2544300ejd.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 04 Feb 2021 05:13:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hQ7ftLisEtrbD3nvPMM1qLqviSAiLANOhKU7vQoTi+4=;
        b=X/4k+B15/95PsBFv4xkHXf1fKx5elo9Moau3WDzqMf0fr6umPjVgCNKbuFc8uoijvo
         3ryL0RZRwRb5A0xo/ZhO77QoDvWPyoz/CYJKk2JHEbG6dma1ditg4+RAy3Ydou4iN8o4
         nCEoxiPnpvmVa1oe5JkFAsr1ay+g56XwiBbxL63b0JnARNkByHS2F6huKD48cmbGDvE7
         DZtrs5DetH0rbXPWhPI4Qz7sXzNWPrtV7noRCQZE+4QChXPufZj/aJILAB+iQBh3vP2K
         zuiyC5iyk8qd1MGsghQK/9cOlrbfjgrQ16iCLL4yDRab8HCpbekw4jlpV8w3+GDq7LDq
         82VQ==
X-Gm-Message-State: AOAM531sMlQRPerrVtanQv+qYPqR3yfyGxcpSYlth+umGVOE5qMqi05M
        WCqLIoi2Yl4nMFPNFANUCDRDhcjHepPsq1WTxWX+P7VlETnUQgO1DOr2UxV/JbiweHZbMbpz88O
        pJg3Om0FZmVq1fkO8iecpqkSvMf6EXt4IbA==
X-Received: by 2002:a05:6402:1215:: with SMTP id c21mr7939292edw.310.1612444429377;
        Thu, 04 Feb 2021 05:13:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxgCxtwdrnsZoIPSbXFhx9pnDMDxk6NWI7ctPtMJfYB+x267Zt4gdBOzNHHmhRCEh2kUOl0wg==
X-Received: by 2002:a05:6402:1215:: with SMTP id c21mr7939278edw.310.1612444429237;
        Thu, 04 Feb 2021 05:13:49 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id w4sm2449851eds.40.2021.02.04.05.13.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Feb 2021 05:13:48 -0800 (PST)
Subject: Re: [PATCH v3 24/29] platform/x86: ideapad-laptop: fix checkpatch
 warnings, more consistent style
To:     =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>
Cc:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20210203215403.290792-25-pobrn@protonmail.com>
 <070b8c56-5b04-c50b-2e72-7dba07b02ed4@redhat.com>
 <TpRuYoh3r3tsFcaDiM7VGsvO7fxuxkjRJFafIrdnNX4WY4Bl8iiiqHS2Yiy9pg2hpLtw-olz7sT_2FmEJggNXlSMJrnoWoQnFXvUg5B-YZw=@protonmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <810815e9-e055-40a9-5374-793ab68c6ff9@redhat.com>
Date:   Thu, 4 Feb 2021 14:13:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <TpRuYoh3r3tsFcaDiM7VGsvO7fxuxkjRJFafIrdnNX4WY4Bl8iiiqHS2Yiy9pg2hpLtw-olz7sT_2FmEJggNXlSMJrnoWoQnFXvUg5B-YZw=@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/4/21 1:45 PM, Barnabás Pőcze wrote:
> Hi
> 
> 
> 2021. február 4., csütörtök 9:58 keltezéssel, Hans de Goede írta:
> 
>> Hi,
>>
>> On 2/3/21 10:56 PM, Barnabás Pőcze wrote:
>>
>>> Fix all checkpatch warnings. Reorder variable definitions from
>>> longest to shortest. Add more whitespaces for better readability.
>>> Rename variables named `ret` to `err` where appropriate. Reorder
>>> sysfs attributes show/store callbacks and the `ideapad_attributes`
>>> array in lexicographic order. And other minor formatting changes.
>>> No significant functional changes are intended.
>>> Signed-off-by: Barnabás Pőcze pobrn@protonmail.com
>>
>> Ugh, this is a big patch with a lot of things going on.
>>
>> I will take this patch as is this time, but next time please
>> split patches like this up a bit:
>>
>> 1.  The reworking of the sysfs show/store functions really belongs in a separate patch
>> 2.  That separate rework sysfs show/store functions patch itself should be 2 patches:
>>     2.1 Move the various show/store functions around to their final alphabetical order
>>     without any further changes, just move the blocks. And explicitly mention this
>>     in the commit message, to make life easier for the reviewer
>>     2.2 And then do the actual reworking in a separate patch, that makes reviewing this
>>     much much easier, now I had to jump back and forth between the old and new blocks
>>     (which were not in the same place) to make sure that nothing has changed.
>>     Note doing things like this (first move without any changes other then moving)
>>     also makes checking your own work easier.
>>
>> 3.  This change:
>>
>>> @@ -773,7 +801,10 @@ static void dytc_profile_refresh(struct ideapad_private *priv)
>>> return;
>>> perfmode = (output >> DYTC_GET_MODE_BIT) & 0xF;
>>>
>>> -   convert_dytc_to_profile(perfmode, &profile);
>>>
>>> -
>>> -   if (convert_dytc_to_profile(perfmode, &profile))
>>> -       return;
>>>
>>>
>>> -   if (profile != priv->dytc->current_profile) {
>>>     priv->dytc->current_profile = profile;
>>>     platform_profile_notify();
>>>
>>
>> Although a good change, clearly is not just a checkpatch / style change and as
>> such really should have been in its own commit!
> 
> 
> Yes, I'm sorry, I apologize for the inconvenience, this really should've been split up
> and I failed to do so. If you want, I can still split it up and send the whole
> (or part of the) series again?

I've already merged the entire series (minus patch 12) as is, so no need to resend it,
just something to keep in mind for the next time.

Regards,

Hans

