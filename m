Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 348DFC61DA4
	for <platform-driver-x86@archiver.kernel.org>; Sat, 18 Mar 2023 17:50:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229550AbjCRRuf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 18 Mar 2023 13:50:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbjCRRue (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 18 Mar 2023 13:50:34 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13AF22F078
        for <platform-driver-x86@vger.kernel.org>; Sat, 18 Mar 2023 10:50:33 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id c11so6089446oiw.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 18 Mar 2023 10:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679161832;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G3p+yKSBc7F4JfijitIMR6HiQuWZrODBoMZUI4sldko=;
        b=iTUhtPP4LRUjVtm9eLhbHvgNb5mrD8KmUUt6re+0HFODZyeRKFuukk7z8XpMNIgGHO
         FqVsQP4ERO4UjHrmWpgurq9wJJPf8AxuFfOepQrayq+95u7c1xufYvlBteywAcXzjjWu
         TjQs+TDHSk2s2ugWZgSVgKijfugDdukTnDVcWoNwHzfARu1kDdMwlMhtW4fyCy8Gyq6I
         kbEa0+LeT68r+e8YgFR4zk/4ErrIswl1RVrQxMy/GhJVz29zIGmSeTXuWECRQXakP3i2
         nCAoOHnydndU6alEz2dzNd9WOJ50jw9xk5r6ugzbZXfXQrPpLWfyb+IdQZr/V5C8IIgq
         b8ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679161832;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G3p+yKSBc7F4JfijitIMR6HiQuWZrODBoMZUI4sldko=;
        b=dZkYtlQ1stULaNzNZwCr2G5NpV78H2iHQpvJ/3nwi6gW0J3D02w6IOahuGudTj6KRi
         O5KkFqEpors6GlTprCu7WOjz5OGRMwLjhbrBe7w5J5wRsbfYWf4SvTUdSppBk4oeEShi
         piWXko2MVX5ef8hr8DPCNGRMKyPX7/2ZBIk0JtpvUP+8ZmMgw08NQp+xuW2I1dGvtUID
         NPIOgS1pjhzFGTU9tR8Xj515THjo86dGjR5aM6NPgS6r7guOahaiKERKQlW+6x3GWnvc
         oC6iDRUQEr84QvUJozMo+g+XpLtDPq8Q8jdjxh+CmDJbM4lw2aq6TV/ADgLUiheTB0xh
         3uHQ==
X-Gm-Message-State: AO0yUKUmBX/QmFnpSxcAJrjITG/Fl7mHRvT3eAtJtE+G0BjConYssRiJ
        A4lO1Ej7EFHR6magYfVPGBE2zLeTzsioX2mtlAqDBpZJ4NE=
X-Google-Smtp-Source: AK7set+Na/3YPZJpkMbYvIejpdrPex48xQ55aZmHegXh2NGyV29KNTw20Gdf+k1NOJHc/3bh21LlDBBMDnmA/hHZ5DE=
X-Received: by 2002:a05:6808:2219:b0:383:f981:b1e5 with SMTP id
 bd25-20020a056808221900b00383f981b1e5mr3336380oib.5.1679161832266; Sat, 18
 Mar 2023 10:50:32 -0700 (PDT)
MIME-Version: 1.0
References: <20221004214332.35934-1-soyer@irl.hu> <20230310041726.217447-1-kallmeyeras@gmail.com>
 <20230310041726.217447-3-kallmeyeras@gmail.com> <91a25bfc-080d-b0e4-46cd-159bbf1346e8@gmx.de>
 <CAG4kvq8GMcw_ytss+e3y9nsaOAk9+m+TSnSBwcqdhqEOUJg_dQ@mail.gmail.com>
 <6592fd8f-f5fa-6144-e8eb-a9e701246ad7@gmx.de> <d00fbe99-6c82-ddfc-4e12-3dcb01eda0a6@redhat.com>
 <9b51d06c-d7b4-3886-4476-1c37f9400c62@gmx.de>
In-Reply-To: <9b51d06c-d7b4-3886-4476-1c37f9400c62@gmx.de>
From:   Andrew Kallmeyer <kallmeyeras@gmail.com>
Date:   Sat, 18 Mar 2023 10:50:21 -0700
Message-ID: <CAG4kvq-P=t08+=sjTNcLLgFrvhiyrdjpNyxEhMcV5rDOt3EtZw@mail.gmail.com>
Subject: Re: [PATCH 2/2] platform/x86: Add driver for Yoga Tablet Mode switch
To:     Armin Wolf <W_Armin@gmx.de>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org, soyer@irl.hu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Fri, Mar 17, 2023 at 5:39=E2=80=AFAM Armin Wolf <W_Armin@gmx.de> wrote:
>
> Am 16.03.23 um 10:00 schrieb Hans de Goede:
>>
>> So I really so no need to make the code needlessly complicated with 2 su=
b-drivers which then notify each other. Let keep things KISS and keep this =
as is, so for the next version only change
>> the method_id from 0xab to 0x01.
>
> I think that using wmi_evaluate_method() is deprecated and we should try =
to minimize its usage whenever possible. As for the handling of the WMI GUI=
Ds, i believe that
> just using the first matching WMI device is not a stable solution. We sim=
ply do not know if Lenovo considers both WMI GUIDs singletons or not. This =
means they could
> for example decide to have multiple independent data sources for tablet m=
ode events. The chances for this are indeed small, but it will still create=
 a problem for users
> using such machines. By having two drivers and maybe a global notifier ca=
ll chain, we would enable the driver to handle such "unlikely situations" c=
orrectly.
>
> This would also allow the driver to work on machines missing the WMI even=
t GUID. In such a case, userspace could then just poll the data WMI GUID fo=
r input, but
> this is just an idea.

Hi Armin, would it work to add the second GUID to the existing
wmi_driver wmi_device_id array? Then I could save the wmi_device in
the driver data on probe. Later when I get the notification on the
other GUID I would just call wmidev_evaluate_method on the saved
pointer out of the private data.

I would just need a way to distinguish the two wmi_device structs.
Seems like the notifier setup wouldn't be needed and it could stay as
one module for one feature.

I have the code ready to mail a v2 patch series with the remove
function added and the fixed method id and the input triggering on
probe, but still using wmi_evaluate_method. Without having much kernel
experience, I sort of agree with Hans that it would be best to be
simpler and not have two modules for one feature, the notifier setup
looks somewhat involved. However if we can do something like the above
idea, that doesn't seem to make it much more complicated to avoid the
deprecated API and I can mail that out instead.

So let me know what you think.

>>> Drivers can be instantiated multiple times, and each time their probe c=
allback is invoked,
>>> and many older WMI drivers cannot do this, so the allowlist exists.
>>> The section "State Container" in Documentation/driver-api/driver-model/=
design-patterns.rst
>>> explains how to write drivers which can be instantiated multiple times.
>>>
>>> If your driver is not a singleton, i.e. it can safely be instantiated m=
ultiple times, then
>>> you can add its WMI GUID to the allowlist.
>> I'm not sure about adding this to the allowlist, using the new API is go=
od (and nice and clean) but this is still expected to be a singleton.
>
> The allowlist is dealing with drivers not jet converted to the WMI bus mo=
del. The allowlist should ideally disappear once the conversion has been
> completed, something which would become difficult if WMI drivers would co=
ntinue to rely on the older GUID singleton behavior which is not compliant
> with the ACPI WMI spec AFAIK. If we know that our WMI GUID is a singleton=
 (which we do not), then we should handle this inside our driver, not insid=
e
> the WMI probing code.

Would it not work to convert this driver to the WMI bus model now? I
wasn't able to find anything about this bus model code.

If I'm understanding
Documentation/driver-api/driver-model/design-patterns.rst correctly
then I think this driver would be okay to have the same GUID probed
multiple times. Each device would get its own private data allocated
for it and that would be cleaned up which each device is removed.
Although, it does look like you would get double input events. I'm not
sure if that's the correct behavior without access to a machine with
two of these switch devices to test on.

- Andrew
