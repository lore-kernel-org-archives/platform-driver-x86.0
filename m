From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH v9 11/17] platform/x86: dell-smbios-smm: test for WSMT
Date: Wed, 18 Oct 2017 19:10:59 +0000
Message-ID: <c8aca75209f042e689f51c53caed80aa@ausx13mpc124.AMER.DELL.COM>
References: <cover.1508259916.git.mario.limonciello@dell.com>
 <e552ba67da7281d184936a551501c4040510b372.1508259916.git.mario.limonciello@dell.com>
 <20171017192258.fx2ejggjkyzkrzle@pali> <20171018190927.GA1097@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171018190927.GA1097@fury>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, pali.rohar@gmail.com
Cc: andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, greg@kroah.com, gnomes@lxorguk.ukuu.org.uk
List-Id: platform-driver-x86.vger.kernel.org

> -----Original Message-----
> From: Darren Hart [mailto:dvhart@infradead.org]
> Sent: Wednesday, October 18, 2017 2:09 PM
> To: Pali Roh=E1r <pali.rohar@gmail.com>
> Cc: Limonciello, Mario <Mario_Limonciello@Dell.com>; Andy Shevchenko
> <andy.shevchenko@gmail.com>; LKML <linux-kernel@vger.kernel.org>; platfor=
m-
> driver-x86@vger.kernel.org; Andy Lutomirski <luto@kernel.org>;
> quasisec@google.com; rjw@rjwysocki.net; mjg59@google.com; hch@lst.de; Gre=
g
> KH <greg@kroah.com>; Alan Cox <gnomes@lxorguk.ukuu.org.uk>
> Subject: Re: [PATCH v9 11/17] platform/x86: dell-smbios-smm: test for WSM=
T
>=20
> On Tue, Oct 17, 2017 at 09:22:58PM +0200, Pali Roh=E1r wrote:
> > On Tuesday 17 October 2017 13:21:55 Mario Limonciello wrote:
> > > +/* When enabled this indicates that SMM won't work */
> > > +static int test_wsmt_enabled(void)
> > > +{
> > > +	struct calling_interface_token *token;
> > > +
> > > +	/* if token doesn't exist, SMM will work */
> > > +	token =3D dell_smbios_find_token(WSMT_EN_TOKEN);
> > > +	if (!token)
> > > +		return 0;
> > > +
> > > +	/* if token exists, try to access over SMM */
> > > +	buffer->class =3D CLASS_TOKEN_READ;
> > > +	buffer->select =3D SELECT_TOKEN_STD;
> > > +	memset(buffer, 0, sizeof(struct calling_interface_buffer));
> > > +	buffer->input[0] =3D token->location;
> > > +	dell_smbios_smm_call(buffer);
> > > +
> > > +	/* if lookup failed, we know WSMT was enabled */
> > > +	if (buffer->output[0] !=3D 0)
> > > +		return 1;
> > > +
> > > +	/* query token status if it didn't fail */
> > > +	return (buffer->output[1] =3D=3D token->value);
> > > +}
> >
> > Maybe small suggestion... function returns only zero or one -- what is =
a
> > good candidate to have return value boolean and not basic int.
>=20
> Yes please.
>=20

OK I'll adjust this (and the other things Pali sent recently) in the next s=
ubmission.

Just waiting on feedback for some of the other areas before sending off aga=
in.
