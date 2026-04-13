Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68AA361666;
	Mon, 13 Apr 2026 13:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776085447; cv=none; b=MHADBci4hidt90OmTPoikU77C28cDCcii9NI+MuETM6cQLQMmY+tSFnYZqJQw0Q6OrBqq1Uv/lgf9Wj5o2UUVDTXLpeNqHjIuheUOSnku2MLfcEe77ptgeS/aUIU7EMwKs4tZMdSdUvGy25Jwc13PPLuZHsUnCpvFutFK17DgY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776085447; c=relaxed/simple;
	bh=iarzdx08g4dCfdqD8v5VAey9NzBymH9Ki3ahyMiEtn0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=DtcEjOsZIImcpMH2h06iP8iFFNOeJdQgGswA6sQv6vy/pDjJH69Fk5Pa7wyqut/fVw5urGBB4c+E8UXmOHOT5aepXxc1bFp0J/Qv9INzzZpCv9Hd1zUuMzHY3Zd3OY0rv49dPoIwRf/6Vm+EqtIwJZaVa/KFh0KXfER9gs279rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MxOIDo72; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MxOIDo72"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776085446; x=1807621446;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=iarzdx08g4dCfdqD8v5VAey9NzBymH9Ki3ahyMiEtn0=;
  b=MxOIDo727mEKtl2Xs3nLSkO6HOAWVjHcSB9XCgDRqzhf0uc4L958nCsk
   U/kw43sV6uzYQWBBn6zfE8sA8+TpBeXf2BGYlfe0s90F1kLBRpzsnxcM4
   Brt6mw6az4Hlm0ZIR6BqkmnpreLJIcDgbWH6xwWpuTzL05mI7ZSA5/YE2
   Q1l3xu/OqdBXtULTrcg/5eg43OkiYnVjnGC5IJMhtsQSyxXb3vam9qKa0
   TUlzTKlwcLZ84OAHI2XXs+vKONuznJXzbE/QCFntcIKRw4WV0WKEZEut4
   IvzKIjj583EZ1jZNeweEIt5FPcGE3EqNeIaSqX/Fhj07GCVG2sZXIQ3XI
   Q==;
X-CSE-ConnectionGUID: 7OmM1W9eRjmEV1ajPw5l4A==
X-CSE-MsgGUID: 4bbvzZJ/SaqPUJOiirlC9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="76185116"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; 
   d="scan'208";a="76185116"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 06:04:05 -0700
X-CSE-ConnectionGUID: Hn30SYFEQEiTqZd19jneOQ==
X-CSE-MsgGUID: rVLV3t3ISTeKsfuqwDjZag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; 
   d="scan'208";a="226614801"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.63])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 06:04:03 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 13 Apr 2026 16:03:59 +0300 (EEST)
To: Josh Snyder <josh@code406.com>
cc: Jorge Lopez <jorge.lopez2@hp.com>, Hans de Goede <hansg@kernel.org>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: hp-bioscfg: fix heap buffer overflow in
 security buffer
In-Reply-To: <dtfokh4rcywrav7eqddh5ruij2uyqxcw2raxhx6iu6cxjult55@2j6dqjzjvxfr>
Message-ID: <f4fb3a88-1855-81d2-6924-b7ad568126c9@linux.intel.com>
References: <20260402-hp-bioscfg-overflow-v1-1-6985f8c9e67c@code406.com> <928a6f5c-6f94-5661-d95c-03e310abf7bb@linux.intel.com> <dtfokh4rcywrav7eqddh5ruij2uyqxcw2raxhx6iu6cxjult55@2j6dqjzjvxfr>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 11 Apr 2026, Josh Snyder wrote:

> My apologies! It's been a while since my last kernel contribution, and I'm quite
> unfamiliar with this driver.

Hi,

We're in the same boat when it comes to understanding this driver. This 
driver unfortunately got in half-baked (with outstanding comments from me) 
and we now have to clean up the mess.

> All I can say for certain is that this patch fixed
> the error I was getting when writing to my homelab PC's BIOS variables, and the
> bug looks like a heap overrun to my untrained eyes.

Can you try to rephrase text related to getting the 0x04 error in the 
changelog text such that it's clear you actually hit the problem while 
trying to do X.

> I'll walk through the code as I understand it. The relevant code in
> hp-bioscfg/biosattr-interface.c looks like:
> 
> int hp_set_attribute(const char *a_name, const char *a_value)
> {
> ...
>         a_name_size = hp_calculate_string_buffer(a_name);
>         a_value_size = hp_calculate_string_buffer(a_value);
>         security_area_size = hp_calculate_security_buffer(auth_token_choice);
>         buffer_size = a_name_size + a_value_size + security_area_size;
> 
>         buffer = kmalloc(buffer_size + 1, GFP_KERNEL);
>         ...
>         ret = hp_populate_security_buffer(start, auth_token_choice);
>         if (ret < 0)
>                 goto out_set_attribute;
> 
>         ret = hp_wmi_set_bios_setting(buffer, buffer_size);
> 
> As you can see, it calls hp_calculate_security_buffer() and then uses the result
> to decide how large `buffer` should be. hp_calculate_security_buffer() serves to
> predict how many bytes hp_populate_security_buffer() will later write. If
> hp_calculate_security_buffer() under-estimates, then
> hp_populate_security_buffer() will over-run the kmalloc'd buffer.
> hp_populate_security_buffer() has this logic:
> 
>         if (strstarts(authentication, BEAM_PREFIX)) {
>                ...
>         } else {
>                 /*
>                  * UTF-16 prefix is append to the * authbuf when a BIOS
>                  * admin password is configured in BIOS
>                  */
> 
>                 /* append UTF_PREFIX to part and then convert it to unicode */
>                 strprefix = kasprintf(GFP_KERNEL, "%s%s", UTF_PREFIX,
>                                       authentication);
>                 if (!strprefix)
>                         return -ENOMEM;
> 
>                 auth = hp_ascii_to_utf16_unicode(auth, strprefix);

Oh, I see it now.

I read earlier reading hp_ascii_to_utf16_unicode() and utf8s_to_utf16s(). 
When reading utf8s_to_utf16s(), I concluded it is prepared to prevent 
buffer overrun (I was expecting that).

However, what I missed is that hp_ascii_to_utf16_unicode() happily gives 
input size as maxout to utf8s_to_utf16s() which is IMO also a major 
problem here. I think that was the missing piece here (this should  
definitely be mentioned in the changelog).

So there are two related problems:
- Miscalculation of the buffer length.
- Passing the input size to maxout which prevents utf8s_to_utf16s() from 
  catching the buffer overrun.

I suggest adding another patch to fix the second problem so we avoid the 
overrun if there would be another problem in the size calculation.

>                 kfree(strprefix);
> 
>                 if (!auth) {
>                         ret = -EINVAL;
>                         goto out_buffer;
>                 }
>         }
> 
> The existing logic in hp_calculate_security_buffer() doesn't match: it has these
> two early-return guards:
> 
>         if (!authentication)
>                 return sizeof(u16) * 2; 
> 
>         authlen = strlen(authentication);
>         if (!authlen)
>                 return sizeof(u16) * 2;
> 
> The second early-return, in particular, means that an empty `authentication`
> string will produce a buffer that is 16 bytes too small for the payload that is
> ultimately written by hp_populate_security_buffer() and sent to the firmware by
> hp_wmi_set_bios_setting().
> 
> The net effect is that my homelab's firmware saw an invalid payload and refused
> the write with error 0x04. My guess is that this bug will hit anyone who doesn't
> have a BIOS admin password set, and the logic had only been tested with HP
> BIOSes where the admin password is set.
> 
> > >  The NULL check is preserved since hp_populate_security_buffer() would
> > >  dereference NULL via strstarts().
> 
> > What NULL check this refers to??? For which of the inputs?
> 
> Yeah, that sentence could have been worded better, I admit. The existing code in
> hp_calculate_security_buffer() has two early-return guards, and that sentence is
> attempting to answer the question: "why not remove both of them?". The answer is
> "because we don't want to pass a null pointer to strstarts()" immediately
> beneath:
> 
>         if (!strstarts(authentication, BEAM_PREFIX))
>                 size += strlen(UTF_PREFIX) * sizeof(u16);

No, you wrote something entirely different. What you actually wrote is 
that the dereference occurs in hp_populate_security_buffer()?!?
(= big confusion, see below)

> But now that I give the code another look, my mildly-informed opinion is that it
> should be hp_set_attribute()'s job to ensure a non-NULL `authentication` value as
> a precondition of calling hp_calculate_security_buffer().

...The thing is hp_populate_security_buffer() is called with the same 
auth_token_choice argument and it will pass the same input to strstarts() 
without any checking so it seems buggy anyway if auth_token_choice is 
NULL, unless I again miss something else.

Also, auth_token_choice cannot ever be NULL. It comes from two sources: 
.auth_token is checked and .current_password cannot ever be NULL. So 
AFAICT hp_populate_security_buffer() is never given NULL, to state it 
does deref one, too, is confusing.

> If any of this "clicks" for you, I'd be happy to reword the commit message to
> incorporate whatever portion makes makes the most sense. I'd also be happy to
> just contribute a bug report, and have someone with real understanding of this
> driver do the actual patching.

When you stated: "In practice, the firmware's own bounds checking rejects 
the undersized buffer" I assumed the buffer overrun did not occur because 
as per the literal interpretation buffer given to firmware was 
"undersized" and wording perhaps just came from AI using terminology in 
confusing manner when it meant utf8s_to_utf16s() had caught the problem 
(which was my assumption at the time, ie., that the buffer overrun is 
prevented by utf8s_to_utf16s()).


My goal here is to have the commit message written such that everyone, 
even those not at all familiar with this driver, could follow what blows 
up and where. I've some level of familiarity, but not much, and if I 
cannot follow the description, likely those entirely unfamilar can even 
less.

I'm asking question to understand the problem. Each question usually 
implies there's something missing from / wrong in the changelog. It's 
not meant to deter you from pursuing the change.


-- 
 i.

