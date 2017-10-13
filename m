From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH v7 10/15] platform/x86: dell-smbios: add filtering
 capability for requests
Date: Fri, 13 Oct 2017 15:44:18 +0000
Message-ID: <dcf35817f6234dac99b51e9eea2c7c78@ausx13mpc124.AMER.DELL.COM>
References: <cover.1507733291.git.mario.limonciello@dell.com>
        <83dc225624f1cde5ee1797aebc945732444ded91.1507733291.git.mario.limonciello@dell.com>
        <20171012110903.3ab4ed5e@alans-desktop> <20171013004645.GB1470@fury>
        <20171013094314.GB29864@kroah.com>
        <62ce0707d58b42618128e68f3bb9a45f@ausx13mpc124.AMER.DELL.COM>
 <20171013161936.430f7a02@alans-desktop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171013161936.430f7a02@alans-desktop>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: gnomes@lxorguk.ukuu.org.uk
Cc: greg@kroah.com, dvhart@infradead.org, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de
List-Id: platform-driver-x86.vger.kernel.org

> -----Original Message-----
> From: Alan Cox [mailto:gnomes@lxorguk.ukuu.org.uk]
> Sent: Friday, October 13, 2017 10:20 AM
> To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> Cc: greg@kroah.com; dvhart@infradead.org; andy.shevchenko@gmail.com;
> linux-kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org;
> luto@kernel.org; quasisec@google.com; pali.rohar@gmail.com;
> rjw@rjwysocki.net; mjg59@google.com; hch@lst.de
> Subject: Re: [PATCH v7 10/15] platform/x86: dell-smbios: add filtering ca=
pability
> for requests
>=20
> On Fri, 13 Oct 2017 15:03:10 +0000
> > Take off your "kernel" hat and put on a "customer" hat for a few moment=
s
> > while I try to put this in practical terms why the whitelist approach d=
oesn't
> > scale for what I'm trying to do.
>=20
> As a customer I'm more worried about someone trashing my system or
> breaking my security.
>=20
> > So considering the above isn't offering stuff like this a decision bett=
er made by
> the OEM?
> > If the OEM  doen't want customers to be able to modify something we don=
't
> offer it in the
> > manageability interface.  If the kernel community doesn't want people t=
o be
> > modifying something the OEM does offer, it can just as well be blacklis=
ted in
> the
> > kernel driver like the current filtering approach offers.
>=20
> So you implement the rule
>=20
> 	if (whitelisted & (capabilities && whitelist->capability_need) =3D=3D
> 	whitelist->capability_need))
> 		return ALLOWED;
>=20
> 	if (capable(CAP_SYS_RAWIO))
> 		return ALLOWED;
>=20
> 	return NO
>=20
> This puts you in the position where - known tools work and can sometimes
> be unprivileged. Privileged tools with enough priv to screw the machien
> can work anyway. Which is better than the starting point
>=20
>=20
> You could further enhance this by having a CAP_SYS_RAWIO interface to add
> whitelist entries, or to add an eBPF filter that can also make decisions
> for you.
>=20
> Now you've got the ability to push a policy update.
>=20
> Alan

Thanks for this idea, I think it's productive in working towards a solution=
.

I'll give it some more thought on what items I feel should be whitelisted t=
o
unprivileged processes.  I feel like the number of entries that match this =
will
be fairly low.

I think I'd actually like to meld this with your other ideas and what I've=
=20
currently got.  What do you think of this approach:

	/* kernel community doesn't feel userspace should have access at all
	  * or other kernel drivers use this
	  */
	if (blacklisted)
		return NO;

	/* unprivileged access allowed */
 	if (whitelisted & (capabilities && whitelist->capability_need) =3D=3D
 	whitelist->capability_need))
 		return ALLOWED;
=20
	/* not yet in whitelist, or need privs to do */
 	if (capable(CAP_SYS_RAWIO))
 		return ALLOWED;
=20
 	return NO
