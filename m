From: Andy Lutomirski <luto@amacapital.net>
Subject: Re: [PATCH 1/2] dell-wmi: Check if Dell WMI descriptor structure is valid
Date: Thu, 24 Dec 2015 17:23:04 -0800
Message-ID: <CALCETrW0HmHiXmM23Y0XV1FBKaw9dcEwdrRWzwSJJhj89RkQYQ@mail.gmail.com>
References: <1450991926-20937-1-git-send-email-pali.rohar@gmail.com> <1450991926-20937-2-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1450991926-20937-2-git-send-email-pali.rohar@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>, Andy Lutomirski <luto@kernel.org>, platform-driver-x86@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Dec 24, 2015 at 1:18 PM, Pali Roh=C3=A1r <pali.rohar@gmail.com>=
 wrote:
> According to Dell WMI document mentioned in ML dicussion archived at
> http://www.spinics.net/lists/platform-driver-x86/msg07220.html OS sho=
uld
> check Dell WMI descriptor structure. Structure also provide Dell WMI
> interface version which is used later.

I will rebase my big series on top of this.  It'll give me a good
excuse to test that I got the probe ordering right.  (The code is
explicitly intended to support use cases like this, and now I'll have
a real-world test for it.)  I'll also test this in a bit.

> +MODULE_ALIAS("wmi:"DELL_DESCRIPTOR_GUID);

I don't think this is necessary.  The driver will only work if both
wmi devices and, hence, modaliases are present, so there's no need to
cause just one or the other to trigger dell-wmi autoloading.

> +/**
> + * Descriptor buffer is 128 byte long and contains:

This isn't kerneldoc format, so I think this should just be "/*".

> +       if (obj->buffer.length !=3D 128) {
> +               pr_err("Dell descriptor buffer has invalid length (%d=
)\n",
> +                       obj->buffer.length);
> +               kfree(obj);
> +               return -EINVAL;
> +       }

I would advocate for being more permissive: a buffer that is actually
too short for the fields we need would result in -EINVAL, but a buffer
that isn't 128 bytes would just be a warning and not cause module load
to fail.

--Andy
