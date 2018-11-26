From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v17 18/23] platform/x86: Intel SGX driver
Date: Mon, 26 Nov 2018 13:51:45 -0800
Message-ID: <20181126215145.GC868@linux.intel.com>
References: <20181116010412.23967-19-jarkko.sakkinen@linux.intel.com>
 <CALCETrXctxfED1Dr-MuZxFnh5gzTyRL06hRJ_fQnNA8p2S4xEQ@mail.gmail.com>
 <20181119161917.GF13298@linux.intel.com>
 <CALCETrX+A4XaEMq3fJqmHUeeDHr_BdWh-Wk3ikXfY=L77BbaGA@mail.gmail.com>
 <20181120120442.GA22172@linux.intel.com>
 <20181122111253.GA31150@wind.enjellic.com>
 <CALCETrWJr-C6yK8NBCp=NbapwHOaBFphiDU9VKEtQ0NMRrdC2g@mail.gmail.com>
 <20181124172114.GB32210@linux.intel.com>
 <20181125145329.GA5777@linux.intel.com>
 <0669C300-02CB-4EA6-BF88-5C4B4DDAD4C7@amacapital.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <0669C300-02CB-4EA6-BF88-5C4B4DDAD4C7@amacapital.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Lutomirski <luto@amacapital.net>
Cc: Andy Lutomirski <luto@kernel.org>, "Dr. Greg Wettstein" <greg@enjellic.com>, X86 ML <x86@kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, linux-sgx@vger.kernel.org, Dave Hansen <dave.hansen@intel.com>, "Christopherson, Sean J" <sean.j.christopherson@intel.com>, nhorman@redhat.com, npmccallum@redhat.com, "Ayoun, Serge" <serge.ayoun@intel.com>, shay.katz-zamir@intel.com, haitao.huang@linux.intel.com, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, "Svahn, Kai" <kai.svahn@intel.com>, mark.shanahan@intel.com, Suresh Siddha <suresh.b.siddha@intel.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infr>
List-Id: platform-driver-x86.vger.kernel.org

On Sun, Nov 25, 2018 at 08:22:35AM -0800, Andy Lutomirski wrote:
> Agreed. What I’m proposing adds additional security if the kernel is
> *not* compromised.

And even if the kernel is compromised evil use will detected quicker
i.e. compromissed kernel is "better" than a kernel that allows to
use provisioning freely.

> There are other ways to accomplish it that might be better in some
> respects.  For example, there could be /dev/sgx and
> /dev/sgx_rights/provision.  The former exposes the whole sgx API,
> except that it doesn’t allow provisioning by default. The latter does
> nothing by itself. To run a provisioning enclave, you open both nodes,
> then do something like:
> 
> ioctl(sgx, SGX_IOC_ADD_RIGHT, sgx_provisioning);
> 
> This requires extra syscalls, but it doesn’t have the combinatorial
> explosion problem.

I like this design because it is extendable. I'm now also in the same
page why we need to protect provisioning in the first place. I would
slight restructure this as

/dev/sgx/control
/dev/sgx/attributes/provision

Looks cleaner and the root /dev directory is less polluted.

BTW, off-topic from this but should we remove ENCLAVE from IOC names as
they all concern enclaves anyway? Seems kind of redundant. I.e.

SGX_IOC_ENCLAVE_CREATE -> SGX_IOC_CREATE
SGX_IOC_ENCLAVE_ADD_PAGE -> SGX_IOC_ADD_PAGE
SGX_IOC_ENCLAVE_INIT -> SGX_IOC_INIT

/Jarkko
