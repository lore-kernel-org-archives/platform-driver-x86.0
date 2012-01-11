From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH linux-3.1.y] ideapad: Check if acpi already handle
 backlight power to avoid a page fault
Date: Wed, 11 Jan 2012 08:11:10 -0800
Message-ID: <20120111161110.GC25593@kroah.com>
References: <CAFVLVSOp750X4L+qgR16Qc53V+jOKsxA-ujskx3K0BX9kQOzTw@mail.gmail.com>
 <20120111004256.GS22184@burratino>
 <4F0D76D5.2080704@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:33278 "EHLO
	out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751576Ab2AKQUr (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 11 Jan 2012 11:20:47 -0500
Received: from compute1.internal (compute1.nyi.mail.srv.osa [10.202.2.41])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 34CB620BA8
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Jan 2012 11:20:47 -0500 (EST)
Content-Disposition: inline
In-Reply-To: <4F0D76D5.2080704@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Ike Panhc <ike.pan@canonical.com>
Cc: Jonathan Nieder <jrnieder@gmail.com>, stable@vger.kernel.org, platform-driver-x86@vger.kernel.org, Artem X <artem.brz@gmail.com>, Rene Bolldorf <xsecute@googlemail.com>, Matthew Garrett <mjg@redhat.com>, Corentin Chary <corentin.chary@gmail.com>

On Wed, Jan 11, 2012 at 07:47:33PM +0800, Ike Panhc wrote:
> Thanks, and this is necessary for 3.1.y
>=20
> On 01/11/2012 08:42 AM, Jonathan Nieder wrote:
> > From: Ren=E9 Bollford <xsecute@googlemail.com>
> > Date: Sun, 23 Oct 2011 09:56:42 +0200
> >=20
> > commit d4afc7754a60b885b63ef23fd194984e2d53a4e6 upstream.
> >=20
> > This patch avoid a page fault in the ideapad-laptop extras when
> > turning the backlight power on or off.
> >=20
> > Signed-off-by: Rene Bolldorf <xsecute@googlemail.com>
> > Signed-off-by: Matthew Garrett <mjg@redhat.com>
> > Signed-off-by: Jonathan Nieder <jrnieder@gmail.com>
> > Tested-by: Artem X <artem.brz@gmail.com>
>=20
> Acked-by: Ike Panhc <ike.pan@canonical.com>

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read Documentation/stable_kernel_rules.txt
for how to do this properly.

</formletter>
