From: "Dr. Greg Wettstein" <greg@wind.enjellic.com>
Subject: Re: [PATCH v6 00/11] Intel SGX Driver
Date: Tue, 9 Jan 2018 15:50:23 -0600
Message-ID: <201801092150.w09LoNtB017301@wind.enjellic.com>
References: <jarkko.sakkinen@linux.intel.com>
Reply-To: greg@enjellic.com
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
       "Re: [PATCH v6 00/11] Intel SGX Driver" (Jan  9,  4:25pm)
Sender: linux-fsdevel-owner@vger.kernel.org
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: Pavel Machek <pavel@ucw.cz>, platform-driver-x86@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, Borislav Petkov <bp@suse.de>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Grzegorz Andrejczuk <grzegorz.andrejczuk@intel.com>, Haim Cohen <haim.cohen@intel.com>, Ingo Molnar <mingo@kernel.org>, Janakarajan Natarajan <Janakarajan.Natarajan@amd.com>, Jim Mattson <jmattson@google.com>, Kan Liang <Kan.liang@intel.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Kyle Huey <me@kylehuey.com>, Len Brown <len.brown@intel.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, "open list:FILESYSTEMS (VFS and infrastructure)" <linux-fsdevel@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel>
List-Id: platform-driver-x86.vger.kernel.org

On Jan 9,  4:25pm, Jarkko Sakkinen wrote:
} Subject: Re: [PATCH v6 00/11] Intel SGX Driver

Good afternoon I hope the week is going well for everyone.

In order to minimize spamming mailboxes with two mails I'm
incorporating a reply to Jarkko's second e-mail on the Memory
Encryption Engine below as well, since the issues are all related.

> On Thu, Jan 04, 2018 at 03:06:43AM -0600, Dr. Greg Wettstein wrote:
> > If we are talking about the issues motivating the KPTI work I don't
> > have any useful information beyond what is raging through the industry
> > right now.
> > 
> > With respect to SGX, the issues giving rise to KPTI are characteristic
> > of what this technology is designed to address.  The technical 'news'
> > sites, which are even more of an abomination then usual with this
> > issue, are talking about privileged information such as credentials,
> > passwords et.al being leaked by this vulnerability.
> > 
> > Data committed to enclaves are only accessible by the enclave, even
> > the kernel, by definition, can't access the memory.  Given current
> > events that is an arguably useful behavior.

> Exactly. You could think adversary using meltdown leak utilizing
> malware as having same capabilities as peripheral connected to a
> bus, which we can defend against with SGX.

I believe caution needs to be applied to these statements

Since we design high assurance computing devices that use SGX to
protect our autonomous introspection engine, we obviously have very
significant concerns regarding whether the SGX security guarantees are
still operative in the face of these micro-architectural probing
attacks.  Absent official guidance, we have been pouring over the SGX
architectural documents for a week in order to develop risk guidance.

Based on that review, our conclusion was that there was nothing
inherent in the SGX architectural model that implies protection
against confidentiality losses through micro-architectural side
channel inspection.  Our conclusion was reinforced by a group in
London which has reportedly demonstrated the effectiveness of the
conditional branch misprediction exploit against data processed inside
of an enclave.

We have not yet verified the exploit in our lab, but given our
architectural review there would seem to be no reason why it shouldn't
work.  I posted a note to the SGX developer's forum early this morning
with a summary of our analysis but haven't received any responses.

To 'wit in summary.

In this attack scenario, the potential lack of confidentiality inside
of an enclave is the same as if the code was running in unprotected
memory space.  The MM{U,E} infrastructure is servicing micro-op
resource requests for instructions inside of an enclave, just as it
would normally do in untrusted space.  As a result, code running in an
enclave induces cache state changes which can be externally probed,
ie. the effects of a forced branch mispredict on cache state are the
same if the code executes inside of an enclave as if it were in
untrusted memory.

As I noted in my post to the SGX forum, this would be really
interesting if it could be done by an arbitrary process against an
enclave.  As the sample code demonstrates however, the exploit binary
has to be able to invoke at last two ECALL's (invocation of functions
in trusted space) in order to carry out the attack.  This is somewhat
analogous to an exploit where a process is able to attack its own
memory map.

With respect to the other mail:

> Everything going out of L1 gets encrypted. This is done to defend
> against peripheral like adversaries and should work also against
> meltdown.

I don't believe this is an architecturally correct assertion.  The
encryption/decryption occurs at the 'bottom' of the cache heirarchy.

Based on Shay Gueron's paper, which describes the Memory Encryption
Engine (MEE) and its security characteristics and proofs, the MEE acts
as an extension of the memory controller and mediates CACHE<->DRAM
traffic to the Enclave Page Cache (EPC), ie, the protected data
region.  It is responsible for encrypting and decrypting page data as
well as the generation of the tags which are used to populate the
Merkle integrity tree.

As I mentioned in a previous mail, the MEE is responsible for emitting
the 'drop and lock' verification signal which locks the memory
controller if a memory integrity check fails.  This is to support a
fundamental design tenant of the architecture that no unverified data
reaches the caches.

Based on this I believe all of the data in the caches is in plaintext,
not just from L1 upward.  So by inference, speculative execution is
able to induce the population of the caches with unencrypted data and
act on those results.  If this were not the case it would be difficult
to understand how the demonstrated branch mispredict attack could be
successful.

With respect to protecting access to memory, the SGX modified Page
Miss Handler (PMH) is designed to deny the final population of a TLB
slot if the page is from an 'untrusted' virtual<->physical mapping.
This occurs even later then the standard page access controls and it
was the 'lateness' of those checks, in comparison to the actual
population of the caches, which proved to be the particularly
problematic issue in Meltdown.

As a result, we remain very uneasy with respect to the confidentiality
guarantees that are available in the face of these attacks.  Luckily
we depend on the architecture for integrity.

> /Jarkko

We will try and see if we can get some engineering time to reproducing
the branch mispredict exploit that was published and report back.

Have a good evening.

Dr. Greg

}-- End of excerpt from Jarkko Sakkinen

As always,
Dr. G.W. Wettstein, Ph.D.   Enjellic Systems Development, LLC.
4206 N. 19th Ave.           Specializing in information infra-structure
Fargo, ND  58102            development.
PH: 701-281-1686
FAX: 701-281-3949           EMAIL: greg@enjellic.com
------------------------------------------------------------------------------
"If you get to thinkin' you're a person of some influence, try
 orderin' somebody else's dog around."
                                -- Cowboy Wisdom
