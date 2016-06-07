From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [ibm-acpi-devel] [PATCH] thinkpad_acpi: Add support for HKEY
 version 0x200
Date: Tue, 7 Jun 2016 20:53:38 -0300
Message-ID: <20160607235338.GA3147@khazad-dum.debian.net>
References: <1465318938.7166.23.camel@redhat.com>
 <1465333851.7166.46.camel@redhat.com>
 <CAALaSc=cby0oq1fptVu3cvr9JkQA6yQ4pBGXPMWxHGK=dq3f6Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:42562 "EHLO
	out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S932540AbcFGXxn (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 7 Jun 2016 19:53:43 -0400
Content-Disposition: inline
In-Reply-To: <CAALaSc=cby0oq1fptVu3cvr9JkQA6yQ4pBGXPMWxHGK=dq3f6Q@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Marco Trevisan =?iso-8859-1?B?KFRyZXZp8W8p?= <mail@3v1n0.net>
Cc: Lyude Paul <cpaul@redhat.com>, ibm-acpi-devel@lists.sourceforge.net, Dennis Wassenberg <dennis.wassenberg@secunet.com>, Darren Hart <dvhart@infradead.org>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org

On Tue, 07 Jun 2016, Marco Trevisan (Trevi=F1o) wrote:
> 2016-06-07 17:10 GMT-04:00 Lyude Paul <cpaul@redhat.com>:
> > Managed to find someone in the office with one of these laptops and=
 it looks
> > like the adaptive keyboard works perfectly with this patch, so I ca=
n give my t-
> > b:
> >
> >         Tested-by: Lyude Paul <cpaul@redhat.com>
> >
>=20
> I can confirm it works too.
>=20
> Tested-by: Marco Trevisan <marco@ubuntu.com>

Ok, looks like the patch is safe.  Let's fix the boring details
(formating, etc), and then merge it.

Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>

--=20
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
