From: Ye Xiaolong <xiaolong.ye@intel.com>
Subject: Re: [lkp-robot] [platform/x86]  a869ab5dab:
 BUG:unable_to_handle_kernel
Date: Mon, 27 Feb 2017 09:31:08 +0800
Message-ID: <20170227013108.GC32284@yexl-desktop>
References: <20170227010414.GB32284@yexl-desktop>
 <20170227011143.GI3807@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga07.intel.com ([134.134.136.100]:52130 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751117AbdB0BcG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 26 Feb 2017 20:32:06 -0500
Content-Disposition: inline
In-Reply-To: <20170227011143.GI3807@marvin.atrad.com.au>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>
Cc: Alan Jenkins <alan-jenkins@tuffmail.co.uk>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Micha?? K??pie?? <kernel@kempniu.pl>, LKML <linux-kernel@vger.kernel.org>, Darren Hart <dvhart@linux.intel.com>, platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>, lkp@01.org

On 02/27, Jonathan Woithe wrote:
>On Mon, Feb 27, 2017 at 09:04:14AM +0800, kernel test robot wrote:
>> FYI, we noticed the following commit:
>> 
>> commit: a869ab5dabf6ec5327a3b2bb366eccf80b207d76 ("platform/x86: fujitsu-laptop: only register backlight device if FUJ02B1 is present")
>> git://git.infradead.org/users/dvhart/linux-platform-drivers-x86.git testing
>> 
>> in testcase: boot
>> 
>> on test machine: qemu-system-i386 -enable-kvm -m 360M
>> 
>> caused below changes (please refer to attached dmesg/kmsg for entire log/backtrace):
>
>This is due to the accidental merge of patch 08/10 in the patch series. 
>This was spotted by Michael and I understand Andy is addressing the
>oversight.

Got it, thanks for watching the report.

Thanks,
Xiaolong
>
>Regards
>  jonathan
