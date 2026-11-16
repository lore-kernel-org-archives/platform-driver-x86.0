Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841054;
	b=w4sxnTbQoS4kgfNVMZc8oDoSjiUz9c8lPRBd+XBGPV5aWd1S9xGCmQibJqk6LK2GxW6x
	 Ea9PgAtkemo/JTABc+VSXFR7Nzgr3hRmzaxZx9GnTJxdxX7OrOSeL18vkTfpapWqxmAe4
	 pWm0ArsPlOrjPB1vmpCrQvf93AJOegNRXnK9iGMxeoqQ8rRkNUGfM51tUlldh+h+rAGwj
	 V2PUd0Xbkw6QUNCOMqpc8ds2NnVdSSEZEuQUdVCzp2/yQrE1t10OFp2tixJFC+XDlLzNE
	 E2tJYHBSay1ZOlzs0AaHawEucoLwTvy/wioVRQ0zo6qOezum3orsBlWTqXD088P199g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841054;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=rEfHSP08js41yAUgdyGaGJ8cE88yMrcgLd0b5cArmYE=;
	b=UCux1K1EjVyVB+LqWoOSVClhyMpED7kQCGNAVQ6iUmSdr6fLVTFSP3zU5JiEPxJki9rR
	 cY3M0I/AxCRQjF63s9OHmAuQqAzNJ5zBcN3MUvGhuiazFEsn/V0TwgL6hmtkq8cXaOq7+
	 Ff5KWO3GRXAbaBvRxpufvSKRAI/ynGT/WCijhfN68eUDvaxiZ0PskJ5cZOy8KQbLWiwXX
	 MWEalifRFZByn+2hWdj+hXhausXdepEufeJM2/e3Vyy2dDyER+JQgOWqr6sqNGU2DcSw4
	 Nq7vHjlE56gss8SBkGIzN0wM73d/bhtiHb/uS9azeAQqr2TBv4BGatOgtX3QjPIkg+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BKconya8;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC715606A31C;
	Mon, 16 Nov 2026 14:57:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC715606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BKconya8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794841055; x=1826377055;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=4JEeurzNRB9iJiMG8IlCP86/jDWGqv0Dsuyy3GgwRyc=;
  b=BKconya8Kts8ETIe8QQ2fpX6X2Couo1RGLYxVQuBuIKBlfYxuHZX+q8e
   HKgaWPAJ6sEQZeMR14vSgKOnzNqXdKyziyOJAGX4dO2sU5zqIxdYALfTY
   T+fyJCbNS06nWGfkkW6WZxl9Ha3WryT6ITgNkZkar5+DIEFIhN/qCBESc
   y8AaJ0psCxeiP1RHHoNduIxovpia28hS9gOtPTvlKSrhsOaZpsa2exUnm
   8vUJ+43g7D+N7TFrQUwmMSru6wMsidmk3GBmUSeLJQJ0p1Bu6r5tEqdE/
   OO0YO8d1uAUPIDSdUSGU1S2VgfkFhoBTELdJHjWEK5CJ3rXb83J+V8rVc
   Q==;
X-CSE-ConnectionGUID: bm4LKlpZTAiOpxsuZAA7TQ==
X-CSE-MsgGUID: MoMYbe9jRMywIR6XkQr3Xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3453812"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3453812"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 06:57:31 -0800
X-CSE-ConnectionGUID: sr1t1cNHSRy1OIAQA9rNpQ==
X-CSE-MsgGUID: lhHkFNbyT6etDatd1yOoQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9405684"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.151])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 06:57:27 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 16 Nov 2026 16:57:23 +0200 (EET)
To: Erwan Velu <erwanaliasr1@gmail.com>
cc: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>, 
    platform-driver-x86@vger.kernel.org, 
    Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>, 
    Carlos Bilbao <carlos.bilbao@kernel.org>, Hans de Goede <hansg@kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/4] platform/x86/amd/hsmp: Add /sys/devices/amd_hsmp
 socket devices
In-Reply-To: <CAL2JzuyL63cqnV+DR22NfAPFHCO24G0_NkPohm1vao-U985pBw@mail.gmail.com>
Message-ID: <79f34929-c030-2f24-7663-5b18ff4d59dc@linux.intel.com>
References: <20261007125908.321186-1-erwanaliasr1@gmail.com> <20261007125908.321186-3-erwanaliasr1@gmail.com> <73b9c9a8-479d-4a5f-9321-2e095f11951d@gmail.com> <20261116141150.667950-1-erwanaliasr1@gmail.com> <2ad73cfe-3ae6-43d8-c7e9-247239b72519@linux.intel.com>
 <CAL2JzuyL63cqnV+DR22NfAPFHCO24G0_NkPohm1vao-U985pBw@mail.gmail.com>
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

> > The lack of Documentation/ABI entry should not be taken as an indication
> > for something not being ABI. We generally don't take away ABI without
> > doing proper deprecation and waiting first.
> >
> > Sometimes, the old place can be covered with a symlink to the new place.
> 
> Yeah, but since the trees are very different between the current ACPI
> (AMDI) and the platform (socket<x>) one, I don't think a simple
> symlink would be accepted. Would it be ? That's my main issue here.
> The two implementations of the same structures vary so much that
> unifying the output means breaking one.
> The platform structure with socket<x>/ is way easier to manage from a
> monitoring software point of view.

If symlink is not possible, we just have to keep the old interface for the 
deprecation period then I think.

BTW, when submitting, you should also cc the AMD people who have been 
working with this driver recently (if they're not maintainers, tools fail 
to pick their names automatically).

-- 
 i.

