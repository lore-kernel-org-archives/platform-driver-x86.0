From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v17 18/23] platform/x86: Intel SGX driver
Date: Mon, 26 Nov 2018 14:16:49 -0800
Message-ID: <20181126221649.GE868@linux.intel.com>
References: <20181120120442.GA22172@linux.intel.com>
 <20181122111253.GA31150@wind.enjellic.com>
 <CALCETrWJr-C6yK8NBCp=NbapwHOaBFphiDU9VKEtQ0NMRrdC2g@mail.gmail.com>
 <20181124172114.GB32210@linux.intel.com>
 <20181125145329.GA5777@linux.intel.com>
 <0669C300-02CB-4EA6-BF88-5C4B4DDAD4C7@amacapital.net>
 <20181125185524.GA23224@wind.enjellic.com>
 <D45BC005-5064-4C75-B486-4E43C454E2F6@amacapital.net>
 <94154ECB-3EF7-4A37-9057-0B84DBCE650E@amacapital.net>
 <20181126110038.GA27609@wind.enjellic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181126110038.GA27609@wind.enjellic.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Dr. Greg" <greg@enjellic.com>
Cc: Andy Lutomirski <luto@amacapital.net>, Andy Lutomirski <luto@kernel.org>, X86 ML <x86@kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, linux-sgx@vger.kernel.org, Dave Hansen <dave.hansen@intel.com>, "Christopherson, Sean J" <sean.j.christopherson@intel.com>, nhorman@redhat.com, npmccallum@redhat.com, "Ayoun, Serge" <serge.ayoun@intel.com>, shay.katz-zamir@intel.com, haitao.huang@linux.intel.com, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, "Svahn, Kai" <kai.svahn@intel.com>, mark.shanahan@intel.com, Suresh Siddha <suresh.b.siddha@intel.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infrade>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Nov 26, 2018 at 05:00:39AM -0600, Dr. Greg wrote:
> We will be interested in your comments as to why the proposal is
> insufficient in the real world of FLC.
> 
> I believe the proposed architecture can be defended as being effective
> in the real world, as it allows the root user to use cryptographic
> protections of access to the PROVISION bit and to enclave execution in
> general.  On FLC that is the strongest guarantee that can be
> delivered.
> 
> When we speak of 'unauthorized' users I believe we are speaking in the
> parlance of discretionary access controls which has a much wider TCB
> scope then the cryptographic model we are proposing.  The model we
> propose allows the platform owner (root) to effectively implement the
> same level of security over the PROVISION bit that current locked
> platforms have, in a free and open fashion of course.
> 
> We can certainly attempt to explain our position further.

I think kernel controlled provision would in all cases lower the
mitigations of thread scenarios (at least what you've presented so far)
assuming that a compromissed kernel could be detected fairly quickly,
wouldn't it?

Even without SGX, having a compromissed kernel, you can anyhow stealth
your malware in many ways.

/Jarkko
