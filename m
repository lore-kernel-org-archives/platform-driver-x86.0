Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436DE2580E1
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Jun 2025 13:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749474151; cv=none; b=dSKmWAUMduIxKmiAQD7CGlTHk/0aFthRqlnUTi839u11BsZJ/j4bIzEZbGI/OpOTTXl+wjepRKwbfVF2D0zLyszAG4Cf77qau8TQO39nXHeXEXn9HD8aJJ5KKnEMERpR0JxMotz5yiLhBjQd95PtLb4bi3rCXAj8eHDL1jNdbRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749474151; c=relaxed/simple;
	bh=ExaMzXZlSuKQlxahihw/nEqvNxngY52zmmzw4dDOOOY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Puu7g398bPUtSrCbxGJjBihiInSi1CByeGXzxl4tm7b31o6qq+ByPYtVhMuI698Z1whRa3zb+Uzev6ga1w2KRHUlA7z0sI4CgQ6RAPqmqCGcsDXDgXRtUywXiMXRsjmTIzggW8KLHqAKmSybBx2iJaYATgA3AhMoscjESbw3Kh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=YHFjckwr; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="YHFjckwr"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-451d41e1ad1so33721505e9.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Jun 2025 06:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749474147; x=1750078947; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Bh+Zp7cUZNAenLGdWusNvBpvA8IMsAYVSOUkU7ta8Y=;
        b=YHFjckwrloVFpaai0XMvPHcSDBbd3+Klh/KkyQhzO38FvylsbztPr3aQd59bcVrNuZ
         SCILXznlLXOqXV6rKvYihLrWO5vJWcZ5jJkmgIUgCcVn+oW9qA+UPiGhtFS8c8ExCxBF
         sQ6dPdjVsZsaOaZD5oykEBSugYfCwRW9ylL9UxLFdUitlCrnAwQh4z2+YeIU5GOIqX8R
         uMcKp+dBeoeDXINMTd+Xz0Cj6N20NFv0E85wlA6rtzihaURUdfLmX3GY0pPwxw+S0sLq
         FXSH2+u3RRDY1sDNLgMaC3l0VuPMPMfTmLKrELdsJOW+LfVRSBmzfaADHgzYFAM9c2Fr
         TL0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749474147; x=1750078947;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+Bh+Zp7cUZNAenLGdWusNvBpvA8IMsAYVSOUkU7ta8Y=;
        b=HKoyPZjCGLRo1mbCJuARS7dp0A5sQN1TSLb+8W7DSeLgiQbeEGOtv+6IbCnwuPjYIF
         oc+ex+3eLsjxI+DCw+4HEPSN9Q8t+yZSMNsu5JT8U/Nx+P0rNcMEbO6AgcMsbPrF49Qk
         fe/T4F3U0yd/83IGYKmDLQQeKLD9K/eN3FyrtoI6AVpkRQQUFV+GDqEOuLUm2hMBpn8i
         Ar8iPRybDR72J4ZeqZH0tuipTM1fV4jHXynGIYsPZAtLe3ZTU8wtj9Wwrnbaanb/xq0V
         /6xg9ymO+x2AWi4rChIXmhtxAYIFxakqbsgf0FsawWv0bXkZcoNt7QNzw1FSpvWvsqh8
         1ecA==
X-Forwarded-Encrypted: i=1; AJvYcCVtKVfxHAM4MvFcdl5yoCfjOHlviXyi3D2SvYakKCHjwbaEt31Edqxja0doV4T7CmQCyQ44C1ZdMwQ5vz5r+t0lOIMj@vger.kernel.org
X-Gm-Message-State: AOJu0YzFN+J6lKOEoEnL0WqEctOHIIm8hyIUbzwv0NI0lsDsT0tSS8dw
	4DyJWY5JZ35ipKijcdVZ6Fxx/OaSiwqOGblEU1KrPzDCa3MNYp8EoHO8I5HMOQwGDCc=
X-Gm-Gg: ASbGncv1wMecdXtxVbgICtVO00pRkY83EHJE7RKKGcS0RE2xEerIIVp/STOqYTEbVn5
	c3Jj0uLvbH7WKCHIQNklWrTrBpl+HFNcivaWG2jImXTZp5WuZTjbw0ceOvO0tir2driDBHcEzDl
	6gNwOL3eBsZu5ZK5yQiNsTCblcx3WBRWRLRucc4R705PpdTuETlxLm3X6iQ7LAhUouQJqmVKnkh
	sHPwIaL/0fwhQv0XLcFpcafCI/aRdc7vNAyQiP040PgAgUSl+yRAPL93y+Gtnmb2LPpGLkAqkcI
	TcuFiC+dY/zGhhsVHzoPT9ZABllCwoen98+NTmbYytM61iGSSlY=
X-Google-Smtp-Source: AGHT+IEC224y8+mr5qcnD9k9Q2VLvv7fn9ojcXNf/BK82QyxQgrEFMVWAZeFnV10+zDndt5WfXGhRg==
X-Received: by 2002:a05:600c:34ca:b0:453:1058:f8c1 with SMTP id 5b1f17b1804b1-4531058ffa6mr39477275e9.3.1749474147101;
        Mon, 09 Jun 2025 06:02:27 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1008:ff30:c454:e59e])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-452137290b9sm110888675e9.34.2025.06.09.06.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 06:02:26 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Doug Anderson <dianders@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,  Dave Ertman
 <david.m.ertman@intel.com>,  Ira Weiny <ira.weiny@intel.com>,  "Rafael J.
 Wysocki" <rafael@kernel.org>,  Stephen Boyd <sboyd@kernel.org>,  Arnd
 Bergmann <arnd@arndb.de>,  Danilo Krummrich <dakr@kernel.org>,  Conor
 Dooley <conor.dooley@microchip.com>,  Daire McNamara
 <daire.mcnamara@microchip.com>,  Philipp Zabel <p.zabel@pengutronix.de>,
  Andrzej Hajda <andrzej.hajda@intel.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Robert Foss <rfoss@kernel.org>,  Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>,  Jonas Karlman
 <jonas@kwiboo.se>,  Jernej Skrabec <jernej.skrabec@gmail.com>,  Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>,  David
 Airlie <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>,  Hans de
 Goede <hdegoede@redhat.com>,  Ilpo =?utf-8?Q?J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,  "Bryan O'Donoghue"
 <bryan.odonoghue@linaro.org>,  Vladimir Kondratiev
 <vladimir.kondratiev@mobileye.com>,  Gregory CLEMENT
 <gregory.clement@bootlin.com>,  =?utf-8?Q?Th=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>,
  Michael Turquette <mturquette@baylibre.com>,  Abel Vesa
 <abelvesa@kernel.org>,  Peng Fan <peng.fan@nxp.com>,  Shawn Guo
 <shawnguo@kernel.org>,  Sascha Hauer <s.hauer@pengutronix.de>,
  Pengutronix Kernel Team <kernel@pengutronix.de>,  Fabio Estevam
 <festevam@gmail.com>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
  linux-kernel@vger.kernel.org,  linux-riscv@lists.infradead.org,
  dri-devel@lists.freedesktop.org,  platform-driver-x86@vger.kernel.org,
  linux-mips@vger.kernel.org,  linux-clk@vger.kernel.org,
  imx@lists.linux.dev,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v4 3/8] drm/bridge: ti-sn65dsi86: use the auxiliary device
In-Reply-To: <CAD=FV=Vb+Wb6wJ42jUBxVVNp9P87BiqHZgoY+Tw6W3fO==FF6g@mail.gmail.com>
	(Doug Anderson's message of "Tue, 25 Feb 2025 08:04:57 -0800")
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
	<20250218-aux-device-create-helper-v4-3-c3d7dfdea2e6@baylibre.com>
	<CAD=FV=Vb+Wb6wJ42jUBxVVNp9P87BiqHZgoY+Tw6W3fO==FF6g@mail.gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 09 Jun 2025 15:02:24 +0200
Message-ID: <1jmsahcbkv.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue 25 Feb 2025 at 08:04, Doug Anderson <dianders@chromium.org> wrote:

> Hi,
>
> On Tue, Feb 18, 2025 at 11:30=E2=80=AFAM Jerome Brunet <jbrunet@baylibre.=
com> wrote:
>>
>> The auxiliary device creation of this driver is simple enough to
>> use the available auxiliary device creation helper.
>>
>> Use it and remove some boilerplate code.
>>
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 49 +++++-----------------------=
-------
>>  1 file changed, 7 insertions(+), 42 deletions(-)
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> I'll snooze this for a bunch of weeks and check back to see if this
> can be landed in drm-misc-next every once in a while. If you notice
> that drm-misc-next has the necessary patches before I do then feel
> free to poke me and I'll commit it.

Hi Doug,

FYI, this is safe to take with v6.16-rc1.
Please let know in case you prefer a resend.

>
> -Doug

--=20
Jerome
