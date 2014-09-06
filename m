From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] eeepc-laptop: remove possible use of uninitialized value
Date: Fri, 5 Sep 2014 19:17:57 -0700
Message-ID: <20140906021757.GA9197@vmdeb7>
References: <1409784805-14190-1-git-send-email-fransklaver@gmail.com>
 <1409814488.5546.63.camel@x220>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:45580 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750797AbaIFCSF (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 5 Sep 2014 22:18:05 -0400
Content-Disposition: inline
In-Reply-To: <1409814488.5546.63.camel@x220>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Paul Bolle <pebolle@tiscali.nl>
Cc: Frans Klaver <fransklaver@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Corentin Chary <corentin.chary@gmail.com>, Matthew Garrett <matthew.garrett@nebula.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Rafael Wysocki <rafael.j.wysocki@intel.com>

On Thu, Sep 04, 2014 at 09:08:08AM +0200, Paul Bolle wrote:
> On Thu, 2014-09-04 at 00:53 +0200, Frans Klaver wrote:
> > In store_sys_acpi, if count equals zero, or parse_arg()s sscanf cal=
l
> > fails, 'value' remains possibly uninitialized. In that case 'value'
> > shouldn't be used to produce the store_sys_acpi()s return value.
> >=20
> > Only test the return value of set_acpi() if we can actually call it=
=2E
> > Return rv otherwise.
> >=20
> > Signed-off-by: Frans Klaver <fransklaver@gmail.com>
> > ---
> >  drivers/platform/x86/eeepc-laptop.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/platform/x86/eeepc-laptop.c b/drivers/platform=
/x86/eeepc-laptop.c
> > index bd533c2..41f12ba 100644
> > --- a/drivers/platform/x86/eeepc-laptop.c
> > +++ b/drivers/platform/x86/eeepc-laptop.c
> > @@ -279,10 +279,10 @@ static ssize_t store_sys_acpi(struct device *=
dev, int cm,
> >  	int rv, value;
> > =20
> >  	rv =3D parse_arg(buf, count, &value);
> > -	if (rv > 0)
> > -		value =3D set_acpi(eeepc, cm, value);
> > -	if (value < 0)
> > -		return -EIO;
> > +	if (rv > 0) {
> > +		if (set_acpi(eeepc, cm, value) < 0)
> > +			return -EIO;
> > +	}
> >  	return rv;
> >  }
> > =20
>=20
> The warning that this code (currently) generated triggered me to subm=
it
> https://lkml.org/lkml/2014/7/1/150 , which uses a different approach =
to
> get rid of it. I received no reactions so far. Here's that patch agai=
n:

Thanks for resending.

>=20
> ------------>8------------
> From: Paul Bolle <pebolle@tiscali.nl>
> Subject: [PATCH] eeepc-laptop: simplify parse_arg()
>=20
> parse_arg() has three possible return values:
>     -EINVAL if sscanf(), in short, fails;
>     zero if "count" is zero; and
>     "count" in all other cases
>=20
> But "count" will never be zero. See, parse_arg() is called by the
> various store functions. And the callchain of these functions starts
> with sysfs_kf_write(). And that function checks for a zero "count". S=
o
> we can stop checking for a zero "count", drop the "count" argument
> entirely, and transform parse_arg() into a function that returns zero=
 on
> success or a negative error. That, in turn, allows to make those stor=
e
> functions just return "count" on success. The net effect is that the
> code becomes a bit easier to understand.
>=20

Seems reasonable.

> A nice side effect is that this GCC warning is silenced too:
>     drivers/platform/x86/eeepc-laptop.c: In function =E2=80=98store_s=
ys_acpi=E2=80=99:
>     drivers/platform/x86/eeepc-laptop.c:279:10: warning: =E2=80=98val=
ue=E2=80=99 may be used uninitialized in this function [-Wmaybe-uniniti=
alized]
>       int rv, value;
>=20
> Which is, of course, the reason to have a look at parse_arg().
>=20
> Signed-off-by: Paul Bolle <pebolle@tiscali.nl>
> ---
>  drivers/platform/x86/eeepc-laptop.c | 34 +++++++++++++++++----------=
-------
>  1 file changed, 17 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/platform/x86/eeepc-laptop.c b/drivers/platform/x=
86/eeepc-laptop.c
> index bd533c22be57..78515b850165 100644
> --- a/drivers/platform/x86/eeepc-laptop.c
> +++ b/drivers/platform/x86/eeepc-laptop.c
> @@ -263,13 +263,11 @@ static int acpi_setter_handle(struct eeepc_lapt=
op *eeepc, int cm,
>  /*
>   * Sys helpers
>   */
> -static int parse_arg(const char *buf, unsigned long count, int *val)
> +static int parse_arg(const char *buf, int *val)
>  {
> -	if (!count)
> -		return 0;
>  	if (sscanf(buf, "%i", val) !=3D 1)
>  		return -EINVAL;
> -	return count;
> +	return 0;
>  }
> =20
>  static ssize_t store_sys_acpi(struct device *dev, int cm,
> @@ -278,12 +276,13 @@ static ssize_t store_sys_acpi(struct device *de=
v, int cm,
>  	struct eeepc_laptop *eeepc =3D dev_get_drvdata(dev);
>  	int rv, value;
> =20
> -	rv =3D parse_arg(buf, count, &value);
> -	if (rv > 0)
> -		value =3D set_acpi(eeepc, cm, value);
> +	rv =3D parse_arg(buf, &value);
> +	if (rv < 0)
> +		return rv;
> +	value =3D set_acpi(eeepc, cm, value);
>  	if (value < 0)

I suppose it's harmless, but it would be more explicit to reuse rv here=
 instead
of value.

>  		return -EIO;

And as with Frans' version, I suggest propogating the error. We're talk=
ing about
a missing/invalid ACPI control method name here, ENODEV seems approprir=
ate.

Rafael, do you have a strong preference about what to return in such an=
 event?

--=20
Darren Hart
Intel Open Source Technology Center
