Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BFD3DB646;
	Wed,  6 May 2026 11:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778066798; cv=none; b=GODKr3zdIMRyfw9IGn8QZ/6iycOk6GixaQ49bWjDnenl3dIWmDyjrv9+eNl+ftRoKzyjaMk/m9h9vDKqt5lgTa0TxN5z13IasERfyQHhqpKYF7h2kRTeZkrw3vXD39ME+W43wSOUuD5FXghfeVfhhzn21iz+yJrt/EHT4H1zEa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778066798; c=relaxed/simple;
	bh=w/3BrIq6SLKVanB6Wv9j16dONqxr5p+5KmbAmeeaSSk=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ZhLv1xyZuK7oh8X3/YGNFSGApFTgOM5gdeQIV6KCg1H+YpKCqCtZQKLPYBM7PpTaroIj98t+jUhriD9aq3KOk+64DOJRmDh/KuoAOP07kWRi65lLvDuU3ztpK8a8iJaxrQJhJZE+02OHl7vt+lwYKKf2Kbj65r2mVBRIyNvK8Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RGyUlyQA; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RGyUlyQA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778066798; x=1809602798;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=w/3BrIq6SLKVanB6Wv9j16dONqxr5p+5KmbAmeeaSSk=;
  b=RGyUlyQAgGv2NCTll4Wn8/i0aGVWrtfYRDuUN1xNNE9KJu6J0Ybfiyb1
   T1V+2WI6yPxwa97tkKB4+eaUxL9bmu/2XWoaRyanyH9uKkxY21UrETL7v
   ou5OesG4Tb2CYcZz79FilA/Tylyjus0fjI9GpxtVeG5ZLXTIA5bUlQFK2
   xVRpX1plWAniV8WVWNawSeV96tOifUm5pIiJjzAlw6XMQ2YxgoQeITLaW
   Oude3BuMNVJ5crazw/IDfzVzMjvGXUvxnzKpJXGWXAyycy8liWaXEGiIw
   9qMNf/Ot5P/ZIKhWhpEseskIN4OxLUUizxyLF0zSeI8lOtfgj53/Z9R9I
   A==;
X-CSE-ConnectionGUID: 3hGgmpivT+m7CUJGgF+O/w==
X-CSE-MsgGUID: Br7EreiQRCaAUYS0M+i0fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="78885354"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="78885354"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 04:26:37 -0700
X-CSE-ConnectionGUID: DXph97CaQhKeWYEYNMY2XA==
X-CSE-MsgGUID: EEMe0SJ4SA+/8j+T1tDGMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="274248496"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.231])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 04:26:34 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 6 May 2026 14:26:30 +0300 (EEST)
To: Denis Benato <denis.benato@linux.dev>
cc: Armandas Kvietkus <armundunelis@gmail.com>, luke@ljones.dev, 
    Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, fxzxaxon@outlook.com
Subject: Re: [PATCH] platform/x86: asus-armoury: downgrade missing power
 limits warning to debug
In-Reply-To: <6460ef7c-b4d9-4106-95cc-35710b4798bb@linux.dev>
Message-ID: <91d3cc8d-ee5b-f204-ee42-ad8825a14a24@linux.intel.com>
References: <20260503175734.27795-1-armundunelis@gmail.com> <6460ef7c-b4d9-4106-95cc-35710b4798bb@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 4 May 2026, Denis Benato wrote:
> On 5/3/26 19:57, Armandas Kvietkus wrote:
> > When a system is not found in the power_limits DMI table,
> > init_rog_tunables() emits a pr_warn() and returns. This is
> > expected behaviour for hardware that does not support ROG
> > power limit tunables, not an error condition.
> >
> > Downgrade to pr_debug() to avoid spurious boot noise on
> > unsupported systems while preserving the message for debugging.
> >
> > Reported-by: fxzxaxon@outlook.com
> > Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221441
> > Signed-off-by: Armandas Kvietkus <armundunelis@gmail.com>
> > ---
> >  drivers/platform/x86/asus-armoury.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
> > index 5b0987ccc..c8e9ff89f 100644
> > --- a/drivers/platform/x86/asus-armoury.c
> > +++ b/drivers/platform/x86/asus-armoury.c
> > @@ -991,7 +991,7 @@ static void init_rog_tunables(void)
> >  	/* Match the system against the power_limits table */
> >  	dmi_id = dmi_first_match(power_limits);
> >  	if (!dmi_id) {
> > -		pr_warn("No matching power limits found for this system\n");
> > +		pr_debug("No matching power limits found for this system\n");
>
> Maybe this is right to get downgraded, but still no debug: I think info is better,
> but I would like to hear from Luke what this is about.

Hi Denis,

When kernel is built with CONFIG_DYNAMIC_DEBUG=y, all debug messages 
will appear if kernel's cmdline enables it:

dyndbg="file drivers/platform/x86/asus-armoury.c +p"

(wildcards too could be used where helpful and semicolon as a separator 
if, in rare cases, more than one filter should be necessary).

So all we need is to ask the reporter to boot with dyndbg enabled for the 
relevant file(s), no recompiling the kernel required.


I suspect most distros do have dynamic debugging capability in their 
kernel configs so it shouldn't be a problem when they don't by default 
show these messages (at least the two major ones I just checked have it).


-- 
 i.

