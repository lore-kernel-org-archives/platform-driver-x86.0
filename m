From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH v3 0/4] dell-wmi: Changes in WMI event code handling
Date: Tue, 21 Jun 2016 19:33:27 +0100
Message-ID: <20160621183327.GA18073@srcf.ucam.org>
References: <1466020153-10877-1-git-send-email-pali.rohar@gmail.com>
 <20160621180617.GD3685@f23x64.localdomain>
 <e3fabd2ab50d46389400cfb8900bad4d@ausx13mpc120.AMER.DELL.COM>
 <201606212029.28029@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:60218 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750948AbcFUTRF (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 21 Jun 2016 15:17:05 -0400
Content-Disposition: inline
In-Reply-To: <201606212029.28029@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Mario_Limonciello@dell.com, dvhart@infradead.org, gabriele.mzt@gmail.com, luto@kernel.org, alex.hung@canonical.com, kernel@kempniu.pl, platform-driver-x86@vger.kernel.org

On Tue, Jun 21, 2016 at 08:29:27PM +0200, Pali Roh=E1r wrote:

> Is there some way to disable this insane nonsense activity of BIOS,=20
> firmware or whatever it is doing in HW to send *one* key scancode whe=
n=20
> pressing *one* key?

There's certainly no generic cross-vendor way to do so, so userspace ha=
s=20
to deal in any case.

--=20
Matthew Garrett | mjg59@srcf.ucam.org
