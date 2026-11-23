Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795458010;
	b=a/Sld4NqU4fy7KAee/Sle/QaPKILN2pc9n3Sh28Amy+6RZDqnoFdPyzyavrr6kwErPRC
	 FG90uS7hPtoJ4N4bxvaNl1Kn6wAVZge9ebzUPSgGMxUzFfEGEsNcUJAqcmKnBD928q/+R
	 h9ZeUadmfhLVQ4xKYn5d8C48+yI8Dh7OY5iNBpeyF751LfWB466OJrDEkPKFrVDMBWAd8
	 O8u+JD+vD+Xh+FjjEfjk8XtFVDqZaKXjL3LAniXFssFC+XxiJsVSmBB6zq651Xe1GB1BY
	 kA1qvQR9tPQc1bsv77u0m+vj60vYwlCkLcSTU6Rrlivm8R3zyf4EAeH7UpVXv4W11oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795458010;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=SHzpos9BCvUtPcGDS10MgZ4zdV6luyprh2vZQd1l8gY=;
	b=Jk6aWEdCQAhjAmfqGxXEZy8MA3ivjprsvahA/j9Niw/QT/oHUXDpsbTE0vPvQLZbn0Fz
	 Dk0hyJSnXGsIvsdbgeWhVb5tBEh3mUfxHixp1V10NSByqxJJuWcI8MwhiHkBa8DTByu4W
	 hpLKxvS2I6qQKwl6ZOXe/u/rmX8MrX/G6H1v82gr/b/chuA00+h9WovqV41DLKemyubll
	 1xOQh3BstRLovF1oQU7g1RA/X0dUkNwRN3ejY0HgigZ6u5Qj343eAW6zdqTWaqrYKH3Ie
	 VnHfu+mWvJrLXGo6zlltO9bdDmMOlLZEWTXh541oeC7jUpD7QVtvPNkLEtVJflL02fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=D3KQaJJ5;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3AF606A334;
	Mon, 23 Nov 2026 18:20:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED3AF606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=D3KQaJJ5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795458010; x=1826994010;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=1hQ8dMoP2+1VXTjbUnjRBGQtJQDzoIw40kzcpmLVXpo=;
  b=D3KQaJJ5/gm0HnCFKAv82RJwvZcXy4EkHTfiMF9GqODJpVUslkmTKS9k
   1YsuGOIDA62lTijIuNCDvrAoQVpJ5wJCQyKeHDmi+AvBnK7V8C+ZxyuGe
   ojJUsnc8Poz043rRuBkkd525UZWeMlkhTIg/kg8G81Ma0ZFXy8A59Yavw
   JC3kM3p2jF+h7PDLFWQgStRwaIzfT9RdwPloao5AR8PPsf4Vl1gtC7uJM
   KeHwyihpywol60hbNGo96MdBcC2j+JZORkW/xg0nVYOKSDlanjTLkstPW
   Em2RIM2ajbLDXxl3oBC1qtwET4Qse+L42Q+5oz62VOynSuCZFeXZtu9Gb
   g==;
X-CSE-ConnectionGUID: deFP0zeZQXmVhIDm/5H7yQ==
X-CSE-MsgGUID: HakKjt2cQhS+dq8VcNmjcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4165852"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4165852"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 10:20:09 -0800
X-CSE-ConnectionGUID: pmKRzBo8QVCGaowaIfmEdw==
X-CSE-MsgGUID: qHSegYdwT0Oraluo/T9KbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="11442719"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.225])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 10:20:07 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: platform-driver-x86@vger.kernel.org, Alex Yeo <alexyeo362@gmail.com>
Cc: Kenneth Chan <kenneth.t.chan@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, linux-kernel@vger.kernel.org
In-Reply-To: <20261027020954.92205-1-alexyeo362@gmail.com>
References: <20261027020954.92205-1-alexyeo362@gmail.com>
Subject: Re: [PATCH] platform/x86: panasonic-laptop: add pr_fmt
Message-Id: <179545800191.12968.9993492573550834945.b4-ty@b4>
Date: Mon, 23 Nov 2026 20:20:01 +0200
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Tue, 27 Oct 2026 10:09:53 +0800, Alex Yeo wrote:

> Kernel messages originating from panasonic-laptop on dmesg do not
> specify its origin.
> 
> ex:
> [  +6.009811] Unknown hotkey event: 0x0030
> [  +0.229942] Unknown hotkey event: 0x0031
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
[1/1] platform/x86: panasonic-laptop: add pr_fmt
      commit: 223a4a492428926382b833f3029d05238e2351e5

--
 i.

