Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DD354856A;
	Wed,  9 Sep 2026 13:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788961494; cv=none; b=JTLPnYNBigTGPCtkfI/qNPxca1JppxbXNTbmc7Ugiod/5xf0nCovAhoAGZsvK6l++YlS294FNHAqtppRLTOf7W5+OdzDIrYcEKnCV87PM4OTH6qKIzYzQVP8UEf9NehqruxaiJKAtoHt2vSMIJJjN1DUPa79HffQiKOBKVC+ajk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788961494; c=relaxed/simple;
	bh=MPqiRkGlZVTX++ODXxfaXxun80PggglEafJxYTlEUik=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kjTC5z+Lx1NRKy7CBSoWSmE6h5cPJL/bGd4MFCu3Sljmsi29RzUf8LBPmd2pYntX+7Uurcg0e/sLvlVKu1czG0HxAa4HCkqRKAYBv98Poptu0rQdurj3LdCsU1M0OtyXgtaGHBuf/UePSidy9YZh0pKZI1k9n613fBRCW4UCN28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f8z0lT6h; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f8z0lT6h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788961492; x=1820497492;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=MPqiRkGlZVTX++ODXxfaXxun80PggglEafJxYTlEUik=;
  b=f8z0lT6hqcfRizimUdcch3S2bzPqoseTG/on8vaXzT34VrFI86ZLS5n+
   T2X7Ad5zTbv7W4PaLkSno5bp701Je8KUWCdToOD8VYAFGZDPr/l5JwXy3
   0Rb5Ap2FCSzsm7CZ5UOcdJqYr9rwWzJimdAPH4yJpZ9AYeTCXaEZbfcKe
   htsr6XRe8fJxVbfhI16Ab4yeG6HOkAiaOt4ekQhFTNsuK/a+CmSimGyCr
   w12Neu40K/7WPuTIG1+tyA8VKDwi4ML1+BL2dnMSiHML/8hAsVRqkmQB2
   XksZaL/OlB9VDfWNy5Q5jTJ0Qn1VZDk+p3fzOld8+tU4//wssFXlEh6Bd
   g==;
X-CSE-ConnectionGUID: PHNIkY1aRK2tWR7CUq1YHQ==
X-CSE-MsgGUID: hqu/sv/hTM60+hreZwnKlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="106758127"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="106758127"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 06:44:52 -0700
X-CSE-ConnectionGUID: q9FakGyGScS13XMsOhc7hg==
X-CSE-MsgGUID: DWlK9O5HSaeAfo5wGo9ezQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="269978349"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.78])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 06:44:49 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Antheas Kapenekakis <lkml@antheas.dev>, 
 Hans de Goede <hansg@kernel.org>, linux-kernel@vger.kernel.org, 
 Gabriel Windlin <gawindlin@gmail.com>
Cc: platform-driver-x86@vger.kernel.org
In-Reply-To: <20260908203412.608606-1-gawindlin@gmail.com>
References: <20260908203412.608606-1-gawindlin@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: fix sysfs-platform-ayaneo-ec
 documentation path
Message-Id: <178896148417.3928.3977515235268287434.b4-ty@b4>
Date: Wed, 09 Sep 2026 16:44:44 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Tue, 08 Sep 2026 22:34:11 +0200, Gabriel Windlin wrote:

> The documentation file for the AYANEO platform EC driver was added as
> Documentation/ABI/testing/sysfs-platform-ayaneo-ec, but MAINTAINERS
> references it without the '-ec' suffix, causing 'make refcheckdocs'
> to report a broken reference.
> 
> Update the file entry to point to the correct file name.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] MAINTAINERS: fix sysfs-platform-ayaneo-ec documentation path
      commit: d144a494d81fcf2d1c5cf58b01c655bb8bafc701

--
 i.

