From: "Joey Lee" <jlee@novell.com>
Subject: Re: Wifi switch not working, linux on IdeaPad S205
Date: Mon, 27 Jun 2011 02:17:42 -0600
Message-ID: <4E08C946020000230002EB1D@novprvlin0050.provo.novell.com>
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
 <4DFC8014020000230002E662@novprvlin0050.provo.novell.com>
 <4DFE145B.4060405@flanto.de>
 <4DFFA92F020000230002E786@novprvlin0050.provo.novell.com>
 <4DFF27EC.9080804@flanto.de>
 <4E00FC24020000230002E843@novprvlin0050.provo.novell.com>
 <4E04FBB1.6090304@flanto.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from novprvlin0050.provo.novell.com ([137.65.248.33]:59649 "EHLO
	novprvlin0050.provo.novell.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756247Ab1F0IRq (ORCPT
	<rfc822;groupwise-platform-driver-x86@vger.kernel.org:4:1>);
	Mon, 27 Jun 2011 04:17:46 -0400
In-Reply-To: <4E04FBB1.6090304@flanto.de>
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: heyho@flanto.de
Cc: ike.pan@canonical.com, Joey Lee <JLee@novell.com>, platform-driver-x86@vger.kernel.org

=E6=96=BC =E4=BA=94=EF=BC=8C2011-06-24 =E6=96=BC 23:03 +0200=EF=BC=8CFl=
orian Heyer =E6=8F=90=E5=88=B0=EF=BC=9A
> Hello Joey,
>=20
> > For a normal user, he will not un-probe acer-wmi driver after syste=
m.
> > Could you please help to confirm? I mean please switch your hardwar=
e
> > wifi switch a couple of cycles with acer-wmi loaded.
> >
> > Just want to 100% make sure acer-wmi will not crash after switch
> > wireless state by hardware a lot of times.
>=20
> Ok, with only acer-wmi loaded (wifi is connected) i toggled the wifi=20
> switch a couple of times. Trying as fast as possible...no problem,=20
> system didn't crash. After finally switching to "on" wifi connected a=
gain.
>=20
> > It's the same, if you wan to use ideapad-laptop at the same time. P=
lease
> > load ideapad-laptop and acer-wmi then switch wireless button many t=
imes,
> > make sure there have not thing crash.
> >
>=20
> With acer-wmi AND idepad-laptop loaded i tried the same as above. Aga=
in,=20
> no crash. After switching finally to "on" wifi connected again.
>=20

Thank's for your confirm and good news!

> I noticed a message from acer-wmi (has nothing to do with the tests=20
> above): acer-wmi prints a message to kernel message log about every s=
econd:
>=20
> [28907.045046] acer_wmi: acer_rfkill_update state: 1
>=20
> Is this debugging output? For the final version it should be disabled=
=2E
>=20

Yes, this is a debug message to make sure the EC register value mapping
to rfkill hardware switch status:
	0 means wireless disabled (hard-blocked)
	1 means wireless enabled (unblocked)

I will remove this message when send out support patch to acer-wmi.


Thank's a lot!
Joey Lee
