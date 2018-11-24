From: "Dr. Greg" <greg@enjellic.com>
Subject: Re: [PATCH v17 18/23] platform/x86: Intel SGX driver
Date: Sat, 24 Nov 2018 13:24:54 -0600
Message-ID: <20181124192454.GA12149@wind.enjellic.com>
References: <20181116010412.23967-1-jarkko.sakkinen@linux.intel.com> <20181116010412.23967-19-jarkko.sakkinen@linux.intel.com> <CALCETrXctxfED1Dr-MuZxFnh5gzTyRL06hRJ_fQnNA8p2S4xEQ@mail.gmail.com> <20181120111508.GA26127@wind.enjellic.com> <20181124161521.GB30310@linux.intel.com>
Reply-To: "Dr. Greg" <greg@enjellic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181124161521.GB30310@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: Andy Lutomirski <luto@amacapital.net>, X86 ML <x86@kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, linux-sgx@vger.kernel.org, Dave Hansen <dave.hansen@intel.com>, "Christopherson, Sean J" <sean.j.christopherson@intel.com>, nhorman@redhat.com, npmccallum@redhat.com, "Ayoun, Serge" <serge.ayoun@intel.com>, shay.katz-zamir@intel.com, haitao.huang@linux.intel.com, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, "Svahn, Kai" <kai.svahn@intel.com>, mark.shanahan@intel.com, Suresh Siddha <suresh.b.siddha@intel.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Darren Hart <dvhart@infradead.org>, andy@infradead.org, LKML <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Sat, Nov 24, 2018 at 08:15:21AM -0800, Jarkko Sakkinen wrote:

> On Tue, Nov 20, 2018 at 05:15:08AM -0600, Dr. Greg wrote:
> > Malware would not necessarily need the Intel attestation service.
> > Once access to the PROVISION bit is available, malware teams could
> > simply build their own attestation service.

> AFAIK not possible as they wouldn't have access to the root
> provisioning key. Can be confirmed from the SDM's key derivation
> table (41-56).

What provisioning and attestation is all about is establishing an
identity binding for a platform in question.  The standard Intel
service binds the identity of a platform to an EPID private key.

With access to the SGX_FLAGS_PROVISION_BIT an enclave can generate a
perpetual identity for a platform based on the identity modulus
signature (MRSIGNER) of the key that signs the signature structure of
the enclave.  Without access to the root provisioning key a security
quorum or group has to be implemented via a subscription or enrollment
model but that is arguably not much of an obstacle.

That is pretty much the way standard botware works now.

Without provisions for cryptographically secure authorization and
policy enforcement in the driver, we will be creating infrastructure
for a new generation of botware/malware whose mothership will know
that a participating platform is running with full confidentiality and
integrity protections.

> /Jarkko

Dr. Greg

As always,
Dr. G.W. Wettstein, Ph.D.   Enjellic Systems Development, LLC.
4206 N. 19th Ave.           Specializing in information infra-structure
Fargo, ND  58102            development.
PH: 701-281-1686
FAX: 701-281-3949           EMAIL: greg@enjellic.com
------------------------------------------------------------------------------
"Remember that when you take down the fishhouse you can't put
 the minnows back into the lake, so throw them out on the ice.
 Make sure you stomp on any of the live ones so they don't suffer."
                                -- Fritz Wettstein
                                   At the lake
