Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795533313;
	b=E6WCPF21AbtrMU0VwNN0RDYC4mTUkPxiHfZp3a6hy1l2+3vITYqm2xcAE4PWN6Puk5Zw
	 6fn9zTjikiEtbfZHVNC/umrFOjvvdsv3aOCCgSifFDiYK7n3OXlgCBNKKWC5eczlF3Ky/
	 RDNJpXqy3rEJpfBJIaqg5E4niR73z5mo8EKRmWjEl0P4Ts2NapxlVHKv2+XLkv8alMm7M
	 qThpbyU3usPixleYhz073e9Lt7ZfJw+hs20keYLKeE9yukLIZkSuuqOjpTX4kfBHIhUYY
	 WVZHsGRZvKpCzy6ilZoBMDO8qj+XspqVsomUhrf1RCKZwDHhzWvgeTjY/1ypWqOufbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795533313;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=t+rsUJQB9NzQfbSQXjm63fq2P+M1XUMyzkHBce2Zlzc=;
	b=yqNwmwDgREBnhMVLUI/X9SJtAlXIfHy+1I1LTbRNfG4rr4XsuuuhQVc4rTi8/13MTBod
	 kh67kkZXYQ5j6jAXqgTydlEY0qzOZzUtaXfWl7uO2JgzNaQYp9eUWmVT3YpGFdrPzIUz6
	 fHfK9XcR67YDaVcRjwgiT6w+FjtkrP+KCmE+0w/JM3Uu6cHnXXyIfqcdk2pezUStv/EO9
	 46bw6of3Xb4Go3xpPfPTDUX3/iiCWkIBHUk7DGXRMNlhRKSQzMpXgiHGYCV5hsODgo4Bg
	 lgXVdPnzTSszJNQrDX1MUwi2i1N0uLlp+o3JKXSH3g8otD7sJaUtdWtrf+zcbK1Sl1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IBxI1hwU;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B5D606A330
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2026 15:15:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3B5D606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IBxI1hwU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795533313; x=1827069313;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=vnLU/1uYbXwB4sWi28JGfRuwSi87EclTG8aitQEyCZE=;
  b=IBxI1hwUQ5dEyLmHkOfQzFu5UcMLk4mGmYNT28Yx/MuneeJq6mGx/NjD
   3FIZone/uIQI7Po5hkPop1IR9I22JV8zbC8MuU+jGa2MMVg0TWHmoNCrL
   p7Rmyn6TwzAXqM4AW2Mynynrlhrbsi25RQxhyt6irJaZAhZvtsS1WvoaC
   kM49Xy4kUtMQx7yT/dluD5NuG9MOVtZ+K8/VDtFee8oshH8QWue5P8M1d
   FxmpldZw4OLg2oRL1svAN2jDqIUi8igU9hCph30BTU9e6CkYp5WfchA+F
   Y9BmRD1WbzSjEwX45A40HJwAaR632tpJTN/LQHag40ifwDKW/riUu1jk7
   Q==;
X-CSE-ConnectionGUID: HVkY/EgeT8GrzfhovWD82A==
X-CSE-MsgGUID: S9plZfk0QAiN6zgN0r1Azw==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4247706"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4247706"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 06:25:10 -0800
X-CSE-ConnectionGUID: SEFwGSK0R4WVnQTDha1Grg==
X-CSE-MsgGUID: v4FuZ+I9RTS3DgVF+FyF5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="11484546"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.190])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 06:22:54 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 24 Nov 2026 16:22:51 +0200 (EET)
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
cc: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
    Hans de Goede <hansg@kernel.org>, matthew.brost@intel.com, 
    rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com, 
    airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com, 
    anoop.c.vijay@intel.com, badal.nilawar@intel.com, 
    matthew.d.roper@intel.com, james.ausmus@intel.com
Subject: Re: [PATCH v23 02/19] platform/x86/intel/pmt: Use the pre-populated
 header info for crashlog
In-Reply-To: <20261124020752.30551-23-michael.j.ruhl@intel.com>
Message-ID: <9867facd-1512-94bb-a50e-04397033dc38@linux.intel.com>
References: <20261124020752.30551-21-michael.j.ruhl@intel.com> <20261124020752.30551-23-michael.j.ruhl@intel.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1807635651-1795530171=:1182"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1807635651-1795530171=:1182
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 23 Nov 2026, Michael J. Ruhl wrote:

> Crashlog reads discovery data directly from the discovery table.
>=20
> For parents that provide a read_discovery callback, this data may
> not be readable with this method.
>=20
> Update to use the pre-populated discovery data (disc_header), rather
> than reading directly (disc_table) for probe.
>=20
> Reviewed-by: David E. Box <david.e.box@linux.intel.com>
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

Acked-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
=20
--
 i.


> ---
>  drivers/platform/x86/intel/pmt/crashlog.c | 24 +++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform=
/x86/intel/pmt/crashlog.c
> index d7018b495217..e2af09732dd6 100644
> --- a/drivers/platform/x86/intel/pmt/crashlog.c
> +++ b/drivers/platform/x86/intel/pmt/crashlog.c
> @@ -27,10 +27,10 @@
>  #define CRASH_TYPE_OOBMSM=091
> =20
>  /* Crashlog Discovery Header */
> -#define CONTROL_OFFSET=09=090x0
> -#define GUID_OFFSET=09=090x4
> -#define BASE_OFFSET=09=090x8
> -#define SIZE_OFFSET=09=090xC
> +#define ACCESS_IDX=09=090
> +#define GUID_IDX=09=091
> +#define BASE_IDX=09=092
> +#define SIZE_IDX=09=093
>  #define GET_ACCESS(v)=09=09((v) & GENMASK(3, 0))
>  #define GET_TYPE(v)=09=09(((v) & GENMASK(7, 4)) >> 4)
>  #define GET_VERSION(v)=09=09(((v) & GENMASK(19, 16)) >> 16)
> @@ -208,10 +208,10 @@ static int pmt_crashlog_disabled(struct crashlog_en=
try *crashlog, bool *state)
> =20
>  static bool pmt_crashlog_supported(struct intel_pmt_entry *entry, u32 *c=
rash_type, u32 *version)
>  {
> -=09u32 discovery_header =3D readl(entry->disc_table + CONTROL_OFFSET);
> +=09u32 *disc_header =3D entry->disc_header;
> =20
> -=09*crash_type =3D GET_TYPE(discovery_header);
> -=09*version =3D GET_VERSION(discovery_header);
> +=09*crash_type =3D GET_TYPE(disc_header[ACCESS_IDX]);
> +=09*version =3D GET_VERSION(disc_header[ACCESS_IDX]);
> =20
>  =09/*
>  =09 * Currently we only recognize OOBMSM (type 1) and version 0 or 2
> @@ -608,15 +608,15 @@ static int pmt_crashlog_pre_decode(struct intel_vse=
c_device *ivdev,
>  static int pmt_crashlog_header_decode(struct intel_pmt_entry *entry,
>  =09=09=09=09      struct device *dev)
>  {
> -=09void __iomem *disc_table =3D entry->disc_table;
>  =09struct intel_pmt_header *header =3D &entry->header;
> +=09u32 *disc_header =3D entry->disc_header;
> =20
> -=09header->access_type =3D GET_ACCESS(readl(disc_table));
> -=09header->guid =3D readl(disc_table + GUID_OFFSET);
> -=09header->base_offset =3D readl(disc_table + BASE_OFFSET);
> +=09header->access_type =3D GET_ACCESS(disc_header[ACCESS_IDX]);
> +=09header->guid =3D disc_header[GUID_IDX];
> +=09header->base_offset =3D disc_header[BASE_IDX];
> =20
>  =09/* Size is measured in DWORDS, but accessor returns bytes */
> -=09header->size =3D GET_SIZE(readl(disc_table + SIZE_OFFSET));
> +=09header->size =3D GET_SIZE(disc_header[SIZE_IDX]);
> =20
>  =09return 0;
>  }
>=20
--8323328-1807635651-1795530171=:1182--
