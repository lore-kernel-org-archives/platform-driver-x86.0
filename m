Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 264FAC433DB
	for <platform-driver-x86@archiver.kernel.org>; Sun, 21 Mar 2021 16:38:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E566B6191F
	for <platform-driver-x86@archiver.kernel.org>; Sun, 21 Mar 2021 16:38:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229894AbhCUQiP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 21 Mar 2021 12:38:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22870 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229874AbhCUQhr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 21 Mar 2021 12:37:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1616344666;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qNSMOQVMtFLXfRA64H5U21/1b4tMY96NTROWskuxqec=;
        b=UtiepKUUJd7RHASsRHyBUHs6T5ZmQVqfElUdlSSKXUs8iq3r42uWbldEF7vX/lVCMIYFm8
        dHCmgtYUgbWfq7KX4zc4mGxHkafb82kkxtm7Zda628HC9sbzprS1REenWFle2JJmJpG6gW
        NKgYxX+BWnBfKESJgJgGaJFqFNu10MQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-iy9BnttFPqGDkuPKXWYLrA-1; Sun, 21 Mar 2021 12:37:39 -0400
X-MC-Unique: iy9BnttFPqGDkuPKXWYLrA-1
Received: by mail-ed1-f71.google.com with SMTP id n20so26182160edr.8
        for <platform-driver-x86@vger.kernel.org>; Sun, 21 Mar 2021 09:37:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qNSMOQVMtFLXfRA64H5U21/1b4tMY96NTROWskuxqec=;
        b=W4TbDPhj/TTl4arDEoCxkfmie4z9PJqQWz6RNoiwBacZckoquRKoVQiAq6db1/iIUu
         oyJw25YEs0cNuwQ33qTYGFNG0w6OLxh7r88qSkm7ZSnYhP8Tvw4ahg/910Z+jpWTEHQt
         xnYu+F/ulzNFClp3fpSLNyupaCl37qv9AG1esp43XyvxCzLr0kRcnMxBxe0HKVeK8IB1
         FIsu+azyCPNqtSjMV/ui0UDRucoBSjeluSdNtXvYjtf+mh4tPuIo7qyZrthDJBdua8IZ
         VNbbPmm2hI9nDYbLcDRdcd1hE/gKAFEp3ZWutvBXEOneKYjfbZ7dFB7h0XrII5sHJfLA
         kGIA==
X-Gm-Message-State: AOAM530/tEudszAKrJl/9NdgHp/6mlNl1rEFUPOC+y9eIRIe9WqDxPT8
        TxEoG9hiHDF5BWU5k4vOo9L7T0i+8LdMFBAI3+KmDx5J3f2bS2H87vTpBkxw0sBOSzZG/1k9KX4
        6IxDdXmZqGd/dNFkn1jjVIZCa18inMYv9LTqC3hDROPVAIg9kzTcpBswn9j5cfoZrKSzqv1jwsn
        2Hokws5IovWw==
X-Received: by 2002:aa7:cdcf:: with SMTP id h15mr21129734edw.28.1616344658465;
        Sun, 21 Mar 2021 09:37:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwuSoIqQxyU+WSlBMHaa8KTM0wZeGXeRfVSqdWdj+22AxTf4OZtAwB3tEC3B470hpLGXc1SHQ==
X-Received: by 2002:aa7:cdcf:: with SMTP id h15mr21129718edw.28.1616344658297;
        Sun, 21 Mar 2021 09:37:38 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id jj16sm7263465ejc.19.2021.03.21.09.37.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Mar 2021 09:37:37 -0700 (PDT)
Subject: Re: [External] Re: [PATCH] thinkpad_acpi: Allow the FnLock LED to
 change state
To:     Nitin Joshi1 <njoshi1@lenovo.com>,
        Mark RH Pearson <markpearson@lenovo.com>,
        Esteve Varela Colominas <esteve.varela@gmail.com>,
        Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>
Cc:     "ibm-acpi-devel@lists.sourceforge.net" 
        <ibm-acpi-devel@lists.sourceforge.net>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
References: <20210315195823.23212-1-esteve.varela@gmail.com>
 <7fcaeb12-35b1-242a-dfd0-02324643c34b@redhat.com>
 <18ee74c0-85d9-6a1a-67f5-82682878001a@lenovo.com>
 <TY2PR03MB36456F1A3EFC9C31A865BF498C689@TY2PR03MB3645.apcprd03.prod.outlook.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <87c96962-3db5-ee18-1104-1e9d9b774572@redhat.com>
Date:   Sun, 21 Mar 2021 17:37:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <TY2PR03MB36456F1A3EFC9C31A865BF498C689@TY2PR03MB3645.apcprd03.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/19/21 11:39 AM, Nitin Joshi1 wrote:
> Hello,
> 
>> -----Original Message-----
>> From: Mark RH Pearson <markpearson@lenovo.com>
>> Sent: Friday, March 19, 2021 5:13 AM
>> To: Hans de Goede <hdegoede@redhat.com>; Esteve Varela Colominas
>> <esteve.varela@gmail.com>; Henrique de Moraes Holschuh <ibm-
>> acpi@hmh.eng.br>; Nitin Joshi1 <njoshi1@lenovo.com>
>> Cc: ibm-acpi-devel@lists.sourceforge.net; platform-driver-
>> x86@vger.kernel.org
>> Subject: Re: [External] Re: [PATCH] thinkpad_acpi: Allow the FnLock LED to
>> change state
>>
>> Thanks Hans
>>
>> On 18/03/2021 12:49, Hans de Goede wrote:
>>> Hi,
>>>
>>> On 3/15/21 8:58 PM, Esteve Varela Colominas wrote:
>>>> On many recent ThinkPad laptops, there's a new LED next to the ESC
>>>> key, that indicates the FnLock status.
>>>> When the Fn+ESC combo is pressed, FnLock is toggled, which causes the
>>>> Media Key functionality to change, making it so that the media keys
>>>> either perform their media key function, or function as an F-key by
>>>> default. The Fn key can be used the access the alternate function at
>>>> any time.
>>>>
>>>> With the current linux kernel, the LED doens't change state if you
>>>> press the Fn+ESC key combo. However, the media key functionality
>>>> *does* change. This is annoying, since the LED will stay on if it was
>>>> on during bootup, and it makes it hard to keep track what the current
>>>> state of the FnLock is.
>>>>
>>>> This patch calls an ACPI function, that gets the current media key
>>>> state, when the Fn+ESC key combo is pressed. Through testing it was
>>>> discovered that this function causes the LED to update correctly to
>>>> reflect the current state when this function is called.
>>>>
>>>> The relevant ACPI calls are the following:
>>>> \_SB_.PCI0.LPC0.EC0_.HKEY.GMKS: Get media key state, returns 0x603 if
>> the FnLock mode is enabled, and 0x602 if it's disabled.
>>>> \_SB_.PCI0.LPC0.EC0_.HKEY.SMKS: Set media key state, sending a 1 will
>> enable FnLock mode, and a 0 will disable it.
>>>>
>>>> Relevant discussion:
>>>> https://bugzilla.kernel.org/show_bug.cgi?id=207841
>>>> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1881015
>>>>
>>>> Signed-off-by: Esteve Varela Colominas <esteve.varela@gmail.com>
>>>> ---
>>>>  drivers/platform/x86/thinkpad_acpi.c | 8 +++++++-
>>>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/platform/x86/thinkpad_acpi.c
>>>> b/drivers/platform/x86/thinkpad_acpi.c
>>>> index c40470637..09362dd74 100644
>>>> --- a/drivers/platform/x86/thinkpad_acpi.c
>>>> +++ b/drivers/platform/x86/thinkpad_acpi.c
>>>> @@ -4079,13 +4079,19 @@ static bool hotkey_notify_6xxx(const u32
>>>> hkey,
>>>>
>>>>  	case TP_HKEY_EV_KEY_NUMLOCK:
>>>>  	case TP_HKEY_EV_KEY_FN:
>>>> -	case TP_HKEY_EV_KEY_FN_ESC:
>>>>  		/* key press events, we just ignore them as long as the EC
>>>>  		 * is still reporting them in the normal keyboard stream */
>>>>  		*send_acpi_ev = false;
>>>>  		*ignore_acpi_ev = true;
>>>>  		return true;
>>>>
>>>> +	case TP_HKEY_EV_KEY_FN_ESC:
>>>> +		/* Get the media key status to foce the status LED to update */
>>>> +		acpi_evalf(hkey_handle, NULL, "GMKS", "v");
>>>
>>> Sicne this is a getter function I guess that calling it is mostly
>>> harmless and if it works around what seems to be a firmware bug on
>>> some of the E?95 ThinkPad models then I guess that this is fine by me.
>>>
>>> Mark, do you have any comments on this ?
>> I'd like to follow up with the firmware team to make sure we've got the correct
>> details and implementation (kudos on the reverse engineering though).
>>
>> Nitin - you've worked with the firmware team on hotkeys, would you mind
>> digging into this one please to confirm. In particular if there's been a change
>> how do we make sure we don't impact older platforms etc.
> 
> Regarding "GMKS" method, it does not have "version" related information. So , its unlikely to impact any older platforms.
> However, I got it confirmed that definition of GMKS method itself doesn't include any workaround feature. 
> 
> But, since its getter function , I also think its harmless and if it workaround some issue then I don’t see any concern.

Ok, I'll merge this patch then.

Regards,

Hans

