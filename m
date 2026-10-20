Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792533110;
	b=nFAk7uVnbjaNrFs7bVYt+4j6wSE/BoTGUSR905x/AHqNfoor6m3opYngBZA5MO9+wsIF
	 SxSnDGl6q/+zEixXAoMFvjL1B8AXk3WQBFrP/HkuTUXTuzBZ71XjYahef7pYh7wHbWZ0F
	 Z9N35im71mDlZfYQRDaMwA8J/1BmPmRKpxUFeajQcqPAiehDkiJuw2tJkXyfwJ44HGRMB
	 GX9+I/cZufxizjqtbqD6TqpwfjJYB0n+I34fOgib0kDuD106qoBabe0vb4Mm148o7z1BA
	 QaPxOVEXIBcNijlUuhKa54WPLXZ/5HZLhbtmgi/NBH+/FTVbwE75sI8qtGlldDShqGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792533110;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=OZCeJNr6R0f32G/YRTjtrBYTCVhFHI6xgzzpwd0FDWM=;
	b=5diIM/Cg7pR0IXqhWYS0gvV9v0kwkJoMT4uDEmSHiPbNGj7Q32Ho+x4UJfk/oebNPQxx
	 FbPgprHMU8kygflia5HwnFiwpqVl4tpmKF/xoyd/cxbopoYGCRZwnLVKLMG4pgXTcKtSe
	 7nELYoW6hiaZa2ZAg3bSv+KECxUr70+sUoCvfTUqyGNzOmGtnCfziz5JcySJPeVy0VfT5
	 a7VQXvllN041GwD5qQJERX3poJm7fMjZpQY6sfWQ7Q6uRpSLSWcKotSIJ20XiscGSC8Ww
	 AN1bKYbWzijGszA0WwO29wyz4vxVjcAyBEOC/ZTvOfekJuM2ESiv6DmvPPHW5g6kLYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=U6HgrrWG;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EBE606A31A;
	Tue, 20 Oct 2026 21:51:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83EBE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=U6HgrrWG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792533110; x=1824069110;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=EBMaRRhQLUzyl2VxOE4oKqFGhO8Sf/Qzse2NmLWQ2ac=;
  b=U6HgrrWGBO2Vjc5y1F3QmGd3Iz5GToCoT008oiAZof9tZ4fy1nNJoZ5Y
   /VPl7gQU/xSuogluPqlw7WmAYCKKmgG/ZNh0jA17hKfk9+JnrtJcE/6K0
   tvYueqDIxG622DHM6RGdZMPFLeznKQNJ9iYitw43BZJeNJNh6FBaQHeUq
   lMQKYFsnRSXaBYHs9Eqe+lDt6n+7eaWbLHbMb2rCQycHdNE19ETcrBDrL
   uh3IITRzI2jPh6sFqq6nl2okmdOnoIgiX3jjH+HDl3Ezh29o+Bir+l60/
   GeKwstoQ8AnzDNhhNSJAXDo2O+8du6bwK/EAqCnIdO3xI3xzgV+3cpnXb
   Q==;
X-CSE-ConnectionGUID: qNc0vBtaQgGmqcl9qwtzFw==
X-CSE-MsgGUID: AKr95iEaRSaGyFib2pYMEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1136999"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1136999"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 14:51:49 -0700
X-CSE-ConnectionGUID: gJGgsjw1T/CLmWzlkxdcsQ==
X-CSE-MsgGUID: +5munJanQ1uYdIbCXsvmng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="3277322"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.181])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 14:51:47 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, 
 Denis Benato <denis.benato@linux.dev>, Hans de Goede <hansg@kernel.org>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel@lists.opengamingcollective.org
In-Reply-To: <20261018160603.65449-1-derekjohn.clark@gmail.com>
References: <20261018160603.65449-1-derekjohn.clark@gmail.com>
Subject: Re: [PATCH] platform/x86: asus-armoury: Add XBOX ROG Ally X 20
 Tunables
Message-Id: <179253310137.28707.15124955752364794505.b4-ty@b4>
Date: Wed, 21 Oct 2026 00:51:41 +0300
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Sun, 18 Oct 2026 09:06:03 -0700, Derek J. Clark wrote:

> Adds Tunable table for XBOX ROG Ally X 20.

Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

FYI [if applicable to your patch], as per Linus' policy change, also
fixes are mostly routed through for-next unless the fix is for a
commit introduced in the most recent cycle or is clearly a regression
fix.

The list of commits applied:
[1/1] platform/x86: asus-armoury: Add XBOX ROG Ally X 20 Tunables
      commit: 148794d9f0d29e25283978302c41533b81b20b8c

--
 i.

