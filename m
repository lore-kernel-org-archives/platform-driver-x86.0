Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6D235028C;
	Tue, 18 Aug 2026 14:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787063627; cv=none; b=NzMUkH08A+oMzWsVVHlM/sTzv4y+WGBHNpGqf3GHb6x1LqK0cV0IpY5/v4WChr19/6WKbx4KIy451zBLX3L7AaSG1Aza2LnGeKf4cdyjJM9vc3hEUTGNBTQ6riYIGkdLxzU56ugkI7zG/e4EPZp0IJiSHBF3hXfVNli4+6aHStA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787063627; c=relaxed/simple;
	bh=dnuyB07hZXabzDHoucw3PcRkxPHRpRa8/K0WkwOXd/0=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=R8RBtzYQ+hbGvA3mQS3u39lt6KmNLFMua4HHgIqT4KUUXwLTP+KTMuz3UPPAcJEKKCvOoeXTxAymU8+gdzR5fKRU+EevnA3TfGQDs2RJsmnqMfB8p/018p/GMEkXcKjHt6BpI+jIxDcek3tkMkEWBfI4OyS3uwpqC4OcEUCEtBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ceE/USpi; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ceE/USpi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787063626; x=1818599626;
  h=from:to:in-reply-to:references:subject:message-id:date:
   mime-version:content-transfer-encoding;
  bh=dnuyB07hZXabzDHoucw3PcRkxPHRpRa8/K0WkwOXd/0=;
  b=ceE/USpir050L5caLmWfWpxuqSaAbzxRdzqfSIPkrKG1AEkq6DAg7+Io
   GwHZL70vyzGsNptejq+++STu1OUlm5BJ29nCWWydzNnW2ATVkW+0q+2in
   Q1E9cozAiCyg3GTTlIOdLdE/uNZd1K/U8NS/8vU/nCvyhkRA3SwXVgxCy
   PoeRyKv9voVpQGPOJOd9RRaSMZuz5D6h54wSU/w+aSSdNub5Bnm8HPlcS
   +X3fzZUuF5vR+KSypdAO9YeBPyKdRudtEPI1eV7XysI5bkWhGzWZykprF
   SAInUfYYVgu514MKdJ8fcPDvkKUWP+VLvdDHfn2KJQi3iIwsePBVjqd8u
   w==;
X-CSE-ConnectionGUID: iCOTfcQ4TJGPyxo8BGRjQA==
X-CSE-MsgGUID: 09e3hrbtQkOct7TMvaMqNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="75086862"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="75086862"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 07:33:45 -0700
X-CSE-ConnectionGUID: YDqEbnVEQkiNQ8p9OS6LTA==
X-CSE-MsgGUID: 2edh2vn4RKCmw7NxdJYS+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="263511854"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.38])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 07:33:42 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Jorge Lopez <jorge.lopez2@hp.com>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Guangshuo Li <lgs201920130244@gmail.com>
In-Reply-To: <20260708090937.740435-1-lgs201920130244@gmail.com>
References: <20260708090937.740435-1-lgs201920130244@gmail.com>
Subject: Re: [PATCH] platform/x86: hp-bioscfg: fix password encoding bounds
 check
Message-Id: <178706361766.21379.7161904015923422300.b4-ty@b4>
Date: Tue, 18 Aug 2026 17:33:37 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Wed, 08 Jul 2026 17:09:37 +0800, Guangshuo Li wrote:

> The password PSWD_ENCODINGS parser reads password_obj[elem + pos_values]
> while copying the supported password encodings from the ACPI package.
> 
> The outer loop only guarantees that elem is within password_obj_count.
> The encoding count is bounded by MAX_ENCODINGS_SIZE, but that does not
> guarantee that the ACPI package contains enough entries for all
> elem + pos_values accesses.
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
[1/1] platform/x86: hp-bioscfg: fix password encoding bounds check
      commit: e213939ed9e6e6badf7aa48c4c8dd9a9cdf00615

--
 i.

