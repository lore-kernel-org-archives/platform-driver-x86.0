Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5648E40628F;
	Thu, 30 Apr 2026 13:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777557276; cv=none; b=ipzYBe25bh4Bx8yKsRvC+i2/k9s2sl9H8MkWUQXY8rKT6Ug6OaW5OMf0U26azzdLo2uuDxEPIHF4/XgY0A0wUiSwzn1xKLZ7Z0wD4sCruIMVLKQWtRi78WkYkDDniglt/QooQsi4h5TbVFElfyyE6wcjriq/vENF3XFdUDq1tYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777557276; c=relaxed/simple;
	bh=jDBUBnn/AIQStqZ/7YWIK9XlktRUXz18GxQWxmKKWnk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=R0DLZz6IoRySoagJd2HU/5OAjAqLJ8Pq6k2jJUoOjltwTvjd9K8gWhiltFRowdmjnvQ+dzjZVFd8NuMUoUs1kisYjl+6qosGyKU3Vcxp8n4blRsFfABi0sBFitN3pJMZFqHI0CJgXEYuw0a2Zc/gTozp0SkA7qrM9Nf9FP2OY+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M4qK/7FH; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M4qK/7FH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777557274; x=1809093274;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=jDBUBnn/AIQStqZ/7YWIK9XlktRUXz18GxQWxmKKWnk=;
  b=M4qK/7FH4ksRaJR7iT4zmvkUYEDRwuJoObondfrnQXA5S7Lcg7GstdFk
   8l77uDnVGq9wKOlTyFB7Sua2iE0bJynt9DWZxU+3UMNIu4aajX/RSvhNQ
   yvhkQfjkh32eLCREAL400QGWk7cleeiEPM9tCqpriMvbvgqe/o9XXJP7/
   2mEEOVsoENUPa13xVZ8Kfnl/i3kISwKhNPZLbSZrxei/n2R6v27jNZRPO
   eI9AQCHzuwUVt3pJq0rTZtEZ+DPg8bwDFcpb3mXMdTVUsJUpbEWINHz+k
   atl6V0Ti84RqQmy8+I7uiuWu0CTeNa4IS1qTZcL35qFBCvb1HJzn+R2lh
   g==;
X-CSE-ConnectionGUID: 2kb2L1onRdGUZeeVqjhXLQ==
X-CSE-MsgGUID: kJQlWil7RrKhcfUfxfzv3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="89103278"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="89103278"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 06:54:32 -0700
X-CSE-ConnectionGUID: 5FQVxBLPQCCrYFQ+a5zXrQ==
X-CSE-MsgGUID: v8k3qdr6TJmp5+GxL4tuRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="233746609"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.130])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 06:54:29 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: mpearson-lenovo@squebb.ca, derekjohn.clark@gmail.com, i@rong.moe, 
 Yufei CHENG <cd345al@gmail.com>
Cc: hansg@kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260426165034.9073-1-cd345al@gmail.com>
References: <20260426145907.7295-1-cd345al@gmail.com>
 <20260426165034.9073-1-cd345al@gmail.com>
Subject: Re: [PATCH v3] platform/x86: lenovo: wmi-other: Fix uninitialized
 variable in lwmi_om_hwmon_write()
Message-Id: <177755726340.2048.13579078421388409410.b4-ty@linux.intel.com>
Date: Thu, 30 Apr 2026 16:54:23 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Mon, 27 Apr 2026 00:50:34 +0800, Yufei CHENG wrote:

> When the flag relax_fan_constraint is set, local variable 'raw'
> is never assigned, and lwmi_om_hwmon_write() will pass uninitialized
> value to lwmi_om_fan_get_set() resulting in undefined behavior.
> 
> This flag allows user to bypass minimum fan RPM divisor rounding,
> but assignment to 'raw' only happens in the non-relaxed path.
> Fix by defaulting 'raw' to user provided 'val' in the else branch.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: lenovo: wmi-other: Fix uninitialized variable in lwmi_om_hwmon_write()
      commit: 863810d4985ad214f70c1623f24384ccc850f2a2

--
 i.

