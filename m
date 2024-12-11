Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5000E225A56
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Dec 2024 14:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733925705; cv=none; b=hTkGVbbx0By4WOmJMq5DGNqgWvfZGu+G/xWFZ4jUSsFQH2q7JaNDjBlfA8UEZ84pO6nTlwzyrjCeSdzY3SR7f3ebR2HITY9KkYtW/Lhwd0152ASVklYXtC2fA98JYhuCJyWDpKXzDhkUQYARQso18ldKh/+UABS3uZ/4o+k+Igk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733925705; c=relaxed/simple;
	bh=cWmQ6VGYwwhfzw5aiUL6jwGa52F7ogCbQKBEXbj60Ms=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rG+OVOGr3RY9AjDHL1ugckabH+wB3HUGTzWfiEPXlJYPYiJgF4Kv72JAhETahZEca0M0S06u8i5b/TT51oBhhPFdmHHbg8KfNoauzu/WmIcxSLt5z1byZoUytcIsyizOTbn64YjXPTccES4Iik2qDiZRPHQx7YJbnrWZR1+I8z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=npQWEz0r; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="npQWEz0r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733925703; x=1765461703;
  h=from:to:in-reply-to:references:subject:message-id:date:
   mime-version:content-transfer-encoding;
  bh=cWmQ6VGYwwhfzw5aiUL6jwGa52F7ogCbQKBEXbj60Ms=;
  b=npQWEz0rl8KpqdAp0UGTmowBWX1/EF6CECiy00dCIDZfcbnuKAlZWVeh
   18nXYwVwKWOlInDdc7BXs7rGrqedSwdWbd3kNdIwUWfWrnu72ZsVRV7/p
   k3s4fezr+rlEt9HrlQpZaBJ1vmya/JSE+vz1rdhCaAh4LJk3RmrwYqxbs
   XkuaOyy8yTbkOP8gthQIawjjg44hihSFJXO0DfzrfV83uVLsBzwEq4EKF
   liyivT38N4wWMFZvgzcPU9A1+Ps9yhUiczKM/y08yXtI4d/u+UxKDW27E
   JRryDUZD0ULAFJiPt9TGT24M1TSA3h49tRBhgwdAryHyeVk6TgTzn9xOr
   g==;
X-CSE-ConnectionGUID: 5qoDEN6uS0KWq151D6ZI3w==
X-CSE-MsgGUID: PqXN6L+XQAeuTsk2HJofCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="44776211"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="44776211"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 06:01:42 -0800
X-CSE-ConnectionGUID: 61my9TaOSZCDYN9vLujzXg==
X-CSE-MsgGUID: v6PlTtT2RK6dnxKUGTpLMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="99910645"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.214])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 06:01:40 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: platform-driver-x86@vger.kernel.org, buingoc67@gmail.com
In-Reply-To: <20241210154500.32124-1-buingoc67@gmail.com>
References: <20241210154500.32124-1-buingoc67@gmail.com>
Subject: Re: [PATCH v2] platform/x86: touchscreen_dmi: Add info for SARY
 Tab 3 tablet
Message-Id: <173392569597.1862.623989873812371710.b4-ty@linux.intel.com>
Date: Wed, 11 Dec 2024 16:01:35 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Tue, 10 Dec 2024 22:45:00 +0700, buingoc67@gmail.com wrote:

> There's no info about the OEM behind the tablet, only online stores
> listing. This tablet uses an Intel Atom x5-Z8300, 4GB of RAM & 64GB
> of storage.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: touchscreen_dmi: Add info for SARY Tab 3 tablet
      commit: 220326c4650a0ef7db3bfcae903f758555ecb973

--
 i.

