From: Andy Lutomirski <luto@amacapital.net>
Subject: Re: [PATCH v17 18/23] platform/x86: Intel SGX driver
Date: Sun, 25 Nov 2018 08:22:35 -0800
Message-ID: <0669C300-02CB-4EA6-BF88-5C4B4DDAD4C7@amacapital.net>
References: <20181116010412.23967-1-jarkko.sakkinen@linux.intel.com> <20181116010412.23967-19-jarkko.sakkinen@linux.intel.com> <CALCETrXctxfED1Dr-MuZxFnh5gzTyRL06hRJ_fQnNA8p2S4xEQ@mail.gmail.com> <20181119161917.GF13298@linux.intel.com> <CALCETrX+A4XaEMq3fJqmHUeeDHr_BdWh-Wk3ikXfY=L77BbaGA@mail.gmail.com> <20181120120442.GA22172@linux.intel.com> <20181122111253.GA31150@wind.enjellic.com> <CALCETrWJr-C6yK8NBCp=NbapwHOaBFphiDU9VKEtQ0NMRrdC2g@mail.gmail.com> <20181124172114.GB32210@linux.intel.com> <20181125145329.GA5777@linux.intel.com>
Mime-Version: 1.0 (1.0)
Content-Type: text/plain;
        charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181125145329.GA5777@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: Andy Lutomirski <luto@kernel.org>, "Dr. Greg Wettstein" <greg@enjellic.com>, X86 ML <x86@kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, linux-sgx@vger.kernel.org, Dave Hansen <dave.hansen@intel.com>, "Christopherson, Sean J" <sean.j.christopherson@intel.com>, nhorman@redhat.com, npmccallum@redhat.com, "Ayoun, Serge" <serge.ayoun@intel.com>, shay.katz-zamir@intel.com, haitao.huang@linux.intel.com, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, "Svahn, Kai" <kai.svahn@intel.com>, mark.shanahan@intel.com, Suresh Siddha <suresh.b.siddha@intel.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infr>
List-Id: platform-driver-x86.vger.kernel.org


>> On Nov 25, 2018, at 6:53 AM, Jarkko Sakkinen <jarkko.sakkinen@linux.intel=
.com> wrote:
>>=20
>> On Sat, Nov 24, 2018 at 09:21:14AM -0800, Jarkko Sakkinen wrote:
>> On Thu, Nov 22, 2018 at 07:21:08AM -0800, Andy Lutomirski wrote:
>>>> At a high level, addressing these issues is straight forward.  First,
>>>> the driver needs to support authorization equivalent to that which is
>>>> implemented in the current Intel Launch Enclave, ie. control over the
>>>> SGX_FLAGS_PROVISION_KEY attribute.
>>>=20
>>> I agree, hence my email :)
>>=20
>> Started to scratch my head that is it really an issue that any enclave
>> can provision in the end?
>>=20
>> Direct quote from your first response:
>>=20
>> "In particular, the ability to run enclaves with the provisioning bit set=

>> is somewhat sensitive, since it effectively allows access to a stable
>> fingerprint of the system."
>>=20
>> As can be seen from the key derivation table this does not exactly hold
>> so you should refine your original argument before we can consider any
>> type of change.
>>=20
>> I just don't see what it is so wrong for any enclave to be able to tell
>> that it really is an enclave.
>=20
> I mean I can understand why Greg wants LE although I don't understand
> what benefit does it bring to anyone to lock in for enclave to allow
> to identify itself.
>=20
> What you are proposing does not really bring any additional security if
> we consider a threat model where the kernel is an adversary but it makes
> the software stack more clanky to use.

Agreed. What I=E2=80=99m proposing adds additional security if the kernel is=
 *not* compromised.

There are other ways to accomplish it that might be better in some respects.=
  For example, there could be /dev/sgx and /dev/sgx_rights/provision.  The f=
ormer exposes the whole sgx API, except that it doesn=E2=80=99t allow provis=
ioning by default. The latter does nothing by itself. To run a provisioning e=
nclave, you open both nodes, then do something like:

ioctl(sgx, SGX_IOC_ADD_RIGHT, sgx_provisioning);

This requires extra syscalls, but it doesn=E2=80=99t have the combinatorial e=
xplosion problem.=
