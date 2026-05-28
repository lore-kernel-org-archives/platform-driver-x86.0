Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327353E8350;
	Thu, 28 May 2026 12:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779970283; cv=none; b=ERItM92ugkFgkii0Hvh+wZQfdxQOuOL6SHrRoLEh7hKZgAmBJ6Ku/xXN+AOuP7mq7tuedn1SMNhv1rJKXXv96VDC808m0WWLzAWTCVgXbzs1/OXlGA7vk3BWheOwbOlaJduLtITcow631opjSMFl31yjp66MFVf8HyL4mO1+1yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779970283; c=relaxed/simple;
	bh=+eAWSJOlBBFO3H7D3B3hkgOBC18z+E3+gaTkkckX9bM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KHfFXMA0ojujT/yDCLEheSe7Hpy5D58vVTOSzL8sPx1/ouTzWL9X8PW/HCUni5bZ1vUNTbJ+G00QYgYr6Owwjtgj8fK+YsQBhKEXuU3ugNgdAWToxinBk7jRRP3HAECuWVLdWJV0iMn2ugf2KYTRc6fvA1eQ5OFD8307khLtqZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SghU9tVO; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SghU9tVO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779970282; x=1811506282;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=+eAWSJOlBBFO3H7D3B3hkgOBC18z+E3+gaTkkckX9bM=;
  b=SghU9tVOheoJyiz02dqd2L9r/gUEZmM3x0gSCdyRk6Km/BETxxOWX68B
   YaG6kw0kuflLEclgvCH9brpCKv2yvhYw2Pq3Xr5sLLIiJ+ERGYtG+zpai
   70dwMQeZ1aJIxLu1iGVimioRlf94gbFp3suhT+H0dYSE1GzJOfiINuC/c
   cMgVxbFTx31CXqTmbLKVHVkEXkq1a5ovJaMT2yFVGtM5tXR7wjP3CKSlT
   a1HBNMzZrEUzz9lW3Zg81tM0oHz5RKhVnalXxbx9tX6GjwnIWS2cCuxpu
   wY+HXHwFxKcWz5fjBakc/i7TwqmyXpS9/HM/VeDh8vUGVq1vz36j2Ye4A
   w==;
X-CSE-ConnectionGUID: TIQ1C0tlSLOLeGihYRRpJQ==
X-CSE-MsgGUID: gwDSOwmBQSyIzIkliCd+2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="80925223"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="80925223"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 05:11:22 -0700
X-CSE-ConnectionGUID: 9kQNEYTYRbWudcmTM8aamQ==
X-CSE-MsgGUID: IE3bNgKXQjqt9wzSdVO8tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="239522190"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.187])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 05:11:20 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260519154040.1594878-2-u.kleine-koenig@baylibre.com>
References: <20260519154040.1594878-2-u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH v1] platform/x86: x86-android-tablets: Use named
 initializers for struct i2c_device_id
Message-Id: <177997027610.9687.10842041130941311835.b4-ty@linux.intel.com>
Date: Thu, 28 May 2026 15:11:16 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Tue, 19 May 2026 17:40:40 +0200, Uwe Kleine-König (The Capable Hub) wrote:

> While being less compact, using named initializers allows to more easily
> see which members of the structs are assigned which value without having
> to lookup the declaration of the struct. And it's also more robust
> against changes to the struct definition.
> 
> This patch doesn't modify the compiled array, only its representation in
> source form benefits. The former was confirmed with x86 and arm64
> builds.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: x86-android-tablets: Use named initializers for struct i2c_device_id
      commit: 84b27a3cdd512f88ef837a913f8bb54c0b9d9290

--
 i.

