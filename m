Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EFADC6FD1D
	for <platform-driver-x86@archiver.kernel.org>; Wed, 15 Mar 2023 22:34:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230197AbjCOWei (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 15 Mar 2023 18:34:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230036AbjCOWeh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 15 Mar 2023 18:34:37 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DB1C234D1
        for <platform-driver-x86@vger.kernel.org>; Wed, 15 Mar 2023 15:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1678919639; i=w_armin@gmx.de;
        bh=s+qEP9CBGseqZA89K5aIvwRQ2HtASk6FBYwrU/4fQUk=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=D1gJmVcIOl4iavRTn/NacWrHI0uj0lC9rrDwTEqvl7pzK+V19sOy4n3qGNgmdfkG+
         OXdVybqxT+C3YJeU9rlsZBpCgJObGrOV9ZEd+srZ4I6qk6QLjvf2aJNNvL1/gsxD8r
         gZRNcDn00OFE/X6j1kPLVnktYA3JCFeMOlYwACaSYrsce4A43wzhmhwGV/PqP5wLDT
         t/d2YWDftSU/WPSr15hiNYOIN/LYxDl6QqfQ3HQjQS+1T53l142Dh/XQCUaKo+V9b8
         Xx4Hp2VhZFcYzViSKJ5RxcJjARlG7shfzGlZuYTK8cBJE3jNugeMa/qtwNxSZaFgHU
         5dgKZcnWKbwIw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mn2aD-1qLYpM2Nt9-00k3vm; Wed, 15
 Mar 2023 23:33:59 +0100
Subject: Re: [PATCH 2/2] platform/x86: Add driver for Yoga Tablet Mode switch
To:     Andrew Kallmeyer <kallmeyeras@gmail.com>
Cc:     platform-driver-x86@vger.kernel.org, hdegoede@redhat.com,
        soyer@irl.hu
References: <20221004214332.35934-1-soyer@irl.hu>
 <20230310041726.217447-1-kallmeyeras@gmail.com>
 <20230310041726.217447-3-kallmeyeras@gmail.com>
 <91a25bfc-080d-b0e4-46cd-159bbf1346e8@gmx.de>
 <CAG4kvq8GMcw_ytss+e3y9nsaOAk9+m+TSnSBwcqdhqEOUJg_dQ@mail.gmail.com>
From:   Armin Wolf <W_Armin@gmx.de>
Message-ID: <6592fd8f-f5fa-6144-e8eb-a9e701246ad7@gmx.de>
Date:   Wed, 15 Mar 2023 23:33:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAG4kvq8GMcw_ytss+e3y9nsaOAk9+m+TSnSBwcqdhqEOUJg_dQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Provags-ID: V03:K1:FahvRlwClEolQ2pAjjK//MbcvjcCKET3tkMk/qpL70MClaO6xLN
 mRNXoif6dJBQ6byPTYanfzRicR9qFJtZDyiH3je3b6hmJU71P5GAHKQP4LBlWTSK4+8bJ+W
 KYbYr6Bg8xNrwnA+biX/tuVHvcTiXTteFMnLCmF9PhcoxhglALY7om8xwhbPGZiThoJWH+g
 zg/IHPbGWZIokaiy8s65A==
UI-OutboundReport: notjunk:1;M01:P0:DVqa26ibu+Q=;aAiMbZvcaOMK4YfGqtJhLLLtelA
 eRn6uRK32Cz5Rc/JyTinw6OONerVqBon0SbYuZQYdzUDYGGF/Dljh8WATzA4TYDotL3BDCxAp
 AXRV53lbbhKfEY2EG5CcDl7GOsUqZRy24KcJnFypmlBd7v9dKrikBkKTtEq4FWZGKAneDqYiB
 B89bS84IAWWaQbW/BA//rMqjwsZnkh1dMdrHwtHL04ZBZf9SNkd0w2m8G7+Ph0PnhlcEKmkFb
 /iFCA6NpuIc+FI75F35MrIaU4aPf/InXJ9qnkGAcCEaTinxNTYUjrZwE5AqTeJgh24foP5ctV
 crwzKA5M69OAtL3/pAZMQjcDq1D9/aJ8cDem7tsCwkzQdyT+EHYMjHk/EboRxlkt4QMVkT7zp
 gNAit0ja5+qubeGjOeu40nwLFx4SjNNpJ+k8yNoDdfkYE8A7mj1PS3zvCLqv3tlSiung95SZC
 lIWaq7EZVWy74bGpDgbnNEvtDoK8ZuiBBaUSPf5eiQj8Oj7cwmktuDYkkMRz6vl8SYwmKtade
 CMLeBFXaJQC6rfq3AnBav6SoZHab8FgmXhTyIgB9wgQz7b+adEFcP12dvzWpLpUx20G+6U/nU
 20W+KLzl7xqIGj8WRNk/fuEdrzQVRuH1a+56aWAubBOK5LyMlBF8wyo33dU7Stq5BSwtQCODg
 Z89yWDB5o0WLD3/AaprPWdJrQcZpA1pfsn40y4TX/3f1XN5EcUPrNZVq11VB8+2lNWB4YvBXS
 1j8ERc2VjmhpAbmdKPvSxPS1AOBGvxvr7ExHR6BGyECRn1snxHS9WQCzVdu+N1ESKinLLlo4Z
 vm0D5GYFI0DRk8oUqIDj02P0l/tupz7aP1lPF+MTI7UZGBvq6rjQfunrrl9orATHXXapuLHWW
 7+FuaTwy1T8qXgCMHnGHPE/X/BmBpaskpmYHLDuJ2Bk+nCkwB0ImHA2aub1qSnlo2HeHt2piz
 +v+xPXPYKHZ4mRc5kH0IsHQ3SS0=
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Am 15.03.23 um 04:37 schrieb Andrew Kallmeyer:

> On Fri, Mar 10, 2023 at 2:28=E2=80=AFAM Armin Wolf <W_Armin@gmx.de> wrot=
e:
>> Hi,
>>
>> according to the embedded MOF data, the method id for retrieving the mo=
de data
>> is 0x1, not 0xAB.
> Thanks! I can see from your earlier email in the other thread that
> this is right. Strangely, when I tested 0xAB had almost exactly the
> same behavior as 0x01. I think you're right though, I have updated my
> local copy to 0x01.

Hi,

the reason for this is that most hardware vendors will omit any input chec=
ks
if they think they are unnecessary. The WMI interface on my Dell notebook
does the same, sadly.

> I have also fixed the missing cleanup calls and
>
>> Using wmi_evaluate_method() is deprecated as WMI GUIDs are not guarante=
ed to be
>> unique for a given machine. I think both WMI GUIDs should be handled by=
 separate
>> drivers, and the driver for the event GUID uses a notifier call chain t=
o inform
>> the driver for the data GUID that the usage mode changed, which then ha=
ndles the
>> input device stuff.
>>
>> This way the driver does not rely on deprecated WMI APIs, and everythin=
g would
>> still work should Lenovo decide to duplicate some WMI GUIDs.
> After reading many times, I believe I understand this and can figure
> out the implementation. How should I attribute the commits? Should
> this be a 3rd patch in a v2 patch series with myself as the author? Or
> should these drivers be introduced in one commit without the
> intermediate single driver that uses the deprecated API?

I thing the new driver(s) should be introduced in one commit. I am not sur=
e about the
new author of the commit. If the original driver was significantly altered=
, then AFAIK
you should be the new author. Still, the original author should at least b=
e mentioned
with a "Co-developed by" tag. You can then omit your "Co-developed by" tag=
.

As a site note, i recommend to use the get_maintainer.pl scripts under scr=
ipts/ to find
any additional maintainers which should be CC-ed. Since your patch series =
touches the
ideapad-laptop driver, its maintainer (Ike Panhc <ike.pan@canonical.com>) =
should also be
notified about this patch series.

> Also have I correctly set Gergo as the commit author for this PATCH
> 2/2 email like Hans said to? I wasn't sure if I had it right and I
> could fix it in the v2 series.
>
You are still the author of the second patch. Also you should not send a p=
atch series as
a reply to any previous emails.

>> acpi_dev_put() is missing.
> Thanks! Not sure why I thought it was okay to delete lenovo_ymc_remove
> but I have added that back in with the input_unregister_device call.
>
>> Maybe it would be beneficial to allow userspace to get the current usag=
e mode without having
>> to wait for an WMI event. This way, userspace could still react to situ=
ations like the device
>> already being in tablet mode when this driver is loaded.
> I'm not following how to implement this, not familiar enough with WMI.
> Could you explain more?

I meant that your driver should, after (!) setting up the input device and=
 event handling, call
sparse_keymap_report_event() with the code obtained from
wmidev_evaluate_method() so that userspace knows about the initial state
of the input device. You might also CC linux-input@vger.kernel.org for
the next patch series, so that the input driver maintainers can also
review your patch series.

>> If the drivers handling the event and data GUIDs are fine with being in=
stantiated multiple
>> times, then adding the WMI GUIDs to the allow_duplicates[] list in driv=
ers/platform/x86/wmi.c
>> will allow the WMI driver core to handle duplicated event and data GUID=
s.
> Is there an easy way to test if it's fine to run multiple copies?
> Currently testing by compiling the module with an inlined
> ideapad-laptop.h out of the kernel tree and using the insmod command
> to load it.

Drivers can be instantiated multiple times, and each time their probe call=
back is invoked,
and many older WMI drivers cannot do this, so the allowlist exists.
The section "State Container" in Documentation/driver-api/driver-model/des=
ign-patterns.rst
explains how to write drivers which can be instantiated multiple times.

If your driver is not a singleton, i.e. it can safely be instantiated mult=
iple times, then
you can add its WMI GUID to the allowlist.

