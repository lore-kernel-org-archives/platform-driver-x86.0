From: Darren Hart <dvhart@infradead.org>
Subject: Re: [Patch v3] apple-gmux: lock iGP IO to protect from vgaarb changes
Date: Fri, 29 May 2015 18:36:50 +0200
Message-ID: <20150529163650.GA94698@vmdeb7>
References: <20150305232038.1873d380@neptune.home>
 <20150306174254.GB19001@vmdeb7>
 <20150307011546.0050279d@neptune.home>
 <20150309225238.0b9ced4e@neptune.home>
 <CAErSpo61r-_hy1hfUMm2ooXZVLTBhtjd-x5uXbyEg=WcG=itnQ@mail.gmail.com>
 <20150311223445.6af76f7c@neptune.home>
 <CAGr1u3tKVtQno=hUrKemLFYG12dtvPjFVR7oFwDG5cewJGCnJQ@mail.gmail.com>
 <20150527044749.GB21644@fury.dvhart.com>
 <CAGr1u3t1+ktKG_v74nQ2H6txGcWSwBBfsWS74k0Ao2pNTvgAng@mail.gmail.com>
 <20150527081323.35a3cf88@pluto.restena.lu>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150527081323.35a3cf88@pluto.restena.lu>
Sender: linux-pci-owner@vger.kernel.org
To: Bruno =?iso-8859-1?Q?Pr=E9mont?= <bonbons@linux-vserver.org>
Cc: Michael Marineau <michael.marineau@coreos.com>, Bjorn Helgaas <bhelgaas@google.com>, platform-driver-x86@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Petri Hodju <petrihodju@yahoo.com>, Matthew Garrett <matthew.garrett@nebula.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, May 27, 2015 at 08:13:23AM +0200, Bruno Pr=E9mont wrote:
> On Tue, 26 May 2015 22:35:46 -0700 Michael Marineau wrote:
> > On Tue, May 26, 2015 at 9:47 PM, Darren Hart <dvhart@infradead.org>=
 wrote:
> > > On Tue, May 26, 2015 at 12:10:48PM -0700, Michael Marineau wrote:
> > >> FYI, this actually broke backlight controls on my MBP11,3 becaus=
e the
> > >> assumption the patch makes that gmux is always loaded before gra=
phics
> > >> drivers didn't hold true. At least for me dracut included the no=
uveau
> > >> module in the initrd but not gmux, ensuring the ordering was wro=
ng. No
> > >> errors were reporting, and gmux still offered the backlight devi=
ce, it
> > >> just became inoperable. I worked around this for my kernel by bu=
ilding
> > >> gmux into vmlinuz instead of as a module but that isn't going to=
 in
> > >> more general configs because there is an apple backlight driver =
which
> > >> cannot be built at all in that configuration.
> > >>
> > >
> > > Thank you for reporting this Michael,
> > >
> > > That is tough as nouveau doesn't have an explicit dependency on g=
mux, so we
> > > could do something like a passive request_module(), but if it isn=
't in the
> > > initrd image, it would still fail as you describe.
> > >
> > >> Is there a way to make the ordering between nouveau and gmux mor=
e
> > >> explicit/reliable? Can gmux complain loudly if the ordering is e=
ver
> > >> wrong?
> > >
> > > It should print an error if the probe fails due to the IO already=
 being in use
> > > or if it can't be allocated. The disabled IO case is only info le=
vel though,
> > > perhaps that should be higher priority. Printing something when f=
ailing to probe
> > > seems like a reasonable thing to do.
> > >
> > > Michael, which message do you get if you boot with "debug" or "lo=
glevel=3D6" when
> > > apple-gmux is not built-in?
> >=20
> > No error, gmux claims it worked:
> > [   13.693379] apple_gmux: Found gmux version 4.0.8 [indexed]
> > [   13.693400] vgaarb: device changed decodes:
> > PCI:0000:01:00.0,olddecodes=3Dio+mem,decodes=3Dio+mem:owns=3Dnone
> > [   13.693404] apple_gmux: locked IO for PCI:0000:01:00.0
> >=20
> > Full dmesg: https://gist.github.com/marineam/0e5a23548e8b3b2e1d50
>=20
> What GPUs are there in your MBP11,3? From your dmesg it looks like al=
l
> you have is NVIDIA GPU 0000:01:00.0 (lspci?).
>=20
> Is there a somehow hidden intel GPU around doing the backlight?
> If so my locking does the wrong thing for your system as:
>=20
> [    0.393298] vgaarb: device added: PCI:0000:01:00.0,decodes=3Dio+me=
m,owns=3Dnone,locks=3Dnone
> [    0.393299] vgaarb: loaded
> [    0.393300] vgaarb: setting as boot device: PCI:0000:01:00.0
> [    0.393301] vgaarb: bridge control possible 0000:01:00.0
> ...
> [   13.693379] apple_gmux: Found gmux version 4.0.8 [indexed]
> [   13.693400] vgaarb: device changed decodes: PCI:0000:01:00.0,oldde=
codes=3Dio+mem,decodes=3Dio+mem:owns=3Dnone
> [   13.693404] apple_gmux: locked IO for PCI:0000:01:00.0
>=20
> Here it triggers "olddecodes=3Dnone -> io+mem".
>=20
> Making sure to lock only the intel GPU when present and especially pr=
otecting
> against nvidia driver will be hard if legacy-IO is being processed by=
 a hidden
> device!

Ugh indeed. Worst case we can special case via dmi strings. Is this App=
le device
significantly different from others? Bruno, what are you testing on?

--=20
Darren Hart
Intel Open Source Technology Center
