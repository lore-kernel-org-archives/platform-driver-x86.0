From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform/x86: have ACPI_CMPC use depends instead of
 select for INPUT
Date: Mon, 15 Jan 2018 12:42:29 -0800
Message-ID: <20180115204229.GA11094@fury>
References: <913480bb-d06a-3f13-e8fc-20f83ff499a0@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:42571 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750716AbeAOUma (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 15 Jan 2018 15:42:30 -0500
Content-Disposition: inline
In-Reply-To: <913480bb-d06a-3f13-e8fc-20f83ff499a0@infradead.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Andy Shevchenko <andy@infradead.org>

On Sun, Jan 14, 2018 at 09:11:18PM -0800, Randy Dunlap wrote:
> From: Randy Dunlap <rdunlap@infradead.org>
> 
> Drivers should not 'select' a subsystem. Instead they should depend
> on it. If the subsystem is disabled, the user probably did that for
> a purpose and one driver shouldn't be changing that.
> 
> This also makes all platform/x86/ drivers consistent w.r.t depending on
> INPUT instead of selecting it.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Darren Hart <dvhart@infradead.org>
> Cc: Andy Shevchenko <andy@infradead.org>
> Cc: platform-driver-x86@vger.kernel.org

Thanks Randy, queued.

-- 
Darren Hart
VMware Open Source Technology Center
