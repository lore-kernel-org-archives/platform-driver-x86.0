Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D8240759B;
	Fri, 10 Jul 2026 10:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783678899; cv=none; b=iZI3YJHNPSceilPNJljOHYZs9yHFtdK0jH/6jb64jonm0BSArRgbFKLaH0R16m85pynazM0Q2cqdFama+HppPpIXMdBq0CK6F8gzxhCet4v9FKKAi80nBzUT6TqkjhWrT44jUvKeTFpCdbgXMXFl+Eq1nILz+8dlmWZYRiLwfdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783678899; c=relaxed/simple;
	bh=mossG8/Zt2OjGsBL4d3d2i9tWu4EFIeawtYCp7S15ug=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EfNMt77yWCOrlwqyb3Uo/znSnwpCJmacyGeOgvRy05T8025w0cUmPJ3jguKlqfySLN/qFXZNXx1l+qF4VX2Bl1HFy1qO98Yr2cclVS+JMt+Dgqi3Gb1BQBpsb6ugKiURHgemfQ4Ck3DCPWPaIlGd1Ntl48GxdroKyfx3EkDjW48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mjEsKPU2; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mjEsKPU2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783678898; x=1815214898;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=mossG8/Zt2OjGsBL4d3d2i9tWu4EFIeawtYCp7S15ug=;
  b=mjEsKPU2PhwQMqTVkiWcxDNMf//F6wDDm+HLF4hH1N/87t4nYFFD6sQv
   UUPB3G+iUzNzw/1wFwCgu0h6FizPDrclblj6IKUA+AjZ1cJ4f52r9AAhv
   lF9zVHQjmz6jeFvIVJoz9SgZplSAj6LzKOX4fMmO4jR8PQuuLx85Qj6rL
   hRKbOTzch/8uwYz/31s569YuYVbAQa2d+2eWO8rDEnw9ZmRbyeycnpXO2
   +vVZnURFeeHNoqri8TCo9+eaV6jYVoVbe1d/e6sJpGvpLSfDHhJg68QQW
   lFf94kBfP3ywwvDqs5zASaEeF/mLXfXFaWAmQtuxFkeScsGgruKGPdunk
   A==;
X-CSE-ConnectionGUID: 3MGAsbKZQVi6iFYisM0WmQ==
X-CSE-MsgGUID: l80eQ0XZRlSmEiRNoixFqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="83494133"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="83494133"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 03:21:38 -0700
X-CSE-ConnectionGUID: 13SGA2RDReK9zitHCwayJA==
X-CSE-MsgGUID: zw2LZc9jT/KhIxE7NoTOTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="253731497"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.169])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 03:21:34 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, 
 Linmao Li <lilinmao@kylinos.cn>
Cc: Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D . Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
 =?utf-8?q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260710094355.186143-1-lilinmao@kylinos.cn>
References: <20260710094355.186143-1-lilinmao@kylinos.cn>
Subject: Re: [PATCH v3] platform/x86: asus-wireless: Fail probe when there
 is no ACPI match
Message-Id: <178367888853.11425.7384951067202918651.b4-ty@b4>
Date: Fri, 10 Jul 2026 13:21:28 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Fri, 10 Jul 2026 17:43:55 +0800, Linmao Li wrote:

> Every platform driver can be forced to match a device that does not match
> its list of device IDs because of device_match_driver_override(), so
> platform drivers that rely on the existence of a device ACPI companion
> object need to verify its presence.
> 
> asus_wireless_probe() returns success when acpi_match_acpi_device()
> finds no match, leaving behind an input device that never reports
> anything because the notify handler is not installed.  Worse, when the
> driver is force-bound to a device without an ACPI companion, probe
> still succeeds and stores a NULL companion pointer, which
> asus_wireless_remove() later passes to acpi_dev_remove_notify_handler(),
> leading to a NULL pointer dereference on unbind.
> 
> [...]

Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

FYI [if applicable to your patch], as per Linus' policy change, also
fixes are mostly routed through for-next unless the fix is for a
commit introduced in the most recent cycle or is clearly a regression
fix.

The list of commits applied:
[1/1] platform/x86: asus-wireless: Fail probe when there is no ACPI match
      commit: 4aefd66ef7822cf7d3f53146dcee0b71021ed2b7

--
 i.

