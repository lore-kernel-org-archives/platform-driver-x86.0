Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2B9387359
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Apr 2026 23:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777418433; cv=none; b=WaoRLwlJ+Nc6xvPM3YiGK81XLkp7EAYWB7+sQHiPZKpfbOl+orm0q9LisfkHG/rAjKGle/jckS8Yca+Ca2Fhyu36kI9bfr7uILQdC1D8o5ghaRhej439lqeQ96uf5Goon4NFCD/CWCGmeHCQcY0vcYQMvFLEAx4f4ImzAqdrQCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777418433; c=relaxed/simple;
	bh=oUDQ3jnJGrJYrFgpyu3sGYqMOSRy6Pgc9nJZRJ0mtGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jaXlXnyIziORm713Jb+cpuWlDhC2lxFl+4HNUK3Dy1AqohEJztaQgETVGDHIO4dNviK3EkBYZgWc0HrccXyyr3IaBXqHLP47YyP1LmwCVbUdBkWQgv1uT1Cn9HBDyM6JBhdNfPZDwpqB5TwSIYcBgWIvLvUTvGa8akhY+NEP3No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OdWe3I2Z; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OdWe3I2Z"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-64eaf8aa893so9890501d50.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Apr 2026 16:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777418431; x=1778023231; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=40Dpw4JkDEEUOfPNjhQNegKsRaiUaTKt2OfBjTtudeM=;
        b=OdWe3I2ZCeFamDschvQdvDyt1UWm89XZID+4zt5oqn4fg6o3GkezgVDB4s9Y/EDfMI
         mcwblXSVmWqifnRg8Xd4YTCGUMkem13Heu5CT1k2oNRa4f1u9s9gv/nRAn6MFkn4CWyO
         ILK5Bs7Sxg9M9Utryu0UMcurOBDfTp1nXWGxOBYPR29dc+iyLJ+t4mtD5aSdTu7C/t1P
         88YmjLfKI5FFjJTofCPhJh4lVbGhBbTUZpEpHcaSjWYkJgTcDrKeU4zUHdFnWaW5ZEwb
         rM7/x6bK+sGzep/qgit4P4erFo5c2XH7hshvJxvJ5ux81cxKWHUUKkegQdck2ck2Lg0y
         u/6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777418431; x=1778023231;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=40Dpw4JkDEEUOfPNjhQNegKsRaiUaTKt2OfBjTtudeM=;
        b=G2D09Ms2XpH4tUL7TVAdUmmscxMPTjZss27ghdDZohZ8/RaP3sUOuoi5pD5vEYS5tw
         o1XcdzbK8ZGzIAZO1oHf0WFMA8xxiF/2LVlNVpvltUxvs5wqo9gNn1IZeyBG1hJ7ak8p
         AIV6ztt6uDHUxJtSRSojgegT4wtallPcCWkwgk3qRf+E/B74Dod4J9R+F2RxBtpFRttp
         n8dNFSSDrrSDiUPLmnwBhWgpPv2HdF6ONEdmBoalzXrOBsQfd153ue+YSYj2x0P9Q4DR
         exX+6o5jhr/woraem7lpPNApCaMSEOFX8X0HEw/KfFJvJ88x+A0sGFAtZOwKY/V7r9IU
         CTTg==
X-Forwarded-Encrypted: i=1; AFNElJ/XNqSk6LYhv1DLfDOuoG+v+l9tl3XgO+PPhQwqChdUPOekBKtKCTg33VxwneEekTFeCzP/UUFUVQ1JgWltkIxm2dII@vger.kernel.org
X-Gm-Message-State: AOJu0YyV/00uItUg43+P+5zzgc1bVehxEbfahUlE/RLrakeMZsaHalDm
	v02eHvb1dGWSEc987rOnzIzHMDyqGaLEIu26u3LwFIL1LyL1xCyagzDizONf0k8X
X-Gm-Gg: AeBDietLulBwivp7MK7WOyMzaFdtJqAYM3W+2VROOdCtHhpSJeoJvcmISKW9ccBYo8g
	/JoAgjw7jXX75ace+BSnrgWVqnK/iMaFrZhqTHyCkK6vHpbq/GumWnbKKY2+TPGMl2lv3THhN71
	WtsxNaCK3mtFRrgwfc8h8vM4XW/EAn4CAljk0ORgKxUpU1NtRd3jCi1XYqsti3GRLujmny8RMs6
	kJ9a7j5vXKV47zluILTFgWPstqSQyG35riQxchE6XPrx1UXeyamwJJQ4FNkhYkrKZtgeFw4cCC4
	rr/KBROZit4bPeFoZM/NffHaW/fClCtFjALZNha5+spAtKuo1ew7Yu4f5dqiEZvwvHHnuhnzVJ9
	vmvt3RlymBKhVKzeONZ5nZ0cvWTcjpxchU84sn1UeFWkEleArO/DyKqIs1xTHXNWAyFUL0K8tqp
	aDgUj1JSradMEg5v4ITjvVfhyjl00Wpc3DeImqrQSRhnR11PnK
X-Received: by 2002:a53:d9c8:0:b0:651:bb90:714d with SMTP id 956f58d0204a3-65beee8b403mr3536992d50.32.1777418431161;
        Tue, 28 Apr 2026 16:20:31 -0700 (PDT)
Received: from localhost ([2804:14c:5bc6:8c1b:a2c7:e12b:2f63:a597])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65bff6c4113sm371156d50.11.2026.04.28.16.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 16:20:30 -0700 (PDT)
Date: Tue, 28 Apr 2026 20:20:28 -0300
From: =?iso-8859-1?Q?Jos=E9?= Guilherme de Castro Rodrigues <jose.guilherme.cr.bh@gmail.com>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	Hans de Goede <hansg@kernel.org>,
	platform-driver-x86@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] platform/x86: asus-wmi: fix camera key led on Zenbook
 S14
Message-ID: <afFAvIbAS6ue3ZaF@djouze-zen>
References: <adg6GzkykThAB_4u@djouze-zen>
 <ce2a2f37-ad8a-647c-0db8-83f6efd99f12@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ce2a2f37-ad8a-647c-0db8-83f6efd99f12@linux.intel.com>

Thanks for the comment, Ilpo.

On Tue, Apr 28, 2026 at 11:22:20AM +0300, Ilpo Järvinen wrote:
> While I believe you are "correct" that userspace won't see a thing, is 
> this really correct way to implement support for this device?

At first, I created another sysfs attribute that basically duplicated
the logic that is used for the "asus::camera" attribute, with the
exception being the value that was written to it, of course. I noticed,
however, that calling asus_wmi_set_devstate() had not effect on the LED
state. The LED only toggled when I read the attribute, which then called
asus_wmi_get_devstate().

I don't know if this is a quirk for this device, or if all devices that
expose ASUS_WMI_DEVID_CAMERA_LED_NEG behave the same, but the LED is not
toggled until I call asus_wmi_get_devstate() - be it when detecting a
key press (hardware change) or after the sysfs attribute is written to
(software change).

Since in this case the LED state would not change after a write to the
sysfs attribute, I went in the "do not make it visible to userspace at
all" direction.

> I mean the camera led init in asus_wmi_led_init() is gated by 
> asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_CAMERA_LED) but should that 
> be gated by either CAMERA_LED or CAMERA_LED_NEG and the related code in 
> *_camera_led_*() that now only uses ASUS_WMI_DEVID_CAMERA_LED 
> should use which ever of them is available?

Yes, I think what you said makes sense as it would give userspace access
to the resource without creating a new attribute.

In this case, I feel like a good option would be to gate the camera led
initialization by both IDs, and assume that the write and read works as
they probably should for CAMERA_LED_NEG. Then, somehow add a quirk for
this specific device that performs a read when the key is pressed, and 
right after the sysfs attribute is written to. If we can confirm that
this behavior is expected when writing to CAMERA_LED_NEG, it might not
need to be a quirk. Unfortunately, I am not able to try this on other
devices.

What do you think about it?

Best regards,
José Rodrigues
