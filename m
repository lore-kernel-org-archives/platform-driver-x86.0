From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2 1/3] dell-laptop: Clear buffer before each SMBIOS call
Date: Mon, 6 Jul 2015 15:39:37 -0700
Message-ID: <20150706223937.GA111639@vmdeb7>
References: <1435774101-12329-1-git-send-email-pali.rohar@gmail.com>
 <1436177337-13654-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:45137 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754191AbbGFWjk (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 6 Jul 2015 18:39:40 -0400
Content-Disposition: inline
In-Reply-To: <1436177337-13654-1-git-send-email-pali.rohar@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Gabriele Mazzotta <gabriele.mzt@gmail.com>

On Mon, Jul 06, 2015 at 12:08:55PM +0200, Pali Roh=E1r wrote:
> Make sure that before initializing SMBIOS call input buffer does not
> contain any garbage (e.g. values from previous SMBIOS call). This fix
> problem with passing undefined/random parameters to SMBIOS functions.
>=20
> Signed-off-by: Pali Roh=E1r <pali.rohar@gmail.com>

Queued all 3 to fixes. Thanks Pali.

(I made a few minor grammatical fixes tot he commit messages, review th=
e changes
if you like in the fixes branch)

--=20
Darren Hart
Intel Open Source Technology Center
