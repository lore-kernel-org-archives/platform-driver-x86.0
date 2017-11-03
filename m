From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH] platform/x86: dell-*wmi*: Relay failed initial probe to
 dependent drivers
Date: Fri, 3 Nov 2017 14:42:55 +0000
Message-ID: <8a19372f91e34d96ab16e8d4c31b0c86@ausx13mpc124.AMER.DELL.COM>
References: <bdaec2635c4c38e869a5690db2426d7440222949.1509564191.git.mario.limonciello@dell.com>
 <20171103005632.GB7971@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171103005632.GB7971@fury>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org
Cc: andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, pali.rohar@gmail.com
List-Id: platform-driver-x86.vger.kernel.org

> -----Original Message-----
> From: Darren Hart [mailto:dvhart@infradead.org]
> Sent: Thursday, November 2, 2017 7:57 PM
> To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> Cc: Andy Shevchenko <andy.shevchenko@gmail.com>; LKML <linux-
> kernel@vger.kernel.org>; platform-driver-x86@vger.kernel.org;
> pali.rohar@gmail.com
> Subject: Re: [PATCH] platform/x86: dell-*wmi*: Relay failed initial probe=
 to
> dependent drivers
>=20
> On Wed, Nov 01, 2017 at 02:28:21PM -0500, Mario Limonciello wrote:
> > dell-wmi and dell-smbios-wmi are dependent upon dell-wmi-descriptor
> > finishing probe successfully to probe themselves.
> >
> > Currently if dell-wmi-descriptor fails probing in a non-recoverable way
> > (such as invalid header) dell-wmi and dell-smbios-wmi will continue to
> > try to redo probing due to deferred probing.
> >
> > To solve this have the dependent drivers query the dell-wmi-descriptor
> > driver whether the descriptor has been determined valid. The possible
> > results are:
> > -EPROBE_DEFER: Descriptor not yet probed, dependent driver should wait
> >  and use deferred probing
> > < 0: Descriptor probed, invalid.  Dependent driver should return an
> >  error.
> > 0: Successful descriptor probe, dependent driver can continue
> >
> > Successful descriptor probe still doesn't mean that the descriptor driv=
er
> > is necessarily bound at the time of initialization of dependent driver.
> > Userspace can unbind the driver, so all methods used from driver
> > should still be verified to return success values otherwise deferred
> > probing be used.
> >
> > Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
>=20
> > diff --git a/drivers/platform/x86/dell-wmi-descriptor.c
> b/drivers/platform/x86/dell-wmi-descriptor.c
> > index 3204c408e261..33c6c7d66f8c 100644
> > --- a/drivers/platform/x86/dell-wmi-descriptor.c
> > +++ b/drivers/platform/x86/dell-wmi-descriptor.c
> > @@ -26,9 +26,16 @@ struct descriptor_priv {
> >  	u32 interface_version;
> >  	u32 size;
> >  };
> > +static int descriptor_valid;
>=20
> This initializes to 0, which I believe creates an odd race window between=
 when
> this init is called and when the first driver calls
> dell_wmi_get_descriptor_valid(). Seems like initializing to -EPROBE_DEFER=
 here
> in the declaration would be a better right approach.
>=20
> --

Thanks, good catch.  I'll adjust.
