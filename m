From: Jonathan Cameron <jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>
Subject: Re: ACPI ambient light sensor
Date: Mon, 09 Jul 2012 14:29:38 +0100
Message-ID: <4FFADCC2.6080006@cam.ac.uk>
References: <CAObPJ3PctmLP56NvmLvJd+4w9e4xeOGSyz24FyBDXBQQVhDhxQ@mail.gmail.com> <201207082228.14318.marex@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201207082228.14318.marex-ynQEQJNshbs@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Cc: =?UTF-8?B?TWFydGluIExpxaFrYQ==?= <marxin.liska-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Zhang Rui <rui.zhang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Corentin Chary <corentin.chary-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, joeyli <jlee-IBi9RG/b67k@public.gmane.org>, Len Brown <len.brown-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, pavel-ynQEQJNshbs@public.gmane.org, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jon Brenner <jbrenner-yYKgigLBUwlBDgjK7y7TUQ@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

cc'd Jon Brenner and Peter Meerwald.
>
>> Hello,
>>     Iconia Tab W500 contains Ambient Light Sensor (hid 0008), I star=
ted
>> implementing IIO device drive having following questions:
>>
>>     - chip could offer following variables: illuminance, color chrom=
aticity
>>     and color temperature, how should I connect last 2 vars to any o=
f IIO
>>     CHANNEL types?
Jon's recent proposed additional modifiers cover temperature.=20
Chromaticity is a new one I think though?
>>     - I'm not sure how to connect an illuminance mapping to IIO
>>     infrastructure?
When you say mapping, what do you mean? That term tends to get used
for quite a few different things...
>
> See IIO_DEVICE_ATTR() maybe ?
>
>> Thank you,
>> Martin Li=C5=A1ka
>
> Best regards,
> Marek Vasut
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" =
in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
