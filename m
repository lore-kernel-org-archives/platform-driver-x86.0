Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0DD21DB548
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Dec 2024 17:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733161745; cv=none; b=gwSd6D01C9Mh5RCSn+wdeVnn42En23mtFaPaAvWlhC6L+vtBI8fNQK4fhVBnTO9ny505wO9NSI8ePlnvM4A6Z+poxk+3QL7oujErfFyJ6VrpY9GXuUnvTvl5/daP/KyrQxeupyiL02U2lNStDxfzyoAzYkuJRqaCjENAwUyibko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733161745; c=relaxed/simple;
	bh=MJIXbgHwG+Y7OY/tVEuxPDAypBmDzobv+I/zehEjr6g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pk169A7wvbgUv1IPE3mJPgCeAWUpiJtRQnpUV43ettgyQ0adj9p1R3cD0F56XvML8pgrqvm1FhNzjr3ejooOCpbVcq2mVxvq3l/MO6KwCbWS/IpFxHADQSMTXF60UByMvMRRzB8TZyJtiwoHYbI/nNaFpwrglBI3phMS2t02gyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L/nxo0Sz; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L/nxo0Sz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733161744; x=1764697744;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=MJIXbgHwG+Y7OY/tVEuxPDAypBmDzobv+I/zehEjr6g=;
  b=L/nxo0SzA8TCqj2Pwjh75Bp7VZGdDUFKGJu6EXfQ5Mqa2PsyjO8h7pgi
   pZMXSDO4agzdd2dwFCjdu2luktLvdX3BR3ZnArts22geaU6otFWLqiB5b
   OSaJ5so/vtR/Ck5WyDaAVr9zEU/wJftnu2xQ2TZlk8azfOiccCEbzqFlT
   X2nvYhQsuAM9Gcxb8WhOOxZxCrB4t+DO5i3RGB5Kw64Y1Q3TfUyIdnRfP
   oJiobDYtAaqUq93/ALd78Zznbn4xIKSLgJvzPijOxpbJaH8dn3w6mPYoK
   5EbzdAt+Rn8MIGpiDeN5P4r0GyuS2CjnXBOShdckfkuPDm5ho8nRVcyCm
   A==;
X-CSE-ConnectionGUID: O1mrk5AgSVC/fUOO8SWOYg==
X-CSE-MsgGUID: piLga+mBTzmztLYlBEb/MA==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="58747783"
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="58747783"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 09:49:03 -0800
X-CSE-ConnectionGUID: JzmJAvbLQFupHk/n4smFQQ==
X-CSE-MsgGUID: omElbMFRQZOCSzqMA58CpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="93076705"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.61])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 09:49:01 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: platform-driver-x86@vger.kernel.org, Suma Hegde <suma.hegde@amd.com>
Cc: hdegoede@redhat.com, 
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
In-Reply-To: <20241118102752.11703-1-suma.hegde@amd.com>
References: <20241118102752.11703-1-suma.hegde@amd.com>
Subject: Re: [v3] platform/x86/amd/hsmp: Add support for HSMP protocol
 version 7 messages
Message-Id: <173316173604.27896.6281260511503596071.b4-ty@linux.intel.com>
Date: Mon, 02 Dec 2024 19:48:56 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Mon, 18 Nov 2024 10:27:52 +0000, Suma Hegde wrote:

> Following new HSMP messages are available on family 0x1A, model 0x00-0x1F
> platforms with protocol version 7. Add support for them in the driver.
> - SetXgmiPstateRange(26h)
> - CpuRailIsoFreqPolicy(27h)
> - DfcEnable(28h)
> - GetRaplUnit(30h)
> - GetRaplCoreCounter(31h)
> - GetRaplPackageCounter(32h)
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86/amd/hsmp: Add support for HSMP protocol version 7 messages
      commit: 836d0d7107e53e6479b60d32fb73bd5f7813e5d1

--
 i.

