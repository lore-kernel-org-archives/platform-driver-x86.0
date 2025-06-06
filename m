Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B06084039
	for <platform-driver-x86@vger.kernel.org>; Fri,  6 Jun 2025 21:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749244862; cv=none; b=OFPHid8IpiJm6J1cNuYKRBbQiqhxJgvszEW7e9xOTLPdMWawPtBxYR+jSD6uW7sRlhQAjViHhOjnvk5HkGm3KnX6yXt1CmCYz3d9ZPsVx86QujouGPuuzViBYw/hnEgzFB9N/ZTvm3phnhz55THQSbuOA8UTS9qiJTFJb/G9d1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749244862; c=relaxed/simple;
	bh=vRjWLSLcyuhidZvehjR1ipqVjQEEVFJ8+0ujt+ex2iw=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SqUA+6eurVlO8kJkaxO3IAuVJ+4qNocMCMk2rSzzie6javDoL1i/FsdJZnnPyi1UoMV88gV2q0gW98oyUH1i80q9rAETdxJDBV0COTNVV/OnJAmOgyAXxvDdzni4poIt87UQpWhuBo36QQTTUm88zwSldX6vkMTD7yCrGJ8OPfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VEDbSuHP; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VEDbSuHP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749244862; x=1780780862;
  h=message-id:subject:from:reply-to:to:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=vRjWLSLcyuhidZvehjR1ipqVjQEEVFJ8+0ujt+ex2iw=;
  b=VEDbSuHPaVk7GLVOybPql4lAT/nh+AvTn5TzMgWfXi0fZ0rCya/s0QNM
   PYLgSt1kesWXF+bmZwX0h5jooM+R/hyE8c+2BJrnl5hSTeEoAf8+x2/hU
   uWZMhjzg7pMWCQ0mEEFD1Ive+HA5lpHvraZMqAJFTt4uLN0kyzTdsxZp/
   Y8ACQ8IZuufe+eHdGDeWxDcr6KDKLsiebKKGa5g3txkqkDuAaAsQxnhqs
   F5/5dMmicT4xmFSL59YjCDyhwSaMVzuPl3W1hUYORhyQAyKax62bJ4ZhP
   t9UBQuoFH1SPZBn5QVsoWJsmMr8kAmxMHbQt08d1V7ZAoUriaisdn5Lzc
   w==;
X-CSE-ConnectionGUID: 8HlMuoG8TTO012r+a3RA1w==
X-CSE-MsgGUID: gnYmNo58QWK01m270OMKEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="51500077"
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; 
   d="scan'208";a="51500077"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 14:21:01 -0700
X-CSE-ConnectionGUID: bmMn6acASX65PM2T8lgPpg==
X-CSE-MsgGUID: XDNaHgEcTXSsImD8770sMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; 
   d="scan'208";a="176810209"
Received: from aschofie-mobl2.amr.corp.intel.com ([10.124.222.251])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 14:21:00 -0700
Message-ID: <57730404f39eab74df30dcc575495879972324ef.camel@linux.intel.com>
Subject: Re: [PATCH v3 05/11] platform/x86/intel/pmt: use guard(mutex)
From: "David E. Box" <david.e.box@linux.intel.com>
Reply-To: david.e.box@linux.intel.com
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>, 
 platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 lucas.demarchi@intel.com,  rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, airlied@gmail.com,  simona@ffwll.ch
Date: Fri, 06 Jun 2025 14:20:59 -0700
In-Reply-To: <20250605184444.515556-6-michael.j.ruhl@intel.com>
References: <20250605184444.515556-1-michael.j.ruhl@intel.com>
	 <20250605184444.515556-6-michael.j.ruhl@intel.com>
Organization: David E. Box
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2025-06-05 at 14:44 -0400, Michael J. Ruhl wrote:
> Update the mutex paths to use the new guard() mechanism.
>=20
> With the removal of goto, do some minor cleanup of the current logic
> path.
>=20
> Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
> =C2=A0drivers/platform/x86/intel/pmt/crashlog.c | 32 +++++++++++---------=
---
> =C2=A01 file changed, 15 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c
> b/drivers/platform/x86/intel/pmt/crashlog.c
> index e997fc48b9ce..94858bfb52f8 100644
> --- a/drivers/platform/x86/intel/pmt/crashlog.c
> +++ b/drivers/platform/x86/intel/pmt/crashlog.c
> @@ -155,9 +155,9 @@ enable_store(struct device *dev, struct device_attrib=
ute
> *attr,
> =C2=A0	if (result)
> =C2=A0		return result;
> =C2=A0
> -	mutex_lock(&entry->control_mutex);
> +	guard(mutex)(&entry->control_mutex);
> +
> =C2=A0	pmt_crashlog_set_disable(&entry->entry, !enabled);
> -	mutex_unlock(&entry->control_mutex);
> =C2=A0
> =C2=A0	return count;
> =C2=A0}
> @@ -189,26 +189,24 @@ trigger_store(struct device *dev, struct
> device_attribute *attr,
> =C2=A0	if (result)
> =C2=A0		return result;
> =C2=A0
> -	mutex_lock(&entry->control_mutex);
> +	guard(mutex)(&entry->control_mutex);
> =C2=A0
> =C2=A0	if (!trigger) {
> =C2=A0		pmt_crashlog_set_clear(&entry->entry);
> -	} else if (pmt_crashlog_complete(&entry->entry)) {
> -		/* we cannot trigger a new crash if one is still pending */
> -		result =3D -EEXIST;
> -		goto err;
> -	} else if (pmt_crashlog_disabled(&entry->entry)) {
> -		/* if device is currently disabled, return busy */
> -		result =3D -EBUSY;
> -		goto err;
> -	} else {
> -		pmt_crashlog_set_execute(&entry->entry);
> +		return count;
> =C2=A0	}
> =C2=A0
> -	result =3D count;
> -err:
> -	mutex_unlock(&entry->control_mutex);
> -	return result;
> +	/* we cannot trigger a new crash if one is still pending */
> +	if (pmt_crashlog_complete(&entry->entry))
> +		return -EEXIST;
> +
> +	/* if device is currently disabled, return busy */
> +	if (pmt_crashlog_disabled(&entry->entry))
> +		return -EBUSY;
> +
> +	pmt_crashlog_set_execute(&entry->entry);
> +
> +	return count;
> =C2=A0}
> =C2=A0static DEVICE_ATTR_RW(trigger);
> =C2=A0

Don't see include for cleanup.h. If add then

Reviewed-by: David E. Box <david.e.box@linux.intel.com>

