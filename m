Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639252E2EE7
	for <platform-driver-x86@vger.kernel.org>; Tue, 15 Jul 2025 13:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752585603; cv=none; b=qcNt/7irfTbXMh7wIwBM0VmrYLGmQEASgjmR1wcaOyJaMn2B7b7htQxagVomgr3xavoOgXOCVSXGYfNuBqN6rG6h0enMgt2OhRxQfheoW0c4zRre3TxCYetWcZXdSq6QNNEMGneVACxgLoVgMTnctp3Q0R1iYayZK3uPmp2Vm1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752585603; c=relaxed/simple;
	bh=pw+cz07JtKjeBD7xSPONuGdwWJN1P3DPpVEUdiOZg4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s5S7sRdlyfcytTic9QbgMSmNYoCUFEcQ22/k2U28lwb9kjzZb155iCYixp0MUosgQpRDDM/O4Ye+I8RNyzq5ko/5HbWRCNCbnLLfhcCIaGEJqHs3bVzv7QzhZMlGm+dNtOSKyOHYa6XJEeJOy5EwSgMHisZ0oiO/s92Vc7AOjGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=SclGuTe/; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="SclGuTe/"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a4f379662cso4108611f8f.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Jul 2025 06:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1752585600; x=1753190400; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RZNdJdvnKf8QKxgnS87V8b+rsQrk+0DHovoGkwxahd4=;
        b=SclGuTe/FGfzERAKMU4ESMwyMAWD89N3JV+Ggbi7nNZFhAAVJGFUFDNGO0uEc7AAoS
         l7H0NRzPXl7IQhcp2jvQiUzpF6OT3PoO1CoeREdf20KTmuJbV1vOrvGYFGKLQkOLg5Z1
         EnCedlfM6KywSI1VNh1kYubC9vUcnP3Je7tsk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752585600; x=1753190400;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RZNdJdvnKf8QKxgnS87V8b+rsQrk+0DHovoGkwxahd4=;
        b=SE/xUjJPvsinlBhfjYcFjYKfvMVtcGA8i2qu8SdfaeDXoKNoI1zrh1GkVOom8cFgek
         dXf+RC9/Qr/S7Mz0Yu4fChxl+S9UrRRe8U83+GklKdNAsP/wxUFv/1MG8iT4ajOYMaCD
         AJHpEW9Y735d2mbVhyQ+/7TvU+wTze3AVdrjbGGOzP67WWaZwMjqzHRMI5N/V0Homf89
         YKV8RM8jjNL21r72bUtcQL+xTjJ0x7fjXPBdPWhYUfRAgHIOKxOJNzerqFE49TUo1RTW
         DyBYm2hYtCdi4wYHJASGNan1BPlD5Ww6xmbbLdbsJepaKrCG49NmyMOpwTMT8ycpgb76
         +A+A==
X-Forwarded-Encrypted: i=1; AJvYcCW7XoNN/dOXHHRI9zZDH+q8f41WEV87/ItL2sJr0X1XrOA2blQGz+pdKsVOFToaby9zZTeZsAB12xmxive7ypNlUe0U@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7gFf9kHH34lko4o0GX13xjy4B4mPaJKjzMxakSbYOsGGPWqs7
	nntYgRGoj4mJm7WjoABfZyNQTANRg5H6KY63jglXKTzwd40weA7RB+mjP4qEp3hCGnY=
X-Gm-Gg: ASbGnctPB5GwrYGodfhOKdbQ7cjqhnput6ujEP6ZUvnyM2DHCEVjV23M+Tu24/dtc/b
	ATf7wJATO7/UWS44az9JKLW5LK/ei3L02jX7CWlhLMvcBQPacAt1vXkYvOYyraHjxHq2jAzdmNS
	VE9AMtAsjs0Ear4waULHUZTPqTq35KLd6CxCkaLEdU8+9TM5Ym8jz51YFdvU39NgfpBVoPiB4nX
	82PvT0yTYrUN27YK5i3GJcjPp/hD4E7H75yBF97Ay70XvKrAbBPjplMFzYJLxhiHV0WPMlrOoyH
	ZgwD5W2VLD3Lng5jtKuSF3baQ7LFdh+pm2aQy8HPLZ7ri3Z6/mCZN9erBsefoePf67qfFclNT2G
	tmHCE551vnjxDkTEroqI4Km6BUokkmNsunA==
X-Google-Smtp-Source: AGHT+IGgOrGKdM3z4rYXREjB5K13TQWQc9hzSbnGlRYyUFMTZTPMvyOf/txGJ4PS42ny0/qCStlXJg==
X-Received: by 2002:a05:6000:290a:b0:3a4:f038:af74 with SMTP id ffacd0b85a97d-3b5f2e3ad53mr14816635f8f.51.1752585599669;
        Tue, 15 Jul 2025 06:19:59 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e0d70csm15389832f8f.62.2025.07.15.06.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 06:19:58 -0700 (PDT)
Date: Tue, 15 Jul 2025 15:19:56 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com,
	neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com,
	deller@gmx.de, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
	fnkl.kernel@gmail.com, j@jannau.net, hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com, sven@kernel.org,
	alyssa@rosenzweig.io, neal@gompa.dev,
	support.opensource@diasemi.com, duje.mihanovic@skole.hr,
	dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
	platform-driver-x86@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v2 02/15] drm/panel: panel-samsung-s6e63m0: Include
 <linux/of.h>
Message-ID: <aHZVfD9Koa-fi5CQ@phenom.ffwll.local>
References: <20250715122643.137027-1-tzimmermann@suse.de>
 <20250715122643.137027-3-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715122643.137027-3-tzimmermann@suse.de>
X-Operating-System: Linux phenom 6.12.30-amd64 

On Tue, Jul 15, 2025 at 02:24:39PM +0200, Thomas Zimmermann wrote:
> Include <linux/of.h> to declare device_property_read_u32(). Avoids
> dependency on backlight header to include it.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/panel/panel-samsung-s6e63m0.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c b/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c
> index ea241c89593b..930948cb615f 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c
> @@ -16,6 +16,7 @@
>  #include <linux/export.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/module.h>
> +#include <linux/of.h>
>  #include <linux/property.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/media-bus-format.h>
> -- 
> 2.50.0
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
