From: =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>
Subject: Re: [RFC 0/4] Asus Wireless Radio Control driver
Date: Sun, 20 Dec 2015 14:01:47 -0500
Message-ID: <CA+A7VXXE-xNHTGAFwkDH7VAkNA-jhrFxpqGHx=MFAQieMOEr-w@mail.gmail.com>
References: <1450193442-7930-1-git-send-email-jprvita@endlessm.com> <20151219080047.GG7244@malice.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-yk0-f194.google.com ([209.85.160.194]:35477 "EHLO
	mail-yk0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750716AbbLTTC1 convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 20 Dec 2015 14:02:27 -0500
Received: by mail-yk0-f194.google.com with SMTP id p132so10254794ykd.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 20 Dec 2015 11:02:27 -0800 (PST)
In-Reply-To: <20151219080047.GG7244@malice.jf.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Corentin Chary <corentin.chary@gmail.com>, platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@endlessm.com>

On 19 December 2015 at 03:00, Darren Hart <dvhart@infradead.org> wrote:
> On Tue, Dec 15, 2015 at 10:30:38AM -0500, Jo=C3=A3o Paulo Rechi Vita =
wrote:
>> This series is a request for comments on the driver for the "Asus Wi=
reless
>> Radio Control" device, as named on the vendor website, which handles
>> notifications from the airplane mode hotkey and drives the airplane =
mode
>> indicator LED. This device appears in the DSDT as "ASHS".
>>
>> When the airplane mode hotkey is pressed a query 0x0B is started in =
the
>> Embedded Controller, and all this query does is a notify ASHS with t=
he value
>> 0x88. ASHS also has one method HSWC, which can drive the airplane mo=
de LED and
>> query its status, according to its parameter.
>
> Hi Joao,
>
> Thanks for a detailed introduction, very helpful.
>

Thanks!

>>
>> To properly drive the LED a new RFKill trigger was implemented, to t=
rack the
>> global state of all RFKill switches in the system, and turn the LED =
ON when all
>> are blocked, and OFF otherwise. This code will have to go through re=
view on
>> linux-wireless, but first I wanted to get feedback on the WRC driver=
 itself.
>
> Apologies, I see I jumped the gun on this. I was rushed this afternoo=
n and was
> trying to avoid being the bottleneck. At least we won't have to wait =
long for
> Johannes to decide after we're done with the review here.
>

Yes, that will be helpful.

>>
>> There is one known issue: the airplane mode LED uses the same ID as =
the WLAN
>> LED in asus-wmi, so at the moment to have the LED being driven corre=
ctly by
>> asus-wrc I have to disable asus-wmi. Even with wapf=3D0, which does =
not register
>> a WLAN LED in asus-wmi, the conflict still occurs because
>> ASUS_WMI_DSTS_USER_BIT is set. Please advise on what is the best way=
 to solve
>> this problem.
>
> I'm trying to make sense of these two, what is the common ID?
>
> I see asus-wmi.c uses the dev_id ASUS_WMI_DEVID_WLAN_LED 0x0010012. T=
he  ASL you
> reference addresses 0x0203000F in OWGD and OWGS, but I don't yet see =
how they're
> the same thing? Is this buried in the guts of the wmi system?
>

Sorry, I meant to also add a link to the DSDT in this letter but
forgot, here it goes:
https://gist.githubusercontent.com/jprvita/7dbd3a6aa1a9ac085b62/raw/03f=
83b94dbb73c8572012f7ca7621ea3d862fed1/asus-x555ub-dsdt.dsl

Bellow is the relevant part that I think causes the conflict. In the
WMNB method of the wmi device, we have:

                    If (LEqual (IIA0, 0x00010002))
                    {
                        OWGD (IIA1)
                        Return (One)
                    }

Because ASUS_WMI_DSTS_USER_BIT is set, asus-wmi uses
ASUS_WMI_DEVID_WLAN_LED to store the RFKill state, which ends up
calling OWGD with the WLAN state (which is the opposite of the
airplane mode status). At least that's what I could follow, but I
certainly appreciate any input on that.

> Regardless, it seems an update to asus nb wmi quirks so we don't setu=
p rfkill
> with the wmi driver at all. It would be preferable not to have to do =
it based on
> DMI strings. Corentin, any insight you can offer here could be helpfu=
l in how to
> identify these types of systems so we don't have to enumerate them on=
e at a
> time and make asus-wmi and asus-wrc play nice together.
>

I was actually thinking of something like checking for the ASHS _STA
method, or checking for ASHS presence, although I'm not sure if that's
easy or doable at all. A DMI quirk would certainly work, but as you
said, we would have to list all conflicting models.

> Joao, it would be nice to consolidate on a naming scheme. hp-wireless=
,
> dell-rbtn, *-rfill, etc. One of these should work for asus. Mousou us=
ed
> asus-wireless which I'd prefer over another new term like wrc.
>

The name of the Windows driver for this is "Asus Wireless Remote
Control", that's where I took WRC from. But I don't mind changing it,
asus-wireless seems appropriate to me, and unless you have any other
preference, I'll go with that for now.

>>
>> I've chosen to make this a separate module because this is a separat=
e entry in
>> the DSDT, and checkpatch told me to add an entry in MAINTAINERS in t=
his case.
>> Please let me know if any of this should have been done differently.
>>
>
> Are you willing to be the maintainer for this driver? A response to p=
atches to
> this list within a week or so is all that's really required. This sub=
system
> depends on people with the hardware to help keep it it good shape.
>

Yes, I am. Also, it seems the company I'm working for [1] will keep
enabling a few Asus laptops in the near future. This means I'll get my
hands on new Asus laptops from time to time, or will be able to ask
for other people on the team to do some tests on them, but it also
means I'll not keep any of these forever. I feel that this will work
fine, but I just wanted to be clear about that.

[1] http://endlessm.com

--
Jo=C3=A3o Paulo Rechi Vita
http://about.me/jprvita
