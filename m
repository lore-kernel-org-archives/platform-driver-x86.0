From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH v5 08/14] platform/x86: dell-smbios: Add a sysfs interface
 for SMBIOS tokens
Date: Sat, 7 Oct 2017 11:56:04 +0000
Message-ID: <8ad76b287f8a4f9aa13e7c809cc7b998@ausx13mpc120.AMER.DELL.COM>
References: <cover.1507350554.git.mario.limonciello@dell.com>
 <f8c1a8f8f04773f54c37eb14614cba88cbd7cab9.1507350554.git.mario.limonciello@dell.com>
 <20171007065421.GA20756@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa1.dell-outbound.iphmx.com ([68.232.153.90]:50261 "EHLO
        esa1.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751027AbdJGL4G (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 7 Oct 2017 07:56:06 -0400
In-Reply-To: <20171007065421.GA20756@kroah.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: greg@kroah.com
Cc: dvhart@infradead.org, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de

> -----Original Message-----
> From: Greg KH [mailto:greg@kroah.com]
> Sent: Saturday, October 7, 2017 1:54 AM
> To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> Cc: dvhart@infradead.org; Andy Shevchenko <andy.shevchenko@gmail.com>;
> LKML <linux-kernel@vger.kernel.org>; platform-driver-x86@vger.kernel.org;
> Andy Lutomirski <luto@kernel.org>; quasisec@google.com;
> pali.rohar@gmail.com; rjw@rjwysocki.net; mjg59@google.com; hch@lst.de
> Subject: Re: [PATCH v5 08/14] platform/x86: dell-smbios: Add a sysfs inte=
rface for
> SMBIOS tokens
>=20
> On Fri, Oct 06, 2017 at 11:59:52PM -0500, Mario Limonciello wrote:
> > Currently userspace tools can access system tokens via the dcdbas
> > kernel module and a SMI call that will cause the platform to execute
> > SMM code.
> >
> > With a goal in mind of deprecating the dcdbas kernel module a different
> > method for accessing these tokens from userspace needs to be created.
> >
> > This is intentionally marked to only be readable as root as it can
> > contain sensitive information about the platform's configuration.
> >
> > MAINTAINERS was missing for this driver.  Add myself and Pali to
> > maintainers list for it.
> >
> > Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
> > ---
> >  .../ABI/testing/sysfs-platform-dell-smbios         | 16 ++++++
> >  MAINTAINERS                                        |  7 +++
> >  drivers/platform/x86/dell-smbios.c                 | 64 ++++++++++++++=
++++++++
> >  3 files changed, 87 insertions(+)
> >  create mode 100644 Documentation/ABI/testing/sysfs-platform-dell-smbio=
s
> >
> > diff --git a/Documentation/ABI/testing/sysfs-platform-dell-smbios
> b/Documentation/ABI/testing/sysfs-platform-dell-smbios
> > new file mode 100644
> > index 000000000000..d97f4bd5bd91
> > --- /dev/null
> > +++ b/Documentation/ABI/testing/sysfs-platform-dell-smbios
> > @@ -0,0 +1,16 @@
> > +What:		/sys/devices/platform/<platform>/tokens
> > +Date:		November 2017
> > +KernelVersion:	4.15
> > +Contact:	"Mario Limonciello" <mario.limonciello@dell.com>
> > +Description:
> > +		A read-only description of Dell platform tokens
> > +		available on the machine.
> > +
> > +		The tokens will be displayed in the following
> > +		machine readable format with each token on a
> > +		new line:
> > +
> > +		ID	Location	value
> > +
> > +		For example token:
> > +		5	5	3
>=20
> That's more than "one value per file" which is what sysfs requires, so
> this isn't acceptable, sorry.

What's more acceptable to you to relay this information? =20
Binary sysfs attribute and export the structure format in a uapi?

or a collection of sysfs files?
Eg:
tokens/$x/id
tokens/$x/location
tokens/$s/value

I'm guessing the latter is the better way to go.

>=20
> > +static ssize_t tokens_show(struct device *dev,
> > +			   struct device_attribute *attr, char *buf)
> > +{
> > +	size_t off =3D 0;
> > +	int to_print;
> > +	int i;
> > +
> > +	to_print =3D min(da_num_tokens, (int)(PAGE_SIZE - 1) / 15);
> > +	for (i =3D 0; i < to_print; i++) {
> > +		off +=3D scnprintf(buf+off, PAGE_SIZE-off, "%04x\t%04x\t%04x\n",
> > +		da_tokens[i].tokenID, da_tokens[i].location,
> > +		da_tokens[i].value);
>=20
> Huge hint, if you are checking for the max size of the buffer for sysfs,
> something is really wrong, and you need to redo your design.
>=20
> thanks,
>=20
> greg k-h
