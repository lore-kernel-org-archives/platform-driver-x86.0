Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286EC373C07
	for <platform-driver-x86@vger.kernel.org>; Thu,  2 Apr 2026 18:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775153544; cv=none; b=nu5pu/ullBF4uXdYB0lwWxGlSd6RJHUQbN0TQYC6E+F/JIYxGBFpoOiyRL/0UCvj3hJ3SOmtZ0khP1j6FmoJ5eLUNF7u/nO2X53Khfc6sgTSz2Ba1eU3unNisIl956AUTP9rbg9ifkn1LPsq6WS+D60ygWGsqv85QKO5HxuvGjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775153544; c=relaxed/simple;
	bh=/pNKs7teCd1eSDB/AA3D8brUZ1+usjFyoX9rIah13XU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k+0V8NLL4i9zbMdb5TWrgzcQ9fLkBB8F7ZotbHTGv9yw1eLCFcimyaIaXqWdGNlAJsiR9k4+FRd2meXDJk5vw9kwHD0Ob9KQb564ziiSuNG0rfCXbtHRoGIfkqJQo0rAz0+WJx8s5vM793XJPyIoLCaKjsn0ax+ENkA6FzcQMWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iy/hAM3p; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iy/hAM3p"
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-56d85e76d73so964406e0c.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 02 Apr 2026 11:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775153542; x=1775758342; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=THRacyHIXkYei7b/MZ9La6/OBKYyMj5xj+E8oeLw97I=;
        b=Iy/hAM3pGytqMXgUOeg5BRIL/9flTR2ms9A/+0NHsw/WXkmnExKjfbCD6kP/xP/+9W
         TtF5QG6gr4xU6so1D2nZEsK9a9qrsfnsVktYnu97LXHufLZqYoupST/QG6ni1HpmcCaU
         agAT+bmxSf8vc6Idq4/GsPdD4Mw4isutAn/szvgnj2KTGqmQHzuuHWLQW/8HXLqUMJhv
         AzjHhkCEmR4D6ZJXfgB4BOASxBPKgeNuKGRTsyYTouKUyMlJQ3kZaBDWjL4jsA0rrUZZ
         fDZLR0Xdl86DpgoX2n2I0DiYJP3AVfkwMxtqVYIqrSwmWiKjzqKPinU3YU+LNGmdQxnE
         zdSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775153542; x=1775758342;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=THRacyHIXkYei7b/MZ9La6/OBKYyMj5xj+E8oeLw97I=;
        b=UeMDYZfff6L0eTpGnzkDesgO/WsOqgTa/keQCCE3iKiNv20ughncHhgok4L92a82P7
         Nbp1gr+UL0AFqOzSwk6aYgcsFkB60aiGNDcfW9M9Nrg+Tc3jFffkGr5BxtfGedGSc7R3
         vxYtLfYICr1xSUokxHFnlyCyppOEjgWoMvZlxlhzfleszh/wE8T3ovASO1g52JRXnpyD
         +5nfugAbM3supSorwPOQYtgMDbmUrtL6QCLLC221YiAxF31+Rxe76y+zt1nq9x5n82yK
         PqoMjovzQpgbUOmIeHIe5RwY6YYzBCeMKJEe0PF46XE6j43rBToE/+tjjKMOCj8KXlvA
         WEHg==
X-Gm-Message-State: AOJu0YzfPrK9zQH1Fx7Eok36pZXqfrKBg6VRSHvkdy9HXu8ZUQF7YLYp
	d9ZNczdOJJoelEKejGVlyxgKUm7aqDX/jS+eKFiUGWkLypH8TTsEx3C9
X-Gm-Gg: ATEYQzzgujXRS0hoZApzAxYnsWACK4LRnDYQBF1GdL3WzLJPWZx7pmdhcKgQJvjb47y
	u4BJs0LFVDsQbyJYMDZts5RFk+j6Ov3HCFd2XQT0J8jD4RveXNqNi71WMbKQ72a0mv64xOOERP0
	KYjjNLd2ZhJ1C6tyRi5/CAV23ltj6cdQkQWsMgSbRI7VxSX0BNgbadW8K5ejwxHuH35RosZghLK
	B2ZKbkgeafHRUKeYrQE70bI53Eg1NG1vck517407U0gnngRnVQXuq+6E3Db1qE5cwrdFn4HbExT
	lK1rGIQHj24qRbLDXxQAHNjtXAvEp46WogjVlbgLmyO5fU2QiSzYGAhjZtJJkka9eGIbICV8N5z
	qwGxFx2NhZYDO7sblELa2jdi3eCgA3dAJrc7OECcIf1FgrFYWWUS9hWFrrrfz14IArWGRiD1EBr
	L7G71ug+DLBAJhyIeW5atUacPVmMM7546rf5dB1NtQI4F6vK0=
X-Received: by 2002:a05:6123:149:b0:56b:579c:82e with SMTP id 71dfb90a1353d-56dab8805ffmr50865e0c.5.1775153542079;
        Thu, 02 Apr 2026 11:12:22 -0700 (PDT)
Received: from localhost ([2804:14c:5bc6:8c1b:8512:ab64:bee:7831])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9bc9cbbasm4491588e0c.9.2026.04.02.11.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 11:12:21 -0700 (PDT)
Date: Thu, 2 Apr 2026 15:12:18 -0300
From: =?iso-8859-1?Q?Jos=E9?= Guilherme de Castro Rodrigues <jose.guilherme.cr.bh@gmail.com>
To: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <benato.denis96@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/x86: asus-wmi: fix camera key led on Zenbook S14
Message-ID: <ac6xgsMxzpnU_8FA@djouze-zen>
References: <acxSW8FgXbnFiqIL@djouze-zen>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <acxSW8FgXbnFiqIL@djouze-zen>

On Tue, Mar 31, 2026 at 08:01:47PM -0300, José Guilherme de Castro Rodrigues wrote:
> 
> This change is not visible to userspace, as no sysfs attribute for
> ASUS_WMI_DEVID_CAMERA_LED_NEG exists.
>  
> +	if (is_camera_toggle(code) && asus->camera_neg_led_available) {
> +		camera_neg_led_trigger_update(asus);
> +		return;
> +	}
> +
>  	if (!sparse_keymap_report_event(asus->inputdev, code,
>  					key_value, autorelease))
>  		pr_info("Unknown key code 0x%x\n", code);

This change is actually visible to userspace because I'm early returning
and that means the event for the camera key is not propagated to
userspace. Sashiko correctly identified that, as well as another detail
in formatting (using space instead of tab for indentation on the newly
added macros). The event is currently not used on my system, so I didn't
notice it before.

Removing the return fixes this. I can send a new version of the patch if
necessary.


Best Regards,
José Rodrigues
