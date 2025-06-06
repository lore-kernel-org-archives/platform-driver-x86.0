Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AB41F8747
	for <platform-driver-x86@vger.kernel.org>; Fri,  6 Jun 2025 21:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749247050; cv=none; b=RzfNeZDfp7AdYnNOcfCTpM9SsztkpwEF++tFFPNJOfsTnutrK6dCwAjUrHhBgST9B4KVhLqEVmm2b6YpQOW5HSVYJONeheShdw5UvY8I3gIpV45zNYjDjzMCemnHDgrVt7DoQ/Xl5HrP5v3t8aAt1PfYFj9vONqBK2X1EsYECgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749247050; c=relaxed/simple;
	bh=VmWmQGkpGJwF49gWvSr+Aop9Tn7t9eEVnsHUOHKygHs=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=M89+4YcKM05k0Rr5AbacF8hDVEarWXCaLM0gkhWxplEJr0+xq7qdTXSwyB93C2pXNIqLpFzqFG59eI6onk81g+aQRGBYrLZWAEdUhYWCctfqw133TS+Fx2hDVna8Qsmg82IgcETYCPMNUJzqv7hzOaF239T02kxGldqbiuESHeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cKNBDxW8; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cKNBDxW8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749247049; x=1780783049;
  h=message-id:subject:from:reply-to:to:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=VmWmQGkpGJwF49gWvSr+Aop9Tn7t9eEVnsHUOHKygHs=;
  b=cKNBDxW89HXy8pZMDvDbNBJjeSi9Yg4omox61ZjxylUv2xCxeWcBByay
   ZGhGLXXDYmzl190QInQr+2vcngJyUZTyLx9hnKYe4KHqBlGekiLIg08fc
   MNTApLHeCUNKllaOF4KBm2mFqMwvZh0VjAVCfyh+aYHKbi8yERdH7fLJM
   mpjMoDHgGELvVuSUF40ox1eePtHZtnhTRhKUnqRcDvmqmDTs27VSuzRyr
   2ox09Xljr45CSOsr2QVkIEu/pyARhtCnyg+5xMsAyrK8GjTL+s/nEnMOz
   hns2T2v7ILVZszyoGVvuCA5UYuNhDS3t+ZZlWv6vUx+R2cE2/QmLIGeu0
   A==;
X-CSE-ConnectionGUID: 7sS/b+KsQNu9yjQ1N+HxnQ==
X-CSE-MsgGUID: mWiWD3z6SOWiz9wYw4nirQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="62065602"
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; 
   d="scan'208";a="62065602"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 14:57:28 -0700
X-CSE-ConnectionGUID: 0Q1MPo7/TI+8YYKIwL0+nQ==
X-CSE-MsgGUID: sin1q7woTSiYjPHR+CsUYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; 
   d="scan'208";a="176818580"
Received: from aschofie-mobl2.amr.corp.intel.com ([10.124.222.251])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 14:57:27 -0700
Message-ID: <3b2efd54a826d4e561803220d556619d22784cab.camel@linux.intel.com>
Subject: Re: [PATCH v3 07/11] platform/x86/intel/pmt: correct types
From: "David E. Box" <david.e.box@linux.intel.com>
Reply-To: david.e.box@linux.intel.com
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>, 
 platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 lucas.demarchi@intel.com,  rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, airlied@gmail.com,  simona@ffwll.ch
Date: Fri, 06 Jun 2025 14:57:27 -0700
In-Reply-To: <20250605184444.515556-8-michael.j.ruhl@intel.com>
References: <20250605184444.515556-1-michael.j.ruhl@intel.com>
	 <20250605184444.515556-8-michael.j.ruhl@intel.com>
Organization: David E. Box
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2025-06-05 at 14:44 -0400, Michael J. Ruhl wrote:
> A couple of auto variables do not match the return types of some of
> the functions.
>=20
> Update the mismatched types to match.
>=20
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
> =C2=A0drivers/platform/x86/intel/pmt/crashlog.c | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c
> b/drivers/platform/x86/intel/pmt/crashlog.c
> index aa3f57fbe018..a51923d0be72 100644
> --- a/drivers/platform/x86/intel/pmt/crashlog.c
> +++ b/drivers/platform/x86/intel/pmt/crashlog.c
> @@ -136,7 +136,7 @@ static ssize_t
> =C2=A0enable_show(struct device *dev, struct device_attribute *attr, char=
 *buf)
> =C2=A0{
> =C2=A0	struct intel_pmt_entry *entry =3D dev_get_drvdata(dev);
> -	int enabled =3D !pmt_crashlog_disabled(entry);
> +	bool enabled =3D !pmt_crashlog_disabled(entry);
> =C2=A0
> =C2=A0	return sprintf(buf, "%d\n", enabled);
> =C2=A0}
> @@ -167,7 +167,7 @@ static ssize_t
> =C2=A0trigger_show(struct device *dev, struct device_attribute *attr, cha=
r *buf)
> =C2=A0{
> =C2=A0	struct intel_pmt_entry *entry;
> -	int trigger;
> +	bool trigger;
> =C2=A0
> =C2=A0	entry =3D dev_get_drvdata(dev);
> =C2=A0	trigger =3D pmt_crashlog_complete(entry);

Reviewed-by: David E. Box <david.e.box@linux.intel.com>
