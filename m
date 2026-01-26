Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035E2336ECB;
	Mon, 26 Jan 2026 12:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769432169; cv=none; b=VvdJ4/S8vfzk6D9SSmgotm3XPWtgmvC10/K4/SWtkEPQOcgeFPZOebsKLD2pR0X2aaoQPYSNVYN99l+FpNUew/ga9HMSRGeQSzcCg5Mg+kPMjRkD0SCJGTNbnLUx2ScxsQxC8+R78ZQE7rNVvXoxLwOXC7OZXYn8WaZ1S/5IiZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769432169; c=relaxed/simple;
	bh=OJ+u6q9/VgmoiHNEfqjXlwSTUH0QOd6jKrnRjPF7BeA=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=M/wuv+5xTfvzyWsWAz0ZTXSWpWZMp4OdZPCADYJmwTYBopA9LlI2Io2GurZYxN2hXs7qF5Q6zdqlV8IDDwjAz+VS1JqtBmsrK54kCrwmas1SHjf6eQTQMc/mojQUf1VD9t/IhDLzVDJWl1KycoCKVCL1l/+KyMsX4gQVW8VB1yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aZmm4713; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aZmm4713"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769432168; x=1800968168;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=OJ+u6q9/VgmoiHNEfqjXlwSTUH0QOd6jKrnRjPF7BeA=;
  b=aZmm4713YiL4k0bzyXnl2LwAVNs3YKho95Y6/UpmF/z/q8AKoxJ2pB47
   p2DNNCACxbe4tkReE24+sMeFnuvNAZT5o1UTIAMG+z5rTUm9M11XT/t8M
   AVBTNMFK9EoFNG7oIyfVimrLJSMP1T0aiNk6pl1GpZasw/1doZIB2B9FH
   XHMVJwVB/PQWwaqQEkzN3ooqUayDGtKy3JJrW20ji9gmtfkhMDddH/7M+
   xEdrlxRKwT7bXrKAAY4wk85z/IJl+RCifp31Fqb6FE2D+4JLWX38q9k+R
   b+6kKIUIyw8zeOUwhfwu0zshMfBKuhia9F3JBe2rq1QJcUlnCxThhZkrp
   w==;
X-CSE-ConnectionGUID: BQXfHbrCSUiCNp6LiBcFrw==
X-CSE-MsgGUID: iLkjq4rqT1CkloA0GdqebA==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70765590"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="70765590"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 04:56:07 -0800
X-CSE-ConnectionGUID: 5MhX+zURRoihgGr/Ee4zUg==
X-CSE-MsgGUID: O+M8vjqCSMGo+RdSmuZFaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="238352676"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.150])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 04:56:04 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 26 Jan 2026 14:56:01 +0200 (EET)
To: Denis Benato <denis.benato@linux.dev>
cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    Hans de Goede <hansg@kernel.org>, "Luke D . Jones" <luke@ljones.dev>, 
    Mateusz Schyboll <dragonn@op.pl>, Denis Benato <benato.denis96@gmail.com>
Subject: Re: [PATCH v4 0/3] platform/x86: asus-wmi: move keyboard control
 firmware attributes
In-Reply-To: <52704f4d-37f4-4eb5-998e-25e098ceef54@linux.dev>
Message-ID: <fc8a3843-0f04-ecd7-b30f-d53dbf3fc7e2@linux.intel.com>
References: <20260102234344.366227-1-denis.benato@linux.dev> <52704f4d-37f4-4eb5-998e-25e098ceef54@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 26 Jan 2026, Denis Benato wrote:
> On 1/3/26 00:43, Denis Benato wrote:
> >
> > I was recently reading through the asusctl issue tracker and I found
> > out that some users have been having troubles with the keyboard RGB control
> > that was working before since the creation of asus-armoury and subequent
> > deprecation of old sysfs attributes.
> >
> > This patch series aims to re-introduce those attributes in asus-armoury
> > so that userspace tools can still control keyboard RGB lighting
> > without having to rely on deprecated asus-wmi attributes.
> >
> > In addition to that, since disabling OOBE is essential for controlling
> > LEDs on some models and it was incorrectly tied to deprecated attributes,
> > this patch series also fixes sending OOBE at probe time.
> >
> > Link: https://gitlab.com/asus-linux/asusctl/-/issues/619
> Hi Ilpo, please disregard everything in this patch series except the OOBE fix:
> that fix is important and I see it has been picked up.
> 
> It's probably much better not to touch keyboard modes without a rework
> of the associated RGB interface: it doesn't make sense to move only the
> power state and I already saw there have been reported problems
> with TUFs.
> 
> The original problem I was trying to solve is better solved another way
> via userspace saving the last setting with the interface already provided.

Yes, OOBE fix is now in Linus' tree.

The other 2 patches eliminated from the patchwork queue, thanks.

-- 
 i.

