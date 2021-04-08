Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76CEAC433ED
	for <platform-driver-x86@archiver.kernel.org>; Thu,  8 Apr 2021 18:19:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3A63B61108
	for <platform-driver-x86@archiver.kernel.org>; Thu,  8 Apr 2021 18:19:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232267AbhDHSTb (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 8 Apr 2021 14:19:31 -0400
Received: from mout.gmx.net ([212.227.15.18]:56007 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231676AbhDHST3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 8 Apr 2021 14:19:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1617905937;
        bh=Ki8F9aoZGsc8sYK1np4A+b1L5wPi4wM1eAp3NmOl34w=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=UBCN26siRSKz25/qAfPVNIGcoJrP/JVNCN9tvdCp4oO49khM+Rj8TeR2J1pav/7aB
         lea5nLqdEmggfCjHRwk9e/Dy4gtN0pgJC9YleuS0F5aRqmZTaDOQ5KM5Kif+Yrb908
         Ky/+7C1ewQiUDnQ8FdnH/48TgZGVsdBMvwmLhkx4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [10.135.7.100] ([89.245.126.190]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N8XTv-1lhbzE1ctF-014Wi5; Thu, 08
 Apr 2021 20:18:57 +0200
Subject: Re: [PATCH 1/3] thinkpad_acpi: add support for force_discharge
To:     Sebastian Reichel <sre@kernel.org>,
        =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Nicolo' Piazzalunga <nicolopiazzalunga@gmail.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Mark Pearson <markpearson@lenovo.com>,
        Nitin Joshi1 <njoshi1@lenovo.com>,
        "jwrdegoede@fedoraproject.org" <jwrdegoede@fedoraproject.org>,
        "smclt30p@gmail.com" <smclt30p@gmail.com>
References: <c2504700-06e9-e7d8-80f7-de90b0b6dfb5@gmail.com>
 <06f65bb5-eca4-c1ba-a8c2-b44f8a94c699@redhat.com>
 <3anWBvkrPqTNQyfx2ZwDaLZKXtw5PMwTTdcgGNt0FaACUSsrkb5PaoqVKxLpxXU-4NcVZ9AqDQLs2VMOmvS-KfxHRmOSQiZlMjyvH282mdQ=@protonmail.com>
 <20210408135102.6r2przibgngaavkp@earth.universe>
From:   Thomas Koch <linrunner@gmx.net>
Message-ID: <f90b03c3-178e-0d0b-335e-6e5c0e6f284e@gmx.net>
Date:   Thu, 8 Apr 2021 20:18:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210408135102.6r2przibgngaavkp@earth.universe>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:RKkVopUEdFbYMg+apN9YphfoakSrQoI3cDLRYpvfl8zualgg2yV
 S9iyQBOasKxZ8JSwBUBdbKsgUYjzWmzBEg5aN/hCcE9YafwZjsG6QFunUxja7KtnNBo3jmd
 PeXGVF+JMW4emXUULUCTkM/rGGR/zghjw0YO0T8abcNukE0hyD4Vo3D71Wtx5XYQFtkgmhK
 IHMFloC/vQEtgqgIQ09Bg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Gp/6pWfGZ0Y=:/pIb2kNHsWbrzcd+SOzs57
 UPS/E7iyqh+8ztSkj/0x9rW3IrLOT46/1lgNSU2K/S+PBE0gDc+5F5OhTk4yTjJDIMZIqu/0u
 4apGz12ro3yYkiLRfS2uAlQHO+Kb3XUR/YLpsxluv8qPDBme/uaZuDWIJxAcmhMaUWGdlsO/f
 9oFEUNYS9Ve2xhRdnloQlTghGxui2ZNcmJrvqrerORknnjDajA5ekzgzUOhpolD1jgLmlkgZf
 qBelgT1BbDi4L3BK4s7CfzSbPKbxtWbyGPi21OoMCk8eKA/p3HzKnVWfaVQxuMRZw51oYwrzb
 l0BnHgbNGQuArqESiKZ14UDuRvdEiwJNB3tAHfijGGcaFFRAHDDLQPPPbuzz1l0JyfIIrnxzc
 YF370b1qa5be0btNJESI42SrdNLesdEgJ8NEItnTZtX/+jCqkKC5YxUJS907fwvscZ7qzlWge
 d7vIeCpbWwNI/ANJpJR1AEaoW5YT2ATkA85f+wYUv/jnM8qJn3KXBJ9BIBgt0Yjp46telJ7eZ
 7DunTjc2cfkxWzPQNusB021zluJ57vGYqz4FKugo/jhEHBKz9+H/SkHFEkSy5kYa8RI1doMOe
 hTT6dMRPhY2rDBxvkMbzvs+KXTS2Iq6RS0bngNr4Y30LwS4NFpxdQ6Zd5GNy7sa+sWUfw0rvL
 eBbbq2JxolgYGqtYLpQwjruEginNGshVH/pjyVXy+Y9qRASkeRJrwFALC/aXb9bT+x2jZQ2Xk
 ysOnxrIKRbFlzI1+Ho3mbmnp3S9ouBd+8Pplhs4JfPEoDXOMuKYVxGmRPEPVvZ7YmcLgUvJXC
 GJSIfvvSBdDGSU9AbDL31pKIl+dAt8R8c42qyP9qkxKPOVXi5aI8kYke3RmVfOp+JxTvZBz5H
 pFP5Q3Pk88X0xrnqobyCTYvNp121ajnTRB2l6EOUibSr481Cl0vNgGn+xfjMTlDE1Ds2vWd3s
 VlOx7kdRt1Tn10LoGrSUMxOjoEP/RAzK2UL7GH+cuzd2T8vLhqqt2zEq2itjprBByqE16WVqH
 2L1ADchW+XNbQ9YQU0VovR98P8EBYMBKLiLBOmyj/v+PhxUUEe1vImvrcqA4XREAdr14MbpN2
 ud9W3Qam1DHgWsenOhkL3CIkFG2yUpNZ4kxwQtqk7amrXlegnvefV7NaW4XGmcbzkMcMsl+qE
 0KE5Cky/e/nkqJV6ZeiYmVlVCIZaiYSZiQvav0D54UK/mOd/wA6v7MT1JXs9CwzbJSZHY=
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

 >> "inhibit_**discharge**"

 >> "stops **charging** of the battery"

 >> I'm wondering if it should be "inhibit_charge" or something like that?
 > Text and file name also seem to have reverse meaning for me. I

 > assume the text is the correct one, since it does not seem to

 > make sense inhibiting discharge. That would result in instant

 > poweroff on AC loss?


Fortunately that's only a typo in the docs file. The actual sysfs node
implemented by patch 2/3 is

	/sys/class/power_supply/BATx/inhibit_charge


=2D-

Freundliche Gr=C3=BC=C3=9Fe / Kind regards,

Thomas Koch



Mail : linrunner@gmx.net

Web  : https://linrunner.de/tlp


On 08.04.21 15:51, Sebastian Reichel wrote:
> Hi,
>
> On Wed, Apr 07, 2021 at 10:33:41AM +0000, Barnab=C3=A1s P=C5=91cze wrote=
:
>> 2021. =C3=A1prilis 7., szerda 12:24 keltez=C3=A9ssel, Hans de Goede =C3=
=ADrta:
>>> 2. If we add support for this to the kernel we should probably
>>> first agree on standardized power-supply class property names for
>>> these, rather then coming up with our own names. ATM we register
>>> 2 names for the charge start threshold, the one which the thinkpad_acp=
i
>>> code invented and the standardized name which was later added.
>>>
>>> I've added Sebastian, the power-supply class / driver maintainer to
>>> the Cc. for this. Sebastian Nicolo wants to add support for 2 new
>>> features as power-supply properties:
>>>
>>> --- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
>>> +++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
>>> ...
>>> +Battery forced discharging
>>> +--------------------------
>>> +
>>> +sysfs attribute:
>>> +/sys/class/power_supply/BATx/force_discharge
>>> +
>>> +Setting this attribute to 1 forces the battery to discharge while AC =
is attached.
>>> +Setting it to 0 terminates forced discharging.
>>> +
>>> +Battery charge inhibiting
>>> +--------------------------
>>> +
>>> +sysfs attribute:
>>> +/sys/class/power_supply/BATx/inhibit_discharge
>>> +
>>> +Setting this attribute to 1 stops charging of the battery as a manual=
 override
>>> +over the threshold attributes. Setting it to 0 terminates the overrid=
e.
>>>
>>
>> "inhibit_**discharge**"
>> "stops **charging** of the battery"
>>
>> I'm wondering if it should be "inhibit_charge" or something like that?
>
> Text and file name also seem to have reverse meaning for me. I
> assume the text is the correct one, since it does not seem to
> make sense inhibiting discharge. That would result in instant
> poweroff on AC loss?
>
>>> Sebastian, I believe that this should be changes to instead be documen=
ted
>>> in: Documentation/ABI/testing/sysfs-class-power
>>> and besides the rename I was wondering if you have any remarks on the =
proposed
>>> API before Nicolo sends out a v2 ?
>
> IIUIC you have 'force_discharge', which basically means the system
> is running from battery power despite an AC adapter being connected
> and 'inhibit_discharge', which inhibits charging, so system does not
> charge battery when AC is connected, but uses AC to supply itself
> (so battery is idle)?
>
> We already have this kind of features on embedded systems (which
> often provide all kind of charger details). Those drivers solve
> this by having a writable 'status' property in the charger device:
>
> What:           /sys/class/power_supply/<supply_name>/status
> Date:           May 2007
> Contact:        linux-pm@vger.kernel.org
> Description:
>                  Represents the charging status of the battery. Normally=
 this
>                  is read-only reporting although for some supplies this =
can be
>                  used to enable/disable charging to the battery.
>
>                  Access: Read, Write
>
>                  Valid values:
>                                "Unknown", "Charging", "Discharging",
>                                "Not charging", "Full"
>
> If I do not miss anything writing "Discharging" is the same as forced
> discharge and "Not Charging" (AKA Idle) is the same as your inhibit feat=
ure.
>
> -- Sebastian
>


