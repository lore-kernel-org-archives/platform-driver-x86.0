Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795710703;
	b=BWZVdOif1qYKZtdL/RLQpc2QsxxYx7US6xc2MrRpzkzBUB2fMXKLYipcl02lZ9x07kGQ
	 AXNzINxvSd9EFB/PUpwXgkXBxiDSrxpFOFJrZpI5ii2GA24Div+RXMBBFy2Mf0zz271Ax
	 Q6XBDgVVJRZaziFwai1RapGk+342Z+95Qk/OWvtkj3FEuO0RqeexumGcNwplSxOGTaAcp
	 v7nxBE7k1+4iFGPS3qpySc+PYEx1gMCwSfZkK020iyqnX3CaSLHEn2+/zGliHPq9osa7D
	 MHBDp+qLvT+EZ3dDdAQQYbV++rBwLdX1QLzvhZuXYtjBKScFd+Vw3xF2rgvtyGHHTDg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710703;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:
	 MIME-Version:User-Agent:X-ZohoMailClient;
	bh=frGnSKi8fHrUyzyLKk0ZNCUrhTr6NgD2D93OZ5RJh8U=;
	b=qHzwPKI4NxZzj/GJnvRDkx60AFRECeP8vnmXQkKTtujb/aBOaXK60grSeSJZuNVBmx2n
	 nTALSQ7IlyTbv49Hz+MKxmvjLlQxIdQFYExGGOpT+UbG48K+miJ4fAlfV4vWDrqba84B4
	 Zt2QMcnlcMpVpLLyIEkuugHHdrYdXlBRyqPdksnM1y/qD/mOjwcQ3IU1qvCfYruMLS95G
	 nO/CN53IGiXA96Z7LiGRco13nHz+d6yIUCtEL3WALifQ8C41FhUAyq+7fzVabYK7THhK5
	 OPI9bFvg+NTeWAAHZuk/83zIs3qn4HbeXtqG0uHwA2lcHIkzsgUukGBLKUdq49Sbj9Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=n0btPxGP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.112
Received: from sender5-pp-f112.zoho.com (sender5-pp-f112.zoho.com [165.173.182.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62750606A31E;
	Thu, 26 Nov 2026 16:31:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62750606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=n0btPxGP
ARC-Seal: i=1; a=rsa-sha256; t=1795710686; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Y0K06x+kZ8vJJo/p7IdwhwAL5FtR94QibgvGftTf1tl9hSbnN+3CoLWGSiwfyKzxuSZoKmL0gjQbJxMJcJvW+DVpZ6Uz4gPAYSEtQ7GKLNrRseSBJcRfjNM9FVR9eA58StkRxh+e5wqyVmSNJCv0tdebDrUJ06uX+iQ6NWKhlgk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795710686; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=frGnSKi8fHrUyzyLKk0ZNCUrhTr6NgD2D93OZ5RJh8U=; 
	b=C4IFDH3hTYoKawMMwYecwOoyHPj4mpWMWoL1hAFjA+DtngwOzLM8HOUw4AESmmjkp4+fN8MjBjahtQsqJC07ZTch2Seip3PSLNiBlQGpCJU0jJ4cM4Cy6fNSSvYC06cgpSF98L5xbbuBhoU0gXWI2QqE9Ak+7lFcIL8exeBooCg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=n0btPxGPH0ljZ+DextXTk2RReaOZLGFAluOO/bYfvy5EY8JNrO7jcvv3G/26PPSCsVMohDv20A2XOZb0n9S/WG/IiF+bY9j5K+EYqw03HcetqRrHh19eYoUSKWWxcbzJ7lrtOjrW9M5NbeeQAcACpmxRvi77ZArvvnUgwjAoS10HQ8MCbF5aIbseRO+3fieskmxo/xiXYarFOtobCGt0/4F8oFUsy/BsUb9gfhPlcbV4jsBOKbNORQZzj5N/ZQgUXQtiSugck/IUtsVWpQzrhrtarkiMzPQPMCh2R105mqACkAoI2REFMqidO7++HNFnpNpUo1NTnnk+QTaBG+GlfA==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=frGnSKi8fHrUyzyLKk0ZNCUrhTr6NgD2D93OZ5RJh8U=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 179571068280348.0413320410413;
	Thu, 26 Nov 2026 08:31:22 -0800 (PST)
Message-ID: <11bf638c620500f8c042de6d1f2bf3f1d7225820.camel@rong.moe>
Subject: Re: [PATCH] platform/x86: ideapad-laptop: don't warn about
 keyboard backlight type 0
From: Rong Zhang <i@rong.moe>
To: Arnav Kapoor <kapoorarnav43@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=	
 <ilpo.jarvinen@linux.intel.com>, Ike Panhc <ikepanhc@gmail.com>, Mark
 Pearson	 <mpearson-lenovo@squebb.ca>, "Derek J . Clark"
 <derekjohn.clark@gmail.com>,  Stuart Hayhurst
 <stuart.a.hayhurst@gmail.com>, Punnay Sharma <punnaysharma805@gmail.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261126161131.962234-1-kapoorarnav43@gmail.com>
References: <20261126073107.765676-1-kapoorarnav43@gmail.com>
	 <3e932924940536878264c1ab46d24bd6db362183.camel@rong.moe>
	 <20261126152448.847538-1-kapoorarnav43@gmail.com>
	 <20261126161131.962234-1-kapoorarnav43@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 00:26:16 +0800
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Evolution 3.62.1-4 
X-ZohoMailClient: External

Hi Arnav,

On Thu, 2026-11-26 at 21:41 +0530, Arnav Kapoor wrote:
> Correction, sorry: I replied before reading Punnay's patch closely. It
> only skips the warning for type 1 (KBD_BL_NONE_TYPE); this V14 G2 ITL
> returns 0, so the warning stays with it applied.
>=20
> Type 0 is a separate case: no bits set, and KBLC also returns 0 when
> the EC or LFCM is unavailable, so it can't mean any backlight type.
>=20
> Hans, Ilpo, please ignore my earlier request to drop this patch. I'm
> happy to rebase it on top of Punnay's patch, or to fold both cases into
> a single check, whichever you prefer.

IIRC the KBLC methods of devices I've seen always return (whatever | 1).

So I guess it should be safe to assume 0 as stubbed. I'd still like to
defer to Mark's opinion, though.

Thanks,
Rong=20

>=20
> Thanks,
> Arnav
