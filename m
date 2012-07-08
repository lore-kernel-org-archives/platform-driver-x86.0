From: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Subject: Re: ACPI ambient light sensor
Date: Sun, 8 Jul 2012 22:28:14 +0200
Message-ID: <201207082228.14318.marex@denx.de>
References: <CAObPJ3PctmLP56NvmLvJd+4w9e4xeOGSyz24FyBDXBQQVhDhxQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAObPJ3PctmLP56NvmLvJd+4w9e4xeOGSyz24FyBDXBQQVhDhxQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin =?utf-8?q?Li=C5=A1ka?= <marxin.liska-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Zhang Rui <rui.zhang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Corentin Chary <corentin.chary-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, joeyli <jlee-IBi9RG/b67k@public.gmane.org>, Len Brown <len.brown-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, pavel-ynQEQJNshbs@public.gmane.org, Jonathan Cameron <jic23-tko9wxEg+fIOOJlXag/Snyp2UmYkHbXO@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

Dear Martin Li=C5=A1ka,

> Hello,
>    Iconia Tab W500 contains Ambient Light Sensor (hid 0008), I starte=
d
> implementing IIO device drive having following questions:
>=20
>    - chip could offer following variables: illuminance, color chromat=
icity
>    and color temperature, how should I connect last 2 vars to any of =
IIO
>    CHANNEL types?
>    - I'm not sure how to connect an illuminance mapping to IIO
>    infrastructure?

See IIO_DEVICE_ATTR() maybe ?

> Thank you,
> Martin Li=C5=A1ka

Best regards,
Marek Vasut
