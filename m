From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v17 18/23] platform/x86: Intel SGX driver
Date: Sat, 24 Nov 2018 08:45:34 -0800
Message-ID: <20181124164534.GC30310@linux.intel.com>
References: <20181116010412.23967-1-jarkko.sakkinen@linux.intel.com>
 <20181116010412.23967-19-jarkko.sakkinen@linux.intel.com>
 <CALCETrXctxfED1Dr-MuZxFnh5gzTyRL06hRJ_fQnNA8p2S4xEQ@mail.gmail.com>
 <20181119161917.GF13298@linux.intel.com>
 <CALCETrX+A4XaEMq3fJqmHUeeDHr_BdWh-Wk3ikXfY=L77BbaGA@mail.gmail.com>
 <20181120120442.GA22172@linux.intel.com>
 <20181122111253.GA31150@wind.enjellic.com>
 <CALCETrV4wOpk7wf9+ywd50PekGjfT7LNtwqHhcV08=oxPmKtKQ@mail.gmail.com>
 <20181123103923.GA13851@wind.enjellic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181123103923.GA13851@wind.enjellic.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Dr. Greg" <greg@enjellic.com>
Cc: Andy Lutomirski <luto@kernel.org>, X86 ML <x86@kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, linux-sgx@vger.kernel.org, Dave Hansen <dave.hansen@intel.com>, "Christopherson, Sean J" <sean.j.christopherson@intel.com>, nhorman@redhat.com, npmccallum@redhat.com, "Ayoun, Serge" <serge.ayoun@intel.com>, shay.katz-zamir@intel.com, haitao.huang@linux.intel.com, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, "Svahn, Kai" <kai.svahn@intel.com>, mark.shanahan@intel.com, Suresh Siddha <suresh.b.siddha@intel.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, LKML <linux-kernel@vger.kernel>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Nov 23, 2018 at 04:39:23AM -0600, Dr. Greg wrote:
> Jarkko, when this driver lands it will set the SGX ABI in stone for
> Linux.  It would be very, very helpful to the development community if
> there was some official guidance from Intel on whether or not FLC will
> be a universal feature on all hardware and the date that is going to
> happen or has happened.

I seriously don't know but I can take this message to the mothership...

> If this turns out to be an OEM selectable issue via firmware
> customizations, things will be even more problematic.

Point taken.

> As things stand now, the proposed mainline SGX driver is going to be
> useless for a lot of hardware that is out in the field.  Linux has
> always had the reputation for supporting legacy hardware so this
> directly contravenes that principal and needlessly so.

I do get your point about supporting the legacy. I'm wondering if this
is still a deal breaker for Linux or not.

/Jarkko
