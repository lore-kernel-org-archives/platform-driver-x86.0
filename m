From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [lkp-robot] [platform/x86]  a869ab5dab:
 BUG:unable_to_handle_kernel
Date: Mon, 27 Feb 2017 11:41:43 +1030
Message-ID: <20170227011143.GI3807@marvin.atrad.com.au>
References: <20170227010414.GB32284@yexl-desktop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170227010414.GB32284@yexl-desktop>
Sender: linux-kernel-owner@vger.kernel.org
To: kernel test robot <xiaolong.ye@intel.com>
Cc: Alan Jenkins <alan-jenkins@tuffmail.co.uk>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Micha?? K??pie?? <kernel@kempniu.pl>, LKML <linux-kernel@vger.kernel.org>, Darren Hart <dvhart@linux.intel.com>, platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>, lkp@01.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Feb 27, 2017 at 09:04:14AM +0800, kernel test robot wrote:
> FYI, we noticed the following commit:
> 
> commit: a869ab5dabf6ec5327a3b2bb366eccf80b207d76 ("platform/x86: fujitsu-laptop: only register backlight device if FUJ02B1 is present")
> git://git.infradead.org/users/dvhart/linux-platform-drivers-x86.git testing
> 
> in testcase: boot
> 
> on test machine: qemu-system-i386 -enable-kvm -m 360M
> 
> caused below changes (please refer to attached dmesg/kmsg for entire log/backtrace):

This is due to the accidental merge of patch 08/10 in the patch series. 
This was spotted by Michael and I understand Andy is addressing the
oversight.

Regards
  jonathan
