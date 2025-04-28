Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1922E155C82
	for <platform-driver-x86@vger.kernel.org>; Mon, 28 Apr 2025 22:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745877920; cv=none; b=l8HXVoxgAFDPhrHCUbkZcv3hfDvPaC4TupDBsK/rV8pJCZTmUuOKw6obe+q16+oDVvnD7qLvKWHzXwwkdmBGxqZovRyxbFx6UR+GTkLQmmSriXtuVW1MzWR6QcGPvO5in9JMoHKE9uxQodiJkWBhtgY3S3pDaB2XTnxOwfkig4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745877920; c=relaxed/simple;
	bh=1/NNCl/QHegAz0a9snbCfhL+6lKyjL9YkNwmtRtPEHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hn31GCgog5WRNIMzsz1GB/Sp2f5O31XqdzCVkWriUQ/jFGxkgKzsPndXb9EwKIRZzUa7to+qjYOISTT2b7AWOnRi+JN0rYFsU2Th1D9ROOWfiO1cltI5j4jXCRNh6t5tjj0COlUs7xUMT75+9nGW0fHGLPLJW+jhA6psluOsEn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RPx+lHSr; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RPx+lHSr"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22c33ac23edso49376955ad.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 28 Apr 2025 15:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745877917; x=1746482717; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V26gXmE7IvNiqA4gurx0GWLN4FB6HYZ8EO8Rr53DWcs=;
        b=RPx+lHSrwHxmnQbElKOx18wnPitVmonweGCcDUIlTsvvE0d5vTEKpJNboh+/9YQslN
         gNNJAuheLOU1y0ZuS1H1qHgFMdDKTXsdX9kPRmtwZNXtUnnoYlv+qEnp6NsUUP2nMpzh
         WDKrg+DrjiYrYdFnJlfkzXLRZIQ2RkvV1cvV4MDp07pAVsyBpQ+mi2L5oYAC4JoQcxrF
         uS+YYDD3nXihHDgUz4BF5XITkATsys2FsdnbkA6c4peyMgPSTCFlltxmBmN5l8/i0Ue/
         tZi9DDc8SUwq4vVJ47LaihlLIYi/+YwxT6XQAXc2S6h6iVYA76/GhM3fPefnefR3Tf+R
         lhig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745877917; x=1746482717;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V26gXmE7IvNiqA4gurx0GWLN4FB6HYZ8EO8Rr53DWcs=;
        b=dtnujKjY9LImNZdHo8xqTjFo1zdFwI428G0cEuZbuBeiIf1k/z/U/fG9TPe/ZDLJDF
         Hu3Yix8M250iScIc6Y/gFQQhS0f9wzZp9153DuF/IDDkU9E8QT04Ih+1suHxOeoAyC9L
         RGAhZbe/vUmTQHkQNu23WVIQpLAOZ5CKi45PatyArAttCLe2OwwNsOi4oZU4Igno2e5t
         OhxbktUkGtDUoZisX+E9PZ/XONupH/oB/X3XTHkrTqdiutIyE7jgFy3Z3KHzRj5711L3
         5+mA/bdrytV81tkU/ybJ4QfztC/TOouSOuIkRKrWCbhsiizDdf/ZCNu6KqlYpICGskCC
         Zx5g==
X-Forwarded-Encrypted: i=1; AJvYcCWjxZdS/Os28TXUiEzTtAZcLYP1Sjaq51hKW2iBJh8cNiBYi3FG6jvHnL6bOFQAjCCz35zcKmuCysU8BTbX9ttinHsD@vger.kernel.org
X-Gm-Message-State: AOJu0YzhdXludLMDPQnATzyIN4MFcaRZgHUGi9doVu1kgKvH9FOnCZtq
	F3CDQAUccfKmzffGofnyLLkL8XLgltOOI01iq0eK/apjhMf1QlVgGoMdxw==
X-Gm-Gg: ASbGncv+RVUvRb83Xjx17p59T80qB3J57tbzsesI+aNH4Wh+s7kts55atE92qd0ZPg5
	lG5vyMzPOqFm1z7UXmsP5ZtDbFVTtkBEf4jO6IHmJ4reMaeRfAehFqhZSYQ4FxQc799FdxtPtA9
	tavPXLuPCW2BNd5aGW/6cvC71bwPAThRUKg+ZfaQMP1jkrzL+vjyD0ZELN9JSdBKFWm60+xoPKj
	9oYxirZVRvDI0dV+SRIBBSS1QfDuuJRh5auzAKp2uMJsojg2SywErd68bLhMpAdKV4lLTl6WVuY
	FHFpXOjVgabFzTIUQ8MzvVryArTanOSm1rg/wOME12pUxJbu1Ac=
X-Google-Smtp-Source: AGHT+IE4y7r1dHDtnVu0x0FihuJsYT5EPlhOJ8gkkGtJC3Pd78341U3Pu40u4j8LE4YiZ1w/Q+hPsw==
X-Received: by 2002:a17:902:ce8f:b0:223:6657:5003 with SMTP id d9443c01a7336-22de60669ddmr17706105ad.32.1745877917100;
        Mon, 28 Apr 2025 15:05:17 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:67d:4372:d1e6:def0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbdad6sm88313275ad.93.2025.04.28.15.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 15:05:16 -0700 (PDT)
Date: Mon, 28 Apr 2025 15:05:13 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mario Limonciello <superm1@kernel.org>
Cc: mario.limonciello@amd.com, Shyam-sundar.S-k@amd.com, 
	hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, Patil.Reddy@amd.com, 
	Armin Wolf <W_Armin@gmx.de>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v5] drivers/platform/x86/amd: pmf: Update screen lock
 actions to KEY_SCREENSAVER
Message-ID: <ycqzbmktzlbxzcfktuoqvswtrlkpbx6yi6hcej5z4zcmausb22@3xqydbuueu57>
References: <20250428200456.4094500-1-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428200456.4094500-1-superm1@kernel.org>

Hi Mario,

On Mon, Apr 28, 2025 at 03:03:57PM -0500, Mario Limonciello wrote:
> From: Mario Limonciello <mario.limonciello@amd.com>
> 
> Screen lock actions are ignored by popular desktop environments currently.
> This is because `KEY_SCREENLOCK` is not one of the legacy keys that popular
> desktop environments listen to by default, `KEY_SCREENSAVER` is.
> 
> Adjust the PMF driver to use the correct keycode.
> 
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Armin Wolf <W_Armin@gmx.de>
> Fixes: 4c92d448e3e61 ("platform/x86/amd/pmf: Use existing input event codes to update system states")
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
> v5:
>  * As Dmitry pointed out that GNOME listens to multiple keys even if not advertised
>    it meant there was a bug either in GNOME or the PMF driver.  Turns out it's in the PMF driver!
>    Switch key combinations instead of using META+L

No, KEY_SCREENLOCK is the proper keycode, as you can infer from multiple
instances of it in the kernel sources and only single KEY_SCREENSAVER in
the code for an infrared remote controller.

X for ages mapped keycode 160 (152 KEY_SCREENSAVER/KEY_COFFEE + 8
evdev offset compared to legacy XKB numbering) to COFFEE aka
XF86ScreenSaver, and I still see it mapped on my system(s):

KeyRelease event, serial 42, synthetic NO, window 0x5200001,
    root 0x4f4, subw 0x0, time 491884600, (89,58), root:(1920,1044),
    state 0x0, keycode 160 (keysym 0x1008ff2d, XF86ScreenSaver), same_screen YES,
    XLookupString gives 0 bytes: 
    XFilterEvent returns: False

And I also see it working in both KDE X11 and KDE Wayland. So again, it
is either Gnome breakage or something wrong with your system. The change
to PMF driver should not be necessary.

Thanks.

-- 
Dmitry
