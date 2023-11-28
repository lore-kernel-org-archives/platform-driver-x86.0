Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KoUCajl6"
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35B181A2;
	Mon, 27 Nov 2023 17:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701136637; x=1732672637;
  h=message-id:subject:from:reply-to:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=+snk+mM+TxyaWw6DJecEKyanpjoN0GjRNcW3jAnYR9g=;
  b=KoUCajl6yxLLbaZntjFSGFenq9pp6/IkLWKjHRpIF891ENp1ft2EHliP
   M6U+Hd+40TJIwdOKTtGZiSiWf2EcR66+lrabukzMxP2KZE4GrbgNKvD4C
   2yo3EFBJmVKIHz+YrnEwKdC1cDTksQl9F3OE+3T39uX+i5bJwJfwJu/ti
   HvzUDS7VavryWtxIP2KnsvMPU/mW7ejG0CBSxnBvFgp5qrjWml3DEUYT5
   b8wRYMi91WCGQcgtSQu2GFpyG+FOhvQPZzhMeFXq24al7bod5xlRnbkaC
   r319SHDm3rQzlVs3/SZOqZM/lEaiwC/KwLdgJJnRNgoFXu6rUQZZU4Qzc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="395647075"
X-IronPort-AV: E=Sophos;i="6.04,232,1695711600"; 
   d="scan'208";a="395647075"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 17:55:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="1015754868"
X-IronPort-AV: E=Sophos;i="6.04,232,1695711600"; 
   d="scan'208";a="1015754868"
Received: from linux.intel.com ([10.54.29.200])
  by fmsmga006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 17:55:58 -0800
Received: from luisdsan-mobl28.amr.corp.intel.com (unknown [10.209.42.149])
	by linux.intel.com (Postfix) with ESMTP id 440C2580AA7;
	Mon, 27 Nov 2023 17:55:58 -0800 (PST)
Message-ID: <adb8c80395d2c23488496b9ad323bfc265ad3514.camel@linux.intel.com>
Subject: Re: [PATCH V5 12/20] asm-generic/io.h: iounmap/ioport_unmap
 cleanup.h support
From: "David E. Box" <david.e.box@linux.intel.com>
Reply-To: david.e.box@linux.intel.com
To: Ilpo =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	bhe@redhat.com, schnelle@linux.ibm.com
Cc: LKML <linux-kernel@vger.kernel.org>,
 platform-driver-x86@vger.kernel.org,  rajvi.jingar@linux.intel.com,
 dave.hansen@linux.intel.com, peterz@infradead.org
Date: Mon, 27 Nov 2023 17:55:58 -0800
In-Reply-To: <f83e4a40-314-d279-75e6-17ad83501982@linux.intel.com>
References: <20231123040355.82139-1-david.e.box@linux.intel.com>
	 <20231123040355.82139-13-david.e.box@linux.intel.com>
	 <f83e4a40-314-d279-75e6-17ad83501982@linux.intel.com>
Organization: David E. Box
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

+Baoquan for ioremap question.

On Thu, 2023-11-23 at 16:30 +0200, Ilpo J=C3=A4rvinen wrote:
> On Wed, 22 Nov 2023, David E. Box wrote:
>=20
> > Add auto-release cleanups for iounmap() and ioport_unmap().
> >=20
> > Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> > Suggested-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> > ---
> > V2 - Move from linux/io.h to asm-generic/io.h. Adds iounmap cleanup if
> > =C2=A0=C2=A0=C2=A0=C2=A0 iounmap() is defined. Adds ioport_unmap cleanu=
p if CONFIG_IOPORT_MAP
> > =C2=A0=C2=A0=C2=A0=C2=A0 is defined.
> >=20
> > =C2=A0include/asm-generic/io.h | 6 ++++++
> > =C2=A01 file changed, 6 insertions(+)
> >=20
> > diff --git a/include/asm-generic/io.h b/include/asm-generic/io.h
> > index bac63e874c7b..9ef0332490b1 100644
> > --- a/include/asm-generic/io.h
> > +++ b/include/asm-generic/io.h
> > @@ -8,6 +8,7 @@
> > =C2=A0#define __ASM_GENERIC_IO_H
> > =C2=A0
> > =C2=A0#include <asm/page.h> /* I/O is all done through memory accesses =
*/
> > +#include <linux/cleanup.h>
> > =C2=A0#include <linux/string.h> /* for memset() and memcpy() */
> > =C2=A0#include <linux/types.h>
> > =C2=A0#include <linux/instruction_pointer.h>
> > @@ -1065,6 +1066,10 @@ static inline void __iomem *ioremap(phys_addr_t =
addr,
> > size_t size)
> > =C2=A0#endif
> > =C2=A0#endif /* !CONFIG_MMU || CONFIG_GENERIC_IOREMAP */
> > =C2=A0
> > +#ifdef iounmap
> > +DEFINE_FREE(iounmap, void __iomem *, iounmap(_T));
> > +#endif

Baoquan, LKP is reporting an undeclared function 'iounmap' error with the a=
bove
change from this patch when building for s390 with PCI disabled. The iorema=
p
defines in arch/s390/include/asm/io.h are not wrapped under the #ifdef
CONFIG_PCI block. Shouldn't they be since the s390 Kconfig only adds
GENERIC_IOREMAP if PCI?

https://lore.kernel.org/oe-kbuild-all/202311241214.jcL84du7-lkp@intel.com


Note that the report includes pointer arithmetic warnings that are not rela=
ted
to this patch. Those warnings occur in mainline as well.

David

> > +
> > =C2=A0#ifndef ioremap_wc
> > =C2=A0#define ioremap_wc ioremap
> > =C2=A0#endif
> > @@ -1127,6 +1132,7 @@ static inline void ioport_unmap(void __iomem *p)
> > =C2=A0extern void __iomem *ioport_map(unsigned long port, unsigned int =
nr);
> > =C2=A0extern void ioport_unmap(void __iomem *p);
> > =C2=A0#endif /* CONFIG_GENERIC_IOMAP */
> > +DEFINE_FREE(ioport_unmap, void __iomem *, ioport_unmap(_T));
> > =C2=A0#endif /* CONFIG_HAS_IOPORT_MAP */
> > =C2=A0
> > =C2=A0#ifndef CONFIG_GENERIC_IOMAP
>=20
> Has this now built successfully with LKP? (I don't think we get success=
=20
> notifications from LKP for patch submissions, only failures).
>=20
> There were some odd errors last time but I think all they were unrelated=
=20
> to this change (besides the checkpatch false positive, I mean).
>=20

