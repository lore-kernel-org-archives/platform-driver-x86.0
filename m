From: Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCH v1] platform/x86: wmi: Switch to use new generic UUID API
Date: Fri, 1 Sep 2017 08:36:58 -0700
Message-ID: <CALCETrXEZtEkG0ZX13u8AUfEtObjf1S9Yg2uP4e8qgsUxjR2+Q@mail.gmail.com>
References: <20170802132834.8223-1-andriy.shevchenko@linux.intel.com>
 <CALCETrU1vJXGUXhbwNkW1qi9c73tgxT0vWN7eO=ee21BrvNq0Q@mail.gmail.com>
 <CAHp75VcFB1BDNUG729mi5BkhcR_aBX4MzvoyzdRx=LaAg9=EHQ@mail.gmail.com>
 <CALCETrVUctPyYNjkLL3uZUdxFko9=tpMchpV09VpWEhbjMT16g@mail.gmail.com>
 <1502633755.15214.4.camel@linux.intel.com> <CALCETrX1EtzwKTwc1T==W+4GRnh0+JxyXE4rfP79ynteR2ooUg@mail.gmail.com>
 <CALCETrVBm7c0EYEzOsaZnDCstc64ucJu49K39UD7gzS1e-UMFA@mail.gmail.com>
 <20170830122545.GA26045@lst.de> <CALCETrW6+MYpX+w-NKq8Uzo8_rJk+fLGkJaZiNAr4aCFRYNUQg@mail.gmail.com>
 <20170901082303.GA23482@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170901082303.GA23482@lst.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>
Cc: Andy Lutomirski <luto@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Sep 1, 2017 at 1:23 AM, Christoph Hellwig <hch@lst.de> wrote:
> On Wed, Aug 30, 2017 at 01:01:28PM -0700, Andy Lutomirski wrote:
>> What I'm saying is: I agree that "RFC4122 UUID" and "wintel GUID" are
>> different, but the new structs aren't called "RFC4122 UUID" and
>> "wintel GUID" - they're called "uuid" and "guid".  I think the latter
>> is very far from intuitive.  I read the wmi patches several times
>> before I figured out that they were even potentially correct.
>
> uuid_t is the classic type for the RFC4122 UUID, userspace libuuid
> which exists on just about any platforms calls it that, and in
> the kernel XFS has been since before uuid_be was introduces.

> Now
> for the Wintel GUID we'd have to call it "GUID" to stay close to
> the roots, but I think guid_t is a good enough Linux-ish approximation
> for that.

Why?  I guess I agree that the string "guid" of whatever case should
be there, and, if the world actually thought that "guid" meant
"little-endian Wintel monstrosity", I'd be fine with that.  But it
doesn't.  I just Googled the string guid and the entire first page of
results either directly states that guid and uuid are synonymous or
merely fails to acknowledge the difference.  Even the link that
actually points to Microsoft:

https://msdn.microsoft.com/en-us/library/system.guid(v=vs.110).aspx

says nothing about endianness.  It mentions a constructor that accepts
a 16 byte array and *does not document* what it means.

For good measure, I Binged it, too.  Same results.

So please, please, PLEASE give them names that actually explain
something.  How about "guid_le"?  That uses the Microsoft-preferred
"g" *and* conveys the important bit, which is that the endianness is
screwed up.

FWIW, just plain "guid' is also problematic even if the reader somehow
realizes that it specifically means the Wintel one.  The actual
Windows definition of GUID is:

typedef struct _GUID {
  DWORD Data1;
  WORD  Data2;
  WORD  Data3;
  BYTE  Data4[8];
} GUID;

Which is not a valid substitute for the one in Linus' tree:

typedef struct {
        __u8 b[16];
} guid_t;

MS's GUID has its endianness depend on the system endianness.  The
shiny one in uapi/uuid.h is always little-endian.  So if you really
want to stick to MS's terminology, the new struct is wrong.

Please just rename it "guid_le_t" or "guid_le".  Until/unless
something that happens, I'm not going to ack the changes to the wmi
driver, since I think they're entirely a step backwards and they take
code that looks correct and make it look wrong.

>
>> 1. Make them totally separate.  Have a function to convert a string to
>> a uuid_le (or a guid_le or whatever you want to call it, as long as
>> "le" or perhaps "wintel" is involved so it's obvious.)  Have another
>> function to convert back.  Teach printk to understand %pULE.
>
> They are entirely separate - one uses the uuid_* functions, one uses
> guid_* functions.

Keeping them separate is fine with me.  My objection is not to the API
structure -- it's to the fact that neither the obvious reading (guid
== uuid) nor the Wintel-centric reading (struct GUID) actually match
what the code does.
