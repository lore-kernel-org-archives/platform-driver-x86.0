From: Ike Panhc <ike.pan@canonical.com>
Subject: Re: drivers/platform/x86/acer-wmi.c: Support for another Lenovo Ideapad
 S205
Date: Tue, 20 Mar 2012 11:03:57 +0800
Message-ID: <4F67F39D.2070705@canonical.com>
References: <4F600A1D.5060002@gmail.com>  <1331872472.10557.251.camel@linux-s257.site>  <4F67D32A.8080902@gmail.com> <1332209144.10557.281.camel@linux-s257.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:41484 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755661Ab2CTDEI (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 19 Mar 2012 23:04:08 -0400
In-Reply-To: <1332209144.10557.281.camel@linux-s257.site>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: joeyli <jlee@suse.com>
Cc: Vaclav Mocek <vmocek@gmail.com>, mjg@redhat.com, platform-driver-x86@vger.kernel.org

On 03/20/2012 10:05 AM, joeyli wrote:
> Hi Vaclav,=20
>=20
> =E6=96=BC =E4=BA=8C=EF=BC=8C2012-03-20 =E6=96=BC 00:45 +0000=EF=BC=8C=
Vaclav Mocek =E6=8F=90=E5=88=B0=EF=BC=9A
>> Hi Joey,
>>
>>>
>>> If you want, Please kindly try this patch.
>> [Re]tested, it works. Actually, it was the first thing I tried, but=20
>> after that I found out there are other sixteen known product names.
>>
>> Vaclav M.
>=20
> Great! thanks for your testing.
>=20
>=20
> Hi Ike,=20
>=20
> Do you want to handle this machine in ideapad-laptop driver? or I jus=
t
> direct put this quirk to acer-wmi for wifi support?
>=20
>=20
> Thanks
> Joey Lee
>=20

ideapad-laptop has its own way to query soft block status, and it is no=
t
to query from ec bits.

Please put this quirk in acer-wmi so that acer-wireless will report
correct soft block status.



>>>
>>> Thanks a lot!
>>> Joey Lee
>>>
>>>> From 02a341b8142f71190c09a1a4fe509922b8f055c4 Mon Sep 17 00:00:00 =
2001
>>> From: "Lee, Chun-Yi"<jlee@suse.com>
>>> Date: Fri, 16 Mar 2012 12:31:08 +0800
>>> Subject: [PATCH] acer-wmi: add support Lenovo Ideapad S205 Brazos
>>>
>>> acer-wmi: add support Lenovo Ideapad S205 Brazos
>>>
>>> Signed-off-by: Lee, Chun-Yi<jlee@suse.com>
>>> ---
>>>   drivers/platform/x86/acer-wmi.c |    9 +++++++++
>>>   1 files changed, 9 insertions(+), 0 deletions(-)
>>>
>>> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86=
/acer-wmi.c
>>> index 1e5290b..f158956 100644
>>> --- a/drivers/platform/x86/acer-wmi.c
>>> +++ b/drivers/platform/x86/acer-wmi.c
>>> @@ -468,6 +468,15 @@ static struct dmi_system_id acer_quirks[] =3D =
{
>>>   	},
>>>   	{
>>>   		.callback =3D dmi_matched,
>>> +		.ident =3D "Lenovo Ideapad S205",
>>> +		.matches =3D {
>>> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
>>> +			DMI_MATCH(DMI_PRODUCT_NAME, "Brazos"),
>>> +		},
>>> +		.driver_data =3D&quirk_lenovo_ideapad_s205,
>>> +	},
>>> +	{
>>> +		.callback =3D dmi_matched,
>>>   		.ident =3D "Lenovo 3000 N200",
>>>   		.matches =3D {
>>>   			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
>>
>>
>=20
>=20
