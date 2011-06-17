From: "Joey Lee" <jlee@novell.com>
Subject: Re: Wifi switch not working, linux on IdeaPad S205
Date: Fri, 17 Jun 2011 07:09:05 -0600
Message-ID: <4DFBDE91020000230002E620@novprvlin0050.provo.novell.com>
References: <4DE5FD4D020000230002D5D4@novprvlin0050.provo.novell.com>
 <4DE57CD6.5030609@flanto.de>
 <4DE62BA2020000230002D603@novprvlin0050.provo.novell.com>
 <4DE74CEF.3020608@flanto.de>
 <4DE86E36020000230002D768@novprvlin0050.provo.novell.com>
 <4DE8D876.7060304@flanto.de>
 <4DEEB8EB020000230002DF1A@novprvlin0050.provo.novell.com>
 <4DF08626.3050802@canonical.com>
 <4DF908DA020000230002E497@novprvlin0050.provo.novell.com>
 <4DF87EA2.3050204@flanto.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from novprvlin0050.provo.novell.com ([137.65.248.33]:53626 "EHLO
	novprvlin0050.provo.novell.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1758568Ab1FQNJP (ORCPT
	<rfc822;groupwise-platform-driver-x86@vger.kernel.org:4:1>);
	Fri, 17 Jun 2011 09:09:15 -0400
In-Reply-To: <4DF87EA2.3050204@flanto.de>
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: heyho@flanto.de
Cc: ike.pan@canonical.com, Joey Lee <JLee@novell.com>, platform-driver-x86@vger.kernel.org

Hi Florian,=20

=E6=96=BC =E4=B8=89=EF=BC=8C2011-06-15 =E6=96=BC 11:42 +0200=EF=BC=8CFl=
orian Heyer =E6=8F=90=E5=88=B0=EF=BC=9A
> On 06/15/2011 11:32 AM, Joey Lee wrote:
> >   + Does "hardware switch" on IdeaPad S205 not just control wireles=
s? Does it also control bluetooth?
>=20
> Hello Joey,
>=20
> just a quick answer (i will go through your whole mail in the evening=
):
>=20
> Yes, the hardware switch controls bluetooth and works fine: ubuntu's=20
> bluetooth icon appears/disappears when i toggle the switch on/off. Th=
is=20
> works even without acer_wmi.
>=20
> I have the hardware switch usually on "on" and with this setting rfki=
ll=20
> shows the following state directly after booting (without loading ace=
r_wmi):
>=20
> 0: hci0: Bluetooth
>   	Soft blocked: no
>   	Hard blocked: no
> 1: phy0: Wireless LAN
>   	Soft blocked: no
>   	Hard blocked: yes
>=20
>=20
>=20
> regards

Could you pleas share the dmidecode information to me? just need:=20
	dmidecode > dmidecode.log

I want to generate a acer-wmi patch to test AMW0 method on your machine=
=2E

=46or IdeaPad S205, this case is too special for acer machines, I still
thought that will be better support it in ideapad-laptop. But, we can
test on acer-wmi first.


Thank's
Joey Lee
