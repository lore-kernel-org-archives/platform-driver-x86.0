From: =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: add adaptive_kbd_modes parameter
Date: Sun, 25 Nov 2018 11:21:14 +0100
Message-ID: <87in0l31b9.fsf@miraculix.mork.no>
References: <20181115073429.z44czywrf7f65ndb@dcvr>
        <20181124232327.t3awc6dnjqdtvzwu@dcvr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181124232327.t3awc6dnjqdtvzwu@dcvr> (Eric Wong's message of
        "Sat, 24 Nov 2018 23:23:27 +0000")
Sender: linux-kernel-owner@vger.kernel.org
To: Eric Wong <e@80x24.org>
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Shuduo Sang <shuduo.sang@canonical.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, linux-kernel@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Eric Wong <e@80x24.org> writes:
> Eric Wong <e@80x24.org> wrote:
>> The above setting with this change and the following keymap
>> preserves my sanity on the atrocious adaptive keyboard on
>> the 2nd-gen X1 Carbon:
>
> Any comments on this patch?  The Esc and F-keys on the keyboard
> are still numb and I'll be getting rid of the laptop in a few
> days; but maybe my patch can still be useful to others...

I've read through and I like it, FWIW.  A brilliant idea. I don't have
the hardare to test the patch, though....

But I do wonder if you aren't missing an empty mask protection
somewhere?  If I read this right, then there is nothing preventing you
from writing 0 here:

> +static ssize_t adaptive_kbd_modes_store(struct device *dev,
> +			struct device_attribute *attr,
> +			const char *buf, size_t count)
> +{
> +	unsigned long t;
> +
> +	if (parse_strtoul(buf, (1 << LAYFLAT_MODE) - 1, &t))
> +		return -EINVAL;
> +
> +	adaptive_kbd_modes =3D (unsigned int)t;
> +	return count;
> +}


And then I believe you have a busy loop here:

> @@ -3815,20 +3838,20 @@ static int adaptive_keyboard_set_mode(int new_mod=
e)
>=20=20
>  static int adaptive_keyboard_get_next_mode(int mode)
>  {
> -	size_t i;
> -	size_t max_mode =3D ARRAY_SIZE(adaptive_keyboard_modes) - 1;
> -
> -	for (i =3D 0; i <=3D max_mode; i++) {
> -		if (adaptive_keyboard_modes[i] =3D=3D mode)
> -			break;
> -	}
> +	int max_mode =3D fls(adaptive_kbd_modes);
> +	int new_mode =3D mode >=3D max_mode ? HOME_MODE : mode + 1;
>=20=20
> -	if (i >=3D max_mode)
> -		i =3D 0;
> -	else
> -		i++;
> +	/* make sure the new mode is allowed by the user */
> +	while (!(adaptive_kbd_modes & (1 << new_mode))) {
> +		new_mode++;
> +		if (new_mode > max_mode)
> +			new_mode =3D HOME_MODE;
>=20=20
> -	return adaptive_keyboard_modes[i];
> +		/* maybe the user disabled all other modes: */
> +		if (new_mode =3D=3D mode)
> +			return mode;
> +	}
> +	return new_mode;
>  }


Or am I reading this wrong?



Bj=C3=B8rn
