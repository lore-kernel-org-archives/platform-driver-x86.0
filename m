Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.159
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795796803;
	b=p9zmufVrVv8y+JcHHnhg6cAeIn9ag6yDBs2Deelj7RaI80xTnOY0WV12oISdeGYr5fB+
	 P0zW768vN3UThiqVzTPfpUQFnqUVy4C2fUVVgD0/7ozVMDsvvUaTQmv+ePs/9dlFkhg3q
	 7GFqiPIA/nVOp4ghaxII8q9vASuNFg1Lh9/dq+uW1C/R4uJaWMZt6xhX0lqVAzx2mvgou
	 XmuOA3IFiSwlO2HaeGJm0yb70MzwOgIsV9FqT4h2YwMF3YZ2btkNw4CXmJ0AMbIPIE+VS
	 Xh7nED3aXdb39SofaIAVMAoKYUuK32GMwjA+tGNEvAjDK+WeNxOwZ7kz+g0UWcN+xZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795796803;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=kJ+AgIyiNBqEdQ5aoE5WCYrgJjusYZLele4OKAsw1z8=;
	b=5IKlzJ0KOi8wL3vVD7c+3FBZvoPyV8hsBi/pYUEqXliCJIEH1WYowK7UQ8dVyjOoZiQZ
	 bBLrV6iVmc9mptMFEz/DEKprAe7BQTyQOYaC83Um34VuIun3uIJij7ibE8ymWvMgmGHoG
	 sW9hJ7YTaSZp+aCOoVei1420WCGbaekWd0tKhazCOk4CijWQ9QJl9uLLv3MQ3sXI/e2bO
	 KgtShPjj8nmecxEWHOBkRz3ATCrTfm4ECaK6+bOLUB+wqD6JFmWk9Peozrh8gwfNvyPKE
	 t3DopODKNLKPPpsp0BaCJFHveJer44SguEtymhbbsmC5yIuDus1D5G9V81Trci8Ylmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squebb.ca;
	spf=pass smtp.mailfrom=squebb.ca;
	dkim=pass header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=XPAGylx3;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=0HQnoEF6;
	arc=none smtp.remote-ip=103.168.172.159
Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0731E606A31F
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Nov 2026 16:26:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0731E606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=XPAGylx3;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=0HQnoEF6
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 19FC11400378
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Nov 2026 11:26:42 -0500 (EST)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Fri, 27 Nov 2026 11:26:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1795796800;
	 x=1795883200; bh=kJ+AgIyiNBqEdQ5aoE5WCYrgJjusYZLele4OKAsw1z8=; b=
	XPAGylx3FowjOkHFD+3ga31bBe61vz4leMsfYdG1TYrro+uSpjUQN0QiwxSnfHll
	WMV3WHQPJDMgNQ9PY60gKaoye81uNfnzW2oc8u6CDI78DCSXO5Xt2P6ZswA3eles
	ZqpNPhFXFLCVHxSj4UZsq2/ug3IwdsbvKjZ0UyV6d8XzN+/Zb5LtAkuyiYojSBs3
	DRWXW10NS7JFFcWOR9AWNVlUVSmVuymhFdxp9qrlbcGLnpY7PVUKS2ThW6mDvMKs
	axvV1pT2KGCiYCNaBv6vbAhlJ6I5XATVhzyM1uYrkTz3UNY+Vbmd0HcUE6PFocH6
	ZujMopCyGU7BW0/fwYRbJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795796800; x=
	1795883200; bh=kJ+AgIyiNBqEdQ5aoE5WCYrgJjusYZLele4OKAsw1z8=; b=0
	HQnoEF62xi8YjVEwT3Hzia5QUslH5hON1Ia0y3goUsDRcUiUhcBRgLTQGmhrRNTM
	eh8Eg+xZa+NEjwlk9CzsPK/eWXw8JrptCXxpVbihaCEDnSSgChRTzm+iOEiYjGdv
	wL93uR3SWQHqsVoI6qH0skmXx1b9OR0Y9IQWElpVhC6g7ffwM66ZDeoKAAkCovEu
	t6M5Mn5tVBYgIb4+aepdsTLuOV7F8bOq2K1C9vgUY3uoXd8vzZBGaYd2sZXwRX42
	932CqydUhhVyr7dEFmPhFlNMP6HjHwcV0LFLgETpMjS126hQLpb1w/vyQtueFP06
	BNHGsCXz+QQSgqGacJuow==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=squebb.ca a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795796800; d=squebb.ca;
	mf=PG1wZWFyc29uLWxlbm92b0BzcXVlYmIuY2E+;
	rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
	s=fm1:rsa-sha256:FAoyUUkuODt2cmqoRquI2LvYhb3H0u1cMY7VNnc+GwMx41p
	AeqPngJryQVKmxopKREojlhgdAbBUD7LtPBHL+SBBddbGyTHRd0bnc+itZ+ws1Cr
	EUT2lZA6I+nGm9EWOhBuati+p0ugK7/h6CkOPzaom3z9FeN+kwCCH9jUigaXpfiy
	dyHqdAmvcwQyNqkjD0J1p4+22eS5kb56jL4Mfi1M34J+vL8jmPgmHlNV4lst0JVd
	y2Vu+XDLT6EiGAgmFLPkrRf3Gt++0foRhhS+JFBbM21B5c0ju9vOKOCOWBkeqFzF
	TE/wcsDJmCl2KGcGvzZn9TboyxlDR53xHqmKgyA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:sJ8/PCe8bxwAuWDfEmXJa1HqcnvthlPCGqfNhRsZzqk=:mdcrcvrvqZw73NmlsPdQTWh03G1h1pz2HZUUze7g9uw=;
X-ME-Sender: <xms:P68Ja_1XP-Z577VLMoxnak1v82m5XkKGZWdJULFPVvRp55UYiwgLSA>
    <xme:P68Ja46Y0FAPqkMCiYy7af_UDAG-5dlq-W6HSMxJUuu6HplUfi8UlJ5bMo6V43Gf9
    xbFrPXDjOxgdEna51ZPp0fXE6puxAKtHErUX_L6af4ypeFCrg-1dDcTAA>
X-ME-Proxy-Cause: dmFkZTFdz1p+Y6l3yr9DyoeIlXfM5u0CnR1C8drPyM3JhkhAsWBImUlP3omG0EEpWhSmOX
    oMCUPI9yCckaxm01Th+fPaibQRFYtGcJJlbJGJzaWMdsBwKR4wBSDMvb+i+Lh/e8uqN5yQ
    qvmcvcLWpooY4PGHauGUIMAZyp94PTUqD7UpFVZJMVWTzDL86VaIIQ/39Uc1YQ3N1Fw8Xe
    QzlNo/iBv7XAspmtCpLdOxyMT+vHuwux71TX96gWVayKf4LauQaH30yuojRCCEXqLODj0m
    F9NIyxJboNFoOhavYxTTbMd7lORr5yiGecsAwpEPmziAM0p2fC86cG0uD8gIQJKyRw2lQb
    XXmyAFbzG5qzSLjfdHQcP6AJFa4ykeuGUVIpBqW59YJhp+Kxp0Gr/g0MFYM1h1gFWCyScU
    lk7cJ373tBGgMhH4R+eXep/Si+WBktNMFOt3WPpYHtQWMOZkYejKhXjy3WfMgIBj+S1sgP
    ZlWw2kM8MDiiG/5PT0KZaK9v3nz6oMRsRRuB6ndTIbZY7+HcUPQUs7lTu3E7crOmLH/moM
    MrQD3/RloVK5R5kH/InIw3Al9bAoGdMMqHRkyzlOiDWDD3gz1TlUKIhymsTIwDbzChZFvI
    WjwrFdLsDzpczATA4SgBIEyf6C73Z9KQXOVIvCAgNYJY7HKWWkW8aHCJD1/A
X-ME-Proxy: <xmx:P68JawaQQBR2h1-i_m0GLWVOhXGTvHY6MCi_kRcy8cZsZOrdMabzQg>
    <xmx:P68JaznH3Fwu4sCyxqB1lUYttjNoaZFIJPL7tjaewIKSVtYrcSC0aQ>
    <xmx:P68Ja2jLBIWPUPgxrNJ53UhJWxa3LVqOZ7EWD4aZTpZn72pkVFXHFg>
    <xmx:P68Ja1SRIgh0e2fNn8LNWhmDIJ7lby7o2Vq1lSYKu1G1pfh1b-BO0w>
    <xmx:QK8Ja5U0nHYIqOZ4Fio2R2aXoCERdv1JKf2MPntJzWIvG4L-bevH8YUV>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id 46ABB2C00085; Fri, 27 Nov 2026 11:26:39 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AIp_4MIr7l0Z
Date: Fri, 27 Nov 2026 11:26:19 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Rong Zhang" <i@rong.moe>, "Arnav Kapoor" <kapoorarnav43@gmail.com>
Cc: "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Ike Panhc" <ikepanhc@gmail.com>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Stuart Hayhurst" <stuart.a.hayhurst@gmail.com>,
 "Punnay Sharma" <punnaysharma805@gmail.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <77bf62de-fa48-4549-bfb8-d99eee863342@app.fastmail.com>
In-Reply-To: <11bf638c620500f8c042de6d1f2bf3f1d7225820.camel@rong.moe>
References: <20261126073107.765676-1-kapoorarnav43@gmail.com>
 <3e932924940536878264c1ab46d24bd6db362183.camel@rong.moe>
 <20261126152448.847538-1-kapoorarnav43@gmail.com>
 <20261126161131.962234-1-kapoorarnav43@gmail.com>
 <11bf638c620500f8c042de6d1f2bf3f1d7225820.camel@rong.moe>
Subject: Re: [PATCH] platform/x86: ideapad-laptop: don't warn about keyboard backlight
 type 0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Nov 26, 2026, at 11:26 AM, Rong Zhang wrote:
> Hi Arnav,
>
> On Thu, 2026-11-26 at 21:41 +0530, Arnav Kapoor wrote:
>> Correction, sorry: I replied before reading Punnay's patch closely. It
>> only skips the warning for type 1 (KBD_BL_NONE_TYPE); this V14 G2 ITL
>> returns 0, so the warning stays with it applied.
>> 
>> Type 0 is a separate case: no bits set, and KBLC also returns 0 when
>> the EC or LFCM is unavailable, so it can't mean any backlight type.
>> 
>> Hans, Ilpo, please ignore my earlier request to drop this patch. I'm
>> happy to rebase it on top of Punnay's patch, or to fold both cases into
>> a single check, whichever you prefer.
>
> IIRC the KBLC methods of devices I've seen always return (whatever | 1).
>
> So I guess it should be safe to assume 0 as stubbed. I'd still like to
> defer to Mark's opinion, though.
>
I don't have any internal documentation on this I'm afraid. I'll see if I can get some.

The patch looks reasonable to me though.

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>

Mark
