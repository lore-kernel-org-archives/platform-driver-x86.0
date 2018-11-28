From: Andy Lutomirski <luto@amacapital.net>
Subject: Re: [PATCH v17 18/23] platform/x86: Intel SGX driver
Date: Wed, 28 Nov 2018 13:52:00 -0800
Message-ID: <CALCETrV4UA5bn6dkq5aVycApx1ubq-rho_z=sHhxABbOSGZWMw@mail.gmail.com>
References: <20181119161917.GF13298@linux.intel.com> <CALCETrX+A4XaEMq3fJqmHUeeDHr_BdWh-Wk3ikXfY=L77BbaGA@mail.gmail.com>
 <20181120120442.GA22172@linux.intel.com> <20181122111253.GA31150@wind.enjellic.com>
 <CALCETrWJr-C6yK8NBCp=NbapwHOaBFphiDU9VKEtQ0NMRrdC2g@mail.gmail.com>
 <20181124172114.GB32210@linux.intel.com> <20181125145329.GA5777@linux.intel.com>
 <0669C300-02CB-4EA6-BF88-5C4B4DDAD4C7@amacapital.net> <20181126215145.GC868@linux.intel.com>
 <20181126230436.GA6737@linux.intel.com> <20181127085533.GA12247@wind.enjellic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181127085533.GA12247@wind.enjellic.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Dr. Greg Wettstein" <greg@enjellic.com>
Cc: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, Andrew Lutomirski <luto@kernel.org>, X86 ML <x86@kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, linux-sgx@vger.kernel.org, Dave Hansen <dave.hansen@intel.com>, "Christopherson, Sean J" <sean.j.christopherson@intel.com>, nhorman@redhat.com, npmccallum@redhat.com, "Ayoun, Serge" <serge.ayoun@intel.com>, shay.katz-zamir@intel.com, haitao.huang@linux.intel.com, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, "Svahn, Kai" <kai.svahn@intel.com>, mark.shanahan@intel.com, Suresh Siddha <suresh.b.siddha@intel.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Darren Hart <dvhart@infradead.org>Andy
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Nov 27, 2018 at 12:55 AM Dr. Greg <greg@enjellic.com> wrote:
> Since the thread has become a bit divergent I wanted to note that we
> have offered a proposal for a general policy management framework
> based on MRSIGNER values.  This framework is consistent with the SGX
> security model, ie. cryptographic rather then DAC based policy
> controls.  This framework also allows a much more flexible policy
> implementation that doesn't result in combinatoric issues.

Can you give a concrete explanation of a problem that your proposal
would solve?  As far as I can tell, it gets rid of a case in which an
unprivileged attacker who can run enclaves but hasn't compromised the
kernel can learn the PPID and other SGX-related permanent platform
identifiers, but it does nothing to prevent the same attacker from
learning non-SGX-related permanent identifiers, nor does it prevent
the attacker from using the Intel quoting enclave (unless configured
in a surprising way) and thus attesting to a remote system.

So what problem does it solve?
