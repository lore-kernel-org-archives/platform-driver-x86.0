From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH v7 10/15] platform/x86: dell-smbios: add filtering
 capability for requests
Date: Fri, 13 Oct 2017 17:47:08 +0000
Message-ID: <6acfc127a7a94a9cbccfed2a35c88782@ausx13mpc124.AMER.DELL.COM>
References: <cover.1507733291.git.mario.limonciello@dell.com>
 <83dc225624f1cde5ee1797aebc945732444ded91.1507733291.git.mario.limonciello@dell.com>
 <20171012110903.3ab4ed5e@alans-desktop> <20171013004645.GB1470@fury>
 <20171013094314.GB29864@kroah.com>
 <62ce0707d58b42618128e68f3bb9a45f@ausx13mpc124.AMER.DELL.COM>
 <20171013155603.GA3491@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa2.dell-outbound.iphmx.com ([68.232.149.220]:59970 "EHLO
        esa2.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751981AbdJMRrK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 13 Oct 2017 13:47:10 -0400
In-Reply-To: <20171013155603.GA3491@kroah.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: greg@kroah.com
Cc: dvhart@infradead.org, gnomes@lxorguk.ukuu.org.uk, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de

> -----Original Message-----
> From: Greg KH [mailto:greg@kroah.com]
> Sent: Friday, October 13, 2017 10:56 AM
> To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> Cc: dvhart@infradead.org; gnomes@lxorguk.ukuu.org.uk;
> andy.shevchenko@gmail.com; linux-kernel@vger.kernel.org; platform-driver-
> x86@vger.kernel.org; luto@kernel.org; quasisec@google.com;
> pali.rohar@gmail.com; rjw@rjwysocki.net; mjg59@google.com; hch@lst.de
> Subject: Re: [PATCH v7 10/15] platform/x86: dell-smbios: add filtering ca=
pability
> for requests
>=20
> Just want to respond to this part first:
>=20
> On Fri, Oct 13, 2017 at 03:03:10PM +0000, Mario.Limonciello@dell.com wrot=
e:
> > Take off your "kernel" hat and put on a "customer" hat for a few moment=
s
> > while I try to put this in practical terms why the whitelist approach d=
oesn't
> > scale for what I'm trying to do.
>=20
> Heh, you do know my background in running an enterprise kernel team,
> right? :)
>=20
> > Let's say hypothetically a future version of this series that has only =
whitelisted
> > commands and tokens lands in a kernel that's in the next Ubuntu LTS, RH=
EL
> > release etc.
> > Hardware coming out about that time works fine, you can control the var=
ious
> > knobs.  Then later that year some new headless hardware is released tha=
t has
> > zigbee controllers that work with inbox kernel drivers but you can't tu=
rn them
> > on and off any way BUT through the manageability interface (it's headle=
ss!).
> > In the manageability interface we also offer a new class/select or toke=
n that
> > can control the GPIO that turns on/off these radios.
>=20
> It's the "later" that you are missing here.  We only have code today for
> hardware we have today.  If you come out with new hardware, you need new
> kernel drivers for it, and as such, "old" enterprise kernels will just
> not work properly.
>=20
> It's always been that way, this is nothing new, we can't predict the
> future, and is one big reason why I think the whole "enterprise" distro
> market is wrong and going to fail in the end :)
>=20
> Same goes for that new device id for the wifi chip, or the video camera
> or the fingerprint reader.  Those have to be added to the kernel, and if
> the distro so desires, backported to their old and crufty version.
>=20

There's plenty of cases you're absolutely right and I have a hate/hate rela=
tionship
regarding in this area.

I was very careful in my example to pick something that it's just the manag=
eability
interface that changes.

> This has been happening for two decades now, somehow coming up with a
> "raw" pipe from userspace to the kernel to control the hardware just
> because you don't want to update the kernel code, isn't going to solve
> the issue here (hint, you now have to update your userspace code, why is
> that suddenly easier than the kernel?)
>=20

It's easier because you can control your own destiny.

Changing the kernel code means submitting something upstream,=20
submitting something to -stable, convincing the enterprise distro folks
to pull in your fix, adding code to your tool to test whether the kernel
supports your newly whitelisted function adding support for this function
to the tool and then posting that tool somewhere for consumption.

Changing userspace code means changing userspace code, posting it
somewhere and you're done.

As Darren mentioned most companies are built around large organizations
with specific touch points.  The people who decide what the next features
will be for manageability aren't the same people who write the tools, who
aren't the same people that implement them in the BIOS and aren't the=20
same people that would be submitting any of this into the kernel.  Asking
every new option to be whitelisted in the kernel and getting that translate=
d
into upstream, into stable, into distros, updating tools for etc is a giant=
 process
undertaking that companies will look at and say uh why?

I think Alan's suggestions are leading this the right way though, whitelist=
ing
for certain unprivileged actions, blacklisting certain actions, looking for=
 capabilities
but still letting tools with the right capabilities or permissions do what =
they
want to do.  It's a balancing act.
