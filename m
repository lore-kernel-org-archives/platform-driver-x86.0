Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2757B307AE7;
	Tue, 18 Nov 2025 08:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763453476; cv=none; b=Dhg3DY4QvdAguh3qBuSGNxiwy1SwD3HYo0hC8AwLKL0E/nguB/szNXr7MdiMf+ewk69+9oOobRjhT7gHl11IszAEa89mwisb8eVvJ8qeIiaaRaHcpjJR/cdpwKIlfRnjaZ0h3fBqUjgagb6g2/l6VHglmLdTpjT9qztKBo0aB2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763453476; c=relaxed/simple;
	bh=oY6TayE9CPfLK7kVe4wupraE4O5AG6h1Jn50u14FwDw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SG60odCxK21/CUYM6LV2i0xYHbIyJp/nU+GeIvegj5mrcmBbrdvzMQEGj+1EjQvTezZfG4vpTV1pwwZikN96rz5uetK7IQgctvrSDeyDhnxonrHFC34QCLo5HHNxehFyFPQP6I4IACWeHbF4uraXu/fLcPD0WqvQCaKgVh9UgmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TmnSVWGt; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TmnSVWGt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763453475; x=1794989475;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=oY6TayE9CPfLK7kVe4wupraE4O5AG6h1Jn50u14FwDw=;
  b=TmnSVWGt2OA9LXPukHnSTpxR3Wo36fTgKAiLMCaUdHhbAf9spCErYmAl
   zVy4K1lwC/yFoi6t+OUbJ961PhE/IXZXxT+p3Kum9/mdaKJWulduYkk+p
   x/ALWGMpPaEn34BbXaKApTL5b4VkKssXg+9wQBz2vEKjOjWhBEJthmJOR
   i9VNyVhjV/V2SR+nExuOkRdHNLir2HLdPBUIi1/RO4HuUQLnnLxhmVlL3
   Ti/BsO3IT5PkAgygaZWEl/YBo7WzNbMYCpABC45oQHuSIYYrDTuUw6PBT
   GO6SwfNgiOd2ii50vZscsX+CnmCMiXaj7YwmIG2lo90+W6x6j6P9sHlBI
   Q==;
X-CSE-ConnectionGUID: rMZQ+hriT82cKtv8a1K/5g==
X-CSE-MsgGUID: LoFEZF2AQxqye/3j14LQiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="53038580"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="53038580"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 00:11:15 -0800
X-CSE-ConnectionGUID: sJh+4c/hR2aR4WG29MIk6Q==
X-CSE-MsgGUID: 9n+ywTz/QNmz1+hTC294hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="190484165"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.74])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 00:11:12 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: alexhung@gmail.com, hansg@kernel.org, 
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251110235041.123685-1-srinivas.pandruvada@linux.intel.com>
References: <20251110235041.123685-1-srinivas.pandruvada@linux.intel.com>
Subject: Re: [PATCH] platform/x86/intel/hid: Add Nova Lake support
Message-Id: <176345346771.8636.18227043944891816405.b4-ty@linux.intel.com>
Date: Tue, 18 Nov 2025 10:11:07 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Mon, 10 Nov 2025 15:50:41 -0800, Srinivas Pandruvada wrote:

> Add ACPI ID for Nova Lake.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86/intel/hid: Add Nova Lake support
      commit: ddf5ffff3a5fe95bed178f5554596b93c52afbc9

--
 i.

