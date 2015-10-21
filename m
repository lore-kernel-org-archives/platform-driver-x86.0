From: Darren Hart <dvhart@infradead.org>
Subject: Re: [Bug 106031] Regression in 4.2.x: in airplane mode each time I
 open my laptop lid
Date: Wed, 21 Oct 2015 10:57:24 +0200
Message-ID: <20151021085724.GA87951@vmdeb7>
References: <bug-106031-5380@https.bugzilla.kernel.org/>
 <bug-106031-5380-zVXKHiyrZU@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:45395 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753801AbbJUI5R (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 21 Oct 2015 04:57:17 -0400
Content-Disposition: inline
In-Reply-To: <bug-106031-5380-zVXKHiyrZU@https.bugzilla.kernel.org/>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>

On Sun, Oct 18, 2015 at 09:34:56AM +0000, bugzilla-daemon@bugzilla.kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=106031
> 
> --- Comment #2 from Britt Yazel <bwyazel@gmail.com> ---
> Confirmed. Blacklisting the dell_rbtn module solves this issue

Pali,

Can you take a look at this bug report regarding a 4.2 regression for rfkill
after the introduction of the dell-rbtn driver please.

-- 
Darren Hart
Intel Open Source Technology Center
