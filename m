Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3747A3769F1;
	Tue, 19 May 2026 14:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779201967; cv=none; b=kaZytfQMnadhrL1XRQpjYe9IvO4p/j5SqKIIUzfxXCDnQmf/x+RW8iN0Zro88vvNi1ng7K2SrcD/Dhv2qMzLwSvBpL4fdxw+MMFvnWn1txnpgXLKnIOE5cKCv1HbuvVjPyGV0imKyci+o4kRELfPpCJ8CcIuimFiwU5KrE3Bzt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779201967; c=relaxed/simple;
	bh=fupkEKtomkK4uiRyYTPelugmRF3TDDYu++Ci6eGJGEs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=X3F1hHnluFPQh6uFnMGVrlv24kDnSiAh4VtYp6IcVgeUdDJ3WaGmfBBXw5SjYcJGT5KY4aQacBQ2596iHwMA9t3i/uPfAB1Cv0ZdTXDBxeFsPVojjZKqYgS8MB5tU4JAOU47fUYrbwJR3km8OtxYibIsv2SrQ5dfGWquP4LIV0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iA+jObOl; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iA+jObOl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779201966; x=1810737966;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=fupkEKtomkK4uiRyYTPelugmRF3TDDYu++Ci6eGJGEs=;
  b=iA+jObOl2dd2fLcZjcAFUC/lRPTezlpjIjZ2cC8pvQYkxqyzzOpJurcT
   WwzonBqBEnyysaDy+XhH9fOv/ArTQRmcGOC9OSuheo4wP0OAd+QBDH2UU
   6ph1krhPjDTbQht2xZqAO+586CffVK9BnRCaKSLiNEGqBQFMDyY/H1V+l
   JPyhIhBGzMJ+sO/nZ6qPydBdh8DzhdbbIJbLArw8NDC5jB9/wPd4EJdnz
   2242fiPvDFypqCmgafFliulXK2pGFaaJI07fVjjW9QQGPIq44NvxE2kUG
   G4y6MMRmOy28J29C11QZANjtffNF1qGVUB4kOg9nfZ4Z7xGFILZ7D+0GU
   Q==;
X-CSE-ConnectionGUID: 0xpypOJ1QkmNLbLjyfmzWg==
X-CSE-MsgGUID: 6U9ayNELR+WklSTEp55LxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="83695891"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="83695891"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 07:46:06 -0700
X-CSE-ConnectionGUID: A1ahU5iAR6OfHt19vXrhdg==
X-CSE-MsgGUID: AdIxHcMFR6CfdPiiNTvmRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="235527041"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.236])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 07:46:04 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-kernel@vger.kernel.org, Denis Benato <denis.benato@linux.dev>
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
 "Luke D . Jones" <luke@ljones.dev>, Mateusz Schyboll <dragonn@op.pl>, 
 Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <20260517220005.4594-1-denis.benato@linux.dev>
References: <20260517220005.4594-1-denis.benato@linux.dev>
Subject: Re: [PATCH 0/4] Add four more ASUS models to asus-armoury driver
Message-Id: <177920195787.22546.108915912431473081.b4-ty@linux.intel.com>
Date: Tue, 19 May 2026 17:45:57 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Sun, 17 May 2026 22:00:01 +0000, Denis Benato wrote:

> This patch series adds support for four more ASUS models to the asus-armoury driver:
> the FA401EA, G614FR, GU605CP, and FX607VU.
> 
> Cheers!
> 
> Denis Benato (4):
>   platform/x86: asus-armoury: add support for FX607VU
>   platform/x86: asus-armoury: add support for G614FR
>   platform/x86: asus-armoury: add support for FA401EA
>   platform/x86: asus-armoury: add support for GU605CP
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/4] platform/x86: asus-armoury: add support for FX607VU
      commit: 9ac7c8dc07af88f5169f217fec431c992b4eb550
[2/4] platform/x86: asus-armoury: add support for G614FR
      commit: 239c7acb9e3f73ada3ccce06302f6f3d2d89762d
[3/4] platform/x86: asus-armoury: add support for FA401EA
      commit: df1e0b209fa09676585402d5437ee190a424302b
[4/4] platform/x86: asus-armoury: add support for GU605CP
      commit: 841ff62aa5f85b13771b33e7b9c102cbaf87432f

--
 i.

