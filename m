From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] hp-wireless: remove unneeded goto/label in hpwl_init
Date: Tue, 25 Aug 2015 23:36:07 -0700
Message-ID: <20150826063607.GC50910@vmdeb7>
References: <1440330069-16537-1-git-send-email-giedrius.statkevicius@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:48798 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755983AbbHZGgJ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 26 Aug 2015 02:36:09 -0400
Content-Disposition: inline
In-Reply-To: <1440330069-16537-1-git-send-email-giedrius.statkevicius@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Giedrius =?utf-8?Q?Statkevi=C4=8Dius?= <giedrius.statkevicius@gmail.com>
Cc: platform-driver-x86@vger.kernel.org

On Sun, Aug 23, 2015 at 02:41:09PM +0300, Giedrius Statkevi=C4=8Dius wr=
ote:
> acpi_bus_register_driver() already returns an appropriate value (0 on
> success, and some negative value on error) to be used in __init funct=
ions
> so the goto/label is redundant in hpwl_init thus remove it and direct=
ly
> return the value
>=20
> Signed-off-by: Giedrius Statkevi=C4=8Dius <giedrius.statkevicius@gmai=
l.com>

Thanks Giedrius, queued.

--=20
Darren Hart
Intel Open Source Technology Center
