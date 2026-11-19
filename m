Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795119197;
	b=RAOEHrXm7jkb3oEYx77eotFazQV2u0ZA8PyeAdb3R/YcTw8ig1h2pt0tXaYirtKoG+T3
	 QOoXLsni0FMs9x8Y6FE9Bz9i4Y8862HSFx5Uk/T2g+zNWOutwTzH+UWJ/5dLBh+jisT2F
	 5/qsr1onI3cfQQ6ocjy69gFbRZ8EcBXXS4GV8We1MYgR4s9r59ZkL+TwVWVJVWLK09emZ
	 m5ZoYyMYoLpkoDB3ExtMlllG6JmDuTjmdWQyH33XCq1f3JzwRckT1Avely1ancTy5xstp
	 MatpPX3tXcrZOTYyvKRP4K9KpHwUHeLkwyx0n0BDDvUXnJGR7V9ld1MyDBwCk3HlnIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795119197;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=BwUenS+Geb0AtiReQAxExDU6dCfdpa1N0e5DSjboT/g=;
	b=pZnoVlnHZf4jdow+9zogNMhPNOhDg51EoxGuwWfjgbmkdo+NaPO7Bhd9hjT844YOO/78
	 cRlGCmLefuDsKz7j5Shkbgmt6Ya5+qCLgDKaApypEvjyR1cDRXqspeLU+6Z2f55MMIYX/
	 dyXhkSXY1faLXNggt0Y6IzxG557nHMp+/k0YD/sGgxjteuKXKnXBNNAqlYzd1A7u4mxiS
	 RmHxtFV0QvzE98hR5hD0dRl0TXfeeasjOuKoItXM4sk+4RbKAHZ5udvujeTpKL+ulq/AS
	 0xl6jTxLdrD8uW9WzgCbBuEFMk0SclyCzrCrJKxAhDhYcPSK6bZNdpWP0AvfTLLmOlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N4o87HWI;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C63606A320
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Nov 2026 20:13:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9C63606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N4o87HWI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795119197; x=1826655197;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EIHDLR1csYhiV76SQwovzWT4Wb6Xa2UFFWOPDv9NJPY=;
  b=N4o87HWIo09yz1V9n4qB5iSo33AAFaiu7PxjHv3wXImOEC9HASJEK719
   sQpSvLFmzk8s2fXvGDrpkbm82I/H7i5UyEo6g+kxMDKND9JJay87SRJlg
   idK0hUSGsGVlLiQKuNfF1naRxqfUOt5XdAfD2ZYAzZMaPrg98i+P73/FT
   njkGoAvnPEjaVD8fgUudDlLtBYIibnA7cfOmNpFDrC0I59Oqodz5eNcos
   kbrA1UK1EsCHcBdY5HxUQgzDXMqS/CwRpfFWy7/WxOmGd+Cd8Ee7l8qbT
   kyHE7KMp2SZv5y8y3XzGVueqF4hK8TdHTtDWqRvsT+3dg5Xr20ousARfK
   w==;
X-CSE-ConnectionGUID: spYZXGUlRKysPmk/c+CK6w==
X-CSE-MsgGUID: 629y1xHNQMuv2S7gMtM69g==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3908001"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3908001"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 12:13:17 -0800
X-CSE-ConnectionGUID: zFGTUZYXShSR6wSyTn3Z9Q==
X-CSE-MsgGUID: A5Fgj4X3SaO0gMHlKt59gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10608249"
Received: from debox1-desk4.jf.intel.com (HELO localhost) ([10.54.77.98])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 12:13:16 -0800
Date: Thu, 19 Nov 2026 12:13:15 -0800
From: "David E. Box" <david.e.box@linux.intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
	hansg@kernel.org, ilpo.jarvinen@linux.intel.com, matthew.brost@intel.com, 
	rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com, airlied@gmail.com, 
	simona@ffwll.ch, anoop.c.vijay@intel.com, badal.nilawar@intel.com, 
	matthew.d.roper@intel.com, james.ausmus@intel.com
Subject: Re: [PATCH v19 02/19] platform/x86/intel/pmt: Use the pre-populated
 header info for crashlog
Message-ID: <av9XYlK6ljNjnmg3@debox1-desk4>
References: <20261119155438.40762-21-michael.j.ruhl@intel.com>
 <20261119155438.40762-23-michael.j.ruhl@intel.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261119155438.40762-23-michael.j.ruhl@intel.com>

On Thu, Nov 19, 2026 at 07:54:40AM -0800, Michael J. Ruhl wrote:
> Discovery data is pre-populated.
>
> Use the data for crashlog probe.

Please say why: Crashlog read its discovery fields directly from
disc_table, which isn't valid on a parent that provides read_discovery().
Decoding from the disc_header copy that pmt_get_headers() already filled
works for both cases and it's what telemetry already does.

>
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/platform/x86/intel/pmt/crashlog.c | 24 +++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
> index d7018b495217..f7c391d145ff 100644
> --- a/drivers/platform/x86/intel/pmt/crashlog.c
> +++ b/drivers/platform/x86/intel/pmt/crashlog.c
> @@ -27,10 +27,10 @@
>  #define CRASH_TYPE_OOBMSM	1
>  
>  /* Crashlog Discovery Header */
> -#define CONTROL_OFFSET		0x0
> -#define GUID_OFFSET		0x4
> -#define BASE_OFFSET		0x8
> -#define SIZE_OFFSET		0xC
> +#define STATUS_IDX		0
> +#define GUID_IDX		1
> +#define BASE_IDX		2
> +#define SIZE_IDX		3

For STATUS_IDX I'd call it ACCESS_IDX instead. Dword 0 holds the access
type, crashlog type and version, which is what this file reads it for. It
is only the status register on type 1 v2, and on v0 it is also the control
register, so STATUS is confusing here. It also matches GET_ACCESS().

>  #define GET_ACCESS(v)		((v) & GENMASK(3, 0))
>  #define GET_TYPE(v)		(((v) & GENMASK(7, 4)) >> 4)
>  #define GET_VERSION(v)		(((v) & GENMASK(19, 16)) >> 16)
> @@ -208,10 +208,10 @@ static int pmt_crashlog_disabled(struct crashlog_entry *crashlog, bool *state)
>  
>  static bool pmt_crashlog_supported(struct intel_pmt_entry *entry, u32 *crash_type, u32 *version)
>  {
> -	u32 discovery_header = readl(entry->disc_table + CONTROL_OFFSET);
> +	u32 *disc_header = entry->disc_header;
>  
> -	*crash_type = GET_TYPE(discovery_header);
> -	*version = GET_VERSION(discovery_header);
> +	*crash_type = GET_TYPE(disc_header[STATUS_IDX]);
> +	*version = GET_VERSION(disc_header[STATUS_IDX]);
>  
>  	/*
>  	 * Currently we only recognize OOBMSM (type 1) and version 0 or 2
> @@ -608,15 +608,15 @@ static int pmt_crashlog_pre_decode(struct intel_vsec_device *ivdev,
>  static int pmt_crashlog_header_decode(struct intel_pmt_entry *entry,
>  				      struct device *dev)
>  {
> -	void __iomem *disc_table = entry->disc_table;
>  	struct intel_pmt_header *header = &entry->header;
> +	u32 *disc_header = entry->disc_header;
>  
> -	header->access_type = GET_ACCESS(readl(disc_table));
> -	header->guid = readl(disc_table + GUID_OFFSET);
> -	header->base_offset = readl(disc_table + BASE_OFFSET);
> +	header->access_type = GET_ACCESS(disc_header[STATUS_IDX]);
> +	header->guid = disc_header[GUID_IDX];
> +	header->base_offset = disc_header[BASE_IDX];
>  
>  	/* Size is measured in DWORDS, but accessor returns bytes */
> -	header->size = GET_SIZE(readl(disc_table + SIZE_OFFSET));
> +	header->size = GET_SIZE(disc_header[SIZE_IDX]);
>  
>  	return 0;
>  }

With STATUS_IDX renamed and the commit message expanded, this looks good to
me.

David
