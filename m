From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH -next] platform/x86/acerhdf: still depends on THERMAL
Date: Mon, 15 Dec 2014 09:33:52 -0800
Message-ID: <20141215173351.GA104292@vmdeb7>
References: <548F139D.4090901@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:35662 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750770AbaLORjM (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 15 Dec 2014 12:39:12 -0500
Content-Disposition: inline
In-Reply-To: <548F139D.4090901@infradead.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Peter Feuerer <peter@piie.net>

On Mon, Dec 15, 2014 at 09:00:13AM -0800, Randy Dunlap wrote:
> From: Randy Dunlap <rdunlap@infradead.org>
> 
> acerhdf uses thermal interfaces so it should depend on THERMAL.
> It also should not select a thermal driver without checking that
> THERMAL is enabled.
> 
> This fixes the following build errors when THERMAL=m and
> ACERHDF=y.

Thank you Randy, I'll include this in my pull request later this week. Now in
for-next.

-- 
Darren Hart
Intel Open Source Technology Center
