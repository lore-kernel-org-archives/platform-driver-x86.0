Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8E747B436;
	Wed,  1 Jul 2026 11:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782905448; cv=none; b=UJulCyRY5nAsIhxM7WnvG/LYW2DRNy/iyhy+ofdU0YnWjYAAAs6BaS79+GN8PMxzq+2zQwcVJAeSvwl/lHIXqzosjVblRA7UyFdFccBr9fn32CCcyZKqp5I1A0lo6PjCPbBbZ0DpBtmiIyZKQHkspTJ1PlemT3rtgWng5a5rQ7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782905448; c=relaxed/simple;
	bh=q3DxRt1yLIm175zxg83019FpIiTReakmfw3BnqcvS/0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=t6ir/kZehiOgqrKsb9EvD3ViSRByxouIwTadTwXmXvMhnkD8b2sAm7XxobJYAbVGXXLAfSywDEVXEZIccIFpBmQ5MWGQU0b2lhkgZW8wnXi5YA3junl/mNZOHrsajjt8DXZp4QJkAFLUSsdLoPQx84cEoM/1uX8SfOxGOwGTqhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H0lFh+6c; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H0lFh+6c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782905447; x=1814441447;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=q3DxRt1yLIm175zxg83019FpIiTReakmfw3BnqcvS/0=;
  b=H0lFh+6c/XpchPEOyEz3gzXWlLaAE5D+B/lnACSVevuTZn4R2yrjZctt
   QdEy7qpDqJ0ClcG1vw6gNzFw12P6p6M/7L9J8w/AKGg4bieUSyRoR066s
   NNAFUtmrs7BsEiV+fzH9OsZI4y8k9twPbrgLlFAcZ5kGNzM54SWuiezDg
   SRe3cWEX7QLWchrlVKZ5N5hMmaEv9o0AjdhlvAtRZ5OFaFYKV5Z2tivk5
   Iw/KVrYIPbvYk6GeMV3q1Zoc9ls9L0XAUgtGq6Ia0JaWwT9ubIEI7rajw
   /9cYGLaOdfVur9s/E6KeYXe5fMGi8nvVl6TC01IhJQWPJOL6pWqMo1owN
   A==;
X-CSE-ConnectionGUID: wuIrEt7BTaiR26Iq9EA7xg==
X-CSE-MsgGUID: E5koTkznSd+NqNuFjb/peA==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="83509526"
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; 
   d="scan'208";a="83509526"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 04:30:46 -0700
X-CSE-ConnectionGUID: HEw6SUevRpOpnIrPI9kLcA==
X-CSE-MsgGUID: sEPBT4M/TOmWzf8S8dOe3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; 
   d="scan'208";a="275761301"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.83])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 04:30:43 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>
Cc: Armin Wolf <W_Armin@gmx.de>, 
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>, 
 Thomas Renninger <trenn@suse.de>, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260613021654.933618-1-derekjohn.clark@gmail.com>
References: <20260613021654.933618-1-derekjohn.clark@gmail.com>
Subject: Re: [PATCH v2 0/2] platform/x86: msi-wmi: Fix unknown wmi event
 messages on MSI Claw models
Message-Id: <178290543800.22449.4590007809680324804.b4-ty@b4>
Date: Wed, 01 Jul 2026 14:30:38 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Fri, 12 Jun 2026 19:16:52 -0700, Derek J. Clark wrote:

> MSI Claw devices produce WMI events through the MSI WMI hotkeys GUID for
> some of their buttons. When pressed, these cause spam in the kernel. The
> Claws use a GUID already supported by msi-wmi, but use an
> ACPI_TYPE_BUFFER instead of an ACPI_TYPE_INTEGER.
> 
> Patch 1 reformats msi_wmi_notify() to reduce nesting by using early
> returns and a switch case in preparation for handling this new data
> type.
> 
> [...]

Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

FYI [if applicable to your patch], as per Linus' policy change, also
fixes are mostly routed through for-next unless the fix is for a
commit introduced in the most recent or clearly a regression fix.

The list of commits applied:
[1/2] platform/x86: msi-wmi: Reformat msi_wmi_notify()
      commit: 43a862be3002ac9385cee76da9b403d6107c890b
[2/2] platform/x86: msi-wmi: Add MSI Claw M-Center keys
      commit: 0c716d1848ac86cd4aa4ea2a997bf1e835017869

--
 i.

