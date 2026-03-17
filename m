Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6128A21018A;
	Tue, 17 Mar 2026 13:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773752483; cv=none; b=Bi3l37yElbz3N9OqBHEuiToWCaqz3Of9XRP2nRubJqmIeGqjsP6SPcyC/GCMlPpYJFYF/73bSp+p7zKx0d0ilLWyMc9V4JQaKKUrM0Ih1RYW7TYBfyIkjqAZlBEUFMrNcj7rdISPLPlh7WfS57hEhqQ+0KO2kc3p0bX+FKYW0tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773752483; c=relaxed/simple;
	bh=7+g7IIbt53oNgrff3w3KZ2PbpHHiz3rFeQtso03AvCk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XUucqvJtF+C+5nTXPsf5QwKVXTrE+w7M1m/mSspeP7fqm0H+ZaTxRnhtiqdnxvIp1mVZrJXYEA79yuoG2QLgOzI/SjNbk0uc9/kAuCWZDLdevzHhZpSp2dSTQOCClTJ7lGQiy+IVh5Xu/B+icZLwmSemqZDR9k2Z5udZ+vMiUyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kyIL9F32; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kyIL9F32"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773752482; x=1805288482;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=7+g7IIbt53oNgrff3w3KZ2PbpHHiz3rFeQtso03AvCk=;
  b=kyIL9F323YOx4vPw3z3GfTSuZCXkM9gOumuwVhb4O3rUDm/QqfFtSUHv
   JoTKfkxAJ1o+Js4wGu1S7azYspEBEtMWW5mZGuAvWYzrz0iZ4wyPp5pCO
   z58b5xkl3Ffon8hV/C3PBI0cN9JQEvlCULyxvRCcqEcx4C4mQ/JXePbMp
   ggJUSiJZqRW4JMgqwXsk+Atr6k/rnHsYPYS5/WVZU+kz8M2XHqNc5oHcW
   0Yy9Top7kpQfgzm3nobbAqFYxCAY5Mu/vt2xOtEwqLnULUVmxeWqEnzfk
   nIVmpHI+Jjnlth6NQ0SVWEuaqEKxWduTci57V/41dkNHi9Bnr5xh1GeAz
   g==;
X-CSE-ConnectionGUID: RjC+CjrsRLiqzkjr8FTXNA==
X-CSE-MsgGUID: NS83KD1MS6KIG/LGOOdlZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="100239307"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="100239307"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 06:01:22 -0700
X-CSE-ConnectionGUID: APcdWNhmTZypPwc43NnDzA==
X-CSE-MsgGUID: NSGrtUmYStmhdraqjlkCSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="217962758"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.161])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 06:01:19 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>, Denis Benato <denis.benato@linux.dev>, 
 Matthew Schwartz <matthew.schwartz@linux.dev>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260313004939.4103835-1-matthew.schwartz@linux.dev>
References: <20260313004939.4103835-1-matthew.schwartz@linux.dev>
Subject: Re: [PATCH] platform/x86: asus-armoury: add support for GZ302EA
 and GZ302EAC
Message-Id: <177375247442.9137.9480028745264115856.b4-ty@linux.intel.com>
Date: Tue, 17 Mar 2026 15:01:14 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Thu, 12 Mar 2026 17:49:39 -0700, Matthew Schwartz wrote:

> Add TDP data for tablet models GZ302EA and GZ302EAC.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: asus-armoury: add support for GZ302EA and GZ302EAC
      commit: 2b5d6ab79ed67e96ba8b89c972c851d20dc145dd

--
 i.

