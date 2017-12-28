From: Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH v2] x86/platform/intel-mid: Revert "Make 'bt_sfi_data'
 const"
Date: Thu, 28 Dec 2017 13:34:14 +0100
Message-ID: <20171228123413.3shmkfsewmq3y4e5@gmail.com>
References: <20171228122523.21802-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wr0-f194.google.com ([209.85.128.194]:34604 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752877AbdL1MeR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 28 Dec 2017 07:34:17 -0500
Content-Disposition: inline
In-Reply-To: <20171228122523.21802-1-andriy.shevchenko@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Andi Kleen <andi@firstfloor.org>, linux-kernel@vger.kernel.org, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, Bhumika Goyal <bhumirks@gmail.com>, julia.lawall@lip6.fr


* Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> v2: low the tone of accusation that this made a regression

BTW., don't worry about that aspect too much: after a long debugging session it's 
pretty natural to be upset at whoever introduced a regression.

( In fact a number of times I too got upset at the moron who wrote a particular 
  piece of buggy code, only for 'git annotate' to remind me that the moron was me. )

I personally just ignore the emotional attributes, and I usually edit changelogs 
accordingly as well so the temporary state of mind of finding a regression doesn't 
trickle upstream.

Plus in this particular case if we can help type propagation for driver data to 
become a bit cleaner then the kernel project has gained a bit through all this 
pain.

Thanks,

	Ingo
