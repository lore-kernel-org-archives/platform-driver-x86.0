Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795747441;
	b=RzqSvuCa9iX3RhDCtR2h1V4dT2im5pK6H+J4m63QYx9un2uM3Xz00vOQCY8+3fX2O8Fg
	 n0dKK68eKRaylmFRZ738KfGdNtcC4m2pp6vSJglJpX29hQQxOGHUgl4qiHNTZX51Y+DGP
	 kWD+WRodPGHqrhv9um4BxYrMWPoApWEbaPEkqzxapNMAwrl8f/f6wq+N8xEEouet1qOoC
	 0zlNYD+3jV1H3O2UPZnNc71lBiO2sf7gIvecVcszYux/22Kle5tf6GpTLSQXGQl2fqbz7
	 F/6Alv+gbPDDDrljjYiFPlaqtIqm1WTazzD6yuJMbQ2tSr4fwsXcrOjFPsrjFQdC4uA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795747441;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=CVnqOoOkJj2EsAGsWHK+Y0rFlElUFzCwBCicLhlbIX8=;
	b=g9EfceG9bPKM7vnIuBKCwCnqi8RPWffgUxAA1ot4EHGJYJ7FcCSjLJxPJvq3s2FXCE56
	 HjB2LOnmL6PQTEOrYytt5a2bwKj51ytfAfijiqhEWIpr8Zgb/IaAcn1DhFLf9XKop/QAX
	 plPjTSKeeB0ixk6dlA6orgxCwXHOBKG6s5VsOoSXJpLp5g0XnpyKLp/v/pJXgpTAQf8+2
	 hx+P15LFflL47mz4LRyRCKv0VK1u2OhkA/NZ4KtbVBH19/YV9Y0ucUTid6CpGpY5tWVtW
	 4aISEuhpm2MyXxa3lKaefwKLq/1O09jAl7AJuwOw4qyhg4iuay5qNecD9s6teBTcleA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squebb.ca;
	spf=pass smtp.mailfrom=squebb.ca;
	dkim=pass header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=Ydm+lSya;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=2fFEHwJm;
	arc=none smtp.remote-ip=202.12.124.152
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67615606A31E
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Nov 2026 02:44:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67615606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=Ydm+lSya;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=2fFEHwJm
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 80C357A0510
	for <platform-driver-x86@vger.kernel.org>; Thu, 26 Nov 2026 21:44:00 -0500 (EST)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Thu, 26 Nov 2026 21:44:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1795747440;
	 x=1795833840; bh=CVnqOoOkJj2EsAGsWHK+Y0rFlElUFzCwBCicLhlbIX8=; b=
	Ydm+lSya9Xmylj2usKK9lDrZr1XG/0oTkb6A4kGwmVXyyxdans6cIkHdxyiVerPk
	8D2CHRJgX6Vvs9AuQTMnS1+o0/Fhe+6slVyZ/6VDMvOpFLTRka8h6Vw+D1YMcw3R
	CU4/qFLopdZc51i6XZeIZZlZTyXjiYX7Ej0Z6loXkBBB2EMdg8bMN0YsW2Lr+spw
	mTNk0/buuSm0pwDBHUopdDsEjtLev7zhXZ1qRcs5ohwBuwyfT/7sqH15m6HQXf66
	puriZvFjGJNA8KPAOEXW9qBQ90O3nMnn+5lqL49EZzKn3WpKfmUzwyArbe6t+/eV
	nDBXW6r17i6AXuTbsW/7MA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795747440; x=
	1795833840; bh=CVnqOoOkJj2EsAGsWHK+Y0rFlElUFzCwBCicLhlbIX8=; b=2
	fFEHwJm100NQSl5vO1DDYSJRduyoXFwYhugVlnB+oEPZu7FaCg3pd4ru93rfh04p
	GSgU0p70Mi9sHR9N8V8hzdywqRCl13BDiQBaJNeekerYp6DQbYY+wrdqK2EVCCtQ
	sKiBPL95erPJv7zz+9HBxAzLRBwa78uppxkgWhPeY1CPoo89OvOF8rnDM6X6B94d
	c12uIaE60iY9eKTDrR0qOnkVsKpTjbm7wdLMkTn8UFV/vQNNXzeepj05CW5Dbgh4
	5yHxZqmcS/zxoCoVwDQcaMBE0XsKD4zYvznIcSW0PL7VLwvTubB4Ot1LYFloFMQy
	L+Q0A9/SiBGIYfJ/FM/8g==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=squebb.ca a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795747440; d=squebb.ca;
	mf=PG1wZWFyc29uLWxlbm92b0BzcXVlYmIuY2E+;
	rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
	s=fm1:rsa-sha256:R4BYsnXzcOxIpnPc5bsPBxRMHCgFLp9CfVpjUdk7Dq2GCkY
	xqkcl7NTRbK+QL8vijSLueFELRBmmGzqu6sp3jfOSOpxirXIIQhPt4VNwmNpohrB
	M+MtFil8qM+FPrhxYZUERwybvYvqncksd2+WwU4Tbh/GDztTXfqdAREW0LtvI3MR
	Biv3Cr4SRdFl7nYWSIAaCOHd0pFLRKZFZ7u9v7D57PDp+gUvygQLRB6A7Pt7Lrbn
	tRE/MpU8VTwBa3hBB7CJV90XTMINIBeBs+foiyJ+rYxoaTF/VErKwOUbrPd0b45E
	xQQ392TVvRWM07NMHv1fAx06cDXX8kL3Bd/mfKw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:/PThXyBYxTwqJxTEDKwMFV69hDz2y+WmJCzo+6Zny2o=:brwl2WodWDhUqgbz2Z35P6vdZwEzrHbB2tELdfsbxrA=;
X-ME-Sender: <xms:b-4IawXqXH1JvalA0XMqm3sGMYdWO05S-CsxXsB310rpmQUYpjJchQ>
    <xme:b-4Ia_b1-shlPb44V9DgZKVRoJzslowL_w5saiFo7WZZbGv5vBJVeVB6zROWpzucX
    oRn4KAwVHVEYHIRi6oVOtUZ2RGTIlhnd4SjnXsoRfJXvlUMxLbfIwAq>
X-ME-Proxy-Cause: dmFkZTF1gvqMFE0LYV4c2Rn1KtL0KfjCFOFae+Zpu6NlsCF3RpRf4YLVuCkDG/kIzovK4B
    PRgaGkGUk42gGx/PBINnHgyVNBhoFL8T4DtsixBfGmXyfFMXxluCU+EGqGOg1eSnTtcjqY
    ABMLV4JB5km2PVBNoXRI2V38hrTXdznMU1fKWuC/O1vXg1itZasO58tTZIYngoMdQuj5XA
    W5FXmI1eMrXlYsEJ6Tbq/+/CjkYWdeCZUFpsL09kvfrZIV9ZIec34HiEPP1pU55H749TiN
    JCT13F2o2yXmf+sh7gwzP092PKuZxoT37lLXYEFnsviN01wwCU68Wh+4LuiW67fNBr6VMG
    XzTbh623vAH8HiBEbxjP9OwRigYVtAlkq1l6k1TQOXQLRgsvv0nSsZdTgHbtmAFiSEhECK
    JIbXSqgW0jwdBRnW2akhwNHQfMk1gVQTOD1dbh/qBnKIzDOYo1G6C8iVTQjKioBwfzf5HQ
    mOG/lXyFWBogirbomwIKFx5CekJ9UnleGrWt4EfixLwaDCglKJZEJc0hwfgDLFt6nFwYDX
    GtLOLoKnoXX5iyG0j713usSdX7C2Ev+FZtqfAkRwSbJF1IkTJmRbsqHkDurjX5LuTgVe7h
    oPD0I0w9Tl82B/A7no0UkBAdoAQ7BucWDlcfTzAuq0MFbbyvnG96J+WT6kEQ
X-ME-Proxy: <xmx:b-4Ia2i65O1dfWjbGFRRnRWEHzCcjpf5Op1_3tftumR_ZZQDYEGlGw>
    <xmx:b-4Ia9BFv6oMuoxi1TGXlJUXxcwGGa9UX0if4Pn2u125W2ny_g3ukw>
    <xmx:b-4Ia44CqtsGlEAMcKAMM3gpCc-fqPa9LpDbKv6u6R7Jm-5uZ-A6Iw>
    <xmx:b-4IayG7CIdL-GVtz9SybCfQW9ixwDcfK7bNd3zizA2LcFYFQuMN3A>
    <xmx:cO4Ia4ag5jKzWsUXSf94hro4vnM68ghrJdJluZ0NgjyjcQv6-FLWcFwc>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id 6D4362C00085; Thu, 26 Nov 2026 21:43:59 -0500 (EST)
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
X-ThreadId: ArXiMeOh7T0s
Date: Thu, 26 Nov 2026 21:43:39 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>, "Rong Zhang" <i@rong.moe>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: 
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Message-Id: <2309e7a6-d918-45f8-86db-49eadcb1f2d0@app.fastmail.com>
In-Reply-To: <20261125-thinkpad-acpi-hotkey-poll-v1-1-6dee57519c2e@gmail.com>
References: <20261125-thinkpad-acpi-hotkey-poll-v1-0-6dee57519c2e@gmail.com>
 <20261125-thinkpad-acpi-hotkey-poll-v1-1-6dee57519c2e@gmail.com>
Subject: Re: [PATCH 1/8] platform/x86: thinkpad_acpi: remove early exit in
 hotkey_kthread()
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Wed, Nov 25, 2026, at 6:11 PM, Dmitry Torokhov wrote:
> hotkey_kthread() starts with an early return when tpacpi_lifecycle is
> TPACPI_LIFE_EXITING. A kthread started with kthread_run() and stopped
> via kthread_stop() must not exit before kthread_should_stop() returns
> true, otherwise its task_struct can be freed before
> hotkey_poll_stop_sync() calls kthread_stop().
>
> Remove the early return so hotkey_kthread() always waits for
> kthread_stop().
>
> Fixes: 01e88f25985d ("ACPI: thinkpad-acpi: add CMOS NVRAM polling for 
> hot keys (v9)")
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/platform/x86/lenovo/thinkpad_acpi.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c 
> b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> index 1bccc21ee29b..a586113ab1a7 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -2451,9 +2451,6 @@ static int hotkey_kthread(void *data)
>  	unsigned int poll_freq;
>  	bool was_frozen;
> 
> -	if (tpacpi_lifecycle == TPACPI_LIFE_EXITING)
> -		return 0;
> -
>  	set_freezable();
> 
>  	so = 0;
>
> -- 
> 2.56.1.839.g22a8290db9-goog

This was implemented quite a long time ago :)
Change looks good to me

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Mark
