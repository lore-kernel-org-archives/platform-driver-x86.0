From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v17 18/23] platform/x86: Intel SGX driver
Date: Tue, 18 Dec 2018 15:27:11 +0200
Message-ID: <20181218132711.GD25667@linux.intel.com>
References: <7d5cde02-4649-546b-0f03-2d6414bb80b5@intel.com>
 <20181217180102.GA12560@linux.intel.com>
 <20181217183613.GD12491@linux.intel.com>
 <20181217184333.GA26920@linux.intel.com>
 <ccfb67a0-fd8d-82c8-8018-fd68e901f287@intel.com>
 <CALCETrX0W4dhFJBHEbDbKed_QZxmw6ZNMajfsoVgqGqhMB0nDg@mail.gmail.com>
 <20181217222047.GG12491@linux.intel.com>
 <20181218013918.GC333@linux.intel.com>
 <20181218032702.GA2903@linux.intel.com>
 <CALCETrVTfGUSfm5hy9_F00LcMUHJqAjOmfJhtXP+uD5dnmt4EQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CALCETrVTfGUSfm5hy9_F00LcMUHJqAjOmfJhtXP+uD5dnmt4EQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Lutomirski <luto@kernel.org>
Cc: Sean Christopherson <sean.j.christopherson@intel.com>, Dave Hansen <dave.hansen@intel.com>, X86 ML <x86@kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, linux-sgx@vger.kernel.org, nhorman@redhat.com, npmccallum@redhat.com, "Ayoun, Serge" <serge.ayoun@intel.com>, shay.katz-zamir@intel.com, Haitao Huang <haitao.huang@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, "Svahn, Kai" <kai.svahn@intel.com>, mark.shanahan@intel.com, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Dec 17, 2018 at 09:02:03PM -0800, Andy Lutomirski wrote:
> That's what unmap_mapping_range(), etc do for you, no?  IOW make a
> struct address_space that represents the logical enclave address
> space, i.e. address 0 is the start and the pages count up from there.
> You can unmap pages whenever you want, and the core mm code will take
> care of zapping the pages from all vmas referencing that
> address_space.

OK, so it does. Did not have time to look at it last night (about
3AM) :-) Yes, we could use that to do the N process zapping.

Based on this discussion I can take the first steps with the swapping
code.

And yeah, I don't think we need anon inode for this one. Can just use
the dev inode (did not check in detail but on the surface looks like
it).

/Jarkko
