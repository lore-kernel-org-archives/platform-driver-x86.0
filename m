Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F04A2C0293;
	Tue, 30 Dec 2025 10:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767091953; cv=none; b=QJrGGCkndQ10xMi+iEg0ROosbts7kCtLdozsrnZTlToum0GNrMNISpqtdlWypU1XjyBMyQcSEZBBQsOB0mcUJ2VUpw3L32aEzIS9RMHTe5i/fqiq+yLav6SJYCjdGCHWeklC11hawbIIbh2f8e+P0N4Wqxleuetdj4OJNueFXJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767091953; c=relaxed/simple;
	bh=VDuezWAiSKHgcfjw+NSbxO/rIsPPUcJ7lrC2nzEJ1Vs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=sa8MOhx8wwXIm++NSPsUuxe8d5bVfmgyKlTJaFmi0RWiPT4WUAIG4I76iuyopFOcz6d/s9FJTC0vBtblbQN4qgN/tGNdK64f+k2Y4oCw9nRC87jteMqdaZTZhQSQkXv98f44Gcq58ZZT8b6uq2ZttwozeZo3aCZcfBYE4WRvAQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eBEdubuD; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eBEdubuD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767091953; x=1798627953;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=VDuezWAiSKHgcfjw+NSbxO/rIsPPUcJ7lrC2nzEJ1Vs=;
  b=eBEdubuDAzZbIXGSWY7WNWWiCHqExSb9vHfiAMCpznQcyI1+MG8F50Ez
   kEobk3v1747wSCRDEzMDMpx2bBApaz+Hisf04XE69b8l1WT6oWJJIEVbI
   Xcc1y7TYMx5P9NFlC/S3nMInAUQ34UG/bibO9cEeL+2MrvnokVs0eUuag
   wH6l5NtwyJaMhKmccUhEIB3nH1NUKVxCWFx/JEABV0qpLpAaaT6UFuc0V
   OaX65osaaCcFIqZg8pTMwrfPS7Ey7NqF+W75sHYVv4y4Da++a3M51rrqx
   1LUHvDcIZKismGSYiK2mmNlxxLJEp0nOJuegbeaTGk2emnmuSt/S9M2r/
   A==;
X-CSE-ConnectionGUID: WHPn7ECBQxSVTxZsb4XZFQ==
X-CSE-MsgGUID: vdWnuI21SnqeMmBLd1FNNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="94148756"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="94148756"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 02:52:32 -0800
X-CSE-ConnectionGUID: ZOGSnLlATm6zhkTVbTsPBw==
X-CSE-MsgGUID: yNoj24VGQ52KkXhZGJ9keQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="201186969"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.114])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 02:52:29 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-kernel@vger.kernel.org, Denis Benato <denis.benato@linux.dev>
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
 "Luke D . Jones" <luke@ljones.dev>, Mateusz Schyboll <dragonn@op.pl>, 
 Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <20251229204458.2658777-1-denis.benato@linux.dev>
References: <20251229204458.2658777-1-denis.benato@linux.dev>
Subject: Re: [PATCH] platform/x86: asus-armoury: add support for G835LW
Message-Id: <176709194398.1979.58867892250302393.b4-ty@linux.intel.com>
Date: Tue, 30 Dec 2025 12:52:23 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Mon, 29 Dec 2025 21:44:58 +0100, Denis Benato wrote:

> Add TDP data for laptop model G835LW.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: asus-armoury: add support for G835LW
      commit: c6703f10c8cc36f53b867bdbdd5bacaaa47ce799

--
 i.

