Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FEE19C566
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Sep 2025 02:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759111450; cv=none; b=Z5QxSngkWhoqTVr2EAX7LPgc4OpwFxMfO7dJtwEBOe38ALCFLYGs9wbmJh81qosNhX99szJUF0cbqAtfW8YJ5IDfycz5iQvGkP0fwpW4VsgZWcuYn0OQjjybUSweLDPlx/qrBjLdLRFRX7A9TgRuaIDVyV5yXqA12IPQzYxnJoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759111450; c=relaxed/simple;
	bh=9ymXlgAUqmg75QM146TgToxqAsl7Qc6Pl5KLISzPeto=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l4959mdoQ014Olf52jDAt+NB20ZGKT7kKskkDYd61wgh13BMUHXNKPKMH1hyzEMP+WHmr3B71JK2GcZtTD4Kk26YKSY/A2g/H+LcuTr71HV9C+zPwATI7KFxRn9rubsrVnDg4Ql0HcWIjW0T5Ad5ALIYpvuSstmMNET9X1HYP4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CHC/0eF3; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CHC/0eF3"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-32eb76b9039so4784140a91.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 28 Sep 2025 19:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759111448; x=1759716248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E3MzDeDyhYq3R8OvxgSeuu7T6Z83NvS5x4rRCPw7PVU=;
        b=CHC/0eF3HHxFQvLvZpaXQjgH6+3H1/b59lEV6PSdlXKe/TnEZWItDNjPUieTlNQokn
         LjjEElNL+vV0MzKo1de5K4uqxjTHYllJQAjCTF76tpFKkIcP4xRZV8UQM8E5Db6uY80U
         ukD/NxxSY71sSWCHyONPeQE6ak9yXD8tgIrtHiu1V4QsHnUjzj2F4oMe/am+4ER9SLot
         Me+nwFpSS0MDBGLtOsoMk04t32dU4beGFryi/s3H1s1nVF6uBbPtDP8QhbpaWdhzgrOh
         6lMjcomZvrh95cIdTdhBWOnUZKqiYYWpHrXbv5h1QXDApa13pyqIf0SzgEIQrstpuotf
         Jl4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759111448; x=1759716248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E3MzDeDyhYq3R8OvxgSeuu7T6Z83NvS5x4rRCPw7PVU=;
        b=bkAhHEjTx8JQaiCoUUUNFmgjxlSPa52IS3htkTr0+NO+5MtrEKWZFPRQF5uoSB8IFR
         dvsBXtc1tK3Q39TLh1LWo4m4SEGjRZvSVTGVu9EOj1+5rDF75UCHfz4r/hY6Mms2Z2Gl
         mKOkJkvAeldLyxc/kkH/mRLfkQ/JP3hfNIIWW7HWslADbf5ayW3a7jhlC8kM72JHoa9J
         bVYN+rCJS99Ean966zDKzI7zpOBuSJ9FjW5hZtbsMrAYcNjETnB88TjIr/sGqKxpON0h
         AZdPjEFTAerIV5+JiHBe6C2CykyFA+Tay2WxhJJSGeTpSDxbVWRojkqVY425epjiBaHY
         xwjg==
X-Forwarded-Encrypted: i=1; AJvYcCWnyT575K+VWcnukyA2ab6mwX1DdwRW1rwvdDNIc9Lk7eaFiSEhWON4bSJ8KQa0y/7lYT4IOklac7aTM8rfEX5TWGVf@vger.kernel.org
X-Gm-Message-State: AOJu0YwoKs7mcJxnxel2FXP6snYItVz/6WuD5AQ9VTUme9HVKOkW1N3c
	MqgE4uk0gqy6Pac2cKgyZqkfF5OV7WImnvYpRL1nQDqBjDjKu8CQJFji
X-Gm-Gg: ASbGncs1K6G/PPMnm4+Dgj85hldS+WHxeUakAXloPOHx0TtLbRe8j+STy9iQmBq45Ef
	215+mWhdeFXGdJ+GxcIZbGlbJ3rDHoAO5A/RhDS5KRjoatLYVUTwaABScMw6mx/DTR4Puli9/9E
	Wmjswxli39VI5vmUryT+r7t3iGnlI6LC0edFzLTRQ8GPGgsKELQacSkxLN6Wfw7U+C8fCezEeyD
	J8GMUdzp3gy7oS89QgwFnn/FmDqm7FuKv3CkMLAAoTsIT9MstnETlN/4kONPuF1kuY996iNAFhU
	jxObg2AhrGqQc2vqRSme+1arrF1hwezA5uKATSJvifVIDbEKsAgjqWshuSNI7mdTKQElpTWeTi4
	+8ib524se8SWirv+ZT6rYtN4Max2MHeDTmQ==
X-Google-Smtp-Source: AGHT+IGymq0r7t3+/dt2DFGlXKszVB1vTHi1oFb1DYHLzZCrXADl4zARLYFYykUgrI74v8+1nOxrWA==
X-Received: by 2002:a17:90b:4d8a:b0:330:6f16:c4d8 with SMTP id 98e67ed59e1d1-3344ae0aee3mr15189754a91.7.1759111448349;
        Sun, 28 Sep 2025 19:04:08 -0700 (PDT)
Received: from cacher.localnet ([2404:c0:5c60::47f9:1e95])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c53ca107sm9680873a12.13.2025.09.28.19.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Sep 2025 19:04:07 -0700 (PDT)
From: Fa-Iz Faadhillah Ibrahim <faiz.faadhillah@gmail.com>
To: jlee@suse.com, basak.sb2006@gmail.com, rayanmargham4@gmail.com,
 Armin Wolf <W_Armin@gmx.de>
Cc: kuurtb@gmail.com, ilpo.jarvinen@linux.intel.com,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] platform/x86: acer-wmi: Add fan control support
Date: Mon, 29 Sep 2025 09:04:00 +0700
Message-ID: <6218970.lOV4Wx5bFT@cacher>
In-Reply-To: <20250923215205.326367-1-W_Armin@gmx.de>
References: <20250923215205.326367-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Wednesday, September 24, 2025 4:52=E2=80=AFAM Armin Wolf wrote:
> This patch series aims to add fan control support to the acer-wmi
> driver. The patches are compile-tested only and need to be tested
> on real hardware to verify that they actually work.
>=20
> I CCed three users who requested support for this feature. I would be
> very happy if one of you could test those patches and report back.
>=20
> Changes since v1:
> - remove unnecessary blank line
>=20
> Changes since RFC v2:
> - improve error handling when setting fan behavior
> - Add Reviewed-by tags
> - whitelist PHN16-72
>=20
> Changes since RFC v1:
> - remove duplicate include and replace hwmon_pwm_mode with
>   hwmon_pwm_enable in second patch
>=20
> Armin Wolf (4):
>   platform/x86: acer-wmi: Fix setting of fan behavior
>   platform/x86: acer-wmi: Add fan control support
>   platform/x86: acer-wmi: Enable fan control for PH16-72 and PT14-51
>   platform/x86: acer-wmi: Add support for PHN16-72
>=20
>  drivers/platform/x86/acer-wmi.c | 308 +++++++++++++++++++++++++++++---
>  1 file changed, 283 insertions(+), 25 deletions(-)

Hi,

I've tested your patch on my PHN16-72, Fan control works just fine, and it =
does=20
detect my laptop properly.

Thanks,
=46a-Iz Faadhillah Ibrahim



