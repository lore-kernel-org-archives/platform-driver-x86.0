Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D947AFBE1;
	Thu, 11 Jun 2026 15:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781190161; cv=none; b=fO4iWxr4kSto3di3IzbWvIjSpanafLJg3I1aEiNzolhUNtNcZRd/uj7EaOaDU85+Tagd+hMrN7YEdelf0CcfZuBOcCQBSkARZTImcYj9HlQNGSm4I5GSk+VBDxPS50D/+zSnAiHhQW/81tTLRGdtAU+cqnnK1NMUI8f0dxgV+Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781190161; c=relaxed/simple;
	bh=xNfdlF3578XafGWiRUsb0VNavJZd87MOvnHDy2lKuAY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FfvG52n6kD6q2BrVPCt8Hh0/vXl+21aLZnC/UPHI0VDI04RlvTWe0cQIq6YtRhjALaFTogkGfbvAM2CSIr6nSKZE1MRpH8oVydk2sDaUc+NW5QIrVMv6RBZndltV5dde0wAscueJX/YkzlmDeadQvosggEGqkIms+lX9tYy1RWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V9A01Dr0; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V9A01Dr0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781190160; x=1812726160;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=xNfdlF3578XafGWiRUsb0VNavJZd87MOvnHDy2lKuAY=;
  b=V9A01Dr0ex9u6tF8NNLiD6ElNRQVSiisOKqXSIixlPgUIfqgPpOB5lL7
   UlZLLuT9+wtGzYoIa4Ml8dIZU8/mtcjdLulPHQM22xa+MADN3HCSbXcQ/
   Pwt166MChoSCMby2gbX8DspRKKsxTAG5dq2byo8K8RK11BheCWz1DITOA
   qLZSofmKtYvH2Q7GmQ4b5Joeo2DHOVuc/QsSAFy1VB5fn9CrYTMBUEWEO
   /jAXz+6PXDLvrwLGJUGKWOGximRAMIGB+h8uW9oV2WgKIbxleF+LPOSCv
   FiH3iJuag/JIr6cbnTWhb0unnJvFV2s767f63knwGtOheF8EVkUC2hCYI
   Q==;
X-CSE-ConnectionGUID: qYfPvg8oQc662UROLwu4pg==
X-CSE-MsgGUID: UUpSyAAQS72a62oCELuzQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="92326335"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="92326335"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 08:02:40 -0700
X-CSE-ConnectionGUID: K9Mk++A7TX2LNZhkFsZTzQ==
X-CSE-MsgGUID: mt7qUMpVRcKcB9SGESYPtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="242106603"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.157])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 08:02:37 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: platform-driver-x86@vger.kernel.org, 
 =?utf-8?q?Dariusz_Figza=C5=82?= <dariuszfigzal@gmail.com>
Cc: corentin.chary@gmail.com, luke@ljones.dev, denis.benato@linux.dev, 
 hansg@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260610164942.74956-1-dariuszfigzal@gmail.com>
References: <20260610164942.74956-1-dariuszfigzal@gmail.com>
Subject: Re: [PATCH v3] platform/x86: asus-wmi: add keystone dongle support
Message-Id: <178119015200.12014.18234165694233274800.b4-ty@b4>
Date: Thu, 11 Jun 2026 18:02:32 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.2

On Wed, 10 Jun 2026 18:49:42 +0200, Dariusz Figzał wrote:

> The ASUS Keystone is a physical NFC-like dongle that slots into supported
> ASUS laptops. The EC fires WMI notify code 0xB4 on insert/remove events.
> 
> Expose the current insert state via a sysfs attribute by querying WMI
> device ID 0x00120091 (DSTS). This devid does not follow the standard DSTS
> convention: PRESENCE_BIT (0x00010000) encodes the insert state rather than
> feature presence, and STATUS_BIT is never set. Presence of a keystone slot
> is detected by a successful DSTS call.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: asus-wmi: add keystone dongle support
      commit: 711104ab5ed500f155e4a53c56571b9b24a9a9b9

--
 i.

