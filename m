From: Greg KH <greg@kroah.com>
Subject: Re: [patch 5/8] Platform: Fix error path in samsung-laptop init
Date: Tue, 20 Sep 2011 09:15:50 -0700
Message-ID: <20110920161550.GA32194@kroah.com>
References: <20110901225401.GA26870@kroah.com>
 <20110901225331.122692921@clark.kroah.org>
 <CANq1E4TNagJzwLdUXTtR6ZGNJnbb6ppoP0-7mAoN7JUUTYpAVg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out3.smtp.messagingengine.com ([66.111.4.27]:33810 "EHLO
	out3.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750967Ab1ITQWM (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 20 Sep 2011 12:22:12 -0400
Content-Disposition: inline
In-Reply-To: <CANq1E4TNagJzwLdUXTtR6ZGNJnbb6ppoP0-7mAoN7JUUTYpAVg@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: David Herrmann <dh.herrmann@googlemail.com>
Cc: gregkh@suse.de, Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, stable <stable@kernel.org>

On Tue, Sep 20, 2011 at 02:21:54PM +0200, David Herrmann wrote:
> Hi Greg
>=20
> On Fri, Sep 2, 2011 at 12:50 AM,  <gregkh@suse.de> wrote:
> > samsung_init() should not return success if not all devices are ini=
tialized.
> > Otherwise, samsung_exit() will dereference sdev NULL pointers and o=
thers.
> >
> > Signed-off-by: David Herrmann <dh.herrmann@googlemail.com>
> > Cc: stable <stable@kernel.org>
> > Signed-off-by: Greg Kroah-Hartman <gregkh@suse.de>
> > ---
> > =A0drivers/platform/x86/samsung-laptop.c | =A0 =A03 +--
> > =A01 file changed, 1 insertion(+), 2 deletions(-)
> >
> > --- a/drivers/platform/x86/samsung-laptop.c
> > +++ b/drivers/platform/x86/samsung-laptop.c
> > @@ -799,7 +799,7 @@ static int __init samsung_init(void)
> > =A0 =A0 =A0 =A0sabi_iface =3D ioremap_nocache(ifaceP, 16);
> > =A0 =A0 =A0 =A0if (!sabi_iface) {
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pr_err("Can't remap %x\n", ifaceP);
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto exit;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto error_no_signature;
> > =A0 =A0 =A0 =A0}
> > =A0 =A0 =A0 =A0if (debug) {
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printk(KERN_DEBUG "ifaceP =3D 0x%08x=
\n", ifaceP);
> > @@ -851,7 +851,6 @@ static int __init samsung_init(void)
> > =A0 =A0 =A0 =A0if (retval)
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto error_file_create;
> >
> > -exit:
> > =A0 =A0 =A0 =A0return 0;
> >
> > =A0error_file_create:
> >
> >
> >
>=20
> "From: " line is missing in this patch and several others of this
> series. "git am" applies them with an email only so Matthew needs to
> fix them when applying them or you could just resend them with
> git-format-patch?

Crap I messed this up again, my mistake.  I'll go fix this up right now=
=2E
The original patch is correct, 'quilt mail' is the one that drops the
proper "From:" authorship on these messages when sending them out, whic=
h
is what I am using here.

I'll resend right now.

thanks,

greg k-h
