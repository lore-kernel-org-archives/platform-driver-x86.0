Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z/u6vwMo"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78CC7B0
	for <platform-driver-x86@vger.kernel.org>; Wed, 29 Nov 2023 00:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701247530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T4tf6Z9mh7G2P6Vo/ih7c1NtHCBr2QOTR5abuK7e5yU=;
	b=Z/u6vwMoAoK6uj0j0zoBKlDV7ZSHFh1jYv86fs5SzO0V1wjCbZRDmsfDHo6CqMXyeNe5G0
	+nW3wTgmVBjBrLqOKAIjy8YzG0HUACFpLDTQMfKz76QGEKYMhMC/VxydyejCk++MpL6tCn
	+n32EOX6ExhSPsyA/+JKH8iADjkRG8c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-660-9DSmEEufOF-stxNDyXY4Tw-1; Wed, 29 Nov 2023 03:45:29 -0500
X-MC-Unique: 9DSmEEufOF-stxNDyXY4Tw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A5D87828AC9;
	Wed, 29 Nov 2023 08:45:28 +0000 (UTC)
Received: from localhost (unknown [10.72.112.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 055F820268DD;
	Wed, 29 Nov 2023 08:45:27 +0000 (UTC)
Date: Wed, 29 Nov 2023 16:45:24 +0800
From: Baoquan He <bhe@redhat.com>
To: "David E. Box" <david.e.box@linux.intel.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	schnelle@linux.ibm.com, LKML <linux-kernel@vger.kernel.org>,
	platform-driver-x86@vger.kernel.org, rajvi.jingar@linux.intel.com,
	dave.hansen@linux.intel.com, peterz@infradead.org
Subject: Re: [PATCH V5 12/20] asm-generic/io.h: iounmap/ioport_unmap
 cleanup.h support
Message-ID: <ZWb6JMqEZj8PB9cU@MiWiFi-R3L-srv>
References: <20231123040355.82139-1-david.e.box@linux.intel.com>
 <20231123040355.82139-13-david.e.box@linux.intel.com>
 <f83e4a40-314-d279-75e6-17ad83501982@linux.intel.com>
 <adb8c80395d2c23488496b9ad323bfc265ad3514.camel@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <adb8c80395d2c23488496b9ad323bfc265ad3514.camel@linux.intel.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4

On 11/27/23 at 05:55pm, David E. Box wrote:
> +Baoquan for ioremap question.
> 
> On Thu, 2023-11-23 at 16:30 +0200, Ilpo Järvinen wrote:
> > On Wed, 22 Nov 2023, David E. Box wrote:
> > 
> > > Add auto-release cleanups for iounmap() and ioport_unmap().
> > > 
> > > Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> > > Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> > > ---
> > > V2 - Move from linux/io.h to asm-generic/io.h. Adds iounmap cleanup if
> > >      iounmap() is defined. Adds ioport_unmap cleanup if CONFIG_IOPORT_MAP
> > >      is defined.
> > > 
> > >  include/asm-generic/io.h | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > > 
> > > diff --git a/include/asm-generic/io.h b/include/asm-generic/io.h
> > > index bac63e874c7b..9ef0332490b1 100644
> > > --- a/include/asm-generic/io.h
> > > +++ b/include/asm-generic/io.h
> > > @@ -8,6 +8,7 @@
> > >  #define __ASM_GENERIC_IO_H
> > >  
> > >  #include <asm/page.h> /* I/O is all done through memory accesses */
> > > +#include <linux/cleanup.h>
> > >  #include <linux/string.h> /* for memset() and memcpy() */
> > >  #include <linux/types.h>
> > >  #include <linux/instruction_pointer.h>
> > > @@ -1065,6 +1066,10 @@ static inline void __iomem *ioremap(phys_addr_t addr,
> > > size_t size)
> > >  #endif
> > >  #endif /* !CONFIG_MMU || CONFIG_GENERIC_IOREMAP */
> > >  
> > > +#ifdef iounmap
> > > +DEFINE_FREE(iounmap, void __iomem *, iounmap(_T));
> > > +#endif
> 
> Baoquan, LKP is reporting an undeclared function 'iounmap' error with the above
> change from this patch when building for s390 with PCI disabled. The ioremap
> defines in arch/s390/include/asm/io.h are not wrapped under the #ifdef
> CONFIG_PCI block. Shouldn't they be since the s390 Kconfig only adds
> GENERIC_IOREMAP if PCI?

Sorry, almost forget this mail. Will check and reply later.

> 
> https://lore.kernel.org/oe-kbuild-all/202311241214.jcL84du7-lkp@intel.com
> 
> 
> Note that the report includes pointer arithmetic warnings that are not related
> to this patch. Those warnings occur in mainline as well.
> 
> David
> 
> > > +
> > >  #ifndef ioremap_wc
> > >  #define ioremap_wc ioremap
> > >  #endif
> > > @@ -1127,6 +1132,7 @@ static inline void ioport_unmap(void __iomem *p)
> > >  extern void __iomem *ioport_map(unsigned long port, unsigned int nr);
> > >  extern void ioport_unmap(void __iomem *p);
> > >  #endif /* CONFIG_GENERIC_IOMAP */
> > > +DEFINE_FREE(ioport_unmap, void __iomem *, ioport_unmap(_T));
> > >  #endif /* CONFIG_HAS_IOPORT_MAP */
> > >  
> > >  #ifndef CONFIG_GENERIC_IOMAP
> > 
> > Has this now built successfully with LKP? (I don't think we get success 
> > notifications from LKP for patch submissions, only failures).
> > 
> > There were some odd errors last time but I think all they were unrelated 
> > to this change (besides the checkpatch false positive, I mean).
> > 
> 

