From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [platform/x86] 84c2f235ad BUG: KASAN: null-ptr-deref on address
 0000000000000008
Date: Mon, 27 Feb 2017 15:53:56 +1030
Message-ID: <20170227052356.GJ3807@marvin.atrad.com.au>
References: <20170227010836.GD28318@yexl-desktop>
 <20170227045840.mzhb2gqqyxmig5jo@wfg-t540p.sh.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:55570 "EHLO
        server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751648AbdB0Fpg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Feb 2017 00:45:36 -0500
Content-Disposition: inline
In-Reply-To: <20170227045840.mzhb2gqqyxmig5jo@wfg-t540p.sh.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Fengguang Wu <fengguang.wu@intel.com>
Cc: Alan Jenkins <alan-jenkins@tuffmail.co.uk>, kernel test robot <xiaolong.ye@intel.com>, Darren Hart <dvhart@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Micha?? K??pie?? <kernel@kempniu.pl>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, lkp@01.org

On Mon, Feb 27, 2017 at 12:58:40PM +0800, Fengguang Wu wrote:
> Here is another bisect result. The attached reproduce-* script may
> help debug the issue.

Thanks for this.  FYI the cause of this issue is already understood (refer
to previous linux-platform-driver ML discussions).  The relevant part of the
patch series (08/10) has been (or will be) reverted by Andy to resolve the
problem for the moment (as per my earlier email).  The issue that part 08/10
was aiming to fix will be addressed in a more complete way in a follow up
patch series from Michael in due course as explained in my Reviewed-by
comment.

Regards
  jonathan
