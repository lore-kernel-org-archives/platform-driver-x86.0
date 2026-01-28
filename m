Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D027D20E03F
	for <platform-driver-x86@vger.kernel.org>; Wed, 28 Jan 2026 12:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769604838; cv=none; b=mNyFsGdNsqnPXa/bBYN+gnkOVDrEAijNz+tmiyTP0a4zFapYGVttIwdxI6Jmubpuwc4Jyoi/2qRPd4GKTMChpmF6A+nTKI1xzMRmrIrTF9Kv4Hz8ynyFeKV/mC+xO62sB8PHJTKLmG0ad86UdallYZPy0RF1LKu3k77ANkP5TVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769604838; c=relaxed/simple;
	bh=W8hUdeX6FIL5g76/JV/0KH1g5czMkJrtgKhUef2UV/8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cRGhARIZbFnGOQ1ipKPq+9flNzQ25vlvHqzNqa+TcNeOGOPy13CyMHTLi+u70nvVOVN2WG9KoKPF1aRB1Q/xfl8JOzusSL5J0YajJkX6udEe4c/eRfUivXZCc8koXtyYPZ2+cH7nyex6ImUg2lU6W+HzTA1Le5/4V+NatSNdwRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WUKkIZhT; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WUKkIZhT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769604837; x=1801140837;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=W8hUdeX6FIL5g76/JV/0KH1g5czMkJrtgKhUef2UV/8=;
  b=WUKkIZhTJR4dhF85n2JnRv94SL9JfYNBEnTuRXqwrA5xu5eRy5vWjDnX
   aowICJOFNbO34AF01300EdxUuz0p7qgskH8n5FM56yxzl5908l1K25QDB
   bagjN0wdgVUd8s3ur2dl+CPRmu6Mm58rjJdxjNAqtMwTmiPQsbb77+Cyj
   GlM3A8sf42NMbVOxGcvSSai32PGuFyA+UCz+HosXI5rVuerzM4BVMI0iA
   aUtrHxIMr8LOVYFbxX+6oliqFApcJaARdp3Ojd9Q0zPsxHfBQDBB+URo7
   eKB5U9IpRxGPTPBOmLTcRy7iNXuRX8fxQScQn4xZmtR4MdWpgtmF5grNq
   Q==;
X-CSE-ConnectionGUID: YtJbg+waQWySqAX1gAlXmQ==
X-CSE-MsgGUID: i6KlwuAERmW+XkoVTxqCeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70718545"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="70718545"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 04:53:57 -0800
X-CSE-ConnectionGUID: wYqqjNGHTViEUOFt9KhfRg==
X-CSE-MsgGUID: eogrDT1JQqq9pGSsI9YU5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="238985421"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.14])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 04:53:55 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Oleksandr Shamray <oleksandrs@nvidia.com>
Cc: vadimp@nvidia.com, platform-driver-x86@vger.kernel.org
In-Reply-To: <20260128075939.2704019-1-oleksandrs@nvidia.com>
References: <20260128075939.2704019-1-oleksandrs@nvidia.com>
Subject: Re: [PATCH platform-next v3 0/2] Introduce new Nvidia systems
Message-Id: <176960482929.3025.6447604591739823494.b4-ty@linux.intel.com>
Date: Wed, 28 Jan 2026 14:53:49 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Wed, 28 Jan 2026 09:59:37 +0200, Oleksandr Shamray wrote:

> Introduce new Nvidia systems:
>   platform: mellanox: mlx-platform: Add support for new Nvidia DGX
>     system based on class VMOD0010
>   platform: mellanox: mlx-platform: Add support DGX flavor of
>     next-generation 800GB/s ethernet switch.
> 
> drivers/platform/mellanox/mlx-platform.c | 484 +++++++++++++++++++++++
>  1 file changed, 484 insertions(+)
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/2] platform: mellanox: mlx-platform: Add support for new Nvidia DGX system based on class VMOD0010
      commit: dbf76f865842de70d7fd7edbbb482778d70ba47e
[2/2] platform: mellanox: mlx-platform: Add support DGX flavor of next-generation 800GB/s ethernet switch.
      commit: 059417ea916f6d9cf80ebb3a09645856373d5ed5

--
 i.

