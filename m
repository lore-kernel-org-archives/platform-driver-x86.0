Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794839003;
	b=RyEHDjt68iTfrX+09/U4g4I1IxcXouK+GqGKOp9tciMyElpNa0BS/pzt6nNYRLUi+vx4
	 dtmbmtF7qwrZtRlMu0/3MVH77nP/xf8lyzb4nEahoZWo0eTUJWaa965VdTxxKT7UoK18m
	 YG7p8Pg9ZYM4RqyLNkR2FIxYQ6Jfcq++WXmbJ5yvVnBasXYlie+q7uXsIstI4TzpRkoH8
	 Q5Qhnlfn5rLWtYGuCn344ISE3z9FzzviVJIfNR6GJ7XFsGDk+jifxdGI+EtgMNC8lt3VN
	 WDll33jdOBrd6zVkxdr6JujgiHqdqj+hPcuUMdR0gsbAjgaCi3861ICxbeA9tTFTkxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794839003;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=OpxWyoAQbOahTmLkQS4fRw9oUuDEFwA/snZu/Ji+S00=;
	b=prpDwLvms0kgcrORuSboSXQ03M4cWe1K6ndsrIKx5u7ItC+1SJbyYF8OAkW7rY0yGyVl
	 0vuURLc2UCwaDAfzqv+tJV31Kxhkf5F8NF7pDaHPnZxh/BjieUu1HPouF4CWMjmcCSiJz
	 lWSPZeWc0n19xt7OEzPDMsTpRrjo/XV1lS9D3wACZ95wU1uc8U+sU02CyVWGJMPYXRBO8
	 Yu1T+cqaTAsAvYV8X46AqfwMYTeLO8Ry+I9H6nPQ/+vMJ5Gi7deFq0mTKXEznWkkgkBwR
	 LtB56ppaGq14IJBhM+Hrd/kji5MshfibxSe/DUXQKkwUR6AcdUIWNS2D5cwhBO3128A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AHzSbcNj;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D0A606A329;
	Mon, 16 Nov 2026 14:23:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33D0A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AHzSbcNj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794839002; x=1826375002;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=WORWIPaysiWLwNUVs/uzZuamdc051g/K87PL/1vgSSw=;
  b=AHzSbcNj60KON9bHRVabMkNnml8UmuoIxEg5h3CgZ4rXWb7RadIRNC4U
   SAaxPGT386F6YcR1ayO7qaKs7KOXBtJ4VHpqhQsIEq+xMHAGYwgC1cxx0
   V6f8xHB+CW96eEq55LAAe+HOJHzSATvkOdYJZ2Kh1waSiUvD5wBwqlZR/
   bBIbyVnP+8xRcm+ROcYUJbboFKPhFbq/wg+8G/iEF2wEF2eKt+Yf0HzJv
   h2qxXFWzfXLuiRduket99zlwc2w1zaAbFX6pAI3cKuQIu1AxbnZVCoFgD
   Tg/tr+ERQRWwMz0XTMNse7fSIVmPIGAAU3xUjqwfUU/JTGtuJBHs5BtVT
   w==;
X-CSE-ConnectionGUID: gc9jKn1zQxeIT7tUUl+Uyw==
X-CSE-MsgGUID: +YTCMUQSQO2IC16i5+bIlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3606862"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3606862"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 06:23:22 -0800
X-CSE-ConnectionGUID: LfB2n/iMS9u0vwgqWIOX/A==
X-CSE-MsgGUID: 5bQoztStQ0iGjMMWsryEkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9570784"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.151])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 06:23:18 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 16 Nov 2026 16:23:14 +0200 (EET)
To: Erwan Velu <erwanaliasr1@gmail.com>
cc: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>, 
    platform-driver-x86@vger.kernel.org, 
    Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>, 
    Carlos Bilbao <carlos.bilbao@kernel.org>, Hans de Goede <hansg@kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/4] platform/x86/amd/hsmp: Add /sys/devices/amd_hsmp
 socket devices
In-Reply-To: <20261116141150.667950-1-erwanaliasr1@gmail.com>
Message-ID: <2ad73cfe-3ae6-43d8-c7e9-247239b72519@linux.intel.com>
References: <20261007125908.321186-1-erwanaliasr1@gmail.com> <20261007125908.321186-3-erwanaliasr1@gmail.com> <73b9c9a8-479d-4a5f-9321-2e095f11951d@gmail.com> <20261116141150.667950-1-erwanaliasr1@gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 16 Nov 2026, Erwan Velu wrote:

> On 11/1/26 18:57, Carlos Bilbao wrote:
> > Is this over-engineering it? The platform driver already creates
> > /sys/devices/platform/amd_hsmp/socket0/, socket1/, etc. they're just dumb
> > dirs with only metrics_bin inside. This patch series ignores those and
> > builds a whole new /sys/devices/amd_hsmp/socket0/ tree from scratch with
> > root_device_register(), manual refcounting, etc. instead of building a
> > parallel tree, upgrade what's already there. Turn those existing socketN
> > directories from bare sysfs dirs into proper struct device objects?
> 
> Hi Carlos,
> 
> Thanks for the review and the acks on 1/4 and 4/4.
> 
> I think the commit message did not explain the goal well enough, so let
> me clarify it first. The goal is not only to get more attributes on the
> platform driver. It is to give userspace a single path to the per-socket
> metrics, whichever driver probed.
> 
> Today the same metrics are found in different places depending on the
> platform:
> 
>   - Zen5 (ACPI probe):
>       /sys/devices/platform/AMDI0097:00/
>       /sys/devices/platform/AMDI0097:01/
>   - Zen3/4 (legacy platform probe):
>       /sys/devices/platform/amd_hsmp/socket0/
>       /sys/devices/platform/amd_hsmp/socket1/
> 
> "modprobe amd_hsmp" does the right thing and probes the platform or the
> ACPI driver depending on the system, which is good. But as a
> consequence, userspace cannot know in advance which of the two trees it
> has to read, unless it walks sysfs to find out.
> 
> On a Zen5 system there is no amd_hsmp platform device at all, so
> upgrading the existing amd_hsmp/socketN directories only covers one of
> the two cases. A monitoring agent running on a mixed fleet (our case)
> still has to find out which driver probed and use a different layout
> for each.
> 
> That said, I agree with your point on the implementation. The separate
> root device and the hand-rolled refcount were the wrong tool. Ilpo also
> pointed out that kref.h was the right helper there. For v2 I would like
> to propose the following:
> 
>   - Add a device class (e.g. "amd_hsmp") and create one socketN device
>     per socket in it, with hsmp_sock_groups.
>   - Platform driver: the socketN device is parented to the amd_hsmp
>     platform device and replaces the current named attribute group, as
>     you suggested. /sys/devices/platform/amd_hsmp/socketN/metrics_bin
>     keeps the same path, so nothing changes for existing users.
>   - ACPI driver: the socketN device is parented to AMDI0097:0X, and the
>     attributes already on AMDI0097:0X are left in place.
>   - Userspace gets /sys/class/amd_hsmp/socketN/ on both drivers.
> 
> This removes root_device_register() and the manual refcounting, and it
> lets us use device_create_with_groups() instead of building the device
> by hand.
> 
> Before working on it, I have a question about the AMDI0097:0X path,
> which I think needs a maintainer decision:
> 
> The telemetry files on /sys/devices/platform/AMDI0097:0X/ are
> documented in Documentation/arch/x86/amd_hsmp.rst (since 511a4a5ea2b6),
> but there is no entry in Documentation/ABI/. They are tied to the ACPI
> device name, not to the socket. As far as I understand, the :0X suffix
> is the ACPI instance number, while the socket index comes from _UID, so
> nothing guarantees that the two match.
> 
> What is your view for this path?
> 
>   a) It is stable ABI and stays as is forever. The class path is only
>      added next to it.
>   b) It stays, but the class path becomes the documented interface,
>      with a Documentation/ABI/testing entry. The AMDI0097:0X files are
>      documented as kept for compatibility only, and we would propose a
>      progressive deprecation of them (e.g. a Documentation/ABI/obsolete
>      entry first), so they can eventually be removed once userspace has
>      moved to the class path.
>   c) Something else you have in mind.
> 
> My preference would be b), as it doesn't break anyone today, gives new
> users one documented place to look at, and leaves a clean path to a
> single interface in the long run. But I would rather align with you and
> Naveen on this before sending v2.

The lack of Documentation/ABI entry should not be taken as an indication 
for something not being ABI. We generally don't take away ABI without 
doing proper deprecation and waiting first.

Sometimes, the old place can be covered with a symlink to the new place.

-- 
 i.

