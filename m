Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BF241DECE;
	Thu,  9 Jul 2026 10:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783594416; cv=none; b=kotpU4u0DZa2mak4llKBKaKCppjmySKrroLSDW7xdxb33+aF0aKdhFXQ4d53Sp+cEZMza1YaBnUKcP5qvTBYUmDA1dhMTAKcawTppfs49feZV25EARjmrVFvjI5Y0Fu1Zk9jdq7bea6kKH9/EZqZbP8gbUVJVLqnvLqJJGHUNRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783594416; c=relaxed/simple;
	bh=MX2OjRg4b2kKYcJKENuXbeK9hHgZB7fP1E0XuNeyn/o=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=rTrNoA5Hn9PWjEiH3x4/LzvjNQhskLVWZebVEgvW5mC6JMoiL2IA+LExy8uu1o1yFw4J95cWJmFNUCaJfyRl29v2ZZoXC81CuOEfYEmG2x/4wSz6h4Aww9Gli0NxfS1sOQpu3E783NPMjJAsDkVBuhbl1tGXjiXfplr+P75rImw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KaG9YETd; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KaG9YETd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783594414; x=1815130414;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=MX2OjRg4b2kKYcJKENuXbeK9hHgZB7fP1E0XuNeyn/o=;
  b=KaG9YETd4d0/ISEl+KgnLxvSegwPfbyMuRZTsfRbLR/Sryg9aEJ8ilLp
   T0S84NckqQwL6bLV3z/yf3ggJduHY076pnmsy+613P61tHd/hLaO/P6e9
   FnlPDZee78gxpQmwKRqa1ia9YkPRQ0qpRuDQ1fGF0wk5WBtVvZqlWFNZX
   9NuVL7RifSraW1vwxXbVsLK14G0g1aSmuFj1Jy1nFjvM1xJ22CivEDtb6
   ahGGT+aXapeLC5dUyYspc54QFbSQQefDqC2JEaUCk/OmN40iKdahGVIsd
   cttssaZGDoHfvhsKqjPHTMWwowqBarEoKB+2xR7Wut/rHIFEevJ3jstok
   w==;
X-CSE-ConnectionGUID: w3F9W4fiRaqzHiDJVVBmMQ==
X-CSE-MsgGUID: ipFNZ6mASDGtoBeKNL78Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95425091"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="95425091"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 03:53:34 -0700
X-CSE-ConnectionGUID: 4qLlgsoYQlCfuHGs1Aax+g==
X-CSE-MsgGUID: 5s9bKE8qR9WyYOSxlEanGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="255214688"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.36])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 03:53:30 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 9 Jul 2026 13:53:26 +0300 (EEST)
To: "Wysocki, Rafael J" <rafael.j.wysocki@intel.com>
cc: Linmao Li <lilinmao@kylinos.cn>, Corentin Chary <corentin.chary@gmail.com>, 
    "Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
    =?ISO-8859-15?Q?Jo=E3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>, 
    Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] platform/x86: asus-wireless: Fail probe when there
 is no ACPI match
In-Reply-To: <8ac2bf78-a139-4ce6-818e-fc0cd218f71e@intel.com>
Message-ID: <615f444c-494e-66bf-0aaa-6c5b51ef9b8e@linux.intel.com>
References: <20260706024953.534671-1-lilinmao@kylinos.cn> <20260708010706.718190-1-lilinmao@kylinos.cn> <8ac2bf78-a139-4ce6-818e-fc0cd218f71e@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 8 Jul 2026, Wysocki, Rafael J wrote:

> On 7/8/2026 3:07 AM, Linmao Li wrote:
> > Every platform driver can be forced to match a device that doesn't match
> > its list of device IDs because of device_match_driver_override(), so
> > platform drivers that rely on the existence of a device's ACPI companion
> > object need to verify its presence.
> > 
> > asus_wireless_probe() returns success when acpi_match_acpi_device()
> > finds no match, leaving behind an input device that never reports
> > anything because the notify handler is not installed.  Worse, when the
> > driver is force-bound to a device without an ACPI companion, probe
> > still succeeds and stores a NULL companion pointer, which
> > asus_wireless_remove() later passes to acpi_dev_remove_notify_handler(),
> > leading to a NULL pointer dereference on unbind.
> > 
> > Return -ENODEV when the device does not match the ID table.  This also
> > covers the missing-companion case, because acpi_match_acpi_device()
> > rejects a NULL device.
> > 
> > Fixes: f7e648027d7e ("platform/x86: asus-wireless: Convert ACPI driver to a
> > platform one")
> > Suggested-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > Signed-off-by: Linmao Li <lilinmao@kylinos.cn>
> 
> Reviewed-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> 
> (no issues found)
> 
> > ---
> > v2: Fail probe when the ACPI ID match fails instead of adding a
> >      separate ACPI companion check at the top of probe (Rafael).
> > 
> >   drivers/platform/x86/asus-wireless.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/platform/x86/asus-wireless.c
> > b/drivers/platform/x86/asus-wireless.c
> > index 2b494bf3cba8..d33853a1baf3 100644
> > --- a/drivers/platform/x86/asus-wireless.c
> > +++ b/drivers/platform/x86/asus-wireless.c
> > @@ -155,7 +155,7 @@ static int asus_wireless_probe(struct platform_device
> > *pdev)
> >     	id = acpi_match_acpi_device(device_ids, adev);
> >   	if (!id)
> > -		return 0;
> > +		return -ENODEV;

I'm somewhat unsure what the intent here is because the driver is using 
device_ids as its .acpi_match_table anyway so what's the benefit of doing 
matching again for the same set of ids?

Of course having this prevents those overrides but is it really a task for 
a platform driver to prevent user shooting himself into a foot with that 
gun (I mean beyond checking NULL like v1 did)?

I'd tend to think this matching can be removed and the v1 check done 
instead. But Rafael who undoubtedly knows ACPI much better than I do seems 
to be in favor of this version?

I also don't understand why this check is done so late into the probe, 
IMO, it should simply be done before setting up the input device 
(logically just before assign adev).

-- 
 i.
