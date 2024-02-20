Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C73667C68
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Feb 2024 12:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708430805; cv=none; b=SUFZJOd4j+8EQkSFctg4ltr01nj8zKjKmmbpYGyNLFNts1CLVF86oE1e3zzYcx1QCL3chPAOY0eBRcRY6KIwXbCkNYohSiRmKYFKzz2UgEr3dsUgV4gscAryT/hSNInPaoZtAMCqMGV6T4bdyAj5L9I5iN1h0zts2syimxVD+r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708430805; c=relaxed/simple;
	bh=og1ooYKrPUgMncwsQmGVjrszkR62SGMxluBOKSl/R9g=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ruHSdzu6HqAYgmEKBnNkK1jw2HtJHGxxNlzLsuYHzyQ7rUIcTtA2J0Yhp+oXZcuzQWmoCuaetZMjCd0WHVQIWUGA5ouEQdzSyL1d7FL/xInnhKLGMw3V0CJgkpMs/sZITZcbkRkLCSjN07axoXDBxHhysOSuZr9g74d6sWZlv8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GFFtMUQ1; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GFFtMUQ1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708430804; x=1739966804;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=og1ooYKrPUgMncwsQmGVjrszkR62SGMxluBOKSl/R9g=;
  b=GFFtMUQ1Li5tvvJ8UUiDPFDEwZ7amlFAR+Z2GXz3KvAiBxeE/HCVtglR
   X1WBgns4Fw1QectPbKLlBj7Ix00OI2l31WiZ6m1yg0Tik1tHl0v+5Mx51
   yGGKVxkGl7Wh5KOs/5BK2tKtgQSYqT9MntGzHu0NM02cr2+x6V4Runqnc
   0Flxht7nwizoFN86sQH+cXRUgdFqIvwpzz37pAy9rDcj5jWPQOGKNXWsl
   JMasKgDgF710cJmgz9CKvU641VjNF0jABWuOXtvLmO+kVANCeU3LbKMxo
   +pySysq3Jb/N7vHraxfgUG1m79e+i6KNO8UPe+oxc5ULpP9Rxx/yDp+mf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="13236855"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="13236855"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 04:06:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="4727970"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.94.249.21])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 04:06:31 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 20 Feb 2024 14:06:25 +0200 (EET)
To: "Hegde, Suma" <Suma.Hegde@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    kernel test robot <lkp@intel.com>, 
    Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Subject: Re: [PATCH v2] platform/x86/amd/hsmp: Add CONFIG_ACPI dependency
In-Reply-To: <64d36beb-0123-4f00-b1e2-692f1f54064d@amd.com>
Message-ID: <f4e34659-3571-2e3e-dfaa-db9bc4d79fde@linux.intel.com>
References: <20240130073415.3391685-1-suma.hegde@amd.com> <297e679c-a05e-4d02-bde4-53697ff9f4a7@redhat.com> <64d36beb-0123-4f00-b1e2-692f1f54064d@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 20 Feb 2024, Hegde, Suma wrote:
> On 2/19/2024 6:15 PM, Hans de Goede wrote:
> > On 1/30/24 08:34, Suma Hegde wrote:
> > > HSMP interface is only supported on x86 based AMD EPYC line of
> > > processors. Driver uses ACPI APIs, so make it dependent on CONFIG_ACPI.
> > > 
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Closes:
> > > https://lore.kernel.org/oe-kbuild-all/202401281437.aus91srb-lkp@intel.com/
> > > Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> > > Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> > Thank you for your patch, I've applied this patch to my review-hans
> > branch:
> > https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans
> > 
> > Note it will show up in my review-hans branch once I've pushed my
> > local branch there, which might take a while.
> > 
> > I will include this patch in my next fixes pull-req to Linus
> > for the current kernel development cycle.

> This change was merged by Ilpo in review-ilpo branch into commit:
> platform/x86/amd/hsmp: Add support for ACPI based probing.

> > > diff --git a/drivers/platform/x86/amd/Kconfig
> > > b/drivers/platform/x86/amd/Kconfig
> > > index 54753213cc61..f88682d36447 100644
> > > --- a/drivers/platform/x86/amd/Kconfig
> > > +++ b/drivers/platform/x86/amd/Kconfig
> > > @@ -8,7 +8,7 @@ source "drivers/platform/x86/amd/pmc/Kconfig"
> > > 
> > >   config AMD_HSMP
> > >        tristate "AMD HSMP Driver"
> > > -     depends on AMD_NB && X86_64
> > > +     depends on AMD_NB && X86_64 && ACPI

Yes, it only belongs to for-next.

The change that triggered the build fail is (it is only in for-next):

commit ba8dcff0e9c4f8fa6a46315126fb837acb0f98fc
Author: Suma Hegde <suma.hegde@amd.com>
Date:   Sat Jan 6 02:25:28 2024 +0000

    platform/x86/amd/hsmp: Add support for ACPI based probing

-- 
 i.

