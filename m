Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6333750A2;
	Tue, 24 Mar 2026 17:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774373477; cv=none; b=MaJ+/faCDiDfOfjGihz1ehdX91rhFIEU1dXprc7NX4oQcGgG6OdkjS80bz9Wm9e5/gi04fHRbyP9oxNi8dAEWD7O7Mk4ytOOeRMse6M0NRhut/nDPYTDESMJRJEoRaXYjdudBTYVZshLmwFHRdFT6mdni91ZQuyc2zbbisgTcTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774373477; c=relaxed/simple;
	bh=hvx/y9o+W5PI0DlC1U4k+cqFwMw5Zao41uzcC3KinUI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=l745PM2YhCn/m75mWYj6VwYlMLZG1C+GFk4hHcYOmTLp4gCH17dcuuIlTrNiz++yXXFVh1rCjrbPG/enVN2WSm/rEHiynkShBy+j+jA9y2KNWCHp7sVluvk7tmlmZXC3aoiJ+VKTECSvY4asTeqOCrDrE36bJ5swXzjAx2yPEXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jbCLpeSP; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jbCLpeSP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774373477; x=1805909477;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=hvx/y9o+W5PI0DlC1U4k+cqFwMw5Zao41uzcC3KinUI=;
  b=jbCLpeSPOYuR9MFWMZzc9T9zIDCTWLtHK0tmRkNqmFIq7BFUe/0hBTw7
   ZjtF6g7S+onm4Ye7ihLzAn9FMrEF4lb7FwzDS3SiN+TKsRrkgmFGpke4H
   JPjZMROpspE16YtgcDJFbarK/nXmAk8v8rGsyMMoGR2a1wdWoKnxNV0KX
   Lp//3mKAWLGcLYmFQtR+891wL0B6vRwOe6ArmemsJbjbac0ZNhnqRbNV0
   5C1OxFRBjX5cycAXt1mOg4fJX7QlIzM5ohRV8Ia9sPmmqqOUu73pqiIXr
   yplt3EPwUeDE8Jzs1QbEATkOs6zOI6+XM7VprtdcERkxNXRALA7/7kkSO
   g==;
X-CSE-ConnectionGUID: wjqhaUl1RoGPhqZzTKNYDg==
X-CSE-MsgGUID: 0uQZ4yc1SU6zgSWErOIIuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="100848088"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="100848088"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 10:31:16 -0700
X-CSE-ConnectionGUID: pEMwiVwpQIyz3qTH6qIw5A==
X-CSE-MsgGUID: 6ye6a4x/TGeG/rG0Yv76Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="219996974"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.217])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 10:31:12 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-kernel@vger.kernel.org, Denis Benato <denis.benato@linux.dev>
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
 "Luke D . Jones" <luke@ljones.dev>, Mateusz Schyboll <dragonn@op.pl>, 
 Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <20260302174431.349816-1-denis.benato@linux.dev>
References: <20260302174431.349816-1-denis.benato@linux.dev>
Subject: Re: [PATCH v3 0/2] platform/x86: asus-wmi: fix screenpad
 brightness/power management
Message-Id: <177437346747.18408.2594412181035494435.b4-ty@linux.intel.com>
Date: Tue, 24 Mar 2026 19:31:07 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Mon, 02 Mar 2026 18:44:29 +0100, Denis Benato wrote:

> Fix up some inconsistent behaviour involving the screenpad on some
> ASUS laptops. This fixes:
> - illogical screen off control (0/1 flipped depending on WMI state)
> - bad brightness depending on the last screenpad power state
> - incorrect brightness scaling
> 
> Changelog:
> - v1
>   - Initial submission
> - v2
>   - Split patch in two
>   - Remove a redundant variable copy
> - v3
>   - Fix variable declaration (reverse x-mas tree)
>   - Change commit message of 2/2 to reflect the actual change
>   - Add "Fixes" tag to both patches
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/2] platform/x86: asus-wmi: adjust screenpad power/brightness handling
      commit: 034f5efd362fb87a3970d61eaf982664f84e6c5a
[2/2] platform/x86: asus-wmi: fix screenpad brightness range
      commit: fab7c51693e95aa874d6d9db22bfae7bd0b23c66

--
 i.

