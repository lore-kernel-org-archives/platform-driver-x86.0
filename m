Received: from spark.kcore.it (spark.kcore.it [49.13.27.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9608A2F1FEA;
	Fri, 20 Mar 2026 16:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.13.27.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774024836; cv=none; b=DGYm0J/YPLKvylJMoNh9yCC4989irl2KSKikjzp+I+Ket2SOtgpxAfr3s9+prJJf+DVS4Dky+tUEPcfVK9vgprhjsqLQkcl4eZs5WItQO/VEvo/niRPSIk5/uokhxsSddDxXrv/5B3X6dnufNKNFp/Mbz3exckFJojGDugvqrTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774024836; c=relaxed/simple;
	bh=IME0MhiQXFv+R8yMDRM8Fj7uga8c/v8yfypPOpkFq9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LDm1Oeuv4Mj/FFvchMQEZBOhFJ7dufXtuwhZ/wTdD+eKbvDswJBNmYDzrgnNd7CAvR+ZgGvY1YVXUItXTWepqD2wR+vDtvQP2eWp1yWcfFHlvPs4NbRJ/FuKHTYBmWjxE8hJqwvo2hI7E0WVAy4NFuV04GEL630wNhkYjlsPjvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it; spf=pass smtp.mailfrom=kcore.it; dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b=fDEKdNA0; arc=none smtp.client-ip=49.13.27.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kcore.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b="fDEKdNA0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kcore.it;
	s=spark; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=5I73QcgEi3HQaGkSCZdhuHI6uZSoJRxBkj3ZvdMTeGw=; b=fDEKdNA0Co0dLkDl4AbThJkIJ4
	aufwy54hDuA9Q+lHXNSlo0y2YeVoQ7LNEn6wGKmMilFpEfJTAFA1NPm4RUtV+N3V4+8q/kMxHBcID
	yCvamSU8+gbh/MK0A49n7obglySuQXD868iAIH6ZofDaTvv7k0NEJU9KwNIyCBmvwtvY=;
Received: from mnencia by spark.kcore.it with local (Exim 4.96)
	(envelope-from <mnencia@kcore.it>)
	id 1w3ctb-005amb-2U;
	Fri, 20 Mar 2026 17:40:23 +0100
Date: Fri, 20 Mar 2026 17:40:23 +0100
From: Marco Nenciarini <mnencia@kcore.it>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org,
	hao.yao@intel.com, sakari.ailus@linux.intel.com, andy@kernel.org
Subject: Re: [PATCH] platform/x86: int3472: Add GPIO type 0x02 (strobe)
 mapping
Message-ID: <ab14d0M9TkC_yV9D@spark.kcore.it>
References: <ab0UvRdDpvZBiNsC@spark.kcore.it>
 <CAHp75VeiNd2Ptj9aoZcmSO-c+-RQG-R7kxpzyk3edKU2Ur05Gg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+oLkcqzjPi4FndOw"
Content-Disposition: inline
In-Reply-To: <CAHp75VeiNd2Ptj9aoZcmSO-c+-RQG-R7kxpzyk3edKU2Ur05Gg@mail.gmail.com>


--+oLkcqzjPi4FndOw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andy,

First, apologies for the triple submission. It was a sending error
on my side (mutt submitted three separate copies), not three patch
versions. Please disregard the duplicates.

Regarding your feedback:

> Link tag, Closes tags, Cc placement

Noted, thank you for the clear guidance. I will apply these if I
send an updated version.

> get_maintainer.pl

Thank you for the pointer and for sharing your ge2maintainer.sh
script.

> strobe / privacy-led mapping

Hans pointed out that GPIO type 0x02 is actually for an IR flood
LED, not a privacy LED. After digging into the ACPI tables on my
machine, I confirmed he is correct. The GPIO belongs to an INT3472
controlling an empty IR sensor slot, not the active OV08F4 camera.
I have replied to Hans with the full analysis. The mapping in this
patch is semantically wrong, so it may not be needed at all, or it
would need the refactoring Hans suggested.

Thanks,
Marco

--=20
Marco Nenciarini - mnencia@kcore.it
7C23 B804 3E65 D298 0A21  B6E2 589F 03F0 1BA5 5038

--+oLkcqzjPi4FndOw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEfCO4BD5l0pgKIbbiWJ8D8BulUDgFAmm9eHYACgkQWJ8D8Bul
UDhUsg//X51sFA4AnB9IQ7ZobIwh7exCjtSgAmCquS24VxjAqTh8II2/K6FEIDQQ
7yZrjmN5k+rpX+4ESMFpXPkNYhrydZbHFqAUnN6MsuivU3toJEoUjgNBmlytsdrs
Z3GJTpKCuBZx6UrxvUih5xGInf/9yMRVUj7/fAjPtrKt25K8HyVn8AI+sv5q1jJd
FW0aEia97J6PUvs1tZrqusDDiqNvQlL29C+KCZc0SBTlCMOnzZFhVKWyvXGvDPJA
JHi5q2uSQfPNcfcUJHwtQPc9spPFV/cShCo6uuTIXojPC4RdPBnw7uTon53R6XXC
F9qCVJqxkNlLxfshXwBG37uX8zhTUVj0fzFdgerfbvShOHNoM4pZVkgZLfhcQuVk
xSpd/02JKfy14A0Gw61Jv4Tc8cgVO6G7eNQyta/JTyv3vddrmVqa2q+cOv+hnI+f
WcHx3Bts3WLbVja5XFyAyETTR9BiD7rw5yNIQua5nYBe3/25J4NPi9TJKN4uC6Ni
i+sgJ9S6PQ+N7IbvUHy4e5C4iRpUK2lmoVilddLapVSVZGSa/hdhgsZLcWHPc8EM
bO4ZBdzRhT1rTnlXjLjJreNm69BTmbVe04jeBBfHy/A6S/2V2P9BsryYLPFF5259
g3j2mCPZWbwVN2ckiKcwOYkroh1N58DT9r3LdZdhGEI8zngCs+o=
=2TBm
-----END PGP SIGNATURE-----

--+oLkcqzjPi4FndOw--
