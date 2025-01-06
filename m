Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80AF5145A11
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 Jan 2025 22:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736202589; cv=none; b=BnEtAkJqXTInvXmoRsFV7mXEm13oFx+/aB6Nn7wTZv1jT0N5NpLSn/uXJNISK42gqoIDll3dLM/eGYgzYICd5EkKnq+6cWTtsS7JlB4il6filNPRtlbO0lR/4Uizkn1U3cRDzNGU/D79G+23YushEbBFE94hT1jFNIEfPV6xTbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736202589; c=relaxed/simple;
	bh=GhksACJmEcEmILc/S299rrfiIUYwZ7IURrggNwKwCyg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gf4v1FhXdHX86mulNmqu/KYnRvJcK/ZF42ZpUFQXaC2bJBXDuFbD8kTWXM97GMy7R99H5fZEuoz3l51qgDIPm1lSVsem+2/KTkYUr/KuqqLGWZfZXSGM10325IvIqyfLSxn6zchW5bRuSgnIqRu6BOXF9L+G4QhCdb0708Jpbuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=Jupd5+uz; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="Jupd5+uz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1736202582; x=1736807382; i=w_armin@gmx.de;
	bh=zVhtejOf4DuYSwlo3r8lMidXEEe3Oo8pihPuVpg5rhk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Jupd5+uzO37EJ7Xpv1PUtZnWPpsayTlzaWb1LvJKXv0WdUnD9yHLJPGOJCB6xFwg
	 A+RQGVAiyKoqgjn4HLf4Suy/MrNo9tR7uy0FfTDM2shgtwO9kgnALJ45KR08KnGZq
	 7MJAI/Kv/y8iEdu53qwSfXILhbZOhE7A1tJHV/ZIUHcA/HkwFhSM2uERaRvvfJiEl
	 lF/QawlJ4Hh8ENK+u9Rl2fmD+Elq1dIC4om86dJS33sOH5z5Ck7IROev2VHLWtoQ6
	 EcGf5SliNDs4F8GHmWVzYV9T1A1CvHmdJIKvtpU8n5D5JOtBNcMEh0CyhEceKH7ww
	 pQ+MI8+MRzrp0wHsnA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MXp9Y-1swm41316S-00XMCn; Mon, 06
 Jan 2025 23:29:42 +0100
Message-ID: <c96e313e-9be2-485b-929b-4eedb9509417@gmx.de>
Date: Mon, 6 Jan 2025 23:29:40 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: acer-wmi: Nitro button doesn't produce a WMI event
To: Hans de Goede <hdegoede@redhat.com>, Hridesh MG <hridesh699@gmail.com>
Cc: platform-driver-x86@vger.kernel.org
References: <CALiyAom1xDH6A0Q2WNHCMUcpMJfM3pXO2DaW=bgHGUi8ZOpBbQ@mail.gmail.com>
 <8b8749c1-59c8-4f95-a43e-055cf94f9597@gmx.de>
 <CALiyAo=R1kcvwRpw22s=YU0YHUxR8T_WHLwSvDr=8Ahsenn-jA@mail.gmail.com>
 <9c625119-e46e-464b-933d-9c836577f454@gmx.de>
 <CALiyAo=7kVi4ipA5-xDfRYQ-gqyza0woYHUzwGuW5BccLOVHgg@mail.gmail.com>
 <209f39ab-a312-45b5-981c-8324d9b8cd90@gmx.de>
 <CALiyAon+5H_g1V-iNbjdLmjgYDJng+ePH0XeoYxijYurHj+uTg@mail.gmail.com>
 <31c28ea2-881c-42e3-b754-8b52ca7f63fd@gmx.de>
 <CALiyAo=_vGu50RoAPwFMv9J=mkaQWojAQxmB2qmwcEZ5Y8kfSg@mail.gmail.com>
 <583bbdfe-5c5a-4541-b30a-97eb89f2e4c3@gmx.de>
 <CALiyAo=Y1rh=OpTete0N=q2DrFh8CL449xAfSxfJuju+5tc_mQ@mail.gmail.com>
 <ceb159f1-2900-4946-a9c9-088ba99d2d67@gmx.de>
 <5d2ee19b-eb78-4c67-9a5f-82859d8ae8bc@redhat.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <5d2ee19b-eb78-4c67-9a5f-82859d8ae8bc@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:iiJyFNjRrZ51+KwRZf446wwy1nK0LM8D88aPioJIN9fMmPw/n8b
 aNazwRDG0JxG0pzopZZB9bslScTAMZ5+7js7p9srDZ1S+pOoIxjW0AR5dgwyIgpzZnbs0D6
 75uQSAQhM1AyL4nNbJZkbD83UZzkqpQgt4ybWUdfuIZEmEBY6PSi0T4n5K9QVyYc959lqTV
 d46fndBPELPa3ULQJbKJg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:RMuY/RU+HZQ=;gTBva4p0Ow6O6PWOtN4WFFhKMmA
 Gy4mzNRjhAXDfAZ07JOglvH0ktBu/7wa8685fZmDKcMEZUbR/RfWCNi0nok9rd+iuHffL/tV3
 vdR0kgkPzoHOJfgEi3bvuauP3VdijzCHDKiwG2+eNRqMeca/S8Vz+XAUGy0a0SpvdHF+zONSG
 v0/MQPAV36Ow0w9PJiPYD5U0I9JNVo2ZI0E8O3Tv420sH9KDhSjQL0ZoJdKrK4o/cECiQKQX0
 a9gmoAym4sIuTEEG3IlaP8R1tmP9HX7h2yEze5bAhMjhJ+JJNkggg5YyXFHHgg7S69/r4fKc/
 OxGZ3UGNFtBQbs3Gx1e620cZcWAXfZ9Dj/nKZPU4FmuapdLZBwp/7uoncA4j0E3e0scoIZos7
 xhh+SNHvHzKne53LJ61gXGMBUTYDBXVNme6ezzgZdAdMaiqvVb9KgzrYaCMpObwykjP/OXeyi
 EWN8uL3L7MpisPJKS9/5RV7uev+jf976nJqwhU+TgHiQ5cmPlOxfCKXwMzuS2mbCygASfLD4M
 0Fl7AHYSHzPW44X0EtHsldWcGOcyVoVuwiaBYcUCLd084LlGeX8nNOnpiupoZzRIxCgyRdfI+
 KNeNHHRS+uRVAvgTHV0PpW6U53jO4U6MA0vIykqLRSkCpYWQwStMTYIqMa/qUOrKLKe1rSDbt
 fE7Qs8LU0fFMRDKpbYcY0VmL5C0sCjUCMXo9D3Irsufc0z8gLqlq1R9FFyWXsCTWCyl2BLhHx
 Df3gBPlzLucHZSmsuYJa7FqFRdq9rlWqh/G7UR/cW+3HC3X0pTOLXCo/AJ2/8nJzG1qfbpRju
 wKsBHC0767lz51krlFwDuA07dgq9J3c/pPJ+v5A9OzmBW0YpIFujWlArKVoGityOoVuaPUIuH
 cHt1m2qtoo4evkLnJE3w4qPpvQNgD4ftudG49WdVjdXM+yPewXV5mCP5RfpctcuwFc2zsDdJn
 a9nzg13KIV4SWr2Vj59Na3v2dBXWBeubwuDPCfqQs5IYS+i+eY74/5ng997BqjouKc04e8sy2
 MBkzg9Dzeov36LTt197iPIpf3/ep+kSaUaKxIlc+gC4z2eRZJRtz/WLjVUnSIeffafWKe/uYd
 496RZRlXPeYZ07gbDWLD1RZEUtO53k

Am 06.01.25 um 19:33 schrieb Hans de Goede:

> Hi all,
>
> On 6-Jan-25 5:59 PM, Armin Wolf wrote:
>> Am 02.01.25 um 07:18 schrieb Hridesh MG:
>>
>>> On Thu, Jan 2, 2025 at 1:51=E2=80=AFAM Armin Wolf <W_Armin@gmx.de> wro=
te:
>>>> Am 01.01.25 um 20:53 schrieb Hridesh MG:
>>>>
>>>>>> This ACPI method should trigger the turbo mode button (found inside=
 the DSDT table):
>>>>>>
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Method (_Q5=
8, 0, NotSerialized)=C2=A0 // _Qxx: EC Query, xx=3D0x00-0xFF
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Debug =3D "=3D=3D=3D=3D=3DPROJECT_QUE=
RY_58=3D=3D=3D=3D=3D"
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^^^WMID.FEBC [Zero] =3D 0x07
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^^^WMID.FEBC [One] =3D 0x04
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^^^WMID.FEBC [0x02] =3D One
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Notify (WMID, 0xBC) // Device-S=
pecific
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>>>
>>>>> I feel like an idiot right now but I just realized something: So far
>>>>> I've been assuming that the button I've been calling the "Turbo
>>>>> Button" worked the same way on both Nitro and Predator laptops, but
>>>>> that's not the case.
>>>>>
>>>>> On Predator laptops, the button directly enables Turbo mode but on t=
he
>>>>> Nitro it only opens the Nitro Sense app. I had assumed that both
>>>>> buttons simply opened the app and that directly enabling Turbo mode
>>>>> was a feature provided by the Linux driver.
>>>>>
>>>>> Given this, the ACPI code that you linked earlier is probably for th=
e
>>>>> Predator's "Turbo Button". Could it be that the button on my laptop
>>>>> doesn=E2=80=99t use that ACPI code at all, considering its functiona=
lity is
>>>>> completely different? (Though i doubt Acer would leave it in if it
>>>>> wasn't being used)
>>>> It is quite common for manufactures to just copy and paste ACPI code =
snippets, so it is not
>>>> unusual to have some unused code inside the ACPI tables.
>>>>
>>>> Did you receive any input events or dmesg messages when pressing that=
 button?
>>>>
>>>> If no then it could also be that this button depends on the Intel THC=
 touch controller to work,
>>>> take a look at https://lore.kernel.org/all/20241216014127.3722172-1-e=
ven.xu@intel.com for details
>>>> about the Intel THC controller.
>>>>
>>>> Thanks,
>>>> Armin Wolf
>>>>
>>> I do receive input events, it shows up with the keycode 433 and symbol
>>> XF86Presentation. I think you mentioned something regarding an i8042
>>> filter, can we use that to call the function to cycle between the
>>> profiles?
>> Since this is a valid keycode i advise against filtering it out. Instea=
d it would make more
>> sense to allow userspace to control the turbo state for example trough =
a sysfs attribute.
>>
>> Then you can use a userspace program to react to this key press.
> Since some laptops handle this completely in the EC, so far drivers
> which get an event for this have been reacting to this event
> themselves and calling the platform_profile_cycle() helper to cycle
> through the various performance profiles.
>
> I think it would be best to do this here too.
>
> Regards,
>
> Hans

This keycode event is different from the WMI notification used to toggle t=
he turbo status.

As mentioned above, the turbo button on the Predator series is meant to to=
ggle the turbo mode,
while the special button found on the Nitro series is meant to only open t=
he OEM application.

Toggling the turbo mode in response to this special button will confuse us=
ers should Acer
mark the button with a small application icon.

I rather let applications change the turbo mode from userspace. This would=
 also benifit machines
which do not have any special buttons for this.

Thanks,
Armin Wolf

