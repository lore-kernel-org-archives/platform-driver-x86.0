Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A2F3148C9;
	Mon, 23 Feb 2026 16:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771864469; cv=none; b=lpqjjdi0JdUfqoVtP0NMAvwaoDkchDj9Gjxm/Wz9L6Wuas2SYyfmfge5cev7KMc+GGzFJTwKtv0RtOnVggmztqiZjn83U/m3vj1eM0vg4WIxyy29fNOslFKE6jfUne8+M2mtME1YP3bCcDOVOgnj5lpHyhBzB2Z0X6ljzBBOOFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771864469; c=relaxed/simple;
	bh=LoHEFf2By+KYGhMuOF78Q+zimDg/jdRJHGZd1kEXQVE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Y7wte/ORcjrUOfRUlW7oQzrJxtOILtwwCNP9RJjLm0+GjTk1yjDM3DZpASc18RqhhIcR3gNU16XosFbhlBAMMiZYjEn2aY6OTNeux1OjU6vZqffk+cpLpJ/eQOGtL2j3/75o1IXVzBFyucTPGX44H25vo7ltxl5ruIZ3M3oUWGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AF7uBuli; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AF7uBuli"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771864469; x=1803400469;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=LoHEFf2By+KYGhMuOF78Q+zimDg/jdRJHGZd1kEXQVE=;
  b=AF7uBuli7qibmo7HQCaVYHRdducbex3NPBQQUaVb/eSRWNjbhH9zyKpR
   EVCHx6C6d9xpxQe6sJimFhxCHpSBV4N0956j2a4Qf0M45MihCODlyIjka
   exjZ+GsmLzQwdRWOB0YqiIn+7GqID5yPgp9ms1bU9k29kOWTMXZEdOgeC
   CVi+iYhrSTRJqi3OWGjx9Ovm7DRWAiDKH4heX7+qY5hEQXlz9jgTbGwP7
   9JOvWBUidiZOr+xf3DHinR21oYZAm/Hdkj9bZHQd6kwrDVd6p8dPqmlhU
   xIdqaeE2OWJRQlLjgcwkqoM3Al4wEdHuoMXOyNx5vjEcRRUupzpGzgFJO
   w==;
X-CSE-ConnectionGUID: hCrfPcAlTuq/30YPj4fx8g==
X-CSE-MsgGUID: ZKoEN/lFQNmVjoSlOwfsxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="95481724"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="95481724"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 08:34:29 -0800
X-CSE-ConnectionGUID: 7zEJ2OO8QGqbqmuG/72TOg==
X-CSE-MsgGUID: PRlYFUvHRTay1g9tf9VrgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="215638143"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.30])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 08:34:25 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: dan.scally@ideasonboard.com, sakari.ailus@linux.intel.com, 
 Leif Skunberg <diamondback@cohunt.app>
Cc: hansg@kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260210132129.17943-1-diamondback@cohunt.app>
References: <20260210085615.34257-1-diamondback@cohunt.app>
 <20260210132129.17943-1-diamondback@cohunt.app>
Subject: Re: [PATCH v2] platform/x86: int3472: Handle GPIO type 0x10
 (DOVDD)
Message-Id: <177186446011.17917.14048787895528382322.b4-ty@linux.intel.com>
Date: Mon, 23 Feb 2026 18:34:20 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Tue, 10 Feb 2026 14:21:29 +0100, Leif Skunberg wrote:

> The Lenovo ThinkPad X1 Fold 16 Gen 1 has an OV5675 sensor (ACPI HID
> OVTI5675) behind an INT3472 discrete PMIC controller. The INT3472
> _DSM returns GPIO type 0x10 for one of the pins, which controls the
> DOVDD (digital I/O power) regulator enable.
> 
> Type 0x10 is not currently handled by the driver, causing the GPIO to
> be ignored with a warning. Add INT3472_GPIO_TYPE_DOVDD (0x10) and
> handle it as a regulator with con_id "dovdd" to match the supply name
> used by sensor drivers (e.g. ov5675).
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: int3472: Handle GPIO type 0x10 (DOVDD)
      commit: 2a7b7652b1bb3fadc3bd47d622bfb127a93ab6b0

--
 i.

