Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C733B38BC;
	Thu,  8 Oct 2026 17:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791481088; cv=none; b=caY/YX+gLDi7d6gi8B9elbMFvmeTK8WRrQ5Q5xrk/mv3c5w3Ak0MUjIsi3IuH3SG83FhGW09345QaEjIt3cKla+EOzg1XKkZ+Xh0j+VZ/JdsGtv4dDFzjwRu+vNOV0ghEHTbQdhuT98SMwKrYfW0lJ/klDLvv6UL9F/ofnGqP78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791481088; c=relaxed/simple;
	bh=riJStAV1ZrL7u/qtFBeoy8jlXhojcBJiLj3Fkdb0OLg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EyNGqziRldWklk0c9P1KuHjSJRSCX9aI+RyeSZlgcXd8q0Q6Up70de//sqQiE9BXmzX++r673QhMGTrvbHsb5CJqn478OBPn7fyZfNAP7LDL83VYnqjbtmqFOu2Eb4O6pwjPTIw79DGmgslT+zFiWhZB8jMKD+8CWtivVL6L5/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EPR1Z+iu; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EPR1Z+iu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791481087; x=1823017087;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=riJStAV1ZrL7u/qtFBeoy8jlXhojcBJiLj3Fkdb0OLg=;
  b=EPR1Z+iufNoO18DctSOqpODvFJp6Fbbrv+j8x3GWSA5xf+8n9eTQwKEr
   8xfejpGXGbgI0rGETGtG00oUGndihECwUEsYPL/9lAsmMv31JXqrV/3EY
   tfhI57f5g2pbB2h1au0H/vSyWdv7xJoDEvViVLFj+uo50OCQVhL66v5ti
   BXNMSI/NzfKnF4YjQQW1Ba4M09aXW0wdo/Yuo9noXLRGVEfLFuaqeSLZp
   hxxECs/BagrGN9eu+Vsj/ioaAISXk7C2DWHWPTUMS8d+oUwPx3Qacg7gT
   YYvG7W4MEYowpoS7jUn+leIz4aDG2JyPH39yIQDDDiQRoKesT20KTWCFL
   A==;
X-CSE-ConnectionGUID: BRG69BlXQT2A+Cu5OoHZ6g==
X-CSE-MsgGUID: 8ItBR7QESn6H11otrIOg3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="383403"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="383403"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 10:38:07 -0700
X-CSE-ConnectionGUID: Zdf/mokdRiWD7WC7uM+FJA==
X-CSE-MsgGUID: IMkgg+4cTyqqTPL2A2Vx0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="217702"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.140])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 10:38:05 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hansg@kernel.org>, 
 Mohamed Jouini <amad3v@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260927014031.3465252-1-amad3v@gmail.com>
References: <20260927014031.3465252-1-amad3v@gmail.com>
Subject: Re: [PATCH v2 0/2] platform/x86: uniwill-laptop: Support the
 PCSpecialist Recoil 16 AMD
Message-Id: <179148107535.29028.6844163821162089322.b4-ty@b4>
Date: Thu, 08 Oct 2026 20:37:55 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Sun, 27 Sep 2026 02:40:29 +0100, Mohamed Jouini wrote:

> The PCSpecialist Recoil 16 AMD is a rebadged TUXEDO Stellaris 16 Gen7 AMD
> (board X6FR57TY), which the driver does not match today because of the
> different DMI vendor and board name.
> 
> Patch 1 adds it with the existing Stellaris 16 Gen7 AMD feature set.
> Patch 2 maps the "Sc" key (WMI event 0xD0) to KEY_ROTATE_DISPLAY.
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
[1/2] platform/x86: uniwill-laptop: Add PCSpecialist Recoil 16 AMD
      commit: 99ee4a2405fafe9636cb1c834cc3753ef5705041
[2/2] platform/x86: uniwill-laptop: Map the screen rotation key
      commit: 37dcbefbcf314ab032ee6bb7f7363c1de5e886a7

--
 i.

