Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E9F198A0B
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Jul 2024 10:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721126214; cv=none; b=CGVay7bGp2aakyMRclGNCSiomTzsU3xy0CmBih/ttPZcXklgTjKr8tFlYn5OmiaQXkiHOrWzoP/dLsnonxD6Yk2pXSencet15KbVIMGG3Drix1B+oS4RdznGq/Mui8wUZFd5FMoHFRL8JwcLhw0NzXK5TLc75Ed47GtWDYEk+Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721126214; c=relaxed/simple;
	bh=XT/Pn1E3JBg8iuXZyAyEGJyBmC9D3+4fTJP2LqzCCHE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=DQjWTlcRq4Vdos3zwFbf3iZH5V/MisJzF8xqnAeSjLfsojoaoKf/9Ju06GtAjVk9JINRtsBU8E3F6rOXoxTRMFGPrvIrcDqe1pE2sU0e+qbQrsgP9KKVOGtaaHKLtq3Zn/+0DnhPY8oRBS25B/4pDj2AmxiQwLaYmz+zScdH1TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oAHDbGyz; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oAHDbGyz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721126213; x=1752662213;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=XT/Pn1E3JBg8iuXZyAyEGJyBmC9D3+4fTJP2LqzCCHE=;
  b=oAHDbGyzLjhZ4TXkscZKVLsO5Ehf/Y5++pedxnnr7UJ2yb+CgsCIhYIL
   LCGm5fqHSW5nkS3dkfDPZ63CzHXZNqG/1x0/q/sU+7JZ18Fn37ARmb5IZ
   nUlbppHD58HylvlTBAJXNhQ1eO4QzfeQb8NdMFH4jdEghNeKJV3vYvSR2
   DoB4s7r0xEc2IWubtfM8UGIO7u7Gt0FbGy0U69lYcITLybIpAIBRBXxp5
   h6y4J6BYQSO1JxAe2EhDQdZA/iPt5NzrKLwmAWLaHFmA+NQxGg6HT+GL2
   rMwFhxQqizvLX/LXKo1f27qs4fxZd7dfj9Vp7wAIIg0dw7bE2KkpAWq3d
   A==;
X-CSE-ConnectionGUID: DztREcscRRmgvgVAKcEwMw==
X-CSE-MsgGUID: aDEgl3DfQjiAeHlDLJQf0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="29703401"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; 
   d="scan'208";a="29703401"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2024 03:36:32 -0700
X-CSE-ConnectionGUID: WggglImAQkisQMw6rZcmMw==
X-CSE-MsgGUID: Sejq/lUPTKadLeauOj15WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; 
   d="scan'208";a="50354094"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.133])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2024 03:36:27 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 16 Jul 2024 13:36:22 +0300 (EEST)
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
cc: intel-xe@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, 
    david.e.box@linux.intel.com, matthew.brost@intel.com, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v7 3/6] platform/x86/intel/pmt: Use PMT callbacks
In-Reply-To: <20240715175452.4010751-4-michael.j.ruhl@intel.com>
Message-ID: <c2056a69-35a0-49ba-8267-1f03e3d9ed26@linux.intel.com>
References: <20240715175452.4010751-1-michael.j.ruhl@intel.com> <20240715175452.4010751-4-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1471858199-1721126182=:1037"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1471858199-1721126182=:1037
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 15 Jul 2024, Michael J. Ruhl wrote:

> From: "David E. Box" <david.e.box@linux.intel.com>
>=20
> PMT providers may require device specific actions before their telemetry
> may be read. If the read_telem() is assigned, call it instead of
> memcpy_fromio() and return. Since this needs to be done in multiple
> locations, add pmt_telem_read_mmio() as a wrapper function to perform thi=
s
> and any other needed checks.
>=20
> Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> ---
>  drivers/platform/x86/intel/pmt/class.c     | 26 +++++++++++++++++-----
>  drivers/platform/x86/intel/pmt/class.h     |  8 +++++--
>  drivers/platform/x86/intel/pmt/telemetry.c | 10 +++++----
>  3 files changed, 32 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x8=
6/intel/pmt/class.c
> index d7939b28e937..c04bb7f97a4d 100644
> --- a/drivers/platform/x86/intel/pmt/class.c
> +++ b/drivers/platform/x86/intel/pmt/class.c
> @@ -58,6 +58,22 @@ pmt_memcpy64_fromio(void *to, const u64 __iomem *from,=
 size_t count)
>  =09return count;
>  }
> =20
> +int pmt_telem_read_mmio(struct pci_dev *pdev, struct pmt_callbacks *cb, =
u32 guid, void *buf,
> +=09=09=09void __iomem *addr, u32 count)
> +{
> +=09if (cb && cb->read_telem)
> +=09=09return cb->read_telem(pdev, guid, buf, count);
> +
> +=09if (guid =3D=3D GUID_SPR_PUNIT)
> +=09=09/* PUNIT on SPR only supports aligned 64-bit read */
> +=09=09return pmt_memcpy64_fromio(buf, addr, count);

Perhaps this SPR quirk could now also use the ->read_telem() callback. It=
=20
would seem nice cleanup if viable.

> +
> +=09memcpy_fromio(buf, addr, count);
> +
> +=09return count;
> +}
> +EXPORT_SYMBOL_NS_GPL(pmt_telem_read_mmio, INTEL_PMT);
> +
>  /*
>   * sysfs
>   */
> @@ -79,11 +95,8 @@ intel_pmt_read(struct file *filp, struct kobject *kobj=
,
>  =09if (count > entry->size - off)
>  =09=09count =3D entry->size - off;
> =20
> -=09if (entry->guid =3D=3D GUID_SPR_PUNIT)
> -=09=09/* PUNIT on SPR only supports aligned 64-bit read */
> -=09=09count =3D pmt_memcpy64_fromio(buf, entry->base + off, count);
> -=09else
> -=09=09memcpy_fromio(buf, entry->base + off, count);
> +=09count =3D pmt_telem_read_mmio(entry->ep->pcidev, entry->cb, entry->he=
ader.guid, buf,
> +=09=09=09=09    entry->base + off, count);
> =20
>  =09return count;
>  }
> @@ -239,6 +252,7 @@ static int intel_pmt_populate_entry(struct intel_pmt_=
entry *entry,
> =20
>  =09entry->guid =3D header->guid;
>  =09entry->size =3D header->size;
> +=09entry->cb =3D ivdev->priv_data;
> =20
>  =09return 0;
>  }
> @@ -300,7 +314,7 @@ static int intel_pmt_dev_register(struct intel_pmt_en=
try *entry,
>  =09=09goto fail_ioremap;
> =20
>  =09if (ns->pmt_add_endpoint) {
> -=09=09ret =3D ns->pmt_add_endpoint(entry, ivdev->pcidev);
> +=09=09ret =3D ns->pmt_add_endpoint(ivdev, entry);
>  =09=09if (ret)
>  =09=09=09goto fail_add_endpoint;
>  =09}
> diff --git a/drivers/platform/x86/intel/pmt/class.h b/drivers/platform/x8=
6/intel/pmt/class.h
> index d6f9ccaf28c8..a267ac964423 100644
> --- a/drivers/platform/x86/intel/pmt/class.h
> +++ b/drivers/platform/x86/intel/pmt/class.h
> @@ -24,6 +24,7 @@ struct pci_dev;
>  struct telem_endpoint {
>  =09struct pci_dev=09=09*pcidev;
>  =09struct telem_header=09header;
> +=09struct pmt_callbacks=09*cb;
>  =09void __iomem=09=09*base;
>  =09bool=09=09=09present;
>  =09struct kref=09=09kref;
> @@ -43,6 +44,7 @@ struct intel_pmt_entry {
>  =09struct kobject=09=09*kobj;
>  =09void __iomem=09=09*disc_table;
>  =09void __iomem=09=09*base;
> +=09struct pmt_callbacks=09*cb;
>  =09unsigned long=09=09base_addr;
>  =09size_t=09=09=09size;
>  =09u32=09=09=09guid;
> @@ -55,10 +57,12 @@ struct intel_pmt_namespace {
>  =09const struct attribute_group *attr_grp;
>  =09int (*pmt_header_decode)(struct intel_pmt_entry *entry,
>  =09=09=09=09 struct device *dev);
> -=09int (*pmt_add_endpoint)(struct intel_pmt_entry *entry,
> -=09=09=09=09struct pci_dev *pdev);
> +=09int (*pmt_add_endpoint)(struct intel_vsec_device *ivdev,
> +=09=09=09=09struct intel_pmt_entry *entry);
>  };
> =20
> +int pmt_telem_read_mmio(struct pci_dev *pdev, struct pmt_callbacks *cb, =
u32 guid, void *buf,
> +=09=09=09void __iomem *addr, u32 count);
>  bool intel_pmt_is_early_client_hw(struct device *dev);
>  int intel_pmt_dev_create(struct intel_pmt_entry *entry,
>  =09=09=09 struct intel_pmt_namespace *ns,
> diff --git a/drivers/platform/x86/intel/pmt/telemetry.c b/drivers/platfor=
m/x86/intel/pmt/telemetry.c
> index 3478f891ea0b..c9feac859e57 100644
> --- a/drivers/platform/x86/intel/pmt/telemetry.c
> +++ b/drivers/platform/x86/intel/pmt/telemetry.c
> @@ -93,8 +93,8 @@ static int pmt_telem_header_decode(struct intel_pmt_ent=
ry *entry,
>  =09return 0;
>  }
> =20
> -static int pmt_telem_add_endpoint(struct intel_pmt_entry *entry,
> -=09=09=09=09  struct pci_dev *pdev)
> +static int pmt_telem_add_endpoint(struct intel_vsec_device *ivdev,
> +=09=09=09=09  struct intel_pmt_entry *entry)
>  {
>  =09struct telem_endpoint *ep;
> =20
> @@ -104,13 +104,14 @@ static int pmt_telem_add_endpoint(struct intel_pmt_=
entry *entry,
>  =09=09return -ENOMEM;
> =20
>  =09ep =3D entry->ep;
> -=09ep->pcidev =3D pdev;
> +=09ep->pcidev =3D ivdev->pcidev;
>  =09ep->header.access_type =3D entry->header.access_type;
>  =09ep->header.guid =3D entry->header.guid;
>  =09ep->header.base_offset =3D entry->header.base_offset;
>  =09ep->header.size =3D entry->header.size;
>  =09ep->base =3D entry->base;
>  =09ep->present =3D true;
> +=09ep->cb =3D ivdev->priv_data;
> =20
>  =09kref_init(&ep->kref);
> =20
> @@ -218,7 +219,8 @@ int pmt_telem_read(struct telem_endpoint *ep, u32 id,=
 u64 *data, u32 count)
>  =09if (offset + NUM_BYTES_QWORD(count) > size)
>  =09=09return -EINVAL;
> =20
> -=09memcpy_fromio(data, ep->base + offset, NUM_BYTES_QWORD(count));
> +=09pmt_telem_read_mmio(ep->pcidev, ep->cb, ep->header.guid, data, ep->ba=
se + offset,
> +=09=09=09    NUM_BYTES_QWORD(count));
> =20
>  =09return ep->present ? 0 : -EPIPE;
>  }
>=20

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-1471858199-1721126182=:1037--
