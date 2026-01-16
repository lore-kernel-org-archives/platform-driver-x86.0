Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24E114A4F9;
	Fri, 16 Jan 2026 23:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768606996; cv=none; b=XffdCm+qBwcPt16xG4xpOND9KhqySbhlkOcAfBsYZxMG5meWcQC6ff/O9dIhySY8vyZSyhHQ4bC3Mm82foXQ35mNBUHpjKSlZQdKOU90Xmo4Kj6nGxxST1/gcGdonkamD/OTpOJvjU4/pfFX9GAw+lpJqY5QI6zpsHqQjV0IFWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768606996; c=relaxed/simple;
	bh=qK86MVRgbDFnGYxTDZvdbuDmcPN2Xkw+EdWyWtNo4iM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ry8elS6seESfjGwH4piIXS3V338EGUu22bf9B79RojHhiOZH0spXpkc1Srile/YgAPo60uAZNew7RHuBmBIR4bVUF4j2Gi5qniDS2FWVWGlpWfZunnY+hx2/nvxYUW9tTc00sJsoJQnYxXDC1UGbYY4CsUuF6G+Bb/wheo1uKcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T+lKhgXa; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T+lKhgXa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768606995; x=1800142995;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=qK86MVRgbDFnGYxTDZvdbuDmcPN2Xkw+EdWyWtNo4iM=;
  b=T+lKhgXad5mrf9DokwE3y+IbBAHDsCLli0usFqiRevpmBouGO8fiWnUR
   qc8cnfgZJM1J5mcno9rZtN28c9DuDXHD/tj1vGqG6G3nrsU8gAJ9lrZXi
   aCLu1Bx35u0/NjvKNuxs4RJVBQcFzfVMoJ6rPjPbuQe41tGqv2StR927I
   FC6LIKgrKniMv2vKkKFfkaEFpjZwygAePOUwWDKWraWBAuKkUTSrQMYqt
   NmIi1udpL19us0+E38y7+/uzGkESI+8Mu1NIhxHUOQR6LYeisSxtOHmuk
   VMnM9vyvo8cxneewhlmePyfRPoomVtl8f1iyHePMZRkiBJj9v9QghUYk9
   g==;
X-CSE-ConnectionGUID: hIdNiFxUTAGtn8h3eLt1Og==
X-CSE-MsgGUID: EXWEVw+6QGK1GKmMr+8XIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69826162"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; 
   d="scan'208";a="69826162"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 15:43:14 -0800
X-CSE-ConnectionGUID: naJXohIIQ+yCH/aeXyCZEw==
X-CSE-MsgGUID: ek/nRSHeSqep5F/iqjDI+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; 
   d="scan'208";a="242916539"
Received: from spandruv-mobl5.amr.corp.intel.com (HELO [10.125.111.178]) ([10.125.111.178])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 15:43:14 -0800
Message-ID: <adc80024f2754bc409bc0994e436dc0ffe18c9f5.camel@linux.intel.com>
Subject: Re: [PATCH] tools/power/x86/intel-speed-select: Fix file descriptor
 leak in isolate_cpus()
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: Malaya Kumar Rout <mrout@redhat.com>
Cc: malayarout91@gmail.com, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 16 Jan 2026 15:43:13 -0800
In-Reply-To: <20260115100333.171244-1-mrout@redhat.com>
References: <20260115100333.171244-1-mrout@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2026-01-15 at 15:33 +0530, Malaya Kumar Rout wrote:
> The file descriptor opened in isolate_cpus() when (!level) is true
> was
> not being closed before returning, causing a file descriptor leak in
> both the error path and the success path.
>=20
> When write() fails at line 950, the function returns at line 953
> without
> closing the file descriptor. Similarly, on success, the function
> returns
> at line 956 without closing the file descriptor.
>=20
> Add close(fd) calls before both return statements to fix the resource
> leak. This follows the same pattern used elsewhere in the same
> function
> where file descriptors are properly closed before returning (see
> lines
> 1005 and 1027).
>=20
> Fixes: 997074df658e ("tools/power/x86/intel-speed-select: Use cgroup
> v2 isolation")

Thanks for the change. Will include in the next pull request.

-Srinivas

> Signed-off-by: Malaya Kumar Rout <mrout@redhat.com>
> ---
> =C2=A0tools/power/x86/intel-speed-select/isst-config.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/tools/power/x86/intel-speed-select/isst-config.c
> b/tools/power/x86/intel-speed-select/isst-config.c
> index 558138eea75e..d00d15490a98 100644
> --- a/tools/power/x86/intel-speed-select/isst-config.c
> +++ b/tools/power/x86/intel-speed-select/isst-config.c
> @@ -950,9 +950,11 @@ int isolate_cpus(struct isst_id *id, int
> mask_size, cpu_set_t *cpu_mask, int lev
> =C2=A0		ret =3D write(fd, "member", strlen("member"));
> =C2=A0		if (ret =3D=3D -1) {
> =C2=A0			printf("Can't update to member\n");
> +			close(fd);
> =C2=A0			return ret;
> =C2=A0		}
> =C2=A0
> +		close(fd);
> =C2=A0		return 0;
> =C2=A0	}
> =C2=A0
