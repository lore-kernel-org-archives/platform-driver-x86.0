Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4093C21018D
	for <platform-driver-x86@vger.kernel.org>; Mon,  3 Mar 2025 12:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741006006; cv=none; b=hW+k6JC9ispuF22+gtCt+g/6nCaHfPDsZwAYcqX3at/FM83h+RQSxRG/av8lumJLjdmNLZk63KxAj7yBUYXurKsB4vDEUYAocb0vyQxQducbv/txNcIusmCmyWzbrEQH2A+/zTPMnat8Cx/MIi+7HkzJ4kqN7voaVHGGo1KGdHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741006006; c=relaxed/simple;
	bh=AHP0EgeMRxoShquKz3H/LBW9ID/H8hcnblfgNDBCepM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cRaLFaL4eZqsO0jG8vdT3GvOVJhjtOAa5yGaZw1cFejZ2H496dJchn3QW7I7AtuM7I3Zwprs3EQxeX2BxPNvivVxrrZnHotBc7Ysqtor9O6XWjNdy168y7w/inR+9aBHRgJNqOgPZ/qrUSmVfewPe58m2ed+q/F8FSCmvlUS8hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LgJNT4lo; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LgJNT4lo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741006006; x=1772542006;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=AHP0EgeMRxoShquKz3H/LBW9ID/H8hcnblfgNDBCepM=;
  b=LgJNT4lo0Z4MhlO1Th+V3uu0UeosOzvA84OpwPuOQnxggLdYGj+PWTep
   YOuoOrZK52BgtrVnPt14N7U9oCAOK6s4elPmJQoRRC2Te0IF0h5++xXU7
   DmHrUKWr6hkOEJ3BGQxi69gSkjHUsABwPAOeXcA3z6j4nT7zOwpkiOs1V
   M2JWhMqloh7z9PDCEMkCe07Jb8Txabz24kM/fYk1ljWOzT/jWv6bHHwKA
   hjkxPrFtLaIr+EwE87VD6MM/BWktvY17aGaGqBEUOImApCKgPuQbQVJxq
   DrGMx3LLdzF+ZXZZXiiDAJOX3BY0sFV65p1fD7MVV5RllVodIIeUYLjfc
   A==;
X-CSE-ConnectionGUID: JI10aGGwSrqxPAMh7JapOw==
X-CSE-MsgGUID: equ5vP71QrqrqeaieihSag==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="52855650"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="52855650"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 04:46:45 -0800
X-CSE-ConnectionGUID: QFmh2Je/QnaTpo7Z/Gu03w==
X-CSE-MsgGUID: ynrQ9v8TTTCDxWsKHPYSbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="148809694"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.14])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 04:46:42 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: mario.limonciello@amd.com, Shyam-sundar.S-k@amd.com, 
 hdegoede@redhat.com, Patil.Reddy@amd.com, 
 Mario Limonciello <superm1@kernel.org>
Cc: Yijun Shen <Yijun.Shen@dell.com>, Richard Gong <richgong@amd.com>, 
 platform-driver-x86@vger.kernel.org
In-Reply-To: <20250227170308.435862-1-superm1@kernel.org>
References: <20250227170308.435862-1-superm1@kernel.org>
Subject: Re: [PATCH] platform/x86/amd/pmf: Initialize and clean up
 `cb_mutex`
Message-Id: <174100599620.2518.13745013485643453420.b4-ty@linux.intel.com>
Date: Mon, 03 Mar 2025 14:46:36 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Thu, 27 Feb 2025 11:03:06 -0600, Mario Limonciello wrote:

> `cb_mutex` was introduced in commit 9e0894d07072e ("platform/x86/amd/pmf:
> Enable Custom BIOS Inputs for PMF-TA") to prevent conccurrent access for
> BIOS inputs. It however isn't initialized and so on use it may lead to
> a NULL pointer dereference.
> 
> Add code to initialize on probe and clean up on destroy.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86/amd/pmf: Initialize and clean up `cb_mutex`
      commit: 1be4e29e94a6be77de3bc210820b74f40814f17a

--
 i.

