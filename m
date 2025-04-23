Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4957327933E
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Apr 2025 14:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745417940; cv=none; b=jjVNrExFSq8X8lxj7pyH/H+DEPLk8FZNfJUpiFLmDao00LL/Q0BlC8Lj7hUYBfRVS3E7KJj6OJOnBx0uuGWCbx/rH1ht0/lRM1v6D+TlojGXvb+XuJB/4JbAbZBJFzikqBDDlSjLY3gzQUSF0w/N/55Z8blGmdH2O72ZI7iMMOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745417940; c=relaxed/simple;
	bh=5L7XCeeN/ka2ZgaxFwfE8MEMF/cmOCXAIeUoqGY/JOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q8BvmTGPjjMcvMJaHXhj28qoEcfj5qWVHrplIQ2VI2W+uBRqvMKFKCJP8DgcSGNes+FA7Q8Sj8uq+PQXCFAX78TcBRMLgTOcBSbwmx2KPcz3brlb5+kH869f8JaPVr8+4dpc5uIaPhlvEJL+js2p55JgkTuuLoM2eGbsGsTV7UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu; spf=pass smtp.mailfrom=heusel.eu; dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b=BAOFkM/f; arc=none smtp.client-ip=212.227.17.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heusel.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b="BAOFkM/f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heusel.eu;
	s=s1-ionos; t=1745417932; x=1746022732; i=christian@heusel.eu;
	bh=5L7XCeeN/ka2ZgaxFwfE8MEMF/cmOCXAIeUoqGY/JOY=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=BAOFkM/fZeEo4lrR0HNqXqKcAYcLUm48xZIm1tLsaejWI+8oAx1KSxUZAGfmwLcY
	 rtPi7FNOf9NpD8VTJd01Mv19fvSC+vSrMPKq4wmyDEVVnqvWdqTt8Txery5q3u6gi
	 K+rqjnSMjscgyhnV7lN05NLtBooQW2UcEm0dwbL/CXypsJrN5PEzjxqQna2m1yNBW
	 Ml+W0d1IsK/Nn/LU5pJBa0+Juhrve7MFfirip46nfMandHEq/VAIfYSgrU35JWtJ4
	 ukusjG4snXTtCV6yxbflaboU0mkmkCnmY+6O2LHUPMFm9KK//T0iszza2q7d0hHs+
	 MuzZjsmfH9qPVYAxMg==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost ([147.142.58.71]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MlwBh-1uqFG11qOB-00h9nm; Wed, 23 Apr 2025 16:13:18 +0200
Date: Wed, 23 Apr 2025 16:13:16 +0200
From: Christian Heusel <christian@heusel.eu>
To: Mario Limonciello <superm1@kernel.org>
Cc: mario.limonciello@amd.com, Shyam-sundar.S-k@amd.com, 
	hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, Patil.Reddy@amd.com, 
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2 2/2] drivers/platform/x86/amd: pmf: Check for invalid
 Smart PC Policies
Message-ID: <88dcaa8b-4ab5-4284-aabf-7ef3a5caea7f@heusel.eu>
References: <20250423132002.3984997-1-superm1@kernel.org>
 <20250423132002.3984997-3-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="blv3iqc6ol6eblid"
Content-Disposition: inline
In-Reply-To: <20250423132002.3984997-3-superm1@kernel.org>
X-Provags-ID: V03:K1:mlTV/kyD3PJE9RHzFA3hANcmuFwGASXXeQwDMaAlxM19y3MNzko
 p4hjiQpLQxKr2wpBmotRANmXFSQ4gR9kRkJFZ5dSx5HlKYi4fMGt/qST47362EFNHU0/UgF
 hY5b/2s7UowUoyWKwlb5bz7uOSrQvJvQfNfv0jj0cWFEZz6Jw/Jl5wKyaRAqQnfxkNPbfFD
 fMawsTh4V34D3kB4kqg2w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:j8BwWOtJ1YU=;0URovkY7x48hp0lbaEcBvtb3YjX
 uYIXgn0D+/G/Yk+tIRovnrfFyzJFHbfMxpeO379rNo5t3/MqktBTGvl4YDAXKWEWSsfp2BcdY
 uMYstMjfZrZUX9MyXPb/gmzUzYJsKWSRzG1PUJfwojHCTwWyPUQTFI8HSbrPfkWQjEL0T6VIF
 6BsnXQKJX4LT+hznK9ia41APF/wwSid62apTfTmCXcYNy00SZRrR9felmtMqP+DtTFb/oZwsv
 MYo4zc6jusiaHfIEaLrNfbkZiBPH6llTvf3whuO+l6+PZdWNHWCqn3AEJfQpsJasuYV1F2dMy
 fOi50fFwBXkgvVnq0f2p4iGKdVt3j4ODs4mxu6qxC8TqZWCuULKexRvp1P4Ene1ExE6dargXx
 VJRONZNYY0NsDdLWTxHix6qaqplRiaRHxT39GlIKMzuCV1PSsOsN4sIpSp5xSrj+mptwn0CbS
 jvlwP1k1fbJvt4IoCevyDCLbI66+hvN+a/HEZG6FdghKPmxCJxfhUlo7xeHd8LGwqQI7UWpXE
 eug4ImYu1czDRKRn+X3TOc72ncJX+xvRLECFx2wyzSn+MGJlKIwemEZ5FypJ0dUOna7P27bBB
 z607qIebNdzz2lQzfWqQwAz7C2/EsEerRcPvS+Tru0KuirhmV1q34S4ZPeFhJrk/5c0FVTlkB
 +09T1DzrscywgOns/WDiraGQ3qmcQqhAYKIKk4nwP/2EVkpD0gwCORv/ndTYml74p7TAx2OWm
 1XLLlfdMufMGuNxH2UWBZ/SghvZWoLB1kujN0KzCqMgd/R/FvsWo7HDDINpySd0E2IrbwF1P7
 bbAkNGW8O7ojscKzteTM3ipAN9FrEzjs8m8FUs/FAw9AxKTzdP/G+YcHrnMQ7b3gv5vz5ToBp
 UE2isjRDtFj4pF3veO9K268Y99F+y+EEmyoxmwxiAIO3+bXNMnsFch7e0kzgWdGYZl0Yok6aG
 T1wztpXtdEdH5wjrGCAZ3wL68Pb/vHW2LePhPl39cqoky5JmWCyE4R8Ev5+OMj5yKsKk9ez1i
 GnPNYJbQKsE5yoiQl1noL6Enw3I3AoopBQ0SbSdIvmGy8f669P+QjLxtITlZ1fk0tnGOH0XMV
 r6YdwitNa1FwR6Nu8kd1i56mK1tCxhg4TSFedZxpYnDYrlUTxLetC38uZeDtzIYG+vnWAS3xG
 rgnGyZMoJUcqiRjuIYWbri5qApItAZ1z0Oo9V7ePKhaqlAFOMkk+j8ByY2lCBghocR4OI2oPE
 O+lO8BMcM+VqH84xSW8HcH9/ZZ9TLGYIS7VmhuYUEyf9fNDhGTK40s6+Saru0oq9JRpSxbo7t
 Za6C6AwKuKt9D7+JXns84JFO9dU3DI3oVjowIXMpcOY2da7Y3Kqa2iO3julugtSfg6dM9omdg
 CQZ8M0C457hOzYgQjJj3fI9dUcLj1BMPbIrDE=


--blv3iqc6ol6eblid
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/2] drivers/platform/x86/amd: pmf: Check for invalid
 Smart PC Policies
MIME-Version: 1.0

On 25/04/23 08:18AM, Mario Limonciello wrote:
> From: Mario Limonciello <mario.limonciello@amd.com>
>=20
> commit 376a8c2a14439 ("platform/x86/amd/pmf: Update PMF Driver for
> Compatibility with new PMF-TA") added support for platforms that support
> an updated TA, however it also exposed a number of platforms that although
> they have support for the updated TA don't actually populate a policy
> binary.
>=20
> Add an explicit check that the policy binary isn't empty before
> initializing the TA.
>=20
> Reported-by: Christian Heusel <christian@heusel.eu>
> Closes: https://lore.kernel.org/platform-driver-x86/ae644428-5bf2-4b30-81=
ba-0b259ed3449b@heusel.eu/
> Fixes: 376a8c2a14439 ("platform/x86/amd/pmf: Update PMF Driver for Compat=
ibility with new PMF-TA")
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Tested-by: Christian Heusel <christian@heusel.eu>

Thanks for the quick fix!

--blv3iqc6ol6eblid
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEb3ea3iR6a4oPcswTwEfU8yi1JYUFAmgI9XwACgkQwEfU8yi1
JYWISw//cth3ExCyfJYEnFEClDPT2HW4oWn9HBynDfew+tcrxObthK0pYfO3BDE7
ZiwTOZBlopa8aY4wyndGg8/MeyPfHGmZZfp133GoPMR6O9u0J3AUUw2BfSB6BcY9
I/FaMWUpziHIJXJbrDxbtY+DjV30eFyvLs3Fcw1wKeTDzTlkPlomz4qa1B2S7fnn
sOS3nVUEqJzZ9zXT3at1gLhJZ3n6a1qEUmxHiRyfpRI69hFpF3xypGeFcalkVsRP
fGd5XVonRga5zrE5vqqiosHb76e6xZBMJ8t9jWQJUQKmtDcm2V2DcvLcuB/780u2
sklJv8rP4LE6Mgx4Pvzg4jPSjYsJ61wGOt6zPmjXO5+Sh8Rut8moU2sl5d194Zq2
bJXkCgeAZRU5Af3J6GN0e2Lf9FzXQ5jW+u1CyD3y+/wlJ/+6iuyRdq2U5R/7xRw3
QkhQ7XBuhntFJbXBfbXOrcFRzyefpEQAhmXzDUNewuuRuaiD21EeBlxpwyoHe3BE
45v49WIYtBOg7bUcuTCh8YiL9IfDz+1nxwvEe/+0ZLEPAVy+Xi2EqbSXX9NWAG76
esqmcSEDmiZnMAeN7a5igdRCLOYNCHkxnWMOMypYxtZCjbhDW1AqTKglj89x0Rgj
CsZZcnxqRPdzXed3NVW26xbjGxXgfAZI3dRLtAutxN4XmJRl+D8=
=RBHL
-----END PGP SIGNATURE-----

--blv3iqc6ol6eblid--
