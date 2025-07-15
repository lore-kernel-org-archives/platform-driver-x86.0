Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868062E2EE7
	for <platform-driver-x86@vger.kernel.org>; Tue, 15 Jul 2025 13:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752585661; cv=none; b=oZa7Z6Yfx0rk6lT0HR7ExLLhjS5MrQWVkK6rdi3bc0wOtU/OdtvyqgafTIbfDNrVW6UpkVwRRQf3Iz5q0WjKf5ZmjTj/G6sRs1Bir3ug2oMP5/wR4X04l/OQC7wvt0s2Bz1OOFPWNaqqsDErAMKqSUQ/f0I6emcSW2HI6w5XMoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752585661; c=relaxed/simple;
	bh=iTD6QvZiqKeEPSTRArjSPKCxmJgkIkYH4P8NnK2Uek4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aRie+U698j7KnQsQ/b3rDGWThw8vPisZYnX+7w4x/BceZMEzhrg0Rc52f6ct0Ah0oQhNIpWipRXsm9Nn10bmeuTC13Tpoyqj/9VgM0y+g96Anjnf1O2PEbCrjVED0SsHFufNjTZIE6dl0iqU5YfcgjYgFKtoG/z4RHkaFd/abpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=Sj4CpYCY; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="Sj4CpYCY"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4561ca74829so19054155e9.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Jul 2025 06:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1752585658; x=1753190458; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2aER99iRVzHm/yjHj1djxkk2abTrxMFAl8DKmvxNC7E=;
        b=Sj4CpYCYKMArSE2WNKe9VIHCoVVMPqgl+zSny72jjlwcJ7WPNEdhyECom2scQi6bTR
         qWlhHb65A5VB1IvIDyb+GpZm/LprNY1x9DyiZ5RUXF7o1NY7Ca+q8jzKK03vug6NbEnX
         RNUZbTiKsLlVvdOkedS8gdjR3Bs99uSANjo2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752585658; x=1753190458;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2aER99iRVzHm/yjHj1djxkk2abTrxMFAl8DKmvxNC7E=;
        b=PJ7303q28Bb4Q54IGjp4cJOOOSmlLiSkZO/LiO+ZsW73OLyHdpXeKlWIumEKWP7E1o
         GPuuXp5wIInBZD/lqYM9/kstdnLm/GVi7jGok0r1VI5/yRW9J1otF+MxhZbnZjwTfNrE
         vpE76V5bdvcrY9L0ODVLywHnqOI9qnjtFZlg0JhFZ+Ig+2vumbnw8hMrHVtF2ZI6ToWs
         YXVicOGOyuLZ57f2dgZe8OHEdxUQVx5cG6I1CPf8okEbjMKWR/MDUuP+LhvQi783x1Si
         L37h5RCoRYSzlaxbNsRb4CmSC+T692XQUPijjvzaKzY491yjD4opFYVf0rveicOvRVgJ
         Ay9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUAxrABvEuSMcXUcHsjIAVlTxaRFRWnJmXBhUOkoPsOi9/T/aN1Cumo7MZnNzQZw8pIr+PTH1dsrAr5W7nqAZfXOR2T@vger.kernel.org
X-Gm-Message-State: AOJu0YxMzjX7ggNkZEdFj2xdPuFoL7S+8xT4HLuUWTaUX7yIPWXIcj+5
	X8igg6r9ak1yy5G3M/aepfyoh6DauZGd8P3Znm9jCz79VsRmjuQWnscypVwLA//Zhas=
X-Gm-Gg: ASbGncv85tnamGBvArgOXnbWn+t7s9KEGwvgujMOrJc/KN8gq9d3VrfSoLeobr/pohx
	C+HzevjUVA9e6KgKpuEt4g02+lBPuq3kF6TZycYrtUiDPObibA5YjkgBgp9aIEyE7YIysTYredD
	HnGm9ce2Sl6GqDEVE5m47eyke4YX/2KhutyNzWndp2Yc0RBYIiJI9EYyYnIMwGbo8SNhTCfxRv3
	GuEa+YasOnG7SUiEVfqdK9jNc8zUd2qdIgaQskflfyjQmmFWq2/qnxg5y8b7QjvQAL9tRg+b6U5
	Dm9UCfKAsPsaljADBaFrH+J5B+vnM0P+siialQF0ctD5zkwT4lGNN/eBHQOYNtuHzFcH+orn1el
	mCciDVgFnQ+X7gJaE8PLSOOsd0pmyL//Rzg==
X-Google-Smtp-Source: AGHT+IGinrr6VlQ7VPBCrVc59xWEOcpuzjncDgPBrTWdeNMpcUJW8rPWbAvhsIGRi9zIwLALwbGYCg==
X-Received: by 2002:a5d:64e4:0:b0:3ab:27f9:e4f with SMTP id ffacd0b85a97d-3b5f2e1b872mr13361758f8f.35.1752585657761;
        Tue, 15 Jul 2025 06:20:57 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4562b54b439sm3676615e9.16.2025.07.15.06.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 06:20:57 -0700 (PDT)
Date: Tue, 15 Jul 2025 15:20:55 +0200
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
Subject: Re: [PATCH v2 05/15] fbcon: Add necessary include statements and
 forward declarations
Message-ID: <aHZVt86l-sXKQpMI@phenom.ffwll.local>
References: <20250715122643.137027-1-tzimmermann@suse.de>
 <20250715122643.137027-6-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715122643.137027-6-tzimmermann@suse.de>
X-Operating-System: Linux phenom 6.12.30-amd64 

On Tue, Jul 15, 2025 at 02:24:42PM +0200, Thomas Zimmermann wrote:
> Make the header self contained for including.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>

> ---
>  include/linux/fbcon.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/include/linux/fbcon.h b/include/linux/fbcon.h
> index 2382dec6d6ab..81f0e698acbf 100644
> --- a/include/linux/fbcon.h
> +++ b/include/linux/fbcon.h
> @@ -1,6 +1,13 @@
>  #ifndef _LINUX_FBCON_H
>  #define _LINUX_FBCON_H
>  
> +#include <linux/compiler_types.h>
> +
> +struct fb_blit_caps;
> +struct fb_info;
> +struct fb_var_screeninfo;
> +struct fb_videomode;
> +
>  #ifdef CONFIG_FRAMEBUFFER_CONSOLE
>  void __init fb_console_init(void);
>  void __exit fb_console_exit(void);
> -- 
> 2.50.0
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
