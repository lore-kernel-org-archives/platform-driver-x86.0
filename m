From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] drivers: platform: change 0x20 to I8042_STR_AUXDATA in
 i8042 filters
Date: Tue, 21 Oct 2014 13:54:38 -0700
Message-ID: <20141021205438.GD20951@vmdeb7>
References: <1413590240-18762-1-git-send-email-giedriuswork@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:54359 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932842AbaJUUyX (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 21 Oct 2014 16:54:23 -0400
Content-Disposition: inline
In-Reply-To: <1413590240-18762-1-git-send-email-giedriuswork@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Giedrius Statkevicius <giedriuswork@gmail.com>
Cc: mjg59@srcf.ucam.org, jlee@suse.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Oct 18, 2014 at 02:57:20AM +0300, Giedrius Statkevicius wrote:
> From: Giedrius Statkevi=C4=8Dius <giedriuswork@gmail.com>
>=20
> Instead of using a magic constant 0x20 in some drivers to get data on=
ly
> from the KBC port we should use the constant defined in i8042.h with
> the same value. Also, this makes these drivers uniform with what
> constant the only other filter function uses in=20
> drivers/input/misc/ideapad_slidebar.c.
>=20
> Signed-off-by: Giedrius Statkevi=C4=8Dius <giedriuswork@gmail.com>

Queued, thanks Giedrius.

--=20
Darren Hart
Intel Open Source Technology Center
