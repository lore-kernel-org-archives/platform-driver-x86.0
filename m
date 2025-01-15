Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD7678C6C;
	Wed, 15 Jan 2025 14:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736951993; cv=none; b=sQWQQJ1XXuDyUvxGcrux7eoMW4DFJ6BP/1kfX46dlGagVNktjWSy5LxR/FKlc8g/KU1Cv28ZcX1IFMFjyVR7Bpy6uAxrpPxjO9JDLzmMXxqvSBKeyRCzt7IaR0rGcUIMzKGn/x13aNRX2BclhpzIsS9528+mcNa4EYsHKsvn6h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736951993; c=relaxed/simple;
	bh=Qa0vFea1r48HXZgatTEaVJekzj1XMexAl8Bw9PTVQ1I=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=X3RQCwyZmdnWIP1b9Nn3IimROLelJCfmeOUsXTN5ePjlqABaFHKva02u0Ii7o9sgH3/ORzpjfXU+pMeQPMSkaXLK/gpbNrH65HOaNHeXH8LoAjTYUpIINKmqNsbw6rEwmqDtFgmsJdAxoUxZzIJXOLLjhMz01YYYcyDS/pFPjUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CxnaQZfQ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CxnaQZfQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736951991; x=1768487991;
  h=from:to:in-reply-to:references:subject:message-id:date:
   mime-version:content-transfer-encoding;
  bh=Qa0vFea1r48HXZgatTEaVJekzj1XMexAl8Bw9PTVQ1I=;
  b=CxnaQZfQQIU1MSQnhqhJEhGfn04JbqjB0mbnkC4Tmvbmzt476FMmcdUx
   INQBR4C71BkoVMWxv3CpH42DmtdafMa2PsHOg2+7lVfHMHNA8dExGnnrG
   2SGqd2jjL5DGCBULxZqINStq4epPYeHiQCBYrPbwWH51qM0TmV8Bzoij2
   2H55BYkhd0doL4PnsnZ4mvox+0O3x+usWnDkLOghJLRYEhniNS9+03eiI
   pUaeLbKSCauuxrnKPL3dmmorZ897/IrtwkMV05gPdTuPdaXMORWGPMPvZ
   0jHk9Q+CYhpY+A7i5CDW3m6yn8bDrI7fOgayMYrDZyKawCvP4cyo+ANDQ
   A==;
X-CSE-ConnectionGUID: YREYu0VpSpi3l2VTa3bRcA==
X-CSE-MsgGUID: FZMkrfOXQiCGLBkli7WiZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="37208498"
X-IronPort-AV: E=Sophos;i="6.13,206,1732608000"; 
   d="scan'208";a="37208498"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 06:39:51 -0800
X-CSE-ConnectionGUID: Az3RUQyeQSGDFGtm6EnYSg==
X-CSE-MsgGUID: Rxq09m7KTOeoMieEYWqm2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="136010479"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.214])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 06:39:49 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hdegoede@redhat.com, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ai Chao <aichao@kylinos.cn>
In-Reply-To: <20250115022825.101986-1-aichao@kylinos.cn>
References: <20250115022825.101986-1-aichao@kylinos.cn>
Subject: Re: [PATCH v7] platform/x86: lenovo-wmi-camera: Use
 SW_CAMERA_LENS_COVER instead of KEY_CAMERA_ACESS
Message-Id: <173695198460.7860.2553898497040480305.b4-ty@linux.intel.com>
Date: Wed, 15 Jan 2025 16:39:44 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Wed, 15 Jan 2025 10:28:24 +0800, Ai Chao wrote:

> Use SW_CAMERA_LENS_COVER instead of KEY_CAMERA_ACESS_ENABLE and
> KEY_CAMERA_ACESS_DISABLE. When the camera toggle switch was hit,
> the lenovo-wmi-camera driver would report an event code.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: lenovo-wmi-camera: Use SW_CAMERA_LENS_COVER instead of KEY_CAMERA_ACESS
      commit: d98bf6a6ed61a8047e199495b0887cce392f8e5b

--
 i.

