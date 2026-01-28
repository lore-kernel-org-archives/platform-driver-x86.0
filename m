Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2942613DDAE
	for <platform-driver-x86@vger.kernel.org>; Wed, 28 Jan 2026 12:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769604277; cv=none; b=tu/pDquzjTezCqAnnt3cpA5apUUKUayyOOaKVa0Hu2AYrMheoeNt2YXIud7gC4SjZVDfSMi280iJOpJ95wVQrXkI8BNRry0TWswJjZfnxeX02HaOxfKKqqIxlbM3SKhwcHFKlQ1fFpPdTmIWGTXnfGBiJ/rXnU/1f1PDGexN6/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769604277; c=relaxed/simple;
	bh=dRaGpVvYNwd3jOagOMM/zgiFnx6kf9rWB1RD+pGseBI=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=fz5viEOHXzItp5hG+zpvnG532lg+C0fVeAX9F4EeUX9tlIjCi2J7k2re2bGg31OrMsOSteyRKQwjwtLIXkjOdjuX5OBKWg0KqNCYcx6R7iRQmzUwk1Fki25IojsZTAARq8/i9qLkuzm9ZkHYUYS4XpCS2Gj8fX/uX+QOO1OzzHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SIr57FPt; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SIr57FPt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769604276; x=1801140276;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=dRaGpVvYNwd3jOagOMM/zgiFnx6kf9rWB1RD+pGseBI=;
  b=SIr57FPtSkkIaOZE13fZurDUB+fbaM5oOs++jn4h+H6JorhPr/F38CkK
   OztjnpYduIkkmFJoHD5BEg3DDIHTxPU7MB5gWvrhufD/SxDoDGVhDuiII
   ImMPHZy2bxIiT/APvaz0iV9qNxEJ32cHnX0vAGoKgaV6sRi8NZSXE6W5l
   YC4MonwtazC+7OxX/5S33SUJWdzxms//kJhaToFmZlNLn1FGjKa+FrmOp
   6W/dzNuryKW04/Ngj8KoYaPBaTJJuZ2fcbK+2rhhxftMZ0R20UUvs0pbU
   QqP6AueL0b1vOskRIOBN4bb8T3VLvnGSxeAaTZeBHiMEijd+bDDFfmLbh
   w==;
X-CSE-ConnectionGUID: NQsy1rSHS86u/EmJGQWvNQ==
X-CSE-MsgGUID: NLtsa3dEQqiAT6My/DmfbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="69830124"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="69830124"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 04:44:35 -0800
X-CSE-ConnectionGUID: 3O17MH7RQ7+C4yKmqqPOuA==
X-CSE-MsgGUID: SFbPdpXnQzKay04K6jio4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="212809088"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.14])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 04:44:31 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 28 Jan 2026 14:44:27 +0200 (EET)
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
cc: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
    Hans de Goede <hansg@kernel.org>, matthew.brost@intel.com, 
    rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com, 
    airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com
Subject: Re: [PATCH 4/5] drm/xe/vsec: Crescent Island PMT decode
In-Reply-To: <20260127182418.640701-11-michael.j.ruhl@intel.com>
Message-ID: <23e9c303-7947-55bc-d35a-1fbc62b10b4e@linux.intel.com>
References: <20260127182418.640701-7-michael.j.ruhl@intel.com> <20260127182418.640701-11-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 27 Jan 2026, Michael J. Ruhl wrote:

> Crescent Island (CRI) has different index and offset values for
> accessing the PMT data area.
> 
> Update the decode path to support the CRI device.
> 
> Update the data read callback so to support the CRI usage.
> 
> Define several magic numbers.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vsec.c | 114 +++++++++++++++++++++++++++++------
>  1 file changed, 96 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index 254f7ebca6eb..4bddc22d86c7 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -116,10 +116,27 @@ static struct intel_vsec_platform_info xe_vsec_info[] = {
>  #define GUID_CAP_TYPE		GENMASK(29, 28)
>  #define GUID_RECORD_ID		GENMASK(31, 30)
>  
> -#define PUNIT_TELEMETRY_OFFSET		0x0200
> -#define PUNIT_WATCHER_OFFSET		0x14A0
> -#define OOBMSM_0_WATCHER_OFFSET		0x18D8
> -#define OOBMSM_1_TELEMETRY_OFFSET	0x1000
> +#define BMG_IDX_TELEM_PUNIT		0x00
> +#define BMG_IDX_TELEM_OOBMSM		0x01
> +#define BMG_IDX_CRASHLOG_PUNIT		0x02
> +#define BMG_IDX_CRASHLOG_OOBMSM		0x04
> +
> +#define BMG_PUNIT_TELEMETRY_OFFSET	0x0200
> +#define BMG_PUNIT_WATCHER_OFFSET	0x14A0
> +#define BMG_OOBMSM_0_WATCHER_OFFSET	0x18D8
> +#define BMG_OOBMSM_1_TELEMETRY_OFFSET	0x1000
> +
> +#define CRI_IDX_TELEM_DISCOVERY		0x00
> +#define CRI_IDX_TELEM_PUNIT		0x01
> +#define CRI_IDX_TELEM_OOBMSM		0x02
> +#define CRI_IDX_CRASHLOG_PUNIT		0x03
> +#define CRI_IDX_CRASHLOG_OOBMSM		0x04
> +
> +#define CRI_PUNIT_TELEMETRY_OFFSET	0x0200
> +#define CRI_PUNIT_WATCHER_OFFSET	0x00A0
> +#define CRI_OOBMSM_0_WATCHER_OFFSET	0x04F8
> +#define CRI_OOBMSM_1_TELEMETRY_OFFSET	0x1800
> +#define CRI_PUNIT_CRASHLOG_OFFSET	0x0660
>  
>  enum record_id {
>  	PUNIT,
> @@ -133,44 +150,81 @@ enum capability {
>  	WATCHER,
>  };
>  
> -static int xe_guid_decode(u32 guid, int *index, u32 *offset)
> +static int bmg_guid_decode(u32 guid, int *index, u32 *offset)
>  {
>  	u32 record_id = FIELD_GET(GUID_RECORD_ID, guid);
>  	u32 cap_type  = FIELD_GET(GUID_CAP_TYPE, guid);
> -	u32 device_id = FIELD_GET(GUID_DEVICE_ID, guid);
>  
> -	if (device_id != BMG_DEVICE_ID)
> -		return -ENODEV;
> +	*offset = 0;
>  
> -	if (cap_type > WATCHER)
> +	if (cap_type == CRASHLOG) {
> +		*index = record_id == PUNIT ? BMG_IDX_CRASHLOG_PUNIT : BMG_IDX_CRASHLOG_OOBMSM;
> +		return 0;
> +	}
> +
> +	switch (record_id) {
> +	case PUNIT:
> +		*index = BMG_IDX_TELEM_PUNIT;
> +		if (cap_type == TELEMETRY)
> +			*offset = BMG_PUNIT_TELEMETRY_OFFSET;
> +		else
> +			*offset = BMG_PUNIT_WATCHER_OFFSET;
> +		break;
> +
> +	case OOBMSM_0:
> +		*index = BMG_IDX_TELEM_OOBMSM;
> +		if (cap_type == WATCHER)
> +			*offset = BMG_OOBMSM_0_WATCHER_OFFSET;
> +		break;
> +
> +	case OOBMSM_1:
> +		*index = BMG_IDX_TELEM_OOBMSM;
> +		if (cap_type == TELEMETRY)
> +			*offset = BMG_OOBMSM_1_TELEMETRY_OFFSET;
> +		break;
> +	default:
>  		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int cri_guid_decode(u32 guid, int *index, u32 *offset)
> +{
> +	u32 record_id = FIELD_GET(GUID_RECORD_ID, guid);
> +	u32 cap_type  = FIELD_GET(GUID_CAP_TYPE, guid);
>  
>  	*offset = 0;
>  
>  	if (cap_type == CRASHLOG) {
> -		*index = record_id == PUNIT ? 2 : 4;
> +		if (record_id == PUNIT) {
> +			*index = CRI_IDX_CRASHLOG_PUNIT;
> +			*offset = CRI_PUNIT_CRASHLOG_OFFSET;
> +		} else {
> +			*index = CRI_IDX_CRASHLOG_OOBMSM;
> +		}
>  		return 0;
>  	}
>  
>  	switch (record_id) {
>  	case PUNIT:
> -		*index = 0;
> +		*index = CRI_IDX_TELEM_PUNIT;
>  		if (cap_type == TELEMETRY)
> -			*offset = PUNIT_TELEMETRY_OFFSET;
> +			*offset = CRI_PUNIT_TELEMETRY_OFFSET;
>  		else
> -			*offset = PUNIT_WATCHER_OFFSET;
> +			*offset = CRI_PUNIT_WATCHER_OFFSET;
>  		break;
>  
>  	case OOBMSM_0:
> -		*index = 1;
> +		*index = CRI_IDX_TELEM_OOBMSM;
>  		if (cap_type == WATCHER)
> -			*offset = OOBMSM_0_WATCHER_OFFSET;
> +			*offset = CRI_OOBMSM_0_WATCHER_OFFSET;
>  		break;
>  
>  	case OOBMSM_1:
> -		*index = 1;
> +		*index = CRI_IDX_TELEM_OOBMSM;
>  		if (cap_type == TELEMETRY)
> -			*offset = OOBMSM_1_TELEMETRY_OFFSET;
> +			*offset = CRI_OOBMSM_1_TELEMETRY_OFFSET;
>  		break;
>  	default:
>  		return -EINVAL;
> @@ -179,12 +233,30 @@ static int xe_guid_decode(u32 guid, int *index, u32 *offset)
>  	return 0;
>  }
>  
> +static int xe_guid_decode(u32 guid, int *index, u32 *offset)
> +{
> +	u32 cap_type  = FIELD_GET(GUID_CAP_TYPE, guid);
> +	u32 device_id = FIELD_GET(GUID_DEVICE_ID, guid);
> +
> +	if (cap_type > WATCHER)
> +		return -EINVAL;
> +
> +	if (device_id == BMG_DEVICE_ID)
> +		return bmg_guid_decode(guid, index, offset);
> +
> +	if (device_id == CRI_DEVICE_ID)
> +		return cri_guid_decode(guid, index, offset);
> +
> +	return -ENODEV;
> +}
> +
>  int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, loff_t user_offset,
>  		      u32 count)
>  {
>  	struct xe_device *xe = pdev_to_xe_device(pdev);
> -	void __iomem *telem_addr = xe->mmio.regs + BMG_TELEMETRY_OFFSET;
>  	u32 cap_type = FIELD_GET(GUID_CAP_TYPE, guid);
> +	u32 device_id = FIELD_GET(GUID_DEVICE_ID, guid);
> +	void __iomem *telem_addr = xe->mmio.regs;
>  	u32 mem_region;
>  	u32 offset;
>  	int ret;
> @@ -193,6 +265,11 @@ int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, loff_t user_off
>  	if (ret)
>  		return ret;
>  
> +	if (device_id == BMG_DEVICE_ID)
> +		telem_addr += BMG_TELEMETRY_OFFSET;
> +	else
> +		telem_addr += CRI_TELEMETRY_OFFSET;
> +
>  	telem_addr += offset + user_offset;
>  
>  	guard(mutex)(&xe->pmt.lock);
> @@ -217,6 +294,7 @@ int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, loff_t user_off
>  	xe->soc_remapper.set_telem_region(xe, mem_region);
>  
>  	memcpy_fromio(data, telem_addr, count);
> +

A stray change.

>  	xe_pm_runtime_put(xe);
>  
>  	return count;
> 

-- 
 i.

