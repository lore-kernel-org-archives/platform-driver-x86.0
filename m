From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH v6 14/14] platform/x86: dell-smbios-wmi: introduce
 userspace interface
Date: Tue, 10 Oct 2017 14:17:48 +0000
Message-ID: <ea5e28972c5a485f988256de5e4e7289@ausx13mpc120.AMER.DELL.COM>
References: <cover.1507589249.git.mario.limonciello@dell.com>
 <411980beb5697e312145ef268516f4cc7c585b8f.1507589249.git.mario.limonciello@dell.com>
 <20171010135920.GD8662@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171010135920.GD8662@kroah.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: greg@kroah.com
Cc: dvhart@infradead.org, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de
List-Id: platform-driver-x86.vger.kernel.org



> -----Original Message-----
> From: Greg KH [mailto:greg@kroah.com]
> Sent: Tuesday, October 10, 2017 8:59 AM
> To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> Cc: dvhart@infradead.org; Andy Shevchenko <andy.shevchenko@gmail.com>;
> LKML <linux-kernel@vger.kernel.org>; platform-driver-x86@vger.kernel.org;
> Andy Lutomirski <luto@kernel.org>; quasisec@google.com;
> pali.rohar@gmail.com; rjw@rjwysocki.net; mjg59@google.com; hch@lst.de
> Subject: Re: [PATCH v6 14/14] platform/x86: dell-smbios-wmi: introduce
> userspace interface
>=20
> On Mon, Oct 09, 2017 at 05:51:52PM -0500, Mario Limonciello wrote:
> > +	ret =3D device_create_file(&wdev->dev, &priv->req_buf_size_attr);
> > +	if (ret)
> > +		goto fail_create_sysfs;
>=20
> Why isn't the "WMI core" creating this sysfs file?  Why have per-driver
> sysfs files, making all of the different apis totally different?  It's a
> "common" attribute that they are all going to have to provide, right?
>=20
I hadn't really thought about that.  I suppose it's entirely reasonable
to have a way that all WMI ioctls for future drivers will advertise the siz=
e
of their expected buffer the same way.

So this does beg a question to others on this distribution who have worked
on WMI drivers- do you know of any WM**/ methods with multiple instances=20
that use different buffer sizes, or is it reasonable to expect that the buf=
fer size=20
is consistent between instances?

Even in advanced MOF designs I haven't seen it, but this makes me
wonder if an attribute should be created for every instance to be future pr=
oof.
(For example $GUID/required_buffer_size/instance0,=20
$GUID/required_buffer_size/instance1 etc)

> That way you also don't race with userspace :)
>=20
> thanks,
>=20
> greg k-h
