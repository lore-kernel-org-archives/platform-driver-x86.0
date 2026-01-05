Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715E53093DE;
	Mon,  5 Jan 2026 14:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767622925; cv=none; b=ifz9KF+e6Ndz+M6U3fnxinxuNIKYZw/SWA9i76+n8JJFkrV2KMc9h71vN0E0yQ8BiHyL5eK3PXps1sya43rxsWZYCG5RspRBM1KnRJV7+HI9OlDBW6Da72+XQQia3Nlj9GGB1jTrtrULyc+40NhlhdNtrEKbKj3tsLagY68bE6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767622925; c=relaxed/simple;
	bh=YhPZ/sKcUtdD1ZpLb1oUP5X5qOxAwoWM9lV4v7HV6e0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=RfekJMM3xWeouJvQM7mxRxgqBgIzHoCAIoOcAZ/JVAwWffERnNR4JL9j6xFTTBX5SWfmeH3N1Kj2s3WgNtne+Paw52KuVrAPRhTDyZiU84aAf+CDsYj8ECfVgkvKoghcoUZP6Hs85nXzrC++3FOEZDGqOe1uWIj/i2+lY16tmxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yn692GMM; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yn692GMM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767622923; x=1799158923;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=YhPZ/sKcUtdD1ZpLb1oUP5X5qOxAwoWM9lV4v7HV6e0=;
  b=Yn692GMM6flsgarYgz9N6hteXHbhSw2U5Q/qaHwbr1YOzs4d54pCmzXu
   na6wfnopPFA4c78kVvPpuzyMSxfAsnfjPjqgkSwv0oqPYlrYUDmGdj8Rf
   wMPyBo9S7jlG1VQn8eyRoWqNHj+pq57lM+kDMZ2+q31QUplF5Nk2+DUeY
   AMVUgJizBSCiQLUsRY1wUwJDUGz0vikx0kFSQXSNR42trrLuU+d/TIT7o
   8pnGUGFhGNsydJe9CNwSpDFWf+Ig3pL99wxtmIdyO+hlFA2aA09qkIzIQ
   W4Mhrhi8M9pW/Z5WPYkqyUaotpcRXki7vqQPS5XB9wgF3RmHYaSWPOvIY
   w==;
X-CSE-ConnectionGUID: HKbCTRuDTROhHUXaagKH+g==
X-CSE-MsgGUID: Ixf3tmxsQ4SGrUUGFRBiGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="72845674"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="72845674"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 06:22:02 -0800
X-CSE-ConnectionGUID: 1o35mHJQQiqHKXqrU6W6HQ==
X-CSE-MsgGUID: DSOGZgC9RtuJYtljN0v+ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="201640697"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.202])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 06:22:00 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 5 Jan 2026 16:21:56 +0200 (EET)
To: Thorsten Blum <thorsten.blum@linux.dev>
cc: "Chen, Yu C" <yu.c.chen@intel.com>, Hans de Goede <hansg@kernel.org>, 
    Maximilian Luz <luzmaximilian@gmail.com>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/surface: Replace deprecated strcpy in
 surface_button_add
In-Reply-To: <BAED6C05-841E-4BEB-878F-6049D20669FE@linux.dev>
Message-ID: <57bc8c7b-72c6-e9a2-f03c-c840be6c9c35@linux.intel.com>
References: <20260105121802.1947-2-thorsten.blum@linux.dev> <4cadf166-2693-489e-a6f7-ae986694fd88@intel.com> <BAED6C05-841E-4BEB-878F-6049D20669FE@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 5 Jan 2026, Thorsten Blum wrote:

> On 5. Jan 2026, at 13:52, Chen, Yu C wrote:
> >> -	strcpy(name, SURFACE_BUTTON_DEVICE_NAME);
> >> +	strscpy(acpi_device_name(device), SURFACE_BUTTON_DEVICE_NAME);
> > 
> > Thanks for the fix, a minor question might be why we do not reuse
> > name by strscpy(name, SURFACE_BUTTON_DEVICE_NAME) ?
> 
> Because 'name' is a 'char *' from which the size of the destination
> buffer cannot be inferred by the 2-argument version of strscpy().
> 
> Using 'name' would force us to use strscpy() with 3 arguments:
> 
> strscpy(name, SURFACE_BUTTON_DEVICE_NAME, MAX_ACPI_DEVICE_NAME_LEN);

I suggest you just remove 'name' instead. It seems pretty useless to begin 
with but especially after your patch. :-)

Please also add () to the subject line after function names.

-- 
 i.

