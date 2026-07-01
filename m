Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D38347A0DA;
	Wed,  1 Jul 2026 11:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782905412; cv=none; b=rxKnS2EBnsBb+O8EbLQUumnN2JugzXji4b8ISKd341xLbR2x8uFqxQqXYCnTYMyLCkNUafXHYqaQL1TUU16Ry2RioLfVHdsOesSmmcxq/NQCwBOdYL907cpx6vUMfy0+WYidK5UCiPVv6UX0RWeLneSMzXD52bwhG2vteMRi8qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782905412; c=relaxed/simple;
	bh=MyAO8FBn9BjOV6dKHswlRU01JeY4HiRtXakRGRX06V4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GCk1Bnz8QvAbuNRgINXAkrQ/3EYsgiPH9cbi/oZS0w7al3EH00xximq6skzsOui4YAUe43XvfEOv74ykXxhcVQVW4WOBDhbWbTm8YOtv0DxvrGViy9n6eIOzNO3VnOxz3HQ+ZNkyjR/bClOb3tbouKVtE72i+t8rLKWQrO7V1EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ThNHnWSS; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ThNHnWSS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782905409; x=1814441409;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=MyAO8FBn9BjOV6dKHswlRU01JeY4HiRtXakRGRX06V4=;
  b=ThNHnWSSW76fM5QTXrWjgoW5nM7wlhkH12o/5vDkpdxfIXM1cHBDzK0D
   k4mrZuq/mvmOEwhJrR51oACnjYzJQvvNr1lOgl650Tbn2zTI2sYCzd2Ei
   jVDOnhQnQE/vRf4R3vDhSUw0nAn/f3oe58bImmiTnbr8TM4hg8XI084d4
   CI32Lc1/vo2UFbq4NenUI4aFBiOGsAclfp9Rk9jdgR5Q+Jb+Ipdf+0VyK
   RXY+mknr3SSxWMf8iXzv1PRaVkZWo9QkpUKGrCGocWGfwlOoGmAMefYBR
   +N3JS0m2tDki0iX0wFX/zOzZQ3psUiRLmkvmQbxfPRJwUwxFJE43YDMcQ
   Q==;
X-CSE-ConnectionGUID: 6+H50OuNRJC8bN2U2b5z6Q==
X-CSE-MsgGUID: IpPcKrQISwufURxPo71vJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="87548603"
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; 
   d="scan'208";a="87548603"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 04:30:08 -0700
X-CSE-ConnectionGUID: 0+U6qhDTSMWWITUY69XwOg==
X-CSE-MsgGUID: 5x6RdIYDScqTJzXCJyHgHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; 
   d="scan'208";a="248568056"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.83])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 04:30:05 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D . Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
 Hans de Goede <hansg@kernel.org>, Ahmed Yaseen <yaseen@ghoul.dev>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260519181155.46044-1-yaseen@ghoul.dev>
References: <20260519181155.46044-1-yaseen@ghoul.dev>
Subject: Re: [PATCH v3 0/1] asus-armoury: gate PPT writes on active fan
 curves
Message-Id: <178290539986.22449.13539651089589385334.b4-ty@b4>
Date: Wed, 01 Jul 2026 14:29:59 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Tue, 19 May 2026 18:12:04 +0000, Ahmed Yaseen wrote:

> My first kernel patch series, posted in agreement with Denis Benato (Cc'd).
> 
> On 30 ASUS ROG laptop models flagged with requires_fan_curve in the
> asus-armoury DMI power_data table, the BIOS ACPI method SPLX silently
> discards Package Power Tracking (PPT) writes unless the fan mode is
> set to Manual (FANM=4). FANM is set to 4 by the DEFC method when a
> custom fan curve is written. Until then, the WMI DEVS call returns
> success but the firmware ignores the value, so userspace sees no
> effect from writes to ppt_pl1_spl, ppt_pl2_sppt, ppt_pl3_fppt,
> ppt_apu_sppt or ppt_platform_sppt.
> 
> [...]

Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

FYI [if applicable to your patch], as per Linus' policy change, also
fixes are mostly routed through for-next unless the fix is for a
commit introduced in the most recent or clearly a regression fix.

The list of commits applied:
[1/1] platform/x86: asus-armoury: gate PPT writes behind active fan curve
      commit: 4799d62294366557277a02220fd5d47804d98f5b

--
 i.

