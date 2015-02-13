From: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Subject: Re: [PATCH] dell-laptop: use dedicated sysfs file for ALS
Date: Fri, 13 Feb 2015 15:30:42 +0100
Message-ID: <6193126.UlCB3asGVW@xps13>
References: <1421244357-31103-1-git-send-email-gabriele.mzt@gmail.com> <201502101036.21896@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201502101036.21896@pali>
Sender: linux-kernel-owner@vger.kernel.org
To: Pali =?ISO-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: mjg59@srcf.ucam.org, dvhart@infradead.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, A.Sloman@cs.bham.ac.uk, computersforpeace@gmail.com
List-Id: platform-driver-x86.vger.kernel.org

On Tuesday 10 February 2015 10:36:21 Pali Roh=E1r wrote:
> On Wednesday 14 January 2015 15:05:57 Gabriele Mazzotta wrote:
> > The ambient light sensor doesn't act like an input trigger, so
> > it has to be kept separate. The sensor readings are used to
> > determine whether the conditions to change the keyboard
> > illumination are satisfied or not the moment an input trigger
> > is used. Ambient light changes alone can't change the
> > keyboard backlight illumination and don't restart the timer.
> >=20
> > Signed-off-by: Gabriele Mazzotta <gabriele.mzt@gmail.com>
> > ---
>=20
> Gabriele, can you look and integrate this patch into full=20
> keyboard backlight support? Ideally send new full one...

I will do that soon.

Darren, do you prefer one single patch or should I send Pali's patch
and my changes in different patches (that can be later squashed) to mak=
e
the review easier?
