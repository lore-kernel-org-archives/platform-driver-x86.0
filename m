From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH v2 2/2] dell-wmi: Process only one event on devices with
 interface version 0
Date: Tue, 12 Jan 2016 21:12:46 +0100
Message-ID: <20160112201246.GA19348@eudyptula.hq.kempniu.pl>
References: <1450991926-20937-1-git-send-email-pali.rohar@gmail.com>
 <1451942796-26574-3-git-send-email-pali.rohar@gmail.com>
 <20160112111439.GA7630@eudyptula.hq.kempniu.pl>
 <201601121849.44256@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201601121849.44256@pali>
Sender: linux-kernel-owner@vger.kernel.org
To: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Andy Lutomirski <luto@kernel.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

> > Wouldn't it be a bit more clear if we clamped buffer_size before
> > setting buffer_end?  E.g. like this:
> >=20
> > 	if (buffer_size =3D=3D 0)
> > 		return;
> >=20
> > 	if (dell_wmi_interface_version =3D=3D 0 &&
> > 	    buffer_size > buffer_entry[0] + 1)
> > 		buffer_size =3D buffer_entry[0] + 1;
> >=20
> > 	buffer_end =3D buffer_entry + buffer_size;
>=20
> Before return adds correct cleanup part and code will be same as my=20
> original patch.
>=20
> So if more people think that your code is cleaner I'm OK with replaci=
ng=20
> it.

Both solutions are fine and I realize I'm a bit late to the party as yo=
u
posted the original patch almost 3 weeks ago, so I don't want to delay
it any longer.  I think it's just a matter of deciding whether to
enforce the buffer size limit using buffer_size or buffer_end.  As the
first option involves a little bit less writing, I thought I'd suggest
it.

> > One more minor nit: you should probably decide between "first" and
> > "one" as the phrase "only first one event" (found both in the commi=
t
> > message and in the code comment) sounds incorrect to me.
>=20
> Feel free to correct commit message, I'm not very good in english...
>=20
> It should mean something like this... in buffer received by bios can =
be=20
> more events. That while loop iterate over events. And this my patch o=
n=20
> machines with wmi version 0 will process only *one* event. And that=20
> event is *first* in buffer.

Don't worry, I understood your intentions from the commit message, so I
don't think it's worth posting a v3 only to correct minor stylistic
errors.

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
