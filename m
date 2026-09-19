Received: from sender6-op-o15.zoho.com (sender6-op-o15.zoho.com [165.173.180.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F146E3446CA;
	Sat, 19 Sep 2026 15:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789831434; cv=pass; b=QuUNwNsnDCveMg0CNkBaXaGn+1oEJkmF7/6GJtKbxj/FFPUoxBhLq7po5zOwcTGSVQFRux9GT9mdAuihI46/pIOw0nGdZiN5+P8J62sJM2Kx9PthaTP7pCkVdi/bzLfELmkE+3hSOfoJR4BHw7q+MyHyS5tg+Ef9yn5oDaubavY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789831434; c=relaxed/simple;
	bh=CPxlyB8XGc0CFbZ01ldl0Ptu1sJZXySZonpes6Wpw2k=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=BTESVdd8i8ryXYx3ZVWJE6nEln4tQlh/1STTO2ACrwqIimS306f0bNrPrf4UEhwg671q6Tg17kDJZshDUzqy5wyL7mjOfhPYt0wpcYbmCN+1NgSH655Xrhuw9yXqBY3Ua7jpLbQYDVq/XF4Evt90wTdAA9V+LD0bc5v5PvRW7dE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=kpC+Kg1f; arc=pass smtp.client-ip=165.173.180.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="kpC+Kg1f"
ARC-Seal: i=1; a=rsa-sha256; t=1789831426; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ec7a2656zscMZN5aAsj29v5MuNtc7cd2JwkMhcGugsKDd4cVKz+CVsMsGE+e/OKB3S+dmbigmceQA1F7YWcAb04Yz9eG3AqWeyc6MnFuI+4M8kny6l9rr79gDWztLEJBA4wJbf5gKs8Je1rgU8EJZjOdDdSOKoGWhcmfNcR64eU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789831426; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=K1EokjPKrudBK5D/kPOhuPBVz8KJjU2RR5J+6NMR5tE=; 
	b=EjLzn58ZdOp6n2RxKQ1s4EEUa7rvMRv/Sb4rQIcyyl2AzV2WKFkYOfwyzCMD2JgHPuCv1fdqbkj7XN0DyZjwDHZuxphwgz+IMwcHRMtMDNy//Uqvx4UMIk/84AdIKTimMSEcoT/WWmR1eHZNTX1J3wzyEUI+FOVTbzezFCXIJWI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789831426;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=K1EokjPKrudBK5D/kPOhuPBVz8KJjU2RR5J+6NMR5tE=;
	b=kpC+Kg1foFHbNM9ywksLRaWIw9DJpokoPTDpSZnhE0vZxvct7PTsq5qy43XvOS48
	pdGczQfDlUjOGxkNfTHJlLOX0kqJHOGmrWpTfcbnGwWPRieyHB+7CEnf+uWF4+YpM4A
	IWUCYIG/+OL0l6wfFMeYHOlAnjwdTLVfs3E5UMLzU9aPUi5e38Nksg9Zlx8xu4F95Xf
	UR+qQwX6cf0uKWnnXBEb8bq9t43pxHgWWp5OjqfhsfsTXoDWWDPpKZWU2yxqlBht8pv
	dXQnAuFRLq6Q5umT6kaoqM+BpkeKtPN22mGVjCA4YHBLSbVKwTClRT+06SGYcOK/UCy
	eS0Sf6e55w==
Received: by smtp.zohomail.com with SMTPS id 1789831424143507.0140652125898;
	Sat, 19 Sep 2026 08:23:44 -0700 (PDT)
Message-ID: <d3ed3f2ac2e8ed960e0bc9b86d4732a75f1464e7.camel@rong.moe>
Subject: Re: [PATCH 0/5] platform/x86/amd/pmf: Clean up undesirable
 function outlining
From: Rong Zhang <i@rong.moe>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Hans de Goede
	 <hansg@kernel.org>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=
	 <ilpo.jarvinen@linux.intel.com>, Sanket Goswami <Sanket.Goswami@amd.com>, 
 "Mario Limonciello (AMD)"
	 <superm1@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260901-amd-pmf-fix-outlining-v1-0-b54ff94d3d45@rong.moe>
References: <20260901-amd-pmf-fix-outlining-v1-0-b54ff94d3d45@rong.moe>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 19 Sep 2026 23:18:37 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-10+b1 
X-ZohoMailClient: External

Hi all,

On Tue, 2026-09-01 at 23:02 +0800, Rong Zhang wrote:
> The amd-pmf driver is notably bloated due to undesirable function
> outlining and linkage. Simple and dump helper functions as well as
> wrappers should really be static inline functions instead of global ones
> from the very beginning, or else they are prone to the overhead of
> function outlining and linkage, which bloats themselves and their
> callers.
>=20
> The series converts all these helper functions and wrappers into static
> inline functions, and shrink the module (!CONFIG_AMD_PMF_DEBUG &&
> CONFIG_AMD_PMF_UTIL_SUPPORT) size by 1472 Bytes (GCC 16 -O2):
>=20
>       text       data        bss      total filename	(before)
>      26810      31672       2768      61250 amd-pmf.ko
>=20
>       text       data        bss      total filename	(after)
>      26046      30964       2768      59778 amd-pmf.ko
>=20
> As for CONFIG_AMD_PMF_DEBUG && CONFIG_AMD_PMF_UTIL_SUPPORT builds, the
> module size is shrunk by 1187 Bytes:
>=20
>       text       data        bss      total filename	(before)
>      34593      45500       2784      82877 amd-pmf.ko
>=20
>       text       data        bss      total filename	(after)
>      33988      44918       2784      81690 amd-pmf.ko
>=20
> This should also optimize the performance a little bit theoretically,
> though it's probably not very important on modern hardware anyway.
>=20
> Signed-off-by: Rong Zhang <i@rong.moe>

Gentle ping.

Thanks,
Rong

> ---
> Rong Zhang (5):
>       platform/x86/amd/pmf: Inline !AMD_PMF_DEBUG stub
>       platform/x86/amd/pmf: Inline simple helper functions of Core Layer
>       platform/x86/amd/pmf: Inline simple helper function of SPS Layer
>       platform/x86/amd/pmf: Inline simple helper function of Smart PC TA =
interfaces
>       platform/x86/amd/pmf: Inline wrappers of ap{mf,ts}_if_call_store_bu=
ffer()
>=20
>  drivers/platform/x86/amd/pmf/acpi.c |  76 +-----------------
>  drivers/platform/x86/amd/pmf/core.c |  22 ------
>  drivers/platform/x86/amd/pmf/pmf.h  | 150 ++++++++++++++++++++++++++++++=
+-----
>  drivers/platform/x86/amd/pmf/spc.c  |  15 ----
>  drivers/platform/x86/amd/pmf/sps.c  |   5 --
>  5 files changed, 131 insertions(+), 137 deletions(-)
> ---
> base-commit: 9ffed84a24d60ec506d8961fe138f0baa92fdbd0
> change-id: 6f1861db-amd-pmf-fix-outlining-204546e884cf
>=20
> Thanks,
> Rong
