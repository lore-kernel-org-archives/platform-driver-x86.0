Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A06306495;
	Mon, 24 Nov 2025 13:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763991667; cv=none; b=tIR54nX1c1+ES9YhDtWGt4jAq/oCyJZTbfRlmGUIi2Ekp8mt6zBhlIXiVich3L3kpPSkNP/TXZFbPRKvndVoYGIYjqInmTlLOhcMw8rBN1YLaEgPJcORYx3b834XWFbyUDq0CO9bnNAkvJGXrwsa55dOR6CpupKl3EWz9pntm+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763991667; c=relaxed/simple;
	bh=cWxXhFWSs490Ewvf8Le8zDNYzzbUaZfaLFNbcBn/eCA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=l7gp0P1F/Q0iV4nObx/8n2QsNh2qvoM4fYg7GsqqbvCW6qX7rT5hGZv6eLtNx3kXAgIDWqcdu3kz/qHdnwd69hed5srEXobL8LA2BhaHVSA5kOZmh/KMnhWUTUuENsiy+Xa7VCL0HA2aLGK+kjFfRAaIP5WdZh9NietBOI3VDwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L9xWfJ+L; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L9xWfJ+L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763991666; x=1795527666;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=cWxXhFWSs490Ewvf8Le8zDNYzzbUaZfaLFNbcBn/eCA=;
  b=L9xWfJ+LTEVg88zsiS4i7Qf2MCDB5cgihevQl8qggWo6kyjVxRXuiQ2F
   L0VDPIo1n4UmnHB0XZh7tpZ8KnQewY4T/xWDZXK3d5SZ61WT1cZtZNWDM
   vPvVNQDdzJgVbIBuK7KbnjFT0RFZb3eCYavJzRA+vDyvygaoygjLzmDbX
   3k/F9ln3k+LczqV582QNVabz/vGhS87FWxjanoxBPXxB0wPN4OwObJ4GP
   OyJtjrq2TXXkeHIhoUE2izH1MwGA9VQusCu6jHYs6smnD/kuuMI1nM8tV
   SIq57qhCU3g3odYH/l1nEmy7Yac3oFoAFur3Ny6SiRkvRiciPSqEp+3A3
   A==;
X-CSE-ConnectionGUID: IQ96QHjVQ+C4IOQgRzteGg==
X-CSE-MsgGUID: oZdeqP8TTM+cDv91LNLRkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="68581008"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="68581008"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 05:41:04 -0800
X-CSE-ConnectionGUID: +XKx//CuTfOv3hkvcOUTZg==
X-CSE-MsgGUID: WsMeVTRSSV2cRGuiCAGxuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="191616372"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.97])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 05:41:01 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Qipeng Zha <qipeng.zha@intel.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Hans de Goede <hansg@kernel.org>, Darren Hart <dvhart@linux.intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org
In-Reply-To: <aSCmoBipSQ_tlD-D@stanley.mountain>
References: <aSCmoBipSQ_tlD-D@stanley.mountain>
Subject: Re: [PATCH v2] platform/x86: intel: punit_ipc: fix memory
 corruption
Message-Id: <176399165439.1782.14998465716898808944.b4-ty@linux.intel.com>
Date: Mon, 24 Nov 2025 15:40:54 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Fri, 21 Nov 2025 20:51:28 +0300, Dan Carpenter wrote:

> This passes the address of the pointer "&punit_ipcdev" when the intent
> was to pass the pointer itself "punit_ipcdev" (without the ampersand).
> This means that the:
> 
> 	complete(&ipcdev->cmd_complete);
> 
> in intel_punit_ioc() will write to a wrong memory address corrupting it.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: intel: punit_ipc: fix memory corruption
      commit: 9b9c0adbc3f8a524d291baccc9d0c04097fb4869

--
 i.

