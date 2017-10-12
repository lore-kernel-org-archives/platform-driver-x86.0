From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH v7 10/15] platform/x86: dell-smbios: add filtering
 capability for requests
Date: Thu, 12 Oct 2017 13:23:08 +0000
Message-ID: <1200feb837864baa8a3be9740413f2e9@ausx13mpc120.AMER.DELL.COM>
References: <cover.1507733291.git.mario.limonciello@dell.com>
        <83dc225624f1cde5ee1797aebc945732444ded91.1507733291.git.mario.limonciello@dell.com>
 <20171012110903.3ab4ed5e@alans-desktop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171012110903.3ab4ed5e@alans-desktop>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: gnomes@lxorguk.ukuu.org.uk
Cc: dvhart@infradead.org, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, greg@kroah.com
List-Id: platform-driver-x86.vger.kernel.org

> -----Original Message-----
> From: Alan Cox [mailto:gnomes@lxorguk.ukuu.org.uk]
> Sent: Thursday, October 12, 2017 5:09 AM
> To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> Cc: dvhart@infradead.org; Andy Shevchenko <andy.shevchenko@gmail.com>;
> LKML <linux-kernel@vger.kernel.org>; platform-driver-x86@vger.kernel.org;
> Andy Lutomirski <luto@kernel.org>; quasisec@google.com;
> pali.rohar@gmail.com; rjw@rjwysocki.net; mjg59@google.com; hch@lst.de; Gr=
eg
> KH <greg@kroah.com>
> Subject: Re: [PATCH v7 10/15] platform/x86: dell-smbios: add filtering ca=
pability
> for requests
>=20
> On Wed, 11 Oct 2017 11:27:36 -0500
> Mario Limonciello <mario.limonciello@dell.com> wrote:
>=20
> > There are some categories of tokens and SMBIOS calls that it makes
> > sense to protect userspace from accessing.  These are calls that
> > may write to one time use fields or activate hardware debugging
> > capabilities.  They are not intended for general purpose use.
> >
> > This same functionality may be be later extended to also intercept
> > calls that may cause kernel functionality to get out of sync if
> > the same functions are used by other drivers.
>=20
> This doesn't work. You are creating an API. If you then have to remove
> parts of the API because it messes stuff up you break your API guarantee.

This potential "problem" already exists in that dcdbas provides a userspace
interface that can manipulate this same data as used by some kernel drivers=
.
The kernel drivers can be brought out of sync then.

We discussed this a while back, you may not be aware of the discussion.

The jist of it came down to that if a driver in the kernel decides to imple=
ment
the same functionality that is available through the calling interface but
with a different interface that the call could be filtered through the call=
ing
interface.

Intercepting/filtering a call doesn't mean breaking API.
It can be handled two ways that I can see and both are valid:

1) Return an error code.  The calling interface already API allows for erro=
r=20
return codes.  Plenty of calls _already_ return errors.  Returning
one for a filtered call is no different.  This would  be an improvement ove=
r how
dcdbas and existing kernel modules handle it.

2) Inspect the buffer and see that it's supposed to be handled by one of
the existing kernel modules.  Pass the call on to the (kernel) driver that =
already=20
handles it, and return the result to userspace.  This will keep the kernel
driver and the userspace return values in sync.

>=20
> As I said before, this needs to be a whitelist of stuff that is safe, and
> it needs to have a security model.=20

From the BIOS perspective if no BIOS administrator password is set the
OS and any tools can access any item in the calling interface.  If a BIOS=20
administrator password has been configured, many calls will return
error codes unless the application has done a security key exchange with
BIOS.  This is both how dcdbas works today and how this interface that I=20
provided to replace it works.

Within Linux the security model is that items accessible through this inter=
face
are only accessible by root.  If userspace tools choose to make items in th=
is=20
interface more widely accessible to say authenticated console users that's=
=20
their prerogative.

> When you make a feature available you
> can't nicely take it away again as you'll break people's user space.

As I said above -ENODEV or -EINVAL is not the same thing as taking a featur=
e
away.  The character device API doesn't change when something is filtered.
It's an error scenario.

>=20
> Start with a whitelist of the ones you know people want to use, or that
> your existing tooling you want to enable uses. Add others as needed in
> future releases of the kernel.
>=20
> Alan

The existing dcdbas calling interface tooling (libsmbios) expects to be abl=
e=20
to access all calls and all tokens.  *The kernel doesn't filter any of it.*

I understand the ask to filter some calls and that's why patch 10/15 exists=
,
but please let me remind you this patch series is intended to /replace and
deprecate/ dcdbas userspace access.
