From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v1] platform/x86: wmi: Switch to use new generic UUID
        API
Date: Fri, 1 Sep 2017 10:23:03 +0200
Message-ID: <20170901082303.GA23482@lst.de>
References: <20170802132834.8223-1-andriy.shevchenko@linux.intel.com> <CALCETrU1vJXGUXhbwNkW1qi9c73tgxT0vWN7eO=ee21BrvNq0Q@mail.gmail.com> <CAHp75VcFB1BDNUG729mi5BkhcR_aBX4MzvoyzdRx=LaAg9=EHQ@mail.gmail.com> <CALCETrVUctPyYNjkLL3uZUdxFko9=tpMchpV09VpWEhbjMT16g@mail.gmail.com> <1502633755.15214.4.camel@linux.intel.com> <CALCETrX1EtzwKTwc1T==W+4GRnh0+JxyXE4rfP79ynteR2ooUg@mail.gmail.com> <CALCETrVBm7c0EYEzOsaZnDCstc64ucJu49K39UD7gzS1e-UMFA@mail.gmail.com> <20170830122545.GA26045@lst.de> <CALCETrW6+MYpX+w-NKq8Uzo8_rJk+fLGkJaZiNAr4aCFRYNUQg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CALCETrW6+MYpX+w-NKq8Uzo8_rJk+fLGkJaZiNAr4aCFRYNUQg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Lutomirski <luto@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Aug 30, 2017 at 01:01:28PM -0700, Andy Lutomirski wrote:
> What I'm saying is: I agree that "RFC4122 UUID" and "wintel GUID" are
> different, but the new structs aren't called "RFC4122 UUID" and
> "wintel GUID" - they're called "uuid" and "guid".  I think the latter
> is very far from intuitive.  I read the wmi patches several times
> before I figured out that they were even potentially correct.

uuid_t is the classic type for the RFC4122 UUID, userspace libuuid
which exists on just about any platforms calls it that, and in
the kernel XFS has been since before uuid_be was introduces. Now
for the Wintel GUID we'd have to call it "GUID" to stay close to
the roots, but I think guid_t is a good enough Linux-ish approximation
for that.

> 1. Make them totally separate.  Have a function to convert a string to
> a uuid_le (or a guid_le or whatever you want to call it, as long as
> "le" or perhaps "wintel" is involved so it's obvious.)  Have another
> function to convert back.  Teach printk to understand %pULE.

They are entirely separate - one uses the uuid_* functions, one uses
guid_* functions.

> 2. Have a function to convert back and forth so that kernel code uses
> the real RFC4122 UUID for internal representations and keep just %pU.

99% of the uses are in interfaces we don't control - on disk, on the
wire, firmware, hypervisor.  So there really is no point in converting
between them.
