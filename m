Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE21349B19;
	Tue, 13 Jan 2026 14:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768312958; cv=none; b=Ad3860OS/G6/QbxAmOdTxh7EFIML8g9rlkNNqzjE092uEje1ku2INlbhb4MZEUjFhFbUsVFgm7FEDaLjgJ6GE6rnD1C8o6tp80LBniY0N7JklbQAcqzAbBVsZ8tva4iFp4bcv1qnDmef7mspLuywRjsarFNKPoyl3q60dxQ4bgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768312958; c=relaxed/simple;
	bh=m+rT2Kc/18Hm8i4jHd6zieucT5DynzZYZjUTIHOKeOE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=oiJB9g6tyMyoUbKUD+tI5F9lKs/NSzfNxu2hmvenr0PbX3Own9bnr11RjAKo1Q6/YhsFf0plTYvNrQcOAt9/pweG/Gb0jHYSd7Z5VS1F8dUwgkGDvQKm1tsXEawbQfsfbyZmpTd25tEoXtqZa9kcRpNvYUUXs6Q2PwN6EffS9vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GQCKN+6D; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GQCKN+6D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768312957; x=1799848957;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=m+rT2Kc/18Hm8i4jHd6zieucT5DynzZYZjUTIHOKeOE=;
  b=GQCKN+6D54lZAageAjPW7anj8Xm9zL5MAvD8H7wDH7w5oL6kpiH0+CF+
   VWtWEouiTrfQGcc4ptuDugZCyqDdVmKjx593xGdiC9NGHcaoCUUDONYc7
   1c3j/LppsyW7APpvUWV/ohT2uNc5Aw0B0snymJyZxUblU315MDaPfmw5Y
   oA1rPsljyUW8bn7NW9hRMLExuYAoAvUJLJJVOg7z4F3hcHn3so0h/cAmU
   aCTOL0E2E0IrYHdHZ+nPOE0V82JkFfn/8fHbAwVP7/+fqy+NgHdXBvbiw
   C4Tx1Wh/2xiWHHHAxiOnBTpSH2guzJ7BsIl8/A7l3hJKVQzWUEsIxorpy
   A==;
X-CSE-ConnectionGUID: Ps/gYEnhQcGDHgzTeyWwEQ==
X-CSE-MsgGUID: lzvrrZG2Q5adU2vmgp5LEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="87179288"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="87179288"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 06:02:36 -0800
X-CSE-ConnectionGUID: eowmZNKYQtGaEQKeKxt9Hw==
X-CSE-MsgGUID: T9c/qZhoRqyLy4C3JsTq1w==
X-ExtLoop1: 1
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.10])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 06:02:33 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 13 Jan 2026 16:02:30 +0200 (EET)
To: Denis Benato <denis.benato@linux.dev>
cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    Hans de Goede <hansg@kernel.org>, "Luke D . Jones" <luke@ljones.dev>, 
    Mateusz Schyboll <dragonn@op.pl>, Denis Benato <benato.denis96@gmail.com>
Subject: Re: [PATCH v4 0/3] platform/x86: asus-wmi: move keyboard control
 firmware attributes
In-Reply-To: <88609e7c-3348-440e-adc0-eed9dc4d452c@linux.dev>
Message-ID: <992b2843-4afa-ede1-d276-8ccaa61b1fee@linux.intel.com>
References: <20260102234344.366227-1-denis.benato@linux.dev> <88609e7c-3348-440e-adc0-eed9dc4d452c@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 12 Jan 2026, Denis Benato wrote:
> On 1/3/26 00:43, Denis Benato wrote:
> >
> > I was recently reading through the asusctl issue tracker and I found
> > out that some users have been having troubles with the keyboard RGB control
> > that was working before since the creation of asus-armoury and subequent
> > deprecation of old sysfs attributes.
> >
> > This patch series aims to re-introduce those attributes in asus-armoury
> > so that userspace tools can still control keyboard RGB lighting
> > without having to rely on deprecated asus-wmi attributes.
> >
> > In addition to that, since disabling OOBE is essential for controlling
> > LEDs on some models and it was incorrectly tied to deprecated attributes,
> > this patch series also fixes sending OOBE at probe time.
> >
> > Link: https://gitlab.com/asus-linux/asusctl/-/issues/619
> >
> > Regards,
> > Denis
> Hi Ilpo,
> 
> I see no comments on this revision, did I sent it at wrong time?
> Should I resend some other time?
> 
> Sorry for the question but I don't know if something went wrong,
> and if so what exactly.

Hi,

Nothing is wrong, I've just had to spend time on finally processing 
some larger next series which were even older than yours. And we're only 1 
week past a holiday period which tend to add to delay.

Patchwork keeps track of pdx86 patches:

https://patchwork.kernel.org/project/platform-driver-x86/list/

If your patch is listed there, there's no need to ping as I'll get it it 
eventually (and it won't get forgotten).

There's no "wrong time" to send a patch to pdx86, only that when the 
merge window is open, I might do processing of any patches during that 
time. But unlike some other subsystems, we don't disallow sending patches 
during merge window or any other time.

-- 
 i.

> > Changelog:
> > - v1
> >   - Initial submission
> > - v2
> >   - asus-armoury: drivers should be silent on success
> >   - asus-armoury: make better use of __free annotation
> > - v3
> >   - asus-wmi: use GENMASK for flags
> >   - asus-armoury: fix error handling in keyboard attribute creation
> >   - asus-armoury: fix logic bug in error path
> >   - asus-armoury: use proper defines for keyboard state flags
> > - v4
> >   - asus-armoury: reorder variable declarations
> >   - asus-armoury: add bitfields.h include for BIT and FIELD_PREP
> >   - asus-armoury: reorganize armoury_kbd_state() for clarity
> >
> > Denis Benato (3):
> >   platform/x86: asus-wmi: explicitly mark more code with
> >     CONFIG_ASUS_WMI_DEPRECATED_ATTRS
> >   platform/x86: asus-wmi: fix sending OOBE at probe
> >   platform/x86: asus-armoury: add keyboard control firmware attributes
> >
> >  drivers/platform/x86/asus-armoury.c        | 253 +++++++++++++++++++++
> >  drivers/platform/x86/asus-wmi.c            |  13 +-
> >  include/linux/platform_data/x86/asus-wmi.h |  18 ++
> >  3 files changed, 283 insertions(+), 1 deletion(-)


