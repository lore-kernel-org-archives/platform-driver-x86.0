Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B465234EF0E
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 May 2026 18:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778609739; cv=none; b=N64qZOO0UcmWXX/qPTfnbv9ikoOUnnrHPo/VNtLbTQ711j7MEreSMHfQNVAsG8F8AIZ6stqtwYVlDao/DWTYlJrWbUQ993OrWA2fOCbNjE5OQOVEsbp7X5VUWkCym+2Er8NmZvNjZjyaUoEZKbaIz209T5kuajqcbal+vzQZSI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778609739; c=relaxed/simple;
	bh=w3zeFHabc0RCE8CZoof/qrEwoxqFjHFjwomgxIGxoCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c5mU79O1alGF/SbJY7T+0qJmLxRCEsOA65VUhgOm8qolDP6VURc6gxiGLASVBe8OAhfctz5wueeacI2xGwMLZpn2U8s3M/9gGmEJ2lrEoWUI7Gt9ruyx8xe0HcOws93HCSlzqFZ2pCS1bAX6qNiHzqtl6xJ7Ucup9jhw8xxbpTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ike2/dMW; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ike2/dMW"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2ef38cf04f0so8955988eec.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 12 May 2026 11:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778609738; x=1779214538; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TqTMATn1TJBwDzhvgfdwIn2iY4blCTuTwL1WgCFtdYE=;
        b=Ike2/dMW2A0IhsvhFJMUDi+WY2/5NhgOLO/4FZ8yvFBmjbTs44mPtNTOnBBn6jVG//
         QdudxgEnmzMoaSRTQ5Irs+zBCkEGZsho8H3z6xXf5Q2MSduMU+B+LqS/HYqhXkei9gZN
         QTw7EVq48T927tL7PgwH8VVHW6MZQzVMFFjYmD2ggISp6JavQcxLrQPUdRxE+NsAU33t
         /XxZEARBr/EFD3en2OYQLxIoVD3MGO2sHDCgSt/e02Oq4R7OqaC2ULRxBcV+9TOgF9QD
         J65DUp/tdpv4q9397cwLKYffh5FH8bybdm1RWACIUmXV0k2iqLo6NILlWc+dtVloI2sa
         qhvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778609738; x=1779214538;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TqTMATn1TJBwDzhvgfdwIn2iY4blCTuTwL1WgCFtdYE=;
        b=JcgU/UZDszWI+R7My44xPVDW6P3jpbV2xC0LjWMHrHMBwuTzqt/guNRSi9wbI87mat
         +CZzkzwQdGIYtT1B/5h/2SUx71wKQ58XbyTYQxy0yTAL/ECwtpeZCrPan3LP8QOQ6c73
         LcARJRNhpetnrORDTufnBVGaxHO7lxMMB4n5yKN30gi6K2zFtd11DBEj/WXKBjMmjyoO
         LxDsv8Ifts1p1qejHfrQfJvwm+TA166Bw3zSYULNHEiCKNqLoP45gkVvJSlbabqKRYcE
         AgcDWlpzSqe1nj4pk/9p7iVtLYFKU2zN09IvTd7eanp68+IVq12i5Wy4r7sXtIqQ/n8S
         86DQ==
X-Forwarded-Encrypted: i=1; AFNElJ8dUCyOVOnZmgy8c+1UqC/Pdk3GDk8qaJ/ccf3hbeySTNW/so3tGdvz4mZfZdjzWCDJYIT+qn/Pe2X+c7JXqV+67Ppo@vger.kernel.org
X-Gm-Message-State: AOJu0YzuxPZkmMUubk3Lb0Y66j8D8OIa3vJnxWYlmpMMUfTKQmom+bLf
	LiUGqQXDOOcfBCpw4RDpSfs5iRtkUh2dBVnJlYccPxbRdxN6vH8F1DRo
X-Gm-Gg: Acq92OEXK/N9Lk1N+U9PqvJ81eYYfeVItsHn645emsGSUc6imxdc0nAyhbTjftaWvKX
	MSXEKT6cnTijDQNUFLkwwMV1dSE1n5+C/tzNbKtqVtdfDnxLbcYEecPQLozQAlAERqkwrJcsi25
	V1TPNfzbv3HtR2XMH+dfNBQ2rKKoGiXYr+IQ4ncwb0oMZFqMS+VVswF/tGODy1VGUh5sHjzXXSY
	tH/dJ3osWRXnStLD7lV8mfbXXaN+y/n9/HdiZ6lC1hhRxdO6QqF/YZncZuAHbfQIcZu6LElesmv
	y07OR6rgev2/bIk2HCuLWO/UPFniyYh8GMVMzstbTtfq/C4QElUyNWYubgNpi1ZUoqtm5UhEIUI
	xaOC1125t2z3YfaA/NrWxfDAnHu9/0cKJ5argHPK8EQAKGM4yolfwVDhu2Fd2JVHoMYaGtVVfQK
	ries9zeKlK1LKI43TOE7dypOAtWg4YtHp2W3nsqLIrgi7ZrHbuqwc9d0jp31wBdqJC
X-Received: by 2002:a05:7301:22a9:b0:2f5:6dfc:cb6d with SMTP id 5a478bee46e88-301187bab75mr130655eec.11.1778609737694;
        Tue, 12 May 2026 11:15:37 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:84ac:d22c:b037:1a93])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f88847502fsm22940594eec.14.2026.05.12.11.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 11:15:37 -0700 (PDT)
Date: Tue, 12 May 2026 11:15:33 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, 
	Andy Shevchenko <andy@kernel.org>, Maximilian Luz <luzmaximilian@gmail.com>, 
	Hans de Goede <hansg@kernel.org>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Matthew Brost <matthew.brost@intel.com>, 
	Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, brgl@kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, platform-driver-x86@vger.kernel.org, 
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 3/7] driver core: platform: provide
 platform_device_add_software_node()
Message-ID: <agNrB3BeIgFlZimz@google.com>
References: <20260512-swnode-remove-on-dev-unreg-v5-0-0035eff63812@oss.qualcomm.com>
 <20260512-swnode-remove-on-dev-unreg-v5-3-0035eff63812@oss.qualcomm.com>
 <DIGUBLZXZXPJ.8CX0K5EL6255@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DIGUBLZXZXPJ.8CX0K5EL6255@kernel.org>

On Tue, May 12, 2026 at 06:31:44PM +0200, Danilo Krummrich wrote:
> On Tue May 12, 2026 at 1:59 PM CEST, Bartosz Golaszewski wrote:
> > +int platform_device_add_software_node(struct platform_device *pdev,
> > +				      const struct software_node *swnode)
> > +{
> > +	return device_add_software_node(&pdev->dev, swnode);
> 
> I think this should be device_create_managed_software_node(), see also [1].

The main issue is that we do not know if the software node is registered
or not when platform device is registered, and are trying to use
heuristic to figure it out and decide if we need to clean it up or not.

You need a new variant of device_add_software_node()
(device_set_software_node ?) that would bump up reference of already
registered software nodes but if node is not registered yet created it
as managed.

Thanks.

-- 
Dmitry
