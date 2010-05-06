From: Mattia Dongili <malattia@linux.it>
Subject: Re: Sony laptop: Some Sony Vaio laptops do not enable wwan power
 by default
Date: Fri, 7 May 2010 07:36:23 +0900
Message-ID: <20100506223623.GA5345@kamineko.org>
References: <20100504165818.1B206F899A@sepang.rtg.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from static-220-247-10-204.b-man.svips.gol.ne.jp ([220.247.10.204]:39123
	"EHLO smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753479Ab0EFWqA (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 6 May 2010 18:46:00 -0400
Content-Disposition: inline
In-Reply-To: <20100504165818.1B206F899A@sepang.rtg.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Tim Gardner <timg@tpi.com>
Cc: platform-driver-x86@vger.kernel.org

On Tue, May 04, 2010 at 10:58:18AM -0600, Tim Gardner wrote:
> From ed5c70a6ad8fbc9834d76818e5f47bfec17a0026 Mon Sep 17 00:00:00 2001
> From: Tim Gardner <tim.gardner@canonical.com>
> Date: Tue, 21 Apr 2009 11:09:10 -0600
> Subject: [PATCH] Sony laptop: Some Sony Vaio laptops do not enable wwan power by default.
> 
> BugLink: http://bugs.launchpad.net/bugs/364678
>
> Added quirk to enable wwan power based on DMI information already present in the module.
> It appears that Vaio's do not enable power to wwan from a cold boot.

Could it be related to this bug instead?
https://bugzilla.kernel.org/show_bug.cgi?id=15303

I would be nice to have a the log of the module loading with debug=1 on
those TZ models (as well as the DSDT table) but I can't get the
submitter's email address from launchpad.

Thanks
-- 
mattia
:wq!
