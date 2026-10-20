Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792533102;
	b=BrbBXcFWnG9sncss3KJwYsb/qcrd7E8wrytVrgg4g5wAYi/EeN1vMfJjr3a0bmy5BP3Z
	 T99McC0RN39VEG2ArrY2YSAMJQTaeREYC8ASjURQCCtWg0TBsNMnq0j6mvDBFiNuRaCgY
	 /GQlqnKelwisucYMeqfXc/z3MIqiw/oGEeByX3Q/EmqETfHgq8HlkumWRO8MAKq8oKWe1
	 a1inir6AMgI38318fJxTzIW6WVx+T6JPNEUDtGSPpQekFP3K68zKrTcuBy/pqX+Zi69SN
	 ztltTX5V2RvE6ZCNVmbH/sDp8C+Y2mnFcqdXv/sTXZNQjEpd4UoTTyUfQcMbtwOs6QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792533102;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=du/VsXvpGoU4TbTB6TihajteW9SA20ibVgY/D3oS6UU=;
	b=4PMqF2j5zg62fyIZgt+i4hq9zFKGVV++N76HFoc2asOlBA1bMqXABEaRf02cvyc+8xyN
	 A+ibX+Tpl4GStAZN6O6MEHiusD1O4bvlXVgfhCuP7TkMpqN/XOWBxf8OWgJ0Zkx+sfpYQ
	 Zk12JPXALxPH+bKhXZMozJECgHIvip3grjNqN64vL2TU9eJdosaXush2Hce3WRUBFMnaf
	 LZDTmpG7qqcBvm2gVLiEja/KazpZNau/xYQdsDAsF5nn6MWY8hMyBRWTMk5fQjQ9GziAt
	 k14AvQxhg4UyFaShTYQ74H96tPdUo4LiUkBWo7aG76keUedkb23oyWbjy4426KC8AaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QQprMQCp;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917E2606A319;
	Tue, 20 Oct 2026 21:51:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 917E2606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QQprMQCp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792533102; x=1824069102;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=PEfVcbXKkHHVq9Ags3CMYmB+lU1zUEH1kcy+tNpZ0cE=;
  b=QQprMQCpBkeHi7Gkwg4lL/n/cgPYX55dEK3+nr28wGaQiggambbL8o8/
   JmYa7fE7tRP1SSl86Gyia9+tCA5RuAq0L4R6YKL1Dz31AyEFojw6SBNIp
   t/6pn+4SfiqImXMGAsajMn2xV9QEHLYiLgeIMdRpSuzpGLC1Z6NA0ryDI
   QoWpfEG+ZUYoQPg1i4hpSEhTFhFABS8w/mxGf0lrb6E1D7NX24s+be3DE
   sAtRhjMLEMxneknR37kM2JfI6Ko/gH0vfHYG0CmSQ5fzJdrdR6A8yYfyX
   YQ/zteKjyofeFvbBnx8LDA2D8NDyXFpngn6GaTBV+cRZqb/Wyy3W8Kdla
   w==;
X-CSE-ConnectionGUID: DomZ5yWRSYO6tbMhDhRR8A==
X-CSE-MsgGUID: nWoxQViCQei2GYaJCpyIcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1136994"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1136994"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 14:51:41 -0700
X-CSE-ConnectionGUID: wP4KsWL3Ts2Zi782tP2mbg==
X-CSE-MsgGUID: gjtRkszLQ1KFvC8U7SYFJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="3277320"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.181])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 14:51:40 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>, 
 Patryk Pilichowski <pat.pilichowski@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261020141427.1580282-1-pat.pilichowski@gmail.com>
References: <20261020141427.1580282-1-pat.pilichowski@gmail.com>
Subject: Re: [PATCH v2 0/2] platform/x86: msi-wmi: Ignore WMI events for
 keys also handled by atkbd
Message-Id: <179253309511.28707.18186547761243368124.b4-ty@b4>
Date: Wed, 21 Oct 2026 00:51:35 +0300
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

On Tue, 20 Oct 2026 16:14:25 +0200, Patryk Pilichowski wrote:

> On MSI notebooks, several keys send a WMI event through the Wind event
> GUID in addition to a regular AT keyboard event, and each press logs
> "Unknown key pressed". This series marks those codes as KE_IGNORE.
> 
> Patch 1 sorts the existing scancodes numerically with no functional
> change, as suggested by Ilpo. Patch 2 adds the new entries.
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
[1/2] platform/x86: msi-wmi: Sort scancodes numerically
      commit: c21bef518bc023dfac0f22c9a63a813706e67639
[2/2] platform/x86: msi-wmi: Ignore WMI events for keys also handled by atkbd
      commit: 34f5b0ef61f6366b2bdc9f6d111bc5b225be004f

--
 i.

