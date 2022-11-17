Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17A3BC433FE
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Nov 2022 09:59:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239263AbiKQJ7U (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Nov 2022 04:59:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233096AbiKQJ66 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Nov 2022 04:58:58 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BE474877A
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Nov 2022 01:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668679006;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Jh1QBXJHWhTjnnV7TnPjpK5IcBvyMz+FkPZqkzKMV3M=;
        b=JTyhst3iEceOwIqJ5JLyN53pJc7zuWA64W+LzA8Q5tzHKhqggsrnJLBJAMhgiht+sxWeCS
        B3vD1D5mO7WJQj33rNW9DhKdC+DmvmG+j0blXHNznAe7lLJ4f1UGOS/f81Ci7QWHSbIYzl
        L/SnRtvTuWdheFafdfbomjQ3HEZzA7M=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-466-zO-B4KDOOqy6EAcGu9_6PQ-1; Thu, 17 Nov 2022 04:56:45 -0500
X-MC-Unique: zO-B4KDOOqy6EAcGu9_6PQ-1
Received: by mail-ed1-f69.google.com with SMTP id z11-20020a056402274b00b00461dba91468so888442edd.6
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Nov 2022 01:56:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jh1QBXJHWhTjnnV7TnPjpK5IcBvyMz+FkPZqkzKMV3M=;
        b=cpFBjj9/wHhmmfMM+rEjKCvni9/+XhtFKh2+OBx/iBvnPpXA6eXUQVGauTbAq6QcQ7
         WQcNsTld9wnA4s3/BOdSu1aTP2IWCflhMCGYzfFoIhvIUfTnpgzD8tC7InYu3wD0CQZ1
         ZUaK/Nl3y0YONyGIWdyhHeXmmDpXIbe2tJy+Wbw4TrMs0tiJhmRzeNpVg9BvyLMToE2C
         NadEctmYA8x56PZHwrSKWoEW+ZCnpyi2HK+V6Cp2uDcCktKIUQRBNvNGXIxC7vQhkjTq
         A4yCBHt2xKVKJ948mJ/F7bVOKkXGT80kDVmjgseJrf9NSHnSSTtGIEdTwqmm94aKdzoU
         XqQA==
X-Gm-Message-State: ANoB5pn0NvHa6rqCHr9T/+sOA6Lr9bfrfNveFUGeUDP9Ov1//iIR93FI
        gGG2M38Bo8W5q058lUAWbHmUPNNdj/+WFMFfSbK5MEKo/nANkyVmZ/wFXkuQtfO9W42NZATdm+9
        49a7/B0T2a4OitCVMNAmvVOj8T4cadyKVZQ==
X-Received: by 2002:a17:906:1811:b0:7ae:5a4:5356 with SMTP id v17-20020a170906181100b007ae05a45356mr1483381eje.748.1668679003891;
        Thu, 17 Nov 2022 01:56:43 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7f+0P7EVVVGeFxTgmz0pD1r7ZjLmgT0xxTtEh9+eGODkydEqCPFw5qY7Tye1TxFOC6uw7zqQ==
X-Received: by 2002:a17:906:1811:b0:7ae:5a4:5356 with SMTP id v17-20020a170906181100b007ae05a45356mr1483369eje.748.1668679003707;
        Thu, 17 Nov 2022 01:56:43 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id cq17-20020a056402221100b0045ce419ecffsm314138edb.58.2022.11.17.01.56.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Nov 2022 01:56:43 -0800 (PST)
Message-ID: <d9423b7f-c874-c8ca-0602-abb25ca4e560@redhat.com>
Date:   Thu, 17 Nov 2022 10:56:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 0/3] platform/x86: ideapad-laptop: Rework touchpad control
 code
Content-Language: en-US, nl
To:     =?UTF-8?Q?Eray_Or=c3=a7unus?= <erayorcunus@gmail.com>
Cc:     andy@kernel.org, arnavr3@illinois.edu, felix@eckhofer.com,
        g_goessel@outlook.com, ike.pan@canonical.com,
        jiaxun.yang@flygoat.com, kai.heng.feng@canonical.com,
        kelly@xilka.com, limanyi@uniontech.com, markgross@kernel.org,
        maxtram95@gmail.com, p.jungkamp@gmx.net,
        platform-driver-x86@vger.kernel.org, pobrn@protonmail.com,
        whenov@gmail.com
References: <20221116152448.698707-1-hdegoede@redhat.com>
 <20221116160825.16120-1-erayorcunus@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221116160825.16120-1-erayorcunus@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Eray,

On 11/16/22 17:08, Eray Orçunus wrote:
> Hi,
> 
> On Thu, 16 Nov 2022 at 18:25, Hans de Goede <hdegoede@redhat.com> wrote:
>> Hi All,
>>
>> Here are my proposed changes from the "ideapad-laptop touchpad handling
>> problems, request for help" email thread as proper patches:
>> https://lore.kernel.org/platform-driver-x86/bc1202d1-d85d-4173-5979-237bb1ee9254@redhat.com/
>>
>> Note this applies on top of my review-hans branch which has seen a bunch
>> of other ideapad-laptop changes land recently:
>> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans
>>
>> As suggested by Maxim, the third patch now has a module parameter to
>> allow users to easily re-enable the i8042 aux-port enabling/disabling
>> on models other then the Z570.
>>
>> Eray, you mentioned in another email that you have some concerns about
>> the approach in this series?
> 
> Yes, thanks for mentioning. My concerns are these:
> 
> - Users of laptops with ELAN0634 (like Yoga 14s and 720s), Lenovo
>   Yoga 3 Pro 1370 and ZhaoYang K4e-IML will start to see non-working
>   "touchpad" sysfs attribute on their ideapad-laptop driver. I see this
>   as a regression. Also it's easy to fix; we can just test for if
>   VPCCMD_W_TOUCHPAD works at the boot - with sending 0 first and verify the
>   VPCCMD_R_TOUCHPAD result, and then sending 1 and again verify the
>   VPCCMD_R_TOUCHPAD result. Later we can remove "touchpad" attribute if it
>   doesn't work,

I'm not 100% sure if this will work everywhere and I'm a bit worried the
VPCCMD_W_TOUCHPAD calls might cause problems on some devices. You did
mention that the ideapad windows software seems to always make
VPCCMD_W_TOUCHPAD calls.

But still, one of my goals with this series is to have the ideapad-laptop
driver poke less at the hw, to avoid the poking potentially causes issues.

Where as your suggested auto-detection makes the driver poke the hw more,
not less.

Thinking more about this makes me wonder: "why not just
entirely remove the whole touchpad sysfs attribute?"

Just removing the entire touchpad sysfs attribute will greatly simplify
things and normal userspace does not depend on it at all. Its only
potential users are custom user scripts and ideapad specific control
panels or some such.

And the custom control panels already need to deal with the touchpad
sysfs attribute not always being there.

I do realize that removing it might be a bit too big of a hammer,
so instead I plan to have it hidden by default and allow enabling
it through a module parameter.

Serr the next version of this patch-set (coming up soon).

Gating this with a module parameter will reduce all the maintenance
burden of having allow-lists are fragile auto-detect code for
a feature which I believe hardly anyone uses at all.

>   with the exception of devices with ctrl_ps2_aux_port,
>   since these laptops have working VPCCMD_R_TOUCHPAD.

I don't agree with having the touchpad sysfs attr visible on
the ctrl_ps2_aux_port devices, writing it will do nothing and as you
mentioned yourself some ideapad specific tools will show a touchpad
on/off option when this file is visible, which then will not work.

Note that just hiding the touchpad sysfs attr be default makes
this whole discussion mute though.

> - You removed sending 1 to VPCCMD_W_TOUCHPAD at the boot, are we sure
>   there are no laptops needing that? I don't think we talked about that
>   in previous e-mail thread.

This was only added recently (until recently there was no touchpad_ctrl_via_ec
flag at all) and seems to be copied and pasted from the rfkill code, where
we know that manually disabling the hw-rfkill bit is actually needed on
some models without an actual hw-rfkill switch...

> - There is no i8042 cmd on touchpad_store, which may make the function
>   ineffective on laptops with ctrl_ps2_aux_port.

This is not a problem introduced by this patch-set, touchpad-store never
controlled the ps2-aux port.

As mentioned above IMHO just hiding the touchpad sysfs attr here is better
(avoids the need to make touch-store have a special case for this).

These devices have a working touchpad-toggle hotkey + a LED to indicate
the status, so there really is no need for the sysfs attr.

(which makes me realize there is really little need for the sysfs attr
at all, so just always hiding it is easier, avoiding all sorts of possible
issues, see above).

> - r_touchpad_val isn't set at touchpad_store and/or touchpad_read, which
>   can make it out of sync when "touchpad" attr is accessed.

I've fixed this in the next version of my patch set.

Regards,

Hans

