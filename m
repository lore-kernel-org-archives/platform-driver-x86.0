Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF5DEC77B70
	for <platform-driver-x86@archiver.kernel.org>; Mon, 17 Apr 2023 13:06:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230097AbjDQNGp (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 17 Apr 2023 09:06:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230509AbjDQNG3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 17 Apr 2023 09:06:29 -0400
Received: from mout.web.de (mout.web.de [212.227.15.3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E92DD332
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Apr 2023 06:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
        t=1681736551; i=julian.winkler1@web.de;
        bh=ByAYLJtw7JzcTchZQmKLDjAH6rxwrDvw2hU9IioEiew=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=ZXF7Iiz0eGAuKGhZockfjMqiGqPncV3z0gN0aFWE4vy6fpf73W4SOp7oKiZAeP1Le
         Le7RHXHiqrHzJIn2m6DOGUfcz9C27bsvXr06RY2p/v7E61JAWKFdYFPIP0Jj8sZAuP
         ztrfK3MUg/drQHZUCG5LJ5yD7YX+CIaaJUOf/erE8ZOHEhgPeUfI6MGznxE0j0pRa0
         2jTTDOx0LNo+Ij3Y/2h7q/deFaoMlKwj5JGa+WJM+UN7JdwuBgS2KSDwS7hR3Fs1+d
         m8f7OoUzSg7Hnjc/qDIuY6B2PA0GBb0Kxz9ebhY5Y6DtJl7N1FbG+fRBC6/WFzZ2w7
         O8ZfDBucP3a9w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [149.222.207.209] ([149.222.207.209]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mv3US-1qfGAZ2trU-00qxQC; Mon, 17
 Apr 2023 15:02:31 +0200
Message-ID: <a52ab618-97ea-04ea-01e4-ecb673f45f09@web.de>
Date:   Mon, 17 Apr 2023 15:02:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] intel_scu_pcidrv: add back PCI id for Medfield
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     platform-driver-x86@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
References: <20230416154932.6579-1-julian.winkler1@web.de>
 <6a2a97d9-140c-3e4f-aa12-c98f928f7481@redhat.com>
 <CAHp75VfFptZcJn7c_a2GLnSqJDXBwvUqWmu9Wb19a3VvwXJS5A@mail.gmail.com>
From:   Julian Winkler <julian.winkler1@web.de>
In-Reply-To: <CAHp75VfFptZcJn7c_a2GLnSqJDXBwvUqWmu9Wb19a3VvwXJS5A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:viWzEXw7bgzeqDwOSop2sQAuOCvc5bLxvn1LOqAN0r1Xzy1Ikhf
 A9j13X5Evk0CxmuIdR58A+cqcL46B7LwRRCWTTIHqs+vF6zqA4uCEQrjKGIuCc2Hb/2SVsw
 +LRLgtNjpSdyl3TXeAFBL+5wMnGnFHTMfkYhgYXmz21mqk4cIlHt19QJqi5rIb0XaAW5ukt
 t+1DvTCeG2G5lBclP91og==
UI-OutboundReport: notjunk:1;M01:P0:jSdzdVYzCVM=;iBhSGun3dGqQ2impvEPNiH2fviP
 Iik3NBaMTu9gcUBO2aXfjA1xEVU3KFvqxzl8elGzciEE0U8DTNu2VWyY3sRAcL4mxND+IER+V
 fg+y9UG3L4r8b8hQXbF8N5hgksHC/g3BOTcWvTqx3pc1otUW7cVpkwzDi2yQDRZlstoC3VT8X
 8vS3xw3AxcOtoY4JAQFrNvGz+zEZsy2Pp2wAKgk7vRCvC7eM8clOISHo41TS/XPUfBpk4sn0G
 DInaCUo/iqjpek65S1qMO1l1NxOOT43ceXv9dWepmsxrQHj9A+NoUDoHAkehDWJrbJpD0PmUQ
 4tZWAWZwXpMX/hbaFlUHmyvONO8in92Jr7E1SZJIC9l1H0kvTWETvgDJCcnm1Sssz+FTYDxQc
 ZFbgLkPQrRFnaAuDHJ3Ms+kCv18X0Pl+NtsQZSd0gmr+iMi+jPxoFBTwVfuamcEHl4Elku8p3
 uUrMW2r5MpkR4U6pihyvM8WE9I3c0WrgtMQXkUeFnDN4Grtsf8Js2OAoiH1VojpX3Q08iRFbC
 yTrt7G0DKojNnQFdDwt2tBvmq0B4TsJLCOBGdtBO40W9oSpGcEDZ1zMW9UEKSsRkcQLK2b3BG
 fGfMy7fuhrtR769DPZMGPVsjNqz0hT8RGlpifImH9eTQ8uKljkbOd/JDfitnhvJUtMiRpNW6F
 /pzFCg3p5b/nFk7eSLzE2Gu0BSqA1Wc3Rqv4DJB7ONkIQsb+l3TMGb7+R6E9MrcpniitlQbIA
 uUbTAZdrUKbEGZ0tpk72QjXPUvQgkpRs93kcWy2GU1wXs58VMgOkNupi0ly/1QgRYFIyBZZ0i
 EyNevxqqp31JEsdNOtuUnvSGivoyZQ2i4HUlJFrk/tpzdFcjE/9F1q/VErFao5od7eZgWPYU5
 OujbHwizpxED4Zs0xAkaYTK9z54tGkkWCBEwSLG8KgI1TO6px17MeCynGqj2Ph7cFysezYkoZ
 mBQlyCQoYtoBSo2hMIT4lRq8YBE=
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 17.04.23 12:16, Andy Shevchenko wrote:
> On Mon, Apr 17, 2023 at 1:11=E2=80=AFPM Hans de Goede <hdegoede@redhat.c=
om> wrote:
>> +Cc Andy, Mika,
>
> Thanks for Cc'ing me.
>
>> On 4/16/23 17:49, Julian Winkler wrote:
>>> This id was removed in b47018a778c1a18cbc98b4a11936dec4f8c4bb7b, sayin=
g it
>>> is only used on Moorestown, but apparently the same id is also used on
>>> Medfield.
>>>
>>> Tested on the Medfield based Motorola RAZR i smartphone.
>
> Wow! This is surprising.
> Can you tell more about your test environment? What is the Linux
> kernel version in use and what is the userspace (AOSP, Buildroot,
> Yocto, custom)? If custom, more details would be nice to hear.

The test enviroment is postmarketOS. You can find more details on the
Wiki page
https://wiki.postmarketos.org/wiki/Motorola_RAZR_i_(XT890)_(motorola-smi)

>>> Signed-off-by: Julian Winkler <julian.winkler1@web.de>
>>
>> Hmm, so this is a former SFI platform, from your:
>> https://lore.kernel.org/all/20230223060107.23029-1-julian.winkler1@web.=
de/
>>
>> patch I guess the plan is to use some custom bootloader
>> and then use x86 with devicetree support to replace SFI ?
>
> That would also be nice to hear in detail. With other Intel MID
> platforms the decision was made to pursue ACPI (and U-Boot, as an
> example) supports that for Intel Merrifield platform.

I boot a 5.10 kernel, which still has SFI support, and from there I can
boot latest mainline kernel with petitboot, kexec and devicetree.

>> Do you already have this working ?
>>
>> Sorry for all the questions for what is just a simple PCI-id
>> addition. I guess I'm worried this is just the tip of
>> the iceberg for getting medfield support back into
>> the kernel and I'm a bit worried about how much maintenance
>> work this will cause.
>>
>> E.g. also see commit e1da811218d2dc ("drm/gma500: Remove Medfield suppo=
rt")
>> which I guess you will want to see reverted too ?
>>
>> That is an example of a lot more code to bring back
>> then just a single PCI-id addition.
>>
>> Don't get me wrong I'm all for supporting older hw
>> if there are users who are interested in actively
>> maintaining support for it. I just want to get a feel
>> of the amount of work this is going to involve.
>>
>> Andy, Mika, any remarks ?
>
> I'm not against a patch if it helps existing users, but we need to
> understand first if it will be really helpful for upstream (taking
> into account 32-bit Intel MID support removal).

My downstream kernel tree can be seen here:
https://gitlab.com/julianwi/linux-intel-medfield. Indeed, I needed to
bring back some removed code to get the display working, but even
without display driver, old smartphones can be used as a server or
Raspberry Pi replacement.
