From: "Joey Lee" <jlee@novell.com>
Subject: Re: Wifi switch not working, linux on IdeaPad S205
Date: Fri, 17 Jun 2011 16:50:52 -0600
Message-ID: <4DFC66EC020000230002E655@novprvlin0050.provo.novell.com>
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
 <4DFBDE91020000230002E620@novprvlin0050.provo.novell.com>
 <4DFB6CDE.4020003@flanto.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from novprvlin0050.provo.novell.com ([137.65.248.33]:39751 "EHLO
	novprvlin0050.provo.novell.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754565Ab1FQWvA (ORCPT
	<rfc822;groupwise-platform-driver-x86@vger.kernel.org:4:1>);
	Fri, 17 Jun 2011 18:51:00 -0400
In-Reply-To: <4DFB6CDE.4020003@flanto.de>
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: heyho@flanto.de
Cc: ike.pan@canonical.com, Joey Lee <JLee@novell.com>, platform-driver-x86@vger.kernel.org

Hi Florian,=20

=E6=96=BC =E4=BA=94=EF=BC=8C2011-06-17 =E6=96=BC 17:03 +0200=EF=BC=8CFl=
orian Heyer =E6=8F=90=E5=88=B0=EF=BC=9A
> On 17.06.2011 15:09, Joey Lee wrote:
> > Could you pleas share the dmidecode information to me? just need:=20
> > 	dmidecode > dmidecode.log
> >=20
>=20
> No problem, see attachment.
>=20
> > I want to generate a acer-wmi patch to test AMW0 method on your mac=
hine.
> >=20
> > For IdeaPad S205, this case is too special for acer machines, I sti=
ll
> > thought that will be better support it in ideapad-laptop. But, we c=
an
> > test on acer-wmi first.
>=20
> To me it seems logical to solve the problem in ideapad-laptop and not=
 in
> acer-wmi as the laptop is obviously of ideapad type :)
> I will be happily testing patches to solve the issue.
>=20
>=20
> regards

Could you please help to file a bug on kernel bugzilla for this issue?
	https://bugzilla.kernel.org/

That will be good for collect all information and attached dmi, dsdt on
the bug, and don't need dig mail loop.


Thank's
Joey Lee
