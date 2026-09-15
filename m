Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B698266576;
	Tue, 15 Sep 2026 10:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789466722; cv=none; b=eHMzthicM3z8rWTfvmUv4MK0ErMLDKkIQppstlUoseLdS6w4sJz1tcc16ipGAtlw58V31UbCdaazBjgFqisZ6F7z55yMNZKJMUGoZYen47HNMuOE7Ch52HbDgMdHpzQ7lKnwhH0adQrsi0f1ZZ/S5Bo4vvNO32QpUqhLKMRLl/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789466722; c=relaxed/simple;
	bh=QxaOOxrY/HNWkOuqj7hmTAKTaG77yAH6aXBwJtzUEqk=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=NWmg+Gs3RREZes3adfjO08Fwrf0SiNZNTBySa13NTU4mTSV/TkYywCPV0EJbrDlV1qAktIAi1g0CAkeN2DiWyY7+BHhMMqgLVGhWZNnZSjTKb3ScFTbolK/Wy5onJ7c45UpRhCKBD2nBgjH51dDI+n0hpDNGmE4m/T/xDA71a+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P+oxlGkD; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P+oxlGkD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789466721; x=1821002721;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=QxaOOxrY/HNWkOuqj7hmTAKTaG77yAH6aXBwJtzUEqk=;
  b=P+oxlGkDQyn16Ej/ixbJK2WZ+e9qRswoI1Y+JeE014NQ96Vwko9ca3Bk
   2hVqAFYrOrCIkXmqFVQ09a0XkmzNtlnrTqL4JdWxIlzriamADlolwT+W1
   jgSQQoOb3EHkrE+5uQOJOdQMGHgjTNO+NjblI/9Tv2CZxH63RFEJCxtur
   Nx7cTBHXcDQG8/QiXp6WeFNH+5r+50fZ0yIbFhmLCICSv4PGmk/VxaZ5u
   oB3ohizyUO+pzyTuQCJQX1M10io01/sGt6JYfSS6052Qbmu5hyTvjOZjz
   +Qrv0oFE2+5mDlZCzy4lYeIMyvoJjKNYrbmXi2kQVM+rSVT5wJADqTFSL
   w==;
X-CSE-ConnectionGUID: vrX1ZvGYTW+1nNEwgSc6mA==
X-CSE-MsgGUID: ZCHXoZ8HQomFE0ipHJioRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89841241"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89841241"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 03:05:21 -0700
X-CSE-ConnectionGUID: m4pwH9yURqmuJ4ubn5UHzg==
X-CSE-MsgGUID: E3shFvVGTDSIvo32Jtxm2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1170964"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 03:05:18 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 15 Sep 2026 13:05:13 +0300 (EEST)
To: Mario Limonciello <mario.limonciello@amd.com>
cc: Hans de Goede <hansg@kernel.org>, open list <linux-kernel@vger.kernel.org>, 
    "open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>, 
    Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: Re: [PATCH] platform/x86/amd/pmf: Add AMDI0112 ACPI ID
In-Reply-To: <10788f18-2229-4165-ba5f-f2e2811281d9@amd.com>
Message-ID: <f591b4d6-9619-42fd-31f5-639bf7bea8f9@linux.intel.com>
References: <20260826163611.2268377-1-mario.limonciello@amd.com> <10788f18-2229-4165-ba5f-f2e2811281d9@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 14 Sep 2026, Mario Limonciello wrote:

> 
> 
> On 8/26/26 11:36, Mario Limonciello wrote:
> > The AMDI0112 ID is used to bind the PMF driver to some platforms.
> > It doesn't have any Linux side code changes relative to the most
> > similar AMDI0105.
> > 
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> > ---
> 
> Hi Ilpo,
> 
> I sent this a few weeks ago, just want to make sure it wasn't lost in the
> merge window and is still on your list.
> 
> Thanks!

Hi,

Please don't worry, my plan is to process most of the patch queue this 
week.

I've been busy in dealing PCI regressions until now and still am one quirk 
short to finish that work.

--
 i.

> >   drivers/platform/x86/amd/pmf/core.c | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/platform/x86/amd/pmf/core.c
> > b/drivers/platform/x86/amd/pmf/core.c
> > index b4eae65e675b8..5966190d1496b 100644
> > --- a/drivers/platform/x86/amd/pmf/core.c
> > +++ b/drivers/platform/x86/amd/pmf/core.c
> > @@ -454,6 +454,7 @@ static const struct acpi_device_id amd_pmf_acpi_ids[] =
> > {
> >   	{"AMDI0107", 0},
> >   	{"AMDI0108", 0},
> >   	{"AMDI0109", 0},
> > +	{"AMDI0112", 0},
> >   	{ }
> >   };
> >   MODULE_DEVICE_TABLE(acpi, amd_pmf_acpi_ids);
> > 
> > base-commit: 5b05bb3f6c5716fab6911e12d60dd1f43ad9806a
> 

-- 
 i.

