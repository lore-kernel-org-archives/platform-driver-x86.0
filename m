Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553775674B
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 May 2024 15:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715615675; cv=none; b=qQi1e8iqGp6Ys67CX91Sm6XdHGuPDNKHyoXZelhDJcZi1c5zMhrRa/n8k1fzN8n7HOaQ4QGkSUO2fkpgDdHD12keZ/iL72ED0DlZyVu8uou7nD4ZPj6LeSCUvytT0ASjHzT7Ch5NXQMGCev2U6J7xD9f6ELrhmPOSgWi9tMQhbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715615675; c=relaxed/simple;
	bh=BMZMOR/Hdl5gY7OVG4Dp6b3vdeZrlH5GdtmtWx0xy84=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=GjYOhW3tIxWL4SsC9T1QaMzYSWgbIJqnn9NcvUt1eso9pMpemKHlqewMT97IfH9y55Tz5WJc3Wg8nyX5xRCcUwNiD4NV05+7fbHwrLcylxQZqYmTcfGKJs8GjEZUF0XEpsDwty/Qf08nKpckouYUCC9pHjCiJ3rpi+HZQWUPGqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rd6sbgTF; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rd6sbgTF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715615673; x=1747151673;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=BMZMOR/Hdl5gY7OVG4Dp6b3vdeZrlH5GdtmtWx0xy84=;
  b=Rd6sbgTFlShPhssCnqr4JSVuA+Z+FCBPUUE6DO3+ZgflidvQB2X6ACYm
   NuZB8raAT2m3pGbvmVjq7W/UR939LHLDTCG4/FKSPj8+0f2Z7yBus4tl3
   jgjvnxRTF5yWs6NjFXU/ZwCC++ogoIuzJJ1qeOcHo48LH8lwcAnq8ILDb
   MVUB5L0Qd/yluLzZnghNXXMobzIZq07OvTar7djqRiWx3D5dZXb0ce3H4
   jGrLvd4q2re4HWhZiCwvuWSV5QJkm4+1CYq7OZw5957KwiHg+0U7T03Jn
   FYtwvqvxmQxMpCIQeNlcEbhFluOuVecJtZ+xv+n+WE98tUnTX3sGLMdFu
   w==;
X-CSE-ConnectionGUID: iayCUJG2SQCvewBh6qNHiw==
X-CSE-MsgGUID: 0Aub9qY9QV6XKNHh2W/WEw==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="34070892"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; 
   d="scan'208";a="34070892"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 08:54:32 -0700
X-CSE-ConnectionGUID: ykKUH/4+Q5u+XBBN2n/WpQ==
X-CSE-MsgGUID: vCTQNksXTfy3LJH/4v8v3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; 
   d="scan'208";a="30495806"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.89])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 08:54:30 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 13 May 2024 18:54:25 +0300 (EEST)
To: Andy Shevchenko <andy@kernel.org>
cc: Hans de Goede <hdegoede@redhat.com>, AceLan Kao <acelan.kao@canonical.com>, 
    Roman Bogoyev <roman@computercheck.com.au>, 
    Kai Heng Feng <kai.heng.feng@canonical.com>, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2 1/2] platform/x86: Add new Dell UART backlight
 driver
In-Reply-To: <ZkI1ZecXG0kqzak5@smile.fi.intel.com>
Message-ID: <7c134976-d70b-9703-c295-4c89c4c07070@linux.intel.com>
References: <20240513111552.44880-1-hdegoede@redhat.com> <20240513111552.44880-2-hdegoede@redhat.com> <ZkIOa6jo47CqgxGK@smile.fi.intel.com> <d4c9a9c6-da94-4e65-b8b6-80f5618d15d4@redhat.com> <ZkIvdZ9Xhs-HiZn0@smile.fi.intel.com> <b1880f73-c8f5-4076-bb62-6c9ea620e99e@redhat.com>
 <ZkI1ZecXG0kqzak5@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 13 May 2024, Andy Shevchenko wrote:

> On Mon, May 13, 2024 at 05:33:10PM +0200, Hans de Goede wrote:
> > On 5/13/24 5:19 PM, Andy Shevchenko wrote:
> > > On Mon, May 13, 2024 at 03:18:10PM +0200, Hans de Goede wrote:
> > >> On 5/13/24 2:58 PM, Andy Shevchenko wrote:
> > >>> On Mon, May 13, 2024 at 01:15:50PM +0200, Hans de Goede wrote:
> 
> > >>>> +static int dell_uart_bl_command(struct dell_uart_backlight *dell_bl,
> > >>>> +				const u8 *cmd, int cmd_len,
> > >>>> +				u8 *resp, int resp_max_len)
> > >>>> +{
> > >>>> +	int ret;
> > >>>> +
> > >>>> +	ret = mutex_lock_killable(&dell_bl->mutex);
> > >>>
> > >>> Can't be called via cleanup.h?
> > >>
> > >> I prefer to have the locking explicit rather then use cleanup.h .
> > > 
> > > Hmm... interesting, so you push-back the cleanup.h usage?
> > 
> > I'm in favor of the guard(mutex)(&smne_mutex); syntax, but this
> > is a mutex_lock_killable() for which that does not work AFAIK.
> > 
> > So in this case AFAICT we would need to use the cleanup stuff manually
> > and in that case I believe that in that case just sticking with
> > the current code is better.
> 
> There is scoped_cond_guard().
> But there is no DEFINE_GUARD_COND() for mutex_lock_killable().

Is there a way to return the original error code with scoped_cond_guard() 
or does that it force overriding the original return value with a 
hard-coded one provided by the caller which seems a step backwards?


-- 
 i.

