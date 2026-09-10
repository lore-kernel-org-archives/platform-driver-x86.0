Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4BF42ED141;
	Thu, 10 Sep 2026 01:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789002420; cv=none; b=L4fy1lnMgFcZHjZyZLZq2GuFxXm9ShAqzw/BxXjYFjDdeMq2lSGdjphi1xPBukZK0U2LE1Fn1GSlaRxQ2rppvZscuVOunbzGdlIX1qKKMot9Rt7CK8Y20hAsb2a7T+QIJArOyri/WXwWAyZ+NLslXFXv5YMeijD89gHUIC3E6NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789002420; c=relaxed/simple;
	bh=kMxse0800QeqAG3lgUcmcf18gdGpw4wehelaPlHYlWI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HQPAhjI4jA9mKGJWFAPzbeXQlN38mCQkmgzre+IEP4IL2HTAlUEPBQmXTU577E3zS3t4PnVbAy1Er2idMc5SXe6Kpbu1OVcAv2bMIkARKu6Zr/7OgSIAnZckfwhHBp6/npGIOnv6S3yjkJIjICMHRbQwuD0/njOq59dswxwwvVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LM3Q7BTM; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LM3Q7BTM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789002419; x=1820538419;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=kMxse0800QeqAG3lgUcmcf18gdGpw4wehelaPlHYlWI=;
  b=LM3Q7BTMaYy72L5MoTqQ2OyN8KS3IJ0h2vg/AL8JWN7HuGVRuxlbcg1y
   jLN6/T5m6ds/PMGP0vG664MqIiE+lgLISaxB3V7acYZ4MqbNALeh4VUN5
   CDRTFgLOnzZL2sKOcYvEwUsGPAoRZVUNDd1lBpM9x2PHzO54bM+Iag0i7
   smKhNZr4dMFqZ00AC2oSHLMj4IBnpgBH2bSb8NXs7ik61UwApJMiEFP1a
   2ajwhyTvOpdAOxrZLbL7jhidUXiFNY3FVP16cSwF5wrLomHg2K2YDud5u
   6uxn0voyEv/YKi3njN1kaJihhBWxjBQhL3qh8WxMGfQr1/GzLQYuKAg7B
   g==;
X-CSE-ConnectionGUID: m8lpw41FSLOd3rHCT3QGsw==
X-CSE-MsgGUID: UozB0SJUTfWkb3G4xcwXtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89483150"
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="89483150"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 18:06:59 -0700
X-CSE-ConnectionGUID: kFqB1S8+R2K6VBz051u1Pw==
X-CSE-MsgGUID: bbcWQaAMTiy+fdnJ3jrArg==
X-ExtLoop1: 1
Received: from ssimmeri-mobl2.amr.corp.intel.com (HELO [10.125.111.187]) ([10.125.111.187])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 18:06:58 -0700
Message-ID: <27ae972f854d0b561e44234951f9efb7ea30b691.camel@linux.intel.com>
Subject: Re: [PATCH] tools/power/x86/intel-speed-select: clean all the
 produced files
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Date: Wed, 09 Sep 2026 18:06:57 -0700
In-Reply-To: <20260908065023.168234-1-jirislaby@kernel.org>
References: <20260908065023.168234-1-jirislaby@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2026-09-08 at 08:50 +0200, Jiri Slaby (SUSE) wrote:
> 1) The commit 7d440da009b6 ("tools/power/x86/intel-speed-select: HFI
> =C2=A0=C2=A0 support") added the thermal.h link, but did not remove it up=
 on
> =C2=A0=C2=A0 cleanup. Do so.
> 2) .*.cmd files were never deleted, so were left dangling. Clean them
> up
> =C2=A0=C2=A0 too.
> 3) The "*.d" pattern was updated:
> =C2=A0=C2=A0 a) the backslash was superfluous,
> =C2=A0=C2=A0 b) it was made more explicit by specifying ".o" in ".*.o.d".
>=20
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>


Applied to
https://git.kernel.org/pub/scm/linux/kernel/git/spandruvada/linux.git/log/?=
h=3Dfor-sst-v7.4.rc1


Thanks,
Srinivas

> ---
> Cc: platform-driver-x86@vger.kernel.org
> ---
> =C2=A0tools/power/x86/intel-speed-select/Makefile | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/tools/power/x86/intel-speed-select/Makefile
> b/tools/power/x86/intel-speed-select/Makefile
> index 6b299aae2ded..6f896f40c1a8 100644
> --- a/tools/power/x86/intel-speed-select/Makefile
> +++ b/tools/power/x86/intel-speed-select/Makefile
> @@ -52,8 +52,8 @@ $(OUTPUT)intel-speed-select: $(ISST_IN)
> =C2=A0
> =C2=A0clean:
> =C2=A0	rm -f $(ALL_PROGRAMS)
> -	rm -rf $(OUTPUT)include/linux/isst_if.h
> -	find $(or $(OUTPUT),.) -name '*.o' -delete -o -name '\.*.d'
> -delete
> +	rm -rf $(OUTPUT)include/linux/isst_if.h
> $(OUTPUT)include/linux/thermal.h
> +	find $(or $(OUTPUT),.) -name '*.o' -delete -o -name '.*.o.d'
> -delete -o -name '.*.o.cmd' -delete
> =C2=A0
> =C2=A0install: $(ALL_PROGRAMS)
> =C2=A0	install -d -m 755 $(DESTDIR)$(bindir);		\
