From: Fengguang Wu <fengguang.wu@intel.com>
Subject: Re: [platform/x86] 84c2f235ad BUG: KASAN: null-ptr-deref on address
 0000000000000008
Date: Mon, 27 Feb 2017 13:27:12 +0800
Message-ID: <20170227052712.36gjmt4qdpwj2q4p@wfg-t540p.sh.intel.com>
References: <20170227010836.GD28318@yexl-desktop>
 <20170227045840.mzhb2gqqyxmig5jo@wfg-t540p.sh.intel.com>
 <20170227052356.GJ3807@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:44534 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751252AbdB0F1V (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Feb 2017 00:27:21 -0500
Content-Disposition: inline
In-Reply-To: <20170227052356.GJ3807@marvin.atrad.com.au>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>
Cc: Alan Jenkins <alan-jenkins@tuffmail.co.uk>, kernel test robot <xiaolong.ye@intel.com>, Darren Hart <dvhart@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Micha?? K??pie?? <kernel@kempniu.pl>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, lkp@01.org

On Mon, Feb 27, 2017 at 03:53:56PM +1030, Jonathan Woithe wrote:
>On Mon, Feb 27, 2017 at 12:58:40PM +0800, Fengguang Wu wrote:
>> Here is another bisect result. The attached reproduce-* script may
>> help debug the issue.
>
>Thanks for this.  FYI the cause of this issue is already understood (refer
>to previous linux-platform-driver ML discussions).  The relevant part of the
>patch series (08/10) has been (or will be) reverted by Andy to resolve the
>problem for the moment (as per my earlier email).  The issue that part 08/10
>was aiming to fix will be addressed in a more complete way in a follow up
>patch series from Michael in due course as explained in my Reviewed-by
>comment.

Good to know that, thank you for the info!

Regards,
Fengguang
