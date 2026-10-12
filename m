Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A028B4A49BE
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 Oct 2026 15:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791820522; cv=none; b=BWOP9Cp4oZ9bINdqHEocu/dL8MR8iThH9PYGYHARwNlbUOXF79n5gODVyrimWNfGHX4baxeO375391t9iL2NCGoi5C15Lo/3i6FomvSp+yRbVjQnAbPRBJsn5l4iu9M/i6XfhXvnK1/pgjX/wKqGJa2PYhQ64BmNnwkX9llk3RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791820522; c=relaxed/simple;
	bh=ovuNgox45hWq59JyymJnGu9Ae6ypSszirhUa+4+tRIk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pSaxtQEFARfuQg6xA9Vx+zK96x0vmfn5a9b++v791RW7vaQzcFRzwtnORjBrHdLA+fikbZ0OdZYoAPyqUVn9kG4JwfvxRrQam/TDHVcUViUMB+pW8KGryTkKfLTEnXfLjenp1c0gwsxz5Ya9a4NnSeZ75jwNPvVoacI604X2vJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KcF/1W9u; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KcF/1W9u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791820522; x=1823356522;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=ovuNgox45hWq59JyymJnGu9Ae6ypSszirhUa+4+tRIk=;
  b=KcF/1W9u9cJktIu7ptDnFfhac5dSbIuGA5CAUnYBXbFzPA8YEROHKXU7
   bIonczvLItyKYZXiFTioZdF6i/9d0OEPLV1qbsY+mr0FeClQHmIxlYqWh
   MI0TyIMyN4034NR18YP9yPbn6zPK8J7bKXOWTApgqobZh3N/ZGrZos0F4
   INy5xo0PTVrbLosPvcJLuqmYY4jrotW6oVZJopEJJu25bbS0I+i8VbjJK
   gbsvDhc3nbXP20BoQoIBpVER10tGkt+8cHU/W5+DbD6OwdmwfAQbhb0cj
   EgwsPTOniigP02/QunmapUDdo16+7YTaieOlC66UjUJsNGQx34cQSzw2o
   g==;
X-CSE-ConnectionGUID: fzxXd7+aRFyTBG8lv2B5nQ==
X-CSE-MsgGUID: PRzO4FKqTaGDSwIxTzxrYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="554489"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="554489"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 08:55:21 -0700
X-CSE-ConnectionGUID: IK5OxOyfTma++vN3WTkd0w==
X-CSE-MsgGUID: 3R+wzglpSHyVy0HECNjtRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="1117359"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.202])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 08:55:19 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Sanket.Goswami@amd.com, platform-driver-x86@vger.kernel.org
In-Reply-To: <20260929155609.1712638-1-Shyam-sundar.S-k@amd.com>
References: <20260929155609.1712638-1-Shyam-sundar.S-k@amd.com>
Subject: Re: [PATCH] platform/x86/amd/pmc: clear devm-managed pointers on
 remove to prevent stale reuse
Message-Id: <179182051446.17897.4901503579178216570.b4-ty@b4>
Date: Mon, 12 Oct 2026 18:55:14 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Tue, 29 Sep 2026 21:26:09 +0530, Shyam Sundar S K wrote:

> The driver stores its state in a single file-scope static struct
> amd_pmc_dev, which is reused on every bind. Its regbase, smu_virt_addr,
> stb_virt_addr and fch_virt_addr members are MMIO mappings created with
> devm_ioremap().
> 
> On unbind the driver core unmaps these mappings, but it does not clear
> the pointers in the static struct. Since the struct is not freed, the
> members keep pointing at the now-unmapped addresses.
> 
> [...]

Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

FYI [if applicable to your patch], as per Linus' policy change, also
fixes are mostly routed through for-next unless the fix is for a
commit introduced in the most recent cycle or is clearly a regression
fix.

The list of commits applied:
[1/1] platform/x86/amd/pmc: clear devm-managed pointers on remove to prevent stale reuse
      commit: 0f61b7cf25ba3c0a0a58dbf415643b58bcea79fc

--
 i.

