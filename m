From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1] platform/x86: wmi: Switch to use new generic UUID API
Date: Sun, 13 Aug 2017 17:15:55 +0300
Message-ID: <1502633755.15214.4.camel@linux.intel.com>
References: <20170802132834.8223-1-andriy.shevchenko@linux.intel.com>
         <CALCETrU1vJXGUXhbwNkW1qi9c73tgxT0vWN7eO=ee21BrvNq0Q@mail.gmail.com>
         <CAHp75VcFB1BDNUG729mi5BkhcR_aBX4MzvoyzdRx=LaAg9=EHQ@mail.gmail.com>
         <CALCETrVUctPyYNjkLL3uZUdxFko9=tpMchpV09VpWEhbjMT16g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga07.intel.com ([134.134.136.100]:60271 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750942AbdHMOP6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 13 Aug 2017 10:15:58 -0400
In-Reply-To: <CALCETrVUctPyYNjkLL3uZUdxFko9=tpMchpV09VpWEhbjMT16g@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Lutomirski <luto@kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sun, 2017-08-06 at 08:43 -0700, Andy Lutomirski wrote:
> On Fri, Aug 4, 2017 at 8:27 AM, Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Fri, Aug 4, 2017 at 6:01 PM, Andy Lutomirski <luto@kernel.org>
> > wrote:
> > > > On Aug 2, 2017, at 9:28 AM, Andy Shevchenko <andriy.shevchenko@l
> > > > inux.intel.com> wrote:

> > > NAK.  guid_block is a firmware interface, so opaque kernel types
> > > don't
> > > belong in it.
> > 
> > I f we leave this, what do you think about everything else?
> 
> Assuming it works, it's fine with me.  I'd be happy to test.

Just sent v2.

> Keep in mind that this beast is a *little-endian* GUID abomination,
> and I don't see generic conversion helpers.  Something might need to
> be added.

Do you mean something like char16_to_guid() / char16_to_uuid() ?

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
