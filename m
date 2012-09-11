From: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Subject: Re: ACPI ambient light sensor
Date: Tue, 11 Sep 2012 11:21:33 +0200
Message-ID: <201209111121.34205.marex@denx.de>
References: <CAObPJ3PctmLP56NvmLvJd+4w9e4xeOGSyz24FyBDXBQQVhDhxQ@mail.gmail.com> <4FFADCC2.6080006@cam.ac.uk> <CAObPJ3ORe_MGbmEHzZ4SGqZkn3HCQs+ocSw=Ttb7LbCTNCDkAQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAObPJ3ORe_MGbmEHzZ4SGqZkn3HCQs+ocSw=Ttb7LbCTNCDkAQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin =?utf-8?q?Li=C5=A1ka?= <marxin.liska-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jonathan Cameron <jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Zhang Rui <rui.zhang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Corentin Chary <corentin.chary-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, joeyli <jlee-IBi9RG/b67k@public.gmane.org>, Len Brown <len.brown-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, pavel-ynQEQJNshbs@public.gmane.org, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jon Brenner <jbrenner-yYKgigLBUwlBDgjK7y7TUQ@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

Dear Martin Li=C5=A1ka,

[...]

> +static int acpi_als_write_raw(struct iio_dev *indio_dev,
> +     struct iio_chan_spec const *chan, int val, int val2, long mask)
> +{
> + return 0;
> +}

Simply set write_raw =3D NULL below (aka. don't put it into the structu=
re at all).

> +static const struct iio_chan_spec acpi_als_channels[] =3D {
> + {
> + .type =3D IIO_LIGHT,
> + .indexed =3D 1,
> + .channel =3D 1,
> + .scan_type.sign =3D 'u',
> + .scan_type.realbits =3D 10,
> + .scan_type.storagebits =3D 16,
> + .info_mask =3D IIO_CHAN_INFO_PROCESSED_SEPARATE_BIT |
> + IIO_CHAN_INFO_SCALE_SEPARATE_BIT,
> + },
> +};
> +
> +static const struct iio_info acpi_als_info =3D {
> + .driver_module =3D THIS_MODULE,
> + .read_raw =3D &acpi_als_read_raw,
> + .write_raw =3D &acpi_als_write_raw,
> +};
[...]
Best regards,
Marek Vasut
