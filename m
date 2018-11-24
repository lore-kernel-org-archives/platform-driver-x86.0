From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v17 18/23] platform/x86: Intel SGX driver
Date: Sat, 24 Nov 2018 09:21:14 -0800
Message-ID: <20181124172114.GB32210@linux.intel.com>
References: <20181116010412.23967-1-jarkko.sakkinen@linux.intel.com>
 <20181116010412.23967-19-jarkko.sakkinen@linux.intel.com>
 <CALCETrXctxfED1Dr-MuZxFnh5gzTyRL06hRJ_fQnNA8p2S4xEQ@mail.gmail.com>
 <20181119161917.GF13298@linux.intel.com>
 <CALCETrX+A4XaEMq3fJqmHUeeDHr_BdWh-Wk3ikXfY=L77BbaGA@mail.gmail.com>
 <20181120120442.GA22172@linux.intel.com>
 <20181122111253.GA31150@wind.enjellic.com>
 <CALCETrWJr-C6yK8NBCp=NbapwHOaBFphiDU9VKEtQ0NMRrdC2g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CALCETrWJr-C6yK8NBCp=NbapwHOaBFphiDU9VKEtQ0NMRrdC2g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Lutomirski <luto@kernel.org>
Cc: "Dr. Greg Wettstein" <greg@enjellic.com>, X86 ML <x86@kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, linux-sgx@vger.kernel.org, Dave Hansen <dave.hansen@intel.com>, "Christopherson, Sean J" <sean.j.christopherson@intel.com>, nhorman@redhat.com, npmccallum@redhat.com, "Ayoun, Serge" <serge.ayoun@intel.com>, shay.katz-zamir@intel.com, haitao.huang@linux.intel.com, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, "Svahn, Kai" <kai.svahn@intel.com>, mark.shanahan@intel.com, Suresh Siddha <suresh.b.siddha@intel.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, LKML <linux-kernel@vger>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Nov 22, 2018 at 07:21:08AM -0800, Andy Lutomirski wrote:
> > At a high level, addressing these issues is straight forward.  First,
> > the driver needs to support authorization equivalent to that which is
> > implemented in the current Intel Launch Enclave, ie. control over the
> > SGX_FLAGS_PROVISION_KEY attribute.
> 
> I agree, hence my email :)

Started to scratch my head that is it really an issue that any enclave
can provision in the end?

Direct quote from your first response:

"In particular, the ability to run enclaves with the provisioning bit set
is somewhat sensitive, since it effectively allows access to a stable
fingerprint of the system."

As can be seen from the key derivation table this does not exactly hold
so you should refine your original argument before we can consider any
type of change.

I just don't see what it is so wrong for any enclave to be able to tell
that it really is an enclave.

/Jarkko
