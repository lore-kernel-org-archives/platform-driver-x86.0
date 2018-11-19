From: Andy Lutomirski <luto@amacapital.net>
Subject: Re: [PATCH v17 18/23] platform/x86: Intel SGX driver
Date: Mon, 19 Nov 2018 11:18:54 -0700
Message-ID: <2804DD93-E67B-4E06-800D-82A2EA21FCC9@amacapital.net>
References: <20181116010412.23967-1-jarkko.sakkinen@linux.intel.com> <20181116010412.23967-19-jarkko.sakkinen@linux.intel.com> <20181119150655.GA11843@linux.intel.com> <e8e640be-6f9f-0835-0578-48f140ac68f9@fortanix.com> <20181119171934.GA16252@linux.intel.com>
Mime-Version: 1.0 (1.0)
Content-Type: text/plain;
        charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181119171934.GA16252@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: Jethro Beekman <jethro@fortanix.com>, "x86@kernel.org" <x86@kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-sgx@vger.kernel.org" <linux-sgx@vger.kernel.org>, "dave.hansen@intel.com" <dave.hansen@intel.com>, "sean.j.christopherson@intel.com" <sean.j.christopherson@intel.com>, "nhorman@redhat.com" <nhorman@redhat.com>, "npmccallum@redhat.com" <npmccallum@redhat.com>, "serge.ayoun@intel.com" <serge.ayoun@intel.com>, "shay.katz-zamir@intel.com" <shay.katz-zamir@intel.com>, "haitao.huang@linux.intel.com" <haitao.huang@linux.intel.com>, "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "kai.svahn@intel.com" <kai.svahn@intel.com>, mark.shanahan@inte
List-Id: platform-driver-x86.vger.kernel.org



> On Nov 19, 2018, at 10:19 AM, Jarkko Sakkinen <jarkko.sakkinen@linux.intel=
.com> wrote:
>=20
>> On Mon, Nov 19, 2018 at 04:22:54PM +0000, Jethro Beekman wrote:
>>> On 2018-11-19 20:36, Jarkko Sakkinen wrote:
>>> Question: should be dissolve the driver completely and move this code to=

>>> arch/x86/kernel/cpu/sgx/ (and rename intel_sgx.c as main.c)? Swapping
>>> patch removes the possibility to compile this as a module anyway.
>>=20
>> No. We should keep the capability to build this as a module for other use=
rs
>> of SGX. What is the swapping patch and why doesn't allow building as a
>> module?
>=20
> In some earlier version of the patch set the request was to remove the
> callback interface to the driver so now core does direct calls to the
> swapping operations.
>=20
>=20

Once static_call lands, this will be a great use for it.=
