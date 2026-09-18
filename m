Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BED45221CE;
	Fri, 18 Sep 2026 18:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789756064; cv=none; b=E8RNH3fqv7MCZCJGvmMAjOkUNYsno1XX17IWKe3bPBXGLp0rnOfe5oTGgGaQchRVJOVkvk2qrfFXr+WH/a1SDa8Yq9jb316fIh4QWH4zlg0CxnDpoeRtm4YrRUnBDY+e3ZX9otGBdSebUXeONhR+zhn1vBbRTiz/aUpBJEg2jso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789756064; c=relaxed/simple;
	bh=KdHcPlthiRiAnpx42TMlD5fMKd8s0zV5hrRsHZrjY2g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tnGbL2En3L+kzsHu6ni0W76NMd8sHsY16nhNsg6XfqgbuGGnO8BxmPksNHLXBVbszKb545m1BZ7Ap7/B3nb6rKNTa8zc2118qw4Q1USHblB3fKOkDErgxjPXF6JCkyh4M1fxZ9NSBXOZMMzT/NPmRHZpMUwMBVb5InLo906A6Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V2iLQhpL; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V2iLQhpL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789756063; x=1821292063;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=KdHcPlthiRiAnpx42TMlD5fMKd8s0zV5hrRsHZrjY2g=;
  b=V2iLQhpLbCxB8zVRMlvLo5a5qhkdpS5Ule8Qo2ojYoJcBv4LZpN2vIzS
   yvCpJTl5PRX35RJzGRxlglZqPEwdZHLlXXIhInxlF0+xAadovDhY0bNA9
   kuW/dqaiWT9NxWSegGmMwChW+sfyGIiwwt6dbiZw/fHS4I02HoUiXRwpr
   D3IVmxMB50CAUFsWZwjNPwt3u+VAeXUfBNY0ENkpqcKhHbwbOfKsRdYrN
   v/cIlwe7Qe+Xqb4i6wuKYq+uZ3gQ7PJCogd/c1EI8PduBa0CtWwodWFPm
   PLSDLFiaRDaiQ2XcU+/snbbbpZxGjnuoR4LLROKJOu/nHDcipP+kHnCxn
   Q==;
X-CSE-ConnectionGUID: YvXrdTKzQaeUXX7u4bNkTg==
X-CSE-MsgGUID: 98pHUPL5SDKSqqmlnctOzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="100881242"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="100881242"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 11:27:43 -0700
X-CSE-ConnectionGUID: iao1+sbXQzmh2Rnf6YQUeQ==
X-CSE-MsgGUID: WzcaAIKDTbSuTEmC1F+3fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="2763503"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.223])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 11:27:39 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: platform-driver-x86@vger.kernel.org, 
 Denis Benato <denis.benato@linux.dev>
Cc: linux-kernel@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
 Corentin Chary <corentin.chary@gmail.com>, Luke Jones <luke@ljones.dev>, 
 Hugo Baigue <hugobaigue2004@gmail.com>, Ponali <ponali2k@gmail.com>, 
 =?utf-8?q?Manuel_A=2E_R=2E_de_Or=C3=BAe_R=C3=ADos?= <deor001@gmail.com>, 
 Salvatore Bonaccorso <carnil@debian.org>, 
 Thorsten Leemhuis <regressions@leemhuis.info>, 
 Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <20260916143838.170950-1-denis.benato@linux.dev>
References: <20260916143838.170950-1-denis.benato@linux.dev>
Subject: Re: [PATCH v1 0/4] platform/x86: asus-wmi: fix screenpad backlight
 regression
Message-Id: <178975605445.29716.3417278667562193795.b4-ty@b4>
Date: Fri, 18 Sep 2026 21:27:34 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Wed, 16 Sep 2026 14:38:24 +0000, Denis Benato wrote:

> I have touched ScreenPad handling code based on latest Luke's work
> and in doing so I caused some regressions in the screenpad backlight
> handling.
> 
> This patchset attempts to amend those regressions while also
> improving the support based on feedbacks and suggestions
> I have received.
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
[1/4] platform/x86: asus-wmi: fix unclear usage of bd->props.power
      commit: 159e956fd4f9cf863b2759cffb4f01fd4d6c2742
[2/4] platform/x86: asus-wmi: fix screenpad power state detection
      commit: 341b4769f5cf2836d1d3ee7ea2259ffa7a477546
[3/4] platform/x86: asus-wmi: use backlight_is_blank() for screenpad power
      commit: 99215e618ff209ccfc01ec62ee58c4b3179a7435
[4/4] platform/x86: asus-wmi: remove unused screenpad_brightness
      commit: 854be60ed0e9f2b7729be3972da14e63d1058e95

--
 i.

