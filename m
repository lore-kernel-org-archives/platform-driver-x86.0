Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4301B42F543;
	Mon,  2 Mar 2026 16:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772469810; cv=none; b=MP62FT7a61GySQOuYh7SPy2BCIR74fNk3uzhe6H4Yw8TFFaXteX/TCf8A367sKc5My+i9pIjhTItivEkadY5jEdnnQOtnMzbW4El2MA8TbLkPOzjn1y4zIBpMbcdCTa91kY8quxBkr3s/t6f859SOXDceB97xqri0ll9cgTTVE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772469810; c=relaxed/simple;
	bh=OQS6J9jrqZ5GEulhqqXQeNfkKdeL38y0tjCbOyQiN1w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mi5m9Trd62A0rGpVCzyn1CWclTrtX1wBPwWbX1rxexQqeegz7VOl0qtGnkn1czSSIMhnCfP3TyWLqjvNVd3+U/uBEkx8DIithyw2Ikc6iVXFpfvG3Y20LQb4lhTW9mJMY1oywxT6SWLFGUXD319De7sbiYQdWUn+rWj7emSFpz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LmcXZkhi; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LmcXZkhi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772469808; x=1804005808;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=OQS6J9jrqZ5GEulhqqXQeNfkKdeL38y0tjCbOyQiN1w=;
  b=LmcXZkhiPmWadNhgZxWkPLUI9//7bjLD6c9nBuATrLci8liJu1pdjFtm
   C2vxI9XX9UaySRxMPaklxw7IPDHBQKcnVx5TSdPdY/3K7C0MUz3JK3KJY
   DUSCtrkIz3dOlG7Oi0EXJWMFXg2BCTLVuh/m6XNHZL0/5K4grge6EFHJm
   AQ5zjfZKj6SHLIf7dEJ9c5h53+slZ8R+V7TwK0wMcV3XPwg+jxRhZdnHw
   18HR96Ur6s6Xknma0ZRsSlhjKzeALeCqYxWx1gJqjTdoG03JwfcGp/vdU
   xSZnqrb9+8GQ+Vn2g9r37A0L6+s/n6gOb3UCBxfDz+4E4w54r9oHC9WdS
   g==;
X-CSE-ConnectionGUID: GtyMHgrVQwyZ6jlwq0jRUw==
X-CSE-MsgGUID: tfMakWDKRUyi1w9/X4jumQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="77349407"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; 
   d="scan'208";a="77349407"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 08:42:54 -0800
X-CSE-ConnectionGUID: X13twFrrS/27aYS6BhtjzA==
X-CSE-MsgGUID: qgnbNoQKT7+WH0KHkF4e5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; 
   d="scan'208";a="215322343"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.116])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 08:42:51 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Prasanth Ksr <prasanth.ksr@dell.com>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Dell.Client.Kernel@dell.com, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260223-sysfs-const-dell-wmi-sysman-v1-1-8a690884044e@weissschuh.net>
References: <20260223-sysfs-const-dell-wmi-sysman-v1-1-8a690884044e@weissschuh.net>
Subject: Re: [PATCH] platform/x86: dell-wmi-sysman: Use standard
 kobj_sysfs_ops
Message-Id: <177246976574.2818.14422510853903290469.b4-ty@linux.intel.com>
Date: Mon, 02 Mar 2026 18:42:45 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Mon, 23 Feb 2026 21:59:07 +0100, Thomas Weißschuh wrote:

> wmi_sysman_kobj_sysfs_ops are identical to the standard kobj_sysfs_ops.
> 
> Drop the unnecessary custom copy.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: dell-wmi-sysman: Use standard kobj_sysfs_ops
      commit: 1b0b124a9c41bf384f609003a97ba35a25fae130

--
 i.

