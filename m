From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH 4/4] dell-wmi: Rework code for generating sparse keymap
 and processing WMI events
Date: Wed, 8 Jun 2016 00:30:11 +0200
Message-ID: <20160607223011.GP29844@pali>
References: <1463916983-12562-1-git-send-email-pali.rohar@gmail.com>
 <1463916983-12562-5-git-send-email-pali.rohar@gmail.com>
 <20160602104211.GC2456@eudyptula.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160602104211.GC2456@eudyptula.hq.kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Mario Limonciello <mario_limonciello@dell.com>, Andy Lutomirski <luto@kernel.org>, Alex Hung <alex.hung@canonical.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Thursday 02 June 2016 12:42:11 Micha=C5=82 K=C4=99pie=C5=84 wrote:
> > -static void dell_wmi_process_key(int reported_key)
> > +static void dell_wmi_process_key(int type, int code)
> >  {
> >  	const struct key_entry *key;
> > =20
> >  	key =3D sparse_keymap_entry_from_scancode(dell_wmi_input_dev,
> > -						reported_key);
> > +						(type << 16) | code);
> >  	if (!key) {
> > -		pr_info("Unknown key with scancode 0x%x pressed\n",
> > -			reported_key);
> > +		pr_info("Unknown key with type 0x%x and code 0x%x pressed\n",
> > +			type, code);
>=20
> Since you updated the switch cases below so that each of them now
> consists of four digits, maybe it's a good idea to change the format
> specifiers for type and code to %04x for coherency?

Ok.

> >  		return;
> >  	}
> > =20
> > -	pr_debug("Key %x pressed\n", reported_key);
> > +	pr_debug("Key with type 0x%x and code 0x%x pressed\n", type, code=
);
>=20
> The same applies here.

Ok.

> > +		case 0x0000:
> > +			/* One key pressed or event occurred */
> > +			if (len > 2)
> > +				dell_wmi_process_key(0x0000, buffer_entry[2]);
>=20
> I am sure you spent way more time analysing this than me, but is this
> documented anywhere?

Yes, this is the only documented part. Read my email linked to commit
message for more details.

> Technically speaking, this is a behavioral change
> which causes events to be lost on any Dell model which is capable of
> stuffing more than one key code into a single type 0x0000 WMI event (=
not
> that I know of any such model).

I do not think. Other values in that buffer are not scan codes of other
keys, but additional events. See that table with comments (those
comments which you suggested to change).

> > +			/* Other entries in buffer could contain additional information=
 */
>=20
> This comment exceeds 80 characters, but do you think it is needed at
> all?  What does the reader gain by reading it?  Any additional
> information that follows the key code is ignored by kernel code anywa=
y.

It is just documentation purpose, to understand why we are processing
only buffer_entry[2] and why are ignoring anything else after it.

> >  			break;

> > @@ -576,21 +525,71 @@ static int __init dell_wmi_input_setup(void)
> >  		goto err_free_dev;
> >  	}
> > =20
> > +	keymap =3D kcalloc(dmi_results.keymap_size +
> > +			 ARRAY_SIZE(dell_wmi_keymap_type_0000) +
> > +			 ARRAY_SIZE(dell_wmi_keymap_type_0010) +
> > +			 ARRAY_SIZE(dell_wmi_keymap_type_0011) +
> > +			 1,
> > +			 sizeof(struct key_entry), GFP_KERNEL);
> > +	if (!keymap) {
> > +		err =3D -ENOMEM;
> > +		goto err_free_dev;
>=20
> You're potentially leaking dmi_results.keymap here.

You are right, I will fix it.

> > +	}
> > +
> > +	/* Append table with events of type 0x0010 which comes from DMI *=
/
> >  	if (dmi_results.keymap) {
> > -		dell_new_hk_type =3D true;
> > +		for (i =3D 0; i < dmi_results.keymap_size; i++) {
> > +			keymap[pos] =3D dmi_results.keymap[i];
> > +			keymap[pos].code |=3D (0x0010 << 16);
> > +			pos++;
> > +		}
> > +		kfree(dmi_results.keymap);
> > +	}
>=20
> Nit, but is the enclosing conditional expression needed any more, now
> that you got rid of dell_new_hk_type?  If the 0xB2 DMI table is not
> found then dmi_results.keymap_size will be 0 and thus the for loop ab=
ove
> doesn't do anything and it is okay to pass a null pointer to kfree().

Yes, it is not needed anymore. I will delete it.

> > =20
> > -		err =3D sparse_keymap_setup(dell_wmi_input_dev,
> > -					  dmi_results.keymap, NULL);
> > +	/* Append table with extra events of type 0x0010 which are not in=
 DMI */
> > +	for (i =3D 0; i < ARRAY_SIZE(dell_wmi_keymap_type_0010); i++) {
> > +		const struct key_entry *entry =3D &dell_wmi_keymap_type_0010[i];
> > =20
> >  		/*
> > -		 * Sparse keymap library makes a copy of keymap so we
> > -		 * don't need the original one that was allocated.
> > +		 * Check if we've already found this scancode.  This takes
> > +		 * quadratic time, but it doesn't matter unless the list
> > +		 * of extra keys gets very long.
> >  		 */
> > -		kfree(dmi_results.keymap);
> > -	} else {
> > -		err =3D sparse_keymap_setup(dell_wmi_input_dev,
> > -					  dell_wmi_legacy_keymap, NULL);
> > +		if (dmi_results.keymap_size &&
> > +		    have_scancode(entry->code | (0x0010 << 16),
> > +				  keymap, dmi_results.keymap_size)
> > +		   )
> > +			continue;
>=20
> Is the first part of this conditional expression really needed?  If
> dmi_results.keymap_size is 0 then have_scancode() will simply return
> false, so the only disadvantage of removing this check is the overhea=
d
> of calling have_scancode() for every iteration of the loop, but I
> believe that overhead is negligible as this is not performance-critic=
al
> code.

It is linear scan of whole table and so above two loops has something
like quadratic time complexity. List dell_wmi_keymap_type_0010 is not
too long for now, so it is OK. But still it is better not to call
have_scancode() everytime if it is not needed. Once we have big list of
events we could switch code to use some hash tables...

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
