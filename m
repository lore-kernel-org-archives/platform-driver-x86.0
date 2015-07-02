From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 3/3] dell-laptop: Do not cache hwswitch state
Date: Wed, 1 Jul 2015 17:42:04 -0700
Message-ID: <20150702004204.GC27795@vmdeb7>
References: <201507012004.45275@pali>
 <1435774101-12329-1-git-send-email-pali.rohar@gmail.com>
 <1435774101-12329-3-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:32872 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751496AbbGBAmG (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 1 Jul 2015 20:42:06 -0400
Content-Disposition: inline
In-Reply-To: <1435774101-12329-3-git-send-email-pali.rohar@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Gabriele Mazzotta <gabriele.mzt@gmail.com>

On Wed, Jul 01, 2015 at 08:08:21PM +0200, Pali Roh=E1r wrote:
> It can be changed at runtime so make sure that dell-laptop knows alwa=
ys
> current state. It can be modified by userspace utility smbios-wireles=
s-ctl.
>=20
> Signed-off-by: Pali Roh=E1r <pali.rohar@gmail.com>

Couple of checkpatch warnings on this one.

--=20
Darren Hart
Intel Open Source Technology Center
