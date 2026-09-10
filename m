Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4719330C164
	for <platform-driver-x86@vger.kernel.org>; Thu, 10 Sep 2026 01:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789002354; cv=none; b=lCLdHVM/Gd8/iNjCZ+pSelMzvcpxTTgSJ05n0tVw3A67svw9LwVudiz782kVpcvB7Fpwmkc8qlTrE3IfonVCbZT5r6ChDLJTVLlVZoNNGVOYYlxroUa7J31uZr/Y55mUT5UW5Q9zhoeeRryuFsGgtPNQGTzjZtfYLpPFpAd6Ipk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789002354; c=relaxed/simple;
	bh=qzKxEF0X3oIKKuJSKzqyoJ1xeuCnYPq21k8hB5tC1UI=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TAueZjkY+fzZxzuBs1JpnO8oSchDfucbEC4E3Y2oDpxXqvExC7S49tBHd/65Onie+yxW1+LcqbuQ1upok4ntDNap1rXRGpF7b0df1uDBBy5+c28WPva3GzIRtIgQqF95xvfxn9yMHl/MLh5jIWfNyZFlHX0azPkT9f1czLWaod4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R991sE+C; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R991sE+C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789002352; x=1820538352;
  h=message-id:subject:from:to:date:in-reply-to:references:
   content-transfer-encoding:mime-version;
  bh=qzKxEF0X3oIKKuJSKzqyoJ1xeuCnYPq21k8hB5tC1UI=;
  b=R991sE+CG/JuBgCTAI+mmv6eRTutYv5wmz2/aAgo7jkTU3fSfPbwkjL4
   L6fTuHVv7YL2Svx9Tq8S1WYbtJfMwD5PaO6/zauHctbXF+lswVwarFk2z
   kU5aRj5Oh8CfIfN9Mj2RbjPsVNAoTmSCry6lKsBXhGbF0jRXl7x9tiR1k
   top3a49Yr13P9sgpK0CQslnXUPCGzPktHdMe6awOChVx2An3V+kl5oEn3
   9zARt0DavWqy3SPvYaQq/uTYsNlBrRrCVhqgMxuyFg35UhzqtNN5xfjz/
   6+K8w6Ju3pl9alWQsBZYTJmDowBihirWUYuBbpZJz4SBVVTTb6jgPHNGG
   g==;
X-CSE-ConnectionGUID: nVRd3WB2TeKYIc/DvhxAbw==
X-CSE-MsgGUID: O4NPPB+6QEigQONX/NPtfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89483114"
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="89483114"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 18:05:52 -0700
X-CSE-ConnectionGUID: 4uU6X78ZQeiSUY+MkguM+Q==
X-CSE-MsgGUID: 9j3H+m+9Q36JONOQ7A31xA==
X-ExtLoop1: 1
Received: from ssimmeri-mobl2.amr.corp.intel.com (HELO [10.125.111.187]) ([10.125.111.187])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 18:05:51 -0700
Message-ID: <36cba2abe75823509f64cf7834ffd78a7d335ced.camel@linux.intel.com>
Subject: Re: [PATCH] tools/power/x86/intel-speed-select: correct macro name
 in debug output
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>, 
	platform-driver-x86@vger.kernel.org
Date: Wed, 09 Sep 2026 18:05:50 -0700
In-Reply-To: <20260610195603.20574-1-enelsonmoore@gmail.com>
References: <20260610195603.20574-1-enelsonmoore@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2026-06-10 at 12:56 -0700, Ethan Nelson-Moore wrote:
> A call to debug_printf() in isst-core-mbox.c incorrectly refers to
> CONFIG_TDP_GET_TURBO_LIMIT instead of
> CONFIG_TDP_GET_TURBO_LIMIT_RATIOS. Correct it.
>=20
> Discovered while searching for CONFIG_* symbols referenced in code
> but
> not defined.
>=20
> Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>

Applied to
https://git.kernel.org/pub/scm/linux/kernel/git/spandruvada/linux.git/log/?=
h=3Dfor-sst-v7.4.rc1


Thanks,
Srinivas

> ---
> =C2=A0tools/power/x86/intel-speed-select/isst-core-mbox.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tools/power/x86/intel-speed-select/isst-core-mbox.c
> b/tools/power/x86/intel-speed-select/isst-core-mbox.c
> index c81ecd602bcf..baadeb75376c 100644
> --- a/tools/power/x86/intel-speed-select/isst-core-mbox.c
> +++ b/tools/power/x86/intel-speed-select/isst-core-mbox.c
> @@ -561,7 +561,7 @@ static int mbox_get_get_trl(struct isst_id *id,
> int level, int avx_level, int *t
> =C2=A0	if (ret)
> =C2=A0		return ret;
> =C2=A0
> -	debug_printf("cpu:%d CONFIG_TDP_GET_TURBO_LIMIT req:%x
> resp:%x\n", id->cpu,
> +	debug_printf("cpu:%d CONFIG_TDP_GET_TURBO_LIMIT_RATIOS
> req:%x resp:%x\n", id->cpu,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0 req, resp);
> =C2=A0
> =C2=A0	trl[4] =3D resp & GENMASK(7, 0);
