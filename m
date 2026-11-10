Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794343190;
	b=O6cUCUsVjNGwq2R8ESwa4Hg1YIzMJKNN1TUY975osRyfAHLg3gnkkNRg7RjmeAKtLVzo
	 kemp//SC2XmHvqugUJVjp1Enf6N6v3cujxjW46IMbJB28IfCojUl82MKvxfqOqyABDJap
	 nOxQaIa09CWGFA23j/ilJoEquuvL9OSYJn1e/RjIJYm7i/T4VcVvZB2vX92rjfJyAKhpH
	 1XmPdNCIlhPeJNhpt60SpSIofl+cLceRAEy7VZsodUZmigJJw/e63vTl+thZLPgYb3MJS
	 PtEm6S/jz+nvgb4JhF3LCwLMcDA9sUJ13j/1vc8igUOo1fW1yRhkpYDJ2SlE7AaqpWw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794343190;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=J38IOBfpsPbN5SosP8YUKlgzemikThjgLknjw6gg0qc=;
	b=pEHsCTSoRfWuTtgZRhzZ3g76RoecgMoPbz5vcsti4z6FvfMki12+YlDf8vW89HBTE7+R
	 5Asseizsv74AYNQ6PPR47N1GVu3fOKnAhKFMWyTcrTy5ePWNz8htRlGOfdjQLwFRm4d6x
	 YUObnB26zsmLmw0IcDDhNh2TdmZ0i7PZ0OimAW+H1oc9+AWXe2/PSj6R7ftgAyJriYGuQ
	 ncSWk4FEf/WkhtKXNz8W0nE9IYV5GWGUfvDpTGVJ1r8390CfIJWZrwewyOJeh4VIKw7Al
	 HbrNwdz5ZApLz5slElsHNHrZ3seiXYOB2ipISUTUvxVx6tass8qGXG1zhTOjOhTmppQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lH7jYkYk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995E7606A334
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Nov 2026 20:39:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 995E7606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lH7jYkYk
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1b3acec6677so3833739c88.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 10 Nov 2026 12:39:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794343190; cv=none;
        d=google.com; s=arc-20260327;
        b=oQktjjPdt3wd4orve3DZRXBfsGgT/TjGmUtqCWOZgxhk6buyZIeeMyXUErOZ6hQwB3
         WiT2o3uH3cd9Dxc9pLo8B2V/8JFw8RoDsDu6w1c8XBz2Qc/bfRBC22zG/mm0PPx6SlNj
         f/gwpUXS7MIrTIwrNR7gRtFtPPxRk6ztX1RoaOA69dadPfLIw0PFGQPxAnKTeGzWDq93
         6kT+D7dJdSFBhIC0eK08Gm7VtqIcBZ/2YO4Rhyqix+tBJTOFogVY4I5btyK0c1eNU9Rt
         C1+H309LugdQd9rDS2dEkxUHxGDG0G16IjaQbVfjmbTENHoej0RX3m+1NKJZHo8FxrMq
         9b7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=J38IOBfpsPbN5SosP8YUKlgzemikThjgLknjw6gg0qc=;
        fh=ZVPus/FQFutf8zDkEFKI0uM2qTPl720JHbI9+FJYnJc=;
        b=BHJXAYuwtSaMEI8OJ+lKMJD77iMBJVA6rkN4H0xDTcr0gky6D8fyTBRnEGubzC32Zt
         drCbqLiCdnMVH5/y2MB21zyWtCKytXI9QkpbCUfR+csZLuzOxdq6OfRs71n1ImMb2rpL
         exXUBNkU4sh6K2Q65Kl1G8y7AvHhYCtxN5zaUSJfR/B4ZJsJUXFAvE/pvJs9tK7H0rx0
         AanSGUNrCrDfFXopqe9XSyMCuifyRme6NB10uUH+eouOCRjUqqAOsjPZQFkiPnv4+biu
         tk7N4F++2eikWmlqnVhJGkfcO4g5wY7PRwg8KamppLi/SqnhqrArdl5sQG+q8ckrRljP
         m5VQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794343190; x=1794947990; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J38IOBfpsPbN5SosP8YUKlgzemikThjgLknjw6gg0qc=;
        b=lH7jYkYkBit029x0XRy3Vqjq+pQpxwph/zmx39p4QB5e2gxZsAaIBOWYNIulvCLWHu
         1gy77MPNTdsVkefpb13cZ0OjlxXJEF9djKNdAO4XHcE1bSAjSQG7UZdHP/WTcadu6BS2
         0WoEbeoVxlmmwu+eloGm1uN1NAgCEuT4BkvCrCzshIUpPSlXTsTT2DxbabT8Wc4O1Q8n
         pTtgL8PRLolm+oA1UCnMyGACegbuFDI0JzY7mPKzebj651L3VAQTPJBIX2UvYIynC9il
         9hmHgqZQ4TQd6xWxtBl/SwrRyrJ//J1nBerAwlnt55xQo1LSmRHOBE4txl7pK9WwdSxu
         7Jmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794343190; x=1794947990;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=J38IOBfpsPbN5SosP8YUKlgzemikThjgLknjw6gg0qc=;
        b=HYUP0DQMISxs9U2IbTyZ7Z05HfYIT0JA14CBeozYP6lMHLy+wrwV97pko8aq+8cc/3
         TaSU6xkXOsBDZfwrGWT6s7GfqQPMaVuYECvuBPrq84z6d0aDC1pF8yqOfl/0P2grR0f4
         C8Sn5+RJTgCXA9+4A8j5v6SHzfx02HSN7GZ/6qUIYcr9quNq9NUDOUOWxTdlrib18nwQ
         L/oxWOOZl57IdlsCFallIraOiO1FrTmgYNoSBJ7tFQUFJrx29NjL6dUj3UDUYhAgZxl6
         ufUVz2t1qSmUbULHqOF0Ok7dbJYKRNlVry0n0VLK51/XmUo9VpvnLXlpvKi9cl8Mj3Ta
         rA2g==
X-Forwarded-Encrypted: i=1; AL+hErH336hkmXqXzuh6fztKGfVgQ+fb9utNDzoB1CDLyioYAyxlSkarJ4TYucYi3AfOd4i+fHfjdQHlShU+oS5oeT3n3MVJ@vger.kernel.org
X-Gm-Message-State: APuU4Z/MRZxaUYHAVEps3lHnvUTx8T56rkIGLkQJ9DLOvvM8P+7eFqj3
	znXlPHcW6qDv6DClIheemkSaY4LYsqivqRhQvl6mXKBxf2+sf2SnEh3fPeant+mX4jp9Cj1aRCs
	EuMIYGqS3aP2A/wGQObThx/J+/nCkAOU=
X-Gm-Gg: AYBFou3x+eJk2J3ViXglG/HvtAD36YbEIvxOoD6O4entScwBUZ3OCSC39I/zO6t/jwF
	69KCVJnQxgI5GwziE9YHNoy8dKaePgjlYTUvs908HhQCmKbu6kkqLcDBROmZ2BchR/b5tIwqQaX
	ILtKIQf0Khy+0p0gjtvYp2zaLYooTp/N6iTza8l2+2sL85dHT9F4qKn9l5YgX/dP0a5RgGgpMZW
	mnJPf/qo8V2mXh0q6qLJGIHU4VEDclxFjr/UOAJxqndFTAuz3xbtYESy0mA4caWFBuxcdVtYVnq
	r82DRnzBbFlLdqZcMndusXZiPHBKHieTd8LoF0av/eBXe7Oer8qBgQ3thWtJdEdOJ7Bs+1BO0/k
	gJIRkH7B8cm9j02LXFCksyv68dXpEwmdI8yTY
X-Received: by 2002:a05:7022:1404:b0:1b2:366a:e7d1 with SMTP id
 a92af1059eb24-1b3c033beaamr5801c88.32.1794343189620; Tue, 10 Nov 2026
 12:39:49 -0800 (PST)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-legion-lighting-rfc-v2-0-845726afb71c@gmail.com> <20261110-legion-lighting-rfc-v2-1-845726afb71c@gmail.com>
In-Reply-To: <20261110-legion-lighting-rfc-v2-1-845726afb71c@gmail.com>
From: Ciro Pedrini <ciro.pedrini@gmail.com>
Date: Tue, 10 Nov 2026 17:39:37 -0300
X-Gm-Features: AclHuK8ISHGBV8pjvWEvjIm6puJtyLzBsHrXTVOLHguQpEvun7kCzwgFU4q8l9I
Message-ID: <CAPKD0Hfao7drmVg1UFVn6BymFync8dP4LK6DpVgtw5SuSA6-3A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] platform/x86: ideapad-laptop: Ignore keyboard
 backlight hotkeys
To: ciro.pedrini@gmail.com
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Rong Zhang <i@rong.moe>, Ike Panhc <ikepanhc@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Werner Sembach <wse@tuxedocomputers.com>, Aaron Erhardt <aer@tuxedocomputers.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

Rong acked this patch in v1, I missed carrying it over:
https://lore.kernel.org/r/4d0153a209a7c54ff513eabd3fd87445269279f0.camel@rong.moe

Acked-by: Rong Zhang <i@rong.moe>

Thanks,
Ciro
