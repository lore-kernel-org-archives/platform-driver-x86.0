From: peterz@infradead.org
Subject: Re: [PATCH 00/12] x86/platform/uv: Updates for UV5
Date: Tue, 8 Sep 2020 17:47:00 +0200
Message-ID: <20200908154700.GW1362448@hirez.programming.kicks-ass.net>
References: <20200907185430.363197758@hpe.com>
 <20200908152014.GB4114051@kroah.com>
 <03de6a71-5fc1-98f5-3886-536c72b2761d@hpe.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <03de6a71-5fc1-98f5-3886-536c72b2761d@hpe.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Travis <mike.travis@hpe.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, Steve Wahl <steve.wahl@hpe.com>, Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@suse.de>, Dimitri Sivanich <dimitri.sivanich@hpe.com>, "H. Peter Anvin" <hpa@zytor.com>, Russ Anderson <russ.anderson@hpe.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Alexandre Chartre <alexandre.chartre@oracle.com>, Jian Cai <caij2003@gmail.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Sep 08, 2020 at 08:28:16AM -0700, Mike Travis wrote:
> I didn't.  If I could figure out how to convert quilt patches into git
> commits I might be able to do that?  (And I didn't know that diffstats were
> needed on the into?)

$ git quiltimport

Or, for the more enterprising person:

$ quilt series | while read file; do git am $file; done

Generating a diffstat from a quilt series (when applied):

$ quilt diff --combine - | diffstat
