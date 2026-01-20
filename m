Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730BB438FFA;
	Tue, 20 Jan 2026 14:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768920871; cv=none; b=Y6QXMccq9UE0dOhepqzh7v/TUb3GlmyVW4grKXh/vjDGWfy8+lIPrbY3TFS3m+U4mIsISjjSa7HYIGmlY/UUscA7AUBEA4GjZDZnraXBr/Zlh1CQp5id7ejoG7OvQE8qrWVEB+hxx38BYeTTptODs5T/DJNSGyccrbqxhoExXAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768920871; c=relaxed/simple;
	bh=F+DWabZl6xIi5iH6LLpOUpaXsGT055xFXlruElhPR/k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=I2LwtkUWQ7RASF20pyC+C7psjXvpI3QLbY58P523APbh4xpZ+AgYECsmbml2LMAPC3ko29Gv9Xlmsq+KTJf4dhbhe8DwxX8qWxolhZfh61SzteFaHc9HEb2UDtciuYMGKzxUtKFYgcrDtZCVCgGWDdu2QL8EWQdvRBTl9Xxgy54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZK2+AgZE; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZK2+AgZE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768920869; x=1800456869;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=F+DWabZl6xIi5iH6LLpOUpaXsGT055xFXlruElhPR/k=;
  b=ZK2+AgZEMJrvcHb7BF2oTSxew1U9DVPlLklhPx7zquxQbAfS988raJ6T
   K4CsJqa/R26RFXHVB+cctv28HdTxZfCrOStmkTg18kHunIY1WRRicKCij
   djkJZoWT0Ax6tsXc8d8jQULmIVk7xJlFdCLFs/AVjQ1YHDPpZUDnCY1PT
   m4/SwoGq55hQcdKG5vY6/eGBqhlAT9vJFfEoSXDwugrt26pdJ8JKTDKDn
   dZz+n6KxuI4XX6X6jIlg8JlxS0ov+kqUJO3vUn2EvMyFeMq6gVUXt6dbS
   7wzzhjvmX8OOSulq6xYkjyFL45TPLyJ9lVj6aXjhM+IzHc5ABcrDOFoJI
   Q==;
X-CSE-ConnectionGUID: 7nfJ2j2IQo2I58PPJSxQ/Q==
X-CSE-MsgGUID: 0c51eT0DQFKeO7x3TayROg==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="80433175"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="80433175"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 06:54:15 -0800
X-CSE-ConnectionGUID: WckCCuChTvi7AZjytnptag==
X-CSE-MsgGUID: EchR/NK3Rc+4/Ku4s8C0FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="210286819"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.10])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 06:54:09 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: ogabbay@kernel.org, maciej.falkowski@linux.intel.com, hansg@kernel.org, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>, Lizhi Hou <lizhi.hou@amd.com>
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 max.zhen@amd.com, sonal.santan@amd.com, mario.limonciello@amd.com, 
 platform-driver-x86@vger.kernel.org, VinitKumar.Shukla@amd.com, 
 Patil Rajesh Reddy <Patil.Reddy@amd.com>
In-Reply-To: <20260115173448.403826-1-lizhi.hou@amd.com>
References: <20260115173448.403826-1-lizhi.hou@amd.com>
Subject: Re: [PATCH V4] platform/x86/amd/pmf: Introduce new interface to
 export NPU metrics
Message-Id: <176892084537.15580.12089679537024504744.b4-ty@linux.intel.com>
Date: Tue, 20 Jan 2026 16:54:05 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Thu, 15 Jan 2026 09:34:48 -0800, Lizhi Hou wrote:

> The PMF driver retrieves NPU metrics data from the PMFW. Introduce a new
> interface to make NPU metrics accessible to other drivers like AMDXDNA
> driver, which can access and utilize this information as needed.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86/amd/pmf: Introduce new interface to export NPU metrics
      commit: 15e19bd95be5c79f2f98b727edda002ba86f8d03

--
 i.

