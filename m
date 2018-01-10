From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v6 00/11] Intel SGX Driver
Date: Wed, 10 Jan 2018 18:16:56 +0200
Message-ID: <20180110161656.hftp6lsnut7u6klr@linux.intel.com>
References: <jarkko.sakkinen@linux.intel.com>
 <201801092150.w09LoNtB017301@wind.enjellic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201801092150.w09LoNtB017301@wind.enjellic.com>
Sender: linux-doc-owner@vger.kernel.org
To: greg@enjellic.com
Cc: Pavel Machek <pavel@ucw.cz>, platform-driver-x86@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, Borislav Petkov <bp@suse.de>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Grzegorz Andrejczuk <grzegorz.andrejczuk@intel.com>, Haim Cohen <haim.cohen@intel.com>, Ingo Molnar <mingo@kernel.org>, Janakarajan Natarajan <Janakarajan.Natarajan@amd.com>, Jim Mattson <jmattson@google.com>, Kan Liang <Kan.liang@intel.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Kyle Huey <me@kylehuey.com>, Len Brown <len.brown@intel.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, "open list:FILESYSTEMS (VFS and infrastructure)" <linux-fsdevel@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Jan 09, 2018 at 03:50:23PM -0600, Dr. Greg Wettstein wrote:
> > Everything going out of L1 gets encrypted. This is done to defend
> > against peripheral like adversaries and should work also against
> > meltdown.
> 
> I don't believe this is an architecturally correct assertion.  The
> encryption/decryption occurs at the 'bottom' of the cache heirarchy.

You are right and I was wrong. It is plain from L1 to LLC, which implies
as you correctly described potential cache missing attacks in addition
to timing attacks.

/Jarkko
