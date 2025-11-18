Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE84C307AEC
	for <platform-driver-x86@vger.kernel.org>; Tue, 18 Nov 2025 08:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763453470; cv=none; b=UjId8E7R67zK5HMehPHzrEPho7gggJ0G8z/7K8iRh8CFlXupKtmnCZ1jOkZaJsj+Q7Olv1UwvYBPiU9dhiXwL/u0xnNagam0O1Rf+6uISpBkOUj4rmaF7aI72N/NJG31AGz97husIZEBGq++yOmEp/O0qGj4hMJ15T4Gqf/Lvl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763453470; c=relaxed/simple;
	bh=EpiSVeZJazv1CNAOhIgJkNBUsKvKskDXkt10sPH0+wQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XTTn72yJS6KDtt0g1NJnU0sUB08Bg/ZjdJ9joRfi+U1tF1Bv0z1sgzeDBjSeHt0cu9o4AaM7bLBKat7Nwtehjl+CpJmrhmr/1Akv5wsegEqaBIsmob8GUpJxwjHbs47ioAEiJ02TMc1hRszeSa2EnLK4MF+ClWbEygrl7yUE22E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g6fPz2AM; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g6fPz2AM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763453468; x=1794989468;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=EpiSVeZJazv1CNAOhIgJkNBUsKvKskDXkt10sPH0+wQ=;
  b=g6fPz2AMn73qO1roGzOX0sRMAvXTNb4lRXWz/8jYuU46cAOzMd3tidc0
   y9KcYhox4xHrPG5wCVrM3gp9z1Apg4OC2pTBt3/hGzqQQNiVIrJZew4f/
   5GxyDnnBLauX4fBFeZ1jO88J0N6oKAEvh2tiwfbcx3sZ2StOM69l5Qh/i
   3aDPcKiaL55RZYYdp09kNYYJQ90rxVAmPKLZqkWA9NAuPIDJPeMmsMTNQ
   qVLPIKkhJI144QcSd1BvbPpK5iRcmnGRfjkXpjrE47Sggwwqe53xiObZ8
   5pFhRXE7LiiffkKJgmU1q3vV2roqtLBeow0lDedMghlAs7xM7mGjD5AgH
   g==;
X-CSE-ConnectionGUID: iK/nQv1HTqqC815hZ3dCdw==
X-CSE-MsgGUID: b/UkceeGT+a4A9udsWzDLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="53038564"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="53038564"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 00:11:07 -0800
X-CSE-ConnectionGUID: cD5QlLFfQuSv+CGTCFUsKg==
X-CSE-MsgGUID: dv9Qjz+bRjSC3OvGUnwZtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="190484136"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.74])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 00:11:04 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: platform-driver-x86@vger.kernel.org, kuurtb@gmail.com, 
 Anthony Wong <anthony.wong@canonical.com>
Cc: hansg@kernel.org, Dell.Client.Kernel@dell.com
In-Reply-To: <20251116185311.18074-1-anthony.wong@canonical.com>
References: <20251116185311.18074-1-anthony.wong@canonical.com>
Subject: Re: [PATCH v2] platform/x86: alienware-wmi-wmax: Add AWCC support
 to Alienware 16 Aurora
Message-Id: <176345345978.8636.14435555683152510498.b4-ty@linux.intel.com>
Date: Tue, 18 Nov 2025 10:10:59 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Mon, 17 Nov 2025 02:53:11 +0800, Anthony Wong wrote:

> Add AWCC support to Alienware 16 Aurora
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: alienware-wmi-wmax: Add AWCC support to Alienware 16 Aurora
      commit: 6f91ad24c6639220f2edb0ad8edb199b43cc3b22

--
 i.

