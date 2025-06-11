Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B0529B217
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Jun 2025 10:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749638771; cv=none; b=aOH/N0x+yoKWnlcJlGfWw2QmxyyTq4yjNLuU0UR5OLuUQQDCeIySzrQJbhXDh44P+Uxg1+gTM/btuYeZgoJ429rWcmvMTigPpXnGJm9MPdcOWJgwcLit9d2YSMjoz2Tbx5gF/69Cnk6jtVE2ijJLQJ0ON38POLkM6wmPGOjLSGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749638771; c=relaxed/simple;
	bh=fKzQ6/PxMRvg6pvmN0Jg2JkCgKPX7E5u70SSFZzZ0o8=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=frYcLmRXaV7+1txfMgHfeFcMKOHON8vAmrhmANbqOc/ArmdYMZU5VjE+n8RzNXf3Rbq0WInWm/5hHdiHs5WmiaMlXmAKx01aaO0NM6GuXH/+QMvx/IQdlozuBEkPKvawhR9zYBvRRN/pXUWEbVUGUytQcYWuhTShf23PjchjiAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KxEHPy0w; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KxEHPy0w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749638770; x=1781174770;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=fKzQ6/PxMRvg6pvmN0Jg2JkCgKPX7E5u70SSFZzZ0o8=;
  b=KxEHPy0w11r5s2FsoNs2NiEWsJTXdp6AMJpFNTaw0JlvlNvcBJApie0V
   4cq8dMvshrVEm5G59YPp/R8D+56sOWD87AvDyEZbeW0pyb/2aNeHYpTfH
   R9Qg5xRA+KpCHuX9EDBfcCMdrn618qCoum2gDnRJrhd5BB0QSk25s+ZXL
   lUbWvX4fXtoWa6ZFs3fgsGJqNEE/W1D7T58QEgjLGSBvnX5PDe8LOJ5DE
   rp2GS+loCv1n4ICVgsh09X9F64Cr7rG+NTaks3zhydOWMAPjRUIVzBOEh
   RqVR+O7ERboU+tHgbcbOtACTx9Xh0YceO1KgVOncV4qXsem51HQfza7UB
   g==;
X-CSE-ConnectionGUID: VGdrDSBuRkWDencLUl2wBQ==
X-CSE-MsgGUID: OLg2KVPqS/609he3v7wCUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="50998751"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="50998751"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 03:46:09 -0700
X-CSE-ConnectionGUID: lJza57DAS/q9quE94dXNVw==
X-CSE-MsgGUID: ZJdwZc6MRFaoG7xzDAuWsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="147652734"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.183])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 03:46:06 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 11 Jun 2025 13:46:02 +0300 (EEST)
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
cc: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
    Hans de Goede <hdegoede@redhat.com>, lucas.demarchi@intel.com, 
    rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com, 
    airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com
Subject: Re: [PATCH v4 05/10] platform/x86/intel/pmt: re-order trigger
 logic
In-Reply-To: <20250610211225.1085901-6-michael.j.ruhl@intel.com>
Message-ID: <3f0c7164-7cef-a8b2-e989-ccc58e0ef592@linux.intel.com>
References: <20250610211225.1085901-1-michael.j.ruhl@intel.com> <20250610211225.1085901-6-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-584342154-1749638762=:957"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-584342154-1749638762=:957
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 10 Jun 2025, Michael J. Ruhl wrote:

> Setting the clear bit or checking the complete bit before checking to
> see if crashlog is disabled seems incorrect.
>=20
> Check disable before accessing any other bits.
>=20
> Reviewed-by: David E. Box <david.e.box@linux.intel.com>
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/platform/x86/intel/pmt/crashlog.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform=
/x86/intel/pmt/crashlog.c
> index 1525e702e993..3d3b72451c01 100644
> --- a/drivers/platform/x86/intel/pmt/crashlog.c
> +++ b/drivers/platform/x86/intel/pmt/crashlog.c
> @@ -192,6 +192,10 @@ trigger_store(struct device *dev, struct device_attr=
ibute *attr,
> =20
>  =09guard(mutex)(&entry->control_mutex);
> =20
> +=09/* if device is currently disabled, return busy */
> +=09if (pmt_crashlog_disabled(&entry->entry))
> +=09=09return -EBUSY;
> +
>  =09if (!trigger) {
>  =09=09pmt_crashlog_set_clear(&entry->entry);
>  =09=09return count;
> @@ -201,10 +205,6 @@ trigger_store(struct device *dev, struct device_attr=
ibute *attr,
>  =09if (pmt_crashlog_complete(&entry->entry))
>  =09=09return -EEXIST;
> =20
> -=09/* if device is currently disabled, return busy */
> -=09if (pmt_crashlog_disabled(&entry->entry))
> -=09=09return -EBUSY;
> -
>  =09pmt_crashlog_set_execute(&entry->entry);
> =20
>  =09return count;
>=20

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-584342154-1749638762=:957--
