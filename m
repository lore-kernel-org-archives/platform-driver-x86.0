Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AFC30E84D;
	Fri, 24 Jul 2026 16:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784910552; cv=none; b=aPx2hLEIFaqFbtOyjscGbd5y5sStE9yFF8RCj86Kpy669b5pbZGvRMORnRMw/EFfCk7veOHlcdmlHSCMSPfPo56qRN29sYVfR2/KO1eitd6s0/qJCLq14zrqR0EOd58P0SP81oSIR5avHXLL4Db57h6GjJaoMozlNKa09Zju/vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784910552; c=relaxed/simple;
	bh=ojIk6avsidxG4f5SuJt4LrwWWrvmgmDlIfvXEv4z+9E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=T7wVvUFOxsmYpQPCAhLwWqXoO1Dti01y3k4ZJGb+8vUzuuZjrtC7JSJkSNF7TTa0N+nnWgTcK5m4aqEKmr7lJ7RDaelZOTYFVUQ9yZ5D2c56ekct/eAR7kwCsaLqRz5/3TQO51VWneevfjSdzXrog55CI7T/WTb9dxEnmvv47Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P9kYrW+h; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P9kYrW+h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784910550; x=1816446550;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=ojIk6avsidxG4f5SuJt4LrwWWrvmgmDlIfvXEv4z+9E=;
  b=P9kYrW+hqaXgBXF0sXhon2fFnTNeeBOVrAe2ja1kBxu6N0QS4Z5vYnU+
   VgJM+K9iDvrf0gcAl01+x4v2H8BkyKBz7Rmv8HL1RDiXowsVvBkpQDOc6
   +SZNywowLIsqXR2fJVV36d2wvBqIZpsRVd2bfv95dPtvjBipOhqfIavRz
   ewhdK/WTzXq4cM/L848teR784131l1PKHZxcA+Fxj0v3iT1tnavcV2i0q
   1IXAz07SAv9PWoVERTxyaWjqOtBbr4ag7Y47yTWR0aY0YEgP0womLuO31
   oA2KkvyCBtbxzK2FuYr9IuNMH2+FYccrZnAn6s81cTM1D0VQ8GDc49r4E
   w==;
X-CSE-ConnectionGUID: fbBvxKZlT7aMKPNp2rhbDw==
X-CSE-MsgGUID: Wh8aWY/ZSMWzoT62/+h6bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="111123637"
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; 
   d="scan'208";a="111123637"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2026 09:29:09 -0700
X-CSE-ConnectionGUID: zgB0nyZ9RBeogKi/7WSnCQ==
X-CSE-MsgGUID: RqMjRSyGSF+cck+emyY9cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; 
   d="scan'208";a="262538925"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.8])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2026 09:29:06 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, kr494167@gmail.com
Cc: jackbb_wu@compal.com, superm1@kernel.org, W_Armin@gmx.de, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260724125533.74751-1-kr494167@gmail.com>
References: <20260724125533.74751-1-kr494167@gmail.com>
Subject: Re: [PATCH v2] platform/x86: dell-dw5826e: fix ACPI _DSM function
 index and bitmask usage
Message-Id: <178491054055.24171.10115266175495769020.b4-ty@b4>
Date: Fri, 24 Jul 2026 19:29:00 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Fri, 24 Jul 2026 18:25:33 +0530, kr494167@gmail.com wrote:

> PALC_DSM_FN_TRIGGER_PLDR was defined as BIT(1) (value 2).
> 
> acpi_evaluate_dsm() expects a 0-based function index integer (0, 1,
> 2, ...), whereas acpi_check_dsm() expects a bitmask of supported
> function indices (BIT(1), BIT(2), ...).
> 
> Because PALC_DSM_FN_TRIGGER_PLDR was defined as BIT(1),
> acpi_evaluate_dsm() was evaluating Function Index 2 instead of Function
> Index 1, while acpi_check_dsm() was checking for Function Index 1
> support.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: dell-dw5826e: fix ACPI _DSM function index and bitmask usage
      commit: 39490ec6063d9dc3d995b7b48fc5106cd361a547

--
 i.

