From: joeyli <jlee@suse.com>
Subject: Re: [PATCH 3.0.y] acer-wmi: No wifi rfkill on Lenovo machines
Date: Mon, 19 Mar 2012 10:08:34 +0800
Message-ID: <1332122914.10557.271.camel@linux-s257.site>
References: <1327546404.15260.18.camel@linux-s257.site>
	 <1328258799-19665-1-git-send-email-ike.pan@canonical.com>
	 <20120314215327.GA1510@burratino> <20120314220251.GB14166@kroah.com>
	 <20120314221749.GF31686@burratino> <4F62BB9E.3070508@canonical.com>
	 <1331878281.10557.257.camel@linux-s257.site>
	 <20120316172040.GB6711@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from charybdis-ext.suse.de ([195.135.221.2]:24426 "EHLO
	nat.nue.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755733Ab2CSCKZ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 18 Mar 2012 22:10:25 -0400
In-Reply-To: <20120316172040.GB6711@kroah.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Ike Panhc <ike.pan@canonical.com>, Jonathan Nieder <jrnieder@gmail.com>, stable@vger.kernel.org, Carlos Corbacho <carlos@strangeworlds.co.uk>, mjg@redhat.com, platform-driver-x86@vger.kernel.org, Dmitry Torokhov <dtor@mail.ru>, Corentin Chary <corentincj@iksaif.net>, Thomas Renninger <trenn@suse.de>, Andrey <andrey.k.p@gmail.com>

=E6=96=BC =E4=BA=94=EF=BC=8C2012-03-16 =E6=96=BC 10:20 -0700=EF=BC=8CGr=
eg KH =E6=8F=90=E5=88=B0=EF=BC=9A
> On Fri, Mar 16, 2012 at 02:11:21PM +0800, joeyli wrote:
> > Hi Ike,=20
> >=20
> > =E6=96=BC =E4=BA=94=EF=BC=8C2012-03-16 =E6=96=BC 12:03 +0800=EF=BC=8C=
Ike Panhc =E6=8F=90=E5=88=B0=EF=BC=9A
> > > On 03/15/2012 06:17 AM, Jonathan Nieder wrote:
> > > > Greg KH wrote:
> > > >> On Wed, Mar 14, 2012 at 04:53:27PM -0500, Jonathan Nieder wrot=
e:
> > > >=20
> > > >>> Please consider applying 461e74377cfc (acer-wmi: No wifi rfki=
ll on
> > > >>> Lenovo machines, 2012-02-03) to the 3.2.y and 3.0.y trees.
> > > >>
> > > >> Now applied.
> > > >=20
> > > > Thanks!  That was fast.
> > > > --
> > > > To unsubscribe from this list: send the line "unsubscribe platf=
orm-driver-x86" in
> > > > the body of a message to majordomo@vger.kernel.org
> > > > More majordomo info at  http://vger.kernel.org/majordomo-info.h=
tml
> > > >=20
> > >=20
> > > Review the commit log of acer-wmi
> > >=20
> > > For 3.2.y, this patch shall work fine.
> > >=20
> > > But for 3.0.y, backport commit 1709adab is necessary or patch has=
 no effect.
> > >=20
> > > I will post the backport patch after.
> > >=20
> > > Joey, can you review and ACK/NAK for this?
> > >=20
> >=20
> > Yes, should check ACER_CAP_WIRELESS flag before create wifi rfkill
> > interface.
>=20
> Ok, I've queued up a number of acer-wmi patches for the 3.0-stable tr=
ee
> now, all should be good.
>=20
> thanks,
>=20
> greg k-h
>=20

Thanks a lot!
Joey Lee
