From: Ike Panhc <ike.pan@canonical.com>
Subject: Re: [PATCH] acer-wmi: blacklist Thinkpad edge E520
Date: Tue, 18 Oct 2011 10:20:18 +0800
Message-ID: <4E9CE262.60601@canonical.com>
References: <1318488718-4744-1-git-send-email-ike.pan@canonical.com>  <1318523759.1913.68.camel@linux-s257.site>  <4E97A307.20208@canonical.com> <1318902491.1913.348.camel@linux-s257.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:51815 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752068Ab1JRCU1 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 17 Oct 2011 22:20:27 -0400
In-Reply-To: <1318902491.1913.348.camel@linux-s257.site>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: joeyli <jlee@suse.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Matthew Garrett <mjg@redhat.com>, Joey Lee <jlee@novell.com>

Hi Joey,

On 10/18/2011 09:48 AM, joeyli wrote:
> Hi Ike,=20
>=20
> Could you please attached on the "rfkill list" output when press Fn k=
ey?
> Then we can check the rfkill status change.

The output of rfkill list is at
  https://launchpadlibrarian.net/78485925/RfKill.txt

=2E. and bug reporter tells me that he can not unblock wireless.
  https://bugs.launchpad.net/ubuntu/+source/linux/+bug/836865/comments/=
0

>=20
> And,=20
> Thinkpad E520 have AMW0 method and I thought acer-wmi query wrong EC
> register address so your acer-wireless was always soft-blocked.
>=20
> Does it possible kindly help me to find out which register on E520 is
> mapping to wireless status? Please reference to Carlos's acer_ec.pl
> tool:
>=20
> http://code.google.com/p/aceracpi/wiki/EmbeddedController
>=20
> Simple use:
>         watch -n 1 perl acer_ec.pl regs
>=20
> Then press your wireless Fn key to monitor which register changed whe=
n
> you press Fn key:
>=20
> e.g. the register at row B0 and column 0A is register 0xBA (0x is use=
d
> to indicate this is a hexadecimal number).
>=20
> There maybe have other EC register changing when you press key, pleas=
e
> do a couple of times and make sure you find out the right one.
>=20
> If we are lucky, we can find out one EC register mapping to your
> wireless state.

I've asked bug reporter to do so. Unfortunately nothing useful found.

Please refer to the link below:
  https://bugs.launchpad.net/ubuntu/+source/linux/+bug/836865/comments/=
13
  https://bugs.launchpad.net/ubuntu/+source/linux/+bug/836865/comments/=
14

The full discussion is at
  https://bugs.launchpad.net/ubuntu/+source/linux/+bug/836865

>=20
>=20
> Thank's
> Joey Lee
>=20
> =E6=96=BC =E4=BA=94=EF=BC=8C2011-10-14 =E6=96=BC 10:48 +0800=EF=BC=8C=
Ike Panhc =E6=8F=90=E5=88=B0=EF=BC=9A
>> Hi Joey,
>>
>> Here you are.
>>
>> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/836865/+attachm=
ent/2330828/+files/AcpiTables.txt
>>
>>
>> On 10/14/2011 12:35 AM, joeyli wrote:
>>> Hi Ike,=20
>>>
>>> =E6=96=BC =E5=9B=9B=EF=BC=8C2011-10-13 =E6=96=BC 14:51 +0800=EF=BC=8C=
Ike Panhc =E6=8F=90=E5=88=B0=EF=BC=9A
>>>> BugLink: http://launchpad.net/bugs/836865
>>>> BugLink: http://launchpad.net/bugs/826784
>>>>
>>>> There are reports say that acer-wmi is loaded on Thinkpad E520 whi=
ch
>>>> cause wireless connection hard blocked and we can not unblock it. =
It
>>>> will be better not to load acer-wmi on this machine.
>>>>
>>>> Signed-off-by: Ike Panhc <ike.pan@canonical.com>
>>>> ---
>>>>  drivers/platform/x86/acer-wmi.c |    7 +++++++
>>>>  1 files changed, 7 insertions(+), 0 deletions(-)
>>>>
>>>> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x8=
6/acer-wmi.c
>>>> index af2bb20..dc9a116 100644
>>>> --- a/drivers/platform/x86/acer-wmi.c
>>>> +++ b/drivers/platform/x86/acer-wmi.c
>>>> @@ -325,6 +325,13 @@ static struct dmi_system_id __devinitdata ace=
r_blacklist[] =3D {
>>>>  			DMI_MATCH(DMI_PRODUCT_NAME, "AOA150"),
>>>>  		},
>>>>  	},
>>>> +	{
>>>> +		.ident =3D "Lenovo Thinkpad Edge E520",
>>>> +		.matches =3D {
>>>> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
>>>> +			DMI_MATCH(DMI_PRODUCT_NAME, "114320U"),
>>>> +		},
>>>> +	},
>>>>  	{}
>>>>  };
>>>> =20
>>>
>>> Could you please share Thinkpad edge E520's acpidump and dmidecode =
log
>>> to me?=20
>>> Maybe we can capture how does it works with EC register like we sup=
port
>>> Ideapad S205 in acer-wmi driver.
>>>
>>> Add a machine to blacklist is a last resort, I don't want to accept=
 it
>>> before we try.
>>>
>>>
>>> Thank's a lot!
>>> Joey Lee
>>>
>>>
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe platform-=
driver-x86" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-kern=
el" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>> Please read the FAQ at  http://www.tux.org/lkml/
>=20
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe platform-dr=
iver-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
