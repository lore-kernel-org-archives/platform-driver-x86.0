From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v17 18/23] platform/x86: Intel SGX driver
Date: Wed, 12 Dec 2018 20:00:36 +0200
Message-ID: <20181212180036.GC6333@linux.intel.com>
References: <20181125145329.GA5777@linux.intel.com>
 <0669C300-02CB-4EA6-BF88-5C4B4DDAD4C7@amacapital.net>
 <20181126215145.GC868@linux.intel.com>
 <20181126230436.GA6737@linux.intel.com>
 <20181127085533.GA12247@wind.enjellic.com>
 <20181127164129.GB4170@linux.intel.com>
 <C11C9312-65BC-460A-8F9F-608E101AE5C1@amacapital.net>
 <20181128104941.GA23077@wind.enjellic.com>
 <20181128192228.GC9023@linux.intel.com>
 <20181210104908.GA23132@wind.enjellic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181210104908.GA23132@wind.enjellic.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Dr. Greg" <greg@enjellic.com>
Cc: Andy Lutomirski <luto@amacapital.net>, Andy Lutomirski <luto@kernel.org>, X86 ML <x86@kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, linux-sgx@vger.kernel.org, Dave Hansen <dave.hansen@intel.com>, "Christopherson, Sean J" <sean.j.christopherson@intel.com>, nhorman@redhat.com, npmccallum@redhat.com, "Ayoun, Serge" <serge.ayoun@intel.com>, shay.katz-zamir@intel.com, haitao.huang@linux.intel.com, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, "Svahn, Kai" <kai.svahn@intel.com>, mark.shanahan@intel.com, Suresh Siddha <suresh.b.siddha@intel.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infrade>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Dec 10, 2018 at 04:49:08AM -0600, Dr. Greg wrote:
> In the meantime, I wanted to confirm that your jarkko-sgx/master
> branch contains the proposed driver that is headed upstream.  Before
> adding the SFLC patches we thought it best to run the driver through
> some testing in order to verify that any problems we generated where
> attributable to our work and not the base driver.

The master branch is by definition unstable at the moment i.e. it can
sometimes (not often) contain unfinished changes. Use next for testing.
I update next when I consider the master contents "stable enough".

Thanks.

/Jarkko
