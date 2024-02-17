Received: from mail.orlives.de (mail.orlives.de [148.251.55.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4346D1B4
	for <platform-driver-x86@vger.kernel.org>; Sat, 17 Feb 2024 16:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.55.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708189047; cv=none; b=fbqY+5NEPHnrefzRYsunIkBZQjjiCMw+xGLegnReke86KiYEJ7B5UBN24/RDa+D3dj7qKeGlZDLTU8XjB/QIAfi6HgaxtP9X1pmj6uY3WOH51uPOeBrDBIjytdx1KQN0OqR8aewKpKhYTgam0PAHj2nla/SSqhpZtdW+DsrXHXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708189047; c=relaxed/simple;
	bh=SWUXCZdtP4SXnvy53az9StlPLHzqtRP+AQA+h8DhxZ0=;
	h=Message-ID:Date:Mime-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ot3AdUG8vlMC0iHXdXSYsb8/mFjKpkMxADdRG1IHvbxOQxj0KopAlAzlZIbTQrSM4n05a5neWEC7CizP8n5xzWXwIAGQgTAyLOdXeGX8aNnHpVo4labQMgLK1HfHpLiHyNgWv18p94n/8UjpcGr6yvJUaq20KBnVZwe4VFtDQIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orlives.de; spf=pass smtp.mailfrom=orlives.de; dkim=pass (4096-bit key) header.d=orlives.de header.i=@orlives.de header.b=jgrKo3KE; arc=none smtp.client-ip=148.251.55.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orlives.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=orlives.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=orlives.de header.i=@orlives.de header.b="jgrKo3KE"
Received: from mail.orlives.de (localhost [127.0.0.1])
	by mail.orlives.de (Postfix) with ESMTPSA id 0FC9FA008B;
	Sat, 17 Feb 2024 17:57:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orlives.de; s=dkim1;
	t=1708189036;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=SWUXCZdtP4SXnvy53az9StlPLHzqtRP+AQA+h8DhxZ0=;
	b=jgrKo3KEDbP2e9fVHvILj4DE5ZEhl4GaNPt/mcVqk3Wf71aET82vKLUQp5yXqgAF9nP9Rs
	4KWK8i9te+1/q/8q1iACq3VNbudN+l3Lf7U/391F54tE/YfuHpJSU8w6xIVyPhi+SU2ECU
	pWrhY94OXcA5EcE4NrtKIREWtpuC0uXtTT4Y58zyLXGAbPGwyRLvj51HiK0nP2edYUcaKy
	FDA/jNi7xHWdBO9yH9vXmP6C7CbWhT+c7mNvlc1SoLn+tDIg/FtaSfhHk4Ruch+yjBU9xb
	OA2Y0OtUdbRBs+zFeHR7tHkDkeLm0lf3xcWbJSm4mx8BnwbRASHasUFLanQUaDusBImDUW
	tZvDbhGXlPfNMQh7WyIXcam+WED5E11S4fXnuUKzWmeCyyppHuJE7rGyZFqryKIMlmSOke
	kU96esWNj2hd/Z63HlfdSP34RI+9LYBYdRv6irUmF7SySiabMCl4R7VGbnaCg1Uk1Isicb
	p7S+sLzgVdaAH68Pt7K44uIxiulSsaPDApEdg8Z94WQ2jHYN4tAetlG9Z75q7Ywk9cRSqC
	IKxhtm8R4MRY3BnPVoOaj0KIOzqB3ZRzVQJVd8WGC1qF961hH6NAKFkGbDP5qhN074OnJF
	q+VXiMW9WoftVrT30T2eOxz/QoiPr98ixS81PIqYf53LYhxvw7VSc=
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=t.schmittlauch@orlives.de smtp.mailfrom=t.schmittlauch@orlives.de
Message-ID: <afd722b5-c48c-4ab7-b63b-7ce933e689c9@localhost>
Date: Sat, 17 Feb 2024 17:57:12 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Subject: Re: 6.8-rc: system freezes after resuming from suspend
To: Hans de Goede <hdegoede@redhat.com>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 platform-driver-x86@vger.kernel.org
References: <ed2226ff-257b-4cfd-afd6-bf3be9785474@localhost>
 <df1d5d57-1058-43f4-8aca-f91e7ad92dd4@leemhuis.info>
 <0d3bdb0f-63a7-4c48-b4d4-157b7b7c1689@amd.com>
 <92c8d543-bdf1-434e-8d92-23eeb513b35e@localhost>
 <0a103f43-0340-4c01-8a26-ecdfc186915a@amd.com>
 <d20ee821-c0e8-43c3-944c-125bf4064a16@localhost>
 <687a566b-95cf-4fa6-bc8e-7ef0b0475a3f@leemhuis.info>
 <859c089d-2c3e-4cb9-ad60-baf3e168d6bd@redhat.com>
Content-Language: en-US
From: Trolli Schmittlauch <t.schmittlauch@orlives.de>
Autocrypt: addr=t.schmittlauch@orlives.de; keydata=
 xsBNBF4y2DoBCADCzwZ+V1tJOR2JK20uAVPkAOC5PdIe/UYCVZsYIbh8aIz0HsiqWeTCj3J8
 nZEVKKm6fQRtyMILZeWNHQ98ck+1tmr4a6UQ4UDl+Xb1VuhU4frZI/d75olkn2JNwYcJJcdn
 MJ4WUZ8BWhmia+8ng+7nJ1yOw1ad0uS8dL+w+m+eimFr7HjIXUV/Y5I8NGhkROFDu72byMn1
 OTaq4HFfgilYsDGu8AWUtn+ZBXmCDIYbvXANjDcyuGTTnS/vgyFx66rHOgZKqTafuSAC1k61
 dAYvLlo06yb4S4VNwkW17ho9L6sgqfY5rFd+zQYnXdau7AK7TLAFywHgafHU20Ffv6PbABEB
 AAHNGzx0LnNjaG1pdHRsYXVjaEBvcmxpdmVzLmRlPsLAiQQQAQgAMwIZAQUCXjLYQAIbAwQL
 CQgHBhUICQoLAgMWAgEWIQSJFhEikPObK3+nglaeUEWy+uvFawAKCRCeUEWy+uvFa6UPCACt
 EeMFD8HIbP6vIfs0dQdYw7SyG/Ws/ZEhi61+HfBeltem2LMbcY3B1UNGWWt1px1oFq0sCd12
 j8JhjTPyFoQv+vRDEygMk/OrXfnn32dl9Ttubgz68ktxjv6xQ2q+TGHStUCe9Q1opGqjWqV0
 bqFV9nbpX5DX3urG4eDqjUrvUMasp3/RBBC6dSzRcutbmnFEUhbnQcG2JhxkUqJxErJO7Rs7
 dw5wR+43zipZznrtP/W8nCmL7E8VYn3KWFSb4jSmMyYneqBrhSZMB/BfiOMrWnnMpPChRLyR
 GLqZoyhWDPZyAbKyjlVQVS3d9BtLn5PzNaYRAl9Gad8h+o/WWHGXzsBNBF4y2DoBCACmbQWs
 /CCONpIwsHxKt4fEfbW1XhQFoKPmGF2Xonas6kN3Oh8XXFekkXfnRQJX+fOuv7DbaUsmkPzd
 TB2YtfidZJ6xIYPzSgSMsA945dEOY5yYfeNCH1pQYcq1xfM7bHGSwaNervx0wnK/g7yBgp6E
 1stOwqoR9M3KgmQJPuaSISSfUH5NKcx38S6w+56I3//f1jyCRG5vkQzHsdioBWkAOfagQmcv
 6fMhDYCoxlTooxlj1/5mSkspCS7fDkVcZn48t+sPfQAywpUDrWBZhp1vrDHfl+wUvCSXPYEz
 9dkT9NmLz24H20tLV+btVgMsPXSlnM34lNjABg2x7isCoCZ9ABEBAAHCwHYEGAEIACAFAl4y
 2EACGwwWIQSJFhEikPObK3+nglaeUEWy+uvFawAKCRCeUEWy+uvFayO5CACDYH46Tay5BSwn
 FK3EwAYSpXIFzhQet7os7InGRS8/2yuqzsunRDbMy11rTGmXXA1LuTizqsgebQbALpkuHEpi
 gX9b20RfsfuZYbdbtLzzVDuOVuGP3+CSJrB1Z+nGeF1+L4m5n7VDPX0MyWKwhlWY9hVmNQ2+
 lMt+fb6+330M9cXCz6H2/k7b2BTEM9xZPytt2ICT8I9rX5+8tuHDrstr13P40QOR0Exh5EHw
 LA00FYsr0e+ijzxRP9EC3AA9Gt/518IRS7FGvszu4qWWRT33P2cABoVUPpsybrhvuApgpf5y
 DLO17h0Vxwoq2qqCO/RqIw+o8Lj89xOl4VkPpXe4
In-Reply-To: <859c089d-2c3e-4cb9-ad60-baf3e168d6bd@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------lJcLkhQKuz0qtr92lT27PdHL"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------lJcLkhQKuz0qtr92lT27PdHL
Content-Type: multipart/mixed; boundary="------------92hS9SyoBAFMuz6UwBYL5MT0";
 protected-headers="v1"
From: Trolli Schmittlauch <t.schmittlauch@orlives.de>
To: Hans de Goede <hdegoede@redhat.com>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 platform-driver-x86@vger.kernel.org
Message-ID: <afd722b5-c48c-4ab7-b63b-7ce933e689c9@localhost>
Subject: Re: 6.8-rc: system freezes after resuming from suspend
References: <ed2226ff-257b-4cfd-afd6-bf3be9785474@localhost>
 <df1d5d57-1058-43f4-8aca-f91e7ad92dd4@leemhuis.info>
 <0d3bdb0f-63a7-4c48-b4d4-157b7b7c1689@amd.com>
 <92c8d543-bdf1-434e-8d92-23eeb513b35e@localhost>
 <0a103f43-0340-4c01-8a26-ecdfc186915a@amd.com>
 <d20ee821-c0e8-43c3-944c-125bf4064a16@localhost>
 <687a566b-95cf-4fa6-bc8e-7ef0b0475a3f@leemhuis.info>
 <859c089d-2c3e-4cb9-ad60-baf3e168d6bd@redhat.com>
In-Reply-To: <859c089d-2c3e-4cb9-ad60-baf3e168d6bd@redhat.com>

--------------92hS9SyoBAFMuz6UwBYL5MT0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgSGFucywNCg0KPiBDYW4geW91IGJ1aWxkIGEgNi44LWM0IHdpdGggdGhvc2UgMiBpbmNs
dWRlZCBhbmQgc2VlIGlmIHRoYXQgZml4ZXMgdGhpbmdzID8NCg0KVW5mb3J0dW5hdGVseSwg
Ym90aCBvZiB0aGVzZSBkbyBub3QgZml4IHRoZSBpc3N1ZS4gVGhlIHN5c3RlbSBzdGlsbCBm
cmVlemVzIGF0IHRoZSAybmQgc3VzcGVuZC4NCg0KQmVzdA0Kc2NobWl0dGxhdWNoDQo=

--------------92hS9SyoBAFMuz6UwBYL5MT0--

--------------lJcLkhQKuz0qtr92lT27PdHL
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEiRYRIpDzmyt/p4JWnlBFsvrrxWsFAmXQ5WkFAwAAAAAACgkQnlBFsvrrxWuF
4Qf/bHk5Crxc20XeK2vJ4H84d/u/a73eCQuD35KeaG6IhYXqbfh5puZfr29Cx+r0NygPRrbLH9AO
VhPKA2Hxv0cNHgPUZKgsmEuN5qJ7NaLZU6iLVUiCfc0Ee4I9sHtbGkPZrpfDx8O/cZ7oLn6Gg6DK
phH5SJIETJwyCtxYmjtb+4NuWc86m6QpCkZZ2CkbMDvsM3UGIFOwuryCygokillDIfeUi6Meot33
WFKnNE3UA1WTw9+nOYxA2OVVu4vd6KY1xd3mzIsH2LnuASXSKUxpSQd9tExDn0NWo6tJ3rHKwrwF
858iZCFvrx5Oiki0v8f1FjT7qYVlEcxLy2dufkA3kw==
=TfEA
-----END PGP SIGNATURE-----

--------------lJcLkhQKuz0qtr92lT27PdHL--
