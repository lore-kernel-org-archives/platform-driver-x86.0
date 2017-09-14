From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH v3] Add driver to force WMI Thunderbolt controller power
 status
Date: Thu, 14 Sep 2017 06:42:03 +0000
Message-ID: <27f4070678744d0f80761a95579b4cd3@ausx13mpc120.AMER.DELL.COM>
References: <1504884191-16528-1-git-send-email-mario.limonciello@dell.com>
 <20170913172024.GA8782@wunner.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170913172024.GA8782@wunner.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: lukas@wunner.de
Cc: dvhart@infradead.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, hughsient@gmail.com, yehezkelshb@gmail.com, mika.westerberg@linux.intel.com
List-Id: platform-driver-x86.vger.kernel.org

> -----Original Message-----
> From: Lukas Wunner [mailto:lukas@wunner.de]
> Sent: Wednesday, September 13, 2017 12:20 PM
> To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> Cc: dvhart@infradead.org; LKML <linux-kernel@vger.kernel.org>; platform-d=
river-
> x86@vger.kernel.org; Richard Hughes <hughsient@gmail.com>; Yehezkel Berna=
t
> <yehezkelshb@gmail.com>; Mika Westerberg <mika.westerberg@linux.intel.com=
>
> Subject: Re: [PATCH v3] Add driver to force WMI Thunderbolt controller po=
wer
> status
>=20
> Sorry, late to the party.
>=20
> On Fri, Sep 08, 2017 at 10:23:11AM -0500, Mario Limonciello wrote:
> > +	mode =3D hex_to_bin(buf[0]);
> > +	if (mode =3D=3D 0 || mode =3D=3D 1) {
> > +		status =3D wmi_evaluate_method(INTEL_WMI_THUNDERBOLT_GUID,
> 0, 1,
> > +					     &input, NULL);
> > +		if (ACPI_FAILURE(status)) {
> > +			pr_err("intel-wmi-thunderbolt: failed setting %s\n",
> > +			       buf);
> > +			return -ENODEV;
> > +		}
> > +	} else {
> > +		pr_err("intel-wmi-thunderbolt: unsupported mode: %d", mode);
> > +	}
> > +	return count;
> > +}
>=20
> Seems odd to allow user space to fill the log by writing invalid data
> to sysfs, likewise that success is returned in the else case.
> I'd drop both pr_err() and return -EINVAL in the else case.
>=20

Seems fine to me.  As Darren already queued the patch, I'll send a follow u=
p patch=20
to fix these two cases.

>=20
> > +static const struct wmi_device_id intel_wmi_thunderbolt_id_table[] =3D=
 {
> > +	{ .guid_string =3D INTEL_WMI_THUNDERBOLT_GUID },
> > +	{ },
> > +};
>=20
> I'm not familiar with WMI, but don't you need a MODULE_DEVICE_TABLE here?
> How does user space know which module to load upon receiving the uevent?

Some macros for WMI bus devices.
https://github.com/torvalds/linux/blob/e0f25a3f2d052e36ff67a9b4db835c3e27e9=
50d8/include/linux/wmi.h#L55
https://github.com/torvalds/linux/blob/master/include/linux/device.h#L1487
=20
