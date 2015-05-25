From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: dell_rbtn - kernel panic at boot...
Date: Mon, 25 May 2015 06:01:21 +0100
Message-ID: <20150525050121.GA28810@srcf.ucam.org>
References: <5875.1432260403@turing-police.cc.vt.edu>
 <CAKdAkRQRdFBsgCmvL-aTKL=1xxPN-YYVEa0nTVkEV9jHMbzgYA@mail.gmail.com>
 <201505230305.36633@pali>
 <20150525044432.GA38428@fury.dvhart.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:60720 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750862AbbEYFBg (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 25 May 2015 01:01:36 -0400
Content-Disposition: inline
In-Reply-To: <20150525044432.GA38428@fury.dvhart.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Valdis Kletnieks <Valdis.Kletnieks@vt.edu>, lkml <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

On Sun, May 24, 2015 at 09:44:32PM -0700, Darren Hart wrote:

> Greg, Matthew, I'm tempted to recommend this 434 line driver be rolled into
> dell-laptop.c. Any strong opinions?

Mrm. It's slightly conceptually nasty in that one's an ACPI driver and 
one's calling a Dell custom interface, but I think merging them is 
probably the last bad answer.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
