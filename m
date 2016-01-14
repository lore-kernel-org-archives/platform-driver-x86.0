From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH] dell-wmi: Stop storing pointers to DMI tables
Date: Thu, 14 Jan 2016 10:52:04 +0100
Message-ID: <20160114095204.GA5473@eudyptula.hq.kempniu.pl>
References: <119170b95d373bc943eb4f16818239bac9fa6c59.1451832667.git.luto@kernel.org>
 <CALCETrVZ23t8u34VtgC+VVQC4PQ0JAw2u27+W_MQiwS=BgMAXQ@mail.gmail.com>
 <20160112142538.GB11560@pali>
 <CALCETrWUJ+5DowyLFDp7N_iNLsday4uKX3iO3NMC8Pfqma=O7w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CALCETrWUJ+5DowyLFDp7N_iNLsday4uKX3iO3NMC8Pfqma=O7w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>, Andy Lutomirski <luto@kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>, platform-driver-x86@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

> > Hi Andy, I looked at this patch, but I think some people from -mm o=
r DMI
> > code should look at it as it is memory problem... We also has one i=
n
> > dell-laptop.ko (wrong API usage) and so -mm people could know it be=
tter.

> There are at least two platform drivers (dell-wmi and dell-laptop)
> that don't play well with the current interface.  This patch is
> intended to fix one of them.

Pali, Andy,

Could you point out the exact place where dell-laptop errs?  AFAICT, it
only has one use of dmi_walk(), the callback there calls
parse_da_table(), which does the right thing, i.e. krealloc()'ing memor=
y
and then memcpy()'ing table contents there...

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
