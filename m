From: Corentin Chary <corentin.chary-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: ACPI ambient light sensor
Date: Sat, 27 Oct 2012 19:00:58 +0100
Message-ID: <CAHR064j_7Y3wYXVXmC4TqZHxkqa0Z2HK84-OaDTiC7oesB_TrQ@mail.gmail.com>
References: <CAObPJ3PctmLP56NvmLvJd+4w9e4xeOGSyz24FyBDXBQQVhDhxQ@mail.gmail.com>
	<4FFADCC2.6080006@cam.ac.uk>
	<CAObPJ3ORe_MGbmEHzZ4SGqZkn3HCQs+ocSw=Ttb7LbCTNCDkAQ@mail.gmail.com>
	<201209111121.34205.marex@denx.de>
	<CAObPJ3PB0VYNE9vhrwJRA9jpWX6p7_Kw8T2eCMgj0M0zJ9feUA@mail.gmail.com>
	<5084397D.8050103@kernel.org>
	<CAObPJ3MgaVtUHOsUfATdaRGEQ23+GHceoLS0ZU1tCyik00bHpA@mail.gmail.com>
	<508C1515.5090504@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <508C1515.5090504-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: =?UTF-8?Q?Martin_Li=C5=A1ka?= <marxin.liska-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Jonathan Cameron <jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Zhang Rui <rui.zhang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, joeyli <jlee-IBi9RG/b67k@public.gmane.org>, Len Brown <len.brown-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, pavel-ynQEQJNshbs@public.gmane.org, Jon Brenner <jbrenner-yYKgigLBUwlBDgjK7y7TUQ@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

On Sat, Oct 27, 2012 at 6:08 PM, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wr=
ote:
> On 10/27/2012 05:39 PM, Martin Li=C5=A1ka wrote:
>> Hello,
>>    I hope being root should not bring any permission issues for the =
file:
>>
>> ls -l /sys/bus/iio/devices/iio\:device0/scan_elements/in_illuminance=
1_en
>> *-rw-r--r--* 1 root root 4096 Oct 27 15:54 /sys/bus/iio/devices/iio:=
device0/scan_elements/in_illuminance1_en
>>
>> After adding debug print to ii_scan_el_show gives me really *-1* and=
 ***indio_dev->buffer->scan_mask is *1 *and echo
>> command settings "1" is processed in *in_scan_el_store* function wit=
h ret =3D=3D 0.
> Chase it all the way back and find out where that -1 is coming form. =
I really can't
> guess at the moment. There is only a test_bit and an sprintf if there=
=2E.. Not much scope
> really. If it's giving a  string containing -1 then it must be from t=
est bit, if returning
> -1 from the sprintf.  I didn't think test_bit could return an error s=
o we don't check
> ret from that.

Try to add some printk inside iio code directly, including iio_scan_el_=
show.
You can also build you kernel with debug symbols and trace support,
and use ftrace to trace the kernel calls:
http://lwn.net/Articles/365835/.

--=20
Corentin Chary
http://xf.iksaif.net
