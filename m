From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] dell-laptop: Add another Dell laptop to the DMI whitelist
Date: Thu, 16 Feb 2017 17:59:10 -0800
Message-ID: <20170217015910.GC6814@wisp>
References: <1487249883-7013-1-git-send-email-alex.hung@canonical.com>
 <20170216132221.GA22666@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:39108 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755077AbdBQB7N (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 16 Feb 2017 20:59:13 -0500
Content-Disposition: inline
In-Reply-To: <20170216132221.GA22666@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Alex Hung <alex.hung@canonical.com>, mjg59@srcf.ucam.org, andy@infradead.org, platform-driver-x86@vger.kernel.org

On Thu, Feb 16, 2017 at 02:22:21PM +0100, Pali Rohár wrote:
> On Thursday 16 February 2017 20:58:03 Alex Hung wrote:
> > This is to support Latitude 7480 and many other newer Dell laptops.
> > 
> > Signed-off-by: Alex Hung <alex.hung@canonical.com>
> 
> Looks good. Maybe should be this change backported to stable?

Applied.

I'd want to see testing on the previous kernels to ensure all the necessary
support for those laptops has also been backported before sending DMI matches
back. We don't want to end up with just the DMI matches in stable kernels, but
inadvertently omit some functional change those machines require which have been
added since the stable release.

Thanks,

-- 
Darren Hart
Intel Open Source Technology Center
