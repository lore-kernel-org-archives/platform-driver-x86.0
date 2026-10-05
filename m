Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD984377A97;
	Mon,  5 Oct 2026 17:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791222284; cv=none; b=uTvKmm6RR49ztBlLG8ef/NPk2eW58c1syG+fqJoeZ0CWUwJVvqW/nx20YLr+0TtUCnATJ6PAiG81/KCOTNtXJ1lZavPeoOtIF7THkX/0WZRtadAmv1ad7/IloZtahsS/OeN02EajYIMHj/EcVegzk9EUnTI7cvEKKdtu713pXIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791222284; c=relaxed/simple;
	bh=GwBJ+1F4qoyvjsLbUT4riLUqeCztv7fMLPgY4TDbS1Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HDBVftY/cgrYTE6ubX90RgEyFQ8+DjG3K73St9YlAzcSJLcAysHNUX88YI+XFMGxg5NGTIgZOGAvCXkhm1ViDaLadoAZFdDRU5pRb4Vdnp5ktr/pqUOENIPfXBdpTcRlBGZWiQhpmpbBysnrZO/r4FBPuUrWcQWG6oFlUgPWRlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e8DFDRYD; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e8DFDRYD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791222283; x=1822758283;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=GwBJ+1F4qoyvjsLbUT4riLUqeCztv7fMLPgY4TDbS1Y=;
  b=e8DFDRYDG2YDaeiwE4JWdot4jwXpsQXMjjfw934uFGcoDa5F+cI5tnmM
   1OizTXlMhQ03z1xyhRj+z/M7/ZsZfZXa9LXJYdyxWjY+GQpqad3t+g8Pn
   IsKSzNzRPxaMpHCFaln3p5uBPK08ra3BtaPpznFKIWazyHw//Tt8I4Rqz
   /yb+kFQYMnHxfOwIVHbze/ObCKVH0jWg5DfJI3tbcGnsNvZchSavPrWmO
   UWtrkWHqHPsXpxERjGJwe0Ik6/PZC9n/Nqgmun840CfRcABCRVlSt6t5q
   aZ8CpgWma57OOKqryPHiLmZE73ccINSNvbnVfWPfTWlzQ5/xazwoNsx2l
   g==;
X-CSE-ConnectionGUID: 4FYFdcztTb2KEO5PrKtOVg==
X-CSE-MsgGUID: BP12+bSoTimUGVfoUlLvSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="90960205"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="90960205"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 10:44:42 -0700
X-CSE-ConnectionGUID: O59Lz2XtRNqaHg7u5y+MFg==
X-CSE-MsgGUID: Nh7y3ZjkTgGZupiEzMFh8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="306387399"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.199])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 10:44:39 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Nikita Kravets <teackot@gmail.com>, Hans de Goede <hansg@kernel.org>, 
 Daasaradhi Mannava <daasaradhimannava@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916174812.11496-1-daasaradhimannava@gmail.com>
References: <20260916174812.11496-1-daasaradhimannava@gmail.com>
Subject: Re: [PATCH] platform/x86: msi-ec: Report valid charge thresholds
 when unset
Message-Id: <179122227516.27048.14499836425065390873.b4-ty@b4>
Date: Mon, 05 Oct 2026 20:44:35 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Wed, 16 Sep 2026 17:48:12 +0000, Daasaradhi Mannava wrote:

> The charge thresholds are computed by subtracting a fixed offset from
> the raw EC value. When no charge limit has been set, the EC can hold a
> value below range_min (0x80 on an MSI GL65 Leopard 9SCXK), and reading
> the sysfs attributes returns nonsense:
> 
>   charge_control_start_threshold: -10
>   charge_control_end_threshold:   0
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
[1/1] platform/x86: msi-ec: Report valid charge thresholds when unset
      commit: eabc7e36259c813dc337b48b012bbf23b380f509

--
 i.

