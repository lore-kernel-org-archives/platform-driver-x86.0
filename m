Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56924A0C
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Dec 2025 10:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767005687; cv=none; b=KC4+G4dKjGMJyedhVcwRu46vPcyFw0U+A+6xcvbtKksumSCTqMymGgjHLlgEwYWM1xWwz4Giz/d8a23eAU6amP+jO+FCT6dobMYw6GfhMJXcJFQXooWn13hZwHVLeVn7D9gSRO6lE1douTRJjHGV52amhK3xaibBmxmvUkvSYzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767005687; c=relaxed/simple;
	bh=fOfmMKbyFL0YL/MSMnzXopQ1cVOGWVYiIxRefLPXkQ0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=g8BVGsQV0529HIY1xU82M63/qhbAV5s7pOlk5QVTX8/y375aoYXhCQ8AKIAB0IwlkIGBeR+DC+kwtd/R4ObVRMEQSWt+JBJXju+Ngwv1aMZBkbNqunmNeD2AbEv3bwjgeLwjY3Qkq+Nd22BJ10bc5uo6uf2SlBl3lA1J6ULa7HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wd1pq7h3; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wd1pq7h3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767005686; x=1798541686;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=fOfmMKbyFL0YL/MSMnzXopQ1cVOGWVYiIxRefLPXkQ0=;
  b=Wd1pq7h3BtZnJtHrfHGcEmyU5+2qMEQ61px3ke/wUf9moT4k9wFbdswX
   rKiRnefuIkCEaLZBpi+6OYyzJX0R7IrDnfZnhsE8S/ETLHvh+p/akdfBN
   2W2tW7S7aK696qEfISYmN68TenjAqXn40KILVZocd8otFg8HuURgDcL64
   gbiXYx+zdxZet+2YlD1FceS69Lcow7ocEAOeWZQQtt9ZFQ4tlWKBmXzQr
   pJxkUthluTSvrSk5ueG7p5rr8vbx6XEbVe0VFOa81ShGuBenArNnQS9jh
   gaqHD43HmnCnQS7tW5w25nhIkNaKTrnCzs22IizkJgZivZAe1EgBUtcjC
   Q==;
X-CSE-ConnectionGUID: Dhlmm1w1S2m5pMx9xv7gFg==
X-CSE-MsgGUID: zsVTRzIRT564yCE2/HlxfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="56187719"
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; 
   d="scan'208";a="56187719"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 02:54:45 -0800
X-CSE-ConnectionGUID: UNsDoCXbRcesHXYp8DHP/g==
X-CSE-MsgGUID: meKxWszzTt69rCddM3uJww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; 
   d="scan'208";a="205029350"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.30])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 02:54:44 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 29 Dec 2025 12:54:39 +0200 (EET)
To: Kaushlendra Kumar <kaushlendra.kumar@intel.com>
cc: david.e.box@linux.intel.com, Hans de Goede <hansg@kernel.org>, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86: intel_telemetry: Fix PCI device ref leak
In-Reply-To: <20251224044359.3919178-1-kaushlendra.kumar@intel.com>
Message-ID: <5d8619cc-2272-c544-fceb-dc4d4223b769@linux.intel.com>
References: <20251224044359.3919178-1-kaushlendra.kumar@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 24 Dec 2025, Kaushlendra Kumar wrote:

> The for_each_pci_dev() macro increments the reference count for each
> PCI device. Without calling pci_dev_put() to release these references,
> the code leaks device references.
>
> Add pci_dev_put() at the end of each iteration to properly release the
> reference taken by for_each_pci_dev().
> 
> Fixes: 87bee290998d ("platform:x86: Add Intel Telemetry Debugfs interfaces")
> Signed-off-by: Kaushlendra Kumar <kaushlendra.kumar@intel.com>
> ---
>  drivers/platform/x86/intel/telemetry/debugfs.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/intel/telemetry/debugfs.c b/drivers/platform/x86/intel/telemetry/debugfs.c
> index 189c61ff7ff0..8fdc9965ff27 100644
> --- a/drivers/platform/x86/intel/telemetry/debugfs.c
> +++ b/drivers/platform/x86/intel/telemetry/debugfs.c
> @@ -589,6 +589,7 @@ static int telem_soc_states_show(struct seq_file *s, void *unused)
>  			   dev->vendor, dev->device, dev_name(&dev->dev),
>  			   dev_driver_string(&dev->dev));
>  		seq_printf(s, " d3:%x\n", d3_state);
> +		pci_dev_put(dev);
>  	}

Hi,

This looks incorrect as the loop keeps iterating forward so it will 
decrement the reference count for dev.

-- 
 i.

