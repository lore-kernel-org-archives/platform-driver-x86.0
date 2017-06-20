From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: WMI and Kernel:User interface
Date: Tue, 20 Jun 2017 09:29:06 +0200
Message-ID: <20170620072906.GI32387@pali>
References: <20170613012435.GB27850@fury>
 <20170613070535.GA13252@infradead.org>
 <20170613153857.GC27850@fury>
 <20170613155000.GA24483@kroah.com>
 <20170613162242.GF27850@fury>
 <20170613165247.GA32546@kroah.com>
 <20170613170719.GK27850@fury>
 <20170614043853.GE10146@kroah.com>
 <CALCETrWvkXe7yjMYK8GrY8LMfMWWLL7GoWq4_H0nDWJ+ay8-fg@mail.gmail.com>
 <20170620033725.GC16249@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f54.google.com ([74.125.82.54]:38128 "EHLO
        mail-wm0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751144AbdFTH3J (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 20 Jun 2017 03:29:09 -0400
Content-Disposition: inline
In-Reply-To: <20170620033725.GC16249@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Andy Lutomirski <luto@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Christoph Hellwig <hch@infradead.org>, Linus Torvalds <torvalds@linux-foundation.org>, Mario Limonciello <mario_limonciello@dell.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Rafael Wysocki <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org

On Monday 19 June 2017 20:37:25 Darren Hart wrote:
> dell-wmi:
> Type and code, where type may be, for example, "sequence" and then each byte of
> buffen length is processed as a key.

It is more complicated. Buffer can contain more sequences (each has own
length) and each sequence can contain different hotkey + additional info.

So I doubt it would be possible to describe in context-free grammar
specification of even buffer... And something more complicated (as L0 or
L1) is not a good idea to parse in kernel.

-- 
Pali Rohár
pali.rohar@gmail.com
