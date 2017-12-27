From: "Dr. Greg Wettstein" <greg@wind.enjellic.com>
Subject: Re: [PATCH v6 00/11] Intel SGX Driver
Date: Wed, 27 Dec 2017 04:30:50 -0600
Message-ID: <201712271030.vBRAUo3o027896@wind.enjellic.com>
References: <pavel@ucw.cz>
Reply-To: greg@enjellic.com
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: Pavel Machek <pavel@ucw.cz>
       "Re: [PATCH v6 00/11] Intel SGX Driver" (Dec 12,  3:07pm)
Sender: linux-doc-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, Borislav Petkov <bp@suse.de>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Grzegorz Andrejczuk <grzegorz.andrejczuk@intel.com>, Haim Cohen <haim.cohen@intel.com>, Ingo Molnar <mingo@kernel.org>, Janakarajan Natarajan <Janakarajan.Natarajan@amd.com>, Jim Mattson <jmattson@google.com>, Kan Liang <Kan.liang@intel.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Kyle Huey <me@kylehuey.com>, Len Brown <len.brown@intel.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, "open list:FILESYSTEMS (VFS and infrastructure)" <linux-fsdevel@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Paolo Bonzini <pbonzin>
List-Id: platform-driver-x86.vger.kernel.org

On Dec 12,  3:07pm, Pavel Machek wrote:
} Subject: Re: [PATCH v6 00/11] Intel SGX Driver

Good morning, I hope this note finds the holiday season going well for
everyone.  This note is a bit delayed due to the holidays, my
apologies.

Pretty wide swath on this e-mail but will include the copy list due to
the possible general interest and impact of these issues.  We have
done an independent implementation of Intel's platform software (PSW),
directed at the use of SGX on intelligent network endpoint devices, so
we have some experience with the issues under discussion.

> On Sat 2017-11-25 21:29:17, Jarkko Sakkinen wrote:
> > Intel(R) SGX is a set of CPU instructions that can be used by
> > applications to set aside private regions of code and data. The
> > code outside the enclave is disallowed to access the memory inside
> > the enclave by the CPU access control.  In a way you can think
> > that SGX provides inverted sandbox. It protects the application
> > from a malicious host.

> Would you list guarantees provided by SGX?

Obviously, confidentiality and integrity.  SGX was designed to address
an Iago threat model, a very difficult challenge to address in
reality.

On SGX capable platforms, the Memory Encryption Engine (MEE) is an
integrated component of the hardware MMU, as SGX is a virtual memory
play.  As a result, the executable code and data are encrypted in main
memory and only decrypted when the data is fed from memory onto the
hardware fetch queues.  Irregardless of anything else, this has
implications with respect to cold boot attacks, if an architect
chooses to worry about that threat modality.

In reality, we believe the guarantee that is most important is
integrity, given the issues below.

> For example, host can still observe timing of cachelines being
> accessed by "protected" app, right? Can it also introduce bit flips?

Timing attacks are the bane of SGX, just as they are throughout the
rest of the commodity architectures.  Jarkko cited Beecham's work,
which is a good reference.  Oakland's work on controlled side-channel
attacks is also a very good, and fundamental, read on the issues
involved.

Microsoft Research and Georgia Tech have a paper out discussing the
use of transactional memory to mitigate these.

I don't have the citation immediately available, but a bit-flip attack
has also been described on enclaves.  Due to the nature of the
architecture, they tend to crash the enclave so they are more in the
category of a denial-of-service attack, rather then a functional
confidentiality or integrity compromise.

At the end of the day, giving up complete observational and functional
control to an adversary is a difficult challenge to address.  There is
also a large difference between attacks that can be conducted in a
carefully controlled lab environment and what an adversary or malware
can implement in practice.

Platforms which require security assurances ultimately need a root of
trust.  That either comes from a TPM or a Trusted Execution
Environment like SGX.  Realistically, we think the future involves an
integration of both technologies.  The only other alternative is
perfect software and I think the jury has already weighed in on that.

The advantage of SGX over a TPM is that it is blindingly fast with
respect to performance.  The IMA community has been involved in a
debate over the list digest patches in order to overcome performance
issues with TPM based extension measurements.  We lifted most of the
IMA infrastructure into an SGX enclave and demonstrated significant
performance impacts as a result.

The bigger question, for community integration, is the availability of
hardware.  I see Jarkko's patches are based on the notion of having
flexible launch control available, ie. the ability to program the
relevant MSR's with the checksum of the identity modulus which is to
serve as the root of trust.  I'm not sure there is any hardware in the
wild that currently supports this, Jarkko comments?

Even with that, the question arises as to what is going to be trusted
to program those registers.  The obvious candidate for this is
TXT/tboot which underscores a future involving the integration of
these technologies.

Unfortunately, in the security field it is way more fun, and seemingly
advantageous from a reputational perspective, to break things then to
build solutions.... :-)(

> Pavel

I hope the above clarifications are helpful.

Best wishes for a pleasant holiday weekend to everyone.

Dr. Greg

}-- End of excerpt from Pavel Machek

As always,
Dr. G.W. Wettstein, Ph.D.   Enjellic Systems Development, LLC.
4206 N. 19th Ave.           Specializing in information infra-structure
Fargo, ND  58102            development.
PH: 701-281-1686
FAX: 701-281-3949           EMAIL: greg@enjellic.com
------------------------------------------------------------------------------
"I suppose that could could happen but he wouldn't know a Galois Field
 if it kicked him in the nuts."
                                -- Anonymous mathematician
                                   Resurrection.
