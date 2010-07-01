From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: Bug#587014: screen brightness can't be modified on Panasonic S9
Date: Thu, 1 Jul 2010 16:16:22 +0100
Message-ID: <20100701151622.GA1693@srcf.ucam.org>
References: <20100625011257.GA3993@nashi.ohno.39mm.net> <1277604884.26161.372.camel@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:54281 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752048Ab0GAPQc (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 1 Jul 2010 11:16:32 -0400
Content-Disposition: inline
In-Reply-To: <1277604884.26161.372.camel@localhost>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: Harald Welte <laforge@gnumonks.org>, Nicolas Limare <nicolas+debian@limare.net>, 587014@bugs.debian.org, platform-driver-x86@vger.kernel.org

On Sun, Jun 27, 2010 at 03:14:44AM +0100, Ben Hutchings wrote:
> Harald,
> 
> Nicolas Limare reported that the backlight control in panasonic-laptop
> is non-functional on the S9; see <http://bugs.debian.org/587014>.
> There's a kernel log attached to that bug report, but it doesn't show
> very much.  Can you suggest how to investigate this?

Could be a number of things. The output of acpidump would help.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
