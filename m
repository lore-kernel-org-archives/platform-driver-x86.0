Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D91B3812EC
	for <platform-driver-x86@vger.kernel.org>; Sun, 13 Sep 2026 23:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789343021; cv=none; b=C/JrN5WJx83OYKLHqcPihmWPDdApPeGjti1T04ta+koueb3ohesjKzPly6ArZO2oBryIoCEpr+/Xw6D7TXC6mXFvs8MKneQIqN8nv4eqeM4/LX8IBv1nuDbfQz/02Q6Cxc2AvW1XEnkshLl1njGuyXjhzlhfyeLBuPEkI3I0U/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789343021; c=relaxed/simple;
	bh=TGGP5vDECq/Xl/WfGYZwIHMNEj0w4xAP7L0OAvtyAlU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mkx8MLrZt/qUSY0JJglS4m9U39OeqpWqlLqP8987QvKngZM4+XWcBGNh+uabwAij/thCi1v1u7OKISYq3jO5UhkoIAEqLnvF0FGCvaRgVNj21J2jh4MaDY0GNt6NMQw5rQGsdtkmpHzBG2tNJ8UwVZ5FiUN7P0D+BApmI03IJGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sdeyyKq4; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sdeyyKq4"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc4902427c1so2081887a12.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 13 Sep 2026 16:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789343019; x=1789947819; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7YpDiMYBWbrGICLnZR7JkaBnJhbaNiNwzWG6cuCu/dw=;
        b=sdeyyKq4kOEP6CEFfX8urJ5Nkt3LJzefneVZ/qHWXVjbM7Esm0BI0aoUbOo3U8FqU2
         ND55thupTvfbvtnBChcoBfWvF+OtenvSWrfJehJEjH4/v6ns8Po504ikkKA7Lu6J7zyf
         opKP4ps1EFZ6ZC3t0PtXWriz4c9yUCHO8tqC/QY5dySw3OU4sgWHXDHson54SvTIPfwf
         yG88m3Z8bKHRvFzKEPxNJ/N3t9AakEx5f76ikwk9kmSWOiw3xCa0+yyQ6c6NwT+DbrH7
         t0WqZFWTxNZDEgEqzEsAtWLlvJZb1sgLmDpjpmW0XC7oGCoVW/Drks6GFyBuIgaEbb+R
         /c8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789343019; x=1789947819;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7YpDiMYBWbrGICLnZR7JkaBnJhbaNiNwzWG6cuCu/dw=;
        b=QGQVe0Oq9En3lNFcouhE6So9fA0dQewFShwPQDVkak+Alg0YM5a6w3QLB64VbLxSa5
         TSw59XJKN933pWgENY/LoU9PsJ4o2/jDDoW9sSQElH8CJwrwfY4lWewlWjOsJyriMhA0
         JWOiGF5eX8gyK7hGmdfA2cBvGTC5aX0+uHL1Mg6E0U4R48JVKFN6Z0Kz8LKNEx5ui04m
         GUch6yml0ycA44Ko6LOestqGd8Lfp1Zg5Mool1XyKViDHkj7LyExoXJZHGjEO9W/mdx6
         bIjH6AgEFWtkJxD/erO9S87PFbgvGi39O29wMZKPrsNHfbY2INYry99OzFXsXHGtHvf2
         N1kA==
X-Forwarded-Encrypted: i=1; AKwUvBw6OhaqRaYhFK5CPSR4T7wiJN+SkEnxe1DIEcZwiCgLJMGHotamnNghzz5yZOkR4sFzwCePp7v8Du0lqQkbyrAPTuG9@vger.kernel.org
X-Gm-Message-State: AFuF++ltsGVeFOItYm0KVqZx0/pEwbLEqQaHmncuDOpm6gf0+xmf+wlj
	kql5uo6jYyIfeC4GzfjfhEV97a+McJikvUQelLmUNPeHHgQsRzRRagCp
X-Gm-Gg: AYBFou1lAf7unQ6mZBDM9COVe6OS19LtsDzdBMvVPaAsdPsqh9xk/OafTswbAXQi5Dd
	axzraaiFXi4TRQSIc7a3MZz2NzxmefhDrs55+kYuNE8xZpREIlM/77AhV5jRy3MaSFN7o8xCV7T
	0v7+vp+/cml1F499Gm8OLBYmmu/msvO22abSXmoIIx5awf/yp7Zd1wKxvjSRIihNm/0lE7RzBF4
	67QDLixj5uCsaQ8CYYHU1ffC8a+BB19tzaXQZw7sTUPIwv8JsQBqFIwCQ4ef51S5yZ/1XZJD061
	kGaS4GauW8DruLleE9i66KfnsDtxAvZ3dICdT6b5KUltuU7dSXVAD82f9UDVsCAdztDfUxkEWVf
	jO3TMSPmLB83aMa/cQ7ZLnrutWOyf6kWu7OefIhwAN5lCd77lfRwla4VFUHwppzx1XO+0G46lkA
	4u3+hDb36pY3dEodfMA5bu5nJIp0dL5Hp/LY2cNx+xc/NTvssWnc9TktpwN7sbKciLV1CDxLMrZ
	/+B1VmEqi+9pDtBWVnEx9MtPcg73WWRxfCulDvdqIZ4C29qQCg=
X-Received: by 2002:a05:6a21:710c:b0:3d3:aed2:6f20 with SMTP id adf61e73a8af0-3db26f09602mr5089042637.20.1789343019541;
        Sun, 13 Sep 2026 16:43:39 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:a739:376c:7eb4:ea2d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bbeb053a5sm9666678eec.27.2026.09.13.16.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 16:43:38 -0700 (PDT)
Date: Sun, 13 Sep 2026 16:43:35 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	stable@vger.kernel.org, Sergey Lebedev <lsa.uz@pm.me>
Subject: Re: [PATCH v3 1/2] Input: soc_button_array - fix MS Surface Pro 11
 probe failure
Message-ID: <aqc1GgNdo-CccQpD@google.com>
References: <20260909093934.29411-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909093934.29411-1-johannes.goede@oss.qualcomm.com>

On Wed, Sep 09, 2026 at 11:39:33AM +0200, Hans de Goede wrote:
> On the MS Surface Pro 11 soc_button_array probing races with the GPIO
> driver probing. If soc_button_array wins the race then gpiod_get() returns
> EPROBE_DEFER, which should normally take care of retrying later, but
> the soc_button_array code deliberately ignores EPROBE_DEFER causing it
> to fail its probe() which causes the volume and power buttons to now work.
> 
> The ignoring of EPROBE_DEFER is there to deal with a problem specific to
> older Bay Trail (BYT) and Cherry Trail (CHT) tablets which often use this
> driver. Modify the error handling to only ignore EPROBE_DEFER on BYT and
> CHT platforms and propagate EPROBE_DEFER normally on other platforms.
> 
> Fixes: bcf059578980 ("Input: soc_button_array - partial revert of support for newer surface devices")
> Cc: stable@vger.kernel.org
> Reported-by: Sergey Lebedev <lsa.uz@pm.me>
> Closes: https://lore.kernel.org/lkml/20260830141355.55898-1-lsa.uz@pm.me/
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Applied the lot, thank you.

-- 
Dmitry
