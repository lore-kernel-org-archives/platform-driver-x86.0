Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E907439657B
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Mar 2026 18:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774376801; cv=none; b=dOO7eer5h9FQOFBUuduVGuFl8ef/ehGN6m99DO4o6eUCa1QkqvX2/9N8hMpF2ebW77w9p4F6gqfKGOiW0fPwwSrsDMSh8sBi/zUxA6TJhEkDQfIqko3tzbHodCtMhvw5ffcY15I0H2gac0AifrizbNt9jbKrABFo9mEA8/qTyE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774376801; c=relaxed/simple;
	bh=akG9WNfQ4S171v39YEvChOQUCONycQxPoOKldCU4/aA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CGd5lr7a31BW688lZF8xzAYPmKl+BO6VxM/vGLH3qiPtpSHjO2vdevl8pHKuckhAhpRLW/qmJrZBr8JhR4rC0Rp5AHeS+P64nWaZaZiBc3VoQ/afuO7wLmIHHv841wic1YCQHyIerYl+jN/Kx03VBuvJlYDwB0/1msjc2vv7TL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=MC+fXUZE; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MC+fXUZE"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-4043b909ed4so3061718fac.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Mar 2026 11:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1774376798; x=1774981598; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aGDAlbFzHv3thv3LxwAS/hZ+8C/jv7mgdDPXrQpCi5M=;
        b=MC+fXUZE5nJzn6IlS9AgxFW7JyyaDn47FqNDGtDki7Fb117MmTbnEH4eKCEkoqiMYV
         0Vh/iVTtV5xRmkyjg66fEUb7MmfDJUuPbIZ+Pj90gSePWNziTAXTh0YbKMM8AkWO7DWy
         XvgXc6WVv+WY3dmfba2Vbf0R7y9nwW6B95uYg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774376798; x=1774981598;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aGDAlbFzHv3thv3LxwAS/hZ+8C/jv7mgdDPXrQpCi5M=;
        b=JAjSno3jHgTVs3PDktsBXoYQRuQS/UQDS3s0Yi9LoaZSSRHB24c48+SddBqSsSJRRA
         H3tIdRg0Pn1pNu/0Z55jlYD1DeLw28+foqnxgWFn42YRdCKJ9be9Nt3Q9IAjxLXN8lMo
         dMbNY3oTDxqk3LkTjDqmK2pB7Dc4qfWvXnzNIcf+/r6hO4g/u/CDMJvaF0SGryVGXZnJ
         aX04CF5EAKX/6YOYskHMTj/2yvVKNfGDgUf/m/vI1j1LlZv9YUQY9rP10ECoImKpKjiJ
         DVjcTVvpJohaY4t0lCuiidNfAu2lrJ73tCAesQbeQs6a9hOhaXsUGERs7jQYSh5aptuN
         NKJQ==
X-Gm-Message-State: AOJu0YzUXi1hqfDXUJdpWtXImSv6bhHDrmB2Tv3KOwlfRwtcFx6iG20i
	7Xpj2izYHgmcwQFei1vbIP8vmsOjg23z+sDff1TMlSjrV+3PpyoifiY4AcG3YDe8UhY=
X-Gm-Gg: ATEYQzydTrJgjyVdHDlnfazRud0tz0V45UMPgAxNXUg+d2kf52eTZRe34ZfZp+QQWP5
	RcXTcLjZaIhRgvK2tm/dakxLdH8+9uDiQh38K3wkFl+a84lg6zDoE3hWgYcKKPwCJaFsT0hTVxN
	1hS7ch5i4qEdo50gx0gsz3vTYWI6793kkuPY5kEiEct8Tlj3ufkCGBQp7PEySbF5Y+oZBcNdNMJ
	0K4ivEE4UnR3bFBXdPdb2Ocz0wc3tRvKuZbH/BT9z/0ub0z5uz94kJmIutBH9jdL1rgdoo3E443
	qHtU2Jn5DPh+1wr6xfTnaVxqP4VBoLNzUTKGRCpt6pJujY67+s8563CrKkci80XnSGOUTbLU0rl
	o8dPtV4ulkmTfnMJpfVwDG+4a5J5YeX+9gVKoZTdHfE6pAZdGn7L/tWL85tJsiiMDuExI49nKkH
	m+Dp7xqzsyfmZTaGlMpQRPr5525CYR3re8geI=
X-Received: by 2002:a05:6870:8131:b0:417:ab68:fbaf with SMTP id 586e51a60fabf-41ca6ddbde6mr451183fac.20.1774376797811;
        Tue, 24 Mar 2026 11:26:37 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-41c14dd0a6bsm13387929fac.13.2026.03.24.11.26.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 11:26:37 -0700 (PDT)
Message-ID: <c378bbc1-e7b2-47e6-afa7-9ba6ea4c7716@linuxfoundation.org>
Date: Tue, 24 Mar 2026 12:26:36 -0600
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/5] Documentation: laptops: Update documentation for
 uniwill laptops
To: Werner Sembach <wse@tuxedocomputers.com>, W_Armin@gmx.de,
 hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
 Jonathan Corbet <corbet@lwn.net>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20260324180437.69594-1-wse@tuxedocomputers.com>
 <20260324180437.69594-6-wse@tuxedocomputers.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260324180437.69594-6-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/24/26 12:02, Werner Sembach wrote:
> Adds short description for two new sysfs entries, ctgp_offset and
> usb_c_power_priority, to the documentation of uniwill laptops.
> 
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> ---
>   .../ABI/testing/sysfs-driver-uniwill-laptop   | 25 +++++++++++++++++++
>   .../admin-guide/laptops/uniwill-laptop.rst    | 12 +++++++++
>   2 files changed, 37 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-uniwill-laptop b/Documentation/ABI/testing/sysfs-driver-uniwill-laptop
> index 2df70792968f3..cba4138604601 100644
> --- a/Documentation/ABI/testing/sysfs-driver-uniwill-laptop
> +++ b/Documentation/ABI/testing/sysfs-driver-uniwill-laptop
> @@ -51,3 +51,28 @@ Description:
>   
>   		Reading this file returns the current status of the breathing animation
>   		functionality.
> +
> +What:		/sys/bus/platform/devices/INOU0000:XX/ctgp_offset
> +Date:		January 2026
> +KernelVersion:	7.0
> +Contact:	Werner Sembach <wse@tuxedocomputers.com>
> +Description:
> +		Allows userspace applications to set the configurable TGP offset on top of the base
> +		TGP. Base TGP and max TGP and therefore the max cTGP offset are device specific.
> +		Note that setting the maximal cTGP leaves no window open for Dynamic Boost,
> +		effectively disabling that feature for the GPU to always be prioritized.

This sentence read a bit complex to me. Something like this might
make it easier to read?

"Note that setting cTGP to its maximum value effectively disables
Dynamic Boost for the GPU is always be prioritized.

Maybe elaborate what "leaves no window open for Dynamic Boost"

Rest looks good to me.

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
