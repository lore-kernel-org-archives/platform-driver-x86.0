Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF1A34040D;
	Tue, 29 Sep 2026 09:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790673283; cv=none; b=G9b3z0idKt4R47G2FFE+fiPdJtGYXuLlaEsVGoWM1eFgapJexzKVBbrb3Kocvso2R/zYY1KIVeeusiCdCLTdawZ7IsuR3knQTa71SBE3hdmF1Fw9/UweAPHNnBfRYgpHJjo+q6R8r6mBnuD+YOwFeIfcq0p8dmJqd46IVP3zgR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790673283; c=relaxed/simple;
	bh=fgOENj9nO/C2FXtpT/dXggQEwjVxY+miBZ6vFnueYH4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=HqEMGMI91zUE4+O5jJhe+y/G5hoc4Dsh9B0ak8e9OAnp+XUly2G1xz2IpBSWGSisVLvEB7AIYZOIlnp8ePL+6KgkQ6neGkNl1YgibSLvLYMs/AMTanL7S+fYbF0vDuEW9tpbtj8Vg+BlqrLKim0lhg5Ip25nlPZqKQi0hNwQd50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A7Qsc1DH; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A7Qsc1DH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790673277; x=1822209277;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=fgOENj9nO/C2FXtpT/dXggQEwjVxY+miBZ6vFnueYH4=;
  b=A7Qsc1DHz0XFF5v94zcB6RpTTVG6idws4N4pST2PieGohWJY+IsH94AB
   z0LPrA+LDOB5ToCOIdktm3HpjKiVN4jjkr0TLMyUoTA64gevuKt+Nx0yl
   lMyzUJ34tpm858xe2sjvZMwwSkTYnnPy1EMBB7w3ZDRe3Jn7EYksSNUdA
   vEMDO3SmhaGLJirkP+yn5ibW9KHMuJCxltQwbRSEqCQbI9Nb4XiIniyZq
   Ruvyb0Xw32S363J8KIdKHlDi8z1L1/vOOVyobbDUEw2eHOAYBYks+bM2I
   dWFLZgJ2aOn2vscLo1KgND2V6gmnlmvdz3lIb3XmXJoZpFPKPG8nFE4HM
   A==;
X-CSE-ConnectionGUID: 2iZCPJv/Q6+Xwkm12OPDFA==
X-CSE-MsgGUID: 76om3XQ2TjOy7gZVPE+lJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="90516461"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="90516461"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 02:14:32 -0700
X-CSE-ConnectionGUID: 24bGlgs5Rsi5PNuK8hF1cg==
X-CSE-MsgGUID: 4uW5VFGMQUu6PxZAu/RdKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="303270957"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.234])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 02:14:29 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 29 Sep 2026 12:14:25 +0300 (EEST)
To: Matias Civadda <matias.civadda2342001@gmail.com>, 
    Chris Taraszka <chris@miget.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, Armin Wolf <W_Armin@gmx.de>, 
    Mingyou Chen <qby140326@gmail.com>
Subject: Re: [PATCH] platform/x86: bitland-mifs-wmi: Add Xiaomi Book Pro 14
 platform profile values
In-Reply-To: <595cf557-e386-4ca3-b8ea-2ce7fe160018@gmail.com>
Message-ID: <622041b8-6ace-4fdf-43b5-5427ba0d88d6@linux.intel.com>
References: <20260928153902.139956-1-chris@miget.com> <5430348c-8ff3-c31a-927f-321b2cf94883@linux.intel.com> <CAAcRvKNrRMb44p-v0-wiWQx8QiToYyKCoCzXvVku-o0RGTxEgQ@mail.gmail.com> <595cf557-e386-4ca3-b8ea-2ce7fe160018@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

FYI,

There are a few more of these in the queue:

https://patchwork.kernel.org/project/platform-driver-x86/patch/20260826132924.179614-1-kento@kekto.ru/
https://patchwork.kernel.org/project/platform-driver-x86/patch/fb4e0678-3028-463e-8a8c-1b680e40c4ee@gmail.com/

The first one is a bit messy, as it adds some keys as well (which should 
have been in a separate patch).

And some more in Mingyou's redmi-wmi merge series's last patch:

https://patchwork.kernel.org/project/platform-driver-x86/patch/20260816100813.300450-7-qby140326@gmail.com/

The profile mode abstraction in that series seems not general enough 
though so the generalization work we've discussed is still necessary and 
should be used as a base for that series.

--
 i.

On Mon, 28 Sep 2026, Matias Civadda wrote:

> Hi Chris,
> 
> No problem, your proposal works for me. Please CC me when you send
> the series so I can test the shared changes and base my TM2107 v3
> on your generic patch.
> 
> Thanks,
> Matias
> 
> > Thanks, makes sense.
> > 
> > Matias, one thing I ran into when trying your generic part on the
> > Xiaomi Book Pro 14: its values are sparse (0x02, 0x03, 0x04, 0x09,
> > 0x0a) and 0x02 and 0x0a both mean low-power. With a profile array
> > indexed by the firmware value, the unused slots read back as
> > PLATFORM_PROFILE_LOW_POWER (0), and the reverse lookup for low-power
> > finds index 0, which this firmware ignores.
> > 
> > So I'd suggest {value, profile} pairs for the shared part. I have that
> > as a standalone patch on pdx86/for-next, with only the profile table
> > in the quirk struct, so your response layout and AC check handling
> > would go on top in your TM2107 patch. If that works for you I'll send
> > it as v2 together with the Xiaomi entry, and you can base your v3 on
> > it. If you'd rather own the generic patch, that's fine too, I'll
> > rebase the Xiaomi part on yours.
> > 
> 

-- 
 i.

