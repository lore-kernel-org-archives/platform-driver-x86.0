Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B13F8C433B4
	for <platform-driver-x86@archiver.kernel.org>; Sat, 17 Apr 2021 11:50:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8AF4C610CD
	for <platform-driver-x86@archiver.kernel.org>; Sat, 17 Apr 2021 11:50:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236188AbhDQLug (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 17 Apr 2021 07:50:36 -0400
Received: from mout.gmx.net ([212.227.15.18]:52151 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236009AbhDQLuf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 17 Apr 2021 07:50:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1618660188;
        bh=Pv+Gn02eStDd0pRUdSqzPriUqaPIdgGTueTyO/q3zCc=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=XS0RiS5B5rXfSWUL3L50bOZTgF4p2T+V+N61R6l+YlhXQ08nUXtRUJJ+/JgFeN79L
         d/+530YIOjv1qZfX6IFSCmaMOBkPbD+EljEbFEoH6m53DE1JQ7GKSVjNIScpcHkuVu
         QzCtVtN2C0bclwSPSGHaCjptzPWrTzMjyFXmtdO0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [10.135.7.100] ([89.245.206.196]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MDysg-1lQ4Ua10g0-00A1kW; Sat, 17
 Apr 2021 13:49:48 +0200
Subject: Re: [PATCH 1/3] thinkpad_acpi: add support for force_discharge
To:     Hans de Goede <hdegoede@redhat.com>,
        Sebastian Reichel <sre@kernel.org>
Cc:     Nicolo' Piazzalunga <nicolopiazzalunga@gmail.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Mark Pearson <markpearson@lenovo.com>,
        Nitin Joshi1 <njoshi1@lenovo.com>,
        "jwrdegoede@fedoraproject.org" <jwrdegoede@fedoraproject.org>,
        "smclt30p@gmail.com" <smclt30p@gmail.com>,
        =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>
References: <c2504700-06e9-e7d8-80f7-de90b0b6dfb5@gmail.com>
 <06f65bb5-eca4-c1ba-a8c2-b44f8a94c699@redhat.com>
 <3anWBvkrPqTNQyfx2ZwDaLZKXtw5PMwTTdcgGNt0FaACUSsrkb5PaoqVKxLpxXU-4NcVZ9AqDQLs2VMOmvS-KfxHRmOSQiZlMjyvH282mdQ=@protonmail.com>
 <20210408135102.6r2przibgngaavkp@earth.universe>
 <39c3436a-a08d-9530-3215-854148215312@gmx.net>
 <6f58903f-5219-9aff-78ca-33687e2e4147@redhat.com>
From:   Thomas Koch <linrunner@gmx.net>
Message-ID: <a2d850e9-789d-54e8-e098-1a0829504031@gmx.net>
Date:   Sat, 17 Apr 2021 13:49:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <6f58903f-5219-9aff-78ca-33687e2e4147@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+7h5aVqM3N0RASC5eZAjaYOga3lVEn7nGKp2ecxAHBzslY3ypOr
 y/NoijQsX4G4gaH5JvyhXwOt54Tr7PXyy56HSm4aMQp4tG2E3Qkiar59X52IAjyUZwppaMk
 XkuuXa7CScokbYEXPdc+kQilzkbytdXEpCe9i3tEx+5o5q3w1Kyt2iRUsK/6UOk1sffr6cv
 v63x62IlbWFHiM/K4X92Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:gKcXDzLyW5o=:dSqCmRV5F2VFIs8nyyIm+b
 tQlrR6LaecALsTPy0Key84b0a3RnVUn2O64mxnUhBXM/8nkP5ssPb3/ZIuJDZbjKDVzdRfOiI
 XGND198IQlWR8ZAK+Sl9Xto8cjrg6c81XKYYLLialxwYwyKG5NUmVp3i6f98Sf6kH3d+uuG4W
 uSwDWVXTWLIGcZSRl1QLQ5LDTAvj8LL9/l+52yIDezLyDBk67HkpAZy3mqZBu12PwIwsd1dPJ
 JNrWGeboRX43b1Co8WyGc9gPUT2QV4qysIEjlA9MXF0Gz0N74VnY63fbhyHRlBSt8iBoy4C1g
 ZV1YdOq1MpBhpRabiXPSV73o7x49YF8nUq+LyFUct7Az6VvV55gwAgL58B4fh6G+ooFwfyAod
 EdIlI6jpVh8PsQ5kiEFzcduFmQxGSkIA3wm/38470esiPPC6kjGrUUb7xqBw4umHndtzsDzch
 eN4gQ16pLnA1CQmEwj05ERgCexdFO9Xe69TpqY3KGdKrzjnO/M4GiFnPBt8wbusOV8n5SwnP3
 FyXGzFmzMz6kaY+3yaKS9Z5jf4SJjFhlRpCOBOws8mt1DPoIJmZIvEJ3U3Rqx+emTSC1is6F/
 0Cab6cR3kauyKYUN/yw5ijR35wQfhe22FtOCbBcJhECPa2As9EUFLUMxcSkaiTQPYWdga+e8p
 LB0SHR3vn/2Jf5MW6D6x7qurerrvnjge1hcAyfdTqOHYl422INVl6SzI/VqnfQ6xttCr5OX5w
 sQej3tM4mRKhtb7IcEbOOk0XGJWpFRLOP3e8+8cD49DmfDoOew2RKKL8+13PyaouAA2ToqpEj
 H4/lir1/zmtYKB3/t8KXgAr3Fg6afmXwHuU9328BzJs6H1uGLoHdzQg1ylX/5vdvjz8NUzJY6
 QPQKwOyFbpvnID430d73Bb4ssx5JEqAbvZvpxShwbbSvoCF8uhVfovPOVEUrdAP9mjpsQ/COr
 pqoATXqgubS5nN/vJNngHkm1capxEW3q7pd1emJq2uhUXsJSCxgbQ6tdRZfZV17w1wD5SsFbx
 aaYSIsYaFio8EDrmK7PM933hTG61B1/CZzbkT+qcWNHNm+xCAWDykjZOGiGekjmrzKAgkOcQ6
 pcT8RO+cNOpRaf8PycmDDc2gbN5Of48BtE2oTuyl3iuSOv5PYyqJnrDk/wiLbfiqQVhpsksvT
 1vtckBCmsv22m9E0Idc7TesZpWcbtdMjRmowiUiF6Bfk3pfLCqpycGysEFHGr3g437eK8=
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Hans,

from a userspace perspective, I don't think it's optimal to combine the
two features and the status. For example, how do I find out which one is
available?

I have to test the writability of status and then still don't know which
one is available. Seeing if force_discharge or inhibit_charge are there
is much simpler.

And then enabling that: triggering force_discharge by writing
"Discharging" is ok. But for inhibit_charge we would need a new status,
something like "Charging inhibited". This then causes problems for the
existing userspace, says: upowerd could not handle it. You remember the
"Not charging" patch from Ognen?


=2D-

Freundliche Gr=C3=BC=C3=9Fe / Kind regards,

Thomas Koch



Mail : linrunner@gmx.net

Web  : https://linrunner.de/tlp


On 13.04.21 10:05, Hans de Goede wrote:
> Hi,
>
> On 4/9/21 8:33 PM, Thomas Koch wrote:
>> Hi,
>>
>> On 08.04.21 15:51, Sebastian Reichel wrote:
>>
>>> IIUIC you have 'force_discharge', which basically means the system
>>> is running from battery power despite an AC adapter being connected
>>> and 'inhibit_discharge', which inhibits charging, so system does not
>>> charge battery when AC is connected, but uses AC to supply itself
>>> (so battery is idle)?
>>>
>>> We already have this kind of features on embedded systems (which
>>> often provide all kind of charger details). Those drivers solve
>>> this by having a writable 'status' property in the charger device:
>>>
>>> What:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /sys=
/class/power_supply/<supply_name>/status
>>> Date:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 May =
2007
>>> Contact:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 linux-pm@vger.kerne=
l.org
>>> Description:
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 Represents the charging status of the battery.=
 Normally this
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 is read-only reporting although for some suppl=
ies this can be
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 used to enable/disable charging to the battery=
.
>>>
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 Access: Read, Write
>>>
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 Valid values:
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Unknown", "Charging", "Dischargin=
g",
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Not charging", "Full"
>>>
>>> If I do not miss anything writing "Discharging" is the same as forced
>>> discharge and "Not Charging" (AKA Idle) is the same as your inhibit fe=
ature.
>>
>> There are ThinkPads with two batteries (BAT0, BAT1) and the hardware
>> allows to select which one to discharge. An approach through
>> /sys/class/power_supply/AC/status won't cover this.
>
> The mentioned status strings come from /sys/class/power_supply/VAT#/stat=
us,
> rather then from /sys/class/power_supply/AC/status.
>
> There is one problem though, which is that the status attribute is being
> managed by drivers/acpi/battery.c. There is infra for a driver like
> the thinkpad_apci driver to add new attributes to a power_supply but
> AFAIK there is no infra to say intercept writes to an attribute where
> the reading is handled by another driver.
>
> I guess we could add some special hook to allow another driver to
> intercept status writes.
>
> Sebastian, what is your take on this ?
>
> Regards,
>
> Hans
>
