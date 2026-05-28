Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E113EAC90;
	Thu, 28 May 2026 12:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779971007; cv=none; b=JJDCHcve1vVa2B1mNUdcn09iahyNomFgAK450kdPGcMbY/K74ulv6NZH2BtBMsYfBKVaiK4jcI10SmmNNh6gMJ+d6nxSWSrmXCAsc+L0qQhPGmX9XRkioML18OcWL85uIPp9vs6SF0wpLnZxZpwzGPHGfjofl+7g31aQEtquSas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779971007; c=relaxed/simple;
	bh=Aq/KCrmnEx/ll3aobgBNYLPr93yg4tFKuNxBv8xDlk0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=t5JJNCXCTni8cKQa4ZtxrTOiIyhI+yeHLeA0XWXVSXJXzpYXQHFQl3wvyXu+RmyTBmUMH3ApmL31ao/VFKBk+75li4Milki66naYnG7VDjaCCgyOMV5Q5TsKqnKiYdhwrg3DUqTmrQqwoKvyzwYnC0SWnlRHEeGpZfTPj0Td0L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UKyAijp3; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UKyAijp3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779971007; x=1811507007;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=Aq/KCrmnEx/ll3aobgBNYLPr93yg4tFKuNxBv8xDlk0=;
  b=UKyAijp3qc/6f5yLUh2gQjBORqhdo8QvXr07TtStIL1+zn0y8T491uJQ
   fgBHyPRS4ZJBIiPIUoO2+zNFfKcTk3TGWQ065MVDH70wUC90qblF1D4h1
   6u0JSTHgO+teT5e3zEYakhG/uTyL0WpY9WNWeCuHemAqa5vn3pvdrG0Hu
   h2uGhQ/vukGHBIPEklWIFvAqlftsFTijkSeVFe8BHXtoM2WwuS8J/e5yW
   Cp7EMGrjE15AqqZ4OGJFKCh9ofS+8suFQjMhXZ1yFfND0XpnXdhqmqVJA
   E/igLLzdsVd0Pd8QepbITz/MFiQv37ImGLuhoPKKQfC3cV/lyB16vi6IE
   A==;
X-CSE-ConnectionGUID: K6ejBHUjRVC1YM1r6ctLpg==
X-CSE-MsgGUID: BP1ldiSQSh+RZz0YaZwxCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="83388266"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="83388266"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 05:23:26 -0700
X-CSE-ConnectionGUID: 9TxhChYHRDyFrOsChyLEiQ==
X-CSE-MsgGUID: /gMGqRrARW+HD5wn8Hv0kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="241702984"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.187])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 05:23:24 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: teackot@gmail.com, hansg@kernel.org, 
 Luis de Carlos <reskoldo73@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260527134750.25263-1-reskoldo73@gmail.com>
References: <20260527134750.25263-1-reskoldo73@gmail.com>
Subject: Re: [PATCH v2] platform/x86: msi-ec: Add support for MSI Pulse
 GL66 12th Gen
Message-Id: <177997099863.10161.15347856561327298267.b4-ty@linux.intel.com>
Date: Thu, 28 May 2026 15:23:18 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Wed, 27 May 2026 15:47:50 +0200, Luis de Carlos wrote:

> Add the firmware string '1583EMS1.109' to the ALLOWED_FW_10 array.
> This enables Embedded Controller support, including battery charge
> thresholds, for the MSI Pulse GL66 12UEK (MS-1583) laptop.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: msi-ec: Add support for MSI Pulse GL66 12th Gen
      commit: f9d421b9aca3cd866631f79c76d8db6e1434e009

--
 i.

