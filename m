From: Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH v2 3/3] dmi: Make dmi_walk and dmi_walk_early return
 real error codes
Date: Tue, 19 Jan 2016 10:40:51 +0100
Message-ID: <20160119104051.21d8e2ac@endymion.delvare>
References: <cover.1453150613.git.luto@kernel.org>
	<9d1eb8634669ef09334c7e792eb21f20b320a07b.1453150613.git.luto@kernel.org>
	<20160119085426.7d4b1f8b@endymion.delvare>
	<20160119083633.GD7192@pali>
	<20160119100303.73cf6256@endymion.delvare>
	<20160119090736.GF7192@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160119090736.GF7192@pali>
Sender: linux-kernel-owner@vger.kernel.org
To: Pali =?UTF-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Cc: Andy Lutomirski <luto@kernel.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, 19 Jan 2016 10:07:36 +0100, Pali Roh=C3=A1r wrote:
> On Tuesday 19 January 2016 10:03:03 Jean Delvare wrote:
> > Hi Pali,
> >=20
> > On Tue, 19 Jan 2016 09:36:33 +0100, Pali Roh=C3=A1r wrote:
> > > On Tuesday 19 January 2016 08:54:26 Jean Delvare wrote:
> > > > > @@ -978,11 +978,11 @@ int dmi_walk(void (*decode)(const struc=
t dmi_header *, void *),
> > > > >  	u8 *buf;
> > > > > =20
> > > > >  	if (!dmi_available)
> > > > > -		return -1;
> > > > > +		return -ENOENT;
> > > >=20
> > > > -ENOSYS would seem more appropriate?
> > >=20
> > > IIRC -ENOSYS is for non implemented syscalls.
> >=20
> > I can see a lot of -ENOSYS in include/linux/*.h returned by stubs w=
hen
> > a specific subsystem is not included. Not related to syscalls at al=
l.
> > This is what lead to my suggestion.
>=20
> https://lkml.org/lkml/2014/8/22/492

Thanks for the pointer, I wasn't aware of that.

It really should be documented. No, checkpatch.pl isn't documentation.

Also the commit sadly doesn't say why using ENOSYS in other contexts is
considered a bad thing. What actual trouble did it cause?

Are the current presumably incorrect uses of ENOSYS ultimately going to
be fixed? If not, I see no point in preventing other use cases.

Also what about errno(3)? It says ENOSYS is "Function not implemented"
- no mention to syscalls. And glibc agrees (set errno to ENOSYS and
call perror, it says "Function not implemented.") In contradiction with
the proposed rule.

Back to the patch under review, I would argue that ENOENT is solely for
file-related operations (after all the man page says "No such file or
directory"), which is why I did not like it. Then what is left to mean
"function not available"? ENOTSUP?

Whatever the answer is, it should also be documented and added to the
checkpatch warning message (if we stick to that plan...) If you tell
people "don't use this" without telling them what to use instead, each
of us will come up with something different and this will lead to
inconsistency. Which is worse than everybody using the same (maybe
suboptimal) error code.

--=20
Jean Delvare
SUSE L3 Support
