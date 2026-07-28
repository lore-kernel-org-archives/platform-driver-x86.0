Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F61474279;
	Tue, 28 Jul 2026 20:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785270277; cv=none; b=A2flDukmy7ZPjVGj67+Gmy88/eFJz/NS1VN5Vnkr1FpjDLjtIqfbj4NchJ5lfrjQAemdBd8+gU6wc7VVu31H8jzw771wQKy/VsEaQ6wsTmeRS4m5O434FLXdeFBfsF++IY0F5IYbGHdPQDQPoi5MtmCI0TUeDwidz+QDS8IxbLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785270277; c=relaxed/simple;
	bh=azu2ab4tuY8naL7hrmFwqw8IFMJx5Cq+eJqMYcsNYNM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=u9tUB7haeA8HmVbaIx+nayDJeROPPOHd0GVotjdPz4Dkhmt0RNO5XlBAKzpoZ8TJkI1FXYYS8v3N3+D6vhwe+i17SAi924PKe6qGHwpZVEao+naZXN9d3MbeGUTwCRMsL8s7F2tCtdWQ9AAG96wc8JzO3wbFnUP+ocTmS+3N0Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k1JCOLMy; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k1JCOLMy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785270276; x=1816806276;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=azu2ab4tuY8naL7hrmFwqw8IFMJx5Cq+eJqMYcsNYNM=;
  b=k1JCOLMyvgWN0OekcHPZpTvQKFeCx4rSuy9g1JM2CCLwXakggdlhL1Pk
   PtuOUC0pT04NtPxPsfdVvBCX2h9OlkCV6SXwdHQZVcKdIrpcRAnOaisRk
   5MOinWyMp2laU0AZs8zLn5UIVygK3tgFubvKZhTtMpvJx1h+YOf09U2IW
   D0NptoVZc+Jz7z5OVg5NxFaxZRCe6mnuZJNoSyKs/62IhVdNrcBoIXVmH
   rG05ApySznctZ93c0+k08Zsla7sq2numTVmRWA+wE4ZM0iOlPpNqLtQA0
   iuPxLe6cG9vVz2W3/KWVVUWKCwaQDZ5ZWB0fYa/YNXWCujgoWLxQfryLS
   w==;
X-CSE-ConnectionGUID: 4G6qg1FKR7WlxfjoaoShuQ==
X-CSE-MsgGUID: UI5iWZsHQzqRrvqi45Nt5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="84995779"
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; 
   d="scan'208";a="84995779"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 13:24:35 -0700
X-CSE-ConnectionGUID: MZCtvRnqS2Snxh1c5KP2ng==
X-CSE-MsgGUID: w+86d0s5SuC/ZLKQXg9z5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; 
   d="scan'208";a="289766041"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.129])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 13:24:33 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Muralidhara M K <muralidhara.mk@amd.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260727141542.3370108-1-muralidhara.mk@amd.com>
References: <20260727141542.3370108-1-muralidhara.mk@amd.com>
Subject: Re: [PATCH v7 0/5] platform/x86/amd/hsmp: Family 1Ah Model 50h-5Fh
 HSMP and metrics
Message-Id: <178527026839.10348.9693287935519472388.b4-ty@b4>
Date: Tue, 28 Jul 2026 23:24:28 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Mon, 27 Jul 2026 19:45:37 +0530, Muralidhara M K wrote:

> This series extends the AMD HSMP platform driver and UAPI for Family 1Ah,
> Model 50h-5Fh: new HSMP message IDs (including the PQoS-related IDs),
> relaxed response_sz handling against the descriptor table,
> firmware-reported metric table sizing for ioremap and reads,
> HSMP_IOCTL_GET_TELEMETRY_DATA on the existing character device for a
> single-shot full-table copy, and ACPI enablement for protocol version 7
> tables.  Documentation is updated in Documentation/arch/x86/amd_hsmp.rst.
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
[1/5] platform/x86/amd/hsmp: Add HSMP messages for Family 1Ah, Model 50h-5Fh
      commit: d30569cb5aadcc623accf0422132d0bc0286a9ff
[2/5] platform/x86/amd/hsmp: Unify response_sz validation to an upper-bound check
      commit: 9185ad51dfd2bc8bde0c7e7d9f4493d8758d4fab
[3/5] platform/x86/amd/hsmp: Source metric-table size from firmware
      commit: 96f1ba765ab55d57ee2a2bf88e05c2ee699c7c5b
[4/5] platform/x86/amd/hsmp: Add IOCTL_GET_TELEMETRY_DATA for metric table reads
      commit: 5273183b6362cad9584bdfb5dddb2df30e4f5477
[5/5] platform/x86/amd/hsmp: Enable protocol version 7 metric tables on the ACPI driver
      commit: aca39607c1734ed976fdd65deb75b3555a5a0326

--
 i.

