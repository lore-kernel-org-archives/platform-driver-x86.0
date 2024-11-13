Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FFE15A848
	for <platform-driver-x86@vger.kernel.org>; Wed, 13 Nov 2024 13:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731505977; cv=none; b=pxj+yA+36fDZ0WGyqiIrlA1xBgR++WulJYTczRUI5m0cAPDBQ9sIBVPUZMefTxYSUBdrq9PdzwAVzWhpdspuaAR07e2kumpzRdlWWhhuj5S1HVi1/FkXT/OlIQy1Fe8DHRtkLVgN5SbKi2+QhIEaBlWBDWQbTouu4bbJkMoFmIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731505977; c=relaxed/simple;
	bh=y1qfVXpOfUgiY53SIJb/Y3UubgplhpFk7k8yXuVumpI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Uc1TajzqQz25BK+b9AP7QjBmmN1DAxb+3fpAgrebmUa8W6dmY1qYFyThRtwnvlNXZkJg17fCl6JnpYk5hUhvDzPsZxDBsRYgywC2VmB9IQBznbwo9x3LHo/LFZCpKNj1t61DQkM00sJPxcAVMTqCKPnpH+5p/62M3O0vN8xIUYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ow/qbEHo; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ow/qbEHo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731505977; x=1763041977;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=y1qfVXpOfUgiY53SIJb/Y3UubgplhpFk7k8yXuVumpI=;
  b=Ow/qbEHoHu9NXzDA3UVCOHz2GWIayhE6+uCsBAtHu9UpgAMLmiyVvImW
   RGp4owPUu1LAqak/iuVs+dDvVGqLbP1IxKd3dSmRahoj3JK0VkhBX/PVw
   oSV8k5Kb/dltI6SLyM9czloiWTtI38p9aPGa6kHS1rkVVkUpJXafjhrhp
   XXUVlLuR8d5ZuG05ituz4aJLguY9c1wbbZdHlzzsgZNmssESSNr3/KczG
   WxW1zktAP6ALvXKMYLjlkxgdvNTDaHxDEhY3ypki8k2xi2aQJwMkVDjbK
   lNdGqMD2F64mpYwxrnRj4rJ98RXEq6UVjBnKicLdEyXSsMRWsf08K0kzU
   A==;
X-CSE-ConnectionGUID: GAMa4UcqQTm6hHPzzdzmjA==
X-CSE-MsgGUID: DkZnxVRATKu2hl2e5Y4q6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="35107482"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="35107482"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 05:52:55 -0800
X-CSE-ConnectionGUID: oyjs6JsyTc+IRc7HWFdBdA==
X-CSE-MsgGUID: iuT9IYzxR9W5mUgr0WpHKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; 
   d="scan'208";a="92957456"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.181])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 05:52:50 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: platform-driver-x86@vger.kernel.org, Suma Hegde <suma.hegde@amd.com>
Cc: hdegoede@redhat.com, 
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
In-Reply-To: <20241112120450.2407125-1-suma.hegde@amd.com>
References: <20241112120450.2407125-1-suma.hegde@amd.com>
Subject: Re: [v2 1/2] platform/x86/amd/hsmp: Add new error code and error
 logs
Message-Id: <173150596464.1884.7411341778571623513.b4-ty@linux.intel.com>
Date: Wed, 13 Nov 2024 15:52:44 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Tue, 12 Nov 2024 12:04:49 +0000, Suma Hegde wrote:

> Firmware is updated to send HSMP_ERR_PREREQ_NOT_SATISFIED(0xFD) and
> HSMP_ERR_SMU_BUSY(0xFC) error codes. Add them here.
> 
> Add error logs to make it easy to understand the failure reason for
> different error conditions.
> 
> Replace pr_err() with dev_err() to identify the driver printing the
> error.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo branch. Note it will show up in the public
platform-drivers-x86/review-ilpo branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/2] platform/x86/amd/hsmp: Add new error code and error logs
      commit: 996b318e6fce255035efd555837d1250433bb0e7
[2/2] platform/x86/amd/hsmp: Change the error type
      commit: 8560b2775a08bf511576a18922c3bde920e69494

--
 i.

