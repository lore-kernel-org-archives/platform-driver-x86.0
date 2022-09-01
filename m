Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E922ECAAD3
	for <platform-driver-x86@archiver.kernel.org>; Thu,  1 Sep 2022 12:44:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231764AbiIAMoQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 1 Sep 2022 08:44:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233033AbiIAMoP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 1 Sep 2022 08:44:15 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCFA513D6E
        for <platform-driver-x86@vger.kernel.org>; Thu,  1 Sep 2022 05:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662036251;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=o3EVYhqy47X3YMEQJ8MtbA1nacsJ0ydF8z3V6I6T7Ho=;
        b=LS0J0MKzdN8VS0TplabX79A1j0cggXhHHmw3t9OOJeJ+5J32U3JQSA2nol8EOMeGwMzh7r
        vY7EBXTiNChrRgzfVgibuVviWUAp23D5XHDRMNMZwwyqXd7dGWFflJvjKFoDpFTcPdWCF4
        QX1Nyg1YCz+ArPCmMLxWmJUnBy9ThIU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-147-aUxbecrdP--YnM4RWISxDA-1; Thu, 01 Sep 2022 08:44:06 -0400
X-MC-Unique: aUxbecrdP--YnM4RWISxDA-1
Received: by mail-ej1-f71.google.com with SMTP id gs35-20020a1709072d2300b00730e14fd76eso6817613ejc.15
        for <platform-driver-x86@vger.kernel.org>; Thu, 01 Sep 2022 05:44:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=o3EVYhqy47X3YMEQJ8MtbA1nacsJ0ydF8z3V6I6T7Ho=;
        b=5j1Sytl1x8gv+koZ7pXkUoamCf6qdp7KyfBYUhz/OCj63vCHa3/uPLEMuJvoyBAQ6h
         PCdUIZwQ3488/j8enrlfvCZJinvslbot7xdLjf+H6CthvucfdYCZRBYSn4SdtHfQ8B2/
         STCiBoQcvO3N7v7IaIrPo2GL/ImARala/afmZOX+UBcyDyxzQeNSz5AacGhy5L8lrZ4u
         jESYFJ3tgbVtIWrQHFVDClB2EM2eMwSdsZbxBAW4gm3X7S2VjhEwQsf9SLJg8RrIhynj
         bUU/8N8Gq1VEdrAA+a3/qUpslr/SKUyS+Z5Y8RoOkXK5j3BPn7ZaN3T3cvX2bSM5NhSR
         7nmw==
X-Gm-Message-State: ACgBeo1yznwT/vweouOgqZox+P2xxvgGdxRNHEKB51DT81P2LzmXf1hj
        bZ5uHHgxhrdlGBUVJ0Ow2Ns+HtUXXvFFbY5mY02HuEx1kQdhK8v6m6XFPXTCiNEs05IuS63gHRR
        pvWbZtAILkbioIMW0cFwJiT9gBas5Da0UBA==
X-Received: by 2002:a17:907:9813:b0:73d:d372:8333 with SMTP id ji19-20020a170907981300b0073dd3728333mr23007842ejc.144.1662036244833;
        Thu, 01 Sep 2022 05:44:04 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7pi+eDOHw0tLWtEtJLZykgz5KkD6WsDa0FDq14YdIfrYHCMqdzvaYjZt8gXyfqxgWyu5+kow==
X-Received: by 2002:a17:907:9813:b0:73d:d372:8333 with SMTP id ji19-20020a170907981300b0073dd3728333mr23007824ejc.144.1662036244520;
        Thu, 01 Sep 2022 05:44:04 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id og4-20020a1709071dc400b0073ddfe1ea69sm8367163ejc.111.2022.09.01.05.44.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 05:44:04 -0700 (PDT)
Message-ID: <a528cbe2-847b-9b15-5123-536900e0d943@redhat.com>
Date:   Thu, 1 Sep 2022 14:44:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 0/4] platform/x86/amd/pmf: Introduce CnQF feature for AMD
 PMF
Content-Language: en-US
To:     Bastien Nocera <bnocera@redhat.com>
Cc:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org,
        platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20220823102913.4181217-1-Shyam-sundar.S-k@amd.com>
 <6ab21af2-e1c6-f76e-9bee-74e21f019be5@redhat.com>
 <CAKEBQogpK-Kgrgc=gb20w07XnsU7ASVjm4XHWMG=rhD0yQLUKw@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAKEBQogpK-Kgrgc=gb20w07XnsU7ASVjm4XHWMG=rhD0yQLUKw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/1/22 14:24, Bastien Nocera wrote:
> On Thu, 1 Sept 2022 at 13:16, Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi,
>>
>> On 8/23/22 12:29, Shyam Sundar S K wrote:
>>> In this series, support for following features has been added.
>>> - "Cool n Quiet Framework (CnQF)" is an extension to the static slider,
>>>   where the system power can be boosted or throttled independent
>>>   of the selected slider position.
>>> - On the fly, the CnQF can be turned on/off via a sysfs knob.
>>
>> Thank you. I think that before doing a more in detail review
>> we first need to agree on the userspace interactions here.
>>
>> I've added Bastien, the power-profiles-daemon maintainer
>> to the Cc for this.
>>
>> From a quick peek at the patches I see that currently they do
>> the following:
>>
>> Probe time:
>> -----------
>>
>> 1. If static slider (classic /sys/firmware/acpi/platform_profile)
>> is available register as a platform_profile provider
>>
>> 2. Query if the BIOS tells us that CnQF should be enable by
>> default if yes then unregister the platform_profile provider
>> and enable CnQF
>>
>>
>> Run time:
>> ---------
>>
>> Allow turning CnQF on/off by writing a sysfs attribute for this.
>>
>> 1. When CnQF gets enabled unregister the platform_profile provider
>>
>> 2. When CnQF gets disabled restore the last set profile and
>> register the platform_profile provider
>>
>>
>> Questions/remarks:
>>
>> 1. If you look at 1. and 2. under "Probe time", you will see that
>> when the BIOS requests to have CnQF enabled by default that
>> userspace will then still shortly see a platform_profile
>> provider. This must be fixed IMHO by checking whether to do
>> CnQF by default or not before the initial register call.
>>
>> 2. What about low-power scenarios ? Currently power-profiles-daemon
>> will always advertise a low-power mode even when there is no
>> platform-profile support, since this is also a hint for other
>> parts of the system to try and conserve power. But when this
>> mode is enabled we really want the system to also behave as
>> if the old static slider mode is active and set to low-power.
>>
>> Some ideas:
>> a) maybe still have the amd-pmf code register a (different)
>> platform_profile provider whn in CnQF mode and have it only
>> advertise low-power
>>
>> b) teach power-profiles-daemon about CnQF and have it
>> disable CnQF when entering low-power mode?
>>
>> c) make the CnQF code in PMF take the charge level into
>> account and have it not go "full throttle" when the chare
>> is below say 25% ?
>>
>> 3. Bastien, can power-profiles-daemon deal with
>> /sys/firmware/acpi/platform_profile disappearing or
>> appearing while it is running?
> 
> No, it doesn't.
> 
> It expects the platform_profile file to be available on startup, at
> worse with the choices not yet filled in. It doesn't handle the
> platform_profile file going away, it doesn't handle the
> platform_profile_choices file changing after it's been initially
> filled in, and it doesn't support less than one power profile being
> made available, and only supports hiding the performance profile if
> the platform doesn't support it.

Ok, so this means that if we go with these changes as currently
proposed that if a user uses the sysfs file to turn CnQF on/off
they will need to restart power-profile-daemon.

I think that that is acceptable given that the user needs to manually
poke things anyway. We should probably document this in the documentation
for the sysfs attribute (as well as in newer versions of the p-p-d
docs/README).

> Some of those things we could change/fix, some other things will not.
> If the platform_profile_choices file only contained a single item,
> then power-profiles-daemon would just export the "low-power" and
> "balanced" profiles to user-space, as it does on unsupported hardware.

Right.

> The profiles in power-profiles-daemon are supposed to show the user
> intent, which having a single setting would effectively nullify.

Yes that was my understanding too.

> It's unclear to me how CnQF takes user intent into account (it's also
> unclear to me how that's a low-power setting rather than a combination
> of the existing cool and quiet settings).

AMD folks, please correct me if any of the below is wrong:

AFAIK even though it is called CnQF it is more like auto-profile
selection and as such does not take user intent into account
at all.

It looks at the workload over a somewhat longer time period (say
5 minutes or so I guess?) and then if that consistently has been
quite high, it will select something similar to performance.

Where as for a more mixed workload it will select balanced and for
a mostly idle machine it will select low-power.

I guess this auto feature is best treated the same as unsupported hw.

> (it's also
> unclear to me how that's a low-power setting rather than a combination
> of the existing cool and quiet settings).

Even though it is called cool and quiet AFAIK it won't be all that
cool and quiet when running a heavy workload. Which is why I wonder
how to re-conciliate this with showing low-power in e.g. the
GNOME shell system men. Because in essence even if the battery
is low the system will still go full-throttle when confronted
with a heavy workload.

So selecting low-power would result in the screen-dimming which
I think is part of that, but the CPU's max power-consumption won't
get limited as it would when platform-profiles are supported.

So I guess this is indeed very much like how p-p-d behaves
on unsupported hw...

###

As mentioned I guess one option would be for CnQF to
still register a platform_profile provider and then in
balanced mode do its CnQF thing and in low-power mode
disable CnQF and apply the static-slider low-power settings
I think that that would work best from things actual
working in a way I would expect the avarage end-user to
expect things to work.

So p-p-d would then still see platform-profile support
in CnQF mode but with only low-power + balanced advertised.

Bastien would that work for you?

AMD folks would that also work for you ?

###

I'm also wondering if we are going to still export
balanced + low-power modes to userspace in CnQF mode
and disable CnQF in low-power mode then if we
even need a sysfs knob to turn it on/off at all.

I guess the sysfs knob would then still be useful
to turn it on on systems where it defaults to off
in the BIOS.  Might be better to do this as
a kernel-cmdline (module-param) then though, then we
also avoid the problem of platform_profile support
all of a sudden changing underneath's p-p-d's feet.

Regards,

Hans






and for toggling ooff through sysfs

