Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E354D1BB680;
	Wed, 31 Jul 2024 09:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722418703; cv=none; b=Vc6r1iqYmJbfIxeLMTgA4B7UaYgmMj4kvqEi0g3oSa6Qa0hBSCzrZSSLD3NpVO9vGVbJ3XCoZA3SyySXaOwIEFkV69QFj+G/MZFyzslqm6ZXEHwle3hnyu4o3BKWKWPECZCHaIcPBeOudrmr1sq1z8LAz0E/tdgOa//Usiemk3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722418703; c=relaxed/simple;
	bh=El/OlgAxq9TxrIRKfWMSE97vAAk/9ll8cfMmyIfgNj8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DbMPhCf0SEMJUzYlApjqwVR5GFaM482bfQRP+lZxwKtVqQnP6WU7/Q3P2ZrNTNRt6xyX/SGm8SzI36/RZrhAb+MLGuzexraF5fG7EvpHkZhsGB6gL0OCMymBnBCBtNOt/uaH0mtnLoo19+y02dXbBXtNp32vSVZ/lZBLd+Z5bZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aKlziU4c; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aKlziU4c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722418702; x=1753954702;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=El/OlgAxq9TxrIRKfWMSE97vAAk/9ll8cfMmyIfgNj8=;
  b=aKlziU4cTVDr8wHKbZHPBEEb3edjBZqAwV3v9HANnwj3fZOYnKFYSRZd
   cBfKDYB6VGcO0s2KR4byncdsK2CupiwJQqjGfaSsTHA829GByoj5nJYQm
   NwpYn7zpgR7loXzAnYdBvO2mmZ1DJ7h4R4NONM7UMgCzndX6j5rUTENTp
   4ShjFp08LxHfFMq6AANyqLFh667Le9s+PjGzRn85zG3qRhBeSEn5rRnTb
   LPoUqdBzFVoXucW2sTcjUpaXkJoM2MgWIN4DO1sVDFR0CEV7ADCm45uY7
   d33ok+G7LlfXjgwTFRx4vjAfFT5Exp2N3cXXz2b8rdjaO+xB/GGt5zhCD
   w==;
X-CSE-ConnectionGUID: l0BL+mDaSHWK0L7dYRSp1A==
X-CSE-MsgGUID: NXu1u1V+Ts6sbCKAYYAfyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="19977563"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="19977563"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 02:38:21 -0700
X-CSE-ConnectionGUID: Wqu9KbqWRn2Bk4IWFP+HLg==
X-CSE-MsgGUID: AjgKXyRrRC+PlpZVc2jZ0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="58755505"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.244.118])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 02:38:19 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: W_Armin@gmx.de, corbet@lwn.net, 
 Luis Felipe Hernandez <luis.hernandez093@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org
In-Reply-To: <20240731001602.259338-1-luis.hernandez093@gmail.com>
References: <20240731001602.259338-1-luis.hernandez093@gmail.com>
Subject: Re: [PATCH v3] platform/x86: msi-wmi-platform: Fix spelling
 mistakes
Message-Id: <172241869235.1738.12798114511419991351.b4-ty@linux.intel.com>
Date: Wed, 31 Jul 2024 12:38:12 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Tue, 30 Jul 2024 20:15:59 -0400, Luis Felipe Hernandez wrote:

> There were a few instances of typos that lead could to confusion
> when reading. The following words have been corrected:
> Binay -> Binary
> singe -> single
> chaged -> changed
> 
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo branch. Note it will show up in the public
platform-drivers-x86/review-ilpo branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: msi-wmi-platform: Fix spelling mistakes
      commit: 6e73c490445ae77c52f62fcf9a49193d17c6f79a

--
 i.

