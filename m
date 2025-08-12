Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38751E0DE2
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 Aug 2025 12:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755001749; cv=none; b=IU43IsgAXstsuzmNoXEmXTA2fOJPaNUWPXCPsp0P5n6gSruyyQnUFxk+vtG+U/c6M2EhpCUlRpAE0Z0NZRhE99JYjw/UE75lqMVNrIP5sHnYmRLMu0o5UpIvu8avs5tTdmqQue4eVwHgSanB3dGVe5bZGzKRD9t1uM7E8smqR+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755001749; c=relaxed/simple;
	bh=ghOFNqsumOqCIoL7SyjKrQhUtogDKg/AsedIGVNGB4M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=IdgmiqwkLqgCo1Eh90OEahqlvYra8Ov+6Ex7ONcu138KXyrwzOB3PLDJ16VX3wvHpjpISbhC9lXalHsgnMff8heBD9y+ylU9IUjOFMXaau+YnZuYSV7FLE6WeVjWpMlpYmhpvPWrSS+sQ+bw+W91Mh7iWZssktMSnrBXQiiGqJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XEemakqz; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XEemakqz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755001748; x=1786537748;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=ghOFNqsumOqCIoL7SyjKrQhUtogDKg/AsedIGVNGB4M=;
  b=XEemakqzAL+taIYGZzW/2idrjpaQRm2cQ5NAOtd4n/eF/GXa4yio4eRF
   5U7gVtG13O22SGAZ0J2E3QSmomg+7cY/lg5uXFXCczXFl+/kXQTAM9zqP
   gUO05wL6/KbRIkmzXLDdAgsfdsa7j79pq6GfWfV9Nv7kDeglmXhVT2pb4
   e+R3l1BEYhxInCYjKFRwFikL7TjmI1/aPw46fPn7AS9co5jjInUOuA/HR
   AZZyAE+WqmeYIhcaDVDU+AEZW3UdHyykXN/dJdby5hj9HTpcF4+R8EUT9
   lfhVW4PadltMCfYZrC/sI+/1qxOmpFil+oolpl+r7/zg2qvGiPCjm+SEK
   A==;
X-CSE-ConnectionGUID: iard4fjsT0uB6bxQN4Jk/g==
X-CSE-MsgGUID: +N2nV4SjRKWiHfsRYqrBFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="68648830"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="68648830"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 05:29:07 -0700
X-CSE-ConnectionGUID: rB0kKhT/Tra2re6X9FDLYA==
X-CSE-MsgGUID: HzMmkTfUREiQuH2rdCZw/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="166548267"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.96])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 05:29:05 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: platform-driver-x86@vger.kernel.org, Suma Hegde <suma.hegde@amd.com>
Cc: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250804101551.89866-1-suma.hegde@amd.com>
References: <20250804101551.89866-1-suma.hegde@amd.com>
Subject: Re: [PATCH] platform/x86/amd/hsmp: Ensure success even if hwmon
 registration fails
Message-Id: <175500174099.2252.3823709996152765569.b4-ty@linux.intel.com>
Date: Tue, 12 Aug 2025 15:29:00 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Mon, 04 Aug 2025 10:15:51 +0000, Suma Hegde wrote:

> Even if hwmon registration fails, HSMP remains accessible through the
> device file, so the operation should return success.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86/amd/hsmp: Ensure success even if hwmon registration fails
      commit: de5cec220e4d45d7129e76f7d985c7b01f10f8d9

--
 i.

