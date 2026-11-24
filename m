Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795561814;
	b=q6ppoL/tAEyzi3V62i9ykf9h1vXAEATgtx2hLsZtZa1wMzOWQLew9FOP6ghPTDVGKquY
	 JPcMFQHsPgoHCJJCDAfw5nKm7bSO5yIN19YudDFw7rPEHTt719DVnUM19Srew6kxtNE/P
	 O3WQzY69sTNrt116NvipWO+En2kIkwSt2TQXkWFjPyaqOpywXvBP09u7hVBTQaGUBDkuJ
	 +1VQTd0Mpq9HfZ3Hiq/MrxEm31wkbTfEz/dr4srTyFrhD7Svg/7wlf7rXQ/C52Rq7Sz0d
	 fplhCRNgOFTilysAMQ7hogwzHu+jrnQyW0mfvbjp4bPszWZSMMkMmC25Bw5tZosbyCw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795561814;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=hn0+1PqSwIkZe/gXF4MljP/J7Q+abXQ818LN43GM8lI=;
	b=36E/2TU3RRkEnJjDvsWmvoDMsEr47q76TRQk6Jd4DsxyZkxa4Fp/6UxMOuqWjzwzjXRa
	 zZc+RNxFgdK8j+h8vNgZnELGElQpk3FHBDESbd//vXxdfbJVx7Lz+sflLral6tYiZ+wdv
	 Z9y2F54Zf9Fnv3M8GMLqpyB1HH76JMZKCnk/geerpVlnG9qKSzMjeDLVZ8BM2y1ZnnV/P
	 Cnczs6mzdsLDccocNJ/t/7+1XsZRXFfhbeM8Jpt8EFJd+KJbJaophC/MldE5BGUIe8zet
	 tYgFPTSZmTtkpaiV7jtnpZxRTc2SJr8ZDZN9xLHctpYYrd/yXIVg8Xaot3yv3ZiMUpA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KqttAE0+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.49
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C275C606A31E
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2026 23:10:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C275C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KqttAE0+
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-67dc7eb1442so5686621d50.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2026 15:10:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795561813; cv=none;
        d=google.com; s=arc-20260327;
        b=RdpnY805jRtEVzCoXsvPSlu1kFpV7P4eGsA5SUuC8X0KWXAVIkoM44xUuV+MQCjs+y
         Nu7/gKhn7x2YUIdI0eDr9zWi3sLzKVv2/ZUs+5/IzjBC2RB8zdjALch8bz2rAufZmkld
         JNe7bfo3MWU5133KjZo50w+T37Ap+zywX61ZDuCMS8p6owaz+jqTeOQLbq2DG4eXLWfZ
         lQfNPJvBYunYA7GpMdo6GdHywYpCMMsVZnaxBarJjIWdHp2WIGFxTC9kLr2xjQYMvvKQ
         qROB9EO/g3HLPtETbi0Hv2p4hFJkSKcLAAAHUnswOA+6wZZr7LAzRd+V2xZaobFoZi1l
         Wn2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hn0+1PqSwIkZe/gXF4MljP/J7Q+abXQ818LN43GM8lI=;
        fh=y6coeIYO/UQA3ubkx6z8PXAwQYL8p7d/OWwn07Ubvjw=;
        b=HmsCeFB3RQpDJ+kQU3he5Eqde+EI+ITvHPqVbY0oQnFcDvbOonEszGenAtac75Ks5T
         /TgivjOjdNBzYFQ8esGQoVhJLSwaGeAGdsQn+k5RPuVwn2mv8kBLj4CCdGJN54uKzQTr
         7j62N9OaiOPfvv5Gm+H+r3lI8QLAvZDTGcFNckUgafDililqTAlWtprgSTDzl6sl4v+W
         hKd49XEM6yrq+AKfP2chdN4tQ029i+US5AJaA+HxmJd4IvjQUlgfvsiOcHRG3WskkdMw
         uKEq0J4hb+Yxv5pkTOf3V8kcBjYyHOLd9js2VgzFmutaDR89gA+MnlS0WQi4kuoyeK6D
         I2YQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795561813; x=1796166613; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hn0+1PqSwIkZe/gXF4MljP/J7Q+abXQ818LN43GM8lI=;
        b=KqttAE0+RPgMGy4Ec6nastU4fvOf/z1FAjdKUOukGbEfSDr1fQxtw3U7bCgUbRiGO1
         xo8l2th4c4sHFl6cU9hBW4yAer2w5B4qOCCMrM+wIlkVraqoq6n458thMkCBqjWGt/S4
         +YWZrqQqKcMXOdEeVHCoOEICIn9DQNhLPQ/ugHKKEzHduRfEdUG7pGX0+KUQ2WDId0cf
         1QOVMTHB1vYzRw978mWBleioSjGxnIhfdudhCNcUcEzoGMJ+xau/4aBmA+OSlDkTefW7
         A4jzJibC0nnscLjg3wiR/DciLHZCu5dvuwPMvQcQpMIp5VphmT5/+Ij6pcb6sulG3HmA
         DCqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795561813; x=1796166613;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hn0+1PqSwIkZe/gXF4MljP/J7Q+abXQ818LN43GM8lI=;
        b=UZVmfLP1NxiJ3P0Hn+HxF30P8uGkx2T2C08myk7qt9Xjg1V4gn5F6HetZS6csI16MF
         IXkwPa8vkrnaYGiHlVkmNEvO62HMu1mjTtFcrMHnoV7iw6HU4gtYnhzWmrGVFjUZC5Od
         e7r/VDlREBjODXaKDv3IaxbxSMQxTyu0mqrtSnlnLQlhfhRZ9wv5CaYCle9u2X84bh5T
         th+VCS6I6sz6HP1GxSdT6o0Jo2bNwjvE0dcXfksvRIcGFufWwVlfaAcA6MNsKINbWeLP
         h8Z8LPZbHo/PUDbqaGeKvuyY0XUwlrVM9eeYq/N2szIdoT/+jIvmML/BvhbJQM99OZOG
         GQcw==
X-Forwarded-Encrypted: i=1; AL+hErEew/6zEJK+M29tWOT9w06nyJ8LScufd4W1ORaBhDLOy9qbdGQddnwOVhtA8gUYfBesdHaJ6FaLzVBBt2ZcV8293tDh@vger.kernel.org
X-Gm-Message-State: APuU4Z+xYPWpPWAPbD/USN1EJzDkVXU8WNZ4LDHiiu3vSdzOJeDqwEbe
	Hob9oI54WX8v96igfFjJHCH4CjCNrCPpbgkOX6bpRdBIPJLGon9g+Ewp9luxLUWxJ92pWsw34L+
	9cUgbMJd/cBiaKRs5KhvjQHFcStpCiMU=
X-Gm-Gg: AZFdTZfowGyO7Rk9O+2HAy3ghzmMoeVFlzyV0OvKwa3PSf4p+75gmTYV5Yis5KSmAME
	2Vr7IQwgie3ThMmA56kDSCejteR8rCu7Qa68QIkamg8uMtLcuL16bEk2umiakDuXDVOXhmmDF9x
	Kd7PtkgzLwqk94c9+N5SdZp0Hwu+UFX+IUcOVFDxmAYE6Ftoo4had/LHmdH7FK+i6kjpTVQ1962
	WH96Z6mm5euG52hgkqGL6CQCM+WYMcFOL+49TI3z+xXYlnhh8afTU6Eoxg8ImAkm+/0MZyoiygu
	9g9s2QstNyXdRJChGUam55WHMY1mtgnLuqk06MGYx0YFNbp12pfKr+kudZoTSzTLR5TqN6gfHHL
	vQquM9HtYa6kndJQjvWgv8/Yc/5uAi8a6j1w=
X-Received: by 2002:a05:690e:1382:b0:67d:9d2b:91c7 with SMTP id
 956f58d0204a3-67df443cac9mr7933863d50.54.1795561812707; Tue, 24 Nov 2026
 15:10:12 -0800 (PST)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAMnz_-Dgg2eCgZxcCaGuKPV=3-kCfg7ajd9w=vs2fGL-Cb6hvw@mail.gmail.com>
 <f1b7d729-771a-4fba-89c0-996a8a168126@linux.dev> <ce46d69f-2a3e-45fe-abe2-f643f683d09f@gmx.de>
In-Reply-To: <ce46d69f-2a3e-45fe-abe2-f643f683d09f@gmx.de>
From: =?UTF-8?Q?Riccardo_Zangh=C3=AD?= <riccardo.z.dev@gmail.com>
Date: Wed, 25 Nov 2026 00:10:01 +0100
X-Gm-Features: Aa3M54rb6RWkm-PuZp35gli3zHV9Wd4GPfoXO2Q-4EKdCSZqJ0SYAzQEUszz2PU
Message-ID: <CAMnz_-Dztuj3CRsxcVnfe2=OCB3tTJzK6Lu7-AKfkbuqn5N-UQ@mail.gmail.com>
Subject: Re: [BUG] ASUS TUF Gaming A16 FA608UM: working backlight device
 differs between MUX modes
To: Armin Wolf <W_Armin@gmx.de>
Cc: Denis Benato <denis.benato@linux.dev>, platform-driver-x86@vger.kernel.org, 
	hansg@kernel.org, ilpo.jarvinen@linux.intel.com, 
	"luke@ljones.dev" <luke@ljones.dev>, "ddadap@nvidia.com" <ddadap@nvidia.com>, linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Nov 2026 at 21:17, Armin Wolf <W_Armin@gmx.de> wrote:
> AFAIK Windows will automatically fall back to the ACPI backlight
> interface if the driver does not provide a native backlight
> interface itself, so this strategy differs a lot from the strategy
> used in Linux. Can you share the output of "acpidump"?

Hi Armin and Denis,

Here are the acpidump outputs, one file per mode, taken from separate
boots after switching with supergfxctl:

https://gist.github.com/Piadineitor09/062d3327731e5ec38fefcf5ae9064a26

acpidump-dgpu.txt       (gpu_mux_mode = 0)
acpidump-integrated.txt(integrated mode)

The two dumps are different (cmp reports a difference),
so the ACPI tables do change with the mode.

Thanks,
Riccardo
