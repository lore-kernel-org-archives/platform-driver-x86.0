From: Andy Lutomirski <luto@amacapital.net>
Subject: Re: [PATCH v17 18/23] platform/x86: Intel SGX driver
Date: Tue, 27 Nov 2018 09:55:45 -0800
Message-ID: <C11C9312-65BC-460A-8F9F-608E101AE5C1@amacapital.net>
References: <CALCETrX+A4XaEMq3fJqmHUeeDHr_BdWh-Wk3ikXfY=L77BbaGA@mail.gmail.com> <20181120120442.GA22172@linux.intel.com> <20181122111253.GA31150@wind.enjellic.com> <CALCETrWJr-C6yK8NBCp=NbapwHOaBFphiDU9VKEtQ0NMRrdC2g@mail.gmail.com> <20181124172114.GB32210@linux.intel.com> <20181125145329.GA5777@linux.intel.com> <0669C300-02CB-4EA6-BF88-5C4B4DDAD4C7@amacapital.net> <20181126215145.GC868@linux.intel.com> <20181126230436.GA6737@linux.intel.com> <20181127085533.GA12247@wind.enjellic.com> <20181127164129.GB4170@linux.intel.com>
Mime-Version: 1.0 (1.0)
Content-Type: text/plain;
        charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181127164129.GB4170@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: "Dr. Greg" <greg@enjellic.com>, Andy Lutomirski <luto@kernel.org>, X86 ML <x86@kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, linux-sgx@vger.kernel.org, Dave Hansen <dave.hansen@intel.com>, "Christopherson, Sean J" <sean.j.christopherson@intel.com>, nhorman@redhat.com, npmccallum@redhat.com, "Ayoun, Serge" <serge.ayoun@intel.com>, shay.katz-zamir@intel.com, haitao.huang@linux.intel.com, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, "Svahn, Kai" <kai.svahn@intel.com>, mark.shanahan@intel.com, Suresh Siddha <suresh.b.siddha@intel.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org



> On Nov 27, 2018, at 8:41 AM, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.=
com> wrote:
>=20
>> On Tue, Nov 27, 2018 at 02:55:33AM -0600, Dr. Greg wrote:
>> Since the thread has become a bit divergent I wanted to note that we
>> have offered a proposal for a general policy management framework
>> based on MRSIGNER values.  This framework is consistent with the SGX
>> security model, ie. cryptographic rather then DAC based policy
>> controls.  This framework also allows a much more flexible policy
>> implementation that doesn't result in combinatoric issues.
>>=20
>> Our framework also allows the preservation of the current ABI which
>> allows an EINITTOKEN to be passed in from userspace.  The framework
>> also supports the ability to specify that only a kernel based launch
>> enclave (LE) should be available if the platform owner or distribution
>> should desire to implement such a model.
>>=20
>> The policy management framework is straight forward.  Three linked
>> lists or their equivalent which are populated through /sysfs
>> pseudo-files or equivalent plumbing.  Each list is populated with
>> MRSIGNER values for signing keys that are allowed to initialize
>> enclaves under three separate conditions.
>>=20
>> 1.) General enclaves without special attribute bits.
>>=20
>> 2.) Enclaves with the SGX_FLAGS_PROVISION_KEY attribute set. - i.e.,
>> 'Provisioning Enclaves'.
>>=20
>> 3.) Enclaves with the SGX_FLAGS_LICENSE_KEY attribute set - i.e., 'Launch=

>> Enclaves'.
>>=20
>> An all-null MRSIGNER value serves as a 'sealing' value that locks a
>> list from any further modifications.
>>=20
>> This architecture allows platform policies to be specified and then
>> sealed at early boot by the root user.  At that point cryptographic
>> policy controls are in place rather then DAC based controls, the
>> latter of which have perpetual security liabilities in addition to the
>> useability constraints inherent in a DAC or device node model.
>>=20
>> We have developed an independent implementation of the PSW and
>> arguably have as much experience with issues surrounding how to
>> interact with the device driver as anyone.  We have spent a lot of
>> time thinking about these issues and the above framework provides the
>> most flexible architecture available.
>=20
> Sounds like a lot bloat and policy added to the kernel whereas with
> Andy's proposal you can implement logic to a daemon and provide only
> mechanism to do it.
>=20
>=20

Well, almost. We=E2=80=99d need SGX_IOC_FREEZE_MR{ENCLAVE,SIGNER} or similar=
.  Or maybe the daemon could handle the entire loading process.  But this ca=
n wait until after the main driver is upstream.

This does lead to a question: enclaves are kind-of-sort-of mapped into a giv=
en address space. What happens if you issue the various ioctls in the contex=
t of a different mm?  For that matter, can two processes mmap the same encla=
ve?=
