From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v1] platform/x86: wmi: Switch to use new generic UUID
        API
Date: Wed, 30 Aug 2017 14:25:45 +0200
Message-ID: <20170830122545.GA26045@lst.de>
References: <20170802132834.8223-1-andriy.shevchenko@linux.intel.com> <CALCETrU1vJXGUXhbwNkW1qi9c73tgxT0vWN7eO=ee21BrvNq0Q@mail.gmail.com> <CAHp75VcFB1BDNUG729mi5BkhcR_aBX4MzvoyzdRx=LaAg9=EHQ@mail.gmail.com> <CALCETrVUctPyYNjkLL3uZUdxFko9=tpMchpV09VpWEhbjMT16g@mail.gmail.com> <1502633755.15214.4.camel@linux.intel.com> <CALCETrX1EtzwKTwc1T==W+4GRnh0+JxyXE4rfP79ynteR2ooUg@mail.gmail.com> <CALCETrVBm7c0EYEzOsaZnDCstc64ucJu49K39UD7gzS1e-UMFA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CALCETrVBm7c0EYEzOsaZnDCstc64ucJu49K39UD7gzS1e-UMFA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Lutomirski <luto@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Sun, Aug 13, 2017 at 08:34:56AM -0700, Andy Lutomirski wrote:
> > This specification defines a Uniform Resource Name namespace for
> > UUIDs (Universally Unique IDentifier), also known as GUIDs (Globally
> > Unique IDentifier).
> 
> No, that still matches what I thought I knew: "UUID" and "GUID" are synonyms.

Well, in practice they aren't - wintel GUID are big endian, and
RFC4122 clearly states it is big endian, although it uses the term
"network byte order":

In the absence of explicit application or presentation protocol
specification to the contrary, a UUID is encoded as a 128-bit object,
as follows:

The fields are encoded as 16 octets, with the sizes and order of the
fields defined above, and with each field encoded with the Most
Significant Byte first (known as network byte order).  Note that the
field names, particularly for multiplexed fields, follow historical
practice.

So yes, it is big endian, and it is defined an a sequence of octets.

> 
> typedef whatever uuid_t;
> typedef something_different uuid_le;  /* which already existed */
> 
> extern void uuid_le_to_uuid(uuid_t *out, uuid_le *in);
> extern void uuid_to_uuid_le(...);

What's the point of converting between a RFC4122 UUID and a Wintel
GUID?  They are used for entirely different things.
