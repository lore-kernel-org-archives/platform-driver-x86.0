From: "Dr. Greg Wettstein" <greg@wind.enjellic.com>
Subject: Re: [PATCH v6 00/11] Intel SGX Driver
Date: Thu, 4 Jan 2018 03:06:43 -0600
Message-ID: <201801040906.w0496h39025733@wind.enjellic.com>
References: <pavel@ucw.cz>
Reply-To: greg@enjellic.com
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: Pavel Machek <pavel@ucw.cz>
       "Re: [PATCH v6 00/11] Intel SGX Driver" (Jan  3, 10:48am)
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, platform-driver-x86@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, Borislav Petkov <bp@suse.de>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Grzegorz Andrejczuk <grzegorz.andrejczuk@intel.com>, Haim Cohen <haim.cohen@intel.com>, Ingo Molnar <mingo@kernel.org>, Janakarajan Natarajan <Janakarajan.Natarajan@amd.com>, Jim Mattson <jmattson@google.com>, Kan Liang <Kan.liang@intel.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Kyle Huey <me@kylehuey.com>, Len Brown <len.brown@intel.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, "open list:FILESYSTEMS (VFS and infrastructure)" <linux-fsdevel@vger.kernel.org>, Mauro
List-Id: platform-driver-x86.vger.kernel.org

On Jan 3, 10:48am, Pavel Machek wrote:
} Subject: Re: [PATCH v6 00/11] Intel SGX Driver

> Hi!

Good morning.

> :-). Stuff proceeds as usual. Too bad it is raining outside, instead
> of snowing.

-19C here, so we have snow... :-)

> > > So ... even with SGX, host can generate bitflips in the enclave,
> > > right?

> > Correct.

> I'd say that you can't generate bitflips because if you do hardware
> will kill the enclave. This seems to be significant difference from
> AMD "secure" memory encryption.

SGX is an entirely different class of technology compared to AME SME
or the Intel equivalent TME (Total Memory Encryption).  Both of these
are best described as the notion of applying the concept of whole disk
encryption to memory.

There are lots of well understood issues surrounding this approach,
whether the target is memory pages or disk sectors.  I think the issue
comes down to the fact that there is a desire to enable a BIOS option
and become 'secure', unfortunately the world is not that simple.

> > Forcing a bitflip in enclave memory causes the next page fetch
> > containing the bitflipped location to fail its integrity check.
> > Since this technically shouldn't be possible, this situation was
> > classified as a hardware failure which is handled by the processor
> > locking its execution state, thus taking the machine down.

> So you can't really do bitflips on the SGX protected memory, because
> MM{E,U} hardware will catch that and kill machine if you try?

Correct.

Which obviously has issues in a multi-tenant cloud environment, but
again, it comes down to risk management.  Killing a machine is
problematic, a massive data compromise isn't much fun either.

> So SGX protected memory is not swappable?

The architecture provides support for swapping enclave pages and the
Linux driver supports it.

The swapped pages retain their confidentiality and integrity
protections.

> > It would seem to be a misfeature for the self-protection mechanism to
> > not generate some type of trappable fault rather then generating a
> > processor lockup but hindsight is always 20/20.  Philosophically this
> > is a good example of security risk managment.  Locking a machine is
> > obviously problematic in a cloud service environment, but it has to be
> > taken in the perspective of whether or not it would be preferable to
> > have a successful privilege escalation attack which could result in
> > exfiltration of sensitive data.

> Ok, right, it should fault. They can fix it in new version?

Good question and something only Intel can answer.

A large part of SGX is implemented in microcode, in part due to the
complexity of the technologies involved, notably the group signing
(EPID) implementation.

Beyond that, there was a specific acknowledgement that this was
security sensitive code and may need an upgrade, hence the microcode
implementation.

Since the drop and lock 'feature' is closely tied to the MM{E,U}
implementation, the question would be whether or not this behavior
could be changed with updated firmware.  If it was easy to change the
behavior of the MMU with microcode the industry would be less frantic
right now... :-)

If it would be possible to change the drop and lock response it would
arguably improve the utility of the technology in certain
environments.  SGX2 would have been a great time for that.

> > Arguably not as much fun as what appears to be pending, given what
> > appears to be the difficulty of some Intel processors to deal with
> > page faults induced by speculative memory references... :-)

> Do you have more info on that? Will they actually leak information,
> or is it just good for rowhammering the kernel memory?

If we are talking about the issues motivating the KPTI work I don't
have any useful information beyond what is raging through the industry
right now.

With respect to SGX, the issues giving rise to KPTI are characteristic
of what this technology is designed to address.  The technical 'news'
sites, which are even more of an abomination then usual with this
issue, are talking about privileged information such as credentials,
passwords et.al being leaked by this vulnerability.

Data committed to enclaves are only accessible by the enclave, even
the kernel, by definition, can't access the memory.  Given current
events that is an arguably useful behavior.

> Best regards,
> 									Pavel

Stay dry.

Have a good day.

Greg

}-- End of excerpt from Pavel Machek

As always,
Dr. G.W. Wettstein, Ph.D.   Enjellic Systems Development, LLC.
4206 N. 19th Ave.           Specializing in information infra-structure
Fargo, ND  58102            development.
PH: 701-281-1686
FAX: 701-281-3949           EMAIL: greg@enjellic.com
------------------------------------------------------------------------------
"Lots of folks confuse bad management with destiny."
                                -- Kin Hubbard

-- 
