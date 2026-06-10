Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B061D3FF882
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Jun 2026 11:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781091661; cv=none; b=lbZgYe9TdyUHIVcQtIPvPCKUlKUD13y86WP2xZIV0gO0Db/VDyJmFA+4adpOJkpZYScWAur2AuXflJB+ziSBm0K7+OxuvTHyiEsxq8zUdtT6UQaCMABjrh1uui8JY35vVrUhuCWiz33DTVWz1FffbvQLho1TNMAurGYrxuMJFM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781091661; c=relaxed/simple;
	bh=s3p135PEXkTEK6xs4V3AdQm0gZsGRmXBYS4GHc7sMsQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UpxGcEfy3R/m8bSyTmlI8YKFP9ZHZUa63twaj4uH8MrHnW86sKvyXtgAAKrxPrLIcLtLWXxDMi1UB8ei1bRAdrYDxt4PMnVJyBo9lcglJ4GBkZW7dsPA8XunJ5P8vMoCkSydEXZQedZxzAW5PPOhPFqh/NS009hk2PfwNyhOnwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j4vonf5J; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j4vonf5J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781091659; x=1812627659;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=s3p135PEXkTEK6xs4V3AdQm0gZsGRmXBYS4GHc7sMsQ=;
  b=j4vonf5JNZA4ye9vWZxcDBfaERpMg4aMJfL+fipEk3MIUGXtV60ISjtA
   m7P5Apz81uNYdECw/6q7H+Ph1oomFLHXX/s0lhnETfznu/ctso/n/dadm
   Idijwc+zbzWzIKezr645/Wh/HpbBQyJL5hLtbojA4BSU+noAf5IoIxOud
   gM/S4L3IJs95Ng68qi2bPAjXPLHH0pjrlMpBdGqJoBwrud6t7/WOErkHK
   s/6AyJCoWDXa4fMJr43NCFOwgYI4NabaYy9UovkCDvvPDLpqz1ltG/OuE
   hBNOI16z4IDTUKf292nKcxdxDtB4H8NryGSlzbiL+B8d8g7YU6VV+tiJ8
   A==;
X-CSE-ConnectionGUID: /MBezUK8Qr6p4D/qvFIzrQ==
X-CSE-MsgGUID: 1oaPJO5TQ5qn1NtQWxdj+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="81924256"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="81924256"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 04:40:58 -0700
X-CSE-ConnectionGUID: dUHYIXa4SO2uABuOv+ooDg==
X-CSE-MsgGUID: SdG2mn6bSGWkMDt1aq5z3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="243685011"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.18])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 04:40:56 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: platform-driver-x86@vger.kernel.org, mario.limonciello@amd.com, 
 Sanket.Goswami@amd.com
In-Reply-To: <20260609143952.2999707-1-Shyam-sundar.S-k@amd.com>
References: <20260609143952.2999707-1-Shyam-sundar.S-k@amd.com>
Subject: Re: [PATCH v4 0/2] platform/x86/amd/pmc: Add support for AMD 1Ah
 Family 80h SoC
Message-Id: <178109164884.12333.13560049650521097641.b4-ty@b4>
Date: Wed, 10 Jun 2026 14:40:48 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Tue, 09 Jun 2026 20:09:50 +0530, Shyam Sundar S K wrote:

> The series introduces the necessary device identification, refactors SMU
> mailbox register handling for better maintainability, and configures the
> SoC-specific register offsets required for SMU communication.
> 
> Patch 1 refactors the per-SoC configuration by introducing amd_pmc_cpu_info
> struct that consolidates SMU register offsets, IP block table, and OS hint.
> The individual smu_msg, num_ips, ips_ptr and scratch_reg fields in
> amd_pmc_dev are replaced with a single cpu_info pointer. Per-SoC instances
> are embedded directly as driver_data in the PCI ID table via
> PCI_DEVICE_DATA(), eliminating the amd_pmc_get_ip_info() switch statements.
> The AMD_CPU_ID_* macros are renamed to PCI_DEVICE_ID_AMD_CPU_ID_* with
> compatibility aliases retained.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/2] platform/x86/amd/pmc: Use per-SoC cpu_info struct for SMU mailbox and IP info
      commit: c3a2521bcc8e4913a246132f276e5ce1251dd1cd
[2/2] platform/x86/amd/pmc: Add PMC driver support for AMD 1Ah M80H SoC
      commit: 043af31c8d3031bbeb77dfdc6373005ef3b8a23b

--
 i.

