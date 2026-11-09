Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794249838;
	b=FtG5MafQjDcWfmadbpVB23pgdjtQA0GNV0jyJpw+k70N4KnN68cEhnAWOW7Q//quDwml
	 OtQGyZ+tJVaojnZR/GJfRImsrjyEUIX/hyehHu9ZyPb16wf61YcE6HKJpT4i4h6ezqpmq
	 jlF4bnMAFwN3fiOy/zr0fINS0vHlzLOqftQRNCuR3hdkl67aEn5VEd356JFNfDDjIzXT6
	 dWK0ot5o2MnfKC6OepOmBe5UPN7poDUp1bDUzW8MMrG+6rsuyz1ibkJ3eQiwNXtRGGKhy
	 4etezLVTDFrsO+kjoF99ViDPKkxdgUeeZAisySZQSsa68kXaMKaJb1xsO+2K6mT42ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794249838;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=qWZJj9JAws7V0Jyk1izm9EHeVl4jsbuBX61viu5Th8A=;
	b=xxy7yubykTXzIUCaYs3CaZUhvvYibtNnwESc6NCNnhSFOmwvoep2lzAtLQuJAg34kU8M
	 re6qNPynIf6sf8Fw8pcUL/ELoTZWg+z3+s9hs1ncy7kgk+zn0PUp/qPvUclcu/GblyUBZ
	 cEFHvKQHe10eVO8D1+tFvQrzKohiQy6vy0ocMGo3JKxlkSvyL7ptFxU83DIffL8aTB+tb
	 dPao7Rr0xuMXz5+iVlNk45UEkE5Phcc+HtBY/3x5HMratncnkdoVMh1AP3JwrDlDTReRO
	 3JBodgXS2Jqg9pE9dwp8NlzXxzoReakXnFhB/BfjjETukkTZbyJ4eZ6z+3KSbYRQx8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N5Hh1CnV;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61393606A31C;
	Mon,  9 Nov 2026 18:43:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61393606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N5Hh1CnV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794249838; x=1825785838;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Gv6ihC4F3QMOyL0oL4yLabiarEc+5KWiqN90g+j6v8M=;
  b=N5Hh1CnVcmwGDm2KWFhZY8NBksaPUA6Jc5W1IEjnffAfiMxgfcj77EmK
   M+xV1TZoEpL65kNkBb9JDXuTZjAmxsGjlGOV5My9qUq1+nwb/zdKtHtDG
   nTh4UMM4C6oRXr+WLpb9oHk//YtrFGREFs95IqK0v0iQgaF7tdAQLsmGt
   mR1R56DJ8tTBB5nTZJmfhMFw3PBTjwzwluuiMD2UDfz4zOA57OcFxgjZy
   WO3iaTri2HHYN2vkC6a0+IVv57tKG9VQNE5dRqhlJKRj98GNdryAKtj1S
   /Lj0TaGxmF6rXBYd7RpXq8pyS9SQbqmdTZXZhe9EHkJ90RQ84kV1ne9co
   w==;
X-CSE-ConnectionGUID: YKpkgIIQTdutGYu93iVBSg==
X-CSE-MsgGUID: vssZgVSnTXGJmAO/SnCUtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3011460"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="3011460"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 10:43:57 -0800
X-CSE-ConnectionGUID: e+fiNwSBSii1m083MYEA4g==
X-CSE-MsgGUID: CICV6EthSoCEia6QIIUNsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="8276613"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.139])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 10:43:55 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 9 Nov 2026 20:43:52 +0200 (EET)
To: Akhil Boyapati <boyakhil978@gmail.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: hp-wmi: Use only the low byte of the
 thermal profile
In-Reply-To: <20261026030658.119596-1-boyakhil978@gmail.com>
Message-ID: <741290aa-a266-7589-5372-1554d281c632@linux.intel.com>
References: <20261026030658.119596-1-boyakhil978@gmail.com>
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

On Sun, 25 Oct 2026, Akhil Boyapati wrote:

> On the HP Spectre x360 14 (board 8C15) the firmware answers the
> thermal profile query (0x4C, read) with more than the profile: the
> DSDT's GTPS method returns the profile in byte 0, OEM flags in byte 1
> and the device posture in byte 2. In Quiet mode in laptop posture the
> value is 0x00041103.
> 
> thermal_profile_get() returns the whole value, so
> hp_wmi_platform_profile_get() matches no profile and reading
> /sys/firmware/acpi/platform_profile fails with -EINVAL. This also
> breaks power-profiles-daemon and tuned-ppd. Probe writes the
> unmasked value back, which only works because the firmware's write
> method (STPS) uses byte 0.
> 
> Mask the value to its low byte. Boards that return only the profile
> are unaffected.
> 
> Tested on board 8C15 (kernel 7.2.11, module built from this tree's
> driver with the change applied): platform_profile reads back correctly
> after setting each of cool, quiet, balanced and performance, and the
> firmware's ODVP0 follows (3, 4, 2, 1). Not tested on other boards.
> 
> Fixes: 4296f679ca50 ("platform/x86: hp-wmi: add platform profile support")
> Assisted-by: LLM
> Signed-off-by: Akhil Boyapati <boyakhil978@gmail.com>
> ---
>  drivers/platform/x86/hp/hp-wmi.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index 52077833a..6180f1d21 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -2117,7 +2117,13 @@ static int platform_profile_omen_set(struct device *dev,
>  
>  static int thermal_profile_get(void)
>  {
> -	return hp_wmi_read_int(HPWMI_THERMAL_PROFILE_QUERY);
> +	int tp = hp_wmi_read_int(HPWMI_THERMAL_PROFILE_QUERY);
> +
> +	/*
> +	 * Only the low byte is the thermal profile. Some firmware (e.g. board
> +	 * 8C15) packs OEM flags and the device posture into the upper bytes.
> +	 */
> +	return tp < 0 ? tp : tp & 0xff;

Add a named define and use FIELD_GET(). Then the comment doesn't seem even 
required.

Please keep call and it's error handling next to each other (convert 
this to the usual error handling pattern with if). Because of that you 
cannot make the call in variable declaration block but that's fine.

-- 
 i.

