Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21CDFC4332F
	for <platform-driver-x86@archiver.kernel.org>; Thu, 10 Nov 2022 19:19:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231194AbiKJTTc (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 10 Nov 2022 14:19:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231229AbiKJTTZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 10 Nov 2022 14:19:25 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B34FF13E0D
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Nov 2022 11:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668107913;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mQwHAl7OYzLJWCe4PcxTh4i6X5/u7wOLyGaDC339ksI=;
        b=Id0pIoejBj0FoxyUZS6fmvfbfJjMX1KBPzUm/nrKUOQ8/I78TxtZzXS17FxPvhkZh66t1o
        vxA+QqIODucbHwEp95bVqyPMjS8vvS6I+zAyYj+uWIyGCo5I6Y9lzbjC+rqXTabJsQO6Oo
        BMf+0haB60RLzfu9GVQ7IwR9Ue76BF0=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-561-HArptN8eNJeAz3krNmYUSA-1; Thu, 10 Nov 2022 14:18:32 -0500
X-MC-Unique: HArptN8eNJeAz3krNmYUSA-1
Received: by mail-ej1-f71.google.com with SMTP id sh31-20020a1709076e9f00b007ae32b7eb51so1755014ejc.9
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Nov 2022 11:18:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mQwHAl7OYzLJWCe4PcxTh4i6X5/u7wOLyGaDC339ksI=;
        b=EwpChQ+W9oZytAjR7FGVLn6T7rhUwE1PVDOr9RquzRwF3DB0tjGrW457VKP7z4ajxO
         oGRWeCaVxRMGgV1JNlp0zp3OFFYVgabqZbL31NaXJ6943k/H2+D7TZvon9bZgDXTL/C+
         aVk2vXmLdJSW21YVX5xPY67/Iia0j+ylY/lcd5G7ahFG2yBffSAbz9xT5J4LcYHzaPxG
         DMRTJ6cXNBJIYfuR3XFaCxel7yxtrjdFhQe4L5qISiMV1EbvZQHKbxSD8MZjwsU/f8pa
         6ghVsxkpGni3un+UYYwIUOu0mde+UnaN+3LhrtFET5NN91PEN95O2JXjDllEFkKwWqlP
         WGoA==
X-Gm-Message-State: ACrzQf3pjUyYE/HBmFVwGJF6jKTkoEbajU8ZxpqLoEQSFPglKeFV6B52
        6dwFmaR/ZMxjD26HsST9H4Ex4ewGQTX0GPoeZTZA7FHcyFqAa2fqfyH3JySLdLu2C6HMGCbtEsp
        wqsh0t+Zwx1tmlazw+RuJjWBTALMw64uECQ==
X-Received: by 2002:aa7:ce88:0:b0:461:ea0c:e151 with SMTP id y8-20020aa7ce88000000b00461ea0ce151mr3082431edv.376.1668107911446;
        Thu, 10 Nov 2022 11:18:31 -0800 (PST)
X-Google-Smtp-Source: AMsMyM6fGMNqRiT8Ls2q/qrD69W5LVrOwg4i1od6eNMRaKSk/8sZRBr0Ca021svvDx8cttJxz5IhSw==
X-Received: by 2002:aa7:ce88:0:b0:461:ea0c:e151 with SMTP id y8-20020aa7ce88000000b00461ea0ce151mr3082421edv.376.1668107911283;
        Thu, 10 Nov 2022 11:18:31 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id x3-20020aa7cd83000000b00463cd6d55f5sm204224edv.10.2022.11.10.11.18.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 11:18:30 -0800 (PST)
Message-ID: <d86d9c20-6f5c-0de9-2c09-7667080dd65c@redhat.com>
Date:   Thu, 10 Nov 2022 20:18:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: ideapad-laptop touchpad handling problems, request for help
Content-Language: en-US, nl
To:     =?UTF-8?Q?Eray_Or=c3=a7unus?= <erayorcunus@gmail.com>,
        maxtram95@gmail.com
Cc:     cleverline1mc@gmail.com, g_goessel@outlook.com,
        ike.pan@canonical.com, jiaxun.yang@flygoat.com,
        limanyi@uniontech.com, mjg59@srcf.ucam.org,
        platform-driver-x86@vger.kernel.org
References: <bc1202d1-d85d-4173-5979-237bb1ee9254@redhat.com>
 <CAKErNvqfH-C7xJU3F7ga68o3AK-_ae-K2ggKcUOp1iqtmdSYdw@mail.gmail.com>
 <20221110120022.35041-1-erayorcunus@gmail.com>
 <4bcf4e6b-ae2f-0e22-a291-7faa6731e6c7@redhat.com>
 <20221110164220.46640-1-erayorcunus@gmail.com>
 <CAKErNvo+fh6sXUOPj9sCucuzUOKybOUgBo5riCfLpCF_8t9_uA@mail.gmail.com>
 <20221110184709.52768-1-erayorcunus@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221110184709.52768-1-erayorcunus@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Eray,

On 11/10/22 19:47, Eray Orçunus wrote:
> Hi,
> 
> On 10 Nov 2022 at 21:09, Maxim Mikityanskiy <maxtram95@gmail.com>  wrote:
>> A small note on the DMI allow-list: I don't think Z570 is the only
>> laptop where EC fails to disable the touchpad. While I would like this
>> hack to affect as few laptops as possible, I would expect that other
>> similar models produced in the same time period suffer from the same
>> issue, and I don't think we have the full list of them.
> 
> I just checked Z570 ACPI table, and this is what it does when it receives
> VPCCMD_R_TOUCHPAD:
> 
> 	VDAT = TPEN /* \_SB_.PCI0.LPCB.EC0_.TPEN */
> 	If ((TPEN == One))
> 	{
> 	    GL04 |= 0x02
> 	}
> 	Else
> 	{
> 	    GL04 &= 0xFD
> 	}
> 
> VDAT is the data returned to user.
> So we can say that TPEN is the logical state of touchpad key, and GL04
> is state of touchpad LED or series of LEDs.
> 
> VPCCMD_W_TOUCHPAD is nulled, it doesn't work.
> 
> I also checked which DSDTs I have (13 DSDTs from 2008 to this year)
> contain TPEN, and turned out it was only S12, from 2009. It also had
> nulled VPCCMD_W_TOUCHPAD, and returns TPEN on VPCCMD_R_TOUCHPAD, except
> it doesn't have an LED or GL04.
> 
> So, it's possible that we can only check if TPEN exists on ACPI table,
> instead of having a white-list.

Hmm, lets keep that idea in case it turns out the allow-list based
approach turns out to cause issue/grow out of control. I would rather
not rely on ACPI variables having a specific name for something like
this, but you might be on to something.

I have checked my own collection of acpidumps and the only DSDT
which I have which has a TPEN variable is for an Ideapad D330.

Funny enough that is a 2-in-1 with a detachable USB keyboard.
I would not be surprised if the ideapad driver does not load
on those devices at all since there are no embedded-controller
handled hotkeys, as the keyboard is fully USB/HID and not
connected to the EC at all.

I'll send you the acpidump in a private email.

Regards,

Hans




