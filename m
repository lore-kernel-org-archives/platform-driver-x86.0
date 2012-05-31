From: Mattia Dongili <malattia@linux.it>
Subject: Re: [PATCH 01/19] sony-laptop: use soft rfkill status stored in hw
Date: Fri, 1 Jun 2012 07:02:59 +0900
Message-ID: <20120531220257.GA3986@kamineko.org>
References: <1337434562-12283-1-git-send-email-malattia@linux.it>
 <1337434562-12283-2-git-send-email-malattia@linux.it>
 <20120531183952.GC19363@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:46831 "EHLO
	smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753627Ab2EaWLy (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 31 May 2012 18:11:54 -0400
Content-Disposition: inline
In-Reply-To: <20120531183952.GC19363@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Marco Chiappero <marco@absence.it>, Javier Achirica <achirica@gmail.com>

On Thu, May 31, 2012 at 07:39:52PM +0100, Matthew Garrett wrote:
> I've applied the set other than the HDD shock and ALS code. I just want 
> to do some more checking of the current state of interfaces there to see 
> if there's more commonality - the generic ACPI ALS driver looks like it 
> may finally go somewhere, and I want to ensure compatibility.

Thanks, makes sense.
How about including them as experimental features (CONFIG_EXPERIMENTAL)?

Also, I have a handful of fixes that I was planning to fold into this
series and resend as v2 this weekend. I'll send incremental patches
instead.

-- 
mattia
:wq!
