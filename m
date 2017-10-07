From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH v5 13/14] platform/x86: wmi: create character devices when
 requested by drivers
Date: Sat, 7 Oct 2017 11:59:52 +0000
Message-ID: <88208982e2b14b069bd58773180b5713@ausx13mpc120.AMER.DELL.COM>
References: <cover.1507350554.git.mario.limonciello@dell.com>
 <2c724d763554830fc1ba49a1a9147de9ad5bf294.1507350554.git.mario.limonciello@dell.com>
 <20171007073454.GA25755@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa2.dell-outbound.iphmx.com ([68.232.149.220]:64793 "EHLO
        esa2.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751004AbdJGMAA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 7 Oct 2017 08:00:00 -0400
In-Reply-To: <20171007073454.GA25755@kroah.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: greg@kroah.com
Cc: dvhart@infradead.org, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de



> -----Original Message-----
> From: Greg KH [mailto:greg@kroah.com]
> Sent: Saturday, October 7, 2017 2:35 AM
> To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> Cc: dvhart@infradead.org; Andy Shevchenko <andy.shevchenko@gmail.com>;
> LKML <linux-kernel@vger.kernel.org>; platform-driver-x86@vger.kernel.org;
> Andy Lutomirski <luto@kernel.org>; quasisec@google.com;
> pali.rohar@gmail.com; rjw@rjwysocki.net; mjg59@google.com; hch@lst.de
> Subject: Re: [PATCH v5 13/14] platform/x86: wmi: create character devices=
 when
> requested by drivers
>=20
> On Fri, Oct 06, 2017 at 11:59:57PM -0500, Mario Limonciello wrote:
> > For WMI operations that are only Set or Query read or write sysfs
> > attributes created by WMI vendor drivers make sense.
> >
> > For other WMI operations that are run on Method, there needs to be a
> > way to guarantee to userspace that the results from the method call
> > belong to the data request to the method call.  Sysfs attributes don't
> > work well in this scenario because two userspace processes may be
> > competing at reading/writing an attribute and step on each other's
> > data.
> >
> > When a WMI vendor driver declares an ioctl callback in the wmi_driver
> > the WMI bus driver will create a character device that maps to that
> > function.
> >
> > That character device will correspond to this path:
> > /dev/wmi/$driver
> >
> > The WMI bus driver will interpret the IOCTL calls, test them for
> > a valid instance and pass them on to the vendor driver to run.
> >
> > This creates an implicit policy that only driver per character
> > device.  If a module matches multiple GUID's, the wmi_devices
> > will need to be all handled by the same wmi_driver if the same
> > character device is used.
> >
> > The WMI vendor drivers will be responsible for managing access to
> > this character device and proper locking on it.
> >
> > When a WMI vendor driver is unloaded the WMI bus driver will clean
> > up the character device.
>=20
> What prevents the vendor driver from being unloaded while the ioctl is
> being called in it?  I don't see any protection here from that at all :(
>=20

In my driver I take a mutex that blocks unloading while running ioctl,=20
but you mean you want one in the bus driver more generally, OK.

> > +static long wmi_unlocked_ioctl(struct file *filp, unsigned int cmd,
> > +			       unsigned long arg)
> > +{
> > +	return match_ioctl(filp, cmd, arg, 0);
> > +}
> > +
> > +static long wmi_compat_ioctl(struct file *filp, unsigned int cmd,
> > +			     unsigned long arg)
> > +{
> > +	return match_ioctl(filp, cmd, arg, 1);
> > +}
>=20
> Why a compat ioctl at all?  That's for older interfaces, not for brand
> new ones where you design the ioctl structures "correctly" to work on
> both 32 and 64 bits at the same time.  That should not be needed at all.
>=20
> thanks,
>=20
> greg k-h

I was trying to make sure that any other future vendor drivers had it for a=
n
option.  I wasn't aware that new code shouldn't use it.   OK, I'll remove i=
t.
