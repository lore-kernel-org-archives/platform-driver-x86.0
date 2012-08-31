From: joeyli <jlee@suse.com>
Subject: Re: [PATCH] acer-wmi: support Lenovo ideapad S205 10382JG wifi
 switch
Date: Fri, 31 Aug 2012 09:56:55 +0800
Message-ID: <1346378215.6836.1956.camel@linux-s257.site>
References: <1346294381-16529-1-git-send-email-jlee@suse.com>
	 <20120830211314.GE3276@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp.nue.novell.com ([195.135.221.5]:38350 "EHLO
	smtp.nue.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751703Ab2HaCBs (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 30 Aug 2012 22:01:48 -0400
In-Reply-To: <20120830211314.GE3276@kroah.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: mjg@redhat.com, platform-driver-x86@vger.kernel.org, stable@vger.kernel.org, Ivo Anjo <knuckles@gmail.com>, Carlos Corbacho <carlos@strangeworlds.co.uk>

Hi Greg,=20

=E6=96=BC =E5=9B=9B=EF=BC=8C2012-08-30 =E6=96=BC 14:13 -0700=EF=BC=8CGr=
eg KH =E6=8F=90=E5=88=B0=EF=BC=9A
> On Thu, Aug 30, 2012 at 10:39:41AM +0800, Lee, Chun-Yi wrote:
> > Found another Lenovo ideapad S205 the product name is 10382JG, it h=
as
> > a 0x78 EC register exposes the state of wifi hardware switch on the=
 machine.
> >=20
> > So, add this patch to support Lenovo ideapad S205-10382JG wifi hard=
ware
> > switch in acer-wmi driver.
> >=20
> > Evidently the Ideapad S205 is just a model name on the market, but =
they have
> > totally different product name in DMI table.
> >=20
> > Reference: bko#43007
> >         https://bugzilla.kernel.org/show_bug.cgi?id=3D43007
> >=20
> > Cc: Ivo Anjo <knuckles@gmail.com>
> > Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>
> > Cc: Matthew Garrett <mjg@redhat.com>
> > Signed-off-by: Lee, Chun-Yi <jlee@suse.com>
> > ---
> >  drivers/platform/x86/acer-wmi.c |    9 +++++++++
> >  1 files changed, 9 insertions(+), 0 deletions(-)
>=20
>=20
> <formletter>
>=20
> This is not the correct way to submit patches for inclusion in the
> stable kernel tree.  Please read Documentation/stable_kernel_rules.tx=
t
> for how to do this properly.
>=20
> </formletter>
>=20

Thanks for your review and suggestion. I will re-send patch to stable
kernel mail after this patch merged to platform tree.


Thanks a lot!
Joey Lee
