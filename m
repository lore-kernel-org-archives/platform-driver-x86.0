From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH v10 13/15] platform/x86: wmi: create userspace interface
 for drivers
Date: Fri, 20 Oct 2017 13:54:54 +0000
Message-ID: <f889aa55ce204843be4bb32f4ae2ee2f@ausx13mpc120.AMER.DELL.COM>
References: <cover.1508434513.git.mario.limonciello@dell.com>
 <175838453318108ae69be344c4d3a2b75c2edc69.1508434514.git.mario.limonciello@dell.com>
 <20171020132242.GB23973@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171020132242.GB23973@kroah.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: greg@kroah.com
Cc: dvhart@infradead.org, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, gnomes@lxorguk.ukuu.org.uk
List-Id: platform-driver-x86.vger.kernel.org

> -----Original Message-----
> From: Greg KH [mailto:greg@kroah.com]
> Sent: Friday, October 20, 2017 8:23 AM
> To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> Cc: dvhart@infradead.org; Andy Shevchenko <andy.shevchenko@gmail.com>;
> LKML <linux-kernel@vger.kernel.org>; platform-driver-x86@vger.kernel.org;=
 Andy
> Lutomirski <luto@kernel.org>; quasisec@google.com; pali.rohar@gmail.com;
> rjw@rjwysocki.net; mjg59@google.com; hch@lst.de; Alan Cox
> <gnomes@lxorguk.ukuu.org.uk>
> Subject: Re: [PATCH v10 13/15] platform/x86: wmi: create userspace interf=
ace for
> drivers
>=20
> On Thu, Oct 19, 2017 at 12:50:16PM -0500, Mario Limonciello wrote:
> > +static ssize_t wmi_char_read(struct file *filp, char __user *buffer,
> > +	size_t length, loff_t *offset)
> > +{
> > +	struct wmi_block *wblock =3D filp->private_data;
> > +	size_t count;
> > +
> > +	if (*offset !=3D 0)
> > +		return 0;
> > +
> > +	count =3D sizeof(wblock->req_buf_size);
> > +	count =3D length < count ? length : count;
> > +
> > +	if (copy_to_user(buffer, &wblock->req_buf_size, count))
> > +		return -EFAULT;
> > +
> > +	*offset =3D count;
> > +	return count;
>=20
> simple_read_from_buffer()?  Library functions are your friend :)
>=20
Thanks, wasn't aware of it.
