Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4D93D6CDA;
	Fri, 12 Jun 2026 12:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781269192; cv=none; b=DNGmESaOJVOD1lpwP2lVoNnUQFBpDXaBtENekYvodAFfjEl1Vm4w5OjA/+0JWoH8uvnHC8ZtcLJ+EkOSqpx66TPCsrqXNMjq/IaRojLYPRnE7gUvdKLHyAUXfeIv+bAOl1wwQjRd4itzwECiTpc5SM9IqsppcdZ2JVQou4eQyBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781269192; c=relaxed/simple;
	bh=3SwO3p9xhb/mXlZpTXNulqouRpxqxG2dEwpqcB6qs5w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Jajd8aqqUSs1D4N5qZY+HWShBzMGhezEDE4K/XhVxGVxNFjPNXt0+tcXDUfRY1gxvBmTVh/6/yWZYsbIVP1IUDguds9fab9t2N+rIfayS7lbYW7iRYwqGRLuT4JGFIxiPpVqEwgY6SESILoSmnYe5ZYByLiDRids7XEtB0f/2qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dzCveU/O; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dzCveU/O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781269191; x=1812805191;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=3SwO3p9xhb/mXlZpTXNulqouRpxqxG2dEwpqcB6qs5w=;
  b=dzCveU/OuW4c7TuwqS4nVX+5YHB2KzIFQBLNfZOIqoBSereshkZJG8xD
   SQAwZBTKrzpbqvE/9a9kjjm66LpnSUvmEQflnHA1+psCwJBXVnydEKGYA
   7NAIqjbQY7HjrBbeal1N3Jwo6NmcvHLtKxmDYTJ39FUe7Qwlyj6z3zT4w
   dKnogqKhAao7jlTmbAPOEgcYwsou+0A8x88EpuyjHVEa6dg/K6ixJqEBv
   l1snPflpuAid2hBnTAqeOlQ2ILf5MpBixOx53m5vsABParPcZJ0cV9eIs
   IKLHs7xuYdXXRviagF8enc51cNk3blM1QKsyNsAgZDmcvzXfVGxBtDWhl
   g==;
X-CSE-ConnectionGUID: wdbJcHauQf6bmTHkd7DZ/A==
X-CSE-MsgGUID: NH7gkP4eQ+CpGE+nRhkviQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="99674613"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="99674613"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 05:59:47 -0700
X-CSE-ConnectionGUID: nqZCXMJ1Rk+hbnBTDfA+6g==
X-CSE-MsgGUID: TUv5gK83SN+ITFcZmzRibQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="251104471"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.78])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 05:59:44 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-kernel@vger.kernel.org, Denis Benato <denis.benato@linux.dev>
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
 "Luke D . Jones" <luke@ljones.dev>, Mateusz Schyboll <dragonn@op.pl>, 
 Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <20260612121008.970269-1-denis.benato@linux.dev>
References: <20260612121008.970269-1-denis.benato@linux.dev>
Subject: Re: [PATCH v2 0/3] platform/x86: asus-armoury: more ppt data
Message-Id: <178126917865.25572.18004197770360275927.b4-ty@b4>
Date: Fri, 12 Jun 2026 15:59:38 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Fri, 12 Jun 2026 12:10:05 +0000, Denis Benato wrote:

> This patch series adds support for three more ASUS models to the asus-armoury driver:
> the GA402NJ, GA403UM, and FX608JPR.
> 
> Cheers!
> 
> Changelog:
> - v1
>   - Initial submission
> - v2
>   - Fix order of FX608JPR
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/3] platform/x86: asus-armoury: add support for GA402NJ
      commit: 0b38a42bf59fc3ba97dd6f02bfc257dffa0e1d6d
[2/3] platform/x86: asus-armoury: add support for GA403UM
      commit: a0bb64f3170adccb5780cf8778e601392d94f244
[3/3] platform/x86: asus-armoury: add support for FX608JPR
      commit: 72dd918bbe008d64a2c2352bdf14671f1ac068c7

--
 i.

