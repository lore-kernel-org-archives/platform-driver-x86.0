From: "Dr. Greg Wettstein" <greg@wind.enjellic.com>
Subject: Re: [PATCH v6 00/11] Intel SGX Driver
Date: Thu, 4 Jan 2018 15:09:06 -0600
Message-ID: <201801042109.w04L961C032047@wind.enjellic.com>
References: <gregkh@linuxfoundation.org>
Reply-To: greg@enjellic.com
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
       "Re: [PATCH v6 00/11] Intel SGX Driver" (Jan  4,  3:27pm)
Sender: linux-doc-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Cedric Blancher <cedric.blancher@gmail.com>
Cc: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, platform-driver-x86@vger.kernel.org, x86@kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Borislav Petkov <bp@suse.de>, "David S. Miller" <davem@davemloft.net>, Grzegorz Andrejczuk <grzegorz.andrejczuk@intel.com>, Haim Cohen <haim.cohen@intel.com>, Ingo Molnar <mingo@kernel.org>, Janakarajan Natarajan <Janakarajan.Natarajan@amd.com>, Jim Mattson <jmattson@google.com>, Kan Liang <Kan.liang@intel.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Kyle Huey <me@kylehuey.com>, Len Brown <len.brown@intel.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, "open list:FILESYSTEMS (VFS and infrastructure)" <linux-fsdevel@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kerne>
List-Id: platform-driver-x86.vger.kernel.org

On Jan 4,  3:27pm, Greg Kroah-Hartman wrote:
} Subject: Re: [PATCH v6 00/11] Intel SGX Driver

Wild day, enjoyed by all I'm sure.

> On Thu, Jan 04, 2018 at 03:17:24PM +0100, Cedric Blancher wrote:
> > So how does this protect against the MELTDOWN attack (CVE-2017-5754)
> > and the MELTATOMBOMBA4 worm which uses this exploit?

> It has nothing to do with it at all, sorry.

Precision seems to be everything in these discussions.

Since SGX obviously does not mitigate micro-architectural state
probing it is not an effective general remediation against MELTDOWN.
Does your statement indicate there is solid documentation that
MELTDOWN can be used by a process of any privilege level to dump out
the unencrypted contents of an initialized enclave?

That would obviously be a big story as well.

> greg k-h

Have a good evening.

Greg

}-- End of excerpt from Greg Kroah-Hartman

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
