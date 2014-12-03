From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 0/3] Dell Airplane Mode Switch driver
Date: Wed, 3 Dec 2014 04:56:43 -0800
Message-ID: <20141203125642.GB75099@vmdeb7>
References: <1416755361-17357-1-git-send-email-pali.rohar@gmail.com>
 <20141125230527.GC32102@vmdeb7>
 <201412020942.47091@pali>
 <CAJ=jqua+xpXyhkjiLrxZ9Cy9D-kwXXP=hB1az+kC+RUn1PN0Bw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:35689 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932378AbaLECuQ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 4 Dec 2014 21:50:16 -0500
Content-Disposition: inline
In-Reply-To: <CAJ=jqua+xpXyhkjiLrxZ9Cy9D-kwXXP=hB1az+kC+RUn1PN0Bw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alex Hung <alex.hung@canonical.com>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Matthew Garrett <mjg59@srcf.ucam.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, linux-kernel@vger.kernel.org, Gabriele Mazzotta <gabriele.mzt@gmail.com>

On Thu, Dec 04, 2014 at 04:16:25PM +0800, Alex Hung wrote:
> HI Darren and Pali,
> 
> It was great that we had a lot of discussion but it seems Dell BIOS
> implementation varies from one series to another. Both work looks good
> either one is fine with me.
> 
> But I think I can do a little more: I am collecting a number of
> systems to try out these patches. This should help us determine which
> one work better and probably we can integrate.
> 
> Currently I have found four systems (including two Latitude, an
> Inspiron and a XPS with working method(ARBT) that Gabriele suggested).
> I can get other, ex. a Vostro, if needed.
> 
> I will test dell-wireless.c with Gabriele's suggestion and Pali's
> dell-rbtn.c (btw, will there be updates?). However, I will need a few
> days to do the comparison.

OK, this is great, thanks for working together on this.

Pali - if I merge Alex's dell-wireless driver, does it BREAK your systems, or
does it just not fully support them? If it BREAKS them, I'll drop Alex's patch
from for-next and from the 3.19 pull requeust. If it just doesn't fully support
them, I'll leave his patch in for-next and look forward to a set of patches from
you both that completes support for the 3.20 merge window.

Please let me know as soon as you can.

If I don't hear back, I'll have to err on the side of caution and drop
dell-wireless from for-next for this window.

-- 
Darren Hart
Intel Open Source Technology Center
