From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2 2/2] dell-wmi: Process only one event on devices with
 interface version 0
Date: Thu, 14 Jan 2016 15:06:47 -0800
Message-ID: <20160114230647.GG1989@malice.jf.intel.com>
References: <1450991926-20937-1-git-send-email-pali.rohar@gmail.com>
 <1451942796-26574-3-git-send-email-pali.rohar@gmail.com>
 <20160112111439.GA7630@eudyptula.hq.kempniu.pl>
 <201601121849.44256@pali>
 <20160112201246.GA19348@eudyptula.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:49276 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757076AbcANXGt (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 14 Jan 2016 18:06:49 -0500
Content-Disposition: inline
In-Reply-To: <20160112201246.GA19348@eudyptula.hq.kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Matthew Garrett <mjg59@srcf.ucam.org>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Andy Lutomirski <luto@kernel.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Jan 12, 2016 at 09:12:46PM +0100, Micha=C5=82 K=C4=99pie=C5=84 =
wrote:
> > > Wouldn't it be a bit more clear if we clamped buffer_size before
> > > setting buffer_end?  E.g. like this:
> > >=20
> > > 	if (buffer_size =3D=3D 0)
> > > 		return;
> > >=20
> > > 	if (dell_wmi_interface_version =3D=3D 0 &&
> > > 	    buffer_size > buffer_entry[0] + 1)
> > > 		buffer_size =3D buffer_entry[0] + 1;
> > >=20
> > > 	buffer_end =3D buffer_entry + buffer_size;
> >=20
> > Before return adds correct cleanup part and code will be same as my=
=20
> > original patch.
> >=20
> > So if more people think that your code is cleaner I'm OK with repla=
cing=20
> > it.
>=20
> Both solutions are fine and I realize I'm a bit late to the party as =
you
> posted the original patch almost 3 weeks ago, so I don't want to dela=
y
> it any longer.  I think it's just a matter of deciding whether to
> enforce the buffer size limit using buffer_size or buffer_end.  As th=
e
> first option involves a little bit less writing, I thought I'd sugges=
t
> it.
>=20
> > > One more minor nit: you should probably decide between "first" an=
d
> > > "one" as the phrase "only first one event" (found both in the com=
mit
> > > message and in the code comment) sounds incorrect to me.
> >=20
> > Feel free to correct commit message, I'm not very good in english..=
=2E
> >=20
> > It should mean something like this... in buffer received by bios ca=
n be=20
> > more events. That while loop iterate over events. And this my patch=
 on=20
> > machines with wmi version 0 will process only *one* event. And that=
=20
> > event is *first* in buffer.
>=20
> Don't worry, I understood your intentions from the commit message, so=
 I
> don't think it's worth posting a v3 only to correct minor stylistic
> errors.
>=20
> --=20
> Best regards,
> Micha=C5=82 K=C4=99pie=C5=84

I've cleaned up that bit.

--=20
Darren Hart
Intel Open Source Technology Center
