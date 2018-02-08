From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v6 00/11] Intel SGX Driver
Date: Thu, 8 Feb 2018 15:48:28 +0200
Message-ID: <20180208134828.hkrslcoa5xzznkj3@linux.intel.com>
References: <20171125193132.24321-1-jarkko.sakkinen@linux.intel.com>
 <CALXu0Uf6qOg4-4aEfepD9hxXsbUtayndNC-nWc_Ymc5psCdEwQ@mail.gmail.com>
 <20180109142730.ndhxmw6p22kae5fv@linux.intel.com>
 <20180208084653.GA4595@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180208084653.GA4595@amd>
Sender: linux-fsdevel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Cedric Blancher <cedric.blancher@gmail.com>, platform-driver-x86@vger.kernel.org, x86@kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Borislav Petkov <bp@suse.de>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Grzegorz Andrejczuk <grzegorz.andrejczuk@intel.com>, Haim Cohen <haim.cohen@intel.com>, Ingo Molnar <mingo@kernel.org>, Janakarajan Natarajan <Janakarajan.Natarajan@amd.com>, Jim Mattson <jmattson@google.com>, Kan Liang <Kan.liang@intel.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Kyle Huey <me@kylehuey.com>, Len Brown <len.brown@intel.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, "open list:FILESYSTEMS (VFS and infrastructure)" <linux-fsdevel@vger.kernel>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Feb 08, 2018 at 09:46:53AM +0100, Pavel Machek wrote:
> On Tue 2018-01-09 16:27:30, Jarkko Sakkinen wrote:
> > On Thu, Jan 04, 2018 at 03:17:24PM +0100, Cedric Blancher wrote:
> > > So how does this protect against the MELTDOWN attack (CVE-2017-5754)
> > > and the MELTATOMBOMBA4 worm which uses this exploit?
> > > 
> > > Ced
> > 
> > Everything going out of L1 gets encrypted. This is done to defend
> > against peripheral like adversaries and should work also against
> > meltdown.
> 
> Yeah, but useless against spectre and ability to introduce bit flips
> means this is generally useless...

You are right.

And what I said was simply false. In fact, the encryption is done in
LCC.  I'm sorry that I didn't response to my response and gave incorrect
info. I simply forgot to do this, no other excuses.

/Jarkko
