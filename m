From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 00/12] x86/platform/uv: Updates for UV5
Date: Tue, 8 Sep 2020 17:40:45 +0200
Message-ID: <20200908154045.GA4169902@kroah.com>
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
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, Steve Wahl <steve.wahl@hpe.com>, Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@suse.de>, Dimitri Sivanich <dimitri.sivanich@hpe.com>, "H. Peter Anvin" <hpa@zytor.com>, Russ Anderson <russ.anderson@hpe.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Alexandre Chartre <alexandre.chartre@oracle.com>, Jian Cai <caij2003@gmail.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Sep 08, 2020 at 08:28:16AM -0700, Mike Travis wrote:
> 
> 
> On 9/8/2020 8:20 AM, Greg KH wrote:
> > On Mon, Sep 07, 2020 at 01:54:30PM -0500, Mike Travis wrote:
> > > Subject: [PATCH 00/12] x86/platform/uv: Updates for UV5
> > > 
> > > Add changes needed for new UV5 UV architecture.  Chief among the changes
> > > are 52 bits of physical memory address and 57 bits of virtual address space.
> > > 
> > > 0001 Remove UV BAU TLB Shootdown Handler
> > >      - removes BAU TLB code being replaced by BAU APIC driver
> > > 
> > > 0002 Remove SCIR built in driver
> > >      - removes System Controller (monitoring) code
> > > 
> > > 0003 Update UV kernel modules
> > >      - update loadable UV kernel modules prior to a clash of symbols
> > >        (is_uv) produced by auto-generated UV5 uv_mmrs.h file
> > > 
> > > 0004 Update UV MMRs for UV5
> > >      - update uv_mmrs.h file and fix resultant compiler errors
> > > 
> > > 0005 Add UV5 direct references
> > >      - add references to UV5 specific values
> > > 
> > > 0006 Decode and Use Arch Type in UVsystab
> > >      - add UV ArchType field to UVsystab to remove dependency on OEM_ID
> > > 
> > > 0007 Update MMIOH references
> > >      - display MMIOH mapping for each MMIOH region
> > > 
> > > 0008 Adjust GAM MMR references
> > >      - update GAM mapping for MMR accesses
> > > 
> > > 0009 Update UV GRU references
> > >      - update GRU mapping to include UV5
> > > 
> > > 0010 Update Node Present Counting
> > >      - UV5 changes method of counting nodes present
> > > 
> > > 0011 Update UV5 TSC Checking
> > >      - update TSC sync check of BIOS sync status
> > > 
> > > 0012 Update for UV5 NMI MMR changes
> > >      - update NMI handler
> > > 
> > 
> > No diffstat?  Did you use 'git format-patch' cover letter for this?
> 
> I didn't.  If I could figure out how to convert quilt patches into git
> commits I might be able to do that?  (And I didn't know that diffstats were
> needed on the into?)

Ah, didn't realize you were using quilt, nevermind.

It's just a built-in feature of git, it makes your life easier than this
:)

thanks,

greg k-h
