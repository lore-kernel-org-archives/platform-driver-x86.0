From: Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH v2 3/3] dmi: Make dmi_walk and dmi_walk_early return
 real error codes
Date: Tue, 19 Jan 2016 10:03:03 +0100
Message-ID: <20160119100303.73cf6256@endymion.delvare>
References: <cover.1453150613.git.luto@kernel.org>
	<9d1eb8634669ef09334c7e792eb21f20b320a07b.1453150613.git.luto@kernel.org>
	<20160119085426.7d4b1f8b@endymion.delvare>
	<20160119083633.GD7192@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160119083633.GD7192@pali>
Sender: linux-kernel-owner@vger.kernel.org
To: Pali =?UTF-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Cc: Andy Lutomirski <luto@kernel.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi Pali,

On Tue, 19 Jan 2016 09:36:33 +0100, Pali Roh=C3=A1r wrote:
> On Tuesday 19 January 2016 08:54:26 Jean Delvare wrote:
> > > @@ -978,11 +978,11 @@ int dmi_walk(void (*decode)(const struct dm=
i_header *, void *),
> > >  	u8 *buf;
> > > =20
> > >  	if (!dmi_available)
> > > -		return -1;
> > > +		return -ENOENT;
> >=20
> > -ENOSYS would seem more appropriate?
>=20
> IIRC -ENOSYS is for non implemented syscalls.

I can see a lot of -ENOSYS in include/linux/*.h returned by stubs when
a specific subsystem is not included. Not related to syscalls at all.
This is what lead to my suggestion.

--=20
Jean Delvare
SUSE L3 Support
