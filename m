Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792544950;
	b=lfcXf6Ui7pWHoMPrkJtuPkOT2FPVt2NyD7E2YMG3/a0cA7ZlrVfoTkJp4aORTB2BaHnc
	 BwBDHpKA5ZJe1/N2X2BrNnXAH5+IHuhkYAVHWNtmm+iGv7XoYn9710VD4dnR92Bk2A/rP
	 bpW0FkfEg/T2GkvjiXglDrVDxXqg7NtzxlGI7BzeP8z+ZHekwpbHkSGE7ksdpCToeVZuc
	 jGVRsuC7L/InC+qMqBsGkY0E//vY03FrcyOrW5Bct8UqpyMG6CoRzxSBZ6xyyZozxI9fP
	 bURo6GpsC8nq/IHf86rsqB3m21gERHCs/DSH7uDeeKwAD6hc8rQIsBQpZFO5yHLgsnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792544950;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=7iEPiz9yOIV+y72qaA8W2UPQbrqSP5r2/Sa3LQF4egM=;
	b=jh5mevXCS5XBNWlUZj6iTAEDRp0bGae9GFPkmgvcuZSH698ms1gPF8RbM+nb16P4xlgU
	 TeFbzd8IgAZ4C8VRZO1RlUMCHOKrgu9euIX8Py8MyBtzIbReL39gIYhNOqOLUOmNJRCBF
	 Fk0zbWhv3LTMYZQJpbxPEeHjUv7nFBsjiQDVMT1Re+7jfPbZdrU2IsMCvzzm8XyT272+q
	 08i1ReD/jd8SnEKnY6H5gMMRPsZE/DB5XfwnmjkqVKIAgNr+shtC4e6T3aN11QTOASCv1
	 AJNbU0W99rJaV/tw932SG4K5U7xWtsCTfFjUmzVUFwqhoYgJE5aMFIStXFhpZXeGNnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Hv09cj6J;
	arc=none smtp.remote-ip=209.85.221.173
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741D0606A31B
	for <platform-driver-x86@vger.kernel.org>; Wed, 21 Oct 2026 01:09:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 741D0606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Hv09cj6J
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5eaa1b5b84aso228459e0c.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 18:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792544949; x=1793149749; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7iEPiz9yOIV+y72qaA8W2UPQbrqSP5r2/Sa3LQF4egM=;
        b=Hv09cj6J8eoXcUtgZ4L9LJvQ5fMzvH+PM1JKFCE11ERCdj48sOiWUOJJDvxRbG2qZQ
         +V9Ld7wl18TlaSg4o80tjB9O5ww+gY6IbcY4EecGhLRcVwv9gkNHfLUEOPmRdlZ7KkBN
         pu6FOFLBgNFtbNbY29k1lqlORPlQe1GTOrEg6WIou1pos0nLyR5DSLb+yQbXAQxyCXWX
         Ol6jiasluvnjnBfQRLM9I/rOYpb8BoKDEIiU9c6cTYPk8gcZ9fSQYxUzoxyXCpVRUI6k
         CwBGaRU0PGmQaRyw4HWYAJDSnn0TKf9O+xBDHJgIllueVX7SKQUqOZfc3HutbNGEVCj7
         06lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792544949; x=1793149749;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7iEPiz9yOIV+y72qaA8W2UPQbrqSP5r2/Sa3LQF4egM=;
        b=MQvOpTirMJfKAP+xcsnnUGLU2yoi9eRvYdM15tfHjQtuPXJed5K33Vo4h3YMDuy1dy
         7Z+XSIVHEyHkl6rbgkboQqY2dD1p1ZukkZZlGjK9YKlusPabG1VTOzTOFj7c10ja8iGX
         y5G7QuU8zVQQtwxYTwWTfDSDrDjSYbgibgN9TbtNhSk2JKFkSifLdek3vnYO3oCYjrbT
         WJRe0E73zZ8zqjwI5NBnV/B74SiyfJII8iwPv9FIZYGlLQ2fanN7dWAplZ560mu1VFIE
         z/LaSIsxS86FP3EleCJtE/5Niqyf0KZ+J230ngkvB8aHdvudHObadJU7IsMGzRQpCvsn
         Gxpg==
X-Forwarded-Encrypted: i=1; AKwUvByEAQVNMJAovu4Zzl/Fb8Bzu3afhUXs+9t5gUABxskDnBlr1RHdDeBPFhh9Me9iHu/ux0fA5ajbV8EBho66pQk2AzoQ@vger.kernel.org
X-Gm-Message-State: AFq9FYLKNMV9HeQZVZhxkVgH6459aGGeaovK3lQW2RfvHr/9aoAJc7Rm
	qB4nF1O4iyShfpVm5um1yqfq1hqR09MhI/YE5UImuoG+ThrRY2bJpVu0
X-Gm-Gg: AYBFou1Pu/y8mZiRU27lAPSqIYS4vPQ7fpNTtIsG5aIyj2yPQiBdomcZJDoJe4qlvQy
	R0+enhLxjLTI2O+T4Dkr6dT664/jZu8BsISP0lZrOuINpNONpT2zx4bOl4B+13myUunVfqmlRXr
	fRgZEc2DXZv9yX9BFZxXjiZxNyb+OWEwqrHQ66f+oB62Meuuy/pymwFp+CzkeV0li5VC75uwLIH
	5zLDxGKF/mSZpShX6Vg2e8dXgVAreqN5H7s4pV0V3rumJzuuGCRaO66E07b5R8c4JiVDZDirmQj
	Q9QVs95uSv2V32KnLlbAGWc+zS0He1BLn/zjpXoqw1IDy52XzT87fs4Mu5dMffrobmpd7aodhFu
	Zt7mxA2eCzQKn+9QswB4em0Ae87n+JT2wr11CPN3D+rvZijQ87udXAnbvgC7f/CJdenxZLcGAzl
	0SMsc+gZcZoW46TZraY2yJsNE4CHqqixjUOPdGS96a8vYeYDF8B0OSCDlFnLAGZK9+qFF9F5+9d
	9Eaor0M36kW
X-Received: by 2002:a05:6122:e203:b0:5ea:c77f:2f2f with SMTP id 71dfb90a1353d-5eaebd72abemr166243e0c.4.1792544949299;
        Tue, 20 Oct 2026 18:09:09 -0700 (PDT)
Received: from localhost ([2804:14c:5bc6:abb9:bc2d:a62c:e289:6aca])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eae97df494sm1413817e0c.10.2026.10.20.18.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 18:09:08 -0700 (PDT)
Date: Tue, 20 Oct 2026 22:09:05 -0300
From: =?iso-8859-1?Q?Jos=E9?= Guilherme de Castro Rodrigues <jose.guilherme.cr.bh@gmail.com>
To: git@turtledev.nz
Cc: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] platform/x86: asus-wmi: fix camera key LED on Zenbook
 S14
Message-ID: <atgQsQrbCvCGKKld@djouze-zen>
References: <20261019-asus-wmi-camera-led-v4-1-7744c125bcc9@turtledev.nz>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019-asus-wmi-camera-led-v4-1-7744c125bcc9@turtledev.nz>

Hi, Zane.

Thanks for the updated patch!
I've applied the patch locally and it works just fine on my Zenbook S 14

On Mon, Oct 19, 2026 at 07:35:18PM +1300, Zane Hunt via B4 Relay wrote:
> From: Zane Hunt <git@turtledev.nz>
> 
> When CAMERA_LED is missing but CAMERA_LED_NEG is there, register
> asus::camera as a read-only LED backed by CAMERA_LED_NEG, and read it
> after every camera key event, sending a brightness_hw_changed event.
> Registering the LED reads it as well, which fixes the LED being dark after
> a cold boot with the camera disabled.

With this patch applied, a write to /sys/class/leds/asus::camera/brightness
returns no error, even though the led is "read-only". I'm wondering
whether we should care about this?

> +
> +/* The firmware owns this LED; a write just resyncs it with the camera state. */
> +static int camera_neg_led_set(struct led_classdev *led_cdev,
> +			      enum led_brightness brightness)
> +{
> +	struct asus_wmi *asus = container_of(led_cdev, struct asus_wmi, camera_led);
> +
> +	if (!(led_cdev->flags & LED_UNREGISTERING))
> +		camera_neg_led_sync(asus);
> +	return 0;
> +}
> +

Is this function necessary? We can't perform what the caller has asked
us to perform, since there is no way to set the LED. If this "resync"
functionality affects the behavior, please ignore this comment.

Apart from the comments, I'm fine with the patch as it is. I just
wondered these two things out loud.
