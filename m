From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCHv3] hp-wmi: limit hotkey enable
Date: Thu, 10 Sep 2015 10:46:58 -0700
Message-ID: <20150910174658.GD113820@vmdeb7>
References: <1438959360-20901-1-git-send-email-kvans32@gmail.com>
 <20150828184228.GA64484@vmdeb7>
 <55E1CF30.10501@gmail.com>
 <20150906180339.GC90062@vmdeb7>
 <55EF2913.2090902@gmail.com>
 <20150908202232.GD90062@vmdeb7>
 <55F09762.3070101@gmail.com>
 <20150910030330.GE90062@vmdeb7>
 <55F1B391.7020601@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:45011 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753191AbbIJRrA (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 10 Sep 2015 13:47:00 -0400
Content-Disposition: inline
In-Reply-To: <55F1B391.7020601@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Kyle Evans <kvans32@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, Rafael Wysocki <rjw@rjwysocki.net>

On Thu, Sep 10, 2015 at 11:45:05AM -0500, Kyle Evans wrote:
> From 0e2c0ae37e1fbc326c54a60b2845eb0c7566d389 Mon Sep 17 00:00:00 2001
> From: Kyle Evans <kvans32@gmail.com>
> Date: Tue, 1 Sep 2015 18:50:45 -0500
> Subject: [PATCH] hp-wmi: limit hotkey enable
> 
> Do not write initialize magic on systems that do not have
> feature query 0xb. Fixes Bug #82451.
> 
> Redefine FEATURE_QUERY to align with 0xb and FEATURE2 with 0xd
> for code clearity.
> 
> Add a new test function, hp_wmi_bios_2008_later() & simplify
> hp_wmi_bios_2009_later(), which fixes a bug in cases where
> an improper value is returned. May also fix Bug #69131.
> 
> Signed-off-by: Kyle Evans <kvans32@gmail.com>

Thanks Kyle,

I think this looks much better. Unfortunately, it doesn't apply to either Linus'
master nor my for-next branch, with all 3 hunks failing even with the more
forgiving manual patch application. Please check your base and regenerate based
on either Linus' master (the usual approach) or my for-next branch.

-- 
Darren Hart
Intel Open Source Technology Center
