From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH v4] platform: x86: Add ACPI driver for ChromeOS
Date: Wed, 10 Jun 2020 21:52:12 +0000
Message-ID: <adf9daaf08f1464684e48ec203194fe9@AUSX13MPC105.AMER.DELL.COM>
References: <20200413134611.478441-1-enric.balletbo@collabora.com>
 <CAJZ5v0gWZ27_DwWQadsJOUxLo4a0rAMe45d4AWXS2gHJZfgfKg@mail.gmail.com>
 <a2953d50-da22-279a-f1e4-faa796d815b1@collabora.com>
 <10490419.gsntqH5CaE@kreacher>
 <4e7f8bf3-b72b-d418-ec95-e1f8c3d61261@collabora.com>
 <59771d3689da41a5bbc67541aa6f4777@AUSX13MPC105.AMER.DELL.COM>
 <20200610214033.GB248110@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <20200610214033.GB248110@dtor-ws>
Content-Language: en-US
Sender: linux-acpi-owner@vger.kernel.org
To: dmitry.torokhov@gmail.com
Cc: enric.balletbo@collabora.com, rjw@rjwysocki.net, rafael@kernel.org, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, lenb@kernel.org, kernel@collabora.com, groeck@chromium.org, bleung@chromium.org, dtor@chromium.org, gwendal@chromium.org, vbendeb@chromium.org, andy@infradead.org, ayman.bagabas@gmail.com, benjamin.tissoires@redhat.com, blaz@mxxn.io, dvhart@infradead.org, gregkh@linuxfoundation.org, hdegoede@redhat.com, jeremy@system76.com, 2pi@mok.nu, mchehab+samsung@kernel.org, rajatja@google.com, srinivas.pandruvada@linux.intel.com, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

> -----Original Message-----
> From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Sent: Wednesday, June 10, 2020 4:41 PM
> To: Limonciello, Mario
> Cc: enric.balletbo@collabora.com; rjw@rjwysocki.net; rafael@kernel.org;
> linux-kernel@vger.kernel.org; linux-acpi@vger.kernel.org; lenb@kernel.org=
;
> kernel@collabora.com; groeck@chromium.org; bleung@chromium.org;
> dtor@chromium.org; gwendal@chromium.org; vbendeb@chromium.org;
> andy@infradead.org; ayman.bagabas@gmail.com; benjamin.tissoires@redhat.co=
m;
> blaz@mxxn.io; dvhart@infradead.org; gregkh@linuxfoundation.org;
> hdegoede@redhat.com; jeremy@system76.com; 2pi@mok.nu;
> mchehab+samsung@kernel.org; rajatja@google.com;
> srinivas.pandruvada@linux.intel.com; platform-driver-x86@vger.kernel.org
> Subject: Re: [PATCH v4] platform: x86: Add ACPI driver for ChromeOS
>=20
>=20
> [EXTERNAL EMAIL]
>=20
> On Wed, Jun 10, 2020 at 09:28:36PM +0000, Mario.Limonciello@dell.com wrot=
e:
> > >
> > > To give you some references, if I'm not wrong, this prefix is used in
> all
> > > or
> > > almost all Intel Chromebook devices (auron, cyan, eve, fizz, hatch,
> > > octopus,
> > > poppy, strago ...) The ACPI source for this device can be found here
> [1],
> > > and,
> > > if not all, almost all Intel based Chromebooks are shipped with the
> > > firmware
> > > that supports this.
> >
> > You can potentially carry a small patch in your downstream kernel for t=
he
> > legacy stuff until it reaches EOL.  At least for the new stuff you coul=
d
> > enact a process that properly reserves unique numbers and changes the
> driver
> > when the interface provided by the ACPI device has changed.
>=20
> If we use this prefix for hatch EOL is ~7 years from now.
>=20

Isn't the whole point of the ACPI registry and choosing an ID?  You know in=
ternally
if you need to change the interface that a new ID is needed and a new drive=
r will
be needed that comprehends that ID change.  So if you can't guarantee that =
0001 is
the same driver interface in every firmware implementation google used then=
 that is
where this falls apart.

I know there is a long support lifecycle but you're talking about rebasing
to new LTS kernels a handful of times between now and then.  If the interfa=
ce really
is stable the patch should be small and it shouldn't be a large amount of t=
echnical
debt to carry downstream until EOL.
=20
