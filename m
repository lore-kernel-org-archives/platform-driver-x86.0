Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE693115BD;
	Thu, 23 Apr 2026 18:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776969878; cv=none; b=dhNx19ZZB3xg6cJSdZysbFQRvTpU9nqdqARcqqsKSww8ldPMDlN0xaQt+iQkMPas7aLEJk5Cr9+XX+pSJ1y1bWX7T9Duq4XTKUkFeGYCVke/3Zlp8/BH6WipOu+8c1OJAeLatSyPtwCrIB8yQ2TIqgWotpA0sPfVT6wIAFlfIhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776969878; c=relaxed/simple;
	bh=29xIrSc9fAng9oxyMetklAp6GoFdN2zWt3fs9gbX0wM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ce1TAfYjr1cKFLd1+rVtjngJHqRcVTL96rF5I7Lo2HzXiznbOALumW3JZxHhxvaKAeaEK46YLZnfBBA/UzdUKVPEeqX3SSM+EN83KiESOBnl1IfgoYurH9aUgtgoXm4DdNXIL/JjUVUIaQvurqPncBvDpGfV1RSbtah6UoLZEII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U8pOrfYi; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U8pOrfYi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776969877; x=1808505877;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=29xIrSc9fAng9oxyMetklAp6GoFdN2zWt3fs9gbX0wM=;
  b=U8pOrfYi3x4ckU3kn6PFbgrCzL2E89y9GV8lmQet/qbwXLff2RhDGzy0
   BS+YPJRQAWI6qTZrXSCYNkrkpCUhCwgSSut4uqSvrWr3XcR8rS/JxqV8v
   /A/6AtzgI6l2bHJCBmjxHiU2zU1J+o3cAnwhweA3sGml/SvPxUSPqEGRl
   Jvi9vbWUCl6Ma3pmdsL2GBMdom4Y0n8qovCoyYZF2nQiROhLTfTydGRz4
   aR++cDbi6s8Q7V3YgCjwLfkHyIpQYP/vkujBFBm5eOk01vhSkFfkQLFJ2
   lR5Zp0kIBxCEOiUr/TJ4XlZPBJzBSwvfW+uKcN71/FO5/N4CHAaiGgnLv
   Q==;
X-CSE-ConnectionGUID: An282dXPQ2yZf43l3y4aIA==
X-CSE-MsgGUID: MBw6UVhfQAe1/GoBImpNJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="103410729"
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; 
   d="scan'208";a="103410729"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 11:44:36 -0700
X-CSE-ConnectionGUID: sNrhpqyRQ2Kjq6SLHvvGRg==
X-CSE-MsgGUID: A2W7ShlRRmuNOaQld+qNSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; 
   d="scan'208";a="270857023"
Received: from dnelso2-mobl.amr.corp.intel.com (HELO [10.125.108.31]) ([10.125.108.31])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 11:44:36 -0700
Message-ID: <eeaa06b687979033475d60d7ad2461f7b214f5fc.camel@linux.intel.com>
Subject: Re: [PATCH] tools/power/x86/intel-speed-select: harden daemon
 pidfile open
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: unknownbbqrx <dev@unknownbbqr.xyz>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 23 Apr 2026 11:44:35 -0700
In-Reply-To: <0e8607ca-1275-4ee2-9539-0af0ec17ae90@smtp-relay.sendinblue.com>
References: <0e8607ca-1275-4ee2-9539-0af0ec17ae90@smtp-relay.sendinblue.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thanks for this change.

Capitalize the first letter. here it will be "Harden daemon pidfile
open"

On Thu, 2026-04-23 at 20:16 +0300, unknownbbqrx wrote:
>=20
> Avoid symlink-based pidfile clobbering by opening the pidfile with
> O_NOFOLLOW and validating it with fstat() before locking/writing.
>=20
> The daemon currently uses a fixed pidfile path under /tmp. A local
> unprivileged user can pre-create a symlink at that path and cause a
> root-run daemon instance to write into an attacker-chosen file.
>=20
> Signed-off-by: unknownbbqrx <dev@unknownbbqr.xyz>

Please follow sign-off guidelines
https://docs.kernel.org/process/submitting-patches.html


Thanks,
Srinivas

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
> =C2=A0	/* Try to lock file */
> =C2=A0#ifdef LOCKF_SUPPORT
> =C2=A0	if (lockf(pid_file_handle, F_TLOCK, 0) =3D=3D -1) {
>=20
> base-commit: 2e68039281932e6dc37718a1ea7cbb8e2cda42e6
> prerequisite-patch-id: b61dd51dee390277603975bf729a687113185c3a
> prerequisite-patch-id: df28525061dd528875c7c75880b4684d80f4aa7d
