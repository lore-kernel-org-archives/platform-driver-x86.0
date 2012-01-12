From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH linux-3.1.y] ideapad: Check if acpi already handle
 backlight power to avoid a page fault
Date: Thu, 12 Jan 2012 14:59:35 -0800
Message-ID: <20120112225935.GB3360@kroah.com>
References: <CAFVLVSOp750X4L+qgR16Qc53V+jOKsxA-ujskx3K0BX9kQOzTw@mail.gmail.com>
 <20120111004256.GS22184@burratino>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:46848 "EHLO
	out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755155Ab2ALXEM (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 12 Jan 2012 18:04:12 -0500
Received: from compute5.internal (compute5.nyi.mail.srv.osa [10.202.2.45])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id DB7AD23AC8
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Jan 2012 18:04:11 -0500 (EST)
Content-Disposition: inline
In-Reply-To: <20120111004256.GS22184@burratino>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Nieder <jrnieder@gmail.com>
Cc: stable@vger.kernel.org, platform-driver-x86@vger.kernel.org, Artem X <artem.brz@gmail.com>, Rene Bolldorf <xsecute@googlemail.com>, Matthew Garrett <mjg@redhat.com>, Ike Panhc <ike.pan@canonical.com>, Corentin Chary <corentin.chary@gmail.com>

On Tue, Jan 10, 2012 at 06:42:56PM -0600, Jonathan Nieder wrote:
> From: Ren=E9 Bollford <xsecute@googlemail.com>
> Date: Sun, 23 Oct 2011 09:56:42 +0200
>=20
> commit d4afc7754a60b885b63ef23fd194984e2d53a4e6 upstream.
>=20
> This patch avoid a page fault in the ideapad-laptop extras when
> turning the backlight power on or off.
>=20
> Signed-off-by: Rene Bolldorf <xsecute@googlemail.com>
> Signed-off-by: Matthew Garrett <mjg@redhat.com>
> Signed-off-by: Jonathan Nieder <jrnieder@gmail.com>
> Tested-by: Artem X <artem.brz@gmail.com>
> ---
> Artem X wrote:
>=20
> > I've compiled vanilla 3.1.6 with that patch and turning off blackli=
ght
> > was working.
>=20
> This fixes an oops reported by a few people in the new ideapad-laptop
> backlight driver.  See:
>=20
>  - http://thread.gmane.org/gmane.linux.kernel/1205259
>  - http://thread.gmane.org/gmane.linux.drivers.platform.x86.devel/240=
5
>  - http://bugs.debian.org/655377
>=20
> Luckily the ideapad-laptop backlight driver was introduced in
> v3.1-rc1~14^2~29, so older kernels do not have this bug.  Fix is
> already included in v3.2.

Now applied, thanks.

greg k-h
