Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A4C2EA476
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Sep 2025 10:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757931199; cv=none; b=W5fOybMjmEF/nQKBDkC7JSQ+zTfKQUR+kYTpRzSoa3RP78eKb7PZ/s4ZxNuqUZdOohvwCV8XH2mzfGKuzCoq6htVIAAimiYSBDa2eD9dextaqhtFmfBlYoICaBrMHKaMbwCdSwk9jzetKIRB2MXUmKVTD3D9sp/hQaiB/Q49A1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757931199; c=relaxed/simple;
	bh=cyYMKy4VM3znGHkgZ6rrnMrIzubezlrFSvME2FXQ05M=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=arz7g/KQ+gakhXEDBdQyNkb/LbsVuI04aNWkzPV3jSxUyY4nGPQkiJnU5KlKF7o7fC6ZPvkhJxZbSDBTOPCVm35NTFQrePzvD220X/s99xnmUFX73SI30ywPWBmoJGlrm7kGG0BtOI7Jz9W/pgYDWtx3jacrjFSRXxTjQltmEAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O4XZuUVw; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O4XZuUVw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757931197; x=1789467197;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=cyYMKy4VM3znGHkgZ6rrnMrIzubezlrFSvME2FXQ05M=;
  b=O4XZuUVwnCBj6WbHiwbaQAA3Oc82/3tHDOlcf0auJ6aZrYX5h+PKFV+w
   XjJGIDz2sUwGtytfmwsGtjOpN+a2uzxhgW+JDgRKQdwxrw1bm7MKbHZqb
   /n1/7P/7pWMd8AZAhWI88FTowN/J5diQC3mqd+P+m6YHr5TtJa4flC2qf
   5eoSHvDfy0365+AgTf8ot6C3hqEInLwDW3oIfD28tr0s7QlaHgrENvdV8
   0bAPO/K8UcYoqu5OKBGM9warjgOBOzKea8p8C4WbOkpEIHeR0PttB5WBK
   krBHLHR9U9hCDk0A9kDSsWzqyOJBx9Ujz1ZXAxp2ON9o2Z77sZ9n1Wvd3
   w==;
X-CSE-ConnectionGUID: QMwqkYGCQe+TrzLsa9Ogxw==
X-CSE-MsgGUID: FA/zGTfoRCa5gLxqajh5bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11553"; a="77790743"
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; 
   d="scan'208";a="77790743"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 03:13:16 -0700
X-CSE-ConnectionGUID: dsNIF8KKQLWzWmbLs11lkQ==
X-CSE-MsgGUID: DZWpkNt1QxOxuyCjCkgsgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; 
   d="scan'208";a="174510252"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.39])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 03:13:14 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 15 Sep 2025 13:13:10 +0300 (EEST)
To: "Derek J. Clark" <derekjohn.clark@gmail.com>, 
    Alperen Aksu <aksulperen@gmail.com>
cc: Mark Pearson <mpearson-lenovo@squebb.ca>, 
    platform-driver-x86@vger.kernel.org, skhan@linuxfoundation.org, 
    linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] Documentation/wmi: Fix Typo Error in doc
In-Reply-To: <24912814-6891-4223-BCE3-87D1CD6D9A4D@gmail.com>
Message-ID: <7c827c2c-4f22-265d-34aa-5377a67b7c65@linux.intel.com>
References: <20250820155904.32685-2-aksulperen@gmail.com> <24912814-6891-4223-BCE3-87D1CD6D9A4D@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 20 Aug 2025, Derek J. Clark wrote:
> On August 20, 2025 8:58:35 AM PDT, Alperen Aksu <aksulperen@gmail.com> wrote:
> >Fix to correct spelling of "Hardware"
> >
> Hi Alperen, 
> 
> While we can fix the spelling of these, they are currently as provided by Lenovo. The spelling error exists in the WMI interfaces and during development we decided to leave them wrong to match.

Yes, I'm not keen on accepting patches like this.

These are hardly something user reads as documentation anyway.

> - Derek
> 
> >Signed-off-by: Alperen Aksu <aksulperen@gmail.com>
> >---
> > Documentation/wmi/devices/lenovo-wmi-gamezone.rst | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >diff --git a/Documentation/wmi/devices/lenovo-wmi-gamezone.rst b/Documentation/wmi/devices/lenovo-wmi-gamezone.rst
> >index 997263e51a7d..24b027362e93 100644
> >--- a/Documentation/wmi/devices/lenovo-wmi-gamezone.rst
> >+++ b/Documentation/wmi/devices/lenovo-wmi-gamezone.rst
> >@@ -126,7 +126,7 @@ data using the `bmfdec <https://github.com/pali/bmfdec>`_ utility:
> >     [WmiMethodId(65), Implemented, Description("Set IGPU Mode")] void SetIGPUModeStatus([in, Description("IGPU Mode")] UINT32 mode, [out, Description("return code")] UINT32 Data);
> >     [WmiMethodId(66), Implemented, Description("Notify DGPU Status")] void NotifyDGPUStatus([in, Description("DGPU status")] UINT32 status, [out, Description("return code")] UINT32 Data);
> >     [WmiMethodId(67), Implemented, Description("Is changed Y log")] void IsChangedYLog([out, Description("Is changed Y Log")] UINT32 Data);
> >-    [WmiMethodId(68), Implemented, Description("Get DGPU Hardwawre ID")] void GetDGPUHWId([out, Description("Get DGPU Hardware ID")] string Data);
> >+    [WmiMethodId(68), Implemented, Description("Get DGPU Hardware ID")] void GetDGPUHWId([out, Description("Get DGPU Hardware ID")] string Data);
> >   };
> > 
> >   [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description("Definition of CPU OC parameter list"), guid("{B7F3CA0A-ACDC-42D2-9217-77C6C628FBD2}")]
> 
> - Derek
> 

-- 
 i.

