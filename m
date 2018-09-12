From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 1/2] platform/x86: dell-smbios-wmi: Correct a memory leak
Date: Wed, 12 Sep 2018 09:06:26 -0700
Message-ID: <20180912160626.GA24957@wrath>
References: <1536602513-13861-1-git-send-email-mario.limonciello@dell.com>
 <20180910205139.GC5659@wrath>
 <d140b6171dfe4e748b7491f4955c07be@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <d140b6171dfe4e748b7491f4955c07be@ausx13mpc120.AMER.DELL.COM>
Sender: stable-owner@vger.kernel.org
To: Mario.Limonciello@dell.com
Cc: andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, stable@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Sep 12, 2018 at 12:14:34PM +0000, Mario.Limonciello@dell.com wrote:
> Darren,
> 
> > -----Original Message-----
> > From: Darren Hart [mailto:dvhart@infradead.org]
> > Sent: Monday, September 10, 2018 3:52 PM
> > To: Limonciello, Mario
> > Cc: Andy Shevchenko; LKML; platform-driver-x86@vger.kernel.org;
> > stable@vger.kernel.org
> > Subject: Re: [PATCH 1/2] platform/x86: dell-smbios-wmi: Correct a memory leak
> > 
> > On Mon, Sep 10, 2018 at 01:01:52PM -0500, Mario Limonciello wrote:
> > > ACPI buffers were being allocated but never freed.
> > >
> > > Reported-by: Pinzhen Xu <pinzhen.xu@intel.com>
> > > Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
> > > Cc: stable@vger.kernel.org
> > 
> > Thanks Mario and Pinzhen, both queued. That's an easy one to miss, the usage not
> > being particularly obvious.
> > 
> 
> This cropped up and is fixed by that patch:
> https://github.com/dell/libsmbios/issues/63
> 
> Given the impact and how small the patch is, I think it might be good if this can come to 4.19-rcX if possible.
> Thoughts?
> 
> I suspect this one might be the same issue too:
> https://bugzilla.redhat.com/show_bug.cgi?id=1627609


Happy to pull these into fixes for 4.19-rcX. Queued to Fixes.

-- 
Darren Hart
VMware Open Source Technology Center
