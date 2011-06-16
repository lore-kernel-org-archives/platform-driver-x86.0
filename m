From: Ike Panhc <ike.pan@canonical.com>
Subject: Re: Wifi switch not working, linux on IdeaPad S205
Date: Thu, 16 Jun 2011 17:58:04 +0800
Message-ID: <4DF9D3AC.1050502@canonical.com>
References: <4DE5FD4D020000230002D5D4@novprvlin0050.provo.novell.com> <4DE57CD6.5030609@flanto.de> <4DE62BA2020000230002D603@novprvlin0050.provo.novell.com> <4DE74CEF.3020608@flanto.de> <4DE86E36020000230002D768@novprvlin0050.provo.novell.com> <4DE8D876.7060304@flanto.de> <4DEEB8EB020000230002DF1A@novprvlin0050.provo.novell.com> <4DF08626.3050802@canonical.com> <4DF908DA020000230002E497@novprvlin0050.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from adelie.canonical.com ([91.189.90.139]:35846 "EHLO
	adelie.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756395Ab1FPJ6M (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 16 Jun 2011 05:58:12 -0400
In-Reply-To: <4DF908DA020000230002E497@novprvlin0050.provo.novell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Joey Lee <jlee@novell.com>
Cc: heyho@flanto.de, platform-driver-x86@vger.kernel.org

On 06/15/2011 05:32 PM, Joey Lee wrote:
> =E6=96=BC =E5=9B=9B=EF=BC=8C2011-06-09 =E6=96=BC 16:36 +0800=EF=BC=8C=
Ike Panhc =E6=8F=90=E5=88=B0=EF=BC=9A
>=20
> But Florian said the Fn+F5 doesn't work to him, as you said, the _Q2B
> works when GWSS is not zero:
>=20
>         Method (_Q2B, 0, NotSerialized)         /* wifi key? */
>         { =20
>             Store (0x2B, P80H)
>             If (LEqual (GWSS, 0x00)) {}         /* on issue machine, =
GWSS is 0 */
>             Else
>             { =20
>                 If (WLPS)                       /* if have wireless *=
/
>                 { =20
>                     Store (WRST, WLEN)          /* write wireless RF =
state to EC */
>                 }
>=20

I see your point. IMHO this is ok. When the radio switch is off, it sha=
ll
be no different on every soft block modes.

> =E6=96=BC =E4=BA=8C=EF=BC=8C2011-05-31 =E6=96=BC 15:02 +0200=EF=BC=8C=
=46lorian Heyer =E6=8F=90=E5=88=B0=EF=BC=9A=20
>> On 05/31/2011 11:42 AM, Joey Lee wrote:
>>> Just checked your DSDT, it declared the AMW0 methods, I agreed Ike'=
s
>>> suggestion that will be better you direct test acer-wmi on your mac=
hine.
>>>
>>> Please modprobe acer-wmi driver, then try to turn on/off bluetooth =
or
>>> wireless device by rfkill.
>>
>> Hello Joey,
>>
>> here are some findings with acer_wmi. I execute the following steps =
from=20
>> top to bottom, and only after the last step my wifi works. After eac=
h=20
>> step you find the output of "rfkill list":
>>
>> after booting (no ideapad_laptop, no acer_wmi):
>> 0: hci0: Bluetooth
>> 	Soft blocked: no
>> 	Hard blocked: no
>> 1: phy0: Wireless LAN
>> 	Soft blocked: no
>> 	Hard blocked: yes
>>
>=20
> When system boot, wireless is hard blocked by default.
>=20

Read the reply mail from Florian. This is a problem because hard blocke=
d
shall be no when the radio switch is on. Since phy0 is registered by wi=
fi
driver, I think this is not generic design.
