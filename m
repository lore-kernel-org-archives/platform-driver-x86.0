From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 2/2] xen/pvh: correctly setup the PV EFI interface for
 dom0
Date: Tue, 23 Apr 2019 11:42:40 +0200
Message-ID: <20190423094240.ksiq2qtow44tzbmf@Air-de-Roger>
References: <20190423092829.67915-1-roger.pau@citrix.com>
 <20190423092829.67915-2-roger.pau@citrix.com>
 <ec713432-338e-9d14-f626-759b0f3f94d7@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <ec713432-338e-9d14-f626-759b0f3f94d7@suse.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, xen-devel@lists.xenproject.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Apr 23, 2019 at 11:36:10AM +0200, Juergen Gross wrote:
> On 23/04/2019 11:28, Roger Pau Monne wrote:
> > diff --git a/include/xen/xen-ops.h b/include/xen/xen-ops.h
> > index 4969817124a8..51ef98e96d88 100644
> > --- a/include/xen/xen-ops.h
> > +++ b/include/xen/xen-ops.h
> > @@ -209,6 +209,7 @@ int xen_xlate_map_ballooned_pages(xen_pfn_t **pfns, void **vaddr,
> >  
> >  bool xen_running_on_version_or_later(unsigned int major, unsigned int minor);
> >  
> > +#ifdef CONFIG_XEN_EFI
> >  efi_status_t xen_efi_get_time(efi_time_t *tm, efi_time_cap_t *tc);
> >  efi_status_t xen_efi_set_time(efi_time_t *tm);
> >  efi_status_t xen_efi_get_wakeup_time(efi_bool_t *enabled, efi_bool_t *pending,
> > @@ -233,7 +234,12 @@ efi_status_t xen_efi_query_capsule_caps(efi_capsule_header_t **capsules,
> >  					int *reset_type);
> >  void xen_efi_reset_system(int reset_type, efi_status_t status,
> >  			  unsigned long data_size, efi_char16_t *data);
> > -
> > +extern void xen_efi_init(struct boot_params *boot_params);
> > +#else
> > +static inline void __init xen_efi_init(struct boot_params *boot_params)
> 
> Is struct boot_params defined on ARM?

Seems to be defined for x86 and some mips only, so I will have to find
another header. Will post v2 shortly.

Thanks, Roger.
