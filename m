Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D732B30B514;
	Mon, 24 Nov 2025 13:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763992494; cv=none; b=ak/wotVzuGQwY0ZS0+iJT216WA6K6dGfwDR/29hG/dz3NG/1HOS5NRV0gOUQ4ZPX0IfoDNWvorwvXqd2V49TkjnrR+0ZrLD/T9FQtZJd27D8Bo9EADV23TjRJ/yylGa48YXuSp1xB/niw/e69iVDNcx2xnjOD0SuQ2+ydWtEUzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763992494; c=relaxed/simple;
	bh=Hu8JsFc2nUhVFWsZ82ErnWGAP6HfLhMkVwJsRxRirjM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=o6+bSSlzzYUBNjhyFgus1cE6JApRkE9lRs3bU9XdNMYRS8go1zwfcXaIHyOoqup4FtEzSgZsm7sukiwWzxeKq2MV1y6AZt66Dz/dq6F+hdrJ4ZwVC59Df8EfVerdEiD8fX0k1qyjDr0p2/cHIiCuEeAr2nSMeXIaMxDPdXxuIEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ElrPL4di; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ElrPL4di"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763992493; x=1795528493;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=Hu8JsFc2nUhVFWsZ82ErnWGAP6HfLhMkVwJsRxRirjM=;
  b=ElrPL4din1nolTi4Q6jbm8SuB0VQ6PdIoVOT/NTogUW1M9dKxenIpJ17
   nQ3O/bxze5hRD+28+bh0rXbWHGOnvdNdUO7V7TeLrHRs1aKrmw/iBJdOL
   5ucbyeJQvmWDeQMJSeTNRT0eQKWysrYeldeZEcDicVQNRCVQtwf2FtRHu
   BI7htJ9Vvg5cQS4LsG3C+zJLJEEzNwT5WvlRbq9vIE7X0eaHnIqmmsJdw
   ef/KC5a/10IIDu1ljiTQwFIUslauvu/z8dn5m71v/mfpLeO5NLnBHB9G/
   Uan/pA1K+EZtsn1sOI/afIY0bZGlcT5RBRCCBYKkDErSswDJMeRIMQlaV
   g==;
X-CSE-ConnectionGUID: iLmevJWLTuGgY/JA6s97JA==
X-CSE-MsgGUID: xB7wp/JtTkSTu0ec35Qkrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="53554291"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="53554291"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 05:54:52 -0800
X-CSE-ConnectionGUID: mzrBGm2STOym5K5LKbWt4Q==
X-CSE-MsgGUID: cI7vtIr+RPGrDh+k6wnEpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="196504383"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.97])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 05:54:48 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-kernel@vger.kernel.org, Denis Benato <denis.benato@linux.dev>
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
 "Limonciello, Mario" <mario.limonciello@amd.com>, 
 "Luke D . Jones" <luke@ljones.dev>, Alok Tiwari <alok.a.tiwari@oracle.com>, 
 Derek John Clark <derekjohn.clark@gmail.com>, 
 Mateusz Schyboll <dragonn@op.pl>, porfet828@gmail.com, 
 Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <20251123150535.267339-1-denis.benato@linux.dev>
References: <20251123150535.267339-1-denis.benato@linux.dev>
Subject: Re: [PATCH] platform/x86: asus-armoury: fix only DC tunables being
 available
Message-Id: <176399248359.2120.18414317617125207034.b4-ty@linux.intel.com>
Date: Mon, 24 Nov 2025 15:54:43 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Sun, 23 Nov 2025 16:05:35 +0100, Denis Benato wrote:

> Module asus-armoury must use  AC tunables to check availability
> of power-related firmware attributes: fix missing attributes
> by using AC attributes instead of DC.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: asus-armoury: fix only DC tunables being available
      commit: f72c8ab57927653199da6e35405eadffb40d7e54

--
 i.

