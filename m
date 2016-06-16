From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v3 0/4] dell-wmi: Changes in WMI event code handling
Date: Thu, 16 Jun 2016 09:33:02 +0200
Message-ID: <20160616073302.GT29844@pali>
References: <1466020153-10877-1-git-send-email-pali.rohar@gmail.com>
 <20160616031958.GA54214@f23x64.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f48.google.com ([74.125.82.48]:38758 "EHLO
	mail-wm0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751246AbcFPHdG (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 16 Jun 2016 03:33:06 -0400
Content-Disposition: inline
In-Reply-To: <20160616031958.GA54214@f23x64.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Andy Lutomirski <luto@kernel.org>, Alex Hung <alex.hung@canonical.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>, Mario Limonciello <mario_limonciello@dell.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Wednesday 15 June 2016 20:19:58 Darren Hart wrote:
> On Wed, Jun 15, 2016 at 09:49:09PM +0200, Pali Roh=C3=A1r wrote:
> > First patch describe problem about 0xe045 code. Second and third ar=
e just
> > cosmetic and last rework code which processing WMI events. It shoul=
d be
> > properly tested on more Dell machines, to check that everything is =
still
> > working correctly.
>=20
> Is this "should be properly tested on more Dell machines" still the c=
ase? Are
> you ready for this to go into linux-next?

Series should be OK, but I would like to see if someone else test this
series... Gabriele, Alex or Andy? Do you have time?

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
