Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4623C8719;
	Fri,  3 Jul 2026 10:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783074748; cv=none; b=iG2IFHU113vxzqGqnC+qS8jI0U30Ha0FUMIgoCgJ8MJZZP9OP2dOw+sZ4S2lzOlxbbP/1UcyD9YR2EKK5U4XiFpu/vj80Ly073QUCN1T+XNIXE8WOg/wvQLbtRoCN8ObWzq3PuHrP5U6+f8KinpVftAyl6U5SsEXwbNBWzfOKb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783074748; c=relaxed/simple;
	bh=drmVTQEJWatINhhAITAk9x8a/4qEPQY52w2zGlgrUbg=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=AyTIb44zbzdp/Ss7DLZuRe++eprpKMk0OwYX7R8rRJIeJ5WYngAz6Bn3ZiTxEDVWojcf9+KVGwr6Hdj2sFXTOyAnNUdoutxCC+K2F8nhuPki9NNpi7r1E0Oy7UP6zQc2oSRYPYptwmS4FxH8DV69sKB/bzEYTM5oXFwfM/AlYBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FC+W8IdQ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FC+W8IdQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783074747; x=1814610747;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=drmVTQEJWatINhhAITAk9x8a/4qEPQY52w2zGlgrUbg=;
  b=FC+W8IdQGlAY4vpkxb2CZkLZegNtsaUBNltYqjddsT7y/NN9GSzOoIw/
   HvAFqgf/J1WFTwvzRrRJbd9oRpNauRhs5qGyOBG6AjgTyMupy1Q2qQuML
   6RM7IobRyJbxZUKT9eZjmhiXnzW0QUwRjiHUSzeYTD9q2DQK1KmBcVVGb
   FnP7DAannBjr1Q/P3aMskqtbDscfCtzT5DRKfMeDZuCviJIQPfQIskN+H
   CSLWOQYmiAWbU9JP26BeVCGw4+Jjg8wPSVbojwWp83QBrS2WYGQpx1VzC
   vGknS3LX75fPuOHui0CpCHkJyM8jx19NT4fCExaKEOunIGIfEaOEKO+By
   g==;
X-CSE-ConnectionGUID: WrHdHkyUQwu3kR7HRtJoUA==
X-CSE-MsgGUID: AW7ZweMGSoq2UBRmgVMUTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="94429561"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="94429561"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 03:32:26 -0700
X-CSE-ConnectionGUID: fgoCtsJxQAeZnaTd0TkcBg==
X-CSE-MsgGUID: LtxppxWzThOOfnUh5936TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="249112888"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.152])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 03:32:24 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 3 Jul 2026 13:32:20 +0300 (EEST)
To: Markus Elfring <Markus.Elfring@web.de>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
    Jorge Lopez <jorge.lopez2@hp.com>, LKML <linux-kernel@vger.kernel.org>, 
    kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] platform/x86: hp-bioscfg: Use more common code in
 hp_init_bios_package_attribute()
In-Reply-To: <b81acc89-c91f-46d9-b6de-5367b6cf94f4@web.de>
Message-ID: <2bbdf3e8-e763-69cb-b481-31505b7d8e64@linux.intel.com>
References: <0b2257be-a509-4c86-94ec-3f23847c9626@web.de> <1b9c1471-bfc1-4b0c-c303-ed08c5fba4b3@linux.intel.com> <b81acc89-c91f-46d9-b6de-5367b6cf94f4@web.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 1 Jul 2026, Markus Elfring wrote:

> >> Use an existing label once more so that a bit of common code can be better
> >> reused at the end of this function implementation.
> >>
> >> This issue was detected by using the Coccinelle software.
> > 
> > This patch leaves me quite unimpressed of Coccinelle's abilities.
> 
> The intention of this development tool is not to impress you with a possible
> source code transformation.

That's exactly in the heart of the problem.

I'm not interested in seeing patches that focus on "source code 
transformation" but patches that actually improve things. I don't want to 
be the person who has to differentiate those out of all "source code 
transformations" coccinelle can be automated to do. The person doing that 
differentiation should be the submitter (in this case, you), which clearly 
didn't happen here.

You stated: "this issue" so what exactly is the issue coccinelle found 
for you? Is it "issue" at all? I don't think it is. Instead, there seems 
to be another issue with this code but that was not found by neither 
coccinelle nor you. The former doesn't surprise me because understanding 
code is not within coccinelle's capabilities.

I suppose you'll once again deflect and suggest lets write another 
non-intelligent transformation for coccinelle (which will have its own 
false positives like this particular source code transformation did have). 
But that would entirely miss my point, which is:

You should really look through and understand all the code related to the 
change suggested by coccinelle before considering the change for 
submission.

That being said, you can write just as many coccinelle transformations you 
want and more, but please only send those results from them which actually 
improve things to the kernel development lists. In the other cases, figure 
out what is the correct way to address the root issue which is not 
necessarily the one that matches that suggested by coccinelle. If you want 
to write more transformations for them, again up to you, but then you'll 
have another set of false positives to weed out.

> >> +++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
> >> @@ -692,8 +692,7 @@ static int hp_init_bios_package_attribute(enum hp_wmi_data_type attr_type,
> >>  	if (ret) {
> >>  		pr_debug("Failed to populate integer package data. Error [0%0x]\n",
> >>  			 ret);
> >> -		kfree(str_value);
> >> -		return ret;
> >> +		goto pack_attr_exit;
> 
> Another source code search approach pointed implementation details out
> for further development considerations.
> 
> 
> > If a call fails, it's expected to handle cleanup itself --- which is 
> > exactly what hp_convert_hexstr_to_str() appears to be doing (by not 
> > writing into *str until it's committed to returning 0). So why is 
> > this kfree() necessary in the first place?!?
>
> Would any contributors like to adjust background information accordingly?

For the other two points, your intent has totally eluded me so I cannot 
comment on those point. Please rephrase.

-- 
 i.

