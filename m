Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 990FDC678D5
	for <platform-driver-x86@archiver.kernel.org>; Sat,  4 Mar 2023 20:14:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbjCDUOK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 4 Mar 2023 15:14:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbjCDUOJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 4 Mar 2023 15:14:09 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9254C18169
        for <platform-driver-x86@vger.kernel.org>; Sat,  4 Mar 2023 12:14:07 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id az36so3504678wmb.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 04 Mar 2023 12:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677960846;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RpODLlcBjZPtS0HsxoWKy5Foa12NNRuCD2+qNJTEtHA=;
        b=ALfP2pU/hDz8jShh4MhfFBW0M0oGLWQNYiF/zF30uiRnb0OpBqgAFTDhjVI9wlhd/I
         h9DBbWRPTQXWOtNxfP198Pd/KIlGpbjdPgRDstDQi92Xi5C4XaDEVVMWlffFihZrb19/
         u1YBb7tGsKsHdo6ORSS7JVS8CrgfP0izooNzN7He62qWYuvO8tsKGYg7zBV/ejizCauX
         9X6+Q9tTMNF8wiZAZj79CzyGjgyAlXwk7shhYvUhJlV02Vtcsfh65F0k9OXfZoDTeO6h
         +AH6ODw9Ul7vs8lU4K5QPRp/lDpxScR8uvvQGwvsU3P01G0XnxK75bhyrLSFd2jJH2Lz
         EXCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677960846;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RpODLlcBjZPtS0HsxoWKy5Foa12NNRuCD2+qNJTEtHA=;
        b=F6QVOgrXrh1QnBEp2ieQpCTtB/kXxkgEqrhos5KUAyzQNt4bug4pbmAjow/5BSjU3J
         NVGqkavgGnHAA7dgEDmHIJFiqVZrpmo0SBsN1/FlKpbXa04SUbjp3/9ugf8AOu0aNH0o
         iLqbFlroi2TqqaqTjiBEZeM8JF4Dl3gSgAIusl3g84sJhMrvR/yQ68CoXgRLfDm/gzyt
         gRRjdRUit1Eg3WuOVLqNsrwnJdqMJz4qj8cm4ytFhVW0SQMVEii0i6NBo7XkmyXQZ6H4
         8HyHukcc6U/1jNKasmfRZuZ+Nobol0Jq7DI+Ul8MGOaFrxs4HFvr0yeb8MxSRJ+jZlF9
         foBA==
X-Gm-Message-State: AO0yUKV3Ghmh4GxdyXHzUGyKBBslCwLaUqTLS7B+S+mAvGBe21FQKOS/
        b07EgpCgvKPwEPXecX0qQV0=
X-Google-Smtp-Source: AK7set8MrCiLIdDRvMZz+z7gCqcbIVfIjmfeezdy9zrjXa0bETQk9HtPs1B2/v64S5JR4c03vr15Ag==
X-Received: by 2002:a05:600c:4448:b0:3ea:82a9:3644 with SMTP id v8-20020a05600c444800b003ea82a93644mr4998178wmn.34.1677960846035;
        Sat, 04 Mar 2023 12:14:06 -0800 (PST)
Received: from [10.30.0.9] ([217.138.207.232])
        by smtp.gmail.com with ESMTPSA id r8-20020a05600c458800b003df5be8987esm10215338wmo.20.2023.03.04.12.14.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Mar 2023 12:14:05 -0800 (PST)
Message-ID: <044d2716-2490-6600-33e2-ecf50f65a6e9@gmail.com>
Date:   Sat, 4 Mar 2023 21:14:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: ideapad_laptop tablet mode toggle detection
To:     Andrew Kallmeyer <kallmeyeras@gmail.com>,
        platform-driver-x86@vger.kernel.org
References: <CAG4kvq9US=-NjyXFMzJYu2zCJryJWtOc7FGZbrewpgCDjdAkbg@mail.gmail.com>
 <CAG4kvq9-qGFNRP29i4jDPL6RVLwGG86wdtTR1+VWZWu5krfv2A@mail.gmail.com>
Content-Language: en-US
From:   Maximilian Luz <luzmaximilian@gmail.com>
In-Reply-To: <CAG4kvq9-qGFNRP29i4jDPL6RVLwGG86wdtTR1+VWZWu5krfv2A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/4/23 06:46, Andrew Kallmeyer wrote:
> I'm still wondering about that AE_NOT_FOUND error about the WM00 device> though. It seems that the ACPI expects the kernel to define this WM00> device as an extension point. In the DSDT I found:> > External (_SB_.WM00, DeviceObj)
AFAIK this just means that it's external to this table (i.e. the DSDT I
assume), not that the kernel needs to define it (I'm not sure if that's even an
option in the ACPI spec or ACPICA). So it should be in some SSDT or the ACPI
implementation is broken (unless defining devices from the kernel is really an
option and I'm just misinformed).

> Scope (\_SB.PC00.LPCB.EC0)
> {
> 
>      Method (_Q44, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
>      {
>         P80B = 0x44
>         Notify (VPC0, 0x80) // Status Change
>         WEID = 0xF4
>         Notify (WM00, 0x80) // Status Change
>      }
> ...
>      Device (VPC0)
>      {
>          Name (_HID, "VPC2004")  // _HID: Hardware ID
>          Name (_UID, Zero)  // _UID: Unique ID
>          Name (_VPC, 0x7C0DE114)
>          Name (VPCD, Zero)
> 
> 
> Additionally two other _Qxx methods (11 and 12) Notify the same
> two devices. These other two are the brightness up and down keys.
> The only difference is they set those two variables differently so I'll
> have to read those variables as well to differentiate screen flips.
> Right now my module actually detects both screen flips and
> brightness key presses.

I believe that makes sense, given the ACPI code.

> I haven't been able to figure out how to create the WM00 device,
> I'm not even sure that's a thing in ACPI. I also haven't seen how
> to read those variables.

You can use acpi_evaluate_object() and acpi_evaluate_object_typed() for that.

> Is it okay to reuse the events sent to this
> VPC0 device or am I intercepting the events from some other
> functionality? Any pointers would be greatly appreciated.

I guess that depends on the VPC0 device. If it doesn't have a driver already
(which you can check by getting the HID of that device from the DSDT and
grep-ing for it in the kernel source), you can write your own driver against
it, install the notify-handler, and do basically whatever you want. You're not
intercepting/blocking anything by that. If there already is a driver, you'll
have to check what that does and if you can integrate your functionality there.

Given it's a Lenovo device and there are some drivers here, maybe it's also
some know interface/structure, but I guess Hans would know more about that than
I do.

Best regards,
Max
