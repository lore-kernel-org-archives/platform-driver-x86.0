From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v6 00/11] Intel SGX Driver
Date: Tue, 9 Jan 2018 16:25:06 +0200
Message-ID: <20180109142506.u3mpwz6snmtitxp6@linux.intel.com>
References: <pavel@ucw.cz>
 <201801040906.w0496h39025733@wind.enjellic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201801040906.w0496h39025733@wind.enjellic.com>
Sender: linux-doc-owner@vger.kernel.org
To: greg@enjellic.com
Cc: Pavel Machek <pavel@ucw.cz>, platform-driver-x86@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, Borislav Petkov <bp@suse.de>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Grzegorz Andrejczuk <grzegorz.andrejczuk@intel.com>, Haim Cohen <haim.cohen@intel.com>, Ingo Molnar <mingo@kernel.org>, Janakarajan Natarajan <Janakarajan.Natarajan@amd.com>, Jim Mattson <jmattson@google.com>, Kan Liang <Kan.liang@intel.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Kyle Huey <me@kylehuey.com>, Len Brown <len.brown@intel.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, "open list:FILESYSTEMS (VFS and infrastructure)" <linux-fsdevel@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Jan 04, 2018 at 03:06:43AM -0600, Dr. Greg Wettstein wrote:
> If we are talking about the issues motivating the KPTI work I don't
> have any useful information beyond what is raging through the industry
> right now.
> 
> With respect to SGX, the issues giving rise to KPTI are characteristic
> of what this technology is designed to address.  The technical 'news'
> sites, which are even more of an abomination then usual with this
> issue, are talking about privileged information such as credentials,
> passwords et.al being leaked by this vulnerability.
> 
> Data committed to enclaves are only accessible by the enclave, even
> the kernel, by definition, can't access the memory.  Given current
> events that is an arguably useful behavior.

Exactly. You could think adversary using meltdown leak utilizing malware
as having same capabilities as peripheral connected to a bus, which we
can defend against with SGX.

/Jarkko
