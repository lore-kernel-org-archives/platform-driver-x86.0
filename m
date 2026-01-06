Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E210289824;
	Tue,  6 Jan 2026 13:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767707190; cv=none; b=SptmO4mWHXP6Ui7bnoq2vLiDulsE1njDxqCf7+sXTSK2NK9sk33Ko6vr8IlUZJ49rW6KSg3cM4x6Cz526HjmVgwrI6cvoua2asiW3oOVHxirll/T1bwTERU8Ol03wztoTTX0fAgX4b0H+bkLqH7sWmRejWradMVZd4CMZKtzTsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767707190; c=relaxed/simple;
	bh=s5mrkN6oWWd04lj9UV0qqWv751JhTrGG5mJC6ALeQKg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=aBuS5FA2+24tYCx3G7tpGcsdMqxtSGadMGoXKh1yFyTgwrz3Qd5xN/ktglwSraH5PV9Fxx1SkPE2x5mIICLwuswZUBCbdNZKlzACz34UQoBV2w1aiyE36YDzRbg/P2VGqTjYX7idxcK2RAHf1OEWtWzS9hLfXr6k17aQATVeOQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gq9zLEr+; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gq9zLEr+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767707189; x=1799243189;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=s5mrkN6oWWd04lj9UV0qqWv751JhTrGG5mJC6ALeQKg=;
  b=gq9zLEr+MQ7f+/iF2r89GFmuHJDuLhrU/i5AJ8y752UXi09oFLpb2AsN
   5EjojpEeX1O/7WfOSCvLJMVnqGFWYdiKKucuj1XqsTUxYS9v/O0WeMm9W
   NP5IdM4EFE2DorziC1qTmbOIObEZ8RBSEHOVSQUIaVO4kMm4oNPH+fNv7
   NsiGjyaqVJtEOvvW2NPw1jOjqVIityi63f4OCOauVMmcezKtG9Gb+7Dyd
   teY51FRackPI5wR7wiw6t2iN+QrvrcdpphZ9wevBq6KO2H0mQveVLkxeN
   LiFUokb9RiS3Kk6ju4MshP0gSzxeUN+IfpqBEBqwXMjInlvXXc3DWjCbN
   w==;
X-CSE-ConnectionGUID: I970vZyTSZGjuHTqxTTGyQ==
X-CSE-MsgGUID: SxtnNJyvTjCBN3F7OEkIwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="91726668"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="91726668"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 05:46:28 -0800
X-CSE-ConnectionGUID: dpp26i9FRHa13hk/d4la9w==
X-CSE-MsgGUID: T71Qoc9lR1aeT4LP2qJHdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="207127884"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.6])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 05:46:25 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Chen Yu <yu.c.chen@intel.com>, Hans de Goede <hansg@kernel.org>, 
 Maximilian Luz <luzmaximilian@gmail.com>, 
 Thorsten Blum <thorsten.blum@linux.dev>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260105145045.52764-2-thorsten.blum@linux.dev>
References: <20260105145045.52764-2-thorsten.blum@linux.dev>
Subject: Re: [PATCH v2] platform/surface: Replace deprecated strcpy() in
 surface_button_add()
Message-Id: <176770718089.2365.17181925544709248266.b4-ty@linux.intel.com>
Date: Tue, 06 Jan 2026 15:46:20 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Mon, 05 Jan 2026 15:50:46 +0100, Thorsten Blum wrote:

> strcpy() has been deprecated [1] because it performs no bounds checking
> on the destination buffer, which can lead to buffer overflows. Replace
> it with the safer strscpy().  No functional changes.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/surface: Replace deprecated strcpy() in surface_button_add()
      commit: 1716c1e0860b42980f338b69b974149d035582ca

--
 i.

