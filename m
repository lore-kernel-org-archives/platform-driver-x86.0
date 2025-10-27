Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31888257831
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Oct 2025 18:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761589651; cv=none; b=Od87D3+iCYLbikl4+s/4B/MIukyaKJNfoCItDl6ECJT9fOUEULUrXoVrjT9umE4HXqXZtQKWG5bSlt94Aspzc14gUMXVU7WXA0z00mQyc+pLNiPpIWYsilCS5O0bW79O14ebbUMWyA9MvVojqZE817ENLbRhgHwUyIcWjKVSJQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761589651; c=relaxed/simple;
	bh=4WF4wb+MiXWNo1b5VDKvrh+3Zi0iAwsNvs6w4p0a72k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d8M49wILdTcg7bGG8q08BWhL1KxpkAWstmpXx7LMxlTspL+qDjNA02Rjg8F9OqnexYDtX9pUcME/vxMBqnUPzD9U3zCzxTHKeOl9hRpBsWwixaNPkjwcYJ97DKFLw3j/mgsT4d+klHX3h/Pz321eduP7scPiT9P6AweWAgX46pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AkUO3v2w; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AkUO3v2w"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so4860341b3a.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Oct 2025 11:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761589649; x=1762194449; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sh8GYbrYnJsrCXTs/sDqDyl5/KJKmKDrWuin+m/k4Vg=;
        b=AkUO3v2wgYtB7XbBHjhlOMK8kpsZUwpOWLiFuZHEZuOTMtxkqwf2SDLK0DfWj3cOMF
         rp5w6xoVwkgOoVp5n56J4jsvRvLTMYrjMQMDllQoG//Sn7TmWrqv/uSL1wycoqn05a3D
         jZj1fm4Ym6bmaSd0DlCCq0l/6uWjv4enf60mK8k9ImeaIoNx2bIoHHKxiPz+SLJ+F6Rn
         c4RJ0bgz4dAxZ9L8gMbrYBysMPg4fuiXKJvrhno67O0QvWFakqisxsSjjetSqVOZZfDi
         Xcp0iLSTnDcxUJd9W7gaWL6ARTpAZxAYonLY3B/Ih/SEN8B6xp5XF/HLBZQMgz4bwiKX
         Ejfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761589649; x=1762194449;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sh8GYbrYnJsrCXTs/sDqDyl5/KJKmKDrWuin+m/k4Vg=;
        b=iUbZp0DC6W4cb0Zvv5Ktr5kqVP/4/mTRJzgdoVNkKXQDZF1Gd+g5UeCllN9sCtqJkX
         fUZOlQWGO6UJ887HGJGREG7hSk7Tb+tNafAyQ8kaYh5XketNJCS0dEtJNsfZ5+NWtoQ8
         F/4awHyuqTt14LiwaKiH0hzjeWZPNg2x7fsY2DjRXjztl3rjAUuasn6KvugseajOlhN9
         oCDTDvKNWGfYfpR31S26HAw3rqWpvL/fbMrPM9cWB7d2Pvy9ZB1Yke3AB/psBMY7EuAW
         zFNvdkZFyXOdan9jwUX06a+6ALKI78BwrQIZj5WynyktH6mstBaZEfFExRMjeGS2wuzO
         F0jQ==
X-Forwarded-Encrypted: i=1; AJvYcCXk4cJqkR3Kw8aQmQgEB2gAIri5QmMbmYZYxjXFvxQBYUkpNQm5EyrBndUglnmaph1/N5htntb7szji/gbSqaV+dwtz@vger.kernel.org
X-Gm-Message-State: AOJu0YyUKIenfcHSauQISwlFzNpjOYdUNi3ojo0SMS6XT8omFB6twhS0
	rhWPDxgCbz7p03Ofx92dNqF8rumggpl+eh0KF2nJ+GKOeuVGB0sfAqP6SXUjwA==
X-Gm-Gg: ASbGncvdb2UYrsXKEM/4VG9+jUVejkr5YyLdQung62eEyGTIy6hqlLKQGZ8yIJry0Vt
	l3z4ti6+l0QDBgLnamK1ct4UrxzXLZzlL6FYNzQb1PdhAq6LUTOHKb8VT8dv2EBOrFsqy5H3YRs
	zOatpgvAgC61sFcnDYpPM51A3BJs4tIrdX5FYjVqIFY4PbPr+9V+GvuMJFZTcHr716I57Mh8PX4
	BRIaJs83O54UcBtgkPfag/PUQi2K5o0TWWaXUVRkwT/j+Fgo8b1KLWa5yq9k4mTg0VtqzxqZLmG
	4opZ73NLq/w2nxoaBEBhHdxLc0G20/hDMyRXn4HRxxC4po47K4wDK8hYf1QlnocrYioz3RhU/i2
	rdQAUHAwA26X7tRdSOP5YSj9BFVcxOaWyPDO50+SUmCLHumToBtsbS5x0q+0cxwbMAA3WCWBD56
	gHsNfU+iTSK+JgdUApHhMsLqLTRH+KBg4jD3BUyaCyGaeTVXe+EwYB
X-Google-Smtp-Source: AGHT+IGZFMb/6No2kevvbERyNoEHBAxZImTSWcy7vku/s29xWoflycNb2oOXSTm9shNTMiQpSPdYIg==
X-Received: by 2002:a05:6300:2709:20b0:334:a854:64a7 with SMTP id adf61e73a8af0-344ddcd948amr436525637.3.1761589649441;
        Mon, 27 Oct 2025 11:27:29 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:a7b0:9cae:9e24:af62])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a41408ef94sm8913753b3a.68.2025.10.27.11.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 11:27:29 -0700 (PDT)
Date: Mon, 27 Oct 2025 11:27:26 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 1/2] Input: Add keycodes for electronic privacy screen
 on/off hotkeys
Message-ID: <ctb6o2cbceqrjgk3gbo4d7qkm3wh2by2keuwk2fu5zsvsn5hlb@rkc6jccfbuik>
References: <20251020152331.52870-1-hansg@kernel.org>
 <20251020152331.52870-2-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020152331.52870-2-hansg@kernel.org>

On Mon, Oct 20, 2025 at 05:23:30PM +0200, Hans de Goede wrote:
> Add keycodes for hotkeys toggling the electronic privacy screen found on
> some laptops on/off.
> 
> There already is an API for eprivacy screens as kernel-mode-setting drm
> connector object properties:
> https://www.kernel.org/doc/html/latest/gpu/drm-kms.html#standard-connector-properties
> 
> this API also supports reporting when the eprivacy screen is turned on/off
> by the embedded-controller (EC) in response to hotkey presses.
> 
> But on some laptops (e.g. the Dell Latitude 7300) the firmware does not
> allow querying the presence nor the status of the eprivacy screen at boot.
> This makes it impossible to implement the drm connector properties API
> since drm objects do not allow adding new properties after creation and
> the presence of the eprivacy cannot be detected at boot.
> 
> The first notice of the presence of an eprivacy screen on these laptops is
> an EC generated (WMI) event when the eprivacy screen hotkeys are pressed.
> 
> In this case the new keycodes this change adds can be generated to notify
> userspace of the eprivacy screen on/off hotkeys being pressed, so that
> userspace can show the usual on-screen-display (OSD) notification for eprivacy
> screen on/off to the user. This is similar to how e.g. touchpad on/off
> keycodes are used to show the touchpad on/off OSD.
> 
> Signed-off-by: Hans de Goede <hansg@kernel.org>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

> ---
>  include/uapi/linux/input-event-codes.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
> index ca5851e97fac..d2987786c28e 100644
> --- a/include/uapi/linux/input-event-codes.h
> +++ b/include/uapi/linux/input-event-codes.h
> @@ -630,6 +630,18 @@
>  #define KEY_BRIGHTNESS_MIN		0x250	/* Set Brightness to Minimum */
>  #define KEY_BRIGHTNESS_MAX		0x251	/* Set Brightness to Maximum */
>  
> +/*
> + * Keycodes for hotkeys toggling the electronic privacy screen found on some
> + * laptops on/off. Note when the embedded-controller turns on/off the eprivacy
> + * screen itself then the state should be reported through drm connecter props:
> + * https://www.kernel.org/doc/html/latest/gpu/drm-kms.html#standard-connector-properties
> + * Except when implementing the drm connecter properties API is not possible
> + * because e.g. the firmware does not allow querying the presence and/or status
> + * of the eprivacy screen at boot.
> + */
> +#define KEY_EPRIVACY_SCREEN_ON		0x252
> +#define KEY_EPRIVACY_SCREEN_OFF		0x253
> +
>  #define KEY_KBDINPUTASSIST_PREV		0x260
>  #define KEY_KBDINPUTASSIST_NEXT		0x261
>  #define KEY_KBDINPUTASSIST_PREVGROUP		0x262

-- 
Dmitry
