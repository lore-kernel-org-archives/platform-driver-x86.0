From: Ike Panhc <ike.pan@canonical.com>
Subject: Re: Wifi switch not working, linux on IdeaPad S205
Date: Thu, 09 Jun 2011 16:36:54 +0800
Message-ID: <4DF08626.3050802@canonical.com>
References: <4DE5FD4D020000230002D5D4@novprvlin0050.provo.novell.com> <4DE57CD6.5030609@flanto.de> <4DE62BA2020000230002D603@novprvlin0050.provo.novell.com> <4DE74CEF.3020608@flanto.de> <4DE86E36020000230002D768@novprvlin0050.provo.novell.com> <4DE8D876.7060304@flanto.de> <4DEEB8EB020000230002DF1A@novprvlin0050.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from adelie.canonical.com ([91.189.90.139]:40226 "EHLO
	adelie.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753501Ab1FIIhC (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 9 Jun 2011 04:37:02 -0400
In-Reply-To: <4DEEB8EB020000230002DF1A@novprvlin0050.provo.novell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Joey Lee <jlee@novell.com>
Cc: heyho@flanto.de, platform-driver-x86@vger.kernel.org

On 06/07/2011 09:48 PM, Joey Lee wrote:
> =E6=96=BC =E4=BA=94=EF=BC=8C2011-06-03 =E6=96=BC 14:49 +0200=EF=BC=8C=
=46lorian Heyer =E6=8F=90=E5=88=B0=EF=BC=9A
>> fn+f5 doesn't do anything no matter what state the wifi switch is.
>> Personally i wouldn't mind if only the wifi switch is supported, i m=
ean,
>> you don't need a key combination if you have a real switch for wifi
>> (de)activation.
>>
>=20
> I thought need to check with Ike for more detail why the Fn+F5 key no=
t
> work on S205.

I read the DSDT again. Fn+F5 is the soft rfkill key. It looks fine.
I guess the problem is the hard rfkill status is blocked, wifi will be
blocked even the soft one is unblocked.

> As I know on Thinkpad machine, the hardware switch causes killswitch =
set
> to hard-block, and Fn+F5 causes killswitch set to soft-block.
>=20
> Ike,=20
> need your comments for Fn+F5 key and wireless hardware switch on
> ideapad. How does it implement on ideapad?
>   	- press Fn+F5: soft-block wireless killswitch?
> 	- wireless hardware switch: hard-block wireless killswitch?

Both of the answers are yes.

The problem is that on ideapad s205 without acer-wmi, when ideapad-lapt=
op
have the hard switch event, the driver asks the status of switch and DS=
DT
replies blocked.

In the DSDT the driver read bit of GWSS as status of hardware switch an=
d
I can not find out anything to update GWSS in DSDT :(
