From: "Dr. Greg Wettstein" <greg@wind.enjellic.com>
Subject: Re: [PATCH v6 00/11] Intel SGX Driver
Date: Tue, 2 Jan 2018 18:59:26 -0600
Message-ID: <201801030059.w030xQGD011342@wind.enjellic.com>
References: <pavel@ucw.cz>
Reply-To: greg@enjellic.com
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: Pavel Machek <pavel@ucw.cz>
       "Re: [PATCH v6 00/11] Intel SGX Driver" (Dec 27,  9:46pm)
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, platform-driver-x86@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, Borislav Petkov <bp@suse.de>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Grzegorz Andrejczuk <grzegorz.andrejczuk@intel.com>, Haim Cohen <haim.cohen@intel.com>, Ingo Molnar <mingo@kernel.org>, Janakarajan Natarajan <Janakarajan.Natarajan@amd.com>, Jim Mattson <jmattson@google.com>, Kan Liang <Kan.liang@intel.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Kyle Huey <me@kylehuey.com>, Len Brown <len.brown@intel.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, "open list:FILESYSTEMS (VFS and infrastructure)" <linux-fsdevel@vger.kernel.org>, Mauro
List-Id: platform-driver-x86.vger.kernel.org

On Dec 27,  9:46pm, Pavel Machek wrote:
} Subject: Re: [PATCH v6 00/11] Intel SGX Driver

> Hi!

Good evening Pavel et.al., I hope the New Year has started well for
everyone.

> > > Would you list guarantees provided by SGX?
> >
> > Obviously, confidentiality and integrity.  SGX was designed to address
> > an Iago threat model, a very difficult challenge to address in
> > reality.

> Do you have link on "Iago threat model"?

https://cseweb.ucsd.edu/~hovav/dist/iago.pdf

> > I don't have the citation immediately available, but a bit-flip attack
> > has also been described on enclaves.  Due to the nature of the
> > architecture, they tend to crash the enclave so they are more in the
> > category of a denial-of-service attack, rather then a functional
> > confidentiality or integrity compromise.

> So ... even with SGX, host can generate bitflips in the enclave,
> right?

Correct.

Here is the reference I was trying to recall in my last e-mail:

https://sslab.gtisc.gatech.edu/assets/papers/2017/jang:sgx-bomb.pdf

> People usually assume that bitflip will lead "only" to
> denial-of-service, but rowhammer work shows that even "random" bit
> flips easily lead to priviledge escalation on javascript virtual
> machines, and in similar way you can get root if you have user and
> bit flips happen.
>
> So... I believe we should assume compromise is possible, not just
> denial-of-service.

Prudence always dictates that one assumes the worst.  In this case
however, the bitflip attacks against SGX enclaves are very definitely
in the denial-of-service category.  The attack is designed to trigger
a hardware self-protection feature on the processor.

Each page of memory which is initialized into an enclave has a
metadata block associated with it which contains the integrity state
of that page of memory.  The MM{E,U} hardware on an SGX capable
platform checks this integrity data on each page fetch request arising
from addresses/pages inside of an enclave.

Forcing a bitflip in enclave memory causes the next page fetch
containing the bitflipped location to fail its integrity check.  Since
this technically shouldn't be possible, this situation was classified
as a hardware failure which is handled by the processor locking its
execution state, thus taking the machine down.

It would seem to be a misfeature for the self-protection mechanism to
not generate some type of trappable fault rather then generating a
processor lockup but hindsight is always 20/20.  Philosophically this
is a good example of security risk managment.  Locking a machine is
obviously problematic in a cloud service environment, but it has to be
taken in the perspective of whether or not it would be preferable to
have a successful privilege escalation attack which could result in
exfiltration of sensitive data.

Philosophically we take the approach that for high security assurance
environments it is virtually impossible to allow any untrusted code to
run on a platform.  Which is why we focus on autonomous introspection
for these environments.

> > Unfortunately, in the security field it is way more fun, and
> > seemingly advantageous from a reputational perspective, to break
> > things then to build solutions.... :-)(

> Well, yes :-). And I believe someone is going to have fun with SGX
> ;-).
> 									Pavel

Arguably not as much fun as what appears to be pending, given what
appears to be the difficulty of some Intel processors to deal with
page faults induced by speculative memory references... :-)

Best wishes for a productive New Year.

Dr. Greg

}-- End of excerpt from Pavel Machek

As always,
Dr. G.W. Wettstein, Ph.D.   Enjellic Systems Development, LLC.
4206 N. 19th Ave.           Specializing in information infra-structure
Fargo, ND  58102            development.
PH: 701-281-1686
FAX: 701-281-3949           EMAIL: greg@enjellic.com
------------------------------------------------------------------------------
"It is difficult to produce a television documentary that is both
 incisive and probing when every twelve minutes one is interrupted by
 twelve dancing rabbits singing about toilet paper."
                                -- Rod Serling
