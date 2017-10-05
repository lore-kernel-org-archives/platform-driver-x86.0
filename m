From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH v4 13/14] platform/x86: dell-smbios-wmi: introduce
 userspace interface
Date: Thu, 5 Oct 2017 16:48:16 +0000
Message-ID: <9b58d0a8796948f39776d6bb38bcb9d6@ausx13mpc120.AMER.DELL.COM>
References: <cover.1507156392.git.mario.limonciello@dell.com>
 <ad918eaaa2c9cab878d92be4691cb67f44d13681.1507156392.git.mario.limonciello@dell.com>
 <20171005145911.06a5644c@alans-desktop>
 <d8678883f1164ca4b3be13d56293cb2c@ausx13mpc120.AMER.DELL.COM>
 <20171005154445.GC29347@kroah.com> <20171005155619.GA10938@pali>
 <20171005162810.GB4993@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa5.dell-outbound.iphmx.com ([68.232.153.95]:39367 "EHLO
        esa5.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751334AbdJEQsT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 5 Oct 2017 12:48:19 -0400
In-Reply-To: <20171005162810.GB4993@kroah.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: gregkh@linuxfoundation.org, pali.rohar@gmail.com
Cc: gnomes@lxorguk.ukuu.org.uk, dvhart@infradead.org, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de

> -----Original Message-----
> From: Greg KH [mailto:gregkh@linuxfoundation.org]
> Sent: Thursday, October 5, 2017 11:28 AM
> To: Pali Roh=E1r <pali.rohar@gmail.com>
> Cc: Limonciello, Mario <Mario_Limonciello@Dell.com>;
> gnomes@lxorguk.ukuu.org.uk; dvhart@infradead.org;
> andy.shevchenko@gmail.com; linux-kernel@vger.kernel.org; platform-driver-
> x86@vger.kernel.org; luto@kernel.org; quasisec@google.com;
> rjw@rjwysocki.net; mjg59@google.com; hch@lst.de
> Subject: Re: [PATCH v4 13/14] platform/x86: dell-smbios-wmi: introduce
> userspace interface
>=20
> On Thu, Oct 05, 2017 at 05:56:19PM +0200, Pali Roh=E1r wrote:
> > On Thursday 05 October 2017 17:44:45 Greg KH wrote:
> > > On Thu, Oct 05, 2017 at 02:22:37PM +0000, Mario.Limonciello@dell.com
> wrote:
> > > > > -----Original Message-----
> > > > > From: Alan Cox [mailto:gnomes@lxorguk.ukuu.org.uk]
> > > > > Sent: Thursday, October 5, 2017 8:59 AM
> > > > > To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> > > > > Cc: dvhart@infradead.org; Andy Shevchenko
> <andy.shevchenko@gmail.com>;
> > > > > LKML <linux-kernel@vger.kernel.org>; platform-driver-
> x86@vger.kernel.org;
> > > > > Andy Lutomirski <luto@kernel.org>; quasisec@google.com;
> > > > > pali.rohar@gmail.com; rjw@rjwysocki.net; mjg59@google.com;
> hch@lst.de; Greg
> > > > > KH <greg@kroah.com>
> > > > > Subject: Re: [PATCH v4 13/14] platform/x86: dell-smbios-wmi: intr=
oduce
> > > > > userspace interface
> > > > >
> > > > > On Wed,  4 Oct 2017 17:48:39 -0500
> > > > > Mario Limonciello <mario.limonciello@dell.com> wrote:
> > > > >
> > > > > > This userspace character device will be used to perform SMBIOS =
calls
> > > > > > from any applications.
> > > > > >
> > > > > > It provides an ioctl that will allow passing the 32k WMI callin=
g
> > > > > > interface buffer between userspace and kernel space.
> > > > >
> > > > > What is your security model for firing 32K of random crap at the =
BIOS ?
> > > >
> > > > Adding new class and select methods requires a review with the secu=
rity
> > > > team.  They will do STRIDE analysis and threat modeling.
> > > >
> > > > > Do you fuzz test the BIOS interface ?
> > > >
> > > > Yes there has been internal fuzz testing classes and selects used i=
n the
> > > > ACPI interface in the past.  I can't comment on how regularly that =
is done.
> > > > I do think it's interesting is to use the interface in Linux for fu=
rther fuzz
> > > > testing though.
> > >
> > > That should be simple, start firing random data at this memory locati=
on
> > > and see what happens.  Can you brick the box?  Change the
> > > manufactured-date?  Change the serial number?  Normally these types o=
f
> > > BIOS interfaces allow all sorts of "fun" things like this, which is w=
hy
> > > we have the kernel "own" the interface, to protect yourself from
> > > breaking the box.
> >
> > There are also Dell calls to "permanently disable TPM" and similar whic=
h
> > are irreversible. So this can be really a problem.
> >
> > > > > How do we know that between now and the end of the universe every
> call is
> > > > > safe to execute as any random user without upsetting other users =
on the
> > > > > same PC ?
> > > >
> > > > Any random user shouldn't be executing the ioctl.
> > > > Only root should be executing any of these calls.
> > >
> > > "only root" isn't the best protection method, you should know better =
:)
> > >
> > > You are going to have to do some kind of parsing/whitelisting here,
> > > trust us...
> >
> > That is also why I in past suggested to create fully transparent
> > whitelisting filter for all WMI calls. And properly implement particula=
r
> > filter in kernel...
> >
> > But that is of course hard as you need to know all details of internal
> > structures and data which may be sent via userspace. To prevent e.g.
> > action "permanently disable TPM" in kernel.
>=20
> It's not "hard" as userspace would have to know these same things if it
> were to just have an clean "pipe" to the BIOS as it has to create and
> parse the commands to get the BIOS to do anything.
>=20
> So I agree with you, whitelisting seems to be the only sane solution,
> unless people don't like their TPMs to be erased by root exploits?  :)
>=20
> thanks,
>=20
> greg k-h

Permanently disable TPM can't be run from OS through this interface.
Something like that requires a special manufacturing mode (which also
can't be activated through this interface).

There are some "write once" items that for the general purpose user that
won't brick a box, but should probably be blacklisted though.
I'll think this through some more.
