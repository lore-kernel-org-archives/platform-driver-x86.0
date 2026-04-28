Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B6A466B49;
	Tue, 28 Apr 2026 16:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777392374; cv=none; b=QWEUogfNwM2QQ1CbbdhdZhlZX4+HUVu7H/bsr27lvwKBVLqDnlgu84SbS1i4vYW97yQ091WpSMXpCGTTzeaFWH2+VAKkSe0OU9Ngq/0gWovEednNxu+UDoSaB9UhVhlSi0ypXMc6IMDcxabJ4hVAxTzwTI0rVjNKiSzB/lyxkXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777392374; c=relaxed/simple;
	bh=sHewyjD0vC/EP5WMIUNpgpaDvXQbgc2xp/SSiRm/SzM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Eni4EicaRBtuxvURNHjxdzJSp+vu6Xy39G2/hXtuZD5XmKfx3IOy8VhG+9BEImhBnM3Kussk/FL8uPL524Hf5JGu3/K0j42jpNLdk+oyMXHovaOL9dUJey3nyGhyFLq9kY42ahz8K+cjkwM4cKp7sBfhtBe9/wmXOsYELhXt8/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P+TY26Ll; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P+TY26Ll"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777392371; x=1808928371;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=sHewyjD0vC/EP5WMIUNpgpaDvXQbgc2xp/SSiRm/SzM=;
  b=P+TY26LlAtkZMh9rWbDWawOTJTG5zuJ0dYtc+DZ5GwSES4F4R2NGK15V
   86tWzGV6gmIzzSv82Dyahn7uhWbflmRiqh8aNGn6tYnIDTYpZ6MwfWfGc
   Kxjvy3QLma6hRPdbfPCWQODA/valH+uakiKBLH+2SA9I3cuLxRVGN/J06
   b1BDIbQYq7/lRV1TIwACJIujjoMErq/PZunaeuIJSR06mn8ik9zKcs0B/
   wAwvRjw/J57/8cW6V7Ib7V7wO28bhmUIehI3cQfxem9XUNvRQC9jaBHOa
   sFiTMeSNluGoXUjxWdQ99PN5GjwKKxbFzRLZgEDrCNWEtwuAWnvS/qdZK
   w==;
X-CSE-ConnectionGUID: 2LW9nhUVSBWc2rSqNrvw9g==
X-CSE-MsgGUID: qawcOoVqQ9608sf5rW573w==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="80881264"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; 
   d="scan'208";a="80881264"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 09:06:11 -0700
X-CSE-ConnectionGUID: vnrWfZYWQLSyMpEYCbKgJw==
X-CSE-MsgGUID: MA5omvySQ1igP1dfs2wSxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; 
   d="scan'208";a="227468379"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.1])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 09:06:07 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: mpearson-lenovo@squebb.ca, derekjohn.clark@gmail.com, hmh@hmh.eng.br, 
 hansg@kernel.org, Eduardo Vasconcelos <eduardo@eduardovasconcelos.com>
Cc: platform-driver-x86@vger.kernel.org, 
 ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
In-Reply-To: <20260425063936.9360-1-eduardo@eduardovasconcelos.com>
References: <20260425063936.9360-1-eduardo@eduardovasconcelos.com>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Remove unneeded goto
Message-Id: <177739236303.10973.18101852287173259208.b4-ty@linux.intel.com>
Date: Tue, 28 Apr 2026 19:06:03 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Sat, 25 Apr 2026 03:39:34 -0300, Eduardo Vasconcelos wrote:

> Remove an unneeded goto statement in hotkey_kthread(). Since
> the function has a single exit location with no cleanup code,
> the jump provides no benefit. Per the kernel coding style,
> returning directly is preferred over goto in such case [1].
> 
> [1] https://www.kernel.org/doc/html/latest/process/coding-style.html
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: thinkpad_acpi: Remove unneeded goto
      commit: 74ab7c4d73d526bfebc6f3fd7382c6f672d8b912

--
 i.

