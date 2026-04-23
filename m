Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB4E2D2488;
	Thu, 23 Apr 2026 20:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776977492; cv=none; b=AUC/a6Gu1pcHNSYfVk4164dJBDrcxYertPO87uKRiFYJqGbzB3viAwIi0XPfH8l0VuIAmxV4/ZuD1fPw6JXgZf3gj7Fcl795kKuD1wyt3QrwUm7r1P+we9RUNJWx/qVCiihZW/4vyx0lYywDw/eVf9xiDBSwbeHcjhNpMxcJT5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776977492; c=relaxed/simple;
	bh=2JHkQybQvKNEfUkGvKP/zDfiTsOV8zHIZ2uW3JwAzPg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fGPEENauM+sMe3jnbwDMuTR9NdJ5g5UkT6Aw0DoSmtzVfY9ZSHJTHTm414GHrDPJ15iDBFUSON1CKxJnT4y1YJE30UIk5W7DftIeF3Tox7Dqn/axc7Nq6L9/R+g5VRPmRNNCEMqdVrW4r4gqfMZB4KtFsEoPPcbEcIfKicRjst8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gyKq6U5S; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gyKq6U5S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776977490; x=1808513490;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=2JHkQybQvKNEfUkGvKP/zDfiTsOV8zHIZ2uW3JwAzPg=;
  b=gyKq6U5S7uQmurOHm0WcGGkxYi0s8hp7psawCzLP5E2mkHJTa6UVHE1R
   E3BTG0j8iImEpi+2R7j3l47Vxh/hIJyaGbVqbaKLl+qtwOzBqZevtZReK
   auyYKCw2Rdl9A3bbCuqYhE99NxE1lk73GCkACwaj0jNMJlWaDEg4VxkLd
   ATRj1qyBHhvusv+bPMZaRYK8qR0WGFF7CGfFQG/xXoRRki+tP3JulH1PH
   T6nl+FVMR7yb1pGoZ3QSq8eOFxRX9FXhvL6AUd6R8/pDWhjav9593iLAJ
   ySFinLigG3tawTLV3EX4ZOTydZxEpvYzYE8dlPbqbqy7hSMOFGahEySWH
   g==;
X-CSE-ConnectionGUID: XVI3Tjt2TAOwRPYXlIK0jQ==
X-CSE-MsgGUID: 2jZ3na3ZTWiuU+fftNVkZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="89422079"
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; 
   d="scan'208";a="89422079"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 13:51:30 -0700
X-CSE-ConnectionGUID: NqhYX1L5SFmp/LaMrTDmvg==
X-CSE-MsgGUID: fx3v7nFoSQ2iv0zHb/nraQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; 
   d="scan'208";a="237824252"
Received: from dnelso2-mobl.amr.corp.intel.com (HELO [10.125.108.31]) ([10.125.108.31])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 13:51:30 -0700
Message-ID: <a9739ac50d840d01e5790341d75dc5339daf21a0.camel@linux.intel.com>
Subject: Re: [PATCH v2] tools/power/x86/intel-speed-select: Harden daemon
 pidfile open
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: unknownbbqrx <dev@unknownbbqr.xyz>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 23 Apr 2026 13:51:29 -0700
In-Reply-To: <a34faaab-459a-4247-9df2-447948a7af9b@smtp-relay.sendinblue.com>
References: <a34faaab-459a-4247-9df2-447948a7af9b@smtp-relay.sendinblue.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2026-04-23 at 22:32 +0300, unknownbbqrx wrote:
>=20
> From: ali <dev@unknownbbqr.xyz>
>=20
> Avoid symlink-based pidfile clobbering by opening the pidfile with
> O_NOFOLLOW and validating it with fstat() before locking/writing.
>=20
> The daemon currently uses a fixed pidfile path under /tmp. A local
> unprivileged user can pre-create a symlink at that path and cause a
> root-run daemon instance to write into an attacker-chosen file.
>=20
> Signed-off-by: ali <dev@unknownbbqr.xyz>

Thanks for the patch, I am sorry, but I still can't take it in this
state. It's still an anonymous contribution, which is against policy.

> ---
> =C2=A0tools/power/x86/intel-speed-select/isst-daemon.c | 12 +++++++++++-
> =C2=A01 file changed, 11 insertions(+), 1 deletion(-)
>=20
> diff --git a/tools/power/x86/intel-speed-select/isst-daemon.c
> b/tools/power/x86/intel-speed-select/isst-daemon.c
> index 66df21b2b..4346b049d 100644
> --- a/tools/power/x86/intel-speed-select/isst-daemon.c
> +++ b/tools/power/x86/intel-speed-select/isst-daemon.c
> @@ -200,11 +200,21 @@ static void daemonize(char *rundir, char
> *pidfile)
> =C2=A0	if (ret =3D=3D -1)
> =C2=A0		exit(EXIT_FAILURE);
> =C2=A0
> -	pid_file_handle =3D open(pidfile, O_RDWR | O_CREAT, 0600);
> +	pid_file_handle =3D open(pidfile, O_RDWR | O_CREAT |
> O_NOFOLLOW, 0600);
> =C2=A0	if (pid_file_handle =3D=3D -1) {
> =C2=A0		/* Couldn't open lock file */
> =C2=A0		exit(1);
> =C2=A0	}
> +
> +	{
> +		struct stat st;
> +
> +		if (fstat(pid_file_handle, &st) =3D=3D -1)
> +			exit(1);
> +
> +		if (!S_ISREG(st.st_mode))
> +			exit(1);
> +	}

Also move struct stat st out at the top of function. So we don't do
unnecessary indentation with { }.


> =C2=A0	/* Try to lock file */
> =C2=A0#ifdef LOCKF_SUPPORT
> =C2=A0	if (lockf(pid_file_handle, F_TLOCK, 0) =3D=3D -1) {
>=20
> base-commit: 2e68039281932e6dc37718a1ea7cbb8e2cda42e6
