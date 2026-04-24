Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8AD35AC2B
	for <platform-driver-x86@vger.kernel.org>; Fri, 24 Apr 2026 08:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777019834; cv=pass; b=SCW4pJj9GT0guhhvcRBB6gi9601Gn1fBnbxzvdcrcLd1iytsRPtmP2HoPPWDz3tWX8pwc+h51OS4gB7MTNfEv2yqwfD7uxq5C8w+zOudInBwuVseTw+jlcklAjw0LbDZjmXQYa5jXB7NwVPzbtFvcv4F612WAmTVLQUlnSqt1B0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777019834; c=relaxed/simple;
	bh=x4I1YjupP6GGFjVPW9Jy1Eo0uFh4ai+pFkQeZCw6Z8E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QTwoqUUYdWGLxmWNDycQH6Ma2oBN8E8CJUJXJqSBwd8mwCWYpejzeHCnmTgYEaey8BAWOP6ofziSDqRBa3w+8RaXhCjuTiAx3d168ZfvO8mXUwF4miVO4/ZXkogcqb47pKyosEbk+12LAP+2cN5RW9w6ojUtsqjrvUsTxyTydmk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ItxzugMk; arc=pass smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ItxzugMk"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-654672a6d68so1863859d50.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 24 Apr 2026 01:37:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777019828; cv=none;
        d=google.com; s=arc-20240605;
        b=ZhrfoiB8Hbr5pEVRC7ALwRlyIQtpXhQ7skIQ5SNxnN0NKCMyXGuWtIV3xJM1CROZUb
         s9nlchkuLgAyGKv1cA2DQL+UjNDhXbmLOieAxeYA7Qop3Rqg6KItkZviczLGFWUQ/lhx
         OuEvYqnhn+SrLrxCEzejtJ7w5RZDlM3f2DaykIbj7eGIsboa3pJ3oVYFQMS2QQ69PIgd
         FLCqTLfFt7MUMGexNtzzees0jnvmPXZ4FRm6ViqL3xDa828ZdydtW8tQHsYzxbOj4Jlv
         494K+eBqTNffeKa2i2OFMG0sroGaNWCUrxHR5oZecbEUCKLrbwlC9loQi7MywOkNYxlz
         2q1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=lVI6vsFdn9OVrj4vyMP79clufaLb0TYUczzolorXSOI=;
        fh=RP7ZU5Ic3irrMLqib+0g1t9tq+jqQHMXElu91/ydvwM=;
        b=P7gl2yWoKxlw/kFDasGEYRQDQO3smnKTzxVAVVHR8iy+IXUEKyuzE3/UgZhfDkQ+Ls
         L7eHMSVHFjZdFqfgNjhr//FK9zzQdoCzhmrNV0AW2TKhPx507aFu88xxzk/bkaloM3Ml
         nqsO2X3ealXz0NXDClHqLhPsqDN3tGyhJHwSo8djsUM16LDUomqUgmaAVwux5Ot0pqZs
         hIJh3h89uLf0kwggUooyk4PdSPpdwHOkCXzHo4ldFwyu0mT7MfJAifXk3rWDxY6a116L
         15HgIKTqEin0TxpeZ/YE51ebfaHdmZOFWWKBgMc2VXa+DMA/EPYqRoG62iOq20RVk1Tc
         mCtA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777019828; x=1777624628; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lVI6vsFdn9OVrj4vyMP79clufaLb0TYUczzolorXSOI=;
        b=ItxzugMkXSX4fJELShENUatpJFhB/Xh/+s6D4jUBDe+L3t8yHDlVnkuNoSQleD2/v0
         fNxvLQFQNmQ9nNZArxr17o8RdPwPI63jDW96gAtkuOFWtHsdkzzJX/MfkagwWxyyhTTE
         oFjL8h5D5x2XDQ5UQ/mjnrnh17A3m/YgkgHVqUW6+zWU2mZL78SYcBvOKI3LWuBE8hJR
         0AZpEZgbHvfbmaOfmlpR+OnfikzX6adFOovM7Jq8nsqlzcqgo0GL+RAHleuLsFZVvyDY
         kTwWg2cHS7Pnq7cPEL103Ksj8d6cGccNuBvI2HWbMj1CxT6iGXv3Timr2AHB2g4tMO89
         X/qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777019828; x=1777624628;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lVI6vsFdn9OVrj4vyMP79clufaLb0TYUczzolorXSOI=;
        b=a21BYW+zDqBRzJ+uVFFV4ze1LRRBobT6D1jz8MhZqjbYtkHA2GdEc5y6XKNhjSjCsx
         v/vcoeAt8uMPiFfIkCWWxi+Um+SW1ELXkR0B6/sVYqIcg+Qc4+luSIr3zsqDbsvA/8He
         /DVroN+MFamKCmv0ChqCz/OVmm8eREtHiEaFVYT17GyAD+nURho9E+dmOs8BaosbOGk2
         eYXnyk0WDt/8hRkokRybSfnEbyr5Ky7G8Ytq/522Gqv/OHMjIp/hdMqtYPERw7vPTxXn
         igLUxcMDCx9DNvVYvtDvNOqCWfdOx7QzE6hlJlhXN4Ek33J4ynmKPa/Htl5BB+MCkxt9
         3vAQ==
X-Forwarded-Encrypted: i=1; AFNElJ9/fTo3wrhXlfPWav8ty+K/rzSyUg3ZDY4434gPnEiQYvfyO03eRxLH/Pb8anD8VI/avhRPIs6226SUtrgP8vcwGATu@vger.kernel.org
X-Gm-Message-State: AOJu0YxPxfvRkEvgG55t1yvsiZfryQnuDrKmyH1+D5nCEwzw0plxZzZ5
	QFUomY201yrCt4CllhGPlk42efb/HR3ajDRcoa5YWSkUS5oexB55/Hwx7epqdqRhPhiN+Rkgj+v
	On6npqNElNW08k7rNTBrNhy9gpQmv1UQ=
X-Gm-Gg: AeBDiesWWWAqoKM2S8f+SGSVrREQDERJwkLKZQvIGT9ea0xLGMwugd3JGHUKb24WCQ3
	rPABGPwTPtGQU7g1BUgJPApFy143wDRmjw15hY0RktDfOef4x9IYzfQ1XPs600uZ37zp2ROlBI2
	l1b2ZTC7hCNfVcA2Iw2u8rmYIg4z/Jfi9lgNeP3vKbDdfNGHWN01gPgWJ4KJb/e5uybpSRTPGf7
	9zLUgCC/de3j6MJ8naHKDpgZRZ6+dXinaEeUBR5TV09qV+OcXc2G+IxknBQ0LcH45Qa9Q2CXNLt
	7QinoYrAjAGp5CnRLqT5
X-Received: by 2002:a05:690e:2543:b0:651:be4a:94ed with SMTP id
 956f58d0204a3-65310a8fabamr22114503d50.50.1777019828400; Fri, 24 Apr 2026
 01:37:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260415180042.3648360-1-lgs201920130244@gmail.com> <aeCX1m_RMbSYXG8R@ashevche-desk.local>
In-Reply-To: <aeCX1m_RMbSYXG8R@ashevche-desk.local>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Fri, 24 Apr 2026 16:36:54 +0800
X-Gm-Features: AQROBzBhJsFbSldwMS_OSWq-p_kDVbLQ8_Ky3HJIwRo7ZBFY3yY7UWkZkMarZLw
Message-ID: <CANUHTR-eLpy5+Lb0nCxGBC2Ak88aLPd_Ci0=G1wE+EsWs1EGxw@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: intel_scu_wdt: fix reference leak on failed
 device registration
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Andy Shevchenko <andy@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Linus Walleij <linusw@kernel.org>, Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Andy, all,

Thanks for the review.

Please disregard this patch.

On Thu, 16 Apr 2026 at 16:03, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Thu, Apr 16, 2026 at 02:00:42AM +0800, Guangshuo Li wrote:
> > When platform_device_register() fails in register_mid_wdt(), the
> > embedded struct device in wdt_dev has already been initialized by
> > device_initialize(), but the failure path returns the error without
> > dropping the device reference for the current platform device:
> >
> >   register_mid_wdt()
> >     -> platform_device_register(&wdt_dev)
> >        -> device_initialize(&wdt_dev.dev)
> >        -> setup_pdev_dma_masks(&wdt_dev)
> >        -> platform_device_add(&wdt_dev)
> >
> > This leads to a reference leak when platform_device_register() fails.
> > Fix this by calling platform_device_put() before returning the error.
> >
> > The issue was identified by a static analysis tool I developed and
> > confirmed by manual review.
>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

After re-checking it, wdt_dev is a static platform_device and it does not
provide a dev.release callback. Therefore calling platform_device_put()
on the platform_device_register() failure path is not appropriate here
and can trigger the missing release callback warning.

This falls into the same static platform_device pattern pointed out in
the other reviews, so I will drop this patch.

Sorry for the confusion, and thanks again for the review.

Best regards,
Guangshuo Li
