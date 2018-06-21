From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v11 04/13] x86, sgx: add SGX definitions to msr-index.h
Date: Thu, 21 Jun 2018 20:22:29 +0300
Message-ID: <20180621172229.GB12562@linux.intel.com>
References: <20180608171216.26521-1-jarkko.sakkinen@linux.intel.com>
 <20180608171216.26521-5-jarkko.sakkinen@linux.intel.com>
 <a51c11da-650a-1828-4173-e424a5340565@intel.com>
 <20180619131828.GD5609@linux.intel.com>
 <4a92d6d2-30d9-eeaf-1afc-cfa35cae004e@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4a92d6d2-30d9-eeaf-1afc-cfa35cae004e@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Hansen <dave.hansen@intel.com>
Cc: x86@kernel.org, platform-driver-x86@vger.kernel.org, sean.j.christopherson@intel.com, nhorman@redhat.com, npmccallum@redhat.com, Haim Cohen <haim.cohen@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Borislav Petkov <bp@suse.de>, Tom Lendacky <thomas.lendacky@amd.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, David Woodhouse <dwmw@amazon.co.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Janakarajan Natarajan <Janakarajan.Natarajan@amd.com>, "open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <linux-kernel@vger.kernel.org>, "open list:INTEL SGX" <intel-sgx-kernel-dev@lists.01.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Jun 19, 2018 at 07:01:57AM -0700, Dave Hansen wrote:
> On 06/19/2018 06:18 AM, Jarkko Sakkinen wrote:
> > On Fri, Jun 08, 2018 at 10:25:29AM -0700, Dave Hansen wrote:
> >> On 06/08/2018 10:09 AM, Jarkko Sakkinen wrote:
> >>> Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
> >>> Signed-off-by: Haim Cohen <haim.cohen@intel.com>
> >>> Tested-by: Serge Ayoun <serge.ayoun@intel.com>
> >>> Reviewed-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> >>> Tested-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> >>> Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> >>
> >> These are a mess.  If you're signing off on it, a review of some kind is
> >> pretty implied.
> >>
> >> Also, how did Sean write this, send it to Haim to sign off on it, and
> >> then send it to you?  That seems unlikely.
> > 
> > They've both done something to this. How should I change it then?
> 
> Who added their Signed-off-by?
> 
> I would probably add a single "Co-developed-by:" for each of them and a
> single Signed-off-by, like commit 12c89130a56ae:
> 
>     Co-developed-by: Tony Luck <tony.luck@intel.com>
>     Reported-by: Mika Penttilä <mika.penttila@nextfour.com>
>     Signed-off-by: Dan Williams <dan.j.williams@intel.com>
>     Cc: Al Viro <viro@zeniv.linux.org.uk>
>     Cc: Andrew Morton <akpm@linux-foundation.org>
>     Cc: Andy Lutomirski <luto@amacapital.net>
>     ...

Thanks, I was not aware of that tag.

/Jarkko
