From: Ike Panhc <ike.pan@canonical.com>
Subject: Re: [PATCH] acer-wmi: blacklist Thinkpad edge E520
Date: Fri, 14 Oct 2011 10:48:39 +0800
Message-ID: <4E97A307.20208@canonical.com>
References: <1318488718-4744-1-git-send-email-ike.pan@canonical.com> <1318523759.1913.68.camel@linux-s257.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:34093 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751849Ab1JNCsr (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 13 Oct 2011 22:48:47 -0400
In-Reply-To: <1318523759.1913.68.camel@linux-s257.site>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: joeyli <jlee@suse.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Matthew Garrett <mjg@redhat.com>, Joey Lee <jlee@novell.com>

Hi Joey,

Here you are.

https://bugs.launchpad.net/ubuntu/+source/linux/+bug/836865/+attachment=
/2330828/+files/AcpiTables.txt


On 10/14/2011 12:35 AM, joeyli wrote:
> Hi Ike,=20
>=20
> =E6=96=BC =E5=9B=9B=EF=BC=8C2011-10-13 =E6=96=BC 14:51 +0800=EF=BC=8C=
Ike Panhc =E6=8F=90=E5=88=B0=EF=BC=9A
>> BugLink: http://launchpad.net/bugs/836865
>> BugLink: http://launchpad.net/bugs/826784
>>
>> There are reports say that acer-wmi is loaded on Thinkpad E520 which
>> cause wireless connection hard blocked and we can not unblock it. It
>> will be better not to load acer-wmi on this machine.
>>
>> Signed-off-by: Ike Panhc <ike.pan@canonical.com>
>> ---
>>  drivers/platform/x86/acer-wmi.c |    7 +++++++
>>  1 files changed, 7 insertions(+), 0 deletions(-)
>>
>> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/=
acer-wmi.c
>> index af2bb20..dc9a116 100644
>> --- a/drivers/platform/x86/acer-wmi.c
>> +++ b/drivers/platform/x86/acer-wmi.c
>> @@ -325,6 +325,13 @@ static struct dmi_system_id __devinitdata acer_=
blacklist[] =3D {
>>  			DMI_MATCH(DMI_PRODUCT_NAME, "AOA150"),
>>  		},
>>  	},
>> +	{
>> +		.ident =3D "Lenovo Thinkpad Edge E520",
>> +		.matches =3D {
>> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
>> +			DMI_MATCH(DMI_PRODUCT_NAME, "114320U"),
>> +		},
>> +	},
>>  	{}
>>  };
>> =20
>=20
> Could you please share Thinkpad edge E520's acpidump and dmidecode lo=
g
> to me?=20
> Maybe we can capture how does it works with EC register like we suppo=
rt
> Ideapad S205 in acer-wmi driver.
>=20
> Add a machine to blacklist is a last resort, I don't want to accept i=
t
> before we try.
>=20
>=20
> Thank's a lot!
> Joey Lee
>=20
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe platform-dr=
iver-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
