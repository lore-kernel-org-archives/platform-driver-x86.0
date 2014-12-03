From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 0/3] Dell Airplane Mode Switch driver
Date: Wed, 3 Dec 2014 05:00:23 -0800
Message-ID: <20141203130023.GC75099@vmdeb7>
References: <1416755361-17357-1-git-send-email-pali.rohar@gmail.com>
 <201412020942.47091@pali>
 <CAJ=jqua+xpXyhkjiLrxZ9Cy9D-kwXXP=hB1az+kC+RUn1PN0Bw@mail.gmail.com>
 <201412041055.32689@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:35813 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932378AbaLECx4 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 4 Dec 2014 21:53:56 -0500
Content-Disposition: inline
In-Reply-To: <201412041055.32689@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Alex Hung <alex.hung@canonical.com>, Matthew Garrett <mjg59@srcf.ucam.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, linux-kernel@vger.kernel.org, Gabriele Mazzotta <gabriele.mzt@gmail.com>

On Thu, Dec 04, 2014 at 10:55:32AM +0100, Pali Roh=E1r wrote:
>=20
> Darren, I think that if we do not solve problem with duplicate=20
> key events (in dell-wireless.c) we should postpone these patches=20
> to later kernel version. It is better to not have such regression=20
> as it confuse software like NetworkManager which is widely used.

OK, that's what I needed. Thanks. Ignore my previous request, you answe=
red it
here. I will drop dell-wireless.c and look for a combined solution from=
 you and
Alex for the next release.

Thanks,
--=20
Darren Hart
Intel Open Source Technology Center
