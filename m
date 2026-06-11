Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1394E3FBA7;
	Thu, 11 Jun 2026 15:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781190204; cv=none; b=gO3vFpzEUNcGFprXGDGP3Wh6fMWsaGJbbK0pgvetLLxtDVCtvhoIt9YH4isl9JAT1bb0Wi38t6/l0KAxn8MIUkcGedQxumbxGML8hW/Vny24X5YM0C2PQ2I9BpUqUUkZdQE3ZWDX0BYhANDm5Ko2wsd9Y4M8QUxT6GCaMVwk4Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781190204; c=relaxed/simple;
	bh=TOIJym9207s/e50wwiummfAWrphXdM5ZYZNquStVzlw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lUhDt51WN+CIWuEX3gnDIsXTYqTneYzAXt+p3Mh2w6i7Qkg4adN/huyAqGYCWc172REH3JmIEnJGqgm8Nb2s7gsMZC1Zz0Plulk2Tx8t+8mAiGM92bxg51mggAWYJVIgagv8WZ/MnecCO6x9pCr5ZXbCILFa9iXymmG8hLvDyg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OGilr2Lp; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OGilr2Lp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781190203; x=1812726203;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=TOIJym9207s/e50wwiummfAWrphXdM5ZYZNquStVzlw=;
  b=OGilr2Lpte6nv8o8fL0UkBvSeO4iv3dztp72z9+b/xT/vJjERqgVZvcL
   bmTcFtCRDrhhu9Hh7gNGt+sMSnIJxN0iCaTJ1mIKxh8gGCTF42Z/GxLo6
   AvSg4E2J9w1NmZjvku/eExkY/tOKHw4wRu5SrxLiH5Vr4vncaGSs4cVGN
   TmPs71lusPem8pS5GlDq7Aoa8b7eGNWHk8ZiiDD8meC5AxVA9pENZCZuh
   Wh0Ztmuk4qlKuZ28giNzR4sWgEwQSiustYZF3njKDdbD4nqRAhcZCpWj7
   /HLT37K51LAPmbOd01iC/m9TXoGHP84LwPhnCmg8IU8cfDzsAevZOPo17
   w==;
X-CSE-ConnectionGUID: zxYvWmHxRzC8qUhET6tRyg==
X-CSE-MsgGUID: i0UbGhK4RKmN3jnItjXieQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="69550388"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="69550388"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 08:03:10 -0700
X-CSE-ConnectionGUID: 8W27KnWgSBCvoo+Axy1qVw==
X-CSE-MsgGUID: sWhbvs4lTn+C2Sp4adixPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="284588924"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.157])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 08:03:08 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <dd6e70d3075205a1d5c1fa324db7a822f37e2349.1781101905.git.u.kleine-koenig@baylibre.com>
References: <dd6e70d3075205a1d5c1fa324db7a822f37e2349.1781101905.git.u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH v1] platform/x86: apple-gmux: Drop unused assignment of
 pnp_device_id driver data
Message-Id: <178119018256.12014.5504801489780974875.b4-ty@b4>
Date: Thu, 11 Jun 2026 18:03:02 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.2

On Wed, 10 Jun 2026 16:32:59 +0200, Uwe Kleine-König (The Capable Hub) wrote:

> The driver explicitly sets the .driver_data member of struct
> pnp_device_id to zero without relying on that value. Drop these unused
> assignments.
> 
> While touching this array use a named initializer for .id for improved
> readability and simplify the list terminator.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: apple-gmux: Drop unused assignment of pnp_device_id driver data
      commit: 01ffffc4d0bd5b44a3e5fc07ec232266a1601c45

--
 i.

