From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 2/2] xen/pvh: correctly setup the PV EFI interface for
 dom0
Date: Wed, 24 Apr 2019 17:45:04 +0200
Message-ID: <20190424154504.vzkkobxsesc3oval@Air-de-Roger>
References: <20190423130416.68935-1-roger.pau@citrix.com>
 <20190423130416.68935-2-roger.pau@citrix.com>
 <2359c97c-1125-cfd2-44c2-7e9ce7972558@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2359c97c-1125-cfd2-44c2-7e9ce7972558@oracle.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, xen-devel@lists.xenproject.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Apr 24, 2019 at 11:36:41AM -0400, Boris Ostrovsky wrote:
> On 4/23/19 9:04 AM, Roger Pau Monne wrote:
> > This involves initializing the boot params EFI related fields and the
> > efi global variable.
> >
> > Without this fix a PVH dom0 doesn't detect when booted from EFI, and
> > thus doesn't support accessing any of the EFI related data.
> >
> > Reported-by: PGNet Dev <pgnet.dev@gmail.com>
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Hmm.. This seems to be breaking save/restore for me (for domU), and I
> can't see any obvious reasons.
> 
> Can you try it?

Sure, thanks for the extra testing! I have to admit I haven't tested
save/restore with this patch applied, it didn't come to mind it might
affect that functionality.

I assume it's save/restore of a PVH domU that's broken (HVM and PV are
fine)?

Thanks, Roger.
