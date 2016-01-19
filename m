From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v2 3/3] dmi: Make dmi_walk and dmi_walk_early return real
 error codes
Date: Tue, 19 Jan 2016 10:07:36 +0100
Message-ID: <20160119090736.GF7192@pali>
References: <cover.1453150613.git.luto@kernel.org>
 <9d1eb8634669ef09334c7e792eb21f20b320a07b.1453150613.git.luto@kernel.org>
 <20160119085426.7d4b1f8b@endymion.delvare>
 <20160119083633.GD7192@pali>
 <20160119100303.73cf6256@endymion.delvare>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f53.google.com ([74.125.82.53]:34454 "EHLO
	mail-wm0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932690AbcASJHj (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 19 Jan 2016 04:07:39 -0500
Content-Disposition: inline
In-Reply-To: <20160119100303.73cf6256@endymion.delvare>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jean Delvare <jdelvare@suse.de>
Cc: Andy Lutomirski <luto@kernel.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Tuesday 19 January 2016 10:03:03 Jean Delvare wrote:
> Hi Pali,
>=20
> On Tue, 19 Jan 2016 09:36:33 +0100, Pali Roh=C3=A1r wrote:
> > On Tuesday 19 January 2016 08:54:26 Jean Delvare wrote:
> > > > @@ -978,11 +978,11 @@ int dmi_walk(void (*decode)(const struct =
dmi_header *, void *),
> > > >  	u8 *buf;
> > > > =20
> > > >  	if (!dmi_available)
> > > > -		return -1;
> > > > +		return -ENOENT;
> > >=20
> > > -ENOSYS would seem more appropriate?
> >=20
> > IIRC -ENOSYS is for non implemented syscalls.
>=20
> I can see a lot of -ENOSYS in include/linux/*.h returned by stubs whe=
n
> a specific subsystem is not included. Not related to syscalls at all.
> This is what lead to my suggestion.

https://lkml.org/lkml/2014/8/22/492

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
