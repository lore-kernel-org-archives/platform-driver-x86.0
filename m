From: Ike Panhc <ike.pan@canonical.com>
Subject: Re: [PATCH] acer-wmi: check wireless capability on AMW0_GUID2 machines
Date: Wed, 25 Jan 2012 09:18:51 +0800
Message-ID: <4F1F587B.4070500@canonical.com>
References: <1326090677-25942-1-git-send-email-jlee@suse.com>  <3474148.WRXZ4siLlh@valkyrie> <1326103224.24116.282.camel@linux-s257.site>  <4607313.aZXtt4raMe@valkyrie> <1326255999.16788.40.camel@linux-s257.site>  <4F0DBEAE.4010707@canonical.com> <1326327709.18391.12.camel@linux-s257.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:46990 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754957Ab2AYBTJ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 24 Jan 2012 20:19:09 -0500
In-Reply-To: <1326327709.18391.12.camel@linux-s257.site>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: joeyli <jlee@suse.com>
Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>, mjg@redhat.com, platform-driver-x86@vger.kernel.org, Dmitry Torokhov <dtor@mail.ru>, Corentin Chary <corentincj@iksaif.net>, Thomas Renninger <trenn@suse.de>

Hi Joey,

sorry for replying late..


=46or ideapad s205, I work with bug reporter at

  http://launchpad.net/bugs/875659

The bug reporter do not attach the DSDT, but I have a copy of acpidump =
of s205 at

  http://people.canonical.com/~ikepanhc/DSDTs/acpidump-ideapad-s205.dat

and I backport this patch to 3.0 kernel and also cherry-pick=20
  acer-wmi: check wireless capability flag before register

and get the report which says the rfkill:phy0 is hard blocked by mistak=
e

  https://bugs.launchpad.net/ubuntu/+source/linux/+bug/875659/comments/=
33

so that I have another kernel built without touching ec register, just =
dont set ACER_CAP_WIRELESS
and user reports everything looks fine.

  https://bugs.launchpad.net/ubuntu/+source/linux/+bug/875659/comments/=
43


=46or ideapad s12, I work with bug reporter at

  http://launchpad.net/bugs/668234

You can find acpi tables at

  https://bugs.launchpad.net/ubuntu/+source/linux/+bug/668234/+attachme=
nt/1715424/+files/AcpiTables.txt

With patched kernel, rfkill:phy0 is also hard blocked by mistake and it=
 can be unblocked by toggling the hardware radio switch

   https://bugs.launchpad.net/ubuntu/+source/linux/+bug/668234/comments=
/12

Again, I need to confirm its because we touch the ec register, so I ask=
 them to blacklist acer-wmi. User reports it looks fine, but rfkill:phy=
0 hard blocked after couple of seconds and no idea why.

   https://bugs.launchpad.net/ubuntu/+source/linux/+bug/668234/comments=
/16


On 01/12/2012 08:21 AM, joeyli wrote:
> =E6=96=BC =E5=9B=9B=EF=BC=8C2012-01-12 =E6=96=BC 00:54 +0800=EF=BC=8C=
Ike Panhc =E6=8F=90=E5=88=B0=EF=BC=9A
>> On 01/11/2012 12:26 PM, joeyli wrote:
>>> =E6=96=BC =E4=B8=80=EF=BC=8C2012-01-09 =E6=96=BC 22:15 +0000=EF=BC=8C=
Carlos Corbacho =E6=8F=90=E5=88=B0=EF=BC=9A
>>>> On Monday 09 Jan 2012 18:00:24 joeyli wrote:
>>>>> I just checked and found I also have no AMW0_GUID2 machines on my=
 hand,
>>>>> now.
>>>>> I have some questions about AMW0_GUID2:
>>>>>
>>>>>   + Why we enabled wireless capability in acer-wim if a non-acer =
machine has
>>>>> AMW0_GUID2 ?
>>>>
>>>> IIRC, there were some bug reports on non-Acer hardware (I don't th=
ink this=20
>>>> involved Acer hardware, but this was some time ago...) where the w=
ireless=20
>>>> detection wasn't working with this, but if we forced it on, it wor=
ked fine.
>>>>
>>>
>>> Yes, in acer-wmi supported some non-acer machine by quirk and read =
EC
>>> register. That means we need find out EC register reflect to wifi R=
=46
>>> state if we are lucky.
>>>
>>> Unfortunately, direct enable wireless capability causes some non-ac=
er
>>> machines' wireless rfkill always disabled. e.g. Lenovo E520
>>>
>>> https://bugzilla.redhat.com/show_bug.cgi?id=3D674353=20
>>>
>>> If we don't check the wireless capability, then they need manually =
add
>>> acer-wmi to backlist. On some lenovo machines, ideapad-laptop drive=
r
>>> should support by lenovo's ACPI method.
>>>
>>
>> I've got two reports which says after poking the ec register, the ph=
y0 rfkill reports hard blocked by mistake. And few hours ago I get the =
third report says the similar issue. I will summary the report.
>>
>=20
> Please give more detail information (DSDT, EC register dump...), if
> poking the ec register can block rfkill, means the AMW0_GUID1 works o=
n
> this machine, maybe we can try to find out which EC register reflect =
to
> wireless.
>=20
>> I am thinking about alternative way
>>
>> Since we have thinkpad_acpi and ideapad_laptop, both of them have rf=
kill capability. If there is VPC2004/IBM0068/LEN0068 in DSDT, then it w=
ill be fine if we do not register rfkill in acer-wmi.
>>
>> Any thought?
>>
>=20
> Yes, it's possible a solution. If you can make sure lenovo machines h=
ave
> VPC2004/IBM0068/LEN0068 in DSDT, then I will generate a patch to
> acer-wmi.
>=20
>=20
> Thanks
> Joey Lee
>=20
>=20
>=20
