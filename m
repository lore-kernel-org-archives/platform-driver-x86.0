From: Andy Lutomirski <luto@amacapital.net>
Subject: Re: [PATCH v17 18/23] platform/x86: Intel SGX driver
Date: Mon, 19 Nov 2018 08:59:24 -0800
Message-ID: <CALCETrX+A4XaEMq3fJqmHUeeDHr_BdWh-Wk3ikXfY=L77BbaGA@mail.gmail.com>
References: <20181116010412.23967-1-jarkko.sakkinen@linux.intel.com>
 <20181116010412.23967-19-jarkko.sakkinen@linux.intel.com> <CALCETrXctxfED1Dr-MuZxFnh5gzTyRL06hRJ_fQnNA8p2S4xEQ@mail.gmail.com>
 <20181119161917.GF13298@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181119161917.GF13298@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: X86 ML <x86@kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, linux-sgx@vger.kernel.org, Dave Hansen <dave.hansen@intel.com>, "Christopherson, Sean J" <sean.j.christopherson@intel.com>, nhorman@redhat.com, npmccallum@redhat.com, "Ayoun, Serge" <serge.ayoun@intel.com>, shay.katz-zamir@intel.com, haitao.huang@linux.intel.com, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, "Svahn, Kai" <kai.svahn@intel.com>, mark.shanahan@intel.com, Suresh Siddha <suresh.b.siddha@intel.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Darren Hart <dvhart@infradead.org>, andy@infradead.org, LKML <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Nov 19, 2018 at 8:19 AM Jarkko Sakkinen
<jarkko.sakkinen@linux.intel.com> wrote:
>
> On Mon, Nov 19, 2018 at 07:29:25AM -0800, Andy Lutomirski wrote:
> > On Thu, Nov 15, 2018 at 5:08 PM Jarkko Sakkinen
> > <jarkko.sakkinen@linux.intel.com> wrote:
> > >
> > > Intel Software Guard eXtensions (SGX) is a set of CPU instructions that
> > > can be used by applications to set aside private regions of code and
> > > data. The code outside the enclave is disallowed to access the memory
> > > inside the enclave by the CPU access control.
> > >
> > > SGX driver provides a ioctl API for loading and initializing enclaves.
> > > Address range for enclaves is reserved with mmap() and they are
> > > destroyed with munmap(). Enclave construction, measurement and
> > > initialization is done with the provided the ioctl API.
> > >
> >
> > I brought this up a while back, and I think I should re-ask it now
> > that this driver is getting close to ready:
> >
> > As it stands, there's just one SGX character device, and I imagine
> > that it'll be available to unprivileged applications.  I'm concerned
> > that this isn't quite what we want.  I certainly think that everyone,
> > or at least almost everyone, ought to be able to run normal enclaves.
> > But I think that we should consider restricting who can run specially
> > privileged enclaves.  In particular, the ability to run enclaves with
> > the provisioning bit set is somewhat sensitive, since it effectively
> > allows access to a stable fingerprint of the system.  Before flexible
> > LC, this wasn't such a big deal, since only Intel's provisioning
> > enclave could see the key, and Intel's enclave has some degree of
> > control of what is done with the key.  With flex LC, this protection
> > is lost.
> >
> > But this is maybe more of a big deal than just access to a stable
> > fingerprint.  The ability to provision a remote attestation protocol
> > is a key part of running SGX malware, and SGX malware is surely going
> > to exist some day.  (Sure, Intel will try to block access to the
> > actual attestation service for malware, but I doubt that Intel will be
> > able to fully defend it.)
> >
> > So I propose that there be a few device nodes.  Maybe
> > /dev/sgx/unprivilegd and /dev/sgx/provisioning?  The default mode of
> > the latter could be 0600.  If you've opened the unprivileged node, you
> > can only run enclaves without any special permission bits set.
>
> What would the use case for unprivileged i.e. this configuration would
> mean depending on permissions?

Everything except the quoting/provisioning code would use the unprivileged node.

>
> There would be three types of users:
>
> 1. Ones that have access to neither of the devices.
> 2. Ones that have access to unprivileged. Who are these?

Either 0666 (world) or an sgx group.

> 3. Ones that have access to provisioning.

Root only.

The idea here is that, under normal circumstances, provisioning only
runs once, or at least only runs rarely.  So, rather than the SDK
running provisioning whenever it feels like doing so (which is the
current behavior, I imagine, although I haven't looked), there would
be a privileged program, perhaps a systemd unit that runs when needed,
that produces the key material needed for remote attestation, and
non-root users that need attestation would get the keying material
from the provisioning service.  And the provisioning service could
implement its own policy.  Ideally, the service wouldn't give the
sealed keys to users at all but would, instead, just provide the
entire attestation service over a UNIX socket, which would make
provisioning capabilities revocable.

Does this make sense?

--Andy
