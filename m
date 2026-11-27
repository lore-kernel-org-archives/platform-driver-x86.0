Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795742188;
	b=gEUUkZn1TGbyntM0iqjzTPlmVEKwc13XVvetE54x7kY2vktdWp4RKbi4UJ1h6k7h0+16
	 TAUxVZtEqOFEvx4pFKDT5NyxwO9W4RV2TAyN0KVHVJD4EmFG8giQ/45ndJsJeUEWkem4p
	 Vk52wWpn5aTDa9M/UnzBaK3nkFpnS4+tIQ+vHABJS91YFd30sgwiWDFnnhBnDErEl4NDl
	 Izp2Dd3eT8l/XJfVVe1fwsqPQmvc38a3O7icDTPAjH6h+TPbDLsgwp+XLeKkPMoCTagCo
	 Q0dysmFwntlUUq/tm+gmU7AcBUJWob8KCV680hzuSbwxZI8g6+hM4xJ3M58ukmshNTQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795742188;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=oPod1KuFvBWGJsle2l5lTHqLGq3m5KHrsHkxQ2HP+ns=;
	b=aKDVo3uJ3Q2xmGRYj8PlEgrbTBEel3jM8gCXbddBuHt9itvMBLmqjzzEc9IROi9Ye0uj
	 R1YOlifwmamVy770bG1XWGHmf/PkJs502VDp2LzSQ5iTZ0JnDBC8AT+44A8a7Nz0cul3Z
	 RhoB6JvMXPLdYvGg5wxxN2JEPdw89ffjO0Z1+0967oeQ9Aut7EQDIBQiBRwpXyFinRNOL
	 31q79EZL/1jinZaB/af9o/Ah8nVZDKiQ7gxNUjVYAxym4Ac/a+Ih7NJrVOM0PFy/EpQdC
	 3/aR6bgG7/k9JLqAkJpybznPqjmLi138YcSxK0DLRvr1ogTlxo1fTHODC/GhDyn8iCg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yjACiQmb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37528606A326
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Nov 2026 01:16:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37528606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yjACiQmb
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-15dd124bbe7so10960722c88.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 26 Nov 2026 17:16:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795742187; cv=none;
        d=google.com; s=arc-20260327;
        b=mG4RKUbINny5EKRb631w+Ubm2z/xkevmmleiFNtbPm7JNNgCOfVC/84z39Z3i53/n0
         f1fu/+CFwKLl6rmFRhLYK847ZZVtPdmQ0k6KebNwnKwGQl34tPjNLK6E6hb/2hLaLhrU
         Hi/Yyb3ctZ2j4ZwtoMf4RHIC5YmCaOsX6SRZ4mfmrSYcX8T/VdITRmdKxzzls/JiJEfi
         Kkf/8mNA7OHkpKQ12ZE87oOA800VdCAWc+teIPigdeMbW904yr0pXBHeQJVfoeLZmIBL
         DhVH0QEvkYz9PPlKg36fpDsA5pIRjrOTChkUi+yN+J9dhgJ6MrsjM0NKegogyx+//uln
         C6ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=oPod1KuFvBWGJsle2l5lTHqLGq3m5KHrsHkxQ2HP+ns=;
        fh=G37UT4lrEnsKl956XIA0p+sj9CVO/pZt8YhL+ilxdws=;
        b=EHTgJcr3auGOdxdPNvzZVBBBKaktyj4E8aMok8DVvk0G/DDdlSWooTN1qd9d7M5cTC
         nrUMPr1G07xXSD+qh4jfY+Jpb/moqT2rXPE4O/oZERD0ZU6bHS/D3u61tzX4tyzP5Bgy
         jton6cOToKJJIUsm2BHQ5k2y82n8cEw1ocEC6PGo4oXfZ7K4HdD8iDfX34B6jZ7WBS4Q
         NNfLkKZWVuKX2UpzsM7UoGMrvfSSi9V44y7izHbdlpnVlkvP/9oplbX0uFO1FBifZF1J
         J6uXsfIDf4qTXvPcKR0NZKlHbVmpQFMYSzjhD7n9P82DHQoznPlurIlEglnOHqmeRo+m
         NZtQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795742187; x=1796346987; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oPod1KuFvBWGJsle2l5lTHqLGq3m5KHrsHkxQ2HP+ns=;
        b=yjACiQmb/PKrdFqXS/mutr6kBPsP1vGmCYqLSE97eXboBzbviACN/BujKGlE7x1Ndf
         mQOozTdjoXimTbRYLMcxVD47jQiA8hZkiQOi0P4Eb6fZCfLIVHeyY9KUC9NeI8Mxk1zU
         bSQihymHqpiucthKPUf75/FDSQ83Ex6n3rizJzs4qNkLXnDjly0FppZsFGLfjU6pMT87
         nqIa24UonGOBw/vVYYr3lRkdUvgjx8FegLKMaPkb0KpNwHPqCtP9pgPmMrkfA+MTFHnq
         6mvNBZcWpKrM/ropu7l4jcZ3beMOaA7D1bMhEfU5kCfi8ics0H2RAp1I6fWJJZAi0b6g
         WqFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795742187; x=1796346987;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oPod1KuFvBWGJsle2l5lTHqLGq3m5KHrsHkxQ2HP+ns=;
        b=dcQhHA2G5RNdrppVaLxoJ8GM5trcnPtteYS02vJncHE7UfBKNl+tmqM6BBEw5iDRSt
         cGI3SngMwkZvoVNbZvnGPxXO8aJlzLupMQXptYW/w7xmOxQ6MdKh5nC/R/jhBzZ4jv+m
         hWpEC6sHFcVTW94Vn/5a5/4nJQ9/3eH+1KW2ti23D1uELE9pS9fpXVu6IXyXp/sp5yLl
         o4CBVeI9xN0mI1if6x5oQFDjM6NpzaMd0x0C8R91Ua7qh+zuhNtezaGZTGIme7wzkkvz
         sv16ZUVsfyWt6AsLovjqty/nJMzqx2a9fGMe93Dad2tzXOwrks9Wk7y8CRINRSxHnpAY
         Lotg==
X-Forwarded-Encrypted: i=1; AL+hErHObA1XhGYiFOrogYR5Ojrj3/stteHVtcAGILpqHpsHZu2PoDr853hSy7CL1s6ueCtxNABxb0aAJ1sPJscnQr7cSiEg@vger.kernel.org
X-Gm-Message-State: APuU4Z+yveb4DyBi0s7zPAmurqVb49yIFc3ZxqBFiu/47cFpIadrZP9L
	G0kLpjh4YB3y6bLmgVrVbdANUwGxh7b9Kwfvclcfto9utqlKXc7iWy18eQwg9GwpYL1gewQwOMi
	ba/ygZlBx5LYMXcCn7CublgW+EZJCZ8U=
X-Gm-Gg: AZFdTZfH7RCx7uJ1SxHyr2VU7V9U22WR2unajyGJ1o4tWeMj5qbu6v7wcwWdhERN0p9
	FRUa2vB3AlLKbgGPt0we0zZWcFyCpCaUs9tuyaNM8BNKgJfHF+JkUwbDxRjDxTj45ODCPPx7Mh6
	AfZlWWpKsFZN7PFxQyQ/c4KpeQfouCxcKWYnvfynAwosFK1VAG2gIo+5gbhoUZv9dGDPlVELYAw
	iFHUUr5orEOYlewdXE0ZXO5n9SzDyyMWRL/IOO/nmKPmMPEjNOGS6tBvTlAeegzmnYMW5V7u9Pe
	PJablXv5mfVEfMkj7QiBM8WIrVPWRAcnPFyw7/aifXKQpQnLvjrUiXc+/+qWu3lK8ZY45iUN6iY
	DJpD/XlTfACJTdGAI0l0Ta4bQ+kRMvqTTgvH9
X-Received: by 2002:a05:7022:1715:b0:144:f089:b189 with SMTP id
 a92af1059eb24-1b55691a623mr20952158c88.36.1795742187259; Thu, 26 Nov 2026
 17:16:27 -0800 (PST)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-legion-lighting-rfc-v2-0-845726afb71c@gmail.com>
 <20261110-legion-lighting-rfc-v2-2-845726afb71c@gmail.com>
 <9002537db845b7a0a900612fe3a4a3638f06cd37.camel@rong.moe> <CAPKD0HfHuv4vKWeff_uhGxXosuU279qB+kkmXNPXJYL2kxFR2w@mail.gmail.com>
 <47e0364e0de6b9c22b21019d3d7e506defe58964.camel@rong.moe>
In-Reply-To: <47e0364e0de6b9c22b21019d3d7e506defe58964.camel@rong.moe>
From: Ciro Pedrini <ciro.pedrini@gmail.com>
Date: Thu, 26 Nov 2026 22:16:15 -0300
X-Gm-Features: Aa3M54om4nbMxSWNQWs_ctJIhvW8looc3McNT0nMJFNk8E5-YxztbEXgt1ad9pI
Message-ID: <CAPKD0HdL19j1CuTKJT2E0mQbYxkwPzX6=m7kmVx0ZLKp-mJ1og@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] HID: lenovo-legion: Add keyboard backlight driver
 for Legion Gen 10
To: Rong Zhang <i@rong.moe>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Ike Panhc <ikepanhc@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Werner Sembach <wse@tuxedocomputers.com>, Aaron Erhardt <aer@tuxedocomputers.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Rong,

On Thu, 2026-11-12 at 01:36 +0800, Rong Zhang wrote:
> ...though I won't insist if you still prefer kbd_backlight, as long as
> others are not opposed to it.

Thanks. I kept kbd_backlight in v3, mostly so UPower and the desktops
pick it up:
https://lore.kernel.org/r/20261127-legion-lighting-rfc-v3-0-15c55d9f15b7@gmail.com

> In this case you don't need the pre-allocated buffer, too. Let's allocate
> a tiny buffer on stack.

The pre-allocated buffer is gone, but I allocate it per exchange instead
of putting it on the stack: usbhid passes the buffer to usb_control_msg(),
and the USB core refuses stack buffers for DMA (with VMAP_STACK they
aren't DMA-able). Other HID drivers do the same for hid_hw_raw_request().

The short reports are in v3 as well, without the msleep(). The rest of
your v2 comments are done too (raw_command/simple_command, the
static_assert, errors instead of clamping, devm, comments, Kconfig).

One more thing I found while testing: the controller sends 05 02 B after
every brightness set, the host's own ones too, and also when the level
doesn't change (Fn+Space sends it the same way). v2 passed all of those
to brightness_hw_changed, so v3 only reports a level that differs from
the last one the driver knows.

Thanks,
Ciro
