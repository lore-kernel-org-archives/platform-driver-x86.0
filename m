From: Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCH v17 18/23] platform/x86: Intel SGX driver
Date: Thu, 22 Nov 2018 12:56:23 -0800
Message-ID: <CALCETrV4wOpk7wf9+ywd50PekGjfT7LNtwqHhcV08=oxPmKtKQ@mail.gmail.com>
References: <20181116010412.23967-1-jarkko.sakkinen@linux.intel.com>
 <20181116010412.23967-19-jarkko.sakkinen@linux.intel.com> <CALCETrXctxfED1Dr-MuZxFnh5gzTyRL06hRJ_fQnNA8p2S4xEQ@mail.gmail.com>
 <20181119161917.GF13298@linux.intel.com> <CALCETrX+A4XaEMq3fJqmHUeeDHr_BdWh-Wk3ikXfY=L77BbaGA@mail.gmail.com>
 <20181120120442.GA22172@linux.intel.com> <20181122111253.GA31150@wind.enjellic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181122111253.GA31150@wind.enjellic.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Dr. Greg Wettstein" <greg@enjellic.com>
Cc: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, X86 ML <x86@kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, linux-sgx@vger.kernel.org, Dave Hansen <dave.hansen@intel.com>, "Christopherson, Sean J" <sean.j.christopherson@intel.com>, nhorman@redhat.com, npmccallum@redhat.com, "Ayoun, Serge" <serge.ayoun@intel.com>, shay.katz-zamir@intel.com, haitao.huang@linux.intel.com, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, "Svahn, Kai" <kai.svahn@intel.com>, mark.shanahan@intel.com, Suresh Siddha <suresh.b.siddha@intel.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Nov 22, 2018 at 3:12 AM Dr. Greg <greg@enjellic.com> wrote:
> In addition, we are not confident
> the driver will be useful to anything other then server class hardware
> and will be incapable of supporting virtually all of the existing SGX
> hardware in the field.

I forgot to mention: I have a plain old retail Intel Celeron (I think
-- it's not in front of me right now) that has Flex LC.  I suspect
that, going forward, all new Intel CPUs will support Flex LC.  I
really wish that Intel would document all of the detailed capabilities
of all their CPUs somewhere.

There has been some talk of how the driver could support old CPUs.  It
would involve a rather different LE being signed by Intel, but it
should be more or less transparent to user code if it happens.
